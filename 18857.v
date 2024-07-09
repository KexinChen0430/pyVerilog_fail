module tester(
	output reg  clk,
	output reg [7:0] data
);
initial
begin
clk <= 1;
repeat (100000000)
	begin
	#1 clk = ~clk ;
	end
end
reg [7:0] datas [0:32];
initial
	begin
	datas[0] = 8'h0A;
	datas[1] = 8'h1A;
	datas[2] = 8'h2A;
	datas[3] = 8'h3A;
	datas[4] = 8'h4A;
	datas[5] = 8'h5A;
	datas[6] = 8'h6A;
	datas[7] = 8'h7A;
	datas[8] = 8'h8A;
	datas[9] = 8'h9B;
	datas[10] = 8'h0B;
	datas[11] = 8'h1B;
	datas[12] = 8'h2B;
	datas[13] = 8'h3B;
	datas[14] = 8'h4B;
	datas[15] = 8'h5B;
	datas[16] = 8'h6B;
	datas[17] = 8'h7B;
	datas[18] = 8'h9B;
	datas[19] = 8'h1C;
	datas[20] = 8'h2C;
	datas[21] = 8'h3C;
	datas[22] = 8'h4C;
	datas[23] = 8'h5C;
	datas[24] = 8'h6C;
	datas[25] = 8'h7C;
	datas[26] = 8'h8C;
	datas[27] = 8'h9C;
	datas[28] = 8'h1D;
	datas[29] = 8'h2D;
	datas[30] = 8'h3D;
	datas[31] = 8'h4D;
	end
initial
	begin
	data <= datas[0];
	data <= datas[1];
	data <= datas[2];
	data <= datas[3];
	data <= datas[4];
	data <= datas[5];
	data <= datas[6];
	data <= datas[7];
	data <= datas[8];
	data <= datas[9];
	data <= datas[10];
	data <= datas[11];
	data <= datas[12];
	data <= datas[13];
	data <= datas[14];
	data <= datas[15];
	data <= datas[16];
	data <= datas[17];
	data <= datas[18];
	data <= datas[19];
	data <= datas[20];
	data <= datas[21];
	data <= datas[22];
	data <= datas[23];
	data <= datas[24];
	data <= datas[25];
	data <= datas[26];
	data <= datas[27];
	data <= datas[28];
	data <= datas[29];
	data <= datas[30];
	data <= datas[31];
	end
	endmodule