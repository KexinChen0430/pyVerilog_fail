module set_t;
	reg [0:15] data_in;
	reg [0:4] tag;
	reg enable;
	reg write;
	reg [0:1] word;
	reg cmp;
	reg valid_in;
	reg rst;
	wire [0:15] data_out;
	wire [0:4] tag_out;
	wire hit;
	wire dirty;
	wire valid;
	wire ack;
	initial begin
		$dumpfile("set.vcd");
		$dumpvars(0, set_t);
		enable = 0;
		rst = 0;
		word = 2'b11;
		valid_in = 1'b1;
		data_in = 16'b0000_1111_0000_1111;
		tag = 5'b11101;
		#5
		write = 1;
		cmp = 0;
		enable = 1;
		#5
		enable = 0;
		#5
		enable = 1;
		write = 0;
		cmp = 1;
		#5
		enable = 0;
		write = 0;
		cmp = 0;
		#5
		enable = 1;
		rst = 1;
		#5
		enable = 0;
		#5
		enable = 1;
		write = 0;
		cmp = 1;
		#10
		$stop;
	end
	set st(enable, word, cmp, write, rst, tag, data_in,
		valid_in, hit, dirty, tag_out, data_out, valid, ack);
endmodule