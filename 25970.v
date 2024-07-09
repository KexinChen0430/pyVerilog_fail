module dsp_t1_10x9x32 (
    input  [ 9:0] a_i,
    input  [ 8:0] b_i,
    input  [ 5:0] acc_fir_i,
    output [18:0] z_o,
    output [ 8:0] dly_b_o,
    (* clkbuf_sink *)
    input         clock_i,
    input         reset_i,
    input  [2:0]  feedback_i,
    input         load_acc_i,
    input         unsigned_a_i,
    input         unsigned_b_i,
    input  [2:0]  output_select_i,
    input         saturate_enable_i,
    input  [5:0]  shift_right_i,
    input         round_i,
    input         subtract_i,
    input         register_inputs_i
);
    parameter [9:0] COEFF_0 = 10'd0;
    parameter [9:0] COEFF_1 = 10'd0;
    parameter [9:0] COEFF_2 = 10'd0;
    parameter [9:0] COEFF_3 = 10'd0;
    wire [37:0] z;
    wire [17:0] dly_b;
    QL_DSP2 # (
        .MODE_BITS          ({10'd0, COEFF_3,
                              10'd0, COEFF_2,
                              10'd0, COEFF_1,
                              10'd0, COEFF_0})
    ) _TECHMAP_REPLACE_ (
        .a                  ({10'd0, a_i}),
        .b                  ({ 9'd0, b_i}),
        .acc_fir            (acc_fir_i),
        .z                  (z),
        .dly_b              (dly_b),
        .clk                (clock_i),
        .reset              (reset_i),
        .feedback           (feedback_i),
        .load_acc           (load_acc_i),
        .unsigned_a         (unsigned_a_i),
        .unsigned_b         (unsigned_b_i),
        .f_mode             (1'b1), // Enable fractuation, Use the lower half
        .output_select      (output_select_i),
        .saturate_enable    (saturate_enable_i),
        .shift_right        (shift_right_i),
        .round              (round_i),
        .subtract           (subtract_i),
        .register_inputs    (register_inputs_i)
    );
    assign z_o = z[18:0];
    assign dly_b_o = dly_b_o[8:0];
endmodule