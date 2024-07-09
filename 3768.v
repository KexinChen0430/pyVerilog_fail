module
				    en,		  // if zero will reset transpose memory page njumbers
				    start,	  // single-cycle start pulse that goes with the first pixel data. Other 63 should follow
				    xin,	  // [7:0] - input data
					 last_in,	// output high during input of the last of 64 pixels in a 8x8 block
					 pre_first_out,// 1 cycle ahead of the first output in a 64 block
				    dv,		  // data output valid. Will go high on the 94-th cycle after the start
				    d_out);// [8:0]output data
  input			clk;
  input			en,start;
  input  [9:0] xin;
  output			last_in;
  output			pre_first_out;
  output			dv;
  output [12:0] d_out;
  wire			clk, en,start,dv,stage1_done, tm_page,tm_we;
  wire   [9:0] xin;
  wire   [12:0] d_out;
  wire	[6:0] tm_ra;
  wire	[6:0] tm_wa;
  wire  [15:0] tm_out;
  wire   [15:0] tm_di;
  reg			last_in;
  wire			pre_first_out;
 always @ (posedge clk) last_in		  <= (tm_wa[5:0]== 6'h30);
 dct_stage1 i_dct_stage1( .clk(clk),
						  .en(en),
						  .start(start),
						  .xin(xin),	  // [7:0]
						  .we(tm_we),		  // write to transpose memory
						  .wr_cntr(tm_wa), // [6:0]	transpose memory write address
						  .z_out(tm_di[15:0]),
						  .page(tm_page),
						  .done(stage1_done));
 dct_stage2 i_dct_stage2( .clk(clk),
						  .en(en),
						  .start(stage1_done),	  // stage 1 finished, data available in transpose memory
						  .page(tm_page),	  // transpose memory page finished, valid at start
						  .rd_cntr(tm_ra[6:0]), // [6:0]	transpose memory read address
						  .tdin(tm_out[15:0]),	  // [7:0] - data from transpose memory
						  .endv(pre_first_out),
						  .dv(dv),		  // data output valid
                    .dct2_out(d_out[12:0]));// [10:0]output data
   RAMB16_S18_S18 i_transpose_mem (
      .DOA(),      // Port A 16-bit Data Output
      .DOPA(),    // Port A 2-bit Parity Output
      .ADDRA({3'b0,tm_wa[6:0]}),  // Port A 10-bit Address Input
      .CLKA(clk),    // Port A Clock
//      .DIA({6'b0,tm_di[9:0]}),      // Port A 16-bit Data Input
      .DIA(tm_di[15:0]),      // Port A 16-bit Data Input
      .DIPA(2'b0),    // Port A 2-bit parity Input
      .ENA(1'b1),      // Port A RAM Enable Input
      .SSRA(1'b0),    // Port A Synchronous Set/Reset Input
      .WEA(tm_we),      // Port A Write Enable Input
      .DOB(tm_out[15:0]),      // Port B 16-bit Data Output
      .DOPB(),    // Port B 2-bit Parity Output
      .ADDRB({3'b0,tm_ra[6:0]}),  // Port B 10-bit Address Input
      .CLKB(clk),    // Port B Clock
      .DIB(16'b0),      // Port B 16-bit Data Input
      .DIPB(2'b0),    // Port-B 2-bit parity Input
      .ENB(1'b1),      // PortB RAM Enable Input
      .SSRB(1'b0),    // Port B Synchronous Set/Reset Input
      .WEB(1'b0)       // Port B Write Enable Input
   );
endmodule