module crc_tb;
	// Inputs
	reg [0:0] data_in;
	reg crc_en;
	reg rst;
	reg clk;
	// Outputs
	wire [15:0] crc_out;
	// Instantiate the Unit Under Test (UUT)
	crc uut (
		.data_in(data_in),
		.crc_en(crc_en),
		.crc_out(crc_out),
		.rst(rst),
		.clk(clk)
	);
	initial begin
		// Initialize Inputs
		data_in = 0;
		crc_en = 0;
		rst = 1;
		clk = 0;
		toggle_clk;
		rst = 0;
		toggle_clk;
		zero;
		zero;
		one;
		one;
		zero;
		zero;
		zero;
		one;
		zero;
		one;
		zero;
		zero;
		zero;
		one;
		zero;
		zero;
		zero;
		zero;
		zero;
		zero;
		zero;
		zero;
		zero;
		zero;
		zero;
		zero;
		zero;
		zero;
		zero;
		zero;
		zero;
		zero;
		toggle_clk;
	end
	task one;
	begin
		data_in = 1;
		crc_en = 1;
		#10 clk = ~clk;
      #10 clk = ~clk;
		crc_en = 0;
	end
	endtask
	task zero;
	begin
		data_in = 0;
		crc_en = 1;
		#10 clk = ~clk;
      #10 clk = ~clk;
		crc_en = 0;
	end
	endtask
	task toggle_clk;
	begin
		#10 clk = ~clk;
      #10 clk = ~clk;
      #10 clk = ~clk;
      #10 clk = ~clk;
   end
	endtask
endmodule