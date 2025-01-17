module ARM_CU_ALU( input MFC , Reset , Clk , MEMSTORE,MEMLOAD,MEMDAT, output MEMADD, MFA,READ_WRITE,WORD_BYTE);
ARM_CU_ALU CPU( MFC , Reset , Clk , MEMSTORE,MEMLOAD,MEMDAT,MEMADD, MFA,READ_WRITE,WORD_BYTE);
initial fork
	Reset =1; Clk = 0; MEMSTORE=0;MEMLOAD=0;MEMDAT=0;MFC=0;
	#1 Reset = 0;
join
always@(posedge MFA)begin
	$display("MEMADD = %d", MEMADD);
	if(READ_WRITE == 1) begin
		case(MEMADD)
			8'h00:begin
				#1 MEMDAT = 32'b11100010_00000001_00000000_00000000 ; #1 MEMLOAD = 1;
				#5 MEMLOAD=0;
			end
			8'h04:begin
				#1 MEMDAT = 32'b11100011_10000000_00010000_00101000 ; #1 MEMLOAD = 1;
				#5 MEMLOAD=0;
			end
			8'h08:begin
				#1 MEMDAT = 32'b11100111_11010001_00100000_00000000 ; #1 MEMLOAD = 1;
				#5 MEMLOAD=0;
			end
			8'h0C:begin
				#1 MEMDAT = 32'b11100101_11010001_00110000_00000010 ; #1 MEMLOAD = 1;
				#5 MEMLOAD=0;
			end
			8'h10:begin
				#1 MEMDAT = 32'b11100000_10000000_01010000_00000000 ; #1 MEMLOAD = 1;
				#5 MEMLOAD=0;
			end
			8'h14:begin
				#1 MEMDAT = 32'b11100000_10000010_01010000_00000101; #1 MEMLOAD = 1;
				#5 MEMLOAD=0;
			end
			8'h18:begin
				#1 MEMDAT = 32'b11100010_01010011_00110000_00000001 ; #1 MEMLOAD = 1;
				#5 MEMLOAD=0;
			end
			8'h1C:begin
				#1 MEMDAT = 32'b00011010_11111111_11111111_11111101 ; #1 MEMLOAD = 1;
				#5 MEMLOAD=0;
			end
			8'h20:begin
				#1 MEMDAT = 32'b11100101_11000001_01010000_00000011 ; #1 MEMLOAD = 1;
				#5 MEMLOAD=0;
			end
			8'h24:begin
				#1 MEMDAT = 32'b11101010_00000000_00000000_00000001 ; #1 MEMLOAD = 1;
				#5 MEMLOAD=0;
			end
			8'h28:begin
				#1 MEMDAT = 32'b00001011_00000101_00000111_00000100 ; #1 MEMLOAD = 1;
				#5 MEMLOAD=0;
			end
			8'h2C:begin
				#1 MEMDAT = 32'b11101010_11111111_11111111_11111111 ; #1 MEMLOAD = 1;
				#5 MEMLOAD=0;
			end
			default:begin
				#1 MEMDAT = 32'h00000000 ; #1 MEMLOAD = 1;
				#5 MEMLOAD=0;
			end
		endcase
		#5 MFC = 1 ;#7 MFC = 0 ;
		end
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