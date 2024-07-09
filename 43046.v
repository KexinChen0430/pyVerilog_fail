module ad_mul_u16 (
  // data_p = data_a * data_b;
  clk,
  data_a,
  data_b,
  data_p,
  // delay interface
  ddata_in,
  ddata_out);
  // delayed data bus width
  parameter   DELAY_DATA_WIDTH = 16;
  localparam  DW = DELAY_DATA_WIDTH - 1;
  // data_p = data_a * data_b;
  input           clk;
  input   [15:0]  data_a;
  input   [15:0]  data_b;
  output  [31:0]  data_p;
  // delay interface
  input   [DW:0]  ddata_in;
  output  [DW:0]  ddata_out;
  // internal registers
  reg     [DW:0]  p1_ddata = 'd0;
  reg     [DW:0]  p2_ddata = 'd0;
  reg     [DW:0]  ddata_out = 'd0;
  // internal signals
  // a/b reg, m-reg, p-reg delay match
  always @(posedge clk) begin
    p1_ddata <= ddata_in;
    p2_ddata <= p1_ddata;
    ddata_out <= p2_ddata;
  end
  lpm_mult  i_mult_macro (
        .clock (clk),
        .dataa (data_a),
        .datab (data_b),
        .result (data_p),
        .aclr (1'b0),
        .clken (1'b1),
        .sum (1'b0));
  defparam
    lpm_mult_component.lpm_hint = "MAXIMIZE_SPEED=5",
    lpm_mult_component.lpm_pipeline = 3,
    lpm_mult_component.lpm_representation = "UNSIGNED",
    lpm_mult_component.lpm_type = "LPM_MULT",
    lpm_mult_component.lpm_widtha = 16,
    lpm_mult_component.lpm_widthb = 16,
    lpm_mult_component.lpm_widthp = 32;
endmodule