module LUT4 (
  output O,
  input  I0,
  input  I1,
  input  I2,
  input  I3
);
  parameter [15:0] INIT = 0;
  parameter EQN = "(I0)";
  wire TSL = I1;
  wire BSL = I1;
  wire TAB = I2;
  wire BAB = I2;
  wire TBS = I3;
  // Two bit group [H,L]
  // H =0:  [TB][AB]S[12] = GND, H=1:   VCC
  // HL=00: [TB][AB][12]  = GND, HL=11: VCC, else I0
  wire TA1;
  wire TA2;
  wire TB1;
  wire TB2;
  wire BA1;
  wire BA2;
  wire BB1;
  wire BB2;
  generate case(INIT[ 1: 0])
    2'b00:   assign TA1 = 1'b0;
    2'b11:   assign TA1 = 1'b0;
    default: assign TA1 = I0;
  endcase endgenerate
  generate case(INIT[ 3: 2])
    2'b00:   assign TA2 = 1'b0;
    2'b11:   assign TA2 = 1'b0;
    default: assign TA2 = I0;
  endcase endgenerate
  generate case(INIT[ 5: 4])
    2'b00:   assign TB1 = 1'b0;
    2'b11:   assign TB1 = 1'b0;
    default: assign TB1 = I0;
  endcase endgenerate
  generate case(INIT[ 7: 6])
    2'b00:   assign TB2 = 1'b0;
    2'b11:   assign TB2 = 1'b0;
    default: assign TB2 = I0;
  endcase endgenerate
  generate case(INIT[ 9: 8])
    2'b00:   assign BA1 = 1'b0;
    2'b11:   assign BA1 = 1'b0;
    default: assign BA1 = I0;
  endcase endgenerate
  generate case(INIT[11:10])
    2'b00:   assign BA2 = 1'b0;
    2'b11:   assign BA2 = 1'b0;
    default: assign BA2 = I0;
  endcase endgenerate
  generate case(INIT[13:12])
    2'b00:   assign BB1 = 1'b0;
    2'b11:   assign BB1 = 1'b0;
    default: assign BB1 = I0;
  endcase endgenerate
  generate case(INIT[15:14])
    2'b00:   assign BB2 = 1'b0;
    2'b11:   assign BB2 = 1'b0;
    default: assign BB2 = I0;
  endcase endgenerate
  localparam TAS1 = INIT[ 0];
  localparam TAS2 = INIT[ 2];
  localparam TBS1 = INIT[ 4];
  localparam TBS2 = INIT[ 6];
  localparam BAS1 = INIT[ 8];
  localparam BAS2 = INIT[10];
  localparam BBS1 = INIT[12];
  localparam BBS2 = INIT[14];
  // The C-Frag
  C_FRAG # (
  .TAS1(TAS1),
  .TAS2(TAS2),
  .TBS1(TBS1),
  .TBS2(TBS2),
  .BAS1(BAS1),
  .BAS2(BAS2),
  .BBS1(BBS1),
  .BBS2(BBS2)
  )
  c_frag
  (
  .TBS(TBS),
  .TAB(TAB),
  .TSL(TSL),
  .TA1(TA1),
  .TA2(TA2),
  .TB1(TB1),
  .TB2(TB2),
  .BAB(BAB),
  .BSL(BSL),
  .BA1(BA1),
  .BA2(BA2),
  .BB1(BB1),
  .BB2(BB2),
  .CZ (O)
  );
endmodule