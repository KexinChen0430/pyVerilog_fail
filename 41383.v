module system1_onchip_memory2_0 (
                                  // inputs:
                                   address,
                                   byteenable,
                                   chipselect,
                                   clk,
                                   clken,
                                   freeze,
                                   reset,
                                   reset_req,
                                   write,
                                   writedata,
                                  // outputs:
                                   readdata
                                )
;
  parameter INIT_FILE = "system1_onchip_memory2_0.hex";
  output  [ 31: 0] readdata;
  input   [ 15: 0] address;
  input   [  3: 0] byteenable;
  input            chipselect;
  input            clk;
  input            clken;
  input            freeze;
  input            reset;
  input            reset_req;
  input            write;
  input   [ 31: 0] writedata;
wire             clocken0;
wire    [ 31: 0] readdata;
wire             wren;
  assign wren = chipselect & write;
  assign clocken0 = clken & ~reset_req;
  altsyncram the_altsyncram
    (
      .address_a (address),
      .byteena_a (byteenable),
      .clock0 (clk),
      .clocken0 (clocken0),
      .data_a (writedata),
      .q_a (readdata),
      .wren_a (wren)
    );
  defparam the_altsyncram.byte_size = 8,
           the_altsyncram.init_file = INIT_FILE,
           the_altsyncram.lpm_type = "altsyncram",
           the_altsyncram.maximum_depth = 51200,
           the_altsyncram.numwords_a = 51200,
           the_altsyncram.operation_mode = "SINGLE_PORT",
           the_altsyncram.outdata_reg_a = "UNREGISTERED",
           the_altsyncram.ram_block_type = "AUTO",
           the_altsyncram.read_during_write_mode_mixed_ports = "DONT_CARE",
           the_altsyncram.read_during_write_mode_port_a = "DONT_CARE",
           the_altsyncram.width_a = 32,
           the_altsyncram.width_byteena_a = 4,
           the_altsyncram.widthad_a = 16;
  //s1, which is an e_avalon_slave
  //s2, which is an e_avalon_slave
endmodule