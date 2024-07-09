module FDCE (
  output reg Q,
  (* clkbuf_sink *)
  (* invertible_pin = "IS_C_INVERTED" *)
  input C,
  input CE,
  (* invertible_pin = "IS_CLR_INVERTED" *)
  input CLR,
  (* invertible_pin = "IS_D_INVERTED" *)
  input D
);
  parameter [0:0] INIT = 1'b0;
  parameter [0:0] IS_C_INVERTED = 1'b0;
  parameter [0:0] IS_D_INVERTED = 1'b0;
  parameter [0:0] IS_CLR_INVERTED = 1'b0;
  initial Q <= INIT;
  generate
  case ({|IS_C_INVERTED, |IS_CLR_INVERTED})
    2'b00: always @(posedge C, posedge CLR) if ( CLR) Q <= 1'b0; else if (CE) Q <= D ^ IS_D_INVERTED;
    2'b01: always @(posedge C, negedge CLR) if (!CLR) Q <= 1'b0; else if (CE) Q <= D ^ IS_D_INVERTED;
    2'b10: always @(negedge C, posedge CLR) if ( CLR) Q <= 1'b0; else if (CE) Q <= D ^ IS_D_INVERTED;
    2'b11: always @(negedge C, negedge CLR) if (!CLR) Q <= 1'b0; else if (CE) Q <= D ^ IS_D_INVERTED;
  endcase
  endgenerate
  specify
    // https://github.com/SymbiFlow/prjxray-db/blob/23c8b0851f979f0799318eaca90174413a46b257/artix7/timings/slicel.sdf#L249
    $setup(D , posedge C &&& !IS_C_INVERTED && CE, /*-46*/ 0); // Negative times not currently supported
    $setup(D , negedge C &&&  IS_C_INVERTED && CE, /*-46*/ 0); // Negative times not currently supported
    // https://github.com/SymbiFlow/prjxray-db/blob/23c8b0851f979f0799318eaca90174413a46b257/artix7/timings/slicel.sdf#L248
    $setup(CE , posedge C &&& !IS_C_INVERTED, 109);
    $setup(CE , negedge C &&&  IS_C_INVERTED, 109);
    // https://github.com/SymbiFlow/prjxray-db/blob/23c8b0851f979f0799318eaca90174413a46b257/artix7/timings/slicel.sdf#L274
    $setup(CLR, posedge C &&& !IS_C_INVERTED, 404);
    $setup(CLR, negedge C &&&  IS_C_INVERTED, 404);
    // https://github.com/SymbiFlow/prjxray-db/blob/23c8b0851f979f0799318eaca90174413a46b257/artix7/timings/slicel.sdf#L270
`ifndef YOSYS
    if (!IS_CLR_INVERTED) (posedge CLR => (Q : 1'b0)) = 764;
    if ( IS_CLR_INVERTED) (negedge CLR => (Q : 1'b0)) = 764;
`else
    if (IS_CLR_INVERTED != CLR) (CLR => Q) = 764; // Technically, this should be an edge sensitive path
                                                  // but for facilitating a bypass box, let's pretend it's
                                                  // a simple path
`endif
    if (!IS_C_INVERTED && CLR == IS_CLR_INVERTED && CE) (posedge C => (Q : D ^ IS_D_INVERTED)) = 303;
    if ( IS_C_INVERTED && CLR == IS_CLR_INVERTED && CE) (negedge C => (Q : D ^ IS_D_INVERTED)) = 303;
  endspecify
endmodule