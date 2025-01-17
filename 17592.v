module tb_fifo;
	// Inputs
	reg clk;
	reg reset;
	reg sclr;
	reg wren;
	reg rden;
	reg [7:0] din;
	// Outputs
	wire full;
	wire empty;
	wire [7:0] dout;
	// Instantiate the Unit Under Test (UUT)
	fifo uut (
		.clk(clk),
		.reset(reset),
		.sclr(sclr),
		.wren(wren),
		.rden(rden),
		.full(full),
		.empty(empty),
		.din(din),
		.dout(dout)
	);
	initial begin
	 clk = 0;
	 #100   //reset delay
	 forever #30 clk = ~clk;
	end
	integer errors;
	integer writeval;
	integer fd;
	integer count,status;
	reg[8*100:1] aline;
	integer i_sclr, i_wren, i_wdata, i_rden, i_rdata, i_full, i_empty;
	initial begin
		// Initialize Inputs
		#1
		clk = 0;
		reset = 1;
		sclr = 0;
		wren = 0;
		rden = 0;
		din = 0;
		errors = 0;
		count = 0;
		fd = $fopen("fifo_vectors.txt","r");
		// Wait 100 ns for global reset to finish
		#100;
		reset = 0;
		@(posedge clk);
		while ($fgets(aline,fd)) begin
		if (count != 0) begin
		 status = $sscanf(aline,"%x %x %x %x %x %x %x",i_sclr,i_wren, i_wdata, i_rden, i_rdata, i_full, i_empty);
		 sclr = i_sclr;
		 wren = i_wren;
		 din = i_wdata;
		 rden = i_rden;
		 @(negedge clk);
		 if (i_rden) begin
			if (i_rdata == dout) begin
			 $display("%d Pass: dout: %x",count,dout);
			end else begin
			 $display("%d FAIL: dout: %x(%x)",count,dout,i_rdata);
			 errors = errors+1;
			end
		 end //end if (i_rden)
		 if (i_full == full) $display("%d Pass: full: %x",count,full);
		 else begin
		  $display("%d FAIL: full: %x (%x)",count,full,i_full);
		   errors = errors+1;
		 end
		 if (i_empty == empty) $display("%d Pass: empty: %x",count,empty);
		 else begin
		  $display("%d FAIL: empty: %x (%x)",count,empty,i_empty);
		   errors = errors+1;
		 end
		end //end if (aline)
		count = count + 1;
		end //end while
		if (errors == 0) begin
			$display("(%t)PASSED: All vectors passed",$time());
		end else begin
		  $display("(%t)FAILED: %d vectors failed",$time(),errors);
		end
	end
endmodule