module stays in the do_cc state for 6 cycles.  It starts
     // when the prepare_cc state ends.
     always @(posedge USER_CLK)
         if(RESET)                       DO_CC <=  `DLY    1'b0;
         else if(start_cc_c)             DO_CC <=  `DLY    1'b1;
         else if(cc_count_r)             DO_CC <=  `DLY    1'b1;
         else                            DO_CC <=  `DLY    1'b0;
endmodule