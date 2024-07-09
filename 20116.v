module MUXF8(output O, input I0, I1, S);
  assign O = S ? I1 : I0;
  specify
    // Max delays from: https://github.com/SymbiFlow/prjxray-db/blob/34ea6eb08a63d21ec16264ad37a0a7b142ff6031/artix7/timings/CLBLL_L.sdf#L462-L464
    (I0 => O) = 104;
    (I1 => O) = 94;
    (S => O) = 273;
  endspecify
endmodule