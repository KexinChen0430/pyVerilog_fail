module  io_mux (
// Function A (typically GPIO)
    a_din,
    a_dout,
    a_dout_en,
// Function B (Timer A, ...)
    b_din,
    b_dout,
    b_dout_en,
// IO Cell
    io_din,
    io_dout,
    io_dout_en,
// Function selection (0=A, 1=B)
    sel
);
// PARAMETERs
//============
parameter          WIDTH = 8;
// Function A (typically GPIO)
//===============================
output [WIDTH-1:0] a_din;
input  [WIDTH-1:0] a_dout;
input  [WIDTH-1:0] a_dout_en;
// Function B (Timer A, ...)
//===============================
output [WIDTH-1:0] b_din;
input  [WIDTH-1:0] b_dout;
input  [WIDTH-1:0] b_dout_en;
// IO Cell
//===============================
input  [WIDTH-1:0] io_din;
output [WIDTH-1:0] io_dout;
output [WIDTH-1:0] io_dout_en;
// Function selection (0=A, 1=B)
//===============================
input  [WIDTH-1:0] sel;
//=============================================================================
// 1)  I/O FUNCTION SELECTION MUX
//=============================================================================
function [WIDTH-1:0] mux (
   input [WIDTH-1:0] A,
   input [WIDTH-1:0] B,
   input [WIDTH-1:0] SEL
);
   integer i;
   begin
      mux = {WIDTH{1'b0}};
      for (i = 0; i < WIDTH; i = i + 1)
	mux[i] = sel[i] ? B[i] : A[i];
   end
endfunction
assign a_din      = mux(       io_din, {WIDTH{1'b0}}, sel);
assign b_din      = mux({WIDTH{1'b0}},        io_din, sel);
assign io_dout    = mux(       a_dout,        b_dout, sel);
assign io_dout_en = mux(    a_dout_en,     b_dout_en, sel);
endmodule