module Register_File (
	// memory interface
	din,
	dout,
	address,
	enable,
	read_write,
	size,
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
	sel0,	sel1,	sel2,	sel3,
	packed_bank,
	packed_bank_enable,
	packed_state,
	clk,
	reset
);
	`include "definition/Definition.v"
	parameter	REGWSTATE_HMULT		= 0;	// state to write HMTUL
	parameter	REGWSTATE_GEN		= 0;	// state to write any general registers
	parameter	REGWSTATE_SFR		= 0;	// state to write all SFRs
	// memory interface
	input				[WORD-1:0]								din;
	input				[WORD-1:0]								address;
	output	reg			[WORD-1:0]								dout;
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
	input				[WIDTH_FIELD0-1		:0]					sel0;
	input				[WIDTH_FIELD1-1		:0]					sel1;
	input				[WIDTH_FIELD2-1		:0]					sel2;
	input				[WIDTH_SHAMT_R-1	:0]					sel3;
	input				[(WORD*PIPEDEPTH)-1:0]					packed_bank;
	input				[PIPEDEPTH-1:0]							packed_bank_enable;
	input				[(WORD*NUM_BANK)-1:0]					packed_state;
	input														clk;
	input														reset;
				reg		[WORD-1:0]								unpacked_bank			[PIPEDEPTH-1:0];
				reg		[0:0]									unpacked_bank_enable	[PIPEDEPTH-1:0];
	// temporary holds for values from each bank before being multiplexed
				wire	[WORD-1:0]								value_reg0		[NUM_BANK-1:0];
				wire	[WORD-1:0]								value_reg1		[NUM_BANK-1:0];
				wire	[WORD-1:0]								value_reg2		[NUM_BANK-1:0];
				wire	[WORD-1:0]								value_reg3		[NUM_BANK-1:0];
				wire	[WORD-1:0]								value_PC0		[NUM_BANK-1:0];
				wire	[WORD-1:0]								value_PC1		[NUM_BANK-1:0];
				wire	[WORD-1:0]								value_PC2		[NUM_BANK-1:0];
				wire	[WORD-1:0]								value_MSR0		[NUM_BANK-1:0];
				wire	[WORD-1:0]								value_MSR1		[NUM_BANK-1:0];
				wire	[WORD-1:0]								value_MSR2		[NUM_BANK-1:0];
				wire	[WORD-1:0]								value_HMULT		[NUM_BANK-1:0];
				wire	[WORD-1:0]								value_dout		[NUM_BANK-1:0];
				reg												unpacked_enable	[NUM_BANK-1:0];
				reg		[WORD-1:0]								unpacked_state	[NUM_BANK-1:0];
	genvar j;
	generate
		for (j=0; j<PIPEDEPTH; j=j+1) begin : ALIAS
			always @(*) begin
				unpacked_bank[j]		<=	packed_bank[((j+1)*WORD)-1:j*WORD];
				unpacked_bank_enable[j]	<=	packed_bank_enable[j:j];
			end
		end
	endgenerate
	always @(posedge clk) begin
		if(reset) 								dout	<= 0;
		else if(enable && (read_write==READ))	dout	<= value_dout[address/TOTAL_SPACE];
		else									dout	<= 0;
	end
	always @(posedge clk) begin
		reg0	<=	value_reg0	[unpacked_bank[REGREAD_REG0]];	// note that these are pipeline-specific constants
		reg1	<=	value_reg1	[unpacked_bank[REGREAD_REG1]];
		reg2	<=	value_reg2	[unpacked_bank[REGREAD_REG2]];
		reg3	<=	value_reg3	[unpacked_bank[REGREAD_REG3]];
		PC0		<=	value_PC0	[unpacked_bank[REGREAD_PC0]];
		PC1		<=	value_PC1	[unpacked_bank[REGREAD_PC1]];
		PC2		<=	value_PC2	[unpacked_bank[REGREAD_PC2]];
		MSR0	<=	value_MSR0	[unpacked_bank[REGREAD_MSR0]];
		MSR1	<=	value_MSR1	[unpacked_bank[REGREAD_MSR1]];
		MSR2	<=	value_MSR2	[unpacked_bank[REGREAD_MSR2]];
		HMULT	<=	value_HMULT	[unpacked_bank[REGREAD_HMULT]];
	end
	genvar i;
	generate
		for (i=0; i<NUM_BANK; i=i+1) begin : REGBANK
			Register_Bank #(
				.REGWSTATE_HMULT	(REGWSTATE_HMULT	),
				.REGWSTATE_GEN		(REGWSTATE_GEN		),
				.REGWSTATE_SFR		(REGWSTATE_SFR		)
			)
			X(
				// memory interface
				.dout			(value_dout[i]						),
				.din			(din								),
				.address		(address%TOTAL_SPACE				),
				.size			(size								),
				.read_write		(read_write							),
				.enable			(unpacked_enable[i]					),
				// register inputs
				.PC0_next		(PC0_next							),
				.PC1_next		(PC1_next							),
				.PC2_next		(PC2_next							),
				.MSR0_next		(MSR0_next							),
				.MSR1_next		(MSR1_next							),
				.MSR2_next		(MSR2_next							),
				.HMULT_next		(HMULT_next							),
				.result			(result								),
				.result_reg		(result_reg							),
				.result_valid	(result_valid						),
				// register outputs
				.reg0			(value_reg0[i]						),
				.reg1			(value_reg1[i]						),
				.reg2			(value_reg2[i]						),
				.reg3			(value_reg3[i]						),
				.PC0			(value_PC0[i]						),
				.PC1			(value_PC1[i]						),
				.PC2			(value_PC2[i]						),
				.MSR0			(value_MSR0[i]						),
				.MSR1			(value_MSR1[i]						),
				.MSR2			(value_MSR2[i]						),
				.HMULT			(value_HMULT[i]						),
				// control
				.sel0			(sel0								),
				.sel1			(sel1								),
				.sel2			(sel2								),
				.sel3			(sel3								),
				.state			(unpacked_state[i]					),
				.clk			(clk								),
				.reset			(reset								)
			);
			always @(*) begin
				unpacked_enable[i]	<= enable && (i==address/TOTAL_SPACE);
				unpacked_state[i]	<= packed_state[((i+1)*WORD)-1 : ((i+0)*WORD)-0];
			end
		end
	endgenerate
endmodule