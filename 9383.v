module SOFCounter (
	done,
	ready,
	value,
	clk,
	sof,
	start
);
	output  done;
	output  ready;
	output  value;
	input   clk;
	input   sof;
	input   start;
    wire [1:0] so;
	reg ready;
	reg [3:0] state;
	wire [2:0] addr = state[2:0];
	reg [2:0] counterAddr;
	reg lastSof;
	wire sofPulse = ~lastSof & sof;
	wire counterZ0;
	wire counterZ1;
	assign value = so[1];
	always @(posedge clk)
	begin
		lastSof <= sof;
	end
	localparam SOFCOUNTER_STATE_COUNT	 	= 4'd0;
	localparam SOFCOUNTER_STATE_SUB 		= 4'd1;
	localparam SOFCOUNTER_STATE_LOADACC 	= 4'd2;
	localparam SOFCOUNTER_STATE_MULTIPLY 	= 4'd3;
	localparam SOFCOUNTER_STATE_ADD 		= 4'd4;
	localparam SOFCOUNTER_STATE_CLEAR 		= 4'd5;
	localparam SOFCOUNTER_STATE_SHIFT 		= 4'd6;
	localparam SOFCOUNTER_STATE_DISABLED	= 4'd7;
	localparam SOFCOUNTER_STATE_WAIT	 	= 4'd8;		// Lower 3 bits same as COUNT
	localparam COUNTER_ADDR_NOP	 		= 3'd0;
	localparam COUNTER_ADDR_MULTLOAD	= 3'd1;
	localparam COUNTER_ADDR_MULTCOUNT 	= 3'd2;
	localparam COUNTER_ADDR_SHIFTLOAD 	= 3'd3;
	localparam COUNTER_ADDR_SHIFTCOUNT 	= 3'd4;
	assign done = (state == SOFCOUNTER_STATE_SHIFT) & counterZ1;
	always @(posedge clk)
	begin
		case (state)
			SOFCOUNTER_STATE_DISABLED:
			begin
				if (sofPulse) state <= SOFCOUNTER_STATE_COUNT;
				ready <= 1'b0;
			end
			SOFCOUNTER_STATE_COUNT:
				if (sofPulse) state <= SOFCOUNTER_STATE_SUB;
			SOFCOUNTER_STATE_SUB:
				state <= SOFCOUNTER_STATE_LOADACC;
			SOFCOUNTER_STATE_LOADACC:
				state <= SOFCOUNTER_STATE_MULTIPLY;
			SOFCOUNTER_STATE_MULTIPLY:
				if (counterZ0) state <= SOFCOUNTER_STATE_ADD;
			SOFCOUNTER_STATE_ADD:
			begin
				state <= SOFCOUNTER_STATE_CLEAR;
				ready <= 1'b1;
			end
			SOFCOUNTER_STATE_CLEAR:
				if (start) state <= SOFCOUNTER_STATE_SHIFT;
				else state <= SOFCOUNTER_STATE_WAIT;
			SOFCOUNTER_STATE_WAIT:
				if (start) state <= SOFCOUNTER_STATE_SHIFT;
			SOFCOUNTER_STATE_SHIFT:
		   begin
				if (counterZ1)
				begin
					state <= SOFCOUNTER_STATE_COUNT;
				end
				ready <= 1'b0;
			end
			default:
				state <= SOFCOUNTER_STATE_DISABLED;
		endcase
	end
	always @(state)
	begin
		case (state)
			SOFCOUNTER_STATE_LOADACC:
				counterAddr = COUNTER_ADDR_MULTLOAD;
			SOFCOUNTER_STATE_MULTIPLY:
				counterAddr = COUNTER_ADDR_MULTCOUNT;
			SOFCOUNTER_STATE_CLEAR:
				counterAddr = COUNTER_ADDR_SHIFTLOAD;
			SOFCOUNTER_STATE_SHIFT:
				counterAddr = COUNTER_ADDR_SHIFTCOUNT;
			default:
				counterAddr = COUNTER_ADDR_NOP;
		endcase
	end
	// 16-Bit Datapath
	cy_psoc3_dp16 #(.cy_dpconfig_a(
	{
		`CS_ALU_OP__INC, `CS_SRCA_A0, `CS_SRCB_D0,
		`CS_SHFT_OP_PASS, `CS_A0_SRC__ALU, `CS_A1_SRC_NONE,
		`CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA,
		`CS_CMP_SEL_CFGA, /*CS_REG0 Comment:Count */
		`CS_ALU_OP__SUB, `CS_SRCA_A0, `CS_SRCB_D0,
		`CS_SHFT_OP_PASS, `CS_A0_SRC__ALU, `CS_A1_SRC_NONE,
		`CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA,
		`CS_CMP_SEL_CFGA, /*CS_REG1 Comment:Sub */
		`CS_ALU_OP_PASS, `CS_SRCA_A0, `CS_SRCB_D0,
		`CS_SHFT_OP_PASS, `CS_A0_SRC_NONE, `CS_A1_SRC__ALU,
		`CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA,
		`CS_CMP_SEL_CFGA, /*CS_REG2 Comment:LoadAcc */
		`CS_ALU_OP__ADD, `CS_SRCA_A0, `CS_SRCB_A1,
		`CS_SHFT_OP_PASS, `CS_A0_SRC_NONE, `CS_A1_SRC__ALU,
		`CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA,
		`CS_CMP_SEL_CFGA, /*CS_REG3 Comment:Multiply */
		`CS_ALU_OP__ADD, `CS_SRCA_A1, `CS_SRCB_D1,
		`CS_SHFT_OP_PASS, `CS_A0_SRC_NONE, `CS_A1_SRC__ALU,
		`CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA,
		`CS_CMP_SEL_CFGA, /*CS_REG4 Comment:Add */
		`CS_ALU_OP__XOR, `CS_SRCA_A0, `CS_SRCB_A0,
		`CS_SHFT_OP_PASS, `CS_A0_SRC__ALU, `CS_A1_SRC_NONE,
		`CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA,
		`CS_CMP_SEL_CFGA, /*CS_REG5 Comment:Clear */
		`CS_ALU_OP_PASS, `CS_SRCA_A1, `CS_SRCB_D0,
		`CS_SHFT_OP___SL, `CS_A0_SRC_NONE, `CS_A1_SRC__ALU,
		`CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA,
		`CS_CMP_SEL_CFGA, /*CS_REG6 Comment:Shift */
		`CS_ALU_OP__XOR, `CS_SRCA_A0, `CS_SRCB_A0,
		`CS_SHFT_OP_PASS, `CS_A0_SRC__ALU, `CS_A1_SRC_NONE,
		`CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA,
		`CS_CMP_SEL_CFGA, /*CS_REG7 Comment:Disabled */
		  8'hFF, 8'h00,	/*SC_REG4	Comment: */
		  8'hFF, 8'hFF,	/*SC_REG5	Comment: */
		`SC_CMPB_A1_D1, `SC_CMPA_A1_D1, `SC_CI_B_ARITH,
		`SC_CI_A_ARITH, `SC_C1_MASK_DSBL, `SC_C0_MASK_DSBL,
		`SC_A_MASK_DSBL, `SC_DEF_SI_0, `SC_SI_B_DEFSI,
		`SC_SI_A_DEFSI, /*SC_REG6 Comment: */
		`SC_A0_SRC_ACC, `SC_SHIFT_SL, 1'b0,
		1'b0, `SC_FIFO1_BUS, `SC_FIFO0__A0,
		`SC_MSB_DSBL, `SC_MSB_BIT0, `SC_MSB_NOCHN,
		`SC_FB_NOCHN, `SC_CMP1_NOCHN,
		`SC_CMP0_NOCHN, /*SC_REG7 Comment: */
		 10'h0, `SC_FIFO_CLK__DP,`SC_FIFO_CAP_AX,
		`SC_FIFO_LEVEL,`SC_FIFO__SYNC,`SC_EXTCRC_DSBL,
		`SC_WRK16CAT_DSBL /*SC_REG8 Comment: */
}), .cy_dpconfig_b(
	{
		`CS_ALU_OP__INC, `CS_SRCA_A0, `CS_SRCB_D0,
		`CS_SHFT_OP_PASS, `CS_A0_SRC__ALU, `CS_A1_SRC_NONE,
		`CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA,
		`CS_CMP_SEL_CFGA, /*CS_REG0 Comment:Count */
		`CS_ALU_OP__SUB, `CS_SRCA_A0, `CS_SRCB_D0,
		`CS_SHFT_OP_PASS, `CS_A0_SRC__ALU, `CS_A1_SRC_NONE,
		`CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA,
		`CS_CMP_SEL_CFGA, /*CS_REG1 Comment:Sub */
		`CS_ALU_OP_PASS, `CS_SRCA_A0, `CS_SRCB_D0,
		`CS_SHFT_OP_PASS, `CS_A0_SRC_NONE, `CS_A1_SRC__ALU,
		`CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA,
		`CS_CMP_SEL_CFGA, /*CS_REG2 Comment:LoadAcc */
		`CS_ALU_OP__ADD, `CS_SRCA_A0, `CS_SRCB_A1,
		`CS_SHFT_OP_PASS, `CS_A0_SRC_NONE, `CS_A1_SRC__ALU,
		`CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA,
		`CS_CMP_SEL_CFGA, /*CS_REG3 Comment:Multiply */
		`CS_ALU_OP__ADD, `CS_SRCA_A1, `CS_SRCB_D1,
		`CS_SHFT_OP_PASS, `CS_A0_SRC_NONE, `CS_A1_SRC__ALU,
		`CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA,
		`CS_CMP_SEL_CFGA, /*CS_REG4 Comment:Add */
		`CS_ALU_OP__XOR, `CS_SRCA_A0, `CS_SRCB_A0,
		`CS_SHFT_OP_PASS, `CS_A0_SRC__ALU, `CS_A1_SRC_NONE,
		`CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA,
		`CS_CMP_SEL_CFGA, /*CS_REG5 Comment:Clear */
		`CS_ALU_OP_PASS, `CS_SRCA_A1, `CS_SRCB_D0,
		`CS_SHFT_OP___SL, `CS_A0_SRC_NONE, `CS_A1_SRC__ALU,
		`CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA,
		`CS_CMP_SEL_CFGA, /*CS_REG6 Comment:Shift */
		`CS_ALU_OP__XOR, `CS_SRCA_A0, `CS_SRCB_A0,
		`CS_SHFT_OP_PASS, `CS_A0_SRC__ALU, `CS_A1_SRC_NONE,
		`CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA,
		`CS_CMP_SEL_CFGA, /*CS_REG7 Comment:Disabled */
		  8'hFF, 8'h00,	/*SC_REG4	Comment: */
		  8'hFF, 8'hFF,	/*SC_REG5	Comment: */
		`SC_CMPB_A1_D1, `SC_CMPA_A1_D1, `SC_CI_B_CHAIN,
		`SC_CI_A_CHAIN, `SC_C1_MASK_DSBL, `SC_C0_MASK_DSBL,
		`SC_A_MASK_DSBL, `SC_DEF_SI_0, `SC_SI_B_CHAIN,
		`SC_SI_A_CHAIN, /*SC_REG6 Comment: */
		`SC_A0_SRC_ACC, `SC_SHIFT_SL, 1'b0,
		1'b0, `SC_FIFO1_BUS, `SC_FIFO0__A0,
		`SC_MSB_DSBL, `SC_MSB_BIT0, `SC_MSB_NOCHN,
		`SC_FB_NOCHN, `SC_CMP1_CHNED,
		`SC_CMP0_CHNED, /*SC_REG7 Comment: */
		 10'h0, `SC_FIFO_CLK__DP,`SC_FIFO_CAP_AX,
		`SC_FIFO_LEVEL,`SC_FIFO__SYNC,`SC_EXTCRC_DSBL,
		`SC_WRK16CAT_DSBL /*SC_REG8 Comment: */
	})) SofCounter(
		/*  input                   */  .clk(clk),
		/*  input   [02:00]         */  .cs_addr(addr),
		/*  input                   */  .route_si(1'b0),
		/*  input                   */  .route_ci(1'b0),
		/*  input                   */  .f0_load(1'b0),
		/*  input                   */  .f1_load(1'b0),
		/*  input                   */  .d0_load(1'b0),
		/*  input                   */  .d1_load(1'b0),
		/*  output  [01:00]         */  .ce0(),
		/*  output  [01:00]         */  .cl0(),
		/*  output  [01:00]         */  .z0(),
		/*  output  [01:00]         */  .ff0(),
		/*  output  [01:00]         */  .ce1(),
		/*  output  [01:00]         */  .cl1(),
		/*  output  [01:00]         */  .z1(),
		/*  output  [01:00]         */  .ff1(),
		/*  output  [01:00]         */  .ov_msb(),
		/*  output  [01:00]         */  .co_msb(),
		/*  output  [01:00]         */  .cmsb(),
		/*  output  [01:00]         */  .so(so),
		/*  output  [01:00]         */  .f0_bus_stat(),
		/*  output  [01:00]         */  .f0_blk_stat(),
		/*  output  [01:00]         */  .f1_bus_stat(),
		/*  output  [01:00]         */  .f1_blk_stat()
	);
		// 8-Bit Datapath
	cy_psoc3_dp8 #(.cy_dpconfig_a(
	{
		`CS_ALU_OP_PASS, `CS_SRCA_A0, `CS_SRCB_D0,
		`CS_SHFT_OP_PASS, `CS_A0_SRC_NONE, `CS_A1_SRC_NONE,
		`CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA,
		`CS_CMP_SEL_CFGA, /*CS_REG0 Comment:NOP */
		`CS_ALU_OP_PASS, `CS_SRCA_A0, `CS_SRCB_D0,
		`CS_SHFT_OP_PASS, `CS_A0_SRC___D0, `CS_A1_SRC_NONE,
		`CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA,
		`CS_CMP_SEL_CFGA, /*CS_REG1 Comment:MULTLOAD */
		`CS_ALU_OP__DEC, `CS_SRCA_A0, `CS_SRCB_D0,
		`CS_SHFT_OP_PASS, `CS_A0_SRC__ALU, `CS_A1_SRC_NONE,
		`CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA,
		`CS_CMP_SEL_CFGA, /*CS_REG2 Comment:MULTCOUNT */
		`CS_ALU_OP_PASS, `CS_SRCA_A0, `CS_SRCB_D0,
		`CS_SHFT_OP_PASS, `CS_A0_SRC_NONE, `CS_A1_SRC___D1,
		`CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA,
		`CS_CMP_SEL_CFGA, /*CS_REG3 Comment:SHIFTLOAD */
		`CS_ALU_OP__DEC, `CS_SRCA_A1, `CS_SRCB_D0,
		`CS_SHFT_OP_PASS, `CS_A0_SRC_NONE, `CS_A1_SRC__ALU,
		`CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA,
		`CS_CMP_SEL_CFGA, /*CS_REG4 Comment:SHIFTCOUNT */
		`CS_ALU_OP_PASS, `CS_SRCA_A0, `CS_SRCB_D0,
		`CS_SHFT_OP_PASS, `CS_A0_SRC_NONE, `CS_A1_SRC_NONE,
		`CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA,
		`CS_CMP_SEL_CFGA, /*CS_REG5 Comment: */
		`CS_ALU_OP_PASS, `CS_SRCA_A0, `CS_SRCB_D0,
		`CS_SHFT_OP_PASS, `CS_A0_SRC_NONE, `CS_A1_SRC_NONE,
		`CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA,
		`CS_CMP_SEL_CFGA, /*CS_REG6 Comment: */
		`CS_ALU_OP_PASS, `CS_SRCA_A0, `CS_SRCB_D0,
		`CS_SHFT_OP_PASS, `CS_A0_SRC_NONE, `CS_A1_SRC_NONE,
		`CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA,
		`CS_CMP_SEL_CFGA, /*CS_REG7 Comment: */
		  8'hFF, 8'h00,	/*SC_REG4	Comment: */
		  8'hFF, 8'hFF,	/*SC_REG5	Comment: */
		`SC_CMPB_A1_D1, `SC_CMPA_A1_D1, `SC_CI_B_ARITH,
		`SC_CI_A_ARITH, `SC_C1_MASK_DSBL, `SC_C0_MASK_DSBL,
		`SC_A_MASK_DSBL, `SC_DEF_SI_0, `SC_SI_B_DEFSI,
		`SC_SI_A_DEFSI, /*SC_REG6 Comment: */
		`SC_A0_SRC_ACC, `SC_SHIFT_SL, 1'b0,
		1'b0, `SC_FIFO1_BUS, `SC_FIFO0__A0,
		`SC_MSB_DSBL, `SC_MSB_BIT0, `SC_MSB_NOCHN,
		`SC_FB_NOCHN, `SC_CMP1_NOCHN,
		`SC_CMP0_NOCHN, /*SC_REG7 Comment: */
		 10'h0, `SC_FIFO_CLK__DP,`SC_FIFO_CAP_AX,
		`SC_FIFO_LEVEL,`SC_FIFO__SYNC,`SC_EXTCRC_DSBL,
		`SC_WRK16CAT_DSBL /*SC_REG8 Comment: */
	})) Counter(
		/*  input                   */  .clk(clk),
		/*  input   [02:00]         */  .cs_addr(counterAddr),
		/*  input                   */  .route_si(1'b0),
		/*  input                   */  .route_ci(1'b0),
		/*  input                   */  .f0_load(1'b0),
		/*  input                   */  .f1_load(1'b0),
		/*  input                   */  .d0_load(1'b0),
		/*  input                   */  .d1_load(1'b0),
		/*  output                  */  .ce0(),
		/*  output                  */  .cl0(),
		/*  output                  */  .z0(counterZ0),
		/*  output                  */  .ff0(),
		/*  output                  */  .ce1(),
		/*  output                  */  .cl1(),
		/*  output                  */  .z1(counterZ1),
		/*  output                  */  .ff1(),
		/*  output                  */  .ov_msb(),
		/*  output                  */  .co_msb(),
		/*  output                  */  .cmsb(),
		/*  output                  */  .so(),
		/*  output                  */  .f0_bus_stat(),
		/*  output                  */  .f0_blk_stat(),
		/*  output                  */  .f1_bus_stat(),
		/*  output                  */  .f1_blk_stat()
	);
endmodule