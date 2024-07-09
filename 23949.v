module t (/*AUTOARG*/
   // Outputs
   dout,
   // Inputs
   clk, rstn, dval0, dval1
   );
   input clk;
   input rstn;
   output wire [7:0] dout;
   input [7:0] dval0;
   input [7:0] dval1;
   wire [7:0] dbgsel_w = '0;
   tsub tsub (/*AUTOINST*/
	      // Outputs
	      .dout			(dout[7:0]),
	      // Inputs
	      .clk			(clk),
	      .rstn			(rstn),
	      .dval0			(dval0[7:0]),
	      .dval1			(dval1[7:0]),
	      .dbgsel_w			(dbgsel_w[7:0]));
endmodule