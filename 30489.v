module nios_dut_nios2_gen2_0_cpu_register_bank_a_module (
                                                          // inputs:
                                                           clock,
                                                           data,
                                                           rdaddress,
                                                           wraddress,
                                                           wren,
                                                          // outputs:
                                                           q
                                                        )
;
  parameter lpm_file = "UNUSED";
  output  [ 31: 0] q;
  input            clock;
  input   [ 31: 0] data;
  input   [  4: 0] rdaddress;
  input   [  4: 0] wraddress;
  input            wren;
  wire    [ 31: 0] q;
  wire    [ 31: 0] ram_data;
  wire    [ 31: 0] ram_q;
  assign q = ram_q;
  assign ram_data = data;
  altsyncram the_altsyncram
    (
      .address_a (wraddress),
      .address_b (rdaddress),
      .clock0 (clock),
      .data_a (ram_data),
      .q_b (ram_q),
      .wren_a (wren)
    );
  defparam the_altsyncram.address_reg_b = "CLOCK0",
           the_altsyncram.init_file = lpm_file,
           the_altsyncram.maximum_depth = 0,
           the_altsyncram.numwords_a = 32,
           the_altsyncram.numwords_b = 32,
           the_altsyncram.operation_mode = "DUAL_PORT",
           the_altsyncram.outdata_reg_b = "UNREGISTERED",
           the_altsyncram.ram_block_type = "AUTO",
           the_altsyncram.rdcontrol_reg_b = "CLOCK0",
           the_altsyncram.read_during_write_mode_mixed_ports = "DONT_CARE",
           the_altsyncram.width_a = 32,
           the_altsyncram.width_b = 32,
           the_altsyncram.widthad_a = 5,
           the_altsyncram.widthad_b = 5;
endmodule