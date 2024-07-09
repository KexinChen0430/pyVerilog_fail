module roi(input clk, input [7:0] din, output [`N_LUT + `N_BRAM-1:0] dout);
	genvar i;
	generate
		for (i = 0; i < `N_LUT; i = i+1) begin:luts
			LUT6 #(
				.INIT(64'h8000_0000_0000_0001 + (i << 16))
			) lut (
				.I0(din[0]),
				.I1(din[1]),
				.I2(din[2]),
				.I3(din[3]),
				.I4(din[4]),
				.I5(din[5]),
				.O(dout[i])
			);
		end
	endgenerate
	genvar j;
	generate
		for (j = 0; j < `N_BRAM; j = j+1) begin:brams
            (* KEEP, DONT_TOUCH *)
            RAMB36E1 #(
                    .INIT_00(256'h8000000000000000000000000000000000000000000000000000000000000000 + (j << 16))
                ) bram (
                    .CLKARDCLK(din[0]),
                    .CLKBWRCLK(din[1]),
                    .ENARDEN(din[2]),
                    .ENBWREN(din[3]),
                    .REGCEAREGCE(din[4]),
                    .REGCEB(din[5]),
                    .RSTRAMARSTRAM(din[6]),
                    .RSTRAMB(din[7]),
                    .RSTREGARSTREG(din[0]),
                    .RSTREGB(din[1]),
                    .ADDRARDADDR(din[2]),
                    .ADDRBWRADDR(din[3]),
                    .DIADI(din[4]),
                    .DIBDI(din[5]),
                    .DIPADIP(din[6]),
                    .DIPBDIP(din[7]),
                    .WEA(din[0]),
                    .WEBWE(din[1]),
                    .DOADO(dout[j + `N_LUT]),
                    .DOBDO(),
                    .DOPADOP(),
                    .DOPBDOP());
		end
	endgenerate
endmodule