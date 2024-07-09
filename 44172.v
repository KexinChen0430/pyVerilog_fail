module.
	PC pc (.clk(clk), .npc(npc), .PC(pcout));
	initial begin
		// Initialize inputs.
		npc = 0;
		clk = 0;
		// Test values.
		#20;
		npc = npc + 1;
		#20;
		npc = npc + 1;
		#20;
		npc = npc + 1;
		#20;
		npc = npc + 1;
		#20;
		npc = npc + 1;
		// Terminate.
		#40 $finish;
	end
	// Display values.
	always @ (posedge clk)
	begin
		$display("At t = %0d\tnpc = %h\t\tpc = %h", $time, npc, pcout);
	end
	// Clock.
	initial begin
		forever begin
			#10 clk = ~clk;
		end
	end
endmodule