module or1200_dc_fsm(
	// Clock and reset
	clk, rst,
	// Internal i/f to top level DC
	dc_en, dcqmem_cycstb_i, dcqmem_ci_i, dcqmem_we_i, dcqmem_sel_i,
	tagcomp_miss, biudata_valid, biudata_error, start_addr, saved_addr,
	dcram_we, biu_read, biu_write, first_hit_ack, first_miss_ack, first_miss_err,
	burst, tag_we, dc_addr
);
// I/O
input				clk;
input				rst;
input				dc_en;
input				dcqmem_cycstb_i;
input				dcqmem_ci_i;
input				dcqmem_we_i;
input	[3:0]			dcqmem_sel_i;
input				tagcomp_miss;
input				biudata_valid;
input				biudata_error;
input	[31:0]			start_addr;
output	[31:0]			saved_addr;
output	[3:0]			dcram_we;
output				biu_read;
output				biu_write;
output				first_hit_ack;
output				first_miss_ack;
output				first_miss_err;
output				burst;
output				tag_we;
output	[31:0]			dc_addr;
// Internal wires and regs
reg	[31:0]			saved_addr_r;
reg	[2:0]			state;
reg	[2:0]			cnt;
reg				hitmiss_eval;
reg				store;
reg				load;
reg				cache_inhibit;
wire				first_store_hit_ack;
// Generate of DCRAM write enables
assign dcram_we = {4{load & biudata_valid & !cache_inhibit}} | {4{first_store_hit_ack}} & dcqmem_sel_i;
assign tag_we = biu_read & biudata_valid & !cache_inhibit;
// BIU read and write
assign biu_read = (hitmiss_eval & tagcomp_miss) | (!hitmiss_eval & load);
assign biu_write = store;
assign dc_addr = (biu_read | biu_write) & !hitmiss_eval ? saved_addr : start_addr;
assign saved_addr = saved_addr_r;
// Assert for cache hit first word ready
// Assert for store cache hit first word ready
// Assert for cache miss first word stored/loaded OK
// Assert for cache miss first word stored/loaded with an error
assign first_hit_ack = (state == `OR1200_DCFSM_CLOAD) & !tagcomp_miss & !cache_inhibit & !dcqmem_ci_i | first_store_hit_ack;
assign first_store_hit_ack = (state == `OR1200_DCFSM_CSTORE) & !tagcomp_miss & biudata_valid & !cache_inhibit & !dcqmem_ci_i;
assign first_miss_ack = ((state == `OR1200_DCFSM_CLOAD) | (state == `OR1200_DCFSM_CSTORE)) & biudata_valid;
assign first_miss_err = ((state == `OR1200_DCFSM_CLOAD) | (state == `OR1200_DCFSM_CSTORE)) & biudata_error;
// Assert burst when doing reload of complete cache line
assign burst = (state == `OR1200_DCFSM_CLOAD) & tagcomp_miss & !cache_inhibit
		| (state == `OR1200_DCFSM_LREFILL3)
`ifdef OR1200_DC_STORE_REFILL
		| (state == `OR1200_DCFSM_SREFILL4)
