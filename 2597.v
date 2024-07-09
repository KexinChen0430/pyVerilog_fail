module LUT4_3(input A, B, C, D, output Z, Z3);
	parameter INIT = "0x0000";
`include "parse_init.vh"
	localparam initp = parse_init(INIT);
	wire [7:0] s3 = D ?     initp[15:8] :     initp[7:0];
	wire [3:0] s2 = C ?        s3[ 7:4] :        s3[3:0];
	wire [1:0] s1 = B ?        s2[ 3:2] :        s2[1:0];
	assign Z =      A ?           s1[1] :          s1[0];
	wire [3:0] s2_3 = C ?   initp[ 7:4] :     initp[3:0];
	wire [1:0] s1_3 = B ?    s2_3[ 3:2] :      s2_3[1:0];
	assign Z3 =       A ?       s1_3[1] :        s1_3[0];
endmodule