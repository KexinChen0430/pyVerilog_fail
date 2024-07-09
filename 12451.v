module mux_32(
	output reg [31:0]q;
	input [31:0]q[31:0];
	input [4:0]raddr;
);
	always@(raddr or q[31:0])
		case(raddr)
            5’d0:	q<=q[0];
            5’d1:	q<=q[1];
            // 省略
            5’d31:	q<=q[31];
            default: q<= X;
		endcase
endmodule