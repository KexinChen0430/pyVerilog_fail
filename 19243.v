module OBUFDS (
  input  I,
  (* iopad_external_pin *)
  output O,
  (* iopad_external_pin *)
  output OB
);
  parameter IOSTANDARD  = "DEFAULT";
  parameter SLEW        = "SLOW";
  parameter PULLTYPE    = "NONE";
  parameter IO_LOC_PAIRS = ""; // Used by read_xdc.
  parameter HAS_OSERDES = 0;
  assign O  =  I;
  assign OB = ~I;
endmodule