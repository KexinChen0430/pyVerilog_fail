module IBUF (
  (* iopad_external_pin *)
  input  I,
  output O
);
  parameter IOSTANDARD   = "default";
  parameter IBUF_LOW_PWR = 0;
  parameter IN_TERM = "NONE";  // Not supported by Vivado ?
  parameter IO_LOC_PAIRS = ""; // Used by read_xdc.
  assign O = I;
  specify
    (I => O) = 0;
  endspecify
endmodule