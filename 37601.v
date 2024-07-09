module Timer_tb();
	reg			clk,
					rstn;
	reg[1:0]		set;
	wire			ready;
	Timer DUT (
			.clk(clk),
			.rstn(rstn),
			.set(set),
			.ready(ready)
	);
always
	#20 clk = ~clk;
always@(ready or rstn or set) begin
	$display("\tTEMPO: %0t // reset: %b // ready: %b // set: %b\n", $time, rstn, ready, set);
end
initial begin
		$display("==================================//\\\\==================================");
		$display("|                 Testbench Modulo Timer: Clock = 40ns                 |");
		$display("==================================\\\\//==================================");
		clk = 0;
		rstn = 0;
		set = 2'b0;
		/* Reset */
		#40 rstn = 1;
		#40 rstn = 0;
		/* Teste */
		#40 $display("==================================//\\\\==================================");
		$display("|                Teste 1: Contagem de 1s (set = 2'b01)                 |");
		$display("==================================\\\\//==================================");
		set = 2'b01;
		#400060 	set = 2'b00;
		#40 $display("==================================//\\\\==================================");
		$display("|                Teste 2: Contagem de 2s (set = 2'b10)                 |");
		$display("==================================\\\\//==================================");
		set = 2'b10;
		#800080 	set = 2'b00;
		#40 $display("==================================//\\\\==================================");
		$display("|               Teste 3: Contagem de 10s (set = 2'b11)                 |");
		$display("==================================\\\\//==================================");
		set = 2'b11;
		#4000080	set = 2'b00;
		#400
		$display("==================================//\\\\==================================");
		$display("|                           Fim do Testbench                           |");
		$display("==================================\\\\//==================================");
		$stop;
end
endmodule