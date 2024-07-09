module ddr3_s4_uniphy_example_if0_p0_qsys_sequencer_cpu_inst_nios2_ocimem (
                                                                            // inputs:
                                                                             address,
                                                                             begintransfer,
                                                                             byteenable,
                                                                             chipselect,
                                                                             clk,
                                                                             debugaccess,
                                                                             jdo,
                                                                             jrst_n,
                                                                             resetrequest,
                                                                             take_action_ocimem_a,
                                                                             take_action_ocimem_b,
                                                                             take_no_action_ocimem_a,
                                                                             write,
                                                                             writedata,
                                                                            // outputs:
                                                                             MonDReg,
                                                                             oci_ram_readdata
                                                                          )
;
  output  [ 31: 0] MonDReg;
  output  [ 31: 0] oci_ram_readdata;
  input   [  8: 0] address;
  input            begintransfer;
  input   [  3: 0] byteenable;
  input            chipselect;
  input            clk;
  input            debugaccess;
  input   [ 37: 0] jdo;
  input            jrst_n;
  input            resetrequest;
  input            take_action_ocimem_a;
  input            take_action_ocimem_b;
  input            take_no_action_ocimem_a;
  input            write;
  input   [ 31: 0] writedata;
  reg     [ 10: 0] MonAReg /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D101,D103,R101\""  */;
  reg     [ 31: 0] MonDReg /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D101,D103,R101\""  */;
  reg              MonRd /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D101,D103,R101\""  */;
  reg              MonRd1 /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D101,D103,R101\""  */;
  reg              MonWr /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D101,D103,R101\""  */;
  wire             avalon;
  wire    [ 31: 0] cfgdout;
  wire    [ 31: 0] oci_ram_readdata;
  wire    [ 31: 0] sramdout;
  assign avalon = begintransfer & ~resetrequest;
  always @(posedge clk or negedge jrst_n)
    begin
      if (jrst_n == 0)
        begin
          MonWr <= 1'b0;
          MonRd <= 1'b0;
          MonRd1 <= 1'b0;
          MonAReg <= 0;
          MonDReg <= 0;
        end
      else
        begin
          if (take_no_action_ocimem_a)
            begin
              MonAReg[10 : 2] <= MonAReg[10 : 2]+1;
              MonRd <= 1'b1;
            end
          else if (take_action_ocimem_a)
            begin
              MonAReg[10 : 2] <= { jdo[17],
                            jdo[33 : 26] };
              MonRd <= 1'b1;
            end
          else if (take_action_ocimem_b)
            begin
              MonAReg[10 : 2] <= MonAReg[10 : 2]+1;
              MonDReg <= jdo[34 : 3];
              MonWr <= 1'b1;
            end
          else
            begin
              if (~avalon)
                begin
                  MonWr <= 0;
                  MonRd <= 0;
                end
              if (MonRd1)
                  MonDReg <= MonAReg[10] ? cfgdout : sramdout;
            end
          MonRd1 <= MonRd;
        end
    end
//ddr3_s4_uniphy_example_if0_p0_qsys_sequencer_cpu_inst_ociram_lpm_dram_bdp_component, which is an nios_tdp_ram
ddr3_s4_uniphy_example_if0_p0_qsys_sequencer_cpu_inst_ociram_lpm_dram_bdp_component_module ddr3_s4_uniphy_example_if0_p0_qsys_sequencer_cpu_inst_ociram_lpm_dram_bdp_component
  (
    .address_a (address[7 : 0]),
    .address_b (MonAReg[9 : 2]),
    .byteena_a (byteenable),
    .clock0    (clk),
    .clock1    (clk),
    .clocken0  (1'b1),
    .clocken1  (1'b1),
    .data_a    (writedata),
    .data_b    (MonDReg[31 : 0]),
    .q_a       (oci_ram_readdata),
    .q_b       (sramdout),
    .wren_a    (chipselect & write & debugaccess &
                         ~address[8]
                         ),
    .wren_b    (MonWr)
  );
//synthesis translate_off
`ifdef NO_PLI
defparam ddr3_s4_uniphy_example_if0_p0_qsys_sequencer_cpu_inst_ociram_lpm_dram_bdp_component.lpm_file = "ddr3_s4_uniphy_example_if0_p0_qsys_sequencer_cpu_inst_ociram_default_contents.dat";
`else
defparam ddr3_s4_uniphy_example_if0_p0_qsys_sequencer_cpu_inst_ociram_lpm_dram_bdp_component.lpm_file = "ddr3_s4_uniphy_example_if0_p0_qsys_sequencer_cpu_inst_ociram_default_contents.hex";
`endif
//synthesis translate_on
//synthesis read_comments_as_HDL on
//defparam ddr3_s4_uniphy_example_if0_p0_qsys_sequencer_cpu_inst_ociram_lpm_dram_bdp_component.lpm_file = "ddr3_s4_uniphy_example_if0_p0_qsys_sequencer_cpu_inst_ociram_default_contents.mif";
//synthesis read_comments_as_HDL off
  assign cfgdout = (MonAReg[4 : 2] == 3'd0)? 32'h00010020 :
    (MonAReg[4 : 2] == 3'd1)? 32'h00001311 :
    (MonAReg[4 : 2] == 3'd2)? 32'h00040000 :
    (MonAReg[4 : 2] == 3'd3)? 32'h00000000 :
    (MonAReg[4 : 2] == 3'd4)? 32'h20000000 :
    (MonAReg[4 : 2] == 3'd5)? 32'h00010000 :
    (MonAReg[4 : 2] == 3'd6)? 32'h00000000 :
    32'h00000000;
endmodule