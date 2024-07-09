module ShiftLeft   (NI,
                    SLControl,
		    LIB,
                    SLResult);
input [`FracMSB:0] NI;
input [3:0] SLControl;
input [2:0] LIB;		// shifted operand for int or frac
output [`FracMSB:0] SLResult;
wire [`FracMSB:0] N8, N4, N2, N1;
ME_TIEOFF toff (vdd, gnd);
ME_NMUX_2B_58 g23 (SLControl[3],
                   NI,
                   {LIB[2], LIB[1], LIB[0], NI[`FracMSB-11:0],
                    gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd},
                   N8);  // False
ME_NMUX_2B_58 g24 (SLControl[2],
                   N8,
                   {N8[`FracMSB-4:0], vdd, vdd, vdd, vdd}, N4);
ME_NMUX_2B_58 g25 (SLControl[1],
                   N4,
                   {N4[`FracMSB-2:0], gnd, gnd},
                   N2);  // False
ME_NMUX_2B_58 g26 (SLControl[0],  N2, {N2[`FracMSB-1:0], vdd}, N1); // true
ME_INV_A_58   g27 (N1, SLResult); // false
endmodule