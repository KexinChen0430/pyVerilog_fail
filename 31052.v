module Score_tb();
reg RESET;
reg [11:0] SCORE;
wire [6:0] DISP_SU;
wire [6:0] DISP_SD;
wire [6:0] DISP_SC;
wire [6:0] DISP_SM;
Score sc_tb(
	.RESET(RESET),
	.SCORE(SCORE),
	.DISP_SU(DISP_SU),
	.DISP_SD(DISP_SD),
	.DISP_SC(DISP_SC),
	.DISP_SM(DISP_SM)
);
initial begin
	RESET=0;
	SCORE=0;
	$display("==================================//\\\\==================================");
	$display("|                        Testbench Modulo Score                        |");
	$display("==================================\\\\//==================================");
	$display("\tTEMPO: %0t // SCORE = 0\n", $time);
	#5 RESET=1;
	#10 RESET=0;
	$display("\tTEMPO: %0t // RESET foi ativado por 10ns\n", $time);
	#5 SCORE=9;
	#1 $display("\tTEMPO: %0t // SCORE alterado para %d\n\t\tDISP_SM = %b,\n\t\tDISP_SC = %b,\n\t\tDISP_SD = %b,\n\t\tDISP_SU = %b\n", $time, SCORE, DISP_SM, DISP_SC, DISP_SD, DISP_SU);
	#10 SCORE=56;
	#1 $display("\tTEMPO: %0t // SCORE alterado para %d\n\t\tDISP_SM = %b,\n\t\tDISP_SC = %b,\n\t\tDISP_SD = %b,\n\t\tDISP_SU = %b\n", $time, SCORE, DISP_SM, DISP_SC, DISP_SD, DISP_SU);
	#10 SCORE=703;
	#1 $display("\tTEMPO: %0t // SCORE alterado para %d\n\t\tDISP_SM = %b,\n\t\tDISP_SC = %b,\n\t\tDISP_SD = %b,\n\t\tDISP_SU = %b\n", $time, SCORE, DISP_SM, DISP_SC, DISP_SD, DISP_SU);
	#10 SCORE=2590;
	#1 $display("\tTEMPO: %0t // SCORE alterado para %d\n\t\tDISP_SM = %b,\n\t\tDISP_SC = %b,\n\t\tDISP_SD = %b,\n\t\tDISP_SU = %b\n", $time, SCORE, DISP_SM, DISP_SC, DISP_SD, DISP_SU);
	#10 SCORE=4095;
	#1 $display("\tTEMPO: %0t // SCORE alterado para %d\n\t\tDISP_SM = %b,\n\t\tDISP_SC = %b,\n\t\tDISP_SD = %b,\n\t\tDISP_SU = %b\n", $time, SCORE, DISP_SM, DISP_SC, DISP_SD, DISP_SU);
	#10
	$display("==================================//\\\\==================================");
	$display("|                           Fim do Testbench                           |");
	$display("==================================\\\\//==================================");
	$stop;
end
endmodule