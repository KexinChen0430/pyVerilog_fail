module tb();
	/* Outputs */
	wire [15:0] CR;
	wire done;
	/* Interconnects */
	wire AR_gt_0, AR_lt_0;
	wire Ld_AR_BR, Div_AR_x2_CR, Mul_BR_x2_CR, Clr_CR;
	/* Inputs */
	reg clk;
	reg [15:0] Data_BR, Data_AR;
	reg reset_b;
	reg start;
	Datapath_Unit ddev (CR, AR_gt_0, AR_lt_0, Data_AR, Data_BR,
		Ld_AR_BR, Div_AR_x2_CR, Mul_BR_x2_CR, Clr_CR, clk);
	Control_Unit cdev(done, Ld_AR_BR, Div_AR_x2_CR, Mul_BR_x2_CR, Clr_CR,
		reset_b, start, AR_gt_0, AR_lt_0, clk);
	reg [35:0] i;
	initial begin
		$dumpfile("p18.vcd");
		$dumpvars(0,tb);
		clk = 0;
		reset_b = 0;
		#2 reset_b = 1;
		for(i = 0; i < 2**32-1; i = i + 2**31-1) begin
			Data_BR = i[15:0];
			Data_AR = i[31:16];
			start = 1;
			#10 clk = 1;
			#5 start = 0;
			#5 clk = 0;
			while(~done) begin
				#10 clk = 1;
				#10 clk = 0;
			end
		end
		#20 $finish;
	end
endmodule