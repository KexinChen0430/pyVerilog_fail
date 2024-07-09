module Register_Bank (
	// memory interface
	din,
	dout,
	address,
	size,
	enable,
	read_write,
	// register inputs
	PC0_next,
	PC1_next,
	PC2_next,
	MSR0_next,
	MSR1_next,
	MSR2_next,
	HMULT_next,
	result,
	result_reg,
	result_valid,
	// register outputs
	reg0,
	reg1,
	reg2,
	reg3,
	PC0,
	PC1,
	PC2,
	MSR0,
	MSR1,
	MSR2,
	HMULT,
	// control
	sel0,
	sel1,
	sel2,
	sel3,
	state,
	clk,
	reset
);
	`include "definition/Definition.v"
	parameter	REGWSTATE_HMULT		= 0;	// state to write HMULT
	parameter	REGWSTATE_GEN		= 0;	// state to write any general registers
	parameter	REGWSTATE_SFR		= 0;	// state to write all SFRs
	// memory interface
	input				[WORD-1:0]								din;
	input				[WORD-1:0]								address;
	output		reg		[WORD-1:0]								dout;
	input														enable;
	input														read_write;
	input				[LOGWORDBYTE-1:0]						size;
	// register inputs
	input				[WORD-1:0]								PC0_next;
	input				[WORD-1:0]								PC1_next;
	input				[WORD-1:0]								PC2_next;
	input				[WORD-1:0]								MSR0_next;
	input				[WORD-1:0]								MSR1_next;
	input				[WORD-1:0]								MSR2_next;
	input				[WORD-1:0]								HMULT_next;
	input				[WORD-1:0]								result;
	input				[WORD-1:0]								result_reg;
	input														result_valid;
	// register outputs
	output		reg		[WORD-1:0]								reg0;
	output		reg		[WORD-1:0]								reg1;
	output		reg		[WORD-1:0]								reg2;
	output		reg		[WORD-1:0]								reg3;
	output		reg		[WORD-1:0]								PC0;
	output		reg		[WORD-1:0]								PC1;
	output		reg		[WORD-1:0]								PC2;
	output		reg		[WORD-1:0]								MSR0;
	output		reg		[WORD-1:0]								MSR1;
	output		reg		[WORD-1:0]								MSR2;
	output		reg		[WORD-1:0]								HMULT;
	// control
	input				[WIDTH_FIELD0-1:0]						sel0;
	input				[WIDTH_FIELD1-1:0]						sel1;
	input				[WIDTH_FIELD2-1:0]						sel2;
	input				[WIDTH_SHAMT_R-1:0]						sel3;
	input				[WORD-1:0]								state;
	input														clk;
	input														reset;
				wire	[WORD-1:0]								value		[TOTAL_SPACE-1:0];	// register value outputs
				reg												active;
				reg												unpacked_sel_memory	[REG_SPACE-1:0];
	always @(*) begin
		dout	<= value[address];
		reg0	<= value[sel0];
		reg1	<= value[sel1];
		reg2	<= value[sel2];
		reg3	<= value[sel3];
		PC0		<= value[SFR_PC0];
		PC1		<= value[SFR_PC1];
		PC2		<= value[SFR_PC2];
		MSR0	<= value[SFR_MSR0];
		MSR1	<= value[SFR_MSR1];
		MSR2	<= value[SFR_MSR2];
		HMULT	<= value[REG_HMULT];
	end
	genvar i;
	generate
		for(i=0; i<REG_SPACE; i=i+1) begin : REGSEL
			always @(*) begin
				unpacked_sel_memory[i]	<= ((address/WORDBYTE) == i) && (read_write == WRITE) && enable;
			end
		end
	endgenerate
	// register set ****************************************************************
	// Zero register
	Register X0(
		.value			(value[REG_Z]	),
		.memory			(0				),
		.datapath		(0				),
		.sel_memory		(0				),
		.sel_datapath	(0				),
		.clk			(clk			),
		.reset			(reset			)
	);
	// Higher Multiplication register
	Register X1(
		.value			(value[REG_HMULT]				),
		.memory			(din							),
		.datapath		(HMULT_next						),
		.sel_memory		(unpacked_sel_memory[REG_HMULT]	),
		.sel_datapath	((state == REGWSTATE_HMULT)		),
		.clk			(clk							),
		.reset			(reset							)
	);
	// "Real" general purpose registers
	generate
		for(i=GENERAL_OFFSET; i<GENERAL_SPACE; i=i+1) begin : REGGENERAL
			Register X(
				.value			(value[i]														),
				.memory			(din															),
				.datapath		(result															),
				.sel_memory		(unpacked_sel_memory[i]											),
				.sel_datapath	((state == REGWSTATE_GEN) && (result_reg == i) && result_valid	),	// REGWRITE_BROADSIDE
				.clk			(clk															),
				.reset			(reset															)
			);
		end
	endgenerate
	// PC*
	Register X16(
		.value			(value[SFR_PC0]					),
		.memory			(din							),
		.datapath		(PC0_next						),
		.sel_memory		(unpacked_sel_memory[SFR_PC0]	),
		.sel_datapath	((state == REGWSTATE_SFR)		),	// REGWRITE_BROADSIDE
		.clk			(clk							),
		.reset			(reset							)
	);
	Register X17(
		.value			(value[SFR_PC1]					),
		.memory			(din							),
		.datapath		(PC1_next						),
		.sel_memory		(unpacked_sel_memory[SFR_PC1]	),
		.sel_datapath	((state == REGWSTATE_SFR)		),
		.clk			(clk							),
		.reset			(reset							)
	);
	Register X18(
		.value			(value[SFR_PC2]					),
		.memory			(din							),
		.datapath		(PC2_next						),
		.sel_memory		(unpacked_sel_memory[SFR_PC2]	),
		.sel_datapath	((state == REGWSTATE_SFR)		),
		.clk			(clk							),
		.reset			(reset							)
	);
	// MSR*
	Register X19(
		.value			(value[SFR_MSR0]				),
		.memory			(din							),
		.datapath		(MSR0_next						),
		.sel_memory		(unpacked_sel_memory[SFR_MSR0]	),
		.sel_datapath	((state == REGWSTATE_SFR)		),	// REGWRITE_BROADSIDE
		.clk			(clk							),
		.reset			(reset							)
	);
	Register X20(
		.value			(value[SFR_MSR1]				),
		.memory			(din							),
		.datapath		(MSR1_next						),
		.sel_memory		(unpacked_sel_memory[SFR_MSR1]	),
		.sel_datapath	((state == REGWSTATE_SFR)		),
		.clk			(clk							),
		.reset			(reset							)
	);
	Register X21(
		.value			(value[SFR_MSR2]				),
		.memory			(din							),
		.datapath		(MSR2_next						),
		.sel_memory		(unpacked_sel_memory[SFR_MSR2]	),
		.sel_datapath	((state == REGWSTATE_SFR)		),
		.clk			(clk							),
		.reset			(reset							)
	);
endmodule