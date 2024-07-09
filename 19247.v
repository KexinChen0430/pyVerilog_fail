module IOBUFDS (
  input  I,
  input  T,
  output O,
    (* iopad_external_pin *)
  inout  IO,
    (* iopad_external_pin *)
  inout  IOB
);
  parameter IOSTANDARD = "DIFF_SSTL135";  // TODO: Is this the default ?
  parameter SLEW = "SLOW";
  parameter IN_TERM = "NONE";  // Not supported by Vivado ?
  parameter PULLTYPE = "NONE"; // Not supported by Vivado ?
  parameter IO_LOC_PAIRS = ""; // Used by read_xdc.
endmodule