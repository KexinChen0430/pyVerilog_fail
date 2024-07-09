module or1200_ic_fsm(
	// Clock and reset
	clk, rst,
	// Internal i/f to top level IC
	ic_en, icqmem_cycstb_i, icqmem_ci_i,
	tagcomp_miss, biudata_valid, biudata_error, start_addr, saved_addr,
	icram_we, biu_read, first_hit_ack, first_miss_ack, first_miss_err,
	burst, tag_we
);
// I/O
input				clk;
input				rst;
input				ic_en;
input				icqmem_cycstb_i;
input				icqmem_ci_i;
input				tagcomp_miss;
input				biudata_valid;
input				biudata_error;
input	[31:0]			start_addr;
output	[31:0]			saved_addr;
output	[3:0]			icram_we;
output				biu_read;
output				first_hit_ack;
output				first_miss_ack;
output				first_miss_err;
output				burst;
output				tag_we;
// Internal wires and regs
reg	[31:0]			saved_addr_r;
reg	[1:0]			state;
reg	[2:0]			cnt;
reg				hitmiss_eval;
reg				load;
reg				cache_inhibit;
// Generate of ICRAM write enables
assign icram_we = {4{biu_read & biudata_valid & !cache_inhibit}};
assign tag_we = biu_read & biudata_valid & !cache_inhibit;
// BIU read and write
assign biu_read = (hitmiss_eval & tagcomp_miss) | (!hitmiss_eval & load);
//assign saved_addr = hitmiss_eval ? start_addr : saved_addr_r;
assign saved_addr = saved_addr_r;
// Assert for cache hit first word ready
// Assert for cache miss first word stored/loaded OK
// Assert for cache miss first word stored/loaded with an error
assign first_hit_ack = (state == `OR1200_ICFSM_CFETCH) & hitmiss_eval & !tagcomp_miss & !cache_inhibit & !icqmem_ci_i;
assign first_miss_ack = (state == `OR1200_ICFSM_CFETCH) & biudata_valid;
assign first_miss_err = (state == `OR1200_ICFSM_CFETCH) & biudata_error;
// Assert burst when doing reload of complete cache line
assign burst = (state == `OR1200_ICFSM_CFETCH) & tagcomp_miss & !cache_inhibit
		| (state == `OR1200_ICFSM_LREFILL3);
// Main IC FSM
always @(posedge clk or posedge rst) begin
	if (rst) begin
		state <= #1 `OR1200_ICFSM_IDLE;
		saved_addr_r <= #1 32'b0;
		hitmiss_eval <= #1 1'b0;
		load <= #1 1'b0;
		cnt <= #1 3'b000;
		cache_inhibit <= #1 1'b0;
	end
	else
	case (state)	// synopsys parallel_case
		`OR1200_ICFSM_IDLE :
			if (ic_en & icqmem_cycstb_i) begin		// fetch
				state <= #1 `OR1200_ICFSM_CFETCH;
				saved_addr_r <= #1 start_addr;
				hitmiss_eval <= #1 1'b1;
				load <= #1 1'b1;
				cache_inhibit <= #1 1'b0;
			end
			else begin							// idle
				hitmiss_eval <= #1 1'b0;
				load <= #1 1'b0;
				cache_inhibit <= #1 1'b0;
			end
		`OR1200_ICFSM_CFETCH: begin	// fetch
			if (icqmem_cycstb_i & icqmem_ci_i)
				cache_inhibit <= #1 1'b1;
			if (hitmiss_eval)
				saved_addr_r[31:13] <= #1 start_addr[31:13];
			if ((!ic_en) ||
			    (hitmiss_eval & !icqmem_cycstb_i) ||	// fetch aborted (usually caused by IMMU)
			    (biudata_error) ||						// fetch terminated with an error
			    (cache_inhibit & biudata_valid)) begin	// fetch from cache-inhibited page
				state <= #1 `OR1200_ICFSM_IDLE;
				hitmiss_eval <= #1 1'b0;
				load <= #1 1'b0;
				cache_inhibit <= #1 1'b0;
			end
			else if (tagcomp_miss & biudata_valid) begin	// fetch missed, finish current external fetch and refill
				state <= #1 `OR1200_ICFSM_LREFILL3;
				saved_addr_r[3:2] <= #1 saved_addr_r[3:2] + 1'd1;
				hitmiss_eval <= #1 1'b0;
				cnt <= #1 `OR1200_ICLS-2;
				cache_inhibit <= #1 1'b0;
			end
			else if (!tagcomp_miss & !icqmem_ci_i) begin	// fetch hit, finish immediately
				saved_addr_r <= #1 start_addr;
				cache_inhibit <= #1 1'b0;
			end
			else if (!icqmem_cycstb_i) begin	// fetch aborted (usually caused by exception)
				state <= #1 `OR1200_ICFSM_IDLE;
				hitmiss_eval <= #1 1'b0;
				load <= #1 1'b0;
				cache_inhibit <= #1 1'b0;
			end
			else						// fetch in-progress
				hitmiss_eval <= #1 1'b0;
		end
		`OR1200_ICFSM_LREFILL3 : begin
			if (biudata_valid && (|cnt)) begin		// refill ack, more fetchs to come
				cnt <= #1 cnt - 3'd1;
				saved_addr_r[3:2] <= #1 saved_addr_r[3:2] + 1'd1;
			end
			else if (biudata_valid) begin			// last fetch of line refill
				state <= #1 `OR1200_ICFSM_IDLE;
				saved_addr_r <= #1 start_addr;
				hitmiss_eval <= #1 1'b0;
				load <= #1 1'b0;
			end
		end
		default:
			state <= #1 `OR1200_ICFSM_IDLE;
	endcase
end
endmodule