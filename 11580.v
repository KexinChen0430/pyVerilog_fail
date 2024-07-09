module tb_dac;
	reg [7:0] dac_in;
	reg clk;
	reg conv;
	reg rst;
	reg [7:0] counter;
	wire dac_out;
	dac uut (
		.dac_in(dac_in),
		.clk(clk),
		.rst(rst),
		.conv(conv),
		.dac_out(dac_out)
	);
	defparam uut.RES = 7;
	initial
	begin
		$dumpfile("dump.lxt");
		$dumpvars();
	//	$display ( "time \tclk \trst \tdac_in \tdac_out ");
		#1981284252
		$finish;
	end
	initial begin
		dac_in = 8'h00;
		clk = 0;
		conv = 0;
		rst = 0;
		#20
		rst <= 1;
		#20
		rst <= 0;
		#20
		dac_in = 8'he6;
		conv = 1;
		#100
		$stop;
	end
	always begin
		#`clkperiodby2 clk <= ~clk;
//		#((`clkperiodby2)*2*256) dac_in <= dac_in + 1;
	end
/*	always@(posedge clk)
		counter <= counter + 1;
	always@(posedge clk)
	begin
		if(counter == 8'hff) 		begin
			dac_in <= dac_in + 1;
			counter <= 8'b0; 			end
		else begin
			dac_in <= dac_in;
			counter <= counter + 1;	end
	end
*/
endmodule