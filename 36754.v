module mux4_8 ( s, i0, i1, i2, i3, o );
	input  [1:0] s;
	input  [7:0] i0, i1, i2, i3;
	output [7:0] o;
	// synthesis attribute keep_hierarchy mux4_8 "yes";
	defparam m0.INIT = 64'hDFDAD5D08F8A8580;
	LUT6 m0 (
	.I0(s[1]),
	.I1(i3[0]),
	.I2(s[0]),
	.I3(i0[0]),
	.I4(i2[0]),
	.I5(i1[0]),
	.O(o[0])
	);
	defparam m1.INIT = 64'hDFDAD5D08F8A8580;
	LUT6 m1 (
	.I0(s[1]),
	.I1(i3[1]),
	.I2(s[0]),
	.I3(i0[1]),
	.I4(i2[1]),
	.I5(i1[1]),
	.O(o[1])
	);
	defparam m2.INIT = 64'hDFDAD5D08F8A8580;
	LUT6 m2 (
	.I0(s[1]),
	.I1(i3[2]),
	.I2(s[0]),
	.I3(i0[2]),
	.I4(i2[2]),
	.I5(i1[2]),
	.O(o[2])
	);
	defparam m3.INIT = 64'hDFDAD5D08F8A8580;
	LUT6 m3 (
	.I0(s[1]),
	.I1(i3[3]),
	.I2(s[0]),
	.I3(i0[3]),
	.I4(i2[3]),
	.I5(i1[3]),
	.O(o[3])
	);
	defparam m4.INIT = 64'hDFDAD5D08F8A8580;
	LUT6 m4 (
	.I0(s[1]),
	.I1(i3[4]),
	.I2(s[0]),
	.I3(i0[4]),
	.I4(i2[4]),
	.I5(i1[4]),
	.O(o[4])
	);
	defparam m5.INIT = 64'hDFDAD5D08F8A8580;
	LUT6 m5 (
	.I0(s[1]),
	.I1(i3[5]),
	.I2(s[0]),
	.I3(i0[5]),
	.I4(i2[5]),
	.I5(i1[5]),
	.O(o[5])
	);
	defparam m6.INIT = 64'hDFDAD5D08F8A8580;
	LUT6 m6 (
	.I0(s[1]),
	.I1(i3[6]),
	.I2(s[0]),
	.I3(i0[6]),
	.I4(i2[6]),
	.I5(i1[6]),
	.O(o[6])
	);
	defparam m7.INIT = 64'hDFDAD5D08F8A8580;
	LUT6 m7 (
	.I0(s[1]),
	.I1(i3[7]),
	.I2(s[0]),
	.I3(i0[7]),
	.I4(i2[7]),
	.I5(i1[7]),
	.O(o[7])
	);
endmodule