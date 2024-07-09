module altera_mem_if_ddr3_phy_0001_qsys_sequencer_cpu_inst_traceram_lpm_dram_bdp_component_module (
                                                                                                    // inputs:
                                                                                                     address_a,
                                                                                                     address_b,
                                                                                                     clock0,
                                                                                                     clock1,
                                                                                                     clocken0,
                                                                                                     clocken1,
                                                                                                     data_a,
                                                                                                     data_b,
                                                                                                     wren_a,
                                                                                                     wren_b,
                                                                                                    // outputs:
                                                                                                     q_a,
                                                                                                     q_b
                                                                                                  )
;
  parameter lpm_file = "UNUSED";
  output  [ 35: 0] q_a;
  output  [ 35: 0] q_b;
  input   [  6: 0] address_a;
  input   [  6: 0] address_b;
  input            clock0;
  input            clock1;
  input            clocken0;
  input            clocken1;
  input   [ 35: 0] data_a;
  input   [ 35: 0] data_b;
  input            wren_a;
  input            wren_b;
  wire    [ 35: 0] q_a;
  wire    [ 35: 0] q_b;
  altsyncram the_altsyncram
    (
      .address_a (address_a),
      .address_b (address_b),
      .clock0 (clock0),
      .clock1 (clock1),
      .clocken0 (clocken0),
      .clocken1 (clocken1),
      .data_a (data_a),
      .data_b (data_b),
      .q_a (q_a),
      .q_b (q_b),
      .wren_a (wren_a),
      .wren_b (wren_b)
    );
  defparam the_altsyncram.address_aclr_a = "NONE",
           the_altsyncram.address_aclr_b = "NONE",
           the_altsyncram.address_reg_b = "CLOCK1",
           the_altsyncram.indata_aclr_a = "NONE",
           the_altsyncram.indata_aclr_b = "NONE",
           the_altsyncram.init_file = lpm_file,
           the_altsyncram.intended_device_family = "STRATIXIV",
           the_altsyncram.lpm_type = "altsyncram",
           the_altsyncram.numwords_a = 128,
           the_altsyncram.numwords_b = 128,
           the_altsyncram.operation_mode = "BIDIR_DUAL_PORT",
           the_altsyncram.outdata_aclr_a = "NONE",
           the_altsyncram.outdata_aclr_b = "NONE",
           the_altsyncram.outdata_reg_a = "UNREGISTERED",
           the_altsyncram.outdata_reg_b = "UNREGISTERED",
           the_altsyncram.ram_block_type = "AUTO",
           the_altsyncram.read_during_write_mode_mixed_ports = "OLD_DATA",
           the_altsyncram.width_a = 36,
           the_altsyncram.width_b = 36,
           the_altsyncram.widthad_a = 7,
           the_altsyncram.widthad_b = 7,
           the_altsyncram.wrcontrol_aclr_a = "NONE",
           the_altsyncram.wrcontrol_aclr_b = "NONE";
endmodule