module bsg_trace_rom #(parameter `BSG_INV_PARAM(width_p), parameter `BSG_INV_PARAM(addr_width_p))
(input  [addr_width_p-1:0] addr_i
,output logic [width_p-1:0]      data_o
);
always_comb case(addr_i)
                                 // ###   test params #########
                                 // #
                                 // #   payload = 17
                                 // #   len_width = 2
                                 // #   y = 2
                                 // #   x = 2
                                 // #
                                 // #   padding = 15
                                 // #   flit = 8
                                 // #
                                 // ###########################
                                 // # send flits
         0: data_o = width_p ' (27'b0001_000000000000000_01100011); // 0x0800063
         1: data_o = width_p ' (27'b0001_000000000000000_01100001); // 0x0800061
         2: data_o = width_p ' (27'b0001_000000000000000_01110000); // 0x0800070
                                 // # recv packet
         3: data_o = width_p ' (27'b0010_11100000110000101_10_00_11); // 0x1706163
                                 // # send flits
         4: data_o = width_p ' (27'b0001_000000000000000_11011101); // 0x08000DD
         5: data_o = width_p ' (27'b0001_000000000000000_01100111); // 0x0800067
                                 // # recv packet
         6: data_o = width_p ' (27'b0010_00000000110011111_01_11_01); // 0x10067DD
                                 // # send flits
         7: data_o = width_p ' (27'b0001_000000000000000_11001101); // 0x08000CD
                                 // # recv packet
         8: data_o = width_p ' (27'b0010_00000000000000011_00_11_01); // 0x10000CD
                                 // # done
         9: data_o = width_p ' (27'b0011_00000000000000000_000000); // 0x1800000
   default: data_o = 'X;
endcase
endmodule