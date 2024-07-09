module mig_7series_v1_9_iodelay_ctrl #
  (
   parameter TCQ              = 100,
                                // clk->out delay (sim only)
   parameter IODELAY_GRP      = "IODELAY_MIG",
                                // May be assigned unique name when
                                // multiple IP cores used in design
   parameter REFCLK_TYPE      = "DIFFERENTIAL",
                                // Reference clock type
                                // "DIFFERENTIAL","SINGLE_ENDED"
                                // NO_BUFFER, USE_SYSTEM_CLOCK
   parameter SYSCLK_TYPE      = "DIFFERENTIAL",
                                // input clock type
                                // DIFFERENTIAL, SINGLE_ENDED,
                                // NO_BUFFER
   parameter SYS_RST_PORT     = "FALSE",
                                // "TRUE" - if pin is selected for sys_rst
				//          and IBUF will be instantiated.
                                // "FALSE" - if pin is not selected for sys_rst
   parameter RST_ACT_LOW      = 1,
                                // Reset input polarity
                                // (0 = active high, 1 = active low)
   parameter DIFF_TERM_REFCLK = "TRUE"
                               // Differential Termination
   )
  (
   input  clk_ref_p,
   input  clk_ref_n,
   input  clk_ref_i,
   input  sys_rst,
   output clk_ref,
   output sys_rst_o,
   output iodelay_ctrl_rdy,
	output rst_tmp_idelay,
	output rst_ref,
	input  pll_locked
   );
  // # of clock cycles to delay deassertion of reset. Needs to be a fairly
  // high number not so much for metastability protection, but to give time
  // for reset (i.e. stable clock cycles) to propagate through all state
  // machines and to all control signals (i.e. not all control signals have
  // resets, instead they rely on base state logic being reset, and the effect
  // of that reset propagating through the logic). Need this because we may not
  // be getting stable clock cycles while reset asserted (i.e. since reset
  // depends on DCM lock status)
  // COMMENTED, RC, 01/13/09 - causes pack error in MAP w/ larger #
  localparam RST_SYNC_NUM = 15;
    //localparam RST_SYNC_NUM = 25;
  wire                   clk_ref_bufg;
  wire                   clk_ref_ibufg;
  wire                   rst_ref;
  (* keep = "true", max_fanout = 10 *) reg [RST_SYNC_NUM-1:0] rst_ref_sync_r /* synthesis syn_maxfan = 10 */;
//  wire                   rst_tmp_idelay;
  wire                   sys_rst_act_hi;
  // If the pin is selected for sys_rst in GUI, IBUF will be instantiated.
  // If the pin is not selected in GUI, sys_rst signal is expected to be
  // driven internally.
  generate
    if (SYS_RST_PORT == "TRUE")
      IBUF u_sys_rst_ibuf
        (
         .I (sys_rst),
         .O (sys_rst_o)
         );
    else
      assign sys_rst_o = sys_rst;
  endgenerate
  // Possible inversion of system reset as appropriate
  assign  sys_rst_act_hi = RST_ACT_LOW ? ~sys_rst_o: sys_rst_o;
  // 1) Input buffer for IDELAYCTRL reference clock - handle either a
  //    differential or single-ended input. Global clock buffer is used to
  //    drive the rest of FPGA logic.
  // 2) For NO_BUFFER option, Reference clock will be driven from internal
  //    clock i.e., clock is driven from fabric. Input buffers and Global
  //    clock buffers will not be instaitaed.
  // 3) For USE_SYSTEM_CLOCK, input buffer output of system clock will be used
  //    as the input reference clock. Global clock buffer is used to drive
  //    the rest of FPGA logic.
  generate
    if (REFCLK_TYPE == "DIFFERENTIAL") begin: diff_clk_ref
      IBUFGDS #
        (
         .DIFF_TERM    (DIFF_TERM_REFCLK),
         .IBUF_LOW_PWR ("FALSE")
         )
        u_ibufg_clk_ref
          (
           .I  (clk_ref_p),
           .IB (clk_ref_n),
           .O  (clk_ref_ibufg)
           );
      BUFG u_bufg_clk_ref
        (
         .O (clk_ref_bufg),
         .I (clk_ref_ibufg)
         );
    end else if (REFCLK_TYPE == "SINGLE_ENDED") begin : se_clk_ref
      IBUFG #
        (
         .IBUF_LOW_PWR ("FALSE")
         )
        u_ibufg_clk_ref
          (
           .I (clk_ref_i),
           .O (clk_ref_ibufg)
           );
      BUFG u_bufg_clk_ref
        (
         .O (clk_ref_bufg),
         .I (clk_ref_ibufg)
         );
    end else if ((REFCLK_TYPE == "NO_BUFFER") ||
                 (REFCLK_TYPE == "USE_SYSTEM_CLOCK" && SYSCLK_TYPE == "NO_BUFFER")) begin : clk_ref_noibuf_nobuf
      assign clk_ref_bufg = clk_ref_i;
    end else if (REFCLK_TYPE == "USE_SYSTEM_CLOCK" && SYSCLK_TYPE != "NO_BUFFER") begin : clk_ref_noibuf
      BUFG u_bufg_clk_ref
        (
         .O (clk_ref_bufg),
         .I (clk_ref_i)
         );
    end
  endgenerate
  // Global clock buffer for IDELAY reference clock
  assign clk_ref = clk_ref_bufg;
  // IDELAYCTRL reset
  // This assumes an external clock signal driving the IDELAYCTRL
  // blocks. Otherwise, if a PLL drives IDELAYCTRL, then the PLL
  // lock signal will need to be incorporated in this.
  // Add PLL lock if PLL drives IDELAYCTRL in user design
  assign rst_tmp_idelay = sys_rst_act_hi | (~pll_locked);
  always @(posedge clk_ref_bufg or posedge rst_tmp_idelay)
    if (rst_tmp_idelay)
      rst_ref_sync_r <= #TCQ {RST_SYNC_NUM{1'b1}};
    else
      rst_ref_sync_r <= #TCQ rst_ref_sync_r << 1;
  assign rst_ref  = rst_ref_sync_r[RST_SYNC_NUM-1];
  (* IODELAY_GROUP = IODELAY_GRP *) IDELAYCTRL u_idelayctrl
    (
     .RDY    (iodelay_ctrl_rdy),
     .REFCLK (clk_ref_bufg),
     .RST    (rst_ref)
     );
//wire	[35:0]	CONTROL0;
//ddr3_icon ddr3_icon_inst (
//    .CONTROL0(CONTROL0) // INOUT BUS [35:0]
//);
//ddr3_ila ddr3_ila_inst (
//    .CONTROL(CONTROL0), // INOUT BUS [35:0]
//    .CLK(clk_ref_bufg), // IN
//    .TRIG0({
//			rst_ref_sync_r,
//			sys_rst_act_hi,
//			rst_tmp_idelay,
//			iodelay_ctrl_rdy,
//			rst_ref,
//			pll_locked
//			}) // IN BUS [31:0]
//);
endmodule