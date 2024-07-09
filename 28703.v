module mem_access(IRfrompipe4, IRfrompipe5, RAFromPipe, ALUOut, RAMemSelectInput, wASelectInput, MemData, DataInSelect, WriteMem, RAFromPipeInc, SignalC
				  , Rfout1, Rfout2, mem_wb_CCR_write, ex_mem_CCR_write);
	output [15:0] MemData, RAFromPipeInc;
	wire [15:0] DataIn;
	input  [15:0] ALUOut, RAFromPipe, Rfout1, Rfout2, SignalC, , IRfrompipe5, IRfrompipe4;
	input         RAMemSelectInput, wASelectInput, WriteMem, DataInSelect, mem_wb_CCR_write, ex_mem_CCR_write;
	wire   [15:0] readAddSelected, writeAddSelected, DataInSelected;
	mux16x2 RASelect(.data0(RAFromPipe), .data1(ALUOut), .selectInput(RAMemSelectInput), .out(readAddSelected));
	mux16x2 WASelect(.data0(RAFromPipe), .data1(ALUOut), .selectInput(WAMemSelectInput), .out(writeAddSelected));
	mux16x4 DataSelect2(.data0(DataInSelected), .data1(SignalB), .data2(SignalC), .data3(16'b0), .SelectInput(F3), .out(DataIn));
	mux16x2 DataSelect1(.data0(Rfout1), .data1(Rfout2), .selectInput(DataInSelect), .out(DataInSelected));
	data_mem DataMemory(.readAdd(readAddSelected), .out(MemData), .writeAdd(writeAddSelected), .in(DataIn), .write(WriteMem));
	plus_one Inc(.in(RAFromPipe), .out(RAFromPipeInc));
	forward_mem_stage(.mem_wb_op(IRfrompipe5[15:12]), .mem_wb_regA(IRfrompipe5[11:9]), .mem_wb_regC(IRfrompipe5[5:3]), .ex_mem_op(IRfrompipe4[15:12]),
					  .ex_mem_regA(IRfrompipe4[11:9]), .F3(F3) ,mem_wb_CCR_write(mem_wb_CCR_write), .ex_mem_CCR_write(ex_mem_CCR_write));
endmodule