`endif
		;
// Main DC FSM
always @(posedge clk or posedge rst) begin
	if (rst) begin
		state <= #1 `OR1200_DCFSM_IDLE;
		saved_addr_r <= #1 32'b0;
		hitmiss_eval <= #1 1'b0;
		store <= #1 1'b0;
		load <= #1 1'b0;
		cnt <= #1 3'b000;
		cache_inhibit <= #1 1'b0;
	end
	else
	case (state)	// synopsys parallel_case
		`OR1200_DCFSM_IDLE :
			if (dc_en & dcqmem_cycstb_i & dcqmem_we_i) begin	// store
				state <= #1 `OR1200_DCFSM_CSTORE;
				saved_addr_r <= #1 start_addr;
				hitmiss_eval <= #1 1'b1;
				store <= #1 1'b1;
				load <= #1 1'b0;
				cache_inhibit <= #1 1'b0;
			end
			else if (dc_en & dcqmem_cycstb_i) begin		// load
				state <= #1 `OR1200_DCFSM_CLOAD;
				saved_addr_r <= #1 start_addr;
				hitmiss_eval <= #1 1'b1;
				store <= #1 1'b0;
				load <= #1 1'b1;
				cache_inhibit <= #1 1'b0;
			end
			else begin							// idle
				hitmiss_eval <= #1 1'b0;
				store <= #1 1'b0;
				load <= #1 1'b0;
				cache_inhibit <= #1 1'b0;
			end
		`OR1200_DCFSM_CLOAD: begin		// load
			if (dcqmem_cycstb_i & dcqmem_ci_i)
				cache_inhibit <= #1 1'b1;
			if (hitmiss_eval)
				saved_addr_r[31:13] <= #1 start_addr[31:13];
			if ((hitmiss_eval & !dcqmem_cycstb_i) ||					// load aborted (usually caused by DMMU)
			    (biudata_error) ||										// load terminated with an error
			    ((cache_inhibit | dcqmem_ci_i) & biudata_valid)) begin	// load from cache-inhibited area
				state <= #1 `OR1200_DCFSM_IDLE;
				hitmiss_eval <= #1 1'b0;
				load <= #1 1'b0;
				cache_inhibit <= #1 1'b0;
			end
			else if (tagcomp_miss & biudata_valid) begin	// load missed, finish current external load and refill
				state <= #1 `OR1200_DCFSM_LREFILL3;
				saved_addr_r[3:2] <= #1 saved_addr_r[3:2] + 1'd1;
				hitmiss_eval <= #1 1'b0;
				cnt <= #1 `OR1200_DCLS-2;
				cache_inhibit <= #1 1'b0;
			end
			else if (!tagcomp_miss & !dcqmem_ci_i) begin	// load hit, finish immediately
				state <= #1 `OR1200_DCFSM_IDLE;
				hitmiss_eval <= #1 1'b0;
				load <= #1 1'b0;
				cache_inhibit <= #1 1'b0;
			end
			else						// load in-progress
				hitmiss_eval <= #1 1'b0;
		end
		`OR1200_DCFSM_LREFILL3 : begin
			if (biudata_valid && (|cnt)) begin		// refill ack, more loads to come
				cnt <= #1 cnt - 3'd1;
				saved_addr_r[3:2] <= #1 saved_addr_r[3:2] + 1'd1;
			end
			else if (biudata_valid) begin			// last load of line refill
				state <= #1 `OR1200_DCFSM_IDLE;
				load <= #1 1'b0;
			end
		end
		`OR1200_DCFSM_CSTORE: begin		// store
			if (dcqmem_cycstb_i & dcqmem_ci_i)
				cache_inhibit <= #1 1'b1;
			if (hitmiss_eval)
				saved_addr_r[31:13] <= #1 start_addr[31:13];
			if ((hitmiss_eval & !dcqmem_cycstb_i) ||	// store aborted (usually caused by DMMU)
			    (biudata_error) ||						// store terminated with an error
			    ((cache_inhibit | dcqmem_ci_i) & biudata_valid)) begin	// store to cache-inhibited area
				state <= #1 `OR1200_DCFSM_IDLE;
				hitmiss_eval <= #1 1'b0;
				store <= #1 1'b0;
				cache_inhibit <= #1 1'b0;
			end
`ifdef OR1200_DC_STORE_REFILL
			else if (tagcomp_miss & biudata_valid) begin	// store missed, finish write-through and doq load refill
				state <= #1 `OR1200_DCFSM_SREFILL4;
				hitmiss_eval <= #1 1'b0;
				store <= #1 1'b0;
				load <= #1 1'b1;
				cnt <= #1 `OR1200_DCLS-1;
				cache_inhibit <= #1 1'b0;
			end
`endif
			else if (biudata_valid) begin			// store hit, finish write-through
				state <= #1 `OR1200_DCFSM_IDLE;
				hitmiss_eval <= #1 1'b0;
				store <= #1 1'b0;
				cache_inhibit <= #1 1'b0;
			end
			else						// store write-through in-progress
				hitmiss_eval <= #1 1'b0;
			end
`ifdef OR1200_DC_STORE_REFILL
		`OR1200_DCFSM_SREFILL4 : begin
			if (biudata_valid && (|cnt)) begin		// refill ack, more loads to come
				cnt <= #1 cnt - 1'd1;
				saved_addr_r[3:2] <= #1 saved_addr_r[3:2] + 1'd1;
			end
			else if (biudata_valid) begin			// last load of line refill
				state <= #1 `OR1200_DCFSM_IDLE;
				load <= #1 1'b0;
			end
		end
`endif
		default:
			state <= #1 `OR1200_DCFSM_IDLE;
	endcase
end
endmodule