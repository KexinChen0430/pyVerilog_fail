module nios_system_nios2_qsys_0_cpu_nios2_ocimem (
                                                   // inputs:
                                                    address,
                                                    byteenable,
                                                    clk,
                                                    debugaccess,
                                                    jdo,
                                                    jrst_n,
                                                    read,
                                                    reset_req,
                                                    take_action_ocimem_a,
                                                    take_action_ocimem_b,
                                                    take_no_action_ocimem_a,
                                                    write,
                                                    writedata,
                                                   // outputs:
                                                    MonDReg,
                                                    ociram_readdata,
                                                    waitrequest
                                                 )
;
  output  [ 31: 0] MonDReg;
  output  [ 31: 0] ociram_readdata;
  output           waitrequest;
  input   [  8: 0] address;
  input   [  3: 0] byteenable;
  input            clk;
  input            debugaccess;
  input   [ 37: 0] jdo;
  input            jrst_n;
  input            read;
  input            reset_req;
  input            take_action_ocimem_a;
  input            take_action_ocimem_b;
  input            take_no_action_ocimem_a;
  input            write;
  input   [ 31: 0] writedata;
  reg     [ 10: 0] MonAReg /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D101,D103,R101\""  */;
  wire    [  8: 0] MonARegAddrInc;
  wire             MonARegAddrIncAccessingRAM;
  reg     [ 31: 0] MonDReg /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D101,D103,R101\""  */;
  reg              avalon_ociram_readdata_ready /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D101,D103,R101\""  */;
  wire             avalon_ram_wr;
  wire    [ 31: 0] cfgrom_readdata;
  reg              jtag_ram_access /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D101,D103,R101\""  */;
  reg              jtag_ram_rd /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D101,D103,R101\""  */;
  reg              jtag_ram_rd_d1 /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D101,D103,R101\""  */;
  reg              jtag_ram_wr /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D101,D103,R101\""  */;
  reg              jtag_rd /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D101,D103,R101\""  */;
  reg              jtag_rd_d1 /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D101,D103,R101\""  */;
  wire    [  7: 0] ociram_addr;
  wire    [  3: 0] ociram_byteenable;
  wire    [ 31: 0] ociram_readdata;
  wire    [ 31: 0] ociram_wr_data;
  wire             ociram_wr_en;
  reg              waitrequest /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D101,D103,R101\""  */;
  always @(posedge clk or negedge jrst_n)
    begin
      if (jrst_n == 0)
        begin
          jtag_rd <= 1'b0;
          jtag_rd_d1 <= 1'b0;
          jtag_ram_wr <= 1'b0;
          jtag_ram_rd <= 1'b0;
          jtag_ram_rd_d1 <= 1'b0;
          jtag_ram_access <= 1'b0;
          MonAReg <= 0;
          MonDReg <= 0;
          waitrequest <= 1'b1;
          avalon_ociram_readdata_ready <= 1'b0;
        end
      else
        begin
          if (take_no_action_ocimem_a)
            begin
              MonAReg[10 : 2] <= MonARegAddrInc;
              jtag_rd <= 1'b1;
              jtag_ram_rd <= MonARegAddrIncAccessingRAM;
              jtag_ram_access <= MonARegAddrIncAccessingRAM;
            end
          else if (take_action_ocimem_a)
            begin
              MonAReg[10 : 2] <= { jdo[17],
                            jdo[33 : 26] };
              jtag_rd <= 1'b1;
              jtag_ram_rd <= ~jdo[17];
              jtag_ram_access <= ~jdo[17];
            end
          else if (take_action_ocimem_b)
            begin
              MonAReg[10 : 2] <= MonARegAddrInc;
              MonDReg <= jdo[34 : 3];
              jtag_ram_wr <= MonARegAddrIncAccessingRAM;
              jtag_ram_access <= MonARegAddrIncAccessingRAM;
            end
          else
            begin
              jtag_rd <= 0;
              jtag_ram_wr <= 0;
              jtag_ram_rd <= 0;
              jtag_ram_access <= 0;
              if (jtag_rd_d1)
                  MonDReg <= jtag_ram_rd_d1 ? ociram_readdata : cfgrom_readdata;
            end
          jtag_rd_d1 <= jtag_rd;
          jtag_ram_rd_d1 <= jtag_ram_rd;
          if (~waitrequest)
            begin
              waitrequest <= 1'b1;
              avalon_ociram_readdata_ready <= 1'b0;
            end
          else if (write)
              waitrequest <= ~address[8] & jtag_ram_access;
          else if (read)
            begin
              avalon_ociram_readdata_ready <= ~(~address[8] & jtag_ram_access);
              waitrequest <= ~avalon_ociram_readdata_ready;
            end
          else
            begin
              waitrequest <= 1'b1;
              avalon_ociram_readdata_ready <= 1'b0;
            end
        end
    end
  assign MonARegAddrInc = MonAReg[10 : 2]+1;
  assign MonARegAddrIncAccessingRAM = ~MonARegAddrInc[8];
  assign avalon_ram_wr = write & ~address[8] & debugaccess;
  assign ociram_addr = jtag_ram_access ? MonAReg[9 : 2] : address[7 : 0];
  assign ociram_wr_data = jtag_ram_access ? MonDReg[31 : 0] : writedata;
  assign ociram_byteenable = jtag_ram_access ? 4'b1111 : byteenable;
  assign ociram_wr_en = jtag_ram_access ? jtag_ram_wr : avalon_ram_wr;
//nios_system_nios2_qsys_0_cpu_ociram_sp_ram, which is an nios_sp_ram
nios_system_nios2_qsys_0_cpu_ociram_sp_ram_module nios_system_nios2_qsys_0_cpu_ociram_sp_ram
  (
    .address    (ociram_addr),
    .byteenable (ociram_byteenable),
    .clock      (clk),
    .data       (ociram_wr_data),
    .q          (ociram_readdata),
    .reset_req  (reset_req),
    .wren       (ociram_wr_en)
  );
//synthesis translate_off
`ifdef NO_PLI
defparam nios_system_nios2_qsys_0_cpu_ociram_sp_ram.lpm_file = "nios_system_nios2_qsys_0_cpu_ociram_default_contents.dat";
`else
defparam nios_system_nios2_qsys_0_cpu_ociram_sp_ram.lpm_file = "nios_system_nios2_qsys_0_cpu_ociram_default_contents.hex";
`endif
//synthesis translate_on
  assign cfgrom_readdata = (MonAReg[4 : 2] == 3'd0)? 32'h00020020 :
    (MonAReg[4 : 2] == 3'd1)? 32'h00001313 :
    (MonAReg[4 : 2] == 3'd2)? 32'h00040000 :
    (MonAReg[4 : 2] == 3'd3)? 32'h00000100 :
    (MonAReg[4 : 2] == 3'd4)? 32'h20000000 :
    (MonAReg[4 : 2] == 3'd5)? 32'h00020000 :
    (MonAReg[4 : 2] == 3'd6)? 32'h00000000 :
    32'h00000000;
endmodule