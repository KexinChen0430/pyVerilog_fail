module bsg_comm_link_master_calib_skip_rom #(parameter `BSG_INV_PARAM(width_p), addr_width_p))
(input  [addr_width_p-1:0] addr_i
,output logic [width_p-1:0]      data_o
);
always_comb case(addr_i)
                                 // #######################################################################################################
                                 // #
                                 // #
                                 // # trace (for bsg_fsb_node_trace_replay) to have the master do a quick wakeup of the ASIC comm link
                                 // #
                                 // #
                                 // # format:   <4 bit op> <16 bits>
                                 // #   op = 0000: wait one cycle
                                 // #   op = 0001: write data <addr2 data14>
                                 // #                          00 data14     --> write channel <valid1, data8> reg
                                 // #                          01 data14     --> write channel override reg  <1bit>
                                 // #                          10 data14     --> write master_master test_pass_reg <6bit>
                                 // #                          11 data14     --> write match_reg  < out_calib_prep1, out_calibration_state3 >
                                 // #   op = 0010:  00_0000_0000_0000 --> wait until match reg matches < out_calib_prep1, out_calibration_state6 >
                                 // #               (check data)
                                 // #
                                 // #   op = 0011: done; disable but do not stop
                                 // #   op = 0100: call $finish
                                 // #   op = 0101: cycle counter decrement and wait
                                 // #   op = 0110   initialize cycle counter with 16 bits
                                 // #
                                 // #
                                 // # op4  adr2  field
                                 // #
                                 // # 0001__00___00_000V_DDDD_DDDD  #  --> channel write valid1,data8
                                 // # 0001__01___00_0000_0000_000R  #  --> channel write override reg 1bit
                                 // # 0001__10___00_0000_00PP_PPPP  #  --> channel write master_master test_pass_reg
                                 // # 0001__11___00_0000_0000_PMMM  #  --> channel write prep1, calib_state3 match reg
                                 // # 0010__0000_0000_0000_0000     #  --> wait for match reg to match
                                 // # 0110__CCCC_CCCC_CCCC_CCCC     #  --> initialize cycle counter to C cycles
                                 // # 0101__0000_0000_0000_0000     #  --> decrement and wait on cycle counter
                                 // # 0011__0000_0000_0000_0000     #  --> stop
                                 // #
                                 // #
                                 // # 0001__00___00_000V_DDDD_DDDD  #  --> channel write valid1,data8                  (0,F5 == reset clock)
         0: data_o = width_p ' (20'b0001__00___00_0000_1111_0101); // 0x100F5
                                 // # 0001__01___00_0000_0000_000R  #  --> channel write override reg 1bit             (1 = override)
         1: data_o = width_p ' (20'b0001__01___00_0000_0000_0001); // 0x14001
                                 // # 0001__11___00_0000_0000_PMMM  #  --> channel write prep1, calib_state3 match reg wait for (prep=1,state=000)
         2: data_o = width_p ' (20'b0001__11___00_0000_0000_1000); // 0x1C008
                                 // # 0010__0000_0000_0000_0000     #  --> wait for match reg to match                 (wait for prep=1)
         3: data_o = width_p ' (20'b0010__0000_0000_0000_0000); // 0x20000
                                 // # 0110__CCCC_CCCC_CCCC_CCCC     #  --> initialize cycle counter to C cycles        (init 32 cycles)
         4: data_o = width_p ' (20'b0110__0000_0000_0010_0000); // 0x60020
                                 // # 0101__0000_0000_0000_0000     #  --> decrement and wait on cycle counter         (wait 32 cycles)
         5: data_o = width_p ' (20'b0101__0000_0000_0000_0000); // 0x50000
                                 // # 0001__00___00_000V_DDDD_DDDD  #  --> channel write valid1,data8                  (1,81 == reset token)
         6: data_o = width_p ' (20'b0001__00___00_0001_1000_0001); // 0x10181
                                 // # 0110__CCCC_CCCC_CCCC_CCCC     #  --> initialize cycle counter to C cycles        (init 32 cycles)
         7: data_o = width_p ' (20'b0110__0000_0000_0010_0000); // 0x60020
                                 // # 0101__0000_0000_0000_0000     #  --> decrement and wait on cycle counter         (wait 32 cycles)
         8: data_o = width_p ' (20'b0101__0000_0000_0000_0000); // 0x50000
                                 // # 0001__00___00_000V_DDDD_DDDD  #  --> channel write valid1,data8                  (0,F5 == reset clock)
         9: data_o = width_p ' (20'b0001__00___00_0000_1111_0101); // 0x100F5
                                 // # 0110__CCCC_CCCC_CCCC_CCCC     #  --> initialize cycle counter to C cycles        (init 64 cycles) extra time for token CDC
        10: data_o = width_p ' (20'b0110__0000_0000_0100_0000); // 0x60040
                                 // # 0101__0000_0000_0000_0000     #  --> decrement and wait on cycle counter         (wait 64 cycles)
        11: data_o = width_p ' (20'b0101__0000_0000_0000_0000); // 0x50000
                                 // # 0001__10___00_0000_00PP_PPPP  #  --> channel write master_master test_pass_reg   (passed test 1), turn reset low
        12: data_o = width_p ' (20'b0001__10___00_0000_0000_0001); // 0x18001
                                 // # 0110__CCCC_CCCC_CCCC_CCCC     #  --> initialize cycle counter to C cycles        (init 32 cycles)
        13: data_o = width_p ' (20'b0110__0000_0000_0010_0000); // 0x60020
                                 // # 0101__0000_0000_0000_0000     #  --> decrement and wait on cycle counter         (wait 32 cycles)
        14: data_o = width_p ' (20'b0101__0000_0000_0000_0000); // 0x50000
                                 // # 0001__00___00_000V_DDDD_DDDD  #  --> channel write valid1,data8                  (0,6A == activate channel)
        15: data_o = width_p ' (20'b0001__00___00_0000_0110_1010); // 0x1006A
                                 // # 0110__CCCC_CCCC_CCCC_CCCC     #  --> initialize cycle counter to C cycles        (init 32 cycles)
        16: data_o = width_p ' (20'b0110__0000_0000_0010_0000); // 0x60020
                                 // # 0101__0000_0000_0000_0000     #  --> decrement and wait on cycle counter         (wait 32 cycles)
        17: data_o = width_p ' (20'b0101__0000_0000_0000_0000); // 0x50000
                                 // # 0001__10___00_0000_00PP_PPPP  #  --> channel write master_master test_pass_reg   (passed test 2), turn reset high
        18: data_o = width_p ' (20'b0001__10___00_0000_0000_0010); // 0x18002
                                 // # 0110__CCCC_CCCC_CCCC_CCCC     #  --> initialize cycle counter to C cycles        (init 32 cycles)
        19: data_o = width_p ' (20'b0110__0000_0000_0010_0000); // 0x60020
                                 // # 0101__0000_0000_0000_0000     #  --> decrement and wait on cycle counter         (wait 32 cycles)
        20: data_o = width_p ' (20'b0101__0000_0000_0000_0000); // 0x50000
                                 // # 0001__00___00_000V_DDDD_DDDD  #  --> channel write valid1,data8                  (1,81 == reset token)
        21: data_o = width_p ' (20'b0001__00___00_0001_1000_0001); // 0x10181
                                 // # 0110__CCCC_CCCC_CCCC_CCCC     #  --> initialize cycle counter to C cycles        (init 32 cycles)
        22: data_o = width_p ' (20'b0110__0000_0000_0010_0000); // 0x60020
                                 // # 0101__0000_0000_0000_0000     #  --> decrement and wait on cycle counter         (wait 32 cycles)
        23: data_o = width_p ' (20'b0101__0000_0000_0000_0000); // 0x50000
                                 // # 0001__00___00_000V_DDDD_DDDD  #  --> channel write valid1,data8                  (0,6A == activate channel)
        24: data_o = width_p ' (20'b0001__00___00_0000_0110_1010); // 0x1006A
                                 // # 0110__CCCC_CCCC_CCCC_CCCC     #  --> initialize cycle counter to C cycles        (init 64 cycles) extra time for token CDC
        25: data_o = width_p ' (20'b0110__0000_0000_0100_0000); // 0x60040
                                 // # 0101__0000_0000_0000_0000     #  --> decrement and wait on cycle counter         (wait 64 cycles)
        26: data_o = width_p ' (20'b0101__0000_0000_0000_0000); // 0x50000
                                 // # 0001__10___00_0000_00PP_PPPP  #  --> channel write master_master test_pass_reg   (passed test 3), turn reset low
        27: data_o = width_p ' (20'b0001__10___00_0000_0000_0100); // 0x18004
                                 // # 0110__CCCC_CCCC_CCCC_CCCC     #  --> initialize cycle counter to C cycles        (init 32 cycles)
        28: data_o = width_p ' (20'b0110__0000_0000_0010_0000); // 0x60020
                                 // # 0101__0000_0000_0000_0000     #  --> decrement and wait on cycle counter         (wait 32 cycles)
        29: data_o = width_p ' (20'b0101__0000_0000_0000_0000); // 0x50000
                                 // # 0001__01___00_0000_0000_000R  #  --> channel write override reg 1bit             disable override of output (0 = override)
        30: data_o = width_p ' (20'b0001__01___00_0000_0000_0000); // 0x14000
                                 // # 0001__10___00_0000_00PP_PPPP  #  --> channel write master_master test_pass_reg   (passed test 6), activate channel
        31: data_o = width_p ' (20'b0001__10___00_0000_0011_1111); // 0x1803F
                                 // # 0011__0000_0000_0000_0000     #  --> stop script
        32: data_o = width_p ' (20'b0011__0000_0000_0000_0000); // 0x30000
   default: data_o = 'X;
endcase
endmodule