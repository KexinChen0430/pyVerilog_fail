module testbench;
  reg clk;
  reg ce;
  reg rstn;
  reg loaden;
  reg unloaden;
  wire empty;
  wire full;
  integer i;
  wire [62:0] count;
  reg [63:0] datain;
  wire [63:0] dataout;
  wire [5:0] itemsinfifo;
	ptrfifo fifo(
		.clk(clk),
		.rstn(rstn),
		.loaden(loaden),
		.unloaden(unloaden),
		.datain(datain),
		.dataout(dataout),
		.itemsinfifo(itemsinfifo)
	);
	defparam fifo.DEPTH = 6;
	defparam fifo.WIDTH = 64;
  initial begin
    $dumpvars(0, testbench);
	ce = 0;
    clk = 0;
	rstn = 0;
	loaden = 0;
	unloaden = 0;
	datain = 0;
	#10
	ce = 1;
	rstn = 1;
	#10
	// Clear fifo memory, check full
	loaden = 1;
	#640
	loaden = 0;
	# 10
	unloaden = 1;
	#640
	unloaden = 0;
	#10
	// Load some values in the fifo
	datain = 64'h55AA00FFDEADBEEF;
	loaden = 1;
	# 10
	loaden = 0;
	datain = 64'hDEADBEEF55AA00FF;
	# 10
	loaden = 1;
	# 10
	loaden = 0;
	# 10
	// Unload the values from the fifo
	unloaden = 1;
	# 10
	unloaden = 0;
	# 10
	unloaden = 1;
	# 10
	unloaden = 0;
	# 10
    #100000 $finish;
  end
  always #5 clk = ~clk;
endmodule