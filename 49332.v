module scsiTarget (
	output [7:0] DBx_out, // Active High, connected to SCSI bus via inverter
	output  REQ, // Active High, connected to SCSI bus via inverter
	input   nACK, // Active LOW, connected directly to SCSI bus.
	input  [7:0] nDBx_in, // Active LOW, connected directly to SCSI bus.
	input  nDBP, // Active LOW, connected directly to SCSI bus
	input   IO, // Active High, set by CPU via status register.
	input   nRST, // Active LOW, connected directly to SCSI bus.
	input   clk,
	output tx_intr,
	output rx_intr,
	output parityErr
);
//`#start body` -- edit after this line, do not edit this line
// Force Clock Sync
// The udb_clock_enable primitive component is used to indicate that the input
// clock must always be synchronous and if not implement synchronizers to make
// it synchronous.
wire op_clk;
cy_psoc3_udb_clock_enable_v1_0 #(.sync_mode(`TRUE)) ClkSync
(
    .clock_in(clk),
    .enable(1'b1),
    .clock_out(op_clk)
);
// CONSTANTS
localparam IO_WRITE = 1'b1;
localparam IO_READ = 1'b0;
// STATE MACHINE
// TX States:
// IDLE
//     Wait for an entry in the input FIFO
// FIFOLOAD
//     Load F0 into A0. Feed (old) A0 into the ALU SRCA.
// TX
//     Load data register from PO. PO is fed by A0 going into the ALU via SRCA
//     A0 must remain unchanged.
// DESKEW_INIT
//     DBx output signals will be output in this state
//     Load deskew clock count into A0 from D0
// DESKEW
//     DBx output signals will be output in this state
//     Wait for the SCSI deskew time of 55ns. (DEC A0).
//     A1 must be fed into SRCA, so PO is now useless.
// READY
//     REQ and DBx output signals will be output in this state
//     Wait for acknowledgement from the SCSI initiator
// RX
//     Wait for the initiator to release he ACK signal. Once released,
//     PI enabled for input into ALU "PASS" operation, storing into F1 in the
//     next state, either IDLE or FIFOLOAD.
// RX States:
// IDLE
//     Wait for a dummy "enabling" entry in the input FIFO
// FIFOLOAD
//     Load F0 into A0.
//     The input FIFO is used to control the number of bytes we attempt to
//     read from the SCSI bus.
// WAIT_TIL_READY
//     Wait for space in output fifo
// READY
//     REQ signal will be output in this state
//     Wait for the initiator to send a byte on the SCSI bus.
// RX
//     Wait for the initiator to release he ACK signal. Once released,
//     PI enabled for input into ALU "PASS" operation, storing into F1 in the
//     next state, either IDLE or FIFOLOAD.
localparam STATE_IDLE = 3'b000;
localparam STATE_FIFOLOAD = 3'b001;
localparam STATE_TX = 3'b010;
localparam STATE_DESKEW_INIT = 3'b011;
localparam STATE_DESKEW = 3'b100;
localparam STATE_WAIT_TIL_READY = 3'b101;
localparam STATE_READY = 3'b110;
localparam STATE_RX = 3'b111;
// state selects the datapath register.
reg[2:0] state;
// Data being read/written from/to the SCSI bus
reg[7:0] data;
// Set by the datapath zero detector (z1). High when A1 counts down to zero.
wire deskewComplete;
// Parallel input to the datapath SRCA.
// Selected for input through to the ALU if CFB EN bit set for the datapath
// state and enabled by PI DYN bit in CFG15-14
wire[7:0] pi;
// Parallel output from the selected SRCA value (A0 or A1) to the ALU.
wire[7:0] po;
// Set true to trigger storing A1 into F1. Set while in STATE_RX
reg fifoStore;
// Set to true on detecting a parity input while reading
reg parityErrReg;
// Temp values in parity calcs. We need to do it in 2 steps to avoid
// timing issues and running-out-of resources
reg[2:0] genParity;
reg REQReg;
reg[7:0] dbxInReg;
// Set Output Pins
assign REQ = REQReg; // STATE_READY & STATE_RX
assign DBx_out[7:0] = data;
assign pi[7:0] = dbxInReg[7:0];
assign parityErr = parityErrReg;
// FIFO Status Register
// Status Register: scsiTarget_StatusReg__STATUS_REG
//     Bit 0: Tx FIFO not full
//     Bit 1: Rx FIFO not empty
//     Bit 2: Tx FIFO empty
//     Bit 3: Rx FIFO full
//     Bit 4: TX Complete. Fifos empty and idle.
// TX FIFO Register: scsiTarget_scsiTarget_u0__F0_REG
// RX FIFO Register: scsiTarget_scsiTarget_u0__F1_REG
// Use with CY_GET_REG8 and CY_SET_REG8
wire f0_bus_stat;   // Tx FIFO not full
wire f0_blk_stat;	// Tx FIFO empty
wire f1_bus_stat;	// Rx FIFO not empty
wire f1_blk_stat;	// Rx FIFO full
wire txComplete = f0_blk_stat && (state == STATE_IDLE);
cy_psoc3_status #(.cy_force_order(1), .cy_md_select(8'h00)) StatusReg
(
	.clock(op_clk),
	.status({3'b0, txComplete, f1_blk_stat, f0_blk_stat, f1_bus_stat, f0_bus_stat})
);
// DMA outputs
assign tx_intr = f0_bus_stat;
//assign tx_intr = f0_blk_stat;
assign rx_intr = f1_bus_stat;
//assign rx_intr = f1_blk_stat;
// State machine
always @(posedge op_clk) begin
	case (state)
		STATE_IDLE:
		begin
			if (!nRST) state <= STATE_IDLE;
			else if (!f0_blk_stat) // Input FIFO has some data
				state <= STATE_FIFOLOAD;
			else
				state <= STATE_IDLE;
			// Clear our output pins
			data <= 8'b0;
			REQReg <= 1'b0;
			fifoStore <= 1'b0;
			parityErrReg <= 1'b0;
		end
		STATE_FIFOLOAD:
		begin
			fifoStore <= 1'b0;
			if (!nRST) state <= STATE_IDLE;
			else if (IO == IO_WRITE)
				state <= STATE_TX;
			// Note: Cannot check whether the output FIFO is not full
			// because we haven't finished writing to it yet.
			// causes a rare race condition issue on fast SCSI hosts
			else begin
				state <= STATE_WAIT_TIL_READY;
			end
		end
		STATE_TX:
		begin
			if (!nRST) state <= STATE_IDLE;
			else state <= STATE_DESKEW_INIT;
			data <= po;
		end
		STATE_DESKEW_INIT:
			if (!nRST) state <= STATE_IDLE;
			else state <= STATE_DESKEW;
		STATE_DESKEW:
			if (!nRST) state <= STATE_IDLE;
			else if(deskewComplete) begin
				state <= STATE_READY;
				REQReg <= 1'b1;
			end else state <= STATE_DESKEW;
		STATE_WAIT_TIL_READY: // IO == IO_READ only
			if (!nRST) state <= STATE_IDLE;
			// Wait until the output FIFO is not full.
			else if (!f1_blk_stat) begin
				state <= STATE_READY;
				REQReg <= 1'b1;
			end else begin
				state <= STATE_WAIT_TIL_READY;
			end
		STATE_READY:
			if (!nRST) state <= STATE_IDLE;
			else if (~nACK) begin
				REQReg <= 1'b0;
				state <= STATE_RX;
				dbxInReg[7:0] = ~nDBx_in[7:0]; // Invert active low scsi bus
				genParity[0] <= (~nDBP) ^ 1'b1 ^ ~nDBx_in[7] ^ ~nDBx_in[6];
				genParity[1] <= ~nDBx_in[5] ^ ~nDBx_in[4] ^ ~nDBx_in[3];
				genParity[2] <= ~nDBx_in[2] ^ ~nDBx_in[1] ^ ~nDBx_in[0];
			end else state <= STATE_READY;
		STATE_RX:
		begin
			// Wait for this transfer to complete.
			// We need to wait at the end, because some hosts will set ACK
			// before REQ for the first byte of a phase.
			if (!nRST) state <= STATE_IDLE;
			else if (nACK && !f0_blk_stat)
			begin // Next byte is ready, skip IDLE.
				fifoStore <= 1'b1;
				state <= STATE_FIFOLOAD;
			end
			else if (nACK)
			begin
				fifoStore <= 1'b1;
				state <= STATE_IDLE;
			end
			else
				state <= STATE_RX;
			parityErrReg <= 1'b0;
			if (IO == IO_READ) begin
				parityErrReg <= ^genParity[2:0];
			end
		end
		default: state <= STATE_IDLE;
	endcase
end
// D0 is used for the deskew count.
// The data output is valid during the DESKEW_INIT phase as well,
// so we subtract 1.
// SCSI-1 deskew + cable skew = 55ns
// D0 = [0.000000055 / (1 / clk)] - 1 = 1 (clk = 25MHz)
// SCSI-2 FAST deskew + cable skew = 25ns
// D0 = [0.000000025 / (1 / clk)] - 1 = 0 (clk = 25MHz)
cy_psoc3_dp #(.d0_init(1),
.cy_dpconfig(
{
    `CS_ALU_OP_PASS, `CS_SRCA_A0, `CS_SRCB_D0,
    `CS_SHFT_OP_PASS, `CS_A0_SRC_NONE, `CS_A1_SRC_NONE,
    `CS_FEEDBACK_ENBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA,
    `CS_CMP_SEL_CFGA, /*CFGRAM0:            IDLE*/
    `CS_ALU_OP_PASS, `CS_SRCA_A0, `CS_SRCB_D0,
    `CS_SHFT_OP_PASS, `CS_A0_SRC___F0, `CS_A1_SRC_NONE,
    `CS_FEEDBACK_ENBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA,
    `CS_CMP_SEL_CFGA, /*CFGRAM1:            FIFO Load*/
    `CS_ALU_OP_PASS, `CS_SRCA_A0, `CS_SRCB_D0,
    `CS_SHFT_OP_PASS, `CS_A0_SRC_NONE, `CS_A1_SRC_NONE,
    `CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA,
    `CS_CMP_SEL_CFGA, /*CFGRAM2:            TX*/
    `CS_ALU_OP_PASS, `CS_SRCA_A0, `CS_SRCB_D0,
    `CS_SHFT_OP_PASS, `CS_A0_SRC___D0, `CS_A1_SRC_NONE,
    `CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA,
    `CS_CMP_SEL_CFGA, /*CFGRAM3:            DESKEW INIT*/
    `CS_ALU_OP__DEC, `CS_SRCA_A0, `CS_SRCB_D0,
    `CS_SHFT_OP_PASS, `CS_A0_SRC__ALU, `CS_A1_SRC_NONE,
    `CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA,
    `CS_CMP_SEL_CFGA, /*CFGRAM4:            DESKEW*/
    `CS_ALU_OP_PASS, `CS_SRCA_A0, `CS_SRCB_D0,
    `CS_SHFT_OP_PASS, `CS_A0_SRC_NONE, `CS_A1_SRC_NONE,
    `CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA,
    `CS_CMP_SEL_CFGA, /*CFGRAM5:  WAIT TIL READY*/
    `CS_ALU_OP_PASS, `CS_SRCA_A0, `CS_SRCB_D0,
    `CS_SHFT_OP_PASS, `CS_A0_SRC_NONE, `CS_A1_SRC_NONE,
    `CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA,
    `CS_CMP_SEL_CFGA, /*CFGRAM6:            READY*/
    `CS_ALU_OP_PASS, `CS_SRCA_A0, `CS_SRCB_D0,
    `CS_SHFT_OP_PASS, `CS_A0_SRC_NONE, `CS_A1_SRC_NONE,
    `CS_FEEDBACK_ENBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA,
    `CS_CMP_SEL_CFGA, /*CFGRAM7:            RX*/
    8'hFF, 8'h00,  /*CFG9:               */
    8'hFF, 8'hFF,  /*CFG11-10:               */
    `SC_CMPB_A1_D1, `SC_CMPA_A1_D1, `SC_CI_B_ARITH,
    `SC_CI_A_ARITH, `SC_C1_MASK_DSBL, `SC_C0_MASK_DSBL,
    `SC_A_MASK_DSBL, `SC_DEF_SI_0, `SC_SI_B_DEFSI,
    `SC_SI_A_DEFSI, /*CFG13-12:               */
    `SC_A0_SRC_ACC, `SC_SHIFT_SL, `SC_PI_DYN_EN,
    1'h0, `SC_FIFO1_ALU, `SC_FIFO0_BUS,
    `SC_MSB_DSBL, `SC_MSB_BIT0, `SC_MSB_NOCHN,
    `SC_FB_NOCHN, `SC_CMP1_NOCHN,
    `SC_CMP0_NOCHN, /*CFG15-14:               */
    10'h00, `SC_FIFO_CLK__DP,`SC_FIFO_CAP_AX,
    `SC_FIFO_LEVEL,`SC_FIFO__SYNC,`SC_EXTCRC_DSBL,
    `SC_WRK16CAT_DSBL /*CFG17-16:               */
}
)) datapath(
        /*  input                   */  .reset(1'b0),
        /*  input                   */  .clk(op_clk),
        /*  input   [02:00]         */  .cs_addr(state),
        /*  input                   */  .route_si(1'b0),
        /*  input                   */  .route_ci(1'b0),
        /*  input                   */  .f0_load(1'b0),
        /*  input                   */  .f1_load(fifoStore),
        /*  input                   */  .d0_load(1'b0),
        /*  input                   */  .d1_load(1'b0),
        /*  output                  */  .ce0(),
        /*  output                  */  .cl0(),
        /*  output                  */  .z0(deskewComplete),
        /*  output                  */  .ff0(),
        /*  output                  */  .ce1(),
        /*  output                  */  .cl1(),
        /*  output                  */  .z1(),
        /*  output                  */  .ff1(),
        /*  output                  */  .ov_msb(),
        /*  output                  */  .co_msb(),
        /*  output                  */  .cmsb(),
        /*  output                  */  .so(),
        /*  output                  */  .f0_bus_stat(f0_bus_stat),
        /*  output                  */  .f0_blk_stat(f0_blk_stat),
        /*  output                  */  .f1_bus_stat(f1_bus_stat),
        /*  output                  */  .f1_blk_stat(f1_blk_stat),
        /* input                    */  .ci(1'b0),     // Carry in from previous stage
        /* output                   */  .co(),         // Carry out to next stage
        /* input                    */  .sir(1'b0),    // Shift in from right side
        /* output                   */  .sor(),        // Shift out to right side
        /* input                    */  .sil(1'b0),    // Shift in from left side
        /* output                   */  .sol(),        // Shift out to left side
        /* input                    */  .msbi(1'b0),   // MSB chain in
        /* output                   */  .msbo(),       // MSB chain out
        /* input [01:00]            */  .cei(2'b0),    // Compare equal in from prev stage
        /* output [01:00]           */  .ceo(),        // Compare equal out to next stage
        /* input [01:00]            */  .cli(2'b0),    // Compare less than in from prv stage
        /* output [01:00]           */  .clo(),        // Compare less than out to next stage
        /* input [01:00]            */  .zi(2'b0),     // Zero detect in from previous stage
        /* output [01:00]           */  .zo(),         // Zero detect out to next stage
        /* input [01:00]            */  .fi(2'b0),     // 0xFF detect in from previous stage
        /* output [01:00]           */  .fo(),         // 0xFF detect out to next stage
        /* input [01:00]            */  .capi(2'b0),   // Software capture from previous stage
        /* output [01:00]           */  .capo(),       // Software capture to next stage
        /* input                    */  .cfbi(1'b0),   // CRC Feedback in from previous stage
        /* output                   */  .cfbo(),       // CRC Feedback out to next stage
        /* input [07:00]            */  .pi(pi),     // Parallel data port
        /* output [07:00]           */  .po(po)          // Parallel data port
);
//`#end` -- edit above this line, do not edit this line
endmodule