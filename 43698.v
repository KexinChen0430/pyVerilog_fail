module fbfifo (
        data,
        wren,
        wraddress,
        rdaddress,
        clock,
        q);
        input   [31:0]  data;
        input     wren;
        input   [5:0]  wraddress;
        input   [5:0]  rdaddress;
        input     clock;
        output  [31:0]  q;
        wire [31:0] sub_wire0;
        wire [31:0] q = sub_wire0[31:0];
   parameter        debug = 0;
   always @(posedge clock) if (debug) begin
      $display("fbfifo rdaddress %x -> %x", rdaddress, sub_wire0);
      if (wren)
        $display("fbfifo wraddress %x <- %x", wraddress, data);
   end
        altsyncram      altsyncram_component (
                                .clocken0(1),
                                .clock0 (clock),
                                .address_a (wraddress),
                                .address_b (rdaddress),
                                .wren_a (wren),
                                .byteena_a (~0),
                                .data_a (data),
                                .q_b (sub_wire0));
        defparam
                altsyncram_component.intended_device_family = "Cyclone",
                altsyncram_component.operation_mode = "DUAL_PORT",
                altsyncram_component.width_a = 32,
                altsyncram_component.widthad_a = 6,
                altsyncram_component.numwords_a = 64,
                altsyncram_component.width_b = 32,
                altsyncram_component.widthad_b = 6,
                altsyncram_component.numwords_b = 64,
                altsyncram_component.lpm_type = "altsyncram",
                altsyncram_component.width_byteena_a = 1,
                altsyncram_component.outdata_reg_b = "UNREGISTERED",
                altsyncram_component.indata_aclr_a = "NONE",
                altsyncram_component.wrcontrol_aclr_a = "NONE",
                altsyncram_component.address_aclr_a = "NONE",
                altsyncram_component.address_reg_b = "CLOCK0",
                altsyncram_component.address_aclr_b = "NONE",
                altsyncram_component.outdata_aclr_b = "NONE",
                altsyncram_component.read_during_write_mode_mixed_ports = "DONT_CARE",
                altsyncram_component.ram_block_type = "AUTO";
endmodule