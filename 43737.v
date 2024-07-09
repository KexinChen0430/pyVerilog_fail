module Computer_Datapath(
	output [WORD_WIDTH-1:0] ADDR_bus_out,
	output [WORD_WIDTH-1:0] DATA_bus_out,
	output [ALU_FLAGS_WIDTH-1:0] FLAG_bus_out,
	input [CNTRL_WIDTH-1:0] CNTRL_bus_in,
	input [WORD_WIDTH-1:0] CONST_bus_in,
	input [WORD_WIDTH-1:0] DMEM_bus_in,
	input CLK,
	input RST
	);
parameter WORD_WIDTH = 16;
parameter DR_WIDTH = 3;
parameter SA_WIDTH = DR_WIDTH;
parameter SB_WIDTH = DR_WIDTH;
parameter OPCODE_WIDTH = 7;
parameter FS_WIDTH = 4;
parameter ALU_FLAGS_WIDTH = 4;
parameter CNTRL_FLAGS_WIDTH = 7;
parameter CNTRL_WIDTH = DR_WIDTH+SA_WIDTH+SB_WIDTH+FS_WIDTH+CNTRL_FLAGS_WIDTH;
Computer_Datapath_BusMuxer BM0 (
	.BUS_out(DATA_bus_out),
	.A_in(B_data_out_bus),
	.B_in(CONST_bus_in),
	.S(CNTRL_bus_in[10])
	);
defparam BM0.WORD_WIDTH = WORD_WIDTH;
defparam BM0.DR_WIDTH = DR_WIDTH;
defparam BM0.SB_WIDTH = DR_WIDTH;
defparam BM0.SA_WIDTH = DR_WIDTH;
defparam BM0.OPCODE_WIDTH = OPCODE_WIDTH;
defparam BM0.CNTRL_WIDTH = CNTRL_WIDTH;
wire [WORD_WIDTH-1:0] D_bus;
Computer_Datapath_BusMuxer BM1 (
	.BUS_out(D_bus),
	.A_in(F_bus),
	.B_in(DMEM_bus_in),
	.S(CNTRL_bus_in[5])
	);
defparam BM1.WORD_WIDTH = WORD_WIDTH;
defparam BM1.DR_WIDTH = DR_WIDTH;
defparam BM1.SB_WIDTH = DR_WIDTH;
defparam BM1.SA_WIDTH = DR_WIDTH;
defparam BM1.OPCODE_WIDTH = OPCODE_WIDTH;
defparam BM1.CNTRL_WIDTH = CNTRL_WIDTH;
wire [WORD_WIDTH-1:0] F_bus;
Computer_Datapath_FunctionUnit FU0 (
	.FU_out(F_bus),
	.FLAG_bus_out(FLAG_bus_out),
	.ADDR_bus_in(ADDR_bus_out),
	.DATA_bus_in(DATA_bus_out),
	.CNTRL_bus_in(CNTRL_bus_in)
	);
defparam FU0.WORD_WIDTH = WORD_WIDTH;
defparam FU0.DR_WIDTH = DR_WIDTH;
defparam FU0.SB_WIDTH = DR_WIDTH;
defparam FU0.SA_WIDTH = DR_WIDTH;
defparam FU0.OPCODE_WIDTH = OPCODE_WIDTH;
defparam FU0.CNTRL_WIDTH = CNTRL_WIDTH;
wire [WORD_WIDTH-1:0] ADDR_bus;
wire [WORD_WIDTH-1:0] B_data_out_bus;
Computer_Datapath_RegisterFile RF0 (
	.ADDR_bus_out(ADDR_bus_out),
	.B_data_out(B_data_out_bus),
	.CNTRL_bus_in(CNTRL_bus_in),
	.D_bus_in(D_bus),
	.CLK(CLK),
	.RST(RST)
	);
defparam RF0.WORD_WIDTH = WORD_WIDTH;
defparam RF0.DR_WIDTH = DR_WIDTH;
defparam RF0.SB_WIDTH = DR_WIDTH;
defparam RF0.SA_WIDTH = DR_WIDTH;
defparam RF0.OPCODE_WIDTH = OPCODE_WIDTH;
defparam RF0.CNTRL_WIDTH = CNTRL_WIDTH;
endmodule