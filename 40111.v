module ula_tb;
	reg[7:0] op1, op2, res, code;
	wire[7:0] r;
	wire of;
	integer f;
	ula_k u(
	   .operator1(op1),
		.operator2(op2),
		.operation_alu(code),
		.overflow(of),
		.result_alu(r)
	);
	initial
	begin
	  f = $fopen("ula_tb_output.txt");
	  $fmonitor(f, "Operador1: %d Operador2: %d Resultado: %d Overflow: %b", op1, op2, r, of);
	  code = 8'b00000000;
	  repeat(6) begin
	    case(code)
	      8'b00000000: $fdisplay(f, "Soma");
	      8'b00000001: $fdisplay(f, "Subtração");
	      8'b00000010: $fdisplay(f, "And");
	      8'b00000011: $fdisplay(f, "Or");
	      8'b00000100: $fdisplay(f, "Multiplicação");
	      8'b00000101: $fdisplay(f, "Divisão");
	   endcase
	   /* Sorteia dois números entre 0 e 255
	    */
	   repeat(100) begin
	       op1 = $unsigned($random) % 255;
		     op2 = $unsigned($random) % 255;
		     #1;
	   end
	   // Incrementa o código da operação
	   code = code + 1;
	  end //end repeat
	  // Fecha o arquivo
	  $fclose(f);
	  // Termina a simulação
	  $finish;
	end //end initial
endmodule