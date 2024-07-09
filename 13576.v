module tb_lab5dpath;
	// Inputs
	reg reset;
	reg clk;
	reg irdy;
	reg [9:0] din;
	// Outputs
	wire ordy;
	wire [9:0] dout;
	// Instantiate the Unit Under Test (UUT)
	lab5dpath uut (
		.reset(reset),
		.clk(clk),
		.irdy(irdy),
		.ordy(ordy),
		.din(din),
		.dout(dout)
	);
	reg[8*100:1] aline;
	integer fd;
	integer count,status;
	integer i_a, i_b, i_c, i_result;
	initial begin
	 clk = 0;
	 #100   //reset delay
	 forever #25 clk = ~clk;
	end
	initial begin
		// Initialize Inputs
		// Initialize Inputs
		#1
		reset = 1;
		clk = 0;
		irdy = 0;
		din = 0;
		count = 0;
		fd = $fopen("multadd_vectors.txt","r");
		// Wait 100 ns for global reset to finish
		#100;
		reset = 0;
		@(negedge clk);
		while ($fgets(aline,fd)) begin
			status = $sscanf(aline,"%x %x %x %x",i_a, i_b, i_c, i_result);
			count = count + 1;
			din = i_a;
			irdy = 1;
			@(negedge clk);
			irdy = 0;
			din = i_b;
			@(negedge clk);
			din = i_c;
			@(negedge clk);
			@(negedge clk);
			if (ordy != 1) begin
			 $display("FAIL: ORDY is not asserted\n");
			end else begin
			  if (dout == i_result)
			   $display("%d PASS, a: %d, b: %d, c: %d, dout: %d\n",count,i_a,i_b,i_c,dout);
			  else
			   $display("%d FAIL, a: %d, b: %d, c: %d, y (actual): %d, dout (expected): %d\n",count,i_a,i_b,i_c,dout,i_result);
			end
			@(negedge clk);
			//ensure output is still valid
			if (ordy != 1) begin
			 $display("FAIL: ORDY is not asserted\n");
			end else begin
			if (dout == i_result)
			   $display("%d PASS, a: %d, b: %d, c: %d, dout: %d\n",count,i_a,i_b,i_c,dout);
			  else
			   $display("%d FAIL, a: %d, b: %d, c: %d, y (actual): %d, dout (expected): %d\n",count,i_a,i_b,i_c,dout,i_result);
			end
			@(negedge clk);  //wait few clocks
			if (ordy != 1) begin
			 $display("FAIL: ORDY is not asserted\n");
			end else begin
				if (dout == i_result)
			   $display("%d PASS, a: %d, b: %d, c: %d, dout: %d\n",count,i_a,i_b,i_c,dout);
			  else
			   $display("%d FAIL, a: %d, b: %d, c: %d, y (actual): %d, dout (expected): %d\n",count,i_a,i_b,i_c,dout,i_result);
			end
	    end
		end
endmodule