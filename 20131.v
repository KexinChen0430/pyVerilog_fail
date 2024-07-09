module FDPE_1 (
  output reg Q,
  (* clkbuf_sink *)
  input C,
  input CE,
  input D,
  input PRE
);
  parameter [0:0] INIT = 1'b1;
  initial Q <= INIT;
  always @(negedge C, posedge PRE) if (PRE) Q <= 1'b1; else if (CE) Q <= D;
  specify
    // https://github.com/SymbiFlow/prjxray-db/blob/23c8b0851f979f0799318eaca90174413a46b257/artix7/timings/slicel.sdf#L249
    $setup(D , negedge C &&& CE, /*-46*/ 0); // Negative times not currently supported
    // https://github.com/SymbiFlow/prjxray-db/blob/23c8b0851f979f0799318eaca90174413a46b257/artix7/timings/slicel.sdf#L248
    $setup(CE , negedge C, 109);
    // https://github.com/SymbiFlow/prjxray-db/blob/23c8b0851f979f0799318eaca90174413a46b257/artix7/timings/slicel.sdf#L274
    $setup(PRE, negedge C, 404);
    // https://github.com/SymbiFlow/prjxray-db/blob/23c8b0851f979f0799318eaca90174413a46b257/artix7/timings/slicel.sdf#L270
`ifndef YOSYS
    (posedge PRE => (Q : 1'b1)) = 764;
`else
    if (PRE) (PRE => Q) = 764; // Technically, this should be an edge sensitive path
                               // but for facilitating a bypass box, let's pretend it's
                               // a simple path
`endif
    if (!PRE && CE) (negedge C => (Q : D)) = 303;
  endspecify
endmodule