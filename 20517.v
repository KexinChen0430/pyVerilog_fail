module p_O_FDR (Q,D,C,R,E);
parameter INIT=1'b0;
output Q;
input  D;
input  C;
input  E;
input R;
wire   Qtemp;
defparam FD_z.INIT=INIT;
// Xilinx FD instance
FDR FD_z (.Q(Qtemp),.D(D),.C(C),.R(R));
// Error injection
and (Q,Qtemp,E);
endmodule