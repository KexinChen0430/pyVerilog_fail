module BUFGCE #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter CE_TYPE = "SYNC",
  parameter [0:0] IS_CE_INVERTED = 1'b0,
  parameter [0:0] IS_I_INVERTED = 1'b0
)(
  output O,
  input CE,
  input I
);
// define constants
  localparam MODULE_NAME = "BUFGCE";
  localparam in_delay    = 0;
  localparam out_delay   = 0;
  localparam inclk_delay    = 0;
  localparam outclk_delay   = 0;
// Parameter encodings and registers
  localparam CE_TYPE_ASYNC = 1;
  localparam CE_TYPE_SYNC = 0;
// include dynamic registers - XILINX test only
  reg trig_attr = 1'b0;
`ifdef XIL_DR
  `include "BUFGCE_dr.v"
`else
  localparam [40:1] CE_TYPE_REG = CE_TYPE;
  localparam [0:0] IS_CE_INVERTED_REG = IS_CE_INVERTED;
  localparam [0:0] IS_I_INVERTED_REG = IS_I_INVERTED;
`endif
  wire CE_TYPE_BIN;
  wire IS_CE_INVERTED_BIN;
  wire IS_I_INVERTED_BIN;
`ifdef XIL_ATTR_TEST
  reg attr_test = 1'b1;
`else
  reg attr_test = 1'b0;
`endif
  reg attr_err = 1'b0;
  tri0 glblGSR = glbl.GSR;
  wire O_out;
  wire CE_in;
  wire I_in;
`ifdef XIL_TIMING
  wire CE_dly;
  wire I_dly;
  assign CE_in = (CE === 1'bz) || (CE_dly ^ IS_CE_INVERTED_BIN); // rv 1
  assign I_in = I_dly ^ IS_I_INVERTED_BIN;
`else
  assign CE_in = (CE === 1'bz) || (CE ^ IS_CE_INVERTED_BIN); // rv 1
  assign I_in = I ^ IS_I_INVERTED_BIN;
`endif
  assign O = O_out;
  assign CE_TYPE_BIN =
    (CE_TYPE_REG == "SYNC") ? CE_TYPE_SYNC :
    (CE_TYPE_REG == "ASYNC") ? CE_TYPE_ASYNC :
     CE_TYPE_SYNC;
  assign IS_CE_INVERTED_BIN = IS_CE_INVERTED_REG;
  assign IS_I_INVERTED_BIN = IS_I_INVERTED_REG;
  initial begin
    #1;
    trig_attr = ~trig_attr;
  end
  always @ (trig_attr) begin
  #1;
    if ((attr_test == 1'b1) ||
        ((CE_TYPE_REG != "SYNC") &&
         (CE_TYPE_REG != "ASYNC"))) begin
      $display("Error: [Unisim %s-101] CE_TYPE attribute is set to %s.  Legal values for this attribute are SYNC or ASYNC. Instance: %m", MODULE_NAME, CE_TYPE_REG);
      attr_err = 1'b1;
    end
    if ((attr_test == 1'b1) ||
        ((IS_CE_INVERTED_REG !== 1'b0) && (IS_CE_INVERTED_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-102] IS_CE_INVERTED attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, IS_CE_INVERTED_REG);
      attr_err = 1'b1;
    end
    if ((attr_test == 1'b1) ||
        ((IS_I_INVERTED_REG !== 1'b0) && (IS_I_INVERTED_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-103] IS_I_INVERTED attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, IS_I_INVERTED_REG);
      attr_err = 1'b1;
    end
    if (attr_err == 1'b1) #1 $finish;
  end
  wire ce_inv, ice, CE_TYPE_INV;
  reg enable_clk;
  assign CE_TYPE_INV = ~CE_TYPE_BIN;
  assign ce_inv = ~CE_in;
  assign ice = ~(CE_TYPE_INV & I_in);
  always @(ice or ce_inv or glblGSR) begin
  if (glblGSR)
    enable_clk <= 1'b1;
  else if (ice)
    enable_clk <= ~ce_inv;
  end
  assign O_out = enable_clk & I_in ;
`ifdef XIL_TIMING
  reg notifier;
  wire sh_i_en_p;
  wire sh_i_en_n;
  assign sh_i_en_p = ~IS_I_INVERTED_BIN;
  assign sh_i_en_n = IS_I_INVERTED_BIN;
  specify
    (CE => O) = (0:0:0, 0:0:0);
    (I => O) = (0:0:0, 0:0:0);
    $period (negedge I, 0:0:0, notifier);
    $period (posedge I, 0:0:0, notifier);
    $setuphold (negedge I, negedge CE, 0:0:0, 0:0:0, notifier,sh_i_en_n,sh_i_en_n, I_dly, CE_dly);
    $setuphold (negedge I, posedge CE, 0:0:0, 0:0:0, notifier,sh_i_en_n,sh_i_en_n, I_dly, CE_dly);
    $setuphold (posedge I, negedge CE, 0:0:0, 0:0:0, notifier,sh_i_en_p,sh_i_en_p, I_dly, CE_dly);
    $setuphold (posedge I, posedge CE, 0:0:0, 0:0:0, notifier,sh_i_en_p,sh_i_en_p, I_dly, CE_dly);
    $width (negedge CE, 0:0:0, 0, notifier);
    $width (posedge CE, 0:0:0, 0, notifier);
    specparam PATHPULSE$ = 0;
  endspecify
`endif
endmodule