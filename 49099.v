module nios_mem_if_ddr2_emif_0_p0_flop_mem(
	wr_reset_n,
	wr_clk,
	wr_en,
	wr_addr,
	wr_data,
	rd_reset_n,
	rd_clk,
	rd_en,
	rd_addr,
	rd_data
);
parameter WRITE_MEM_DEPTH	= "";
parameter WRITE_ADDR_WIDTH	= "";
parameter WRITE_DATA_WIDTH	= "";
parameter READ_MEM_DEPTH	= "";
parameter READ_ADDR_WIDTH	= "";
parameter READ_DATA_WIDTH	= "";
input	wr_reset_n;
input	wr_clk;
input	wr_en;
input	[WRITE_ADDR_WIDTH-1:0] wr_addr;
input	[WRITE_DATA_WIDTH-1:0] wr_data;
input	rd_reset_n;
input	rd_clk;
input	rd_en;
input	[READ_ADDR_WIDTH-1:0] rd_addr;
output	[READ_DATA_WIDTH-1:0] rd_data;
wire	[WRITE_DATA_WIDTH*WRITE_MEM_DEPTH-1:0] all_data;
wire	[READ_DATA_WIDTH-1:0] mux_data_out;
// declare a memory with WRITE_MEM_DEPTH entries
// each entry contains a data size of WRITE_DATA_WIDTH
reg	[WRITE_DATA_WIDTH-1:0] data_stored [0:WRITE_MEM_DEPTH-1] /* synthesis syn_preserve = 1 */;
reg	[READ_DATA_WIDTH-1:0] rd_data;
generate
genvar entry;
	for (entry=0; entry < WRITE_MEM_DEPTH; entry=entry+1)
	begin: mem_location
		assign all_data[(WRITE_DATA_WIDTH*(entry+1)-1) : (WRITE_DATA_WIDTH*entry)] = data_stored[entry];
		always @(posedge wr_clk or negedge wr_reset_n)
		begin
			if (~wr_reset_n) begin
				data_stored[entry] <= {WRITE_DATA_WIDTH{1'b0}};
			end else begin
				if (wr_en) begin
					if (entry == wr_addr) begin
						data_stored[entry] <= wr_data;
					end
				end
			end
		end
	end
endgenerate
// mux to select the correct output data based on read address
lpm_mux	uread_mux(
	.sel (rd_addr),
	.data (all_data),
	.result (mux_data_out)
	// synopsys translate_off
	,
	.aclr (),
	.clken (),
	.clock ()
	// synopsys translate_on
	);
 defparam uread_mux.lpm_size = READ_MEM_DEPTH;
 defparam uread_mux.lpm_type = "LPM_MUX";
 defparam uread_mux.lpm_width = READ_DATA_WIDTH;
 defparam uread_mux.lpm_widths = READ_ADDR_WIDTH;
always @(posedge rd_clk or negedge rd_reset_n)
begin
	if (~rd_reset_n) begin
		rd_data <= {READ_DATA_WIDTH{1'b0}};
	end else begin
		rd_data <= mux_data_out;
	end
end
endmodule