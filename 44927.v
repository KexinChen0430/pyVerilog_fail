module bsg_mul_pipelined #(parameter `BSG_INV_PARAM(width_p)
                           , parameter pipeline_p=1
                           , parameter harden_p  =1
                           )
   (  input clk_i
    , input en_i
    , input   [width_p-1:0] x_i
    , input [width_p-1:0] y_i
    , input signed_i   // signed multiply
    , output [width_p*2-1:0] z_o
    );
   if (width_p == 32)
     begin: fi32
        bsg_mul_32_32 #(.harden_p(harden_p), .pipeline_p(pipeline_p)) m32 (.*);
     end
   else if (width_p == 16)
     begin: fi16
        bsg_mul_16_16 #(.harden_p(harden_p)) m16 (.*);
     end
   else initial assert ("width" == "unhandled") else $error("unhandled case for %m");
endmodule