module Sec6_SM (sel, clk_slow) /* synthesis syn_module_defined=1 */ ;
    output [2:0]sel;
    input clk_slow;
    wire [3:0]n27;
    LUT4 i1_3_lut (.A(sel[2]), .B(n27[1]), .C(n27[2]), .Z(sel[0])) /* synthesis lut_function=(!(A+!(B+(C)))) */ ;
    defparam i1_3_lut.init = 16'h5454;
    FD1S3AX state_FSM_i3 (.D(n27[2]), .CK(clk_slow), .Q(sel[2]));
    defparam state_FSM_i3.GSR = "ENABLED";
    LUT4 i64_2_lut (.A(sel[2]), .B(n27[2]), .Z(sel[1])) /* synthesis lut_function=(!(A+!(B))) */ ;
    defparam i64_2_lut.init = 16'h4444;
    FD1S3AX state_FSM_i2 (.D(n27[1]), .CK(clk_slow), .Q(n27[2]));
    defparam state_FSM_i2.GSR = "ENABLED";
    FD1S3AX state_FSM_i1 (.D(n27[0]), .CK(clk_slow), .Q(n27[1]));
    defparam state_FSM_i1.GSR = "ENABLED";
    FD1S3AY state_FSM_i0 (.D(sel[2]), .CK(clk_slow), .Q(n27[0]));
    defparam state_FSM_i0.GSR = "ENABLED";
endmodule