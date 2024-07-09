module LUT1(output O, input I0);
  parameter [1:0] INIT = 0;
  assign O = I0 ? INIT[1] : INIT[0];
  specify
    (I0 => O) = 127;
  endspecify
endmodule