module QL_DSP2 ( // TODO: Name subject to change
      input  [19:0] a,
      input  [17:0] b,
      input  [3:0] acc_fir,
      output [37:0] z,
      output [17:0] dly_b,
    (* clkbuf_sink *)
    input         clk,
    input         reset,
    input  [2:0]  feedback,
    input         load_acc,
    input         unsigned_a,
    input         unsigned_b,
    input         f_mode,
    input  [2:0]  output_select,
    input         saturate_enable,
    input  [5:0]  shift_right,
    input         round,
    input         subtract,
    input         register_inputs
);
    parameter [19:0] COEFF_0 = 20'd0;
    parameter [19:0] COEFF_1 = 20'd0;
    parameter [19:0] COEFF_2 = 20'd0;
    parameter [19:0] COEFF_3 = 20'd0;
      localparam NBITS_ACC = 64;
      localparam NBITS_A = 20;
      localparam NBITS_B = 18;
      localparam NBITS_Z = 38;
      localparam NBITS_COEF = 20;
      localparam NBITS_AF = 4;
      wire [NBITS_Z-1:0] dsp_full_z;
      wire [(NBITS_Z/2)-1:0] dsp_frac0_z;
      wire [(NBITS_Z/2)-1:0] dsp_frac1_z;
      wire [NBITS_B-1:0] dsp_full_dly_b;
      wire [(NBITS_B/2)-1:0] dsp_frac0_dly_b;
      wire [(NBITS_B/2)-1:0] dsp_frac1_dly_b;
      assign z = f_mode ? {dsp_frac1_z, dsp_frac0_z} : dsp_full_z;
      assign dly_b = f_mode ? {dsp_frac1_dly_b, dsp_frac0_dly_b} : dsp_full_dly_b;
    // Output used when fmode == 1
        dsp_t1_sim #(
        .NBITS_A(NBITS_A/2),
            .NBITS_B(NBITS_B/2),
            .NBITS_ACC(NBITS_ACC/2),
            .NBITS_Z(NBITS_Z/2),
            .NBITS_COEF(NBITS_COEF/2),
            .NBITS_AF(NBITS_AF/2)
        ) dsp_frac0 (
            .a_i(a[(NBITS_A/2)-1:0]),
            .b_i(b[(NBITS_B/2)-1:0]),
            .z_o(dsp_frac0_z),
            .dly_b_o(dsp_frac0_dly_b),
            .acc_fir_i(acc_fir[(NBITS_AF/2)-1:0]),
            .feedback_i(feedback),
            .load_acc_i(load_acc),
            .unsigned_a_i(unsigned_a),
            .unsigned_b_i(unsigned_b),
            .clock_i(clk),
            .reset_n_i(reset),
            .saturate_enable_i(saturate_enable),
            .output_select_i(output_select),
            .round_i(round),
            .shift_right_i(shift_right),
            .subtract_i(subtract),
            .register_inputs_i(register_inputs),
            .coef_0_i(COEFF_0[(NBITS_COEF/2)-1:0]),
            .coef_1_i(COEFF_1[(NBITS_COEF/2)-1:0]),
            .coef_2_i(COEFF_2[(NBITS_COEF/2)-1:0]),
            .coef_3_i(COEFF_3[(NBITS_COEF/2)-1:0])
        );
    // Output used when fmode == 1
        dsp_t1_sim #(
        .NBITS_A(NBITS_A/2),
            .NBITS_B(NBITS_B/2),
            .NBITS_ACC(NBITS_ACC/2),
            .NBITS_Z(NBITS_Z/2),
            .NBITS_COEF(NBITS_COEF/2),
            .NBITS_AF(NBITS_AF/2)
        ) dsp_frac1 (
            .a_i(a[NBITS_A-1:NBITS_A/2]),
            .b_i(b[NBITS_B-1:NBITS_B/2]),
            .z_o(dsp_frac1_z),
            .dly_b_o(dsp_frac1_dly_b),
            .acc_fir_i(acc_fir[NBITS_AF-1:NBITS_AF/2]),
            .feedback_i(feedback),
            .load_acc_i(load_acc),
            .unsigned_a_i(unsigned_a),
            .unsigned_b_i(unsigned_b),
            .clock_i(clk),
            .reset_n_i(reset),
            .saturate_enable_i(saturate_enable),
            .output_select_i(output_select),
            .round_i(round),
            .shift_right_i(shift_right),
            .subtract_i(subtract),
            .register_inputs_i(register_inputs),
            .coef_0_i(COEFF_0[NBITS_COEF-1:NBITS_COEF/2]),
            .coef_1_i(COEFF_1[NBITS_COEF-1:NBITS_COEF/2]),
            .coef_2_i(COEFF_2[NBITS_COEF-1:NBITS_COEF/2]),
            .coef_3_i(COEFF_3[NBITS_COEF-1:NBITS_COEF/2])
        );
    // Output used when fmode == 0
        dsp_t1_sim #(
             .NBITS_A(NBITS_A),
             .NBITS_B(NBITS_B),
             .NBITS_ACC(NBITS_ACC),
             .NBITS_Z(NBITS_Z),
             .NBITS_COEF(NBITS_COEF),
             .NBITS_AF(NBITS_AF)
        ) dsp_full (
            .a_i(a),
            .b_i(b),
            .z_o(dsp_full_z),
            .dly_b_o(dsp_full_dly_b),
            .acc_fir_i(acc_fir),
            .feedback_i(feedback),
            .load_acc_i(load_acc),
            .unsigned_a_i(unsigned_a),
            .unsigned_b_i(unsigned_b),
            .clock_i(clk),
            .reset_n_i(reset),
            .saturate_enable_i(saturate_enable),
            .output_select_i(output_select),
            .round_i(round),
            .shift_right_i(shift_right),
            .subtract_i(subtract),
            .register_inputs_i(register_inputs),
            .coef_0_i(COEFF_0),
            .coef_1_i(COEFF_1),
            .coef_2_i(COEFF_2),
            .coef_3_i(COEFF_3)
        );
endmodule