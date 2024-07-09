module FDRE (
  output reg Q,
  (* clkbuf_sink *)
  (* invertible_pin = "IS_C_INVERTED" *)
  input C,
  input CE,
  (* invertible_pin = "IS_D_INVERTED" *)
  input D,
  (* invertible_pin = "IS_R_INVERTED" *)
  input R
);
  parameter [0:0] INIT = 1'b0;
  parameter [0:0] IS_C_INVERTED = 1'b0;
  parameter [0:0] IS_D_INVERTED = 1'b0;
  parameter [0:0] IS_R_INVERTED = 1'b0;
  initial Q <= INIT;
  generate
  case (|IS_C_INVERTED)
    1'b0: always @(posedge C) if (R == !IS_R_INVERTED) Q <= 1'b0; else if (CE) Q <= D ^ IS_D_INVERTED;
    1'b1: always @(negedge C) if (R == !IS_R_INVERTED) Q <= 1'b0; else if (CE) Q <= D ^ IS_D_INVERTED;
  endcase
  endgenerate
  specify
    // https://github.com/SymbiFlow/prjxray-db/blob/23c8b0851f979f0799318eaca90174413a46b257/artix7/timings/slicel.sdf#L249
    $setup(D , posedge C &&& CE && !IS_C_INVERTED , /*-46*/ 0); // Negative times not currently supported
    $setup(D , negedge C &&& CE &&  IS_C_INVERTED , /*-46*/ 0); // Negative times not currently supported
    // https://github.com/SymbiFlow/prjxray-db/blob/23c8b0851f979f0799318eaca90174413a46b257/artix7/timings/slicel.sdf#L248
    $setup(CE, posedge C &&& !IS_C_INVERTED, 109);
    $setup(CE, negedge C &&&  IS_C_INVERTED, 109);
    // https://github.com/SymbiFlow/prjxray-db/blob/23c8b0851f979f0799318eaca90174413a46b257/artix7/timings/slicel.sdf#L274
    $setup(R , posedge C &&& !IS_C_INVERTED, 404);
    $setup(R , negedge C &&&  IS_C_INVERTED, 404);
    // https://github.com/SymbiFlow/prjxray-db/blob/34ea6eb08a63d21ec16264ad37a0a7b142ff6031/artix7/timings/CLBLL_L.sdf#L243
    if (!IS_C_INVERTED && R != IS_R_INVERTED)        (posedge C => (Q : 1'b0)) = 303;
    if ( IS_C_INVERTED && R != IS_R_INVERTED)        (negedge C => (Q : 1'b0)) = 303;
    if (!IS_C_INVERTED && R == IS_R_INVERTED && CE) (posedge C => (Q : D ^ IS_D_INVERTED)) = 303;
    if ( IS_C_INVERTED && R == IS_R_INVERTED && CE) (negedge C => (Q : D ^ IS_D_INVERTED)) = 303;
  endspecify
endmodule