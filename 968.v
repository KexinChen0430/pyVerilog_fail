module byte_lane #(
// these are used to scale the index into phaser,calib,scan,mc vectors
// to access fields used in this instance
      parameter ABCD                            = "A", // A,B,C, or D
      parameter PO_DATA_CTL                     = "FALSE",
      parameter BITLANES                        = 12'b1111_1111_1111,
      parameter BITLANES_OUTONLY                = 12'b0000_0000_0000,
      parameter DIFFERENTIAL_DQS                = "TRUE",
      parameter GENERATE_DDR_CK                 = "B",
      parameter NUM_DDR_CK                      = 1,
      parameter RCLK_SELECT_LANE                = "B",
      parameter MC_DIVIDE                       = 4,
//OUT_FIFO
      parameter OF_ALMOST_EMPTY_VALUE           = 1,
      parameter OF_ALMOST_FULL_VALUE            = 1,
      parameter OF_ARRAY_MODE                   = "UNDECLARED",
      parameter OF_OUTPUT_DISABLE               = "TRUE",
      parameter OF_SYNCHRONOUS_MODE             = "TRUE",
//IN_FIFO
      parameter IF_ALMOST_EMPTY_VALUE           = 1,
      parameter IF_ALMOST_FULL_VALUE            = 1,
      parameter IF_ARRAY_MODE                   = "UNDECLARED",
      parameter IF_SYNCHRONOUS_MODE             = "TRUE",
//PHASER_IN
      parameter PI_BURST_MODE                   = "TRUE",
      parameter PI_CLKOUT_DIV                   = 2,
      parameter PI_FREQ_REF_DIV                 = "NONE",
      parameter PI_FINE_DELAY                   = 1,
      parameter PI_OUTPUT_CLK_SRC               = "DELAYED_REF" , //"DELAYED_REF",
      parameter PI_SYNC_IN_DIV_RST              = "FALSE",
//PHASER_OUT
      parameter PO_CLKOUT_DIV                   = (PO_DATA_CTL == "FALSE") ? 4 :  2,
      parameter PO_FINE_DELAY                   = 0,
      parameter PO_COARSE_BYPASS                = "FALSE",
      parameter PO_COARSE_DELAY                 = 0,
      parameter PO_OCLK_DELAY                   = 0,
      parameter PO_OCLKDELAY_INV                = "TRUE",
      parameter PO_OUTPUT_CLK_SRC               = "DELAYED_REF",
      parameter PO_SYNC_IN_DIV_RST              = "FALSE",
//    OSERDES
      parameter OSERDES_DATA_RATE               = "UNDECLARED",
      parameter OSERDES_DATA_WIDTH              = "UNDECLARED",
//IDELAY
      parameter IDELAYE2_IDELAY_TYPE            = "VARIABLE",
      parameter IDELAYE2_IDELAY_VALUE           = 00,
      parameter  IODELAY_GRP                    = "IODELAY_MIG",
      parameter real   TCK                      = 0.00,
