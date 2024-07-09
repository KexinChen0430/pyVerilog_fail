module LUT3 (
  output O,
  input  I0,
  input  I1,
  input  I2
);
  parameter [7:0] INIT = 0;
  parameter EQN = "(I0)";
  wire XSL = I1;
  wire XAB = I2;
  // Two bit group [H,L]
  // H =0:  T[AB]S[12] = GND, H=1:   VCC
  // HL=00: T[AB][12]  = GND, HL=11: VCC, else I0
  wire XA1;
  wire XA2;
  wire XB1;
  wire XB2;
  generate case(INIT[1:0])
    2'b00:   assign XA1 = 1'b0;
    2'b11:   assign XA1 = 1'b0;
    default: assign XA1 = I0;
  endcase endgenerate
  generate case(INIT[3:2])
    2'b00:   assign XA2 = 1'b0;
    2'b11:   assign XA2 = 1'b0;
    default: assign XA2 = I0;
  endcase endgenerate
  generate case(INIT[5:4])
    2'b00:   assign XB1 = 1'b0;
    2'b11:   assign XB1 = 1'b0;
    default: assign XB1 = I0;
  endcase endgenerate
  generate case(INIT[7:6])
    2'b00:   assign XB2 = 1'b0;
    2'b11:   assign XB2 = 1'b0;
    default: assign XB2 = I0;
  endcase endgenerate
  localparam XAS1 = INIT[0];
  localparam XAS2 = INIT[2];
  localparam XBS1 = INIT[4];
  localparam XBS2 = INIT[6];
  // T_FRAG to be packed either into T_FRAG or B_FRAG.
  T_FRAG # (
  .XAS1(XAS1),
  .XAS2(XAS2),
  .XBS1(XBS1),
  .XBS2(XBS2)
  )
  t_frag
  (
  .TBS(1'b1), // Always route to const1
  .XAB(XAB),
  .XSL(XSL),
  .XA1(XA1),
  .XA2(XA2),
  .XB1(XB1),
  .XB2(XB2),
  .XZ (O)
  );
endmodule