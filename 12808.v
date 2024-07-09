module CSArray (
// ctl inputs
                Shift,
                Pos,
                Zero,
// inputs
                SumIn,
                CarryIn,
                Breg,
// ctl output
                SALSBs, SBLSBs, SCLSBs,
                CALSB,  CBLSB,  CCLSB,
// outputs
                SD,
                CD[`FracMSB:2]);
input  [3:0] Shift, Pos, Zero;
input  [`FracMSB:3] CarryIn, SumIn;
input  [`FracMSB:1] Breg;
output [2:1] SALSBs, SBLSBs, SCLSBs;
output CALSB,  CBLSB,  CCLSB;
output [`FracMSB:1] SD;
output [1+`FracMSB:2] CD;
wire [`FracMSB:1] SA, SB, SC; // For cs in line expansion
wire [1+`FracMSB:2] CA, CB, CC;
CS_STAGE_57 asdc ({SumIn[`FracMSB], SumIn[`FracMSB], SumIn[`FracMSB:3]},
                  {CarryIn[`FracMSB], CarryIn[`FracMSB], CarryIn[`FracMSB:3]},
                  Breg, Shift[0], Pos[0], Zero[0],
                  {SA[`FracMSB:3], SALSBs[2:1]}, {CA[1+`FracMSB:3], CALSB});
CS_STAGE_57 asdd ({SA[`FracMSB], SA[`FracMSB], SA[`FracMSB:3]},
                  {CA[`FracMSB], CA[`FracMSB], CA[`FracMSB:3]},
                  Breg, Shift[1], Pos[1], Zero[1],
                  {SB[`FracMSB:3], SBLSBs[2:1]}, {CB[1+`FracMSB:3], CBLSB});
CS_STAGE_57 asde ({SB[`FracMSB], SB[`FracMSB], SB[`FracMSB:3]},
                  {CB[`FracMSB], CB[`FracMSB], CB[`FracMSB:3]},
                  Breg, Shift[2], Pos[2], Zero[2],
                  {SC[`FracMSB:3], SCLSBs[2:1]}, {CC[1+`FracMSB:3], CCLSB});
CS_STAGE_57 asdf ({SC[`FracMSB], SC[`FracMSB], SC[`FracMSB:3]},
                  {CC[`FracMSB], CC[`FracMSB], CC[`FracMSB:3]},
                  Breg, Shift[3], Pos[3], Zero[3],
                  SD, CD);
endmodule