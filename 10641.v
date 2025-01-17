module testbench_addrdec();
	reg clk;
	reg [5:0] reqType;
	reg [15:0] ofs;
	reg [15:0] base;
	reg [15:0] count;
	reg [5:0] lbType;
	wire [15:0] addr;
	wire invalid;
	AddrDecoder addrdec(reqType, ofs, base, count, lbType, addr, invalid);
	initial begin
		$dumpfile("addrdec.vcd");
		$dumpvars(0, testbench_addrdec);
		// all invalid
		reqType = `LBTYPE_UNDEFINED;
		ofs = 4;
		base = 16'hffff;
		count = 0;
		lbType = `LBTYPE_UNDEFINED;
		#1;
		$display ("addr: %X", addr);
		$display ("invalid: %X", invalid);
		if(invalid == 1) $display("PASS");
		else begin
			$display("FAILED");
			$finish;
		end
		// valid
		reqType = `LBTYPE_CODE;
		ofs 	= 4;
		base	= 16'hff00;
		count	= 16'h00ff;
		lbType	= `LBTYPE_CODE;
		#1;
		$display ("addr: %X", addr);
		$display ("invalid: %X", invalid);
		if(invalid == 0 && addr == 16'hff04) $display("PASS");
		else begin
			$display("FAILED");
			$finish;
		end
		// type not matched
		reqType = `LBTYPE_VPTR;
		ofs 	= 4;
		base	= 16'hff00;
		count	= 16'h00ff;
		lbType	= `LBTYPE_CODE;
		#1;
		$display ("addr: %X", addr);
		$display ("invalid: %X", invalid);
		if(invalid == 1) $display("PASS");
		else begin
			$display("FAILED");
			$finish;
		end
		// out of limit
		reqType = `LBTYPE_CODE;
		ofs 	= 4;
		base	= 16'hff00;
		count	= 16'h004;
		lbType	= `LBTYPE_CODE;
		#1;
		$display ("addr: %X", addr);
		$display ("invalid: %X", invalid);
		if(invalid == 1) $display("PASS");
		else begin
			$display("FAILED");
			$finish;
		end
		// last element in bound
		reqType = `LBTYPE_CODE;
		ofs 	= 3;
		base	= 16'hff00;
		count	= 16'h004;
		lbType	= `LBTYPE_CODE;
		#1;
		$display ("addr: %X", addr);
		$display ("invalid: %X", invalid);
		if(invalid == 0 && addr == 16'hff03) $display("PASS");
		else begin
			$display("FAILED");
			$finish;
		end
		$display ("Simulation end");
		$finish;
	end
	always begin
		// クロックを生成する。
		// #1; は、1クロック待機する。
		clk <= 0; #1;
		clk <= 1; #1;
	end
	always @ (posedge clk)
	begin
	end
endmodule