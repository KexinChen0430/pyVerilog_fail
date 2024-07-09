module MUXF7(output O, input I0, I1, S);
  assign O = S ? I1 : I0;
  specify
    // https://github.com/SymbiFlow/prjxray-db/blob/34ea6eb08a63d21ec16264ad37a0a7b142ff6031/artix7/timings/CLBLL_L.sdf#L451-L453
    (I0 => O) = 217;
    (I1 => O) = 223;
    (S => O) = 296;
  endspecify
endmodule