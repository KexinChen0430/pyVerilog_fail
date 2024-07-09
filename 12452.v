module decoder(
    decoderout,waddr
);
	output[31:0]decoderout;
	input[4:0] waddr;
	reg [31:0]decoderout;
	always@(wadder)
		case(wadder)
            5’d0:	decoderout<=32’b0000_00000_0000_0000_0000_0000_0000_0001;
            5’d1:	decoderout<=32’b0000_00000_0000_0000_0000_0000_0000_0010;
            // 省略
            5’d31:	decoderout<=32’b1000_00000_0000_0000_0000_0000_0000_0000;
            default:  decoderout<= 32’bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx;
		endcase
endmodule