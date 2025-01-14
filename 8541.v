module bsg_reduce #(parameter `BSG_INV_PARAM(width_p )
                  , parameter xor_p = 0
                  , parameter and_p = 0
                  , parameter or_p = 0
                  , parameter harden_p = 0
                  )
   (input    [width_p-1:0] i
    , output o
    );
   // synopsys translate_off
   initial
      assert( $countones({xor_p & 1'b1, and_p & 1'b1, or_p & 1'b1}) == 1)
        else $error("bsg_scan: only one function may be selected\n");
   // synopsys translate_on
   if (xor_p)
     begin: xorr
        initial assert(harden_p==0) else $error("## %m unhandled bitstack case");
        assign o = ^i;
     end:xorr
   else if (and_p)
     begin: andr
        if (width_p < 4)
          begin: notmacro
             assign o = &i;
          end else
        `bsg_andr_macro(4) else
        `bsg_andr_macro(6) else
        `bsg_andr_macro(8) else
        `bsg_andr_macro(9) else
        `bsg_andr_macro(12) else
        `bsg_andr_macro(16) else
          begin: notmacro
             initial assert(harden_p==0) else $error("## %m unhandled bitstack case");
             assign o = &i;
          end
     end
   else if (or_p)
     begin: orr
        initial assert(harden_p==0) else $error("## %m unhandled bitstack case");
        assign o = |i;
     end
endmodule