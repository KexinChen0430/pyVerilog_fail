module FDCE_1 (
  output reg Q,
  (* clkbuf_sink *)
  input C,
  input CE,
  input CLR,
  input D
);
  parameter [0:0] INIT = 1'b0;
  initial Q <= INIT;
  always @(negedge C, posedge CLR) if (CLR) Q <= 1'b0; else if (CE) Q <= D;
  specify
    // https://github.com/SymbiFlow/prjxray-db/blob/23c8b0851f979f0799318eaca90174413a46b257/artix7/timings/slicel.sdf#L249
    $setup(D , negedge C &&& CE, /*-46*/ 0); // Negative times not currently supported
    // https://github.com/SymbiFlow/prjxray-db/blob/23c8b0851f979f0799318eaca90174413a46b257/artix7/timings/slicel.sdf#L248
    $setup(CE , negedge C, 109);
    // https://github.com/SymbiFlow/prjxray-db/blob/23c8b0851f979f0799318eaca90174413a46b257/artix7/timings/slicel.sdf#L274
    $setup(CLR, negedge C, 404);
    // https://github.com/SymbiFlow/prjxray-db/blob/23c8b0851f979f0799318eaca90174413a46b257/artix7/timings/slicel.sdf#L270
`ifndef YOSYS
    (posedge CLR => (Q : 1'b0)) = 764;
`else
    if (CLR) (CLR => Q) = 764; // Technically, this should be an edge sensitive path
                               // but for facilitating a bypass box, let's pretend it's
                               // a simple path
`endif
    if (!CLR && CE) (negedge C => (Q : D)) = 303;
  endspecify
endmodule