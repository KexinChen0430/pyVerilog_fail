module RAM64M (
  output       DOA,
  output       DOB,
  output       DOC,
  output       DOD,
  input  [5:0] ADDRA, ADDRB, ADDRC,
  input  [5:0] ADDRD,
  input        DIA,
  input        DIB,
  input        DIC,
  input        DID,
  (* clkbuf_sink *)
  (* invertible_pin = "IS_WCLK_INVERTED" *)
  input        WCLK,
  input        WE
);
  parameter [63:0] INIT_A = 64'h0000000000000000;
  parameter [63:0] INIT_B = 64'h0000000000000000;
  parameter [63:0] INIT_C = 64'h0000000000000000;
  parameter [63:0] INIT_D = 64'h0000000000000000;
  parameter [0:0] IS_WCLK_INVERTED = 1'b0;
  reg [63:0] mem_a = INIT_A;
  reg [63:0] mem_b = INIT_B;
  reg [63:0] mem_c = INIT_C;
  reg [63:0] mem_d = INIT_D;
  assign DOA = mem_a[ADDRA];
  assign DOB = mem_b[ADDRB];
  assign DOC = mem_c[ADDRC];
  assign DOD = mem_d[ADDRD];
  wire clk = WCLK ^ IS_WCLK_INVERTED;
  always @(posedge clk)
    if (WE) begin
      mem_a[ADDRD] <= DIA;
      mem_b[ADDRD] <= DIB;
      mem_c[ADDRD] <= DIC;
      mem_d[ADDRD] <= DID;
    end
  specify
    // Max delay from: https://github.com/SymbiFlow/prjxray-db/blob/31f51ac5ec7448dd6f79a8267f147123e4413c21/artix7/timings/CLBLM_R.sdf#L818-L830
    $setup(ADDRD[0], posedge WCLK &&& !IS_WCLK_INVERTED && WE, 362);
    $setup(ADDRD[0], negedge WCLK &&&  IS_WCLK_INVERTED && WE, 362);
    $setup(ADDRD[1], posedge WCLK &&& !IS_WCLK_INVERTED && WE, 245);
    $setup(ADDRD[1], negedge WCLK &&&  IS_WCLK_INVERTED && WE, 245);
    $setup(ADDRD[2], posedge WCLK &&& !IS_WCLK_INVERTED && WE, 208);
    $setup(ADDRD[2], negedge WCLK &&&  IS_WCLK_INVERTED && WE, 208);
    $setup(ADDRD[3], posedge WCLK &&& !IS_WCLK_INVERTED && WE, 147);
    $setup(ADDRD[3], negedge WCLK &&&  IS_WCLK_INVERTED && WE, 147);
    $setup(ADDRD[4], posedge WCLK &&& !IS_WCLK_INVERTED && WE, 68);
    $setup(ADDRD[4], negedge WCLK &&&  IS_WCLK_INVERTED && WE, 68);
    $setup(ADDRD[5], posedge WCLK &&& !IS_WCLK_INVERTED && WE, 66);
    $setup(ADDRD[5], negedge WCLK &&&  IS_WCLK_INVERTED && WE, 66);
    // Max delay from: https://github.com/SymbiFlow/prjxray-db/blob/31f51ac5ec7448dd6f79a8267f147123e4413c21/artix7/timings/CLBLM_R.sdf#L986-L988
    $setup(DIA, posedge WCLK &&& !IS_WCLK_INVERTED && WE, 384);
    $setup(DIA, negedge WCLK &&&  IS_WCLK_INVERTED && WE, 384);
    // Max delay from: https://github.com/SymbiFlow/prjxray-db/blob/31f51ac5ec7448dd6f79a8267f147123e4413c21/artix7/timings/CLBLM_R.sdf#L1054-L1056
    $setup(DIB, posedge WCLK &&& !IS_WCLK_INVERTED && WE, 354);
    $setup(DIB, negedge WCLK &&&  IS_WCLK_INVERTED && WE, 354);
    // Max delay from: https://github.com/SymbiFlow/prjxray-db/blob/31f51ac5ec7448dd6f79a8267f147123e4413c21/artix7/timings/CLBLM_R.sdf#L1122-L1124
    $setup(DIC, posedge WCLK &&& !IS_WCLK_INVERTED && WE, 375);
    $setup(DIC, negedge WCLK &&&  IS_WCLK_INVERTED && WE, 375);
    // Max delay from: https://github.com/SymbiFlow/prjxray-db/blob/31f51ac5ec7448dd6f79a8267f147123e4413c21/artix7/timings/CLBLM_R.sdf#L1190-L1192
    $setup(DID, posedge WCLK &&& !IS_WCLK_INVERTED && WE, 310);
    $setup(DID, negedge WCLK &&&  IS_WCLK_INVERTED && WE, 310);
    // Max delay from: https://github.com/SymbiFlow/prjxray-db/blob/31f51ac5ec7448dd6f79a8267f147123e4413c21/artix7/timings/CLBLM_R.sdf#L834
    $setup(WE, posedge WCLK &&& !IS_WCLK_INVERTED && WE, 654);
    $setup(WE, negedge WCLK &&&  IS_WCLK_INVERTED && WE, 654);
    // Max delay from: https://github.com/SymbiFlow/prjxray-db/blob/34ea6eb08a63d21ec16264ad37a0a7b142ff6031/artix7/timings/CLBLM_R.sdf#L889
    if (!IS_WCLK_INVERTED && WE) (posedge WCLK => (DOA : DIA)) = 1153;
    if ( IS_WCLK_INVERTED && WE) (negedge WCLK => (DOA : DIA)) = 1153;
    // Max delay from: https://github.com/SymbiFlow/prjxray-db/blob/34ea6eb08a63d21ec16264ad37a0a7b142ff6031/artix7/timings/CLBLM_R.sdf#L957
    if (!IS_WCLK_INVERTED && WE) (posedge WCLK => (DOB : DIB)) = 1161;
    if ( IS_WCLK_INVERTED && WE) (negedge WCLK => (DOB : DIB)) = 1161;
    // Max delay from: https://github.com/SymbiFlow/prjxray-db/blob/34ea6eb08a63d21ec16264ad37a0a7b142ff6031/artix7/timings/CLBLM_R.sdf#L1025
    if (!IS_WCLK_INVERTED && WE) (posedge WCLK => (DOC : DIC)) = 1158;
    if ( IS_WCLK_INVERTED && WE) (negedge WCLK => (DOC : DIC)) = 1158;
    // Max delay from: https://github.com/SymbiFlow/prjxray-db/blob/34ea6eb08a63d21ec16264ad37a0a7b142ff6031/artix7/timings/CLBLM_R.sdf#L1093
    if (!IS_WCLK_INVERTED && WE) (posedge WCLK => (DOD : DID)) = 1163;
    if ( IS_WCLK_INVERTED && WE) (negedge WCLK => (DOD : DID)) = 1163;
    (ADDRA[0] => DOA) = 642; (ADDRB[0] => DOB) = 642; (ADDRC[0] => DOC) = 642; (ADDRD[0] => DOD) = 642;
    (ADDRA[1] => DOA) = 631; (ADDRB[1] => DOB) = 631; (ADDRC[1] => DOC) = 631; (ADDRD[1] => DOD) = 631;
    (ADDRA[2] => DOA) = 472; (ADDRB[2] => DOB) = 472; (ADDRC[2] => DOC) = 472; (ADDRD[2] => DOD) = 472;
    (ADDRA[3] => DOA) = 407; (ADDRB[3] => DOB) = 407; (ADDRC[3] => DOC) = 407; (ADDRD[3] => DOD) = 407;
    (ADDRA[4] => DOA) = 238; (ADDRB[4] => DOB) = 238; (ADDRC[4] => DOC) = 238; (ADDRD[4] => DOD) = 238;
  endspecify
endmodule