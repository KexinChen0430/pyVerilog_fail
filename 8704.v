module setbit_tb;
wire LED1;
setbit SB1 (
  .LED1 (LED1)
);
initial begin
	//-- Definir el fichero donde volvar los datos
	$dumpfile("T01-setbit_tb.vcd");
	//-- Volcar todos los datos a ese fichero
	$dumpvars(0, setbit_tb);
	//-- Pasadas 10 unidades de tiempo comprobamos
  # 10 if (LED1 != 1)
         $display("---->¡ERROR! Salida no esta a 1");
			 else
			   $display("Componente ok!");
	# 10 $finish;
end
endmodule