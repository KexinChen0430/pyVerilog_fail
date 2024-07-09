module
seg7decimal u7 (
.x(x),
.clk(clk),
.clr(btnC),
.a_to_g(seg),
.an(an),
.dp(dp)
);
// Arithmetic Operations
// Adder/Subtractor Module
adder u8 (
.clk(clk),
.a(sw[15:8]),
.b(sw[7:0]),
.sum(sum),
.diff(diff),
.cout(cout),
.cin(btnU)
);
// Product/Multiplication
// Partial Product 0 Module
multi_4_4_pp0 u9 (
.clk(clk),
//.clr(btn[1]),
.A0_3(sw[11:8]),
.B0_3(sw[3:0]),
.pp0(PP0)
);
// Partial Product 1 Module
multi_4_4_pp1 u10 (
.clk(clk),
//.clr(btn[1]),
.A4_7(sw[15:12]),
.B0_3(sw[3:0]),
.pp1(PP1)
);
// Partial Product 2 Module
multi_4_4_pp2 u11 (
.clk(clk),
//.clr(btn[1]),
.A0_3(sw[11:8]),
.B4_7(sw[7:4]),
.pp2(PP2)
);
// Partial Product 3 Module
multi_4_4_pp3 u12 (
.clk(clk),
//.clr(btn[1]),
.A4_7(sw[15:12]),
.B4_7(sw[7:4]),
.pp3(PP3)
);
// Divider Module
divider u13(
.clk(clk),
.div(sw[15:8]),
.dvr(sw[7:0]),
.quotient(QU),
.remainder(REM)
);
endmodule