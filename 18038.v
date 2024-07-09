module instances,
   // their TDO outputs should be multiplexed into BSCAN primitive TDO input
   assign tdo1 = tdo1_1 | tdo1_2;
endmodule