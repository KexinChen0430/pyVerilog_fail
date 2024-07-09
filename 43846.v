module to handle
    .charisk_in     (rxcharisk_dec_out),                  // input[1:0]
    .notintable_in  (rxnotintable_dec_out),               // input[1:0]
    .disperror_in   (rxdisperr_dec_out),                  // input[1:0]
    .data_in        (rxdata_dec_out),                     // input[15:0]
    .isaligned_out  (rxbyteisaligned),                    // output
    .charisk_out    (rxcharisk),                          // output[3:0] reg
    .notintable_out (rxnotintable),                       // output[3:0] reg
    .disperror_out  (rxdisperr),                          // output[3:0] reg
    .data_out       (rxdata),                             // output[31:0] reg
    .full           (rxelsfull),                          // output
    .empty          (rxelsempty)                          // output
);
`ifdef DEBUG_ELASTIC
    localparam ALIGN_PRIM = 32'h7B4A4ABC;
    localparam SOF_PRIM =   32'h3737b57c;
    localparam EOF_PRIM =   32'hd5d5b57c;
    localparam CONT_PRIM =  32'h9999aa7c;
    localparam HOLD_PRIM =  32'hd5d5aa7c;
    localparam HOLDA_PRIM = 32'h9595aa7c;
    localparam WTRM_PRIM =  32'h5858b57c;
    reg            [15:0] dbg_data_in_r;
    reg             [1:0] dbg_charisk_in_r;
    reg                   dbg_aligned32_in_r;  // input data is word-aligned and got ALIGNp
    reg                   dbg_msb_in_r;      // input contains MSB
    reg            [11:0] dbg_data_cntr_r;
    reg             [3:0] got_prims_r;
    reg                   dbg_frun;
    reg dbg_is_sof_r;
    reg dbg_is_eof_r;
    reg dbg_is_data_r;
    wire dbg_is_alignp_w = ({rxdata_dec_out,       dbg_data_in_r} ==       ALIGN_PRIM) && ({rxcharisk_dec_out,    dbg_charisk_in_r} ==    4'h1);
    wire dbg_is_sof_w =    ({rxdata_dec_out,       dbg_data_in_r} ==       SOF_PRIM)   && ({rxcharisk_dec_out,    dbg_charisk_in_r} ==    4'h1);
    wire dbg_is_eof_w =    ({rxdata_dec_out,       dbg_data_in_r} ==       EOF_PRIM) &&   ({rxcharisk_dec_out,    dbg_charisk_in_r} ==    4'h1);
    wire dbg_is_cont_w =   ({rxdata_dec_out,       dbg_data_in_r} ==       CONT_PRIM) &&  ({rxcharisk_dec_out,    dbg_charisk_in_r} ==    4'h1);
    wire dbg_is_hold_w =   ({rxdata_dec_out,       dbg_data_in_r} ==       HOLD_PRIM) &&  ({rxcharisk_dec_out,    dbg_charisk_in_r} ==    4'h1);
    wire dbg_is_holda_w =  ({rxdata_dec_out,       dbg_data_in_r} ==       HOLDA_PRIM) && ({rxcharisk_dec_out,    dbg_charisk_in_r} ==    4'h1);
    wire dbg_is_wrtm_w =   ({rxdata_dec_out,       dbg_data_in_r} ==       WTRM_PRIM) &&  ({rxcharisk_dec_out,    dbg_charisk_in_r} ==    4'h1);
    wire dbg_is_data_w =   ({rxcharisk_dec_out,    dbg_charisk_in_r} ==    4'h0);
    always @ (posedge xclk) begin
        dbg_data_in_r <= rxdata_dec_out;
        dbg_charisk_in_r <= rxcharisk_dec_out;
            dbg_is_sof_r <= dbg_is_sof_w;
            dbg_is_eof_r <= dbg_is_eof_w;
            dbg_is_data_r <=dbg_is_data_w && dbg_msb_in_r;
            if (!dbg_aligned32_in_r && !dbg_is_alignp_w) dbg_msb_in_r <= 1;
            else                                         dbg_msb_in_r <= !dbg_msb_in_r;
            if    (!state_aligned)                       dbg_aligned32_in_r <= 0;
            else if (dbg_is_alignp_w)                    dbg_aligned32_in_r <= 1;
            if (!dbg_aligned32_in_r || dbg_is_sof_r)     got_prims_r <= 0;
            else if (dbg_frun)                           got_prims_r <= got_prims_r | {dbg_is_cont_w, dbg_is_hold_w, dbg_is_holda_w, dbg_is_wrtm_w};
        if (!dbg_aligned32_in_r || dbg_is_eof_r) dbg_frun <= 0;
        else if (dbg_is_sof_r)                   dbg_frun <= 1;
        if (!dbg_aligned32_in_r || dbg_is_sof_r)           dbg_data_cntr_r <= 0;
        else if (dbg_frun && dbg_is_data_r)                dbg_data_cntr_r <=  dbg_data_cntr_r + 1;
        if (!dbg_aligned32_in_r || dbg_is_sof_r)           dbg_data_cntr <= {got_prims_r, dbg_data_cntr_r}; // copy previous value
    end
`endif // DEBUG_ELASATIC
reg rxresetdone_r;
reg txresetdone_r;
always @ (posedge rxusrclk2) rxresetdone_r <= rxresetdone_gtx;
always @ (posedge txusrclk2) txresetdone_r <= txresetdone_gtx;
assign  rxresetdone     = rxresetdone_r;
assign  txresetdone     = txresetdone_r;
pulse_cross_clock #(
    .EXTRA_DLY(0)
) pulse_cross_clock_rxcominitdet_i (
    .rst       (~wrap_rxreset_),   // input
    .src_clk   (xclk),             // input
    .dst_clk   (rxusrclk2),        // input
    .in_pulse  (rxcominitdet_gtx), // input
    .out_pulse (rxcominitdet),     // output
    .busy      ()                  // output
);
pulse_cross_clock #(
    .EXTRA_DLY(0)
) pulse_cross_clock_rxcomwakedet_i (
    .rst       (~wrap_rxreset_),   // input
    .src_clk   (xclk),             // input
    .dst_clk   (rxusrclk2),        // input
    .in_pulse  (rxcomwakedet_gtx), // input
    .out_pulse (rxcomwakedet),     // output
    .busy      ()                  // output
);
wire    txoutclk_gtx;
wire    xclk_gtx;
select_clk_buf #(
    .BUFFER_TYPE("BUFG")
) bufg_txoutclk (
    .o          (txoutclk),      // output
    .i          (txoutclk_gtx),  // input
    .clr        (1'b0)           // input
);
select_clk_buf #(
    .BUFFER_TYPE("BUFG")
) bug_xclk (
    .o          (xclk),      // output
    .i          (xclk_gtx),  // input
    .clr        (1'b0)       // input
);
gtxe2_channel_wrapper #(
    .SIM_RECEIVER_DETECT_PASS               ("TRUE"),
    .SIM_TX_EIDLE_DRIVE_LEVEL               ("X"),
    .SIM_RESET_SPEEDUP                      ("FALSE"),
    .SIM_CPLLREFCLK_SEL                     (3'b001),
    .SIM_VERSION                            ("4.0"),
    .ALIGN_COMMA_DOUBLE                     ("FALSE"),
    .ALIGN_COMMA_ENABLE                     (10'b1111111111),
    .ALIGN_COMMA_WORD                       (1),
    .ALIGN_MCOMMA_DET                       ("TRUE"),
    .ALIGN_MCOMMA_VALUE                     (10'b1010000011),
    .ALIGN_PCOMMA_DET                       ("TRUE"),
    .ALIGN_PCOMMA_VALUE                     (10'b0101111100),
    .SHOW_REALIGN_COMMA                     ("TRUE"),
    .RXSLIDE_AUTO_WAIT                      (7),
    .RXSLIDE_MODE                           ("OFF"),
    .RX_SIG_VALID_DLY                       (10),
    .RX_DISPERR_SEQ_MATCH                   ("TRUE"),
    .DEC_MCOMMA_DETECT                      ("TRUE"),
    .DEC_PCOMMA_DETECT                      ("TRUE"),
    .DEC_VALID_COMMA_ONLY                   ("FALSE"),
    .CBCC_DATA_SOURCE_SEL                   ("DECODED"),
    .CLK_COR_SEQ_2_USE                      ("FALSE"),
    .CLK_COR_KEEP_IDLE                      ("FALSE"),
    .CLK_COR_MAX_LAT                        (9),
    .CLK_COR_MIN_LAT                        (7),
    .CLK_COR_PRECEDENCE                     ("TRUE"),
    .CLK_COR_REPEAT_WAIT                    (0),
    .CLK_COR_SEQ_LEN                        (1),
    .CLK_COR_SEQ_1_ENABLE                   (4'b1111),
    .CLK_COR_SEQ_1_1                        (10'b0100000000),
    .CLK_COR_SEQ_1_2                        (10'b0000000000),
    .CLK_COR_SEQ_1_3                        (10'b0000000000),
    .CLK_COR_SEQ_1_4                        (10'b0000000000),
    .CLK_CORRECT_USE                        ("FALSE"),
    .CLK_COR_SEQ_2_ENABLE                   (4'b1111),
    .CLK_COR_SEQ_2_1                        (10'b0100000000),
    .CLK_COR_SEQ_2_2                        (10'b0000000000),
    .CLK_COR_SEQ_2_3                        (10'b0000000000),
    .CLK_COR_SEQ_2_4                        (10'b0000000000),
    .CHAN_BOND_KEEP_ALIGN                   ("FALSE"),
    .CHAN_BOND_MAX_SKEW                     (1),
    .CHAN_BOND_SEQ_LEN                      (1),
    .CHAN_BOND_SEQ_1_1                      (10'b0000000000),
    .CHAN_BOND_SEQ_1_2                      (10'b0000000000),
    .CHAN_BOND_SEQ_1_3                      (10'b0000000000),
    .CHAN_BOND_SEQ_1_4                      (10'b0000000000),
    .CHAN_BOND_SEQ_1_ENABLE                 (4'b1111),
    .CHAN_BOND_SEQ_2_1                      (10'b0000000000),
    .CHAN_BOND_SEQ_2_2                      (10'b0000000000),
    .CHAN_BOND_SEQ_2_3                      (10'b0000000000),
    .CHAN_BOND_SEQ_2_4                      (10'b0000000000),
    .CHAN_BOND_SEQ_2_ENABLE                 (4'b1111),
    .CHAN_BOND_SEQ_2_USE                    ("FALSE"),
    .FTS_DESKEW_SEQ_ENABLE                  (4'b1111),
    .FTS_LANE_DESKEW_CFG                    (4'b1111),
    .FTS_LANE_DESKEW_EN                     ("FALSE"),
    .ES_CONTROL                             (6'b000000),
    .ES_ERRDET_EN                           ("FALSE"),
    .ES_EYE_SCAN_EN                         ("TRUE"),
    .ES_HORZ_OFFSET                         (12'h000),
    .ES_PMA_CFG                             (10'b0000000000),
    .ES_PRESCALE                            (5'b00000),
    .ES_QUALIFIER                           (80'h00000000000000000000),
    .ES_QUAL_MASK                           (80'h00000000000000000000),
    .ES_SDATA_MASK                          (80'h00000000000000000000),
    .ES_VERT_OFFSET                         (9'b000000000),
    .RX_DATA_WIDTH                          (20),
    .OUTREFCLK_SEL_INV                      (2'b11),
    .PMA_RSV                                (32'h00018480),
    .PMA_RSV2                               (16'h2050),
    .PMA_RSV3                               (2'b00),
    .PMA_RSV4                               (32'h00000000),
    .RX_BIAS_CFG                            (12'b000000000100),
    .DMONITOR_CFG                           (24'h000A00),
//    .RX_CM_SEL                              (2'b11),
    .RX_CM_SEL                              (2'b00), // Andrey
    .RX_CM_TRIM                             (3'b010),
    .RX_DEBUG_CFG                           (12'b000000000000),
    .RX_OS_CFG                              (13'b0000010000000),
    .TERM_RCAL_CFG                          (5'b10000),
    .TERM_RCAL_OVRD                         (1'b0),
    .TST_RSV                                (32'h00000000),
    .RX_CLK25_DIV                           (6),
    .TX_CLK25_DIV                           (6),
    .UCODEER_CLR                            (1'b0),
    .PCS_PCIE_EN                            ("FALSE"),
    .PCS_RSVD_ATTR                          (48'h0100),
    .RXBUF_ADDR_MODE                        ("FAST"),
    .RXBUF_EIDLE_HI_CNT                     (4'b1000),
    .RXBUF_EIDLE_LO_CNT                     (4'b0000),
    .RXBUF_EN                               ("FALSE"),
    .RX_BUFFER_CFG                          (6'b000000),
    .RXBUF_RESET_ON_CB_CHANGE               ("TRUE"),
    .RXBUF_RESET_ON_COMMAALIGN              ("FALSE"),
    .RXBUF_RESET_ON_EIDLE                   ("FALSE"),
    .RXBUF_RESET_ON_RATE_CHANGE             ("TRUE"),
    .RXBUFRESET_TIME                        (5'b00001),
    .RXBUF_THRESH_OVFLW                     (61),
    .RXBUF_THRESH_OVRD                      ("FALSE"),
    .RXBUF_THRESH_UNDFLW                    (4),
    .RXDLY_CFG                              (16'h001F),
    .RXDLY_LCFG                             (9'h030),
    .RXDLY_TAP_CFG                          (16'h0000),
    .RXPH_CFG                               (24'h000000),
    .RXPHDLY_CFG                            (24'h084020),
    .RXPH_MONITOR_SEL                       (5'b00000),
`ifdef ALIGN_CLOCKS
//    .RX_XCLK_SEL                            ("RXUSR"), // ("RXREC"), // Andrey: Now they are the same, just using p.247 "Using RX Buffer Bypass..."
    .RX_XCLK_SEL                            ("RXREC"),    // Andrey: Does not align clocks if in this mode
`else
    .RX_XCLK_SEL                            ("RXREC"),    // Andrey: Does not align clocks if in this mode
`endif
    .RX_DDI_SEL                             (6'b000000),
    .RX_DEFER_RESET_BUF_EN                  ("TRUE"),
    .RXCDR_CFG                              (72'h03_8800_8BFF_4020_0008),// http://www.xilinx.com/support/answers/53364.html - SATA-2, div=2
    .RXCDR_FR_RESET_ON_EIDLE                (1'b0),
    .RXCDR_HOLD_DURING_EIDLE                (1'b0),
    .RXCDR_PH_RESET_ON_EIDLE                (1'b0),
    .RXCDR_LOCK_CFG                         (6'b010101),
    .RXCDRFREQRESET_TIME                    (RXCDRFREQRESET_TIME),
    .RXCDRPHRESET_TIME                      (RXCDRPHRESET_TIME),
    .RXISCANRESET_TIME                      (RXISCANRESET_TIME),
    .RXPCSRESET_TIME                        (5'b00001),
    .RXPMARESET_TIME                        (RXPMARESET_TIME),
    .RXOOB_CFG                              (7'b0000110),
    .RXGEARBOX_EN                           ("FALSE"),
    .GEARBOX_MODE                           (3'b000),
    .RXPRBS_ERR_LOOPBACK                    (1'b0),
    .PD_TRANS_TIME_FROM_P2                  (12'h03c),
    .PD_TRANS_TIME_NONE_P2                  (8'h3c),
    .PD_TRANS_TIME_TO_P2                    (8'h64),
    .SAS_MAX_COM                            (64),
    .SAS_MIN_COM                            (36),
    .SATA_BURST_SEQ_LEN                     (4'b0101),
    .SATA_BURST_VAL                         (3'b100),
    .SATA_EIDLE_VAL                         (3'b100),
    .SATA_MAX_BURST                         (8),
    .SATA_MAX_INIT                          (21),
    .SATA_MAX_WAKE                          (7),
    .SATA_MIN_BURST                         (4),
    .SATA_MIN_INIT                          (12),
    .SATA_MIN_WAKE                          (4),
    .TRANS_TIME_RATE                        (8'h0E),
    .TXBUF_EN                               ("TRUE"),
    .TXBUF_RESET_ON_RATE_CHANGE             ("TRUE"),
    .TXDLY_CFG                              (16'h001F),
    .TXDLY_LCFG                             (9'h030),
    .TXDLY_TAP_CFG                          (16'h0000),
    .TXPH_CFG                               (16'h0780),
    .TXPHDLY_CFG                            (24'h084020),
    .TXPH_MONITOR_SEL                       (5'b00000),
    .TX_XCLK_SEL                            ("TXOUT"),
    .TX_DATA_WIDTH                          (20),
    .TX_DEEMPH0                             (5'b00000),
    .TX_DEEMPH1                             (5'b00000),
    .TX_EIDLE_ASSERT_DELAY                  (3'b110),
    .TX_EIDLE_DEASSERT_DELAY                (3'b100),
    .TX_LOOPBACK_DRIVE_HIZ                  ("FALSE"),
    .TX_MAINCURSOR_SEL                      (1'b0),
    .TX_DRIVE_MODE                          ("DIRECT"),
    .TX_MARGIN_FULL_0                       (7'b1001110),
    .TX_MARGIN_FULL_1                       (7'b1001001),
    .TX_MARGIN_FULL_2                       (7'b1000101),
    .TX_MARGIN_FULL_3                       (7'b1000010),
    .TX_MARGIN_FULL_4                       (7'b1000000),
    .TX_MARGIN_LOW_0                        (7'b1000110),
    .TX_MARGIN_LOW_1                        (7'b1000100),
    .TX_MARGIN_LOW_2                        (7'b1000010),
    .TX_MARGIN_LOW_3                        (7'b1000000),
    .TX_MARGIN_LOW_4                        (7'b1000000),
    .TXGEARBOX_EN                           ("FALSE"),
    .TXPCSRESET_TIME                        (5'b00001),
    .TXPMARESET_TIME                        (TXPMARESET_TIME),
    .TX_RXDETECT_CFG                        (14'h1832),
    .TX_RXDETECT_REF                        (3'b100),
    .CPLL_CFG                               (24'hBC07DC),
    .CPLL_FBDIV                             (4),
    .CPLL_FBDIV_45                          (5),
    .CPLL_INIT_CFG                          (24'h00001E),
    .CPLL_LOCK_CFG                          (16'h01E8),
    .CPLL_REFCLK_DIV                        (1),
    .RXOUT_DIV                              (2),
    .TXOUT_DIV                              (2),
    .SATA_CPLL_CFG                          ("VCO_3000MHZ"),
    .RXDFELPMRESET_TIME                     (RXDFELPMRESET_TIME),
    .RXLPM_HF_CFG                           (14'b00000011110000),
    .RXLPM_LF_CFG                           (14'b00000011110000),
    .RX_DFE_GAIN_CFG                        (23'h020FEA),
    .RX_DFE_H2_CFG                          (12'b000000000000),
    .RX_DFE_H3_CFG                          (12'b000001000000),
    .RX_DFE_H4_CFG                          (11'b00011110000),
    .RX_DFE_H5_CFG                          (11'b00011100000),
    .RX_DFE_KL_CFG                          (13'b0000011111110),
    .RX_DFE_LPM_CFG                         (16'h0904),
    .RX_DFE_LPM_HOLD_DURING_EIDLE           (1'b0),
    .RX_DFE_UT_CFG                          (17'b10001111000000000),
    .RX_DFE_VP_CFG                          (17'b00011111100000011),
    .RX_CLKMUX_PD                           (1'b1),
    .TX_CLKMUX_PD                           (1'b1),
    .RX_INT_DATAWIDTH                       (0),
    .TX_INT_DATAWIDTH                       (0),
    .TX_QPI_STATUS_EN                       (1'b0),
    .RX_DFE_KL_CFG2                         (32'h301148AC),
    .RX_DFE_XYD_CFG                         (13'b0000000000000),
    .TX_PREDRIVER_MODE                      (1'b0)
)
gtxe2_channel_wrapper(
    .CPLLFBCLKLOST                  (),
    .CPLLLOCK                       (cplllock),
    .CPLLLOCKDETCLK                 (cplllockdetclk),
    .CPLLLOCKEN                     (1'b1),
    .CPLLPD                         (1'b0),
    .CPLLREFCLKLOST                 (),
    .CPLLREFCLKSEL                  (3'b001),
    .CPLLRESET                      (cpllreset),
    .GTRSVD                         (16'b0),
    .PCSRSVDIN                      (16'b0),
    .PCSRSVDIN2                     (5'b0),
    .PMARSVDIN                      (5'b0),
    .PMARSVDIN2                     (5'b0),
    .TSTIN                          (20'h1),
    .TSTOUT                         (),
    .CLKRSVD                        (4'b0000),
    .GTGREFCLK                      (1'b0),
    .GTNORTHREFCLK0                 (1'b0),
    .GTNORTHREFCLK1                 (1'b0),
    .GTREFCLK0                      (gtrefclk),
    .GTREFCLK1                      (1'b0),
    .GTSOUTHREFCLK0                 (1'b0),
    .GTSOUTHREFCLK1                 (1'b0),
`ifdef USE_DRP
        .DRPADDR                    (drp_addr[8:0]),
        .DRPCLK                     (drp_clk),
        .DRPDI                      (drp_di),
        .DRPDO                      (drp_do_gtx),
        .DRPEN                      (drp_en_w[0]),
        .DRPRDY                     (drp_rdy_gtx),
        .DRPWE                      (drp_we_w[0]),
`else
        .DRPADDR                        (9'b0),
        .DRPCLK                         (1'b0),
        .DRPDI                          (16'b0),
        .DRPDO                          (),
        .DRPEN                          (1'b0),
        .DRPRDY                         (),
        .DRPWE                          (1'b0),
`endif
    .GTREFCLKMONITOR                (),
    .QPLLCLK                        (1'b0/*gtrefclk*/),
    .QPLLREFCLK                     (1'b0/*gtrefclk*/),
    .RXSYSCLKSEL                    (2'b00),
    .TXSYSCLKSEL                    (2'b00),
    .DMONITOROUT                    (),
    .TX8B10BEN                      (1'b0),
    .LOOPBACK                       (3'd0),
    .PHYSTATUS                      (),
    .RXRATE                         (3'd0),
    .RXVALID                        (),
    .RXPD                           (2'b00),
    .TXPD                           (2'b00),
    .SETERRSTATUS                   (1'b0),
    .EYESCANRESET                   (1'b0),//rxreset), // p78
    .RXUSERRDY                      (rxuserrdy),
    .EYESCANDATAERROR               (),
    .EYESCANMODE                    (1'b0),
    .EYESCANTRIGGER                 (1'b0),
    .RXCDRFREQRESET                 (1'b0),
    .RXCDRHOLD                      (1'b0),
    .RXCDRLOCK                      (rxcdrlock),
    .RXCDROVRDEN                    (1'b0),
    .RXCDRRESET                     (1'b0),
    .RXCDRRESETRSV                  (1'b0),
    .RXCLKCORCNT                    (),
    .RX8B10BEN                      (1'b0),
    .RXUSRCLK                       (xclk),
    .RXUSRCLK2                      (xclk),
    .RXDATA                         (rxdata_gtx),
    .RXPRBSERR                      (),
    .RXPRBSSEL                      (3'd0),
    .RXPRBSCNTRESET                 (1'b0),
    .RXDFEXYDEN                     (1'b1),
    .RXDFEXYDHOLD                   (1'b0),
    .RXDFEXYDOVRDEN                 (1'b0),
    .RXDISPERR                      (rxdisperr_gtx),
    .RXNOTINTABLE                   (),
    .GTXRXP                         (rxp),
    .GTXRXN                         (rxn),
    .RXBUFRESET                     (1'b0),
    .RXBUFSTATUS                    (),
`ifdef ALIGN_CLOCKS
    .RXDDIEN                   (RXDDIEN),             //      (1'b1), // Andrey: p.243: "Set high in RX buffer bypass mode"
    .RXDLYBYPASS               (RXDLYBYPASS),         //      (1'b0), // Andrey: p.243: "0: Uses the RX delay alignment circuit."
`else
    .RXDDIEN                   (RXDDIEN),             //      (1'b0),
    .RXDLYBYPASS               (RXDLYBYPASS),         //      (1'b1),
`endif
    .RXDLYEN                   (RXDLYEN),             //      (1'b0),
    .RXDLYOVRDEN               (RXDLYOVRDEN),         //      (1'b0),
    .RXDLYSRESET               (RXDLYSRESET || rxdlysreset),
    .RXDLYSRESETDONE                (rxdlysresetdone),
    .RXPHALIGN                 (RXPHALIGN),           //      (1'b0),
    .RXPHALIGNDONE                  (rxphaligndone),
    .RXPHALIGNEN               (RXPHALIGNEN),         //      (1'b0),
    .RXPHDLYPD                 (RXPHDLYPD),           //      (1'b0),
    .RXPHDLYRESET              (RXPHDLYRESET),        //      (1'b0),
    .RXPHMONITOR                    (),
    .RXPHOVRDEN                (RXPHOVRDEN),          //      (1'b0),
    .RXPHSLIPMONITOR                (),
    .RXSTATUS                       (),
    .RXBYTEISALIGNED                (),
    .RXBYTEREALIGN                  (),
    .RXCOMMADET                     (),
    .RXCOMMADETEN                   (1'b0),
    .RXMCOMMAALIGNEN                (1'b0),
    .RXPCOMMAALIGNEN                (1'b0),
    .RXCHANBONDSEQ                  (),
    .RXCHBONDEN                     (1'b0),
    .RXCHBONDLEVEL                  (3'd0),
    .RXCHBONDMASTER                 (1'b0),
    .RXCHBONDO                      (),
    .RXCHBONDSLAVE                  (1'b0),
    .RXCHANISALIGNED                (),
    .RXCHANREALIGN                  (),
    .RXLPMHFHOLD                    (1'b0),
    .RXLPMHFOVRDEN                  (1'b0),
    .RXLPMLFHOLD                    (1'b0),
    .RXDFEAGCHOLD                   (1'b0),
    .RXDFEAGCOVRDEN                 (1'b0),
    .RXDFECM1EN                     (1'b0),
    .RXDFELFHOLD                    (1'b0),
    .RXDFELFOVRDEN                  (1'b1),
    .RXDFELPMRESET                  (rxreset),
    .RXDFETAP2HOLD                  (1'b0),
    .RXDFETAP2OVRDEN                (1'b0),
    .RXDFETAP3HOLD                  (1'b0),
    .RXDFETAP3OVRDEN                (1'b0),
    .RXDFETAP4HOLD                  (1'b0),
    .RXDFETAP4OVRDEN                (1'b0),
    .RXDFETAP5HOLD                  (1'b0),
    .RXDFETAP5OVRDEN                (1'b0),
    .RXDFEUTHOLD                    (1'b0),
    .RXDFEUTOVRDEN                  (1'b0),
    .RXDFEVPHOLD                    (1'b0),
    .RXDFEVPOVRDEN                  (1'b0),
//    .RXDFEVSEN                      (1'b0),
    .RXLPMLFKLOVRDEN                (1'b0),
    .RXMONITOROUT                   (),
    .RXMONITORSEL                   (2'b01),
    .RXOSHOLD                       (1'b0),
    .RXOSOVRDEN                     (1'b0),
    .RXRATEDONE                     (),
    .RXOUTCLK                       (xclk_gtx),
    .RXOUTCLKFABRIC                 (),
    .RXOUTCLKPCS                    (),
    .RXOUTCLKSEL                    (3'b010),
    .RXDATAVALID                    (),
    .RXHEADER                       (),
    .RXHEADERVALID                  (),
    .RXSTARTOFSEQ                   (),
    .RXGEARBOXSLIP                  (1'b0),
    .GTRXRESET                      (rxreset),
    .RXOOBRESET                     (1'b0),
    .RXPCSRESET                     (1'b0),
    .RXPMARESET                     (1'b0),//rxreset), // p78
    .RXLPMEN                        (RXLPMEN), // 1'b0),
    .RXCOMSASDET                    (),
    .RXCOMWAKEDET                   (rxcomwakedet_gtx),
    .RXCOMINITDET                   (rxcominitdet_gtx),
    .RXELECIDLE                     (rxelecidle),
    .RXELECIDLEMODE                 (2'b00),
    .RXPOLARITY                     (1'b0),
    .RXSLIDE                        (1'b0),
    .RXCHARISCOMMA                  (),
    .RXCHARISK                      (rxcharisk_gtx),
    .RXCHBONDI                      (5'b00000),
    .RXRESETDONE                    (rxresetdone_gtx),
    .RXQPIEN                        (1'b0),
    .RXQPISENN                      (),
    .RXQPISENP                      (),
    .TXPHDLYTSTCLK                  (1'b0),
    .TXPOSTCURSOR                   (5'b00000),
    .TXPOSTCURSORINV                (1'b0),
    .TXPRECURSOR                    (5'd0),
    .TXPRECURSORINV                 (1'b0),
    .TXQPIBIASEN                    (1'b0),
    .TXQPISTRONGPDOWN               (1'b0),
    .TXQPIWEAKPUP                   (1'b0),
    .CFGRESET                       (1'b0),
    .GTTXRESET                      (txreset),
    .PCSRSVDOUT                     (),
    .TXUSERRDY                      (txuserrdy),
    .GTRESETSEL                     (1'b0),
    .RESETOVRD                      (1'b0),
    .TXCHARDISPMODE                 (txchardispmode_gtx),
    .TXCHARDISPVAL                  (txchardispval_gtx),
    .TXUSRCLK                       (txusrclk),
    .TXUSRCLK2                      (txusrclk),
    .TXELECIDLE                     (txelecidle_gtx),
    .TXMARGIN                       (3'd0),
    .TXRATE                         (3'd0),
    .TXSWING                        (1'b0),
    .TXPRBSFORCEERR                 (1'b0),
    .TXDLYBYPASS                    (1'b1),
    .TXDLYEN                        (1'b0),
    .TXDLYHOLD                      (1'b0),
    .TXDLYOVRDEN                    (1'b0),
    .TXDLYSRESET                    (1'b0),
    .TXDLYSRESETDONE                (),
    .TXDLYUPDOWN                    (1'b0),
    .TXPHALIGN                      (1'b0),
    .TXPHALIGNDONE                  (),
    .TXPHALIGNEN                    (1'b0),
    .TXPHDLYPD                      (1'b0),
    .TXPHDLYRESET                   (1'b0),
    .TXPHINIT                       (1'b0),
    .TXPHINITDONE                   (),
    .TXPHOVRDEN                     (1'b0),
    .TXBUFSTATUS                    (txbufstatus[1:0]), // Andrey
    .TXBUFDIFFCTRL                  (3'b100),
    .TXDEEMPH                       (1'b0),
    .TXDIFFCTRL                     (4'b1000),
    .TXDIFFPD                       (1'b0),
    .TXINHIBIT                      (1'b0),
    .TXMAINCURSOR                   (7'b0000000),
    .TXPISOPD                       (1'b0),
    .TXDATA                         (txdata_gtx),
    .GTXTXN                         (txn),
    .GTXTXP                         (txp),
    .TXOUTCLK                       (txoutclk_gtx),
    .TXOUTCLKFABRIC                 (),
    .TXOUTCLKPCS                    (),
    .TXOUTCLKSEL                    (3'b010),
    .TXRATEDONE                     (),
    .TXCHARISK                      (txcharisk_gtx),
    .TXGEARBOXREADY                 (),
    .TXHEADER                       (3'd0),
    .TXSEQUENCE                     (7'd0),
    .TXSTARTSEQ                     (1'b0),
    .TXPCSRESET                     (txpcsreset),
    .TXPMARESET                     (1'b0),
    .TXRESETDONE                    (txresetdone_gtx),
    .TXCOMFINISH                    (txcomfinish),
    .TXCOMINIT                      (txcominit_gtx),
    .TXCOMSAS                       (1'b0),
    .TXCOMWAKE                      (txcomwake_gtx),
    .TXPDELECIDLEMODE               (1'b0),
    .TXPOLARITY                     (1'b0),
    .TXDETECTRX                     (1'b0),
    .TX8B10BBYPASS                  (8'd0),
    .TXPRBSSEL                      (3'd0),
    .TXQPISENN                      (),
    .TXQPISENP                      ()
);
`ifdef USE_DATASCOPE
    `ifdef DATASCOPE_INCOMING_RAW
        datascope_incoming_raw #(
            .ADDRESS_BITS        (ADDRESS_BITS),
            .DATASCOPE_POST_MEAS (DATASCOPE_POST_MEAS)
        ) datascope_incoming_i (
            .clk              (xclk), // input
            .charisk          (rxcharisk_dec_out[1:0]), // input[1:0]
            .rxdata           (rxdata_dec_out[15:0]), // input[15:0]
            .realign          (realign), // input
            .comma            (comma), // input
            .aligned          (state_aligned), // input
            .not_in_table     (rxnotintable_dec_out[1:0]), // input[1:0]
            .disp_err         (rxdisperr_dec_out[1:0]), // input[1:0]
            .datascope_arm    (other_control[DATASCOPE_START_BIT]), // input
            .datascope_clk    (datascope_clk), // output
            .datascope_waddr  (datascope_waddr), // output[9:0]
            .datascope_we     (datascope_we), // output
            .datascope_di     (datascope_di), // output[31:0] reg
            .datascope_trig   (datascope_trig) // input
        );
    `else //  DATASCOPE_INCOMING_RAW
        datascope_incoming #(
            .ADDRESS_BITS        (ADDRESS_BITS),
            .DATASCOPE_POST_MEAS (DATASCOPE_POST_MEAS)
        ) datascope_incoming_i (
            .clk              (xclk), // input
            .charisk          (rxcharisk_dec_out[1:0]), // input[1:0]
            .rxdata           (rxdata_dec_out[15:0]), // input[15:0]
            .aligned          (state_aligned), // input
            .not_in_table     (rxnotintable_dec_out[1:0]), // input[1:0]
            .disp_err         (rxdisperr_dec_out[1:0]), // input[1:0]
            .datascope_arm    (other_control[DATASCOPE_START_BIT]), // input
            .datascope_clk    (datascope_clk), // output
            .datascope_waddr  (datascope_waddr), // output[9:0]
            .datascope_we     (datascope_we), // output
            .datascope_di     (datascope_di), // output[31:0] reg
            .datascope_trig   (datascope_trig) // input
        );
    `endif //  not DATASCOPE_INCOMING_RAW
`endif
    always @ (posedge gtrefclk)
        debug <= ~rxelecidle | debug;
endmodule