// local constants, do not pass in from above
      parameter BUS_WIDTH                       =  12,
      parameter MSB_BURST_PEND_PO               =  3,
      parameter MSB_BURST_PEND_PI               =  7,
      parameter MSB_RANK_SEL_I                  =  MSB_BURST_PEND_PI+ 8,
      parameter MSB_RANK_SEL_O                  =  MSB_RANK_SEL_I   + 8,
      parameter MSB_DIV_RST                     =  MSB_RANK_SEL_O   + 1,
      parameter MSB_PHASE_SELECT                =  MSB_DIV_RST      + 1,
      parameter MSB_BURST_PI                    =  MSB_PHASE_SELECT + 4,
      parameter PHASER_CTL_BUS_WIDTH            =  MSB_BURST_PI     + 1,
      parameter LP_DDR_CK_WIDTH                 =  2
    )(
      input                        rst,
      input                        phy_clk,
      input                        freq_refclk,
      input                        mem_refclk,
      input                        idelayctrl_refclk,
      input                        sync_pulse,
      output [BUS_WIDTH-1:0]       mem_dq_out,
      output [BUS_WIDTH-1:0]       mem_dq_ts,
      input  [9:0]                 mem_dq_in,
      output                       mem_dqs_out,
      output                       mem_dqs_ts,
      input                        mem_dqs_in,
      output [NUM_DDR_CK*LP_DDR_CK_WIDTH-1:0] ddr_ck_out,
      output                       rclk,
      output                       if_a_empty,
      output                       if_empty,
      output                       if_a_full,
      output                       if_full,
      output                       of_a_empty,
      output                       of_empty,
      output                       of_a_full,
      output                       of_full,
      output [79:0]                phy_din,
      input  [79:0]                phy_dout,
      input                        phy_cmd_wr_en,
      input                        phy_data_wr_en,
      input                        phy_rd_en,
      input [PHASER_CTL_BUS_WIDTH-1:0] phaser_ctl_bus,
      input                        idelay_inc,
      input                        idelay_ce,
      input                        idelay_ld,
      output                       po_coarse_overflow,
      output                       po_fine_overflow,
      output [8:0]                 po_counter_read_val,
      input                        po_fine_enable,
      input                        po_coarse_enable,
      input  [1:0]                 po_en_calib,
      input                        po_fine_inc,
      input                        po_coarse_inc,
      input                        po_counter_load_en,
      input                        po_counter_read_en,
      input                        po_sel_fine_oclk_delay,
      input  [8:0]                 po_counter_load_val,
      input  [1:0]                 pi_en_calib,
      input                        pi_rst_dqs_find,
      input                        pi_fine_enable,
      input                        pi_fine_inc,
      input                        pi_counter_load_en,
      input                        pi_counter_read_en,
      input  [5:0]                 pi_counter_load_val,
      output wire                  pi_iserdes_rst,
      output                       pi_phase_locked,
      output                       pi_fine_overflow,
      output [5:0]                 pi_counter_read_val,
      output wire                  pi_dqs_found,
      output                       dqs_out_of_range
);
localparam  PHASER_INDEX =
                      (ABCD=="B" ? 1 : (ABCD == "C") ? 2 : (ABCD == "D" ? 3 : 0));
localparam   L_OF_ARRAY_MODE =
              (OF_ARRAY_MODE != "UNDECLARED") ? OF_ARRAY_MODE :
                      ((PO_DATA_CTL == "FALSE" ) || (MC_DIVIDE == 2)) ?  "ARRAY_MODE_4_X_4" : "ARRAY_MODE_8_X_4";
localparam   L_IF_ARRAY_MODE =
              (IF_ARRAY_MODE != "UNDECLARED") ? IF_ARRAY_MODE :
                      (MC_DIVIDE == 2) ? "ARRAY_MODE_4_X_4" : "ARRAY_MODE_4_X_8" ;
