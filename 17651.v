module BIBUF
`ifdef XIL_TIMING
#(
  parameter LOC = "UNPLACED"
)
`endif
(
  inout IO,
  inout PAD
);
// define constants
  localparam MODULE_NAME = "BIBUF";
  tri0 glblGSR = glbl.GSR;
// begin behavioral model
    wire PAD_io;
    wire IO_io;
    assign #10 PAD_io = PAD;
    assign #10 IO_io = IO;
    assign (weak1, weak0) IO = PAD_io;
    assign (weak1, weak0) PAD = IO_io;
// end behavioral model
endmodule