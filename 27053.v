module wasca_nios2_gen2_0_cpu_ociram_sp_ram_module (
                                                     // inputs:
                                                      address,
                                                      byteenable,
                                                      clock,
                                                      data,
                                                      reset_req,
                                                      wren,
                                                     // outputs:
                                                      q
                                                   )
;
  parameter lpm_file = "UNUSED";
  output  [ 31: 0] q;
  input   [  7: 0] address;
  input   [  3: 0] byteenable;
  input            clock;
  input   [ 31: 0] data;
  input            reset_req;
  input            wren;
  wire             clocken;
  wire    [ 31: 0] q;
  wire    [ 31: 0] ram_q;
  assign q = ram_q;
  assign clocken = ~reset_req;
  altsyncram the_altsyncram
    (
      .address_a (address),
      .byteena_a (byteenable),
      .clock0 (clock),
      .clocken0 (clocken),
      .data_a (data),
      .q_a (ram_q),
      .wren_a (wren)
    );
  defparam the_altsyncram.init_file = lpm_file,
           the_altsyncram.maximum_depth = 0,
           the_altsyncram.numwords_a = 256,
           the_altsyncram.operation_mode = "SINGLE_PORT",
           the_altsyncram.outdata_reg_a = "UNREGISTERED",
           the_altsyncram.ram_block_type = "AUTO",
           the_altsyncram.width_a = 32,
           the_altsyncram.width_byteena_a = 4,
           the_altsyncram.widthad_a = 8;
endmodule