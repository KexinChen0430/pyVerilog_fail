module RAM128X1D (
  output       DPO, SPO,
  input        D,
  (* clkbuf_sink *)
  (* invertible_pin = "IS_WCLK_INVERTED" *)
  input        WCLK,
  input        WE,
  input  [6:0] A,
  input  [6:0] DPRA
);
  parameter INIT = 128'h0;
  parameter IS_WCLK_INVERTED = 1'b0;
  reg [127:0] mem = INIT;
  assign SPO = mem[A];
  assign DPO = mem[DPRA];
  wire clk = WCLK ^ IS_WCLK_INVERTED;
  always @(posedge clk) if (WE) mem[A] <= D;
  specify
    // Max delay from: https://github.com/SymbiFlow/prjxray-db/blob/31f51ac5ec7448dd6f79a8267f147123e4413c21/artix7/timings/CLBLM_R.sdf#L986
    $setup(D , posedge WCLK &&& !IS_WCLK_INVERTED && WE, 453);
    $setup(D , negedge WCLK &&&  IS_WCLK_INVERTED && WE, 453);
    // Max delay from: https://github.com/SymbiFlow/prjxray-db/blob/31f51ac5ec7448dd6f79a8267f147123e4413c21/artix7/timings/CLBLM_R.sdf#L834
    $setup(WE, posedge WCLK &&& !IS_WCLK_INVERTED, 654);
    $setup(WE, negedge WCLK &&&  IS_WCLK_INVERTED, 654);
    // Max delay from: https://github.com/SymbiFlow/prjxray-db/blob/31f51ac5ec7448dd6f79a8267f147123e4413c21/artix7/timings/CLBLM_R.sdf#L818-830
    $setup(A[0], posedge WCLK &&& !IS_WCLK_INVERTED && WE, 616);
    $setup(A[0], negedge WCLK &&&  IS_WCLK_INVERTED && WE, 616);
    $setup(A[1], posedge WCLK &&& !IS_WCLK_INVERTED && WE, 362);
    $setup(A[1], negedge WCLK &&&  IS_WCLK_INVERTED && WE, 362);
    $setup(A[2], posedge WCLK &&& !IS_WCLK_INVERTED && WE, 245);
    $setup(A[2], negedge WCLK &&&  IS_WCLK_INVERTED && WE, 245);
    $setup(A[3], posedge WCLK &&& !IS_WCLK_INVERTED && WE, 208);
    $setup(A[3], negedge WCLK &&&  IS_WCLK_INVERTED && WE, 208);
    $setup(A[4], posedge WCLK &&& !IS_WCLK_INVERTED && WE, 147);
    $setup(A[4], negedge WCLK &&&  IS_WCLK_INVERTED && WE, 147);
    $setup(A[5], posedge WCLK &&& !IS_WCLK_INVERTED && WE, 68);
    $setup(A[5], negedge WCLK &&&  IS_WCLK_INVERTED && WE, 68);
    $setup(A[6], posedge WCLK &&& !IS_WCLK_INVERTED && WE, 66);
    $setup(A[6], negedge WCLK &&&  IS_WCLK_INVERTED && WE, 66);
`ifndef __ICARUS__
    // Max delay from: https://github.com/SymbiFlow/prjxray-db/blob/31f51ac5ec7448dd6f79a8267f147123e4413c21/artix7/timings/CLBLM_R.sdf#L981
    if (!IS_WCLK_INVERTED && WE) (posedge WCLK => (SPO : D))    = 1153 + 217 /* to cross F7AMUX */ + 175 /* AMUX */;
    if ( IS_WCLK_INVERTED && WE) (negedge WCLK => (DPO : 1'bx)) = 1153 + 223 /* to cross F7BMUX */ + 174 /* CMUX */;
    (A[0] => SPO) = 642 + 193 /* to cross F7AMUX */ + 175 /* AMUX */;
    (A[1] => SPO) = 631 + 193 /* to cross F7AMUX */ + 175 /* AMUX */;
    (A[2] => SPO) = 472 + 193 /* to cross F7AMUX */ + 175 /* AMUX */;
    (A[3] => SPO) = 407 + 193 /* to cross F7AMUX */ + 175 /* AMUX */;
    (A[4] => SPO) = 238 + 193 /* to cross F7AMUX */ + 175 /* AMUX */;
    (A[5] => SPO) = 127 + 193 /* to cross F7AMUX */ + 175 /* AMUX */;
    (A[6] => SPO) = 0 + 276 /* to select F7AMUX */ + 175 /* AMUX */;
    (DPRA[0] => DPO) = 642 + 223 /* to cross MUXF7 */ + 174 /* CMUX */;
    (DPRA[1] => DPO) = 631 + 223 /* to cross MUXF7 */ + 174 /* CMUX */;
    (DPRA[2] => DPO) = 472 + 223 /* to cross MUXF7 */ + 174 /* CMUX */;
    (DPRA[3] => DPO) = 407 + 223 /* to cross MUXF7 */ + 174 /* CMUX */;
    (DPRA[4] => DPO) = 238 + 223 /* to cross MUXF7 */ + 174 /* CMUX */;
    (DPRA[5] => DPO) = 127 + 223 /* to cross MUXF7 */ + 174 /* CMUX */;
    (DPRA[6] => DPO) = 0 + 296 /* to select MUXF7 */ + 174 /* CMUX */;
`endif
  endspecify
endmodule