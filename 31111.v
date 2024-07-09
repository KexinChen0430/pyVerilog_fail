module ag6502_ext_clock(input baseclk, input phi_0, output phi_1, output phi_2);
	parameter DELAY1 = 2, DELAY2 = 0; // delays in semi-waves of baseclk
	wire phi_1_neg, phi_01;
	ag6502_phase_shift#DELAY1 d1(baseclk, phi_0, phi_1_neg);
	assign phi_1 = ~phi_1_neg;
	and(phi_01, phi_0, phi_1_neg);
	ag6502_phase_shift#DELAY2 d2(baseclk, phi_01, phi_2);
endmodule