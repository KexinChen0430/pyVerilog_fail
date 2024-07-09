module tb_lab4dpath;
	// Inputs
	reg [9:0] x1;
	reg [9:0] x2;
	reg [9:0] x3;
	// Outputs
	wire [9:0] y;
	reg clock;
	reg[8*100:1] aline;
`define FSIZE 1024
`define LATENCY 2
	integer infifo[(`FSIZE-1):0];
	integer head,tail;
   integer fd;
	integer count,status;
   integer i_a, i_b, i_c, i_result;
	integer o_a, o_b, o_c, o_result;
	integer errors;
	integer clock_count;
	// Instantiate the Unit Under Test (UUT)
	lab4dpath uut (
		.x1(x1),
		.x2(x2),
		.x3(x3),
		.clk(clock),
		.y(y)
	);
	initial begin
	 clock = 0;
	 #100   //reset delay
	 forever #25 clock = ~clock;
	end
	initial begin
		// Initialize Inputs
		x1 = 0;
		x2 = 0;
		x3 = 0;
		head = 0;
		tail = 0;
		clock_count = 0;
		fd = $fopen("multadd_vectors.txt","r");
		count = 0;
		// Wait 100 ns for global reset to finish
		#100;
		// Add stimulus here
		// Add stimulus here
		errors = 0;
		while ($fgets(aline,fd)) begin
		 status = $sscanf(aline,"%x %x %x %x",i_a, i_b, i_c, i_result);
		 @(negedge clock);
		 x1 = i_a;
		 x2 = i_b;
		 x3 = i_c;
		 infifo[head]=i_a;inc_head;
		 infifo[head]=i_b;inc_head;
		 infifo[head]=i_c;inc_head;
		 infifo[head]=i_result;inc_head;
		end //end while
	end
	task inc_head;
	 begin
	  head = head + 1;
	  if (head == `FSIZE) head = 0;
	 end
	endtask
	task inc_tail;
	 begin
	  tail = tail + 1;
	  if (tail == `FSIZE) tail = 0;
	 end
	endtask
	always @(negedge clock) begin
	  clock_count = clock_count + 1;
	  if (clock_count > `LATENCY+1) begin
	  	 o_a = infifo[tail];inc_tail;
		 o_b = infifo[tail];inc_tail;
		 o_c = infifo[tail];inc_tail;
		 o_result = infifo[tail];inc_tail;
		 if (o_result == y) begin
		  $display("%d PASS, x1: %x, x2: %x, x3: %x, y: %x\n",count,o_a,o_b,o_c,y);
		 end else begin
        $display("%d FAIL, x1: %x, x2: %x, x3: %x, y (actual): %x, y (expected): %x\n",count,o_a,o_b,o_c,y,o_result);
		   errors = errors + 1;
		 end
		end //end if
	  end
endmodule