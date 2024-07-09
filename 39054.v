module nios_nios2_gen2_0_cpu_mult_cell (
                                         // inputs:
                                          A_en,
                                          E_ctrl_mul_shift_src1_signed,
                                          E_ctrl_mul_shift_src2_signed,
                                          E_src1_mul_cell,
                                          E_src2_mul_cell,
                                          M_en,
                                          clk,
                                          reset_n,
                                         // outputs:
                                          A_mul_cell_result
                                       )
;
  output  [ 63: 0] A_mul_cell_result;
  input            A_en;
  input            E_ctrl_mul_shift_src1_signed;
  input            E_ctrl_mul_shift_src2_signed;
  input   [ 31: 0] E_src1_mul_cell;
  input   [ 31: 0] E_src2_mul_cell;
  input            M_en;
  input            clk;
  input            reset_n;
  wire    [ 63: 0] A_mul_cell_result;
  wire             mul_clr;
  assign mul_clr = ~reset_n;
  altera_mult_add the_altmult_add
    (
      .aclr0 (mul_clr),
      .aclr1 (mul_clr),
      .clock0 (clk),
      .clock1 (clk),
      .dataa (E_src1_mul_cell),
      .datab (E_src2_mul_cell),
      .ena0 (M_en),
      .ena1 (A_en),
      .result (A_mul_cell_result),
      .signa (E_ctrl_mul_shift_src1_signed),
      .signb (E_ctrl_mul_shift_src2_signed)
    );
  defparam the_altmult_add.addnsub_multiplier_aclr1 = "UNUSED",
           the_altmult_add.addnsub_multiplier_pipeline_aclr1 = "UNUSED",
           the_altmult_add.addnsub_multiplier_register1 = "CLOCK0",
           the_altmult_add.dedicated_multiplier_circuitry = "YES",
           the_altmult_add.input_aclr_a0 = "ACLR0",
           the_altmult_add.input_aclr_b0 = "ACLR0",
           the_altmult_add.input_register_a0 = "CLOCK0",
           the_altmult_add.input_register_b0 = "CLOCK0",
           the_altmult_add.input_source_a0 = "DATAA",
           the_altmult_add.input_source_b0 = "DATAB",
           the_altmult_add.lpm_type = "altera_mult_add",
           the_altmult_add.multiplier1_direction = "ADD",
           the_altmult_add.multiplier_register0 = "UNREGISTERED",
           the_altmult_add.number_of_multipliers = 1,
           the_altmult_add.output_aclr = "ACLR1",
           the_altmult_add.output_register = "CLOCK1",
           the_altmult_add.port_addnsub1 = "PORT_UNUSED",
           the_altmult_add.port_addnsub3 = "PORT_UNUSED",
           the_altmult_add.port_signa = "PORT_USED",
           the_altmult_add.port_signb = "PORT_USED",
           the_altmult_add.selected_device_family = "CYCLONEV",
           the_altmult_add.signed_aclr_a = "ACLR0",
           the_altmult_add.signed_aclr_b = "ACLR0",
           the_altmult_add.signed_pipeline_register_a = "UNREGISTERED",
           the_altmult_add.signed_pipeline_register_b = "UNREGISTERED",
           the_altmult_add.signed_register_a = "CLOCK0",
           the_altmult_add.signed_register_b = "CLOCK0",
           the_altmult_add.width_a = 32,
           the_altmult_add.width_b = 32,
           the_altmult_add.width_result = 64;
endmodule