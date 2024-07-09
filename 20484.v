module p_I_FD (Q,D,C,E);
parameter INIT=1'b0;
output Q;
input  D;
input  C;
input  E;
wire   Dtemp;
// Xilinx FD instance
defparam FD_z.INIT=INIT;
FD FD_z (.Q(Q),.D(Dtemp),.C(C));
// Error injection
and (Dtemp,D,E);
endmodule