module counter_tb();
reg clk = 0;
wire [26:0] data;
reg [26:0] counter_check = 1;
counter C1(
	.clk(clk),
	.data(data)
);
always #1 clk = ~clk;
always @(negedge clk) begin
  if (counter_check != data)
	  $display("-->ERROR!. Esperado: %d. Leido: %d",counter_check, data);
	counter_check <= counter_check + 1;
end
initial begin
	//-- Fichero donde almacenar los resultados
	$dumpfile("counter_tb.vcd");
	$dumpvars(0, counter_tb);
	//-- Comprobación del reset.
	# 0.5 if (data != 0)
					$display("ERROR! Contador NO está a 0!");
				else
					$display("Contador inicializado. OK.");
	# 99 $display("FIN de la simulacion");
	# 100 $finish;
end
endmodule