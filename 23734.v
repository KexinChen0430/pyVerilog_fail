module OpDecoder(clk, );
	// we: Write Enable
	input clk, we;
	input [15:0]addr;
	input [31:0]wdata;
	output [31:0]data;
	reg [3:0] state;
	assign data = rom[addr];
	always @ (posedge clk)
		begin
			if(we == 1) begin
				rom[addr] = wdata;
			end
		end
	initial
		begin
			$readmemh("rom.hex", rom);
		end
endmodule