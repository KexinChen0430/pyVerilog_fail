module cpu_mult_cell (
                       // inputs:
                        M_mul_src1,
                        M_mul_src2,
                        clk,
                        reset_n,
                       // outputs:
                        M_mul_cell_result
                     )
;
  output  [ 31: 0] M_mul_cell_result;
  input   [ 31: 0] M_mul_src1;
  input   [ 31: 0] M_mul_src2;
  input            clk;
  input            reset_n;
  wire    [ 31: 0] M_mul_cell_result;
  wire    [ 31: 0] M_mul_cell_result_part_1;
  wire    [ 15: 0] M_mul_cell_result_part_2;
  wire             mul_clr;
  assign mul_clr = ~reset_n;
  altmult_add the_altmult_add_part_1
    (
      .aclr0 (mul_clr),
      .clock0 (clk),
      .dataa (M_mul_src1[15 : 0]),
      .datab (M_mul_src2[15 : 0]),
      .ena0 (1'b1),
      .result (M_mul_cell_result_part_1)
    );
  defparam the_altmult_add_part_1.addnsub_multiplier_pipeline_aclr1 = "ACLR0",
           the_altmult_add_part_1.addnsub_multiplier_pipeline_register1 = "CLOCK0",
           the_altmult_add_part_1.addnsub_multiplier_register1 = "UNREGISTERED",
           the_altmult_add_part_1.dedicated_multiplier_circuitry = "YES",
           the_altmult_add_part_1.input_register_a0 = "UNREGISTERED",
           the_altmult_add_part_1.input_register_b0 = "UNREGISTERED",
           the_altmult_add_part_1.input_source_a0 = "DATAA",
           the_altmult_add_part_1.input_source_b0 = "DATAB",
           the_altmult_add_part_1.intended_device_family = "CYCLONEII",
           the_altmult_add_part_1.lpm_type = "altmult_add",
           the_altmult_add_part_1.multiplier1_direction = "ADD",
           the_altmult_add_part_1.multiplier_aclr0 = "ACLR0",
           the_altmult_add_part_1.multiplier_register0 = "CLOCK0",
           the_altmult_add_part_1.number_of_multipliers = 1,
           the_altmult_add_part_1.output_register = "UNREGISTERED",
           the_altmult_add_part_1.port_addnsub1 = "PORT_UNUSED",
           the_altmult_add_part_1.port_signa = "PORT_UNUSED",
           the_altmult_add_part_1.port_signb = "PORT_UNUSED",
           the_altmult_add_part_1.representation_a = "UNSIGNED",
           the_altmult_add_part_1.representation_b = "UNSIGNED",
           the_altmult_add_part_1.signed_pipeline_aclr_a = "ACLR0",
           the_altmult_add_part_1.signed_pipeline_aclr_b = "ACLR0",
           the_altmult_add_part_1.signed_pipeline_register_a = "CLOCK0",
           the_altmult_add_part_1.signed_pipeline_register_b = "CLOCK0",
           the_altmult_add_part_1.signed_register_a = "UNREGISTERED",
           the_altmult_add_part_1.signed_register_b = "UNREGISTERED",
           the_altmult_add_part_1.width_a = 16,
           the_altmult_add_part_1.width_b = 16,
           the_altmult_add_part_1.width_result = 32;
  altmult_add the_altmult_add_part_2
    (
      .aclr0 (mul_clr),
      .clock0 (clk),
      .dataa (M_mul_src1[31 : 16]),
      .datab (M_mul_src2[15 : 0]),
      .ena0 (1'b1),
      .result (M_mul_cell_result_part_2)
    );
  defparam the_altmult_add_part_2.addnsub_multiplier_pipeline_aclr1 = "ACLR0",
           the_altmult_add_part_2.addnsub_multiplier_pipeline_register1 = "CLOCK0",
           the_altmult_add_part_2.addnsub_multiplier_register1 = "UNREGISTERED",
           the_altmult_add_part_2.dedicated_multiplier_circuitry = "YES",
           the_altmult_add_part_2.input_register_a0 = "UNREGISTERED",
           the_altmult_add_part_2.input_register_b0 = "UNREGISTERED",
           the_altmult_add_part_2.input_source_a0 = "DATAA",
           the_altmult_add_part_2.input_source_b0 = "DATAB",
           the_altmult_add_part_2.intended_device_family = "CYCLONEII",
           the_altmult_add_part_2.lpm_type = "altmult_add",
           the_altmult_add_part_2.multiplier1_direction = "ADD",
           the_altmult_add_part_2.multiplier_aclr0 = "ACLR0",
           the_altmult_add_part_2.multiplier_register0 = "CLOCK0",
           the_altmult_add_part_2.number_of_multipliers = 1,
           the_altmult_add_part_2.output_register = "UNREGISTERED",
           the_altmult_add_part_2.port_addnsub1 = "PORT_UNUSED",
           the_altmult_add_part_2.port_signa = "PORT_UNUSED",
           the_altmult_add_part_2.port_signb = "PORT_UNUSED",
           the_altmult_add_part_2.representation_a = "UNSIGNED",
           the_altmult_add_part_2.representation_b = "UNSIGNED",
           the_altmult_add_part_2.signed_pipeline_aclr_a = "ACLR0",
           the_altmult_add_part_2.signed_pipeline_aclr_b = "ACLR0",
           the_altmult_add_part_2.signed_pipeline_register_a = "CLOCK0",
           the_altmult_add_part_2.signed_pipeline_register_b = "CLOCK0",
           the_altmult_add_part_2.signed_register_a = "UNREGISTERED",
           the_altmult_add_part_2.signed_register_b = "UNREGISTERED",
           the_altmult_add_part_2.width_a = 16,
           the_altmult_add_part_2.width_b = 16,
           the_altmult_add_part_2.width_result = 16;
  assign M_mul_cell_result = {M_mul_cell_result_part_1[31 : 16] +
    M_mul_cell_result_part_2,
    M_mul_cell_result_part_1[15 : 0]};
endmodule