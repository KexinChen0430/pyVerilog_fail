module
	dct #(coef_width, di_width, do_width)
	dct_mod(
		.clk(clk),
		.ena(ena),
		.rst(rst),
		.dstrb(dstrb),
		.din(din),
		.dout_00(res00),
		.dout_01(res01),
		.dout_02(res02),
		.dout_03(res03),
		.dout_04(res04),
		.dout_05(res05),
		.dout_06(res06),
		.dout_07(res07),
		.dout_10(res10),
		.dout_11(res11),
		.dout_12(res12),
		.dout_13(res13),
		.dout_14(res14),
		.dout_15(res15),
		.dout_16(res16),
		.dout_17(res17),
		.dout_20(res20),
		.dout_21(res21),
		.dout_22(res22),
		.dout_23(res23),
		.dout_24(res24),
		.dout_25(res25),
		.dout_26(res26),
		.dout_27(res27),
		.dout_30(res30),
		.dout_31(res31),
		.dout_32(res32),
		.dout_33(res33),
		.dout_34(res34),
		.dout_35(res35),
		.dout_36(res36),
		.dout_37(res37),
		.dout_40(res40),
		.dout_41(res41),
		.dout_42(res42),
		.dout_43(res43),
		.dout_44(res44),
		.dout_45(res45),
		.dout_46(res46),
		.dout_47(res47),
		.dout_50(res50),
		.dout_51(res51),
		.dout_52(res52),
		.dout_53(res53),
		.dout_54(res54),
		.dout_55(res55),
		.dout_56(res56),
		.dout_57(res57),
		.dout_60(res60),
		.dout_61(res61),
		.dout_62(res62),
		.dout_63(res63),
		.dout_64(res64),
		.dout_65(res65),
		.dout_66(res66),
		.dout_67(res67),
		.dout_70(res70),
		.dout_71(res71),
		.dout_72(res72),
		.dout_73(res73),
		.dout_74(res74),
		.dout_75(res75),
		.dout_76(res76),
		.dout_77(res77),
		.douten(doe)
	);
	// Hookup ZigZag unit
	zigzag zigzag_mod(
		.clk(clk),
		.ena(ena),
		.dstrb(doe),
		.din_00(res00),
		.din_01(res01),
		.din_02(res02),
		.din_03(res03),
		.din_04(res04),
		.din_05(res05),
		.din_06(res06),
		.din_07(res07),
		.din_10(res10),
		.din_11(res11),
		.din_12(res12),
		.din_13(res13),
		.din_14(res14),
		.din_15(res15),
		.din_16(res16),
		.din_17(res17),
		.din_20(res20),
		.din_21(res21),
		.din_22(res22),
		.din_23(res23),
		.din_24(res24),
		.din_25(res25),
		.din_26(res26),
		.din_27(res27),
		.din_30(res30),
		.din_31(res31),
		.din_32(res32),
		.din_33(res33),
		.din_34(res34),
		.din_35(res35),
		.din_36(res36),
		.din_37(res37),
		.din_40(res40),
		.din_41(res41),
		.din_42(res42),
		.din_43(res43),
		.din_44(res44),
		.din_45(res45),
		.din_46(res46),
		.din_47(res47),
		.din_50(res50),
		.din_51(res51),
		.din_52(res52),
		.din_53(res53),
		.din_54(res54),
		.din_55(res55),
		.din_56(res56),
		.din_57(res57),
		.din_60(res60),
		.din_61(res61),
		.din_62(res62),
		.din_63(res63),
		.din_64(res64),
		.din_65(res65),
		.din_66(res66),
		.din_67(res67),
		.din_70(res70),
		.din_71(res71),
		.din_72(res72),
		.din_73(res73),
		.din_74(res74),
		.din_75(res75),
		.din_76(res76),
		.din_77(res77),
		.dout(dout),
		.douten(douten)
	);
endmodule