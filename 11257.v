module test_processor();
reg clk,reset;
wire [15:0] IR,ALUreg_wire,A_out_wire,B_out_wire,PC_out_wire,ALU_out_wire;
wire N, Z, P,Mux11,wrf,wpc,wir,lccr,wmem,wa,wb, lalu;
wire [1:0] Mux2,Mux4,Mux5,Mux6,Mux7,aluop,alushop;
wire [2:0] Mux3;
wire [4:0] StateID;
lc_3b_processor processor1(clk,reset,IR,N,Z,P,StateID,Mux1,Mux2,Mux3,Mux4,Mux5,Mux6,Mux7,Mux11,wrf,wpc,wir,lccr,aluop,alushop,
								wmem,ALUreg_wire,A_out_wire,B_out_wire,PC_out_wire,ALU_out_wire,wa,wb, lalu);
initial begin
$dumpfile("test.vcd");
$dumpvars(0);
clk = 0;
reset = 0;
#15
reset = 1;
#500
$finish;
end
always begin
#5
clk = ~clk;
end
endmodule