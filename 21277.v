module epcs_flash_controller (
                               // inputs:
                                address,
                                chipselect,
                                clk,
                                read_n,
                                reset_n,
                                write_n,
                                writedata,
                               // outputs:
                                dataavailable,
                                endofpacket,
                                irq,
                                readdata,
                                readyfordata
                             )
;
  parameter INIT_FILE = "epcs_flash_controller_boot_rom.hex";
  output           dataavailable;
  output           endofpacket;
  output           irq;
  output  [ 31: 0] readdata;
  output           readyfordata;
  input   [  8: 0] address;
  input            chipselect;
  input            clk;
  input            read_n;
  input            reset_n;
  input            write_n;
  input   [ 31: 0] writedata;
  wire             MISO;
  wire             MOSI;
  wire             SCLK;
  wire             SS_n;
  wire    [ 15: 0] data_from_cpu;
  wire    [ 15: 0] data_to_cpu;
  wire             dataavailable;
  wire             endofpacket;
  wire             epcs_select;
  wire             irq;
  wire    [  2: 0] mem_addr;
  wire    [ 31: 0] readdata;
  wire             readyfordata;
  wire    [ 31: 0] rom_readdata;
  epcs_flash_controller_sub the_epcs_flash_controller_sub
    (
      .MISO          (MISO),
      .MOSI          (MOSI),
      .SCLK          (SCLK),
      .SS_n          (SS_n),
      .clk           (clk),
      .data_from_cpu (data_from_cpu),
      .data_to_cpu   (data_to_cpu),
      .dataavailable (dataavailable),
      .endofpacket   (endofpacket),
      .epcs_select   (epcs_select),
      .irq           (irq),
      .mem_addr      (mem_addr),
      .read_n        (read_n),
      .readyfordata  (readyfordata),
      .reset_n       (reset_n),
      .write_n       (write_n)
    );
  //epcs_control_port, which is an e_avalon_slave
  tornado_epcs_flash_controller_atom the_tornado_epcs_flash_controller_atom
    (
      .data0out (MISO),
      .dclkin   (SCLK),
      .oe       (1'b0),
      .scein    (SS_n),
      .sdoin    (MOSI)
    );
  assign epcs_select = chipselect && (address[7] );
  assign mem_addr = address;
  assign data_from_cpu = writedata;
  assign readdata = epcs_select ? data_to_cpu : rom_readdata;
//synthesis translate_off
  altsyncram the_boot_copier_rom
    (
      .address_a (address[6 : 0]),
      .clock0 (clk),
      .q_a (rom_readdata)
    );
  defparam the_boot_copier_rom.byte_size = 8,
           the_boot_copier_rom.init_file = INIT_FILE,
           the_boot_copier_rom.lpm_type = "altsyncram",
           the_boot_copier_rom.numwords_a = 128,
           the_boot_copier_rom.operation_mode = "ROM",
           the_boot_copier_rom.outdata_reg_a = "UNREGISTERED",
           the_boot_copier_rom.read_during_write_mode_mixed_ports = "DONT_CARE",
           the_boot_copier_rom.width_a = 32,
           the_boot_copier_rom.widthad_a = 7;
//synthesis translate_on
//synthesis read_comments_as_HDL on
//  altsyncram the_boot_copier_rom
//    (
//      .address_a (address[6 : 0]),
//      .clock0 (clk),
//      .q_a (rom_readdata)
//    );
//  defparam the_boot_copier_rom.byte_size = 8,
//           the_boot_copier_rom.init_file = "epcs_flash_controller_boot_rom_synth.hex",
//           the_boot_copier_rom.lpm_type = "altsyncram",
//           the_boot_copier_rom.numwords_a = 128,
//           the_boot_copier_rom.operation_mode = "ROM",
//           the_boot_copier_rom.outdata_reg_a = "UNREGISTERED",
//           the_boot_copier_rom.read_during_write_mode_mixed_ports = "DONT_CARE",
//           the_boot_copier_rom.width_a = 32,
//           the_boot_copier_rom.widthad_a = 7;
//synthesis read_comments_as_HDL off
endmodule