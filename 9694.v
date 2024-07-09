module BUFGCE (
  input I,
  input CE,
  output O,
  );
  BUFGCTRL _TECHMAP_REPLACE_ (
    .O(O),
    .CE0(CE),
    .CE1(1'b0),
    .I0(I),
    .I1(1'b1),
    .IGNORE0(1'b0),
    .IGNORE1(1'b1),
    .S0(1'b1),
    .S1(1'b0)
  );
endmodule