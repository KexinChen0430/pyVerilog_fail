module reset
		input wire load, //load signal
		input wire [W-1:0] Data_MX, //Data X and Y are the operands
		input wire [W-1:0] Data_MY,
		output wire [W-1:0] Op_MX, //Both Op signals are the outputs
		output wire [W-1:0] Op_MY
	 );
//Module's Body
//Both registers could be set with the parameter signal
//to be 32 or 64 bitwidth
RegisterMult #(.W(W)) XMRegister ( //Data X input register
    .clk(clk),
    .rst(rst),
    .load(load),
    .D(Data_MX),
    .Q(Op_MX)
    );
RegisterMult #(.W(W)) YMRegister ( //Data Y input register
    .clk(clk),
    .rst(rst),
    .load(load),
    .D(Data_MY),
    .Q(Op_MY)
    );
endmodule