module CCU2(
	(* abc9_carry *) input CIN,
	input A1, B1, C1, D1, A0, B0, C0, D0,
	output S1, S0,
	(* abc9_carry *) output COUT);
	parameter INJECT = "YES";
	parameter INIT0 = "0x0000";
	parameter INIT1 = "0x1111";
	localparam inject_p = (INJECT == "YES") ? 1'b1 : 1'b0;
	wire LUT3_0, LUT4_0, LUT3_1, LUT4_1, carry_0;
	LUT4_3 #(.INIT(INIT0)) lut0 (.A(A0), .B(B0), .C(C0), .D(D0), .Z(LUT4_0), .Z3(LUT3_0));
	LUT4_3 #(.INIT(INIT1)) lut1 (.A(A1), .B(B1), .C(C1), .D(D1), .Z(LUT4_1), .Z3(LUT3_1));
	assign S0 = LUT4_0 ^ (CIN & ~inject_p);
	assign carry_0 = LUT4_0 ? CIN : (LUT3_0 & ~inject_p);
	assign S1 = LUT4_1 ^ (carry_0 & ~inject_p);
	assign COUT = LUT4_1 ? carry_0 : (LUT3_1 & ~inject_p);
	specify
		(A0 => S0) = 233;
		(B0 => S0) = 233;
		(C0 => S0) = 233;
		(D0 => S0) = 233;
		(CIN => S0) = 228;
		(A0 => S1) = 481;
		(B0 => S1) = 481;
		(C0 => S1) = 481;
		(D0 => S1) = 481;
		(A1 => S1) = 233;
		(B1 => S1) = 233;
		(C1 => S1) = 233;
		(D1 => S1) = 233;
		(CIN => S1) = 307;
		(A0 => COUT) = 347;
		(B0 => COUT) = 347;
		(C0 => COUT) = 347;
		(D0 => COUT) = 347;
		(A1 => COUT) = 347;
		(B1 => COUT) = 347;
		(C1 => COUT) = 347;
		(D1 => COUT) = 347;
		(CIN => COUT) = 59;
	endspecify
endmodule