localparam   L_OSERDES_DATA_RATE  = (OSERDES_DATA_RATE != "UNDECLARED")  ? OSERDES_DATA_RATE :  ((PO_DATA_CTL == "FALSE" ) && (MC_DIVIDE == 4) ? "SDR" : "DDR") ;
localparam   L_OSERDES_DATA_WIDTH = (OSERDES_DATA_WIDTH != "UNDECLARED") ? OSERDES_DATA_WIDTH : 4;
localparam   real FREQ_REF_PER_NS = TCK > 2500.0 ? TCK/2/1000.0 : TCK/1000.0;
wire [1:0]                         oserdes_dqs;
wire [1:0]                         oserdes_dqs_ts;
wire [1:0]                         oserdes_dq_ts;
wire [3:0]                         of_q9;
wire [3:0]                         of_q8;
wire [3:0]                         of_q7;
wire [7:0]                         of_q6;
wire [7:0]                         of_q5;
wire [3:0]                         of_q4;
wire [3:0]                         of_q3;
wire [3:0]                         of_q2;
wire [3:0]                         of_q1;
wire [3:0]                         of_q0;
wire [7:0]                         of_d9;
wire [7:0]                         of_d8;
wire [7:0]                         of_d7;
wire [7:0]                         of_d6;
wire [7:0]                         of_d5;
wire [7:0]                         of_d4;
wire [7:0]                         of_d3;
wire [7:0]                         of_d2;
wire [7:0]                         of_d1;
wire [7:0]                         of_d0;
wire [7:0]                         if_q9;
wire [7:0]                         if_q8;
wire [7:0]                         if_q7;
wire [7:0]                         if_q6;
wire [7:0]                         if_q5;
wire [7:0]                         if_q4;
wire [7:0]                         if_q3;
wire [7:0]                         if_q2;
wire [7:0]                         if_q1;
wire [7:0]                         if_q0;
wire [3:0]                         if_d9;
wire [3:0]                         if_d8;
wire [3:0]                         if_d7;
wire [3:0]                         if_d6;
wire [3:0]                         if_d5;
wire [3:0]                         if_d4;
wire [3:0]                         if_d3;
wire [3:0]                         if_d2;
wire [3:0]                         if_d1;
wire [3:0]                         if_d0;
wire [3:0]                         dummy_i5;
wire [3:0]                         dummy_i6;
wire [48-1:0]                      of_dqbus;
wire [10*4-1:0]                    iserdes_dout;
wire                               iserdes_clk;
wire                               iserdes_clkdiv;
wire ififo_wr_enable;
wire phy_rd_en_;
wire                               dqs_to_phaser;
wire                               phy_wr_en = ( PO_DATA_CTL == "FALSE" ) ? phy_cmd_wr_en  : phy_data_wr_en;
wire                               if_empty_;
wire                               if_a_empty_;
wire                               if_full_;
wire                               if_a_full_;
wire                               of_full_;
wire                               of_a_full_;
wire                               oserdes_rst;
wire                               empty_post_fifo;
reg                                if_empty_r;
wire [79:0]                        rd_data;
reg [79:0]                         rd_data_r;
wire  reset_dqs_find = rst | pi_rst_dqs_find;
wire ififo_rst = pi_rst_dqs_find | pi_iserdes_rst;
wire ofifo_rst = (pi_rst_dqs_find & PO_DATA_CTL == "TRUE") | oserdes_rst;
// IN_FIFO EMPTY->RDEN TIMING FIX:
// Always read from IN_FIFO - it doesn't hurt to read from an empty FIFO
// since the IN_FIFO read pointers are not incr'ed when the FIFO is empty
assign #(25) phy_rd_en_ = 1'b1;
generate
if ( PO_DATA_CTL == "FALSE" ) begin : if_empty_null
    assign if_empty = 0;
    assign if_a_empty = 0;
    assign if_full = 0;
    assign if_a_full = 0;
end
else begin : if_empty_gen
    assign if_empty   = empty_post_fifo;  // Use output of timing fix logic
    assign if_a_empty = if_a_empty_;
    assign if_full    = if_full_;
    assign if_a_full  = if_a_full_;
end
endgenerate
generate
if ( PO_DATA_CTL == "FALSE" ) begin : dq_gen_48
   assign of_dqbus[48-1:0] = {of_q6[7:4], of_q5[7:4], of_q9, of_q8, of_q7, of_q6[3:0], of_q5[3:0], of_q4, of_q3, of_q2, of_q1, of_q0};
   assign phy_din =  80'h0;
end
else begin : dq_gen_40
   assign of_dqbus[40-1:0] = {of_q9, of_q8, of_q7, of_q6[3:0], of_q5[3:0], of_q4, of_q3, of_q2, of_q1, of_q0};
   // IN_FIFO EMPTY->RDEN TIMING FIX:
   assign rd_data =  {if_q9, if_q8, if_q7, if_q6, if_q5, if_q4, if_q3, if_q2, if_q1, if_q0};
   always @(posedge phy_clk) begin
      rd_data_r   <= #(025) rd_data;
      if_empty_r  <= #(025) if_empty_;
   end
   if_post_fifo #
     (
      .TCQ   (25),    // simulation CK->Q delay
      .DEPTH (2),     // depth - account for up to 2 cycles of skew
      .WIDTH (80)     // width
      )
     if_post_fifo
       (
        .clk       (phy_clk),
        .rst       (ififo_rst),
        .empty_in  (if_empty_r),
        .rd_en_in  (phy_rd_en),
        .d_in      (rd_data_r),
        .empty_out (empty_post_fifo),
        .d_out     (phy_din)
        );
end
endgenerate
assign { if_d9, if_d8, if_d7, if_d6, if_d5, if_d4, if_d3, if_d2, if_d1, if_d0} = iserdes_dout;
wire [1:0] rank_sel_i  = ((phaser_ctl_bus[MSB_RANK_SEL_I :MSB_RANK_SEL_I -7] >> (PHASER_INDEX << 1)) & 2'b11);
wire [1:0]  rank_sel_o = ((phaser_ctl_bus[MSB_RANK_SEL_O :MSB_RANK_SEL_O -7] >> (PHASER_INDEX << 1)) & 2'b11);
`ifdef FUJI_PHY_BLH
B_PHASER_IN_PHY #(
`else
PHASER_IN_PHY #(
`endif
  .BURST_MODE                       ( PI_BURST_MODE),
  .CLKOUT_DIV                       ( PI_CLKOUT_DIV),
  .FINE_DELAY                       ( PI_FINE_DELAY),
  .FREQ_REF_DIV                     ( PI_FREQ_REF_DIV),
  .OUTPUT_CLK_SRC                   ( PI_OUTPUT_CLK_SRC),
  .SYNC_IN_DIV_RST                  ( PI_SYNC_IN_DIV_RST),
  .REFCLK_PERIOD                    ( FREQ_REF_PER_NS)
) phaser_in (
  .DQSFOUND                         (pi_dqs_found),
  .DQSOUTOFRANGE                    (dqs_out_of_range),
  .FINEOVERFLOW                     (pi_fine_overflow),
  .PHASELOCKED                      (pi_phase_locked),
  .ISERDESRST                       (pi_iserdes_rst),
  .ICLKDIV                          (iserdes_clkdiv),
  .ICLK                             (iserdes_clk),
  .COUNTERREADVAL                   (pi_counter_read_val),
  .RCLK                             (rclk),
  .WRENABLE                         (ififo_wr_enable),
  .BURSTPENDINGPHY                  (phaser_ctl_bus[MSB_BURST_PEND_PI - 3 + PHASER_INDEX]),
  .ENCALIBPHY                       (pi_en_calib),
  .FINEENABLE                       (pi_fine_enable),
  .FREQREFCLK                       (freq_refclk),
  .MEMREFCLK                        (mem_refclk),
  .RANKSELPHY                       (rank_sel_i),
  .PHASEREFCLK                      (dqs_to_phaser),
  .RSTDQSFIND                       (pi_rst_dqs_find),
  .RST                              (rst),
  .FINEINC                          (pi_fine_inc),
  .COUNTERLOADEN                    (pi_counter_load_en),
  .COUNTERREADEN                    (pi_counter_read_en),
  .COUNTERLOADVAL                   (pi_counter_load_val),
  .SYNCIN                           (sync_pulse),
  .SYSCLK                           (phy_clk)
);
wire  #0 phase_ref = freq_refclk;
wire oserdes_clk;
`ifdef FUJI_PHY_BLH
B_PHASER_OUT_PHY #(
`else
PHASER_OUT_PHY #(
`endif
  .CLKOUT_DIV                        ( PO_CLKOUT_DIV),
  .DATA_CTL_N                        ( PO_DATA_CTL ),
  .FINE_DELAY                        ( PO_FINE_DELAY),
  .COARSE_BYPASS                     ( PO_COARSE_BYPASS ),
  .COARSE_DELAY                      ( PO_COARSE_DELAY),
  .OCLK_DELAY                        ( PO_OCLK_DELAY),
  .OCLKDELAY_INV                     ( PO_OCLKDELAY_INV),
  .OUTPUT_CLK_SRC                    ( PO_OUTPUT_CLK_SRC),
  .SYNC_IN_DIV_RST                   ( PO_SYNC_IN_DIV_RST),
  .REFCLK_PERIOD                     ( FREQ_REF_PER_NS)
) phaser_out (
  .COARSEOVERFLOW                    (po_coarse_overflow),
  .CTSBUS                            (oserdes_dqs_ts),
  .DQSBUS                            (oserdes_dqs),
  .DTSBUS                            (oserdes_dq_ts),
  .FINEOVERFLOW                      (po_fine_overflow),
  .OCLKDIV                           (oserdes_clkdiv),
  .OCLK                              (oserdes_clk),
  .OCLKDELAYED                       (oserdes_clk_delayed),
  .COUNTERREADVAL                    (po_counter_read_val),
  .BURSTPENDINGPHY                   (phaser_ctl_bus[MSB_BURST_PEND_PO -3 + PHASER_INDEX]),
  .ENCALIBPHY                        (po_en_calib),
  .RDENABLE                          (po_rd_enable),
  .FREQREFCLK                        (freq_refclk),
  .MEMREFCLK                         (mem_refclk),
  .PHASEREFCLK                       (/*phase_ref*/),
  .RST                               (rst),
  .OSERDESRST                        (oserdes_rst),
  .COARSEENABLE                      (po_coarse_enable),
  .FINEENABLE                        (po_fine_enable),
  .COARSEINC                         (po_coarse_inc),
  .FINEINC                           (po_fine_inc),
  .SELFINEOCLKDELAY                  (po_sel_fine_oclk_delay),
  .COUNTERLOADEN                     (po_counter_load_en),
  .COUNTERREADEN                     (po_counter_read_en),
  .COUNTERLOADVAL                    (po_counter_load_val),
  .SYNCIN                            (sync_pulse),
  .SYSCLK                            (phy_clk)
);
// Model skew going to individual IN_FIFOs - enabled only if
// TEST_MODE is define
reg skewd_ififo_wr_enable;
reg skewd_phy_rd_en_;
reg [3:0] skewd_if_d0;
reg [3:0] skewd_if_d1;
reg [3:0] skewd_if_d2;
reg [3:0] skewd_if_d3;
reg [3:0] skewd_if_d4;
reg [7:0] skewd_if_d5;
reg [7:0] skewd_if_d6;
reg [3:0] skewd_if_d7;
reg [3:0] skewd_if_d8;
reg [3:0] skewd_if_d9;
reg skewd_iserdes_clkdiv;
reg skewd_phy_clk;
`ifdef TEST_MODE
  int rd_random_num;
  int wr_random_num;
   parameter CLK_SKEW_MIN = top.CLK_SKEW_MIN;
   parameter CLK_SKEW_MAX = top.CLK_SKEW_MAX;
   parameter ENABLE_SKEW  = top.ENABLE_SKEW ;
   parameter DATA_SKEW   =  top.DATA_SKEW   ;
  initial
  begin
     //$display("VALUE OF CLK_SKEW_MIN = %d",top.CLK_SKEW_MIN);
     //$display("VALUE OF CLK_SKEW_MAX = %d",top.CLK_SKEW_MAX);
     //$display("VALUE OF ENABLE_SKEW  = %d",top.ENABLE_SKEW);
     //$display("VALUE OF DATA_SKEW    = %d",top.DATA_SKEW);
     wr_random_num = CLK_SKEW_MIN + {$random} % (CLK_SKEW_MAX - CLK_SKEW_MIN);
     rd_random_num = CLK_SKEW_MIN + {$random} % (CLK_SKEW_MAX - CLK_SKEW_MIN);
     $display(" %m value for wr_random_num    = %d ::::::: value for rd_random_num",wr_random_num,rd_random_num);
  end
   always @(skewd_iserdes_clkdiv)
   begin
     #(ENABLE_SKEW) skewd_ififo_wr_enable  =  ififo_wr_enable;
   end
   always @(skewd_iserdes_clkdiv)
   begin
     #(DATA_SKEW) skewd_if_d0  =  if_d0;
             skewd_if_d1  =  if_d1;
             skewd_if_d2  =  if_d2;
             skewd_if_d3  =  if_d3;
             skewd_if_d4  =  if_d4;
             skewd_if_d5  =  {dummy_i5,if_d5};
             skewd_if_d6  =  {dummy_i6,if_d6};
             skewd_if_d7  =  if_d7;
             skewd_if_d8  =  if_d8;
             skewd_if_d9  =  if_d9;
   end
   always @(skewd_phy_clk)
   begin
     # (ENABLE_SKEW) skewd_phy_rd_en_  =  phy_rd_en_;
   end
   always @(iserdes_clkdiv)
   begin
     skewd_iserdes_clkdiv <=   #(wr_random_num) iserdes_clkdiv;
   end
   always @(phy_clk)
   begin
     skewd_phy_clk        <=   #(rd_random_num) phy_clk;
   end
`else
   always @(*)
   begin
     skewd_iserdes_clkdiv = iserdes_clkdiv;
     skewd_phy_clk        = phy_clk       ;
     skewd_phy_rd_en_     = phy_rd_en_   ;
     skewd_if_d0          = if_d0;
     skewd_if_d1          = if_d1;
     skewd_if_d2          = if_d2;
     skewd_if_d3          = if_d3;
     skewd_if_d4          = if_d4;
     skewd_if_d5          = {dummy_i5,if_d5};
     skewd_if_d6          = {dummy_i6,if_d6};
     skewd_if_d7          = if_d7;
     skewd_if_d8          = if_d8;
     skewd_if_d9          = if_d9;
     skewd_ififo_wr_enable  = ififo_wr_enable;
   end
`endif
`ifdef FUJI_PHY_BLH
B_IN_FIFO #(
`else
IN_FIFO #(
`endif
  .ALMOST_EMPTY_VALUE                ( IF_ALMOST_EMPTY_VALUE ),
  .ALMOST_FULL_VALUE                 ( IF_ALMOST_FULL_VALUE ),
  .ARRAY_MODE                        ( L_IF_ARRAY_MODE),
  .SYNCHRONOUS_MODE                  ( IF_SYNCHRONOUS_MODE)
) in_fifo  (
  .ALMOSTEMPTY                       (if_a_empty_),
  .ALMOSTFULL                        (if_a_full_),
  .EMPTY                             (if_empty_),
  .FULL                              (if_full_),
  .Q0                                (if_q0),
  .Q1                                (if_q1),
  .Q2                                (if_q2),
  .Q3                                (if_q3),
  .Q4                                (if_q4),
  .Q5                                (if_q5),
  .Q6                                (if_q6),
  .Q7                                (if_q7),
  .Q8                                (if_q8),
  .Q9                                (if_q9),
//===
  .D0                                (skewd_if_d0),
  .D1                                (skewd_if_d1),
  .D2                                (skewd_if_d2),
  .D3                                (skewd_if_d3),
  .D4                                (skewd_if_d4),
  .D5                                (skewd_if_d5),
  .D6                                (skewd_if_d6),
  .D7                                (skewd_if_d7),
  .D8                                (skewd_if_d8),
  .D9                                (skewd_if_d9),
  .RDCLK                             (skewd_phy_clk),
  .RDEN                              (skewd_phy_rd_en_),
  .RESET                             (ififo_rst),
  .WRCLK                             (skewd_iserdes_clkdiv),
  .WREN                              (skewd_ififo_wr_enable)
);
// Extend depth of OUT_FIFO to provide additional buffering to avoid
// the OUT_FIFO ever going full or empty due to write-read clock drift
wire        of_wren_tmp;
wire [79:0] pre_fifo_dout;
wire        pre_fifo_full;
wire        pre_fifo_rden;
wire        rst_n;
of_pre_fifo #
  (
   .TCQ   (25),    // simulation CK->Q delay
   .DEPTH (8),     // depth - set to 8 initially, reduce later as appropriate
   .WIDTH (80)     // width
   )
  of_pre_fifo
    (
     .clk       (phy_clk),
     .rst       (rst),
     .full_in   (of_full),
     .wr_en_in  (phy_wr_en),
     .d_in      (phy_dout),
     .wr_en_out (of_wren_tmp),
     .d_out     (pre_fifo_dout)
     );
assign {of_d9, of_d8, of_d7, of_d6, of_d5,
        of_d4, of_d3, of_d2, of_d1, of_d0} = pre_fifo_dout;
`ifdef FUJI_PHY_BLH
B_OUT_FIFO #(
`else
OUT_FIFO #(
`endif
  .ALMOST_EMPTY_VALUE             (OF_ALMOST_EMPTY_VALUE),
  .ALMOST_FULL_VALUE              (OF_ALMOST_FULL_VALUE),
  .ARRAY_MODE                     (L_OF_ARRAY_MODE),
  .OUTPUT_DISABLE                 (OF_OUTPUT_DISABLE),
  .SYNCHRONOUS_MODE               (OF_SYNCHRONOUS_MODE)
) out_fifo (
  .ALMOSTEMPTY                    (of_a_empty),
  .ALMOSTFULL                     (of_a_full),
  .EMPTY                          (of_empty),
  .FULL                           (of_full),
  .Q0                             (of_q0),
  .Q1                             (of_q1),
  .Q2                             (of_q2),
  .Q3                             (of_q3),
  .Q4                             (of_q4),
  .Q5                             (of_q5),
  .Q6                             (of_q6),
  .Q7                             (of_q7),
  .Q8                             (of_q8),
  .Q9                             (of_q9),
  .D0                             (of_d0),
  .D1                             (of_d1),
  .D2                             (of_d2),
  .D3                             (of_d3),
  .D4                             (of_d4),
  .D5                             (of_d5),
  .D6                             (of_d6),
  .D7                             (of_d7),
  .D8                             (of_d8),
  .D9                             (of_d9),
  .RDCLK                          (oserdes_clkdiv),
  .RDEN                           (po_rd_enable),
  .RESET                          (ofifo_rst),
  .WRCLK                          (phy_clk),
  .WREN                           (of_wren_tmp)
);
byte_group_io   #
   (
   .PO_DATA_CTL             (PO_DATA_CTL),
   .BITLANES                (BITLANES),
   .BITLANES_OUTONLY        (BITLANES_OUTONLY),
   .OSERDES_DATA_RATE       (L_OSERDES_DATA_RATE),
   .OSERDES_DATA_WIDTH      (L_OSERDES_DATA_WIDTH),
   .DIFFERENTIAL_DQS        (DIFFERENTIAL_DQS),
   .IDELAYE2_IDELAY_TYPE    (IDELAYE2_IDELAY_TYPE),
   .IDELAYE2_IDELAY_VALUE   (IDELAYE2_IDELAY_VALUE),
   .IODELAY_GRP             (IODELAY_GRP)
   )
   byte_group_io
   (
   .mem_dq_out               (mem_dq_out),
   .mem_dq_ts                (mem_dq_ts),
   .mem_dq_in                (mem_dq_in),
   .mem_dqs_in               (mem_dqs_in),
   .mem_dqs_out              (mem_dqs_out),
   .mem_dqs_ts               (mem_dqs_ts),
   .rst                      (rst),
   .oserdes_rst              (oserdes_rst),
   .iserdes_rst              (pi_iserdes_rst ),
   .iserdes_dout             (iserdes_dout),
   .dqs_to_phaser            (dqs_to_phaser),
   .phy_clk                  (phy_clk),
   .iserdes_clk              (iserdes_clk),
   .iserdes_clkb             (!iserdes_clk),
   .iserdes_clkdiv           (iserdes_clkdiv),
   .idelay_inc               (idelay_inc),
   .idelay_ce                (idelay_ce),
   .idelay_ld                (idelay_ld),
   .idelayctrl_refclk        (idelayctrl_refclk),
   .oserdes_clk              (oserdes_clk),
   .oserdes_clk_delayed      (oserdes_clk_delayed),
   .oserdes_clkdiv           (oserdes_clkdiv),
   .oserdes_dqs              ({oserdes_dqs[1], oserdes_dqs[0]}),
   .oserdes_dqsts            ({oserdes_dqs_ts[1], oserdes_dqs_ts[0]}),
   .oserdes_dq               (of_dqbus),
   .oserdes_dqts             ({oserdes_dq_ts[1], oserdes_dq_ts[0]})
    );
genvar i;
generate
if ( NUM_DDR_CK )
    for ( i = 0; i != NUM_DDR_CK; i = i +1)
if  ( PO_DATA_CTL== "FALSE" && GENERATE_DDR_CK == ABCD) begin : ddr_ck_gen
           wire ddr_ck_out_q;
ODDR ddr_ck (
   .C    (oserdes_clk),
   .R    (oserdes_rst),
   .S    (),
   .D1   (1'b0),
   .D2   (1'b1),
   .CE   (1'b1),
   .Q    (ddr_ck_out_q)
);
           OBUFDS ddr_ck_obuf  (.I(ddr_ck_out_q), .O(ddr_ck_out[i]), .OB(ddr_ck_out[NUM_DDR_CK+i]));
        end // ddr_ck_gen
else  begin : ddr_ck_null
              assign ddr_ck_out[i] = 1'b0;
              assign ddr_ck_out[NUM_DDR_CK + i] = 1'b0;
end
endgenerate
endmodule