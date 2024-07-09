module FDRE_1 (
  output reg Q,
  (* clkbuf_sink *)
  input C,
  input CE,
  input D,
  input R
);
  parameter [0:0] INIT = 1'b0;
  initial Q <= INIT;
  always @(negedge C) if (R) Q <= 1'b0; else if (CE) Q <= D;
  specify
    // https://github.com/SymbiFlow/prjxray-db/blob/23c8b0851f979f0799318eaca90174413a46b257/artix7/timings/slicel.sdf#L249
    $setup(D , negedge C &&& CE, /*-46*/ 0); // Negative times not currently supported
    // https://github.com/SymbiFlow/prjxray-db/blob/23c8b0851f979f0799318eaca90174413a46b257/artix7/timings/slicel.sdf#L248
    $setup(CE, negedge C, 109);
    // https://github.com/SymbiFlow/prjxray-db/blob/23c8b0851f979f0799318eaca90174413a46b257/artix7/timings/slicel.sdf#L274
    $setup(R , negedge C, 404);    // https://github.com/SymbiFlow/prjxray-db/blob/34ea6eb08a63d21ec16264ad37a0a7b142ff6031/artix7/timings/CLBLL_L.sdf#L243
    if (R)        (negedge C => (Q : 1'b0)) = 303;
    if (!R && CE) (negedge C => (Q : D)) = 303;
  endspecify
endmodule