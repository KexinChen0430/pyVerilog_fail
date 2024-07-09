module or1200_sb_fifo(
	clk_i, rst_i, dat_i, wr_i, rd_i, dat_o, full_o, empty_o
);
parameter dw = 68;
parameter fw = `OR1200_SB_LOG;
parameter fl = `OR1200_SB_ENTRIES;
// FIFO signals
input			clk_i;	// Clock
input			rst_i;	// Reset
input	[dw-1:0]	dat_i;	// Input data bus
input			wr_i;	// Write request
input			rd_i;	// Read request
output [dw-1:0]	dat_o;	// Output data bus
output			full_o;	// FIFO full
output			empty_o;// FIFO empty
// Internal regs
reg	[dw-1:0]	mem [fl-1:0];
reg	[dw-1:0]	dat_o;
reg	[fw+1:0]	cntr;
reg	[fw-1:0]	wr_pntr;
reg	[fw-1:0]	rd_pntr;
reg			empty_o;
reg			full_o;
always @(posedge clk_i or posedge rst_i)
	if (rst_i) begin
		full_o <= #1 1'b0;
		empty_o <= #1 1'b1;
		wr_pntr <= #1 {fw{1'b0}};
		rd_pntr <= #1 {fw{1'b0}};
		cntr <= #1 {fw+2{1'b0}};
		dat_o <= #1 {dw{1'b0}};
	end
	else if (wr_i && rd_i) begin		// FIFO Read and Write
		mem[wr_pntr] <= #1 dat_i;
		if (wr_pntr >= fl-1)
			wr_pntr <= #1 {fw{1'b0}};
		else
			wr_pntr <= #1 wr_pntr + 1'b1;
		if (empty_o) begin
			dat_o <= #1 dat_i;
		end
		else begin
			dat_o <= #1 mem[rd_pntr];
		end
		if (rd_pntr >= fl-1)
			rd_pntr <= #1 {fw{1'b0}};
		else
			rd_pntr <= #1 rd_pntr + 1'b1;
	end
	else if (wr_i && !full_o) begin		// FIFO Write
		mem[wr_pntr] <= #1 dat_i;
		cntr <= #1 cntr + 1'b1;
		empty_o <= #1 1'b0;
		if (cntr >= (fl-1)) begin
			full_o <= #1 1'b1;
			cntr <= #1 fl;
		end
		if (wr_pntr >= fl-1)
			wr_pntr <= #1 {fw{1'b0}};
		else
			wr_pntr <= #1 wr_pntr + 1'b1;
	end
	else if (rd_i && !empty_o) begin	// FIFO Read
		dat_o <= #1 mem[rd_pntr];
		cntr <= #1 cntr - 1'b1;
		full_o <= #1 1'b0;
		if (cntr <= 1) begin
			empty_o <= #1 1'b1;
			cntr <= #1 {fw+2{1'b0}};
		end
		if (rd_pntr >= fl-1)
			rd_pntr <= #1 {fw{1'b0}};
		else
			rd_pntr <= #1 rd_pntr + 1'b1;
	end
endmodule