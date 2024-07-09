module dpr(
  clka,
  ena,
  wea,
  addra,
  dina,
  douta,
  clkb,
  enb,
  web,
  addrb,
  dinb,
  doutb
);
input clka;
input ena;
input [0 : 0] wea;
input [2 : 0] addra;
input [7 : 0] dina;
output [7 : 0] douta;
input clkb;
input enb;
input [0 : 0] web;
input [2 : 0] addrb;
input [7 : 0] dinb;
output [7 : 0] doutb;*/
// read counter
always @ (posedge clk or posedge reset) begin
	if(reset) read = 3'b000;
	else begin
		if (rden & ~empty) read = read + 1;
		if (sclr) read = 3'b000;
	end
end
// write counter
always @ (posedge clk or posedge reset) begin
	if(reset) write = 3'b000;
	else begin
		if (wren & ~full) write = write + 1;
		if (sclr) write = 3'b000;
	end
end
// full comparator
always @* begin
	if ((write + 1'b1) == read) full = 1;
	else full = 0;
end
// empty comparator
always @* begin
	if (write == read) empty = 1;
	else empty = 0;
end
// write a b enable
always @* begin
	//a write enable
	if(wren & ~full) a_en = 1;
	else a_en = 0;
	//b write enable
	if(rden & ~empty) b_en = 1;
	else b_en = 0;
end
//block memory
dpr u1(
	.clka		(clk),
	.ena		(a_en),
	.wea		(wren),
	.addra	(write),
	.dina		(din),
	.douta	(douta),
	.clkb		(clk),
	.enb		(b_en),
	.web		(wren),
	.addrb	(read),
	.dinb		(douta),
	.doutb	(dout)
  );
endmodule