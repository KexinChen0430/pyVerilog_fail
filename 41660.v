module ptrfifo #(
	// Default parameters. These can be overrriden
	parameter WIDTH = 64,
	parameter DEPTH = 6
	) (
	input wire clk,
	input wire rstn,
	input wire loaden,
	input wire unloaden,
	input wire [WIDTH-1: 0] datain,
	output wire empty,
	output wire full,
	output wire [WIDTH-1: 0] dataout,
	output wire [DEPTH-1: 0] itemsinfifo
	);
	wire [DEPTH-1: 0] inptr;
	wire [DEPTH-1: 0] outptr;
	wire [WIDTH-1: 0] a_dataout;
	wire [WIDTH-1: 0] b_datain = 0;
	wire [DEPTH-1: 0] itemsinfifo_int;
	wire qual_loaden;
	wire qual_unloaden;
	reg empty_int;
	reg full_int;
	// Instantiate input pointer counter
	counter ipctr(
	.clk(clk),
	.up(qual_loaden),
	.down(1'b0),
	.rstn(rstn),
	.count(inptr)
	);
	// Instantiate output pointer counter
	counter opctr(
	.clk(clk),
	.up(qual_unloaden),
	.down(1'b0),
	.rstn(rstn),
	.count(outptr)
	);
	// Instantiate the accounting counter
	counter accounting(
	.clk(clk),
	.up(qual_loaden),
	.down(qual_unloaden),
	.rstn(rstn),
	.count(itemsinfifo_int)
	);
	// Instantiate dual port ram
	dualportram dpram(
	.clk_a(clk),
	.we_a(qual_loaden),
	.addr_a(inptr),
	.din_a(datain),
	.dout_a(a_dataout), // Park the output bits, we don't need 'em
	.clk_b(clk),
	.we_b(1'b0), // Never going to write on this side
	.addr_b(outptr),
	.din_b(b_datain), // These will always be 0
	.dout_b(dataout)
	);
	// Set the parameters for the dual port ram, pointer and accounting counters
	defparam dpram.DEPTH = DEPTH;
	defparam dpram.WIDTH = WIDTH;
	defparam ipctr.WIDTH = DEPTH;
	defparam opctr.WIDTH = DEPTH;
	defparam accounting.WIDTH = DEPTH;
	assign empty = empty_int;
	assign full = full_int;
	assign qual_loaden = loaden & ~full_int;
	assign qual_unloaden = unloaden & ~empty_int;
	assign itemsinfifo = itemsinfifo_int;
	// Derive empty and full flags from the accounting counter
	always @(*) begin
		empty_int <= 0;
		full_int <= 0;
		if(itemsinfifo_int == 0) begin
			empty_int <= 1;
		end
		if(itemsinfifo_int == (2**DEPTH) - 1) begin
			full_int <= 1;
		end
	end
endmodule