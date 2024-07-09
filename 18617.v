module phase1Tester(clk,  SW, KEY);
	output reg clk;
	output reg [9:0] SW;
	output reg [3:0] KEY;
	reg [2:0] control;
	initial begin
	control = 0;
	SW = 0;
	KEY = 15;
	end
	//controls = SW[6:4];
	//inVal = SW[3:0];
	//sel = SW[9:8];
	//enter = ~KEY[0];
	//run = ~KEY[1];
	parameter [2:0] NOP = 3'b000, ADD= 3'b001, SUB = 3'b010, AND = 3'b011, OR = 3'b100, XOR = 3'b101, SLT = 3'b110, SLL = 3'b111;
	parameter d = 20;
	// Set up the clocking
	always #(d/2) clk= ~clk;
	initial begin
		$display("clk \t SW \t KEY ");
		#d
		clk =0;
	end
	// Set up the inputs to the design
	initial begin
		$monitor("%b \t %b \t %b \t %b", clk,SW, KEY, $time);
		/#(d*3); //SW[9:8] = 0; //KEY[0] =0;
		//#d; //KEY[0]= 1;
		//#d;
		#d; SW[9:8] = 1; SW[3:0] =2;#d; #d; #d; KEY[0] = 0;//set value of B
		#d;#d; KEY[0] = 1;
		#d;
		#d; SW[9:8] = 0; SW[3:0] = 1;#d;#d; KEY[0]= 0; //set value of A
		#d#d; KEY[0] = 1;
		#d;
//		#d; SW[3:0] = 2; KEY[0] = 0;
//		#d; KEY[0] = 1;
//		#d;
		#d; SW[9:8] = 3; KEY[0] = 0;
		#d#d; KEY[0] = 1; // display result
		#d;*/
		#d SW[3:0] = 1;	KEY[0] = 0; #d KEY[0] = 1;
		#d SW[8]   = 1;	KEY[0] = 0; #d KEY[0] = 1;
		#d SW[3:0] = 2;	KEY[0] = 0; #d KEY[0] = 1;
		#d SW[9]   = 1;	KEY[0] = 0; #d KEY[0] = 1;
		// operation tests
		#d; SW[6:4] = NOP; KEY[1] = 0;
		#d; SW[6:4] = ADD;
		#d; SW[6:4] = SUB;
		#d; SW[6:4] = AND;
		#d; SW[6:4] = OR;
		#d; SW[6:4] = XOR;
		#d; SW[6:4] = SLT;
		#d; SW[6:4] = SLL;
		#(d*3);
		$stop;
		$finish;
	end
endmodule