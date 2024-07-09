module Shaper1stOrder (
	delta,
	transfer,
	clk,
	done,
	ready,
	start,
	value
);
	output  delta;
	output  transfer;
	input   clk;
	input   done;
	input   ready;
	input   start;
	input   value;
	reg transfer;
	reg [2:0] state;
	reg delta;
	wire [1:0] cl0;
	localparam SHAPER1STORDER_STATE_WAIT 	= 3'd0;
	localparam SHAPER1STORDER_STATE_ACCUM 	= 3'd1;
	localparam SHAPER1STORDER_STATE_SUB 	= 3'd2;
	localparam SHAPER1STORDER_STATE_CHECK 	= 3'd3;
	localparam SHAPER1STORDER_STATE_SHIFT 	= 3'd4;
	always @(posedge clk)
	begin
		transfer <= 1'b0;
		case (state)
			SHAPER1STORDER_STATE_WAIT:
				if (start) state <= SHAPER1STORDER_STATE_ACCUM;
			SHAPER1STORDER_STATE_ACCUM:
				if (cl0[1])
				begin
					state <= SHAPER1STORDER_STATE_CHECK;
					delta <= 1'b0;
				end
				else
				begin
					state <= SHAPER1STORDER_STATE_SUB;
					delta <= 1'b1;
				end
			SHAPER1STORDER_STATE_SUB:
				state <= SHAPER1STORDER_STATE_CHECK;
			SHAPER1STORDER_STATE_CHECK:
				if (ready)
				begin
					state <= SHAPER1STORDER_STATE_SHIFT;
					transfer <= 1'b1;
				end
				else
				begin
					state <= SHAPER1STORDER_STATE_WAIT;
				end
			SHAPER1STORDER_STATE_SHIFT:
				if (done)
				begin
					state <= SHAPER1STORDER_STATE_WAIT;
				end
			default:
				state <= SHAPER1STORDER_STATE_WAIT;
		endcase
	end
	// 16-Bit Datapath
	cy_psoc3_dp16 #(.cy_dpconfig_a(
	{
		`CS_ALU_OP_PASS, `CS_SRCA_A0, `CS_SRCB_D0,
		`CS_SHFT_OP_PASS, `CS_A0_SRC_NONE, `CS_A1_SRC_NONE,
		`CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA,
		`CS_CMP_SEL_CFGA, /*CS_REG0 Comment:Wait */
		`CS_ALU_OP__ADD, `CS_SRCA_A0, `CS_SRCB_A1,
		`CS_SHFT_OP_PASS, `CS_A0_SRC__ALU, `CS_A1_SRC_NONE,
		`CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA,
		`CS_CMP_SEL_CFGA, /*CS_REG1 Comment:Accum */
		`CS_ALU_OP__SUB, `CS_SRCA_A0, `CS_SRCB_D1,
		`CS_SHFT_OP_PASS, `CS_A0_SRC__ALU, `CS_A1_SRC_NONE,
		`CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA,
		`CS_CMP_SEL_CFGA, /*CS_REG2 Comment:Sub */
		`CS_ALU_OP_PASS, `CS_SRCA_A0, `CS_SRCB_D0,
		`CS_SHFT_OP_PASS, `CS_A0_SRC_NONE, `CS_A1_SRC_NONE,
		`CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA,
		`CS_CMP_SEL_CFGA, /*CS_REG3 Comment:Check */
		`CS_ALU_OP_PASS, `CS_SRCA_A1, `CS_SRCB_D0,
		`CS_SHFT_OP___SL, `CS_A0_SRC_NONE, `CS_A1_SRC__ALU,
		`CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA,
		`CS_CMP_SEL_CFGA, /*CS_REG4 Comment:Shift */
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
		`SC_A_MASK_DSBL, `SC_DEF_SI_0, `SC_SI_B_ROUTE,
		`SC_SI_A_ROUTE, /*SC_REG6 Comment: */
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
		`CS_ALU_OP_PASS, `CS_SRCA_A0, `CS_SRCB_D0,
		`CS_SHFT_OP_PASS, `CS_A0_SRC_NONE, `CS_A1_SRC_NONE,
		`CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA,
		`CS_CMP_SEL_CFGA, /*CS_REG0 Comment:Wait */
		`CS_ALU_OP__ADD, `CS_SRCA_A0, `CS_SRCB_A1,
		`CS_SHFT_OP_PASS, `CS_A0_SRC__ALU, `CS_A1_SRC_NONE,
		`CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA,
		`CS_CMP_SEL_CFGA, /*CS_REG1 Comment:Accum */
		`CS_ALU_OP__SUB, `CS_SRCA_A0, `CS_SRCB_D1,
		`CS_SHFT_OP_PASS, `CS_A0_SRC__ALU, `CS_A1_SRC_NONE,
		`CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA,
		`CS_CMP_SEL_CFGA, /*CS_REG2 Comment:Sub */
		`CS_ALU_OP_PASS, `CS_SRCA_A0, `CS_SRCB_D0,
		`CS_SHFT_OP_PASS, `CS_A0_SRC_NONE, `CS_A1_SRC_NONE,
		`CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA,
		`CS_CMP_SEL_CFGA, /*CS_REG3 Comment:Check */
		`CS_ALU_OP_PASS, `CS_SRCA_A1, `CS_SRCB_D0,
		`CS_SHFT_OP___SL, `CS_A0_SRC_NONE, `CS_A1_SRC__ALU,
		`CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA,
		`CS_CMP_SEL_CFGA, /*CS_REG4 Comment:Shift */
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
		`SC_CMPB_A1_D1, `SC_CMPA_A1_D1, `SC_CI_B_CHAIN,
		`SC_CI_A_CHAIN, `SC_C1_MASK_DSBL, `SC_C0_MASK_DSBL,
		`SC_A_MASK_DSBL, `SC_DEF_SI_0, `SC_SI_B_CHAIN,
		`SC_SI_A_CHAIN, /*SC_REG6 Comment: */
		`SC_A0_SRC_ACC, `SC_SHIFT_SL, 1'b0,
		1'b0, `SC_FIFO1_BUS, `SC_FIFO0__A0,
		`SC_MSB_DSBL, `SC_MSB_BIT0, `SC_MSB_CHNED,
		`SC_FB_NOCHN, `SC_CMP1_CHNED,
		`SC_CMP0_CHNED, /*SC_REG7 Comment: */
		 10'h0, `SC_FIFO_CLK__DP,`SC_FIFO_CAP_AX,
		`SC_FIFO_LEVEL,`SC_FIFO__SYNC,`SC_EXTCRC_DSBL,
		`SC_WRK16CAT_DSBL /*SC_REG8 Comment: */
	})) Div(
		/*  input                   */  .clk(clk),
		/*  input   [02:00]         */  .cs_addr(state),
		/*  input                   */  .route_si(value),
		/*  input                   */  .route_ci(1'b0),
		/*  input                   */  .f0_load(1'b0),
		/*  input                   */  .f1_load(1'b0),
		/*  input                   */  .d0_load(1'b0),
		/*  input                   */  .d1_load(1'b0),
		/*  output  [01:00]         */  .ce0(),
		/*  output  [01:00]         */  .cl0(cl0),
		/*  output  [01:00]         */  .z0(),
		/*  output  [01:00]         */  .ff0(),
		/*  output  [01:00]         */  .ce1(),
		/*  output  [01:00]         */  .cl1(),
		/*  output  [01:00]         */  .z1(),
		/*  output  [01:00]         */  .ff1(),
		/*  output  [01:00]         */  .ov_msb(),
		/*  output  [01:00]         */  .co_msb(),
		/*  output  [01:00]         */  .cmsb(),
		/*  output  [01:00]         */  .so(),
		/*  output  [01:00]         */  .f0_bus_stat(),
		/*  output  [01:00]         */  .f0_blk_stat(),
		/*  output  [01:00]         */  .f1_bus_stat(),
		/*  output  [01:00]         */  .f1_blk_stat()
	);
endmodule