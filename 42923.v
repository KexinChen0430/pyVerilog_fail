module dsp_t1_20x18x64 (
    input  [19:0] a_i,
    input  [17:0] b_i,
    input  [ 3:0] acc_fir_i,
    output [37:0] z_o,
    output [17:0] dly_b_o,
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
    parameter [19:0] COEFF_0 = 20'd0;
    parameter [19:0] COEFF_1 = 20'd0;
    parameter [19:0] COEFF_2 = 20'd0;
    parameter [19:0] COEFF_3 = 20'd0;
   QL_DSP2 #(
        .COEFF_0(COEFF_0),
        .COEFF_1(COEFF_1),
        .COEFF_2(COEFF_2),
        .COEFF_3(COEFF_3)
   ) dsp (
    .a(a_i),
    .b(b_i),
    .z(z_o),
    .dly_b(dly_b_o),
    .f_mode(1'b0),  // 20x18x64 DSP
    .acc_fir(acc_fir_i),
    .feedback(feedback_i),
    .load_acc(load_acc_i),
    .unsigned_a(unsigned_a_i),
    .unsigned_b(unsigned_b_i),
    .clk(clock_i),
    .reset(reset_i),
    .saturate_enable(saturate_enable_i),
    .output_select(output_select_i),
    .round(round_i),
    .shift_right(shift_right_i),
    .subtract(subtract_i),
    .register_inputs(register_inputs_i)
    );
endmodule