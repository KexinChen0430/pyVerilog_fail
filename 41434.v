module for actual values.
   parameter IODELAY_GRP     = "IODELAY_MIG"
   )
  (
   input  clk200,
   input  rst200,
   output idelay_ctrl_rdy
   );
  (* IODELAY_GROUP = IODELAY_GRP *) IDELAYCTRL u_idelayctrl
    (
     .RDY(idelay_ctrl_rdy),
     .REFCLK(clk200),
     .RST(rst200)
     );
endmodule