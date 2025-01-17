module ARM_CU_ALU( input MFC , Reset , Clk , MEMSTORE,MEMLOAD,MEMDAT, output MEMADD, MFA,READ_WRITE,WORD_BYTE);
ARM_CU_ALU CPU( MFC , Reset , Clk , MEMSTORE,MEMLOAD,MEMDAT,MEMADD, MFA,READ_WRITE,WORD_BYTE);
initial fork
	Reset =1; Clk = 0; MEMSTORE=0;MEMLOAD=0;
	#1 Reset = 0;
	#(sim_time-1) Reset = 1; // print out memory before stopping simulation
join
always@(*) begin
	$display("MEMADD = %d", MEMADD);
	MEMSTORE=!READ_WRITE;
	MEMLOAD=READ_WRITE;
end
always
	#1 Clk = ~Clk;
initial #sim_time $finish;
initial begin
	$dumpfile("ARM_CU_ALU_TestBench5.vcd");
	$dumpvars(0,ARM_CU_ALU_TestBench5);
	//$display(" Test Results" );
	//$monitor("input MFC =%d, Reset =%d, Clk =%d, MEMSTORE=%d,MEMLOAD=%d,MEMDAT=%d, output MEMADD=%d, MFA=%d,READ_WRITE=%d,WORD_BYTE=%d,",MFC , Reset , Clk , MEMSTORE,MEMLOAD,MEMDAT, MEMADD, MFA,READ_WRITE,WORD_BYTE);
end
endmodule