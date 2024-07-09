module DivNorNPlus1 (
	clkout,
	start,
	clk,
	delta
);
	output  clkout;
	output  start;
	input   clk;
	input   delta;
	wire ce0;
	wire ce1;
	reg deltaReg;
	reg [1:0] state;
	reg clkout;
	localparam DIVNORNPLUS1_STATE_CLEAR 	= 2'd0;
	localparam DIVNORNPLUS1_STATE_EXTEND 	= 2'd1;
	localparam DIVNORNPLUS1_STATE_INC0	 	= 2'd2;
	localparam DIVNORNPLUS1_STATE_INC1	 	= 2'd3;
	assign start = ce1;
//	assign clkout = (state != DIVNORNPLUS1_STATE_INC1);
	always @(posedge clk)
	begin
		clkout <= ~(state != DIVNORNPLUS1_STATE_INC1);
	end
	always @(posedge clk)
	begin
		case (state)
			DIVNORNPLUS1_STATE_CLEAR:
				if (deltaReg) state <= DIVNORNPLUS1_STATE_EXTEND;
				else state <= DIVNORNPLUS1_STATE_INC0;
			DIVNORNPLUS1_STATE_EXTEND:
				state <= DIVNORNPLUS1_STATE_INC0;
			DIVNORNPLUS1_STATE_INC0:
				if (ce0) state <= DIVNORNPLUS1_STATE_INC1;
			DIVNORNPLUS1_STATE_INC1:
				if (ce1)
				begin
					state <= DIVNORNPLUS1_STATE_CLEAR;
					deltaReg <= delta;
				end
			default:
				state <= DIVNORNPLUS1_STATE_CLEAR;
		endcase
	end
	// 8-Bit Datapath
	cy_psoc3_dp8 #(.cy_dpconfig_a(
	{
		`CS_ALU_OP__XOR, `CS_SRCA_A0, `CS_SRCB_A0,
		`CS_SHFT_OP_PASS, `CS_A0_SRC__ALU, `CS_A1_SRC_NONE,
		`CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA,
		`CS_CMP_SEL_CFGA, /*CS_REG0 Comment:Clear */
		`CS_ALU_OP_PASS, `CS_SRCA_A0, `CS_SRCB_D0,
		`CS_SHFT_OP_PASS, `CS_A0_SRC_NONE, `CS_A1_SRC_NONE,
		`CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA,
		`CS_CMP_SEL_CFGA, /*CS_REG1 Comment:Extend */
		`CS_ALU_OP__INC, `CS_SRCA_A0, `CS_SRCB_D0,
		`CS_SHFT_OP_PASS, `CS_A0_SRC__ALU, `CS_A1_SRC_NONE,
		`CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA,
		`CS_CMP_SEL_CFGA, /*CS_REG2 Comment:Inc0 */
		`CS_ALU_OP__INC, `CS_SRCA_A0, `CS_SRCB_D0,
		`CS_SHFT_OP_PASS, `CS_A0_SRC__ALU, `CS_A1_SRC_NONE,
		`CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA,
		`CS_CMP_SEL_CFGA, /*CS_REG3 Comment:Inc1 */
		`CS_ALU_OP_PASS, `CS_SRCA_A0, `CS_SRCB_D0,
		`CS_SHFT_OP_PASS, `CS_A0_SRC_NONE, `CS_A1_SRC_NONE,
		`CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA,
		`CS_CMP_SEL_CFGA, /*CS_REG4 Comment: */
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
		`SC_CMPB_A0_D1, `SC_CMPA_A0_D1, `SC_CI_B_ARITH,
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
	})) Div(
		/*  input                   */  .clk(clk),
		/*  input   [02:00]         */  .cs_addr({1'b0, state}),
		/*  input                   */  .route_si(1'b0),
		/*  input                   */  .route_ci(1'b0),
		/*  input                   */  .f0_load(1'b0),
		/*  input                   */  .f1_load(1'b0),
		/*  input                   */  .d0_load(1'b0),
		/*  input                   */  .d1_load(1'b0),
		/*  output                  */  .ce0(ce0),
		/*  output                  */  .cl0(),
		/*  output                  */  .z0(),
		/*  output                  */  .ff0(),
		/*  output                  */  .ce1(ce1),
		/*  output                  */  .cl1(),
		/*  output                  */  .z1(),
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