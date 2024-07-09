module CARRY4_FIX(output O0, O1, O2, O3, CO0, CO1, CO2, CO3, input CYINIT, CIN, DI0, DI1, DI2, DI3, S0, S1, S2, S3);
  parameter CYINIT_AX = 1'b0;
  parameter CYINIT_C0 = 1'b0;
  parameter CYINIT_C1 = 1'b0;
  if(CYINIT_AX) begin
    CARRY4_VPR #(
        .CYINIT_AX(1'b1),
        .CYINIT_C0(1'b0),
        .CYINIT_C1(1'b0)
    ) _TECHMAP_REPLACE_ (
        .CO0(CO0),
        .CO1(CO1),
        .CO2(CO2),
        .CO3(CO3),
        .CYINIT(CYINIT),
        .O0(O0),
        .O1(O1),
        .O2(O2),
        .O3(O3),
        .DI0(DI0),
        .DI1(DI1),
        .DI2(DI2),
        .DI3(DI3),
        .S0(S0),
        .S1(S1),
        .S2(S2),
        .S3(S3)
    );
  end else if(CYINIT_C0 || CYINIT_C1) begin
    CARRY4_VPR #(
        .CYINIT_AX(1'b0),
        .CYINIT_C0(CYINIT_C0),
        .CYINIT_C1(CYINIT_C1)
    ) _TECHMAP_REPLACE_ (
        .CO0(CO0),
        .CO1(CO1),
        .CO2(CO2),
        .CO3(CO3),
        .O0(O0),
        .O1(O1),
        .O2(O2),
        .O3(O3),
        .DI0(DI0),
        .DI1(DI1),
        .DI2(DI2),
        .DI3(DI3),
        .S0(S0),
        .S1(S1),
        .S2(S2),
        .S3(S3)
    );
  end else begin
    CARRY4_VPR #(
        .CYINIT_AX(1'b0),
        .CYINIT_C0(1'b0),
        .CYINIT_C1(1'b0)
    ) _TECHMAP_REPLACE_ (
        .CO0(CO0),
        .CO1(CO1),
        .CO2(CO2),
        .CO3(CO3),
        .O0(O0),
        .O1(O1),
        .O2(O2),
        .O3(O3),
        .DI0(DI0),
        .DI1(DI1),
        .DI2(DI2),
        .DI3(DI3),
        .S0(S0),
        .S1(S1),
        .S2(S2),
        .S3(S3),
        .CIN(CIN)
    );
  end
endmodule