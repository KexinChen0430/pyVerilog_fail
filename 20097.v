module BUFG(
    (* clkbuf_driver *)
    output O,
    input I);
  assign O = I;
  specify
    // https://github.com/SymbiFlow/prjxray-db/blob/4bc6385ab300b1819848371f508185f57b649a0e/artix7/timings/CLK_BUFG_TOP_R.sdf#L11
    (I => O) = 96;
  endspecify
endmodule