module RAM32Kx8x16(input CLK1, input[14:0] AB1, input CS1,
					 input READ, output[7:0] DO1, input[7:0] DI1,
				    input CLK2, input[13:0] AB2, input CS2, output[15:0] DO2);
	wire[1:0] CSM = {(~AB1[0]) & CS1, AB1[0] & CS1}; // CS for modules
	wire[13:0] AB1x = AB1[14:1];
`include "juke-box.v"
/*	RAM16Kx1 ram0(CLK1, AB1x, CSM[0], READ, DO1[0], DI1[0], CLK2, AB2, CS2, DO2[0]);
	RAM16Kx1 ram1(CLK1, AB1x, CSM[0], READ, DO1[1], DI1[1], CLK2, AB2, CS2, DO2[1]);
	RAM16Kx1 ram2(CLK1, AB1x, CSM[0], READ, DO1[2], DI1[2], CLK2, AB2, CS2, DO2[2]);
	RAM16Kx1 ram3(CLK1, AB1x, CSM[0], READ, DO1[3], DI1[3], CLK2, AB2, CS2, DO2[3]);
	RAM16Kx1 ram4(CLK1, AB1x, CSM[0], READ, DO1[4], DI1[4], CLK2, AB2, CS2, DO2[4]);
	RAM16Kx1 ram5(CLK1, AB1x, CSM[0], READ, DO1[5], DI1[5], CLK2, AB2, CS2, DO2[5]);
	RAM16Kx1 ram6(CLK1, AB1x, CSM[0], READ, DO1[6], DI1[6], CLK2, AB2, CS2, DO2[6]);
	RAM16Kx1 ram7(CLK1, AB1x, CSM[0], READ, DO1[7], DI1[7], CLK2, AB2, CS2, DO2[7]);
	RAM16Kx1 ram8(CLK1, AB1x, CSM[1], READ, DO1[0], DI1[0], CLK2, AB2, CS2, DO2[8]);
	RAM16Kx1 ram9(CLK1, AB1x, CSM[1], READ, DO1[1], DI1[1], CLK2, AB2, CS2, DO2[9]);
	RAM16Kx1 ramA(CLK1, AB1x, CSM[1], READ, DO1[2], DI1[2], CLK2, AB2, CS2, DO2[10]);
	RAM16Kx1 ramB(CLK1, AB1x, CSM[1], READ, DO1[3], DI1[3], CLK2, AB2, CS2, DO2[11]);
	RAM16Kx1 ramC(CLK1, AB1x, CSM[1], READ, DO1[4], DI1[4], CLK2, AB2, CS2, DO2[12]);
	RAM16Kx1 ramD(CLK1, AB1x, CSM[1], READ, DO1[5], DI1[5], CLK2, AB2, CS2, DO2[13]);
	RAM16Kx1 ramE(CLK1, AB1x, CSM[1], READ, DO1[6], DI1[6], CLK2, AB2, CS2, DO2[14]);
	RAM16Kx1 ramF(CLK1, AB1x, CSM[1], READ, DO1[7], DI1[7], CLK2, AB2, CS2, DO2[15]);*/
endmodule