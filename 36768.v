module mux4_1 ( s, i0, i1, i2, i3, o );
	input [1:0] s;
	input i0, i1, i2, i3;
	output o;
	// synthesis attribute keep_hierarchy mux4_1 "yes";
	defparam m0.INIT = 64'hDFDAD5D08F8A8580;
	LUT6 m0 (
	.I0(s[1]),
	.I1(i3),
	.I2(s[0]),
	.I3(i0),
	.I4(i2),
	.I5(i1),
	.O(o)
	);
endmodule