module cacheblock_tb;
parameter TAG_WIDTH = 8;			// width of the tag
parameter DATA_WIDTH = 16;			// width of the data
parameter ENTRIES_WIDTH = 64;	// # of entries
parameter OPCODE_WIDTH = 2;		// width of opcode
parameter LINE_WIDTH = TAG_WIDTH+DATA_WIDTH+OPCODE_WIDTH; // length of the input vector
// Inputs
reg [LINE_WIDTH-1:0]vector_in;
reg clk;
reg enable;
reg reset;
reg [TAG_WIDTH-1:0]tag_count;
reg [DATA_WIDTH-1:0]data_test;
// Outputs
wire [DATA_WIDTH-1:0]data_out;
wire hit_miss_out;
// Instantiate the Unit Under Test (UUT)
cache #(TAG_WIDTH,DATA_WIDTH,ENTRIES_WIDTH) cacheblock	(
	.data_out(data_out),
	.hit_miss_out(hit_miss_out),
	.vector_in(vector_in),
	.enable(enable),
	.reset(reset),
	.clk(clk)
);
	initial begin
		// Initialize Inputs
//		data_in = 0;
		clk = 0;
		enable = 0;
		reset = 1;
		// Wait 100 ns for global reset to finish
		#2 reset = 0;
		// Fill up cache
		tag_count = {TAG_WIDTH{1'b0}};
		data_test = {DATA_WIDTH{1'b1}};
		// This loop fills up the cache
		repeat(ENTRIES_WIDTH)begin: bench1
			#2 vector_in = {`WRITE,tag_count,data_test};	// write to a new tag entry every time
//			#2 vector_in = {2'b01,tag_count,data_test};	// read such tag entry
			tag_count = tag_count + 8'b1;
			data_test = data_test + 16'b1;
		end 	// end repeat loop
		// This loop reads all the data that has been written in the cache previously
		#2 tag_count = {TAG_WIDTH{1'b0}};
		#2 data_test = {DATA_WIDTH{1'b1}};
		repeat(ENTRIES_WIDTH)begin: bench2
			#2 vector_in = {`READ,tag_count,data_test};	// write to a new tag entry every time
//			#2 vector_in = {`READ,8'b111,data_test};	// read a new tag entry every time
//			#2 vector_in = {`READ,8'b1010,data_test};	// read a new tag entry every time
//			#2 vector_in = {`READ,8'b1111,data_test};	// read a new tag entry every time
//			#2 vector_in = {2'b01,tag_count,data_test};	// read such tag entry
			tag_count = tag_count + 1'b1;
			data_test = data_test + 1'b1;
		end 	// end repeat loop
		#2 vector_in = 26'b10_11111111_0001000100010001;	// write to a different tag entry
		#2 vector_in = 26'b01_11111111_0001000100010001;	// read the above tag entry
		#2 vector_in = 26'b01_00001111_0001000100010001;	// read the above tag entry
		repeat(4)begin: bench3
			#2 vector_in = {`READ,8'b00001010,data_test};	// read same tag entry every time
//			#2 vector_in = {2'b01,tag_count,data_test};	// read such tag entry
		end 	// end repeat loop
		#2 vector_in = 26'b00_00110001_0000000000000001;	// flashes entire cache
		// reads entire cache to confirm that has been flashed
		tag_count = {TAG_WIDTH{1'b0}};
		data_test = {DATA_WIDTH{1'b1}};
		repeat(8)begin: bench4
			#2 vector_in = {`READ,tag_count,data_test};	// read a new tag entry every time
//			#2 vector_in = {2'b01,tag_count,data_test};	// read such tag entry
			tag_count = tag_count + 1'b1;
			data_test = data_test + 1'b1;
		end 	// end repeat loop
	end
	always begin
		#1 clk = ~clk; // Toggle clock every 1 ticks
	end
endmodule