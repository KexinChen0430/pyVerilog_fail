module for actual values.
   parameter DDR_TYPE              = 1,
   parameter HIGH_PERFORMANCE_MODE = "TRUE",
   parameter IODELAY_GRP           = "IODELAY_MIG"
   )
  (
   input        clk0,
   input        clkdiv0,
   input        rst0,
   input        dlyinc_dqs,
   input        dlyce_dqs,
   input        dlyrst_dqs,
   input        dlyinc_gate,
   input        dlyce_gate,
   input        dlyrst_gate,
   input        dqs_oe_n,
   input        dqs_rst_n,
   input        en_dqs,
   inout        ddr_dqs,
   inout        ddr_dqs_n,
   output       dq_ce,
   output       delayed_dqs
   );
  wire                     clk180;
  wire                     dqs_bufio;
  wire                     dqs_ibuf;
  wire                     dqs_idelay;
  wire                     dqs_oe_n_delay;
  (* S = "TRUE" *) wire    dqs_oe_n_r /* synthesis syn_preserve = 1*/;
  wire                     dqs_rst_n_delay;
  reg                      dqs_rst_n_r /* synthesis syn_preserve = 1*/;
  wire                     dqs_out;
  wire                     en_dqs_sync /* synthesis syn_keep = 1 */;
  // for simulation only. Synthesis should ignore this delay
  localparam    DQS_NET_DELAY = 0.8;
  assign        clk180 = ~clk0;
  // add delta delay to inputs clocked by clk180 to avoid delta-delay
  // simulation issues
  assign dqs_rst_n_delay = dqs_rst_n;
  assign dqs_oe_n_delay  = dqs_oe_n;
  // DQS input-side resources:
  // Route DQS from PAD to IDELAY
  (* IODELAY_GROUP = IODELAY_GRP *) IODELAY #
    (
     .DELAY_SRC("I"),
     .IDELAY_TYPE("VARIABLE"),
     .HIGH_PERFORMANCE_MODE(HIGH_PERFORMANCE_MODE),
     .IDELAY_VALUE(0),
     .ODELAY_VALUE(0)
     )
    u_idelay_dqs
      (
       .DATAOUT (dqs_idelay),
       .C       (clkdiv0),
       .CE      (dlyce_dqs),
       .DATAIN  (),
       .IDATAIN (dqs_ibuf),
       .INC     (dlyinc_dqs),
       .ODATAIN (),
       .RST     (dlyrst_dqs),
       .T       ()
       );
  // From IDELAY to BUFIO
  BUFIO u_bufio_dqs
    (
     .I  (dqs_idelay),
     .O  (dqs_bufio)
     );
  // To model additional delay of DQS BUFIO + gating network
  // for behavioral simulation. Make sure to select a delay number smaller
  // than half clock cycle (otherwise output will not track input changes
  // because of inertial delay). Duplicate to avoid delta delay issues.
  assign #(DQS_NET_DELAY) i_delayed_dqs = dqs_bufio;
  assign #(DQS_NET_DELAY) delayed_dqs   = dqs_bufio;
  // DQS gate circuit (not supported for all controllers)
  // Gate routing:
  //   en_dqs -> IDELAY -> en_dqs_sync -> IDDR.S -> dq_ce ->
  //   capture IDDR.CE
  // Delay CE control so that it's in phase with delayed DQS
  (* IODELAY_GROUP = IODELAY_GRP *) IODELAY #
    (
     .DELAY_SRC             ("DATAIN"),
     .IDELAY_TYPE           ("VARIABLE"),
     .HIGH_PERFORMANCE_MODE (HIGH_PERFORMANCE_MODE),
     .IDELAY_VALUE          (0),
     .ODELAY_VALUE          (0)
     )
    u_iodelay_dq_ce
      (
       .DATAOUT (en_dqs_sync),
       .C       (clkdiv0),
       .CE      (dlyce_gate),
       .DATAIN  (en_dqs),
       .IDATAIN (),
       .INC     (dlyinc_gate),
       .ODATAIN (),
       .RST     (dlyrst_gate),
       .T       ()
       );
  // Generate sync'ed CE to DQ IDDR's using a negative-edge triggered flip-flop
  // clocked by DQS. This flop should be locked to the IOB flip-flop at the same
  // site as IODELAY u_idelay_dqs in order to use the dedicated route from
  // the IODELAY to flip-flop (to keep this route as short as possible)
  (* IOB = "FORCE" *) FDCPE_1 #
    (
     .INIT(1'b0)
    )
    u_iddr_dq_ce
      (
       .Q   (dq_ce),
       .C   (i_delayed_dqs),
       .CE  (1'b1),
       .CLR (1'b0),
       .D   (en_dqs_sync),
       .PRE (en_dqs_sync)
       ) /* synthesis syn_useioff = 1 */
         /* synthesis syn_replicate = 0 */;
  // DQS output-side resources
  // synthesis attribute keep of dqs_rst_n_r is "true"
  always @(posedge clk180)
    dqs_rst_n_r <= dqs_rst_n_delay;
  ODDR #
    (
     .SRTYPE("SYNC"),
     .DDR_CLK_EDGE("OPPOSITE_EDGE")
     )
    u_oddr_dqs
      (
       .Q  (dqs_out),
       .C  (clk180),
       .CE (1'b1),
       .D1 (dqs_rst_n_r),      // keep output deasserted for write preamble
       .D2 (1'b0),
       .R  (1'b0),
       .S  (1'b0)
       );
  (* IOB = "FORCE" *) FDP u_tri_state_dqs
    (
     .D   (dqs_oe_n_delay),
     .Q   (dqs_oe_n_r),
     .C   (clk180),
     .PRE (rst0)
     ) /* synthesis syn_useioff = 1 */;
  // use either single-ended (for DDR1) or differential (for DDR2) DQS input
  generate
    if (DDR_TYPE > 0) begin: gen_dqs_iob_ddr2
      IOBUFDS u_iobuf_dqs
        (
         .O   (dqs_ibuf),
         .IO  (ddr_dqs),
         .IOB (ddr_dqs_n),
         .I   (dqs_out),
         .T   (dqs_oe_n_r)
         );
    end else begin: gen_dqs_iob_ddr1
      IOBUF u_iobuf_dqs
        (
         .O   (dqs_ibuf),
         .IO  (ddr_dqs),
         .I   (dqs_out),
         .T   (dqs_oe_n_r)
         );
    end
  endgenerate
endmodule