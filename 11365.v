module Debouncer_tb;
reg CLK;
reg IN;
wire OUT;
Debouncer db_tb(
	.CLK(CLK),
	.IN(IN),
	.OUT(OUT)
);
always begin
	#50 CLK = ~CLK;
end
initial begin
		CLK=0;
		IN = 1;
		$display("==================================//\\\\==================================");
		$display("|              Testbench Modulo Debouncer: Clock = 100ns               |");
		$display("==================================\\\\//==================================");
		$display("\tTEMPO: %0t // IN estavel sem pressionamento\n", $time);
		#400 $display("\tTEMPO: %0t // IN pressionado, gerando bouncing por 100ns\n", $time);
		#5 IN = ~IN;
		#15 IN = ~IN;
		#2 IN = ~IN;
		#1 IN = ~IN;
		#8 IN = ~IN;
		#9 IN = ~IN;
		#5 IN = ~IN;
		#5 IN = ~IN;
		#10 IN = ~IN;
		#5 IN = ~IN;
		#4 IN = ~IN;
		#8 IN = ~IN;
		#1 IN = ~IN;
		#7 IN = ~IN;
		#4 IN = ~IN;
		#2 IN = ~IN;
		#4 IN = ~IN;
		#5 $display("\tTEMPO: %0t // IN estabilizou enquanto pressionado\n", $time);
		#500
		$display("==================================//\\\\==================================");
		$display("|                           Fim do Testbench                           |");
		$display("==================================\\\\//==================================");
		$stop;
end
endmodule