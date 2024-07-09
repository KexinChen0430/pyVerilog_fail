module FDPE (
  output reg Q,
  (* clkbuf_sink *)
  (* invertible_pin = "IS_C_INVERTED" *)
  input C,
  input CE,
  (* invertible_pin = "IS_D_INVERTED" *)
  input D,
  (* invertible_pin = "IS_PRE_INVERTED" *)
  input PRE
);
  parameter [0:0] INIT = 1'b1;
  parameter [0:0] IS_C_INVERTED = 1'b0;
  parameter [0:0] IS_D_INVERTED = 1'b0;
  parameter [0:0] IS_PRE_INVERTED = 1'b0;
  initial Q <= INIT;
  generate case ({|IS_C_INVERTED, |IS_PRE_INVERTED})
    2'b00: always @(posedge C, posedge PRE) if ( PRE) Q <= 1'b1; else if (CE) Q <= D ^ IS_D_INVERTED;
    2'b01: always @(posedge C, negedge PRE) if (!PRE) Q <= 1'b1; else if (CE) Q <= D ^ IS_D_INVERTED;
    2'b10: always @(negedge C, posedge PRE) if ( PRE) Q <= 1'b1; else if (CE) Q <= D ^ IS_D_INVERTED;
    2'b11: always @(negedge C, negedge PRE) if (!PRE) Q <= 1'b1; else if (CE) Q <= D ^ IS_D_INVERTED;
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
    $setup(PRE, posedge C &&& !IS_C_INVERTED, 404);
    $setup(PRE, negedge C &&&  IS_C_INVERTED, 404);
    // https://github.com/SymbiFlow/prjxray-db/blob/23c8b0851f979f0799318eaca90174413a46b257/artix7/timings/slicel.sdf#L270
`ifndef YOSYS
    if (!IS_PRE_INVERTED) (posedge PRE => (Q : 1'b1)) = 764;
    if ( IS_PRE_INVERTED) (negedge PRE => (Q : 1'b1)) = 764;
`else
    if (IS_PRE_INVERTED != PRE) (PRE => Q) = 764; // Technically, this should be an edge sensitive path
                                                  // but for facilitating a bypass box, let's pretend it's
                                                  // a simple path
`endif
    if (!IS_C_INVERTED && PRE == IS_PRE_INVERTED && CE) (posedge C => (Q : D ^ IS_D_INVERTED)) = 303;
    if ( IS_C_INVERTED && PRE == IS_PRE_INVERTED && CE) (negedge C => (Q : D ^ IS_D_INVERTED)) = 303;
  endspecify
endmodule