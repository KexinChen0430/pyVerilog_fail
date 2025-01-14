module ad_serdes_in (
  // reset and clocks
  rst,
  clk,
  div_clk,
  // data interface
  data_s0,
  data_s1,
  data_s2,
  data_s3,
  data_s4,
  data_s5,
  data_s6,
  data_s7,
  data_in_p,
  data_in_n,
  // delay-data interface
  up_clk,
  up_dld,
  up_dwdata,
  up_drdata,
  // delay-control interface
  delay_clk,
  delay_rst,
  delay_locked);
  // parameters
  parameter   DEVICE_TYPE     = 0;
  parameter   IODELAY_CTRL    = 0;
  parameter   IODELAY_GROUP   = "dev_if_delay_group";
  // SDR = 0 / DDR = 1
  parameter   IF_TYPE         = 0;
  // serialization factor
  parameter   PARALLEL_WIDTH  = 8;
  localparam  DEVICE_6SERIES  = 1;
  localparam  DEVICE_7SERIES  = 0;
  localparam  SDR             = 0;
  localparam  DDR             = 1;
  // reset and clocks
  input           rst;
  input           clk;
  input           div_clk;
  // data interface
  output          data_s0;
  output          data_s1;
  output          data_s2;
  output          data_s3;
  output          data_s4;
  output          data_s5;
  output          data_s6;
  output          data_s7;
  input           data_in_p;
  input           data_in_n;
  // delay-data interface
  input           up_clk;
  input           up_dld;
  input    [ 4:0] up_dwdata;
  output   [ 4:0] up_drdata;
  // delay-control interface
  input           delay_clk;
  input           delay_rst;
  output          delay_locked;
  // internal signals
  wire            data_in_ibuf_s;
  wire            data_in_idelay_s;
  wire            data_shift1_s;
  wire            data_shift2_s;
  // delay controller
  generate
  if (IODELAY_CTRL == 1) begin
  (* IODELAY_GROUP = IODELAY_GROUP *)
  IDELAYCTRL i_delay_ctrl (
    .RST (delay_rst),
    .REFCLK (delay_clk),
    .RDY (delay_locked));
  end else begin
  assign delay_locked = 1'b1;
  end
  endgenerate
  // received data interface: ibuf -> idelay -> iserdes
  IBUFDS i_ibuf (
    .O(data_in_ibuf_s),
    .I(data_in_p),
    .IB(data_in_n)
  );
  if(DEVICE_TYPE == DEVICE_7SERIES) begin
    (* IODELAY_GROUP = IODELAY_GROUP *)
    IDELAYE2 #(
      .CINVCTRL_SEL ("FALSE"),
      .DELAY_SRC ("IDATAIN"),
      .HIGH_PERFORMANCE_MODE ("FALSE"),
      .IDELAY_TYPE ("VAR_LOAD"),
      .IDELAY_VALUE (0),
      .REFCLK_FREQUENCY (200.0),
      .PIPE_SEL ("FALSE"),
      .SIGNAL_PATTERN ("DATA"))
    i_rx_data_idelay (
      .CE (1'b0),
      .INC (1'b0),
      .DATAIN (1'b0),
      .LDPIPEEN (1'b0),
      .CINVCTRL (1'b0),
      .REGRST (1'b0),
      .C (up_clk),
      .IDATAIN (data_in_ibuf_s),
      .DATAOUT (data_in_idelay_s),
      .LD (up_dld),
      .CNTVALUEIN (up_dwdata),
      .CNTVALUEOUT (up_drdata));
    // Note: The first sample in time will be data_s7, the last data_s0!
    if(IF_TYPE == SDR) begin
      ISERDESE2 #(
        .DATA_RATE("SDR"),
        .DATA_WIDTH(PARALLEL_WIDTH),
        .DYN_CLKDIV_INV_EN("FALSE"),
        .DYN_CLK_INV_EN("FALSE"),
        .INIT_Q1(1'b0),
        .INIT_Q2(1'b0),
        .INIT_Q3(1'b0),
        .INIT_Q4(1'b0),
        .INTERFACE_TYPE("NETWORKING"),
        .IOBDELAY("IFD"),
        .NUM_CE(2),
        .OFB_USED("FALSE"),
        .SERDES_MODE("MASTER"),
        .SRVAL_Q1(1'b0),
        .SRVAL_Q2(1'b0),
        .SRVAL_Q3(1'b0),
        .SRVAL_Q4(1'b0))
      ISERDESE2_inst (
        .O(),
        .Q1(data_s0),
        .Q2(data_s1),
        .Q3(data_s2),
        .Q4(data_s3),
        .Q5(data_s4),
        .Q6(data_s5),
        .Q7(data_s6),
        .Q8(data_s7),
        .SHIFTOUT1(),
        .SHIFTOUT2(),
        .BITSLIP(1'b0),
        .CE1(1'b1),
        .CE2(1'b1),
        .CLKDIVP(1'b0),
        .CLK(clk),
        .CLKB(~clk),
        .CLKDIV(div_clk),
        .OCLK(1'b0),
        .DYNCLKDIVSEL(1'b0),
        .DYNCLKSEL(1'b0),
        .D(1'b0),
        .DDLY(data_in_idelay_s),
        .OFB(1'b0),
        .OCLKB(1'b0),
        .RST(rst),
        .SHIFTIN1(1'b0),
        .SHIFTIN2(1'b0)
      );
    end else begin
      ISERDESE2 #(
        .DATA_RATE("DDR"),
        .DATA_WIDTH(PARALLEL_WIDTH),
        .DYN_CLKDIV_INV_EN("FALSE"),
        .DYN_CLK_INV_EN("FALSE"),
        .INIT_Q1(1'b0),
        .INIT_Q2(1'b0),
        .INIT_Q3(1'b0),
        .INIT_Q4(1'b0),
        .INTERFACE_TYPE("NETWORKING"),
        .IOBDELAY("IFD"),
        .NUM_CE(2),
        .OFB_USED("FALSE"),
        .SERDES_MODE("MASTER"),
        .SRVAL_Q1(1'b0),
        .SRVAL_Q2(1'b0),
        .SRVAL_Q3(1'b0),
        .SRVAL_Q4(1'b0))
      ISERDESE2_inst (
        .O(),
        .Q1(data_s0),
        .Q2(data_s1),
        .Q3(data_s2),
        .Q4(data_s3),
        .Q5(data_s4),
        .Q6(data_s5),
        .Q7(data_s6),
        .Q8(data_s7),
        .SHIFTOUT1(),
        .SHIFTOUT2(),
        .BITSLIP(1'b0),
        .CE1(1'b1),
        .CE2(1'b1),
        .CLKDIVP(1'b0),
        .CLK(clk),
        .CLKB(~clk),
        .CLKDIV(div_clk),
        .OCLK(1'b0),
        .DYNCLKDIVSEL(1'b0),
        .DYNCLKSEL(1'b0),
        .D(1'b0),
        .DDLY(data_in_idelay_s),
        .OFB(1'b0),
        .OCLKB(1'b0),
        .RST(rst),
        .SHIFTIN1(1'b0),
        .SHIFTIN2(1'b0)
      );
    end
  end
    if(DEVICE_TYPE == DEVICE_6SERIES) begin
      (* IODELAY_GROUP = IODELAY_GROUP *)
      IODELAYE1 #(
        .CINVCTRL_SEL ("FALSE"),
        .DELAY_SRC ("I"),
        .HIGH_PERFORMANCE_MODE ("TRUE"),
        .IDELAY_TYPE ("VAR_LOADABLE"),
        .IDELAY_VALUE (0),
        .ODELAY_TYPE ("FIXED"),
        .ODELAY_VALUE (0),
        .REFCLK_FREQUENCY (200.0),
        .SIGNAL_PATTERN ("DATA"))
      i_rx_data_idelay (
        .T (1'b1),
        .CE (1'b0),
        .INC (1'b0),
        .CLKIN (1'b0),
        .DATAIN (1'b0),
        .ODATAIN (1'b0),
        .CINVCTRL (1'b0),
        .C (up_clk),
        .IDATAIN (data_in_ibuf_s),
        .DATAOUT (data_in_idelay_s),
        .RST (up_dld),
        .CNTVALUEIN (up_dwdata),
        .CNTVALUEOUT (up_drdata));
      ISERDESE1 #(
        .DATA_RATE("DDR"),
        .DATA_WIDTH(PARALLEL_WIDTH),
        .DYN_CLKDIV_INV_EN("FALSE"),
        .DYN_CLK_INV_EN("FALSE"),
        .INIT_Q1(1'b0),
        .INIT_Q2(1'b0),
        .INIT_Q3(1'b0),
        .INIT_Q4(1'b0),
        .INTERFACE_TYPE("NETWORKING"),
        .IOBDELAY("NONE"),
        .NUM_CE(1),
        .OFB_USED("FALSE"),
        .SERDES_MODE("MASTER"),
        .SRVAL_Q1(1'b0),
        .SRVAL_Q2(1'b0),
        .SRVAL_Q3(1'b0),
        .SRVAL_Q4(1'b0))
      i_serdes_m (
        .O(),
        .Q1(data_s0),
        .Q2(data_s1),
        .Q3(data_s2),
        .Q4(data_s3),
        .Q5(data_s4),
        .Q6(data_s5),
        .SHIFTOUT1(data_shift1_s),
        .SHIFTOUT2(data_shift2_s),
        .BITSLIP(1'b0),
        .CE1(1'b1),
        .CE2(1'b1),
        .CLK(clk),
        .CLKB(1'b0),
        .CLKDIV(div_clk),
        .OCLK(1'b0),
        .DYNCLKDIVSEL(1'b0),
        .DYNCLKSEL(1'b0),
        .D(data_in_idelay_s),
        .DDLY(1'b0),
        .OFB(1'b0),
        .RST(rst),
        .SHIFTIN1(1'b0),
        .SHIFTIN2(1'b0)
      );
      ISERDESE1 #(
        .DATA_RATE("DDR"),
        .DATA_WIDTH(PARALLEL_WIDTH),
        .DYN_CLKDIV_INV_EN("FALSE"),
        .DYN_CLK_INV_EN("FALSE"),
        .INIT_Q1(1'b0),
        .INIT_Q2(1'b0),
        .INIT_Q3(1'b0),
        .INIT_Q4(1'b0),
        .INTERFACE_TYPE("NETWORKING"),
        .IOBDELAY("NONE"),
        .NUM_CE(1),
        .OFB_USED("FALSE"),
        .SERDES_MODE("SLAVE"),
        .SRVAL_Q1(1'b0),
        .SRVAL_Q2(1'b0),
        .SRVAL_Q3(1'b0),
        .SRVAL_Q4(1'b0))
      i_serdes_s (
        .O(),
        .Q1(),
        .Q2(),
        .Q3(data_s6),
        .Q4(data_s7),
        .Q5(),
        .Q6(),
        .SHIFTOUT1(),
        .SHIFTOUT2(),
        .BITSLIP(1'b0),
        .CE1(1'b1),
        .CE2(1'b1),
        .CLK(clk),
        .CLKB(1'b0),
        .CLKDIV(div_clk),
        .OCLK(1'b0),
        .DYNCLKDIVSEL(1'b0),
        .DYNCLKSEL(1'b0),
        .D(1'b0),
        .DDLY(1'b0),
        .OFB(1'b0),
        .RST(rst),
        .SHIFTIN1(data_shift1_s),
        .SHIFTIN2(data_shift2_s));
      end
endmodule