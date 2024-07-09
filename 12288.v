module roi (input ci, input s0, output o0);
	wire [7:0] o, passthru_co, passthru_carry8_single_co;
	(* LOC="SLICE_X67Y332", DONT_TOUCH *)
	CARRY8 #(.CARRY_TYPE("DUAL_CY4"))
	carry8_dual_inst (
		.CI_TOP(passthru_carry8_single_co[7]),
		.CI(1'b0),
		.DI(4'b00000000),
		.S({7'b0000000, s0}),
		.O(o)
	);
	(* LOC="SLICE_X67Y331", DONT_TOUCH *)
	CARRY8 #(.CARRY_TYPE("SINGLE_CY8"))
	carry8_inst (
		.CI(passthru_co[7]),
		.CI_TOP(1'b0),
		.DI(4'b00000000),
		.S({7'b0000000, s0}),
		.CO(passthru_carry8_single_co)
	);
	(* LOC="SLICE_X67Y330", DONT_TOUCH *)
	CARRY8 #(.CARRY_TYPE("SINGLE_CY8"))
	carry8_passthru (
		.CI(1'b1),
		.CI_TOP(1'b0),
		.DI({ci, 7'b0000000}),
		.S(8'b00000000),
		.CO(passthru_co)
	);
	assign o0 = o;
endmodule