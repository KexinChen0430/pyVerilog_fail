module altera_mem_if_ddr3_phy_0001_qsys_sequencer_sequencer_ram (
                                                                  // inputs:
                                                                   address,
                                                                   byteenable,
                                                                   chipselect,
                                                                   clk,
                                                                   clken,
                                                                   reset,
                                                                   write,
                                                                   writedata,
                                                                  // outputs:
                                                                   readdata
                                                                )
;
  parameter INIT_FILE = "../altera_mem_if_ddr3_phy_0001_qsys_sequencer_sequencer_ram.hex";
  output  [ 31: 0] readdata;
  input   [  8: 0] address;
  input   [  3: 0] byteenable;
  input            chipselect;
  input            clk;
  input            clken;
  input            reset;
  input            write;
  input   [ 31: 0] writedata;
  wire    [ 31: 0] readdata;
  wire             wren;
  assign wren = chipselect & write;
  //s1, which is an e_avalon_slave
  //s2, which is an e_avalon_slave
//synthesis translate_off
  altsyncram the_altsyncram
    (
      .address_a (address),
      .byteena_a (byteenable),
      .clock0 (clk),
      .clocken0 (clken),
      .data_a (writedata),
      .q_a (readdata),
      .wren_a (wren)
    );
  defparam the_altsyncram.byte_size = 8,
           the_altsyncram.init_file = "UNUSED",
           the_altsyncram.lpm_type = "altsyncram",
           the_altsyncram.maximum_depth = 512,
           the_altsyncram.numwords_a = 512,
           the_altsyncram.operation_mode = "SINGLE_PORT",
           the_altsyncram.outdata_reg_a = "UNREGISTERED",
           the_altsyncram.ram_block_type = "AUTO",
           the_altsyncram.read_during_write_mode_mixed_ports = "DONT_CARE",
           the_altsyncram.width_a = 32,
           the_altsyncram.width_byteena_a = 4,
           the_altsyncram.widthad_a = 9;
//synthesis translate_on
//synthesis read_comments_as_HDL on
//  altsyncram the_altsyncram
//    (
//      .address_a (address),
//      .byteena_a (byteenable),
//      .clock0 (clk),
//      .clocken0 (clken),
//      .data_a (writedata),
//      .q_a (readdata),
//      .wren_a (wren)
//    );
//  defparam the_altsyncram.byte_size = 8,
//           the_altsyncram.init_file = "UNUSED",
//           the_altsyncram.lpm_type = "altsyncram",
//           the_altsyncram.maximum_depth = 512,
//           the_altsyncram.numwords_a = 512,
//           the_altsyncram.operation_mode = "SINGLE_PORT",
//           the_altsyncram.outdata_reg_a = "UNREGISTERED",
//           the_altsyncram.ram_block_type = "AUTO",
//           the_altsyncram.read_during_write_mode_mixed_ports = "DONT_CARE",
//           the_altsyncram.width_a = 32,
//           the_altsyncram.width_byteena_a = 4,
//           the_altsyncram.widthad_a = 9;
//synthesis read_comments_as_HDL off
endmodule