module ultra_slice_logic_ffx #(
	parameter [1023:0] LOC = "",
	parameter [1023:0] BEL = "",
	parameter [1023:0] TYPE = "",
	parameter CLKINV = 1'b0,
	parameter SRINV = 1'b0,
	parameter INIT = 1'b0
) (
	input C, CE, SR, D,
	output Q
);
	generate
		case (TYPE)
			"FDPE": (* LOC=LOC, BEL=BEL, keep, dont_touch *) FDPE #(.IS_C_INVERTED(CLKINV), .IS_PRE_INVERTED(SRINV), .INIT(INIT)) ff_i (.C(C), .CE(CE), .PRE(SR), .D(D), .Q(Q));
			"FDCE": (* LOC=LOC, BEL=BEL, keep, dont_touch *) FDCE #(.IS_C_INVERTED(CLKINV), .IS_CLR_INVERTED(SRINV), .INIT(INIT)) ff_i (.C(C), .CE(CE), .CLR(SR), .D(D), .Q(Q));
			"FDSE": (* LOC=LOC, BEL=BEL, keep, dont_touch *) FDSE #(.IS_C_INVERTED(CLKINV), .IS_S_INVERTED(SRINV), .INIT(INIT)) ff_i (.C(C), .CE(CE), .S(SR), .D(D), .Q(Q));
			"FDRE": (* LOC=LOC, BEL=BEL, keep, dont_touch *) FDRE #(.IS_C_INVERTED(CLKINV), .IS_R_INVERTED(SRINV), .INIT(INIT)) ff_i (.C(C), .CE(CE), .R(SR), .D(D), .Q(Q));
			"LDPE": (* LOC=LOC, BEL=BEL, keep, dont_touch *) LDPE #(.IS_G_INVERTED(CLKINV), .IS_PRE_INVERTED(SRINV), .INIT(INIT)) ff_i (.G(C), .GE(CE), .PRE(SR), .D(D), .Q(Q));
			"LDCE": (* LOC=LOC, BEL=BEL, keep, dont_touch *) LDCE #(.IS_G_INVERTED(CLKINV), .IS_CLR_INVERTED(SRINV), .INIT(INIT)) ff_i (.G(C), .GE(CE), .CLR(SR), .D(D), .Q(Q));
			"NONE": assign Q = INIT;
		endcase
	endgenerate
endmodule