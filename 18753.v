module Sec6_Top (ADCData, reset_n, sel, segments) /* synthesis syn_module_defined=1 */ ;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab6_finaldesign/section6_top.v(1[8:16])
    input [7:0]ADCData;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab6_finaldesign/section6_top.v(2[14:21])
    input reset_n;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab6_finaldesign/section6_top.v(3[8:15])
    output [2:0]sel;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab6_finaldesign/section6_top.v(4[15:18])
    output [6:0]segments;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab6_finaldesign/section6_top.v(5[15:23])
    wire GND_net;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab6_finaldesign/section6_top.v(11[13:20])
    wire reset_n_c;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab6_finaldesign/section6_top.v(3[8:15])
    wire [2:0]sel_c;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab6_finaldesign/section6_top.v(4[15:18])
    wire clk;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab6_finaldesign/section6_top.v(9[7:10])
    wire clk_slow;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab6_finaldesign/section6_top.v(10[7:15])
    wire VCC_net;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab6_finaldesign/section6_top.v(11[13:20])
    VHI i5 (.Z(VCC_net));
    OB sel_pad_1 (.I(sel_c[1]), .O(sel[1]));
    OSCH osc_int (.STDBY(GND_net), .OSC(clk)) /* synthesis syn_instantiated=1 */ ;
    defparam osc_int.NOM_FREQ = "2.08";
    VLO i1 (.Z(GND_net));
    PUR PUR_INST (.PUR(VCC_net));
    defparam PUR_INST.RST_PULSE = 1;
    OB sel_pad_2 (.I(sel_c[2]), .O(sel[2]));
    GSR GSR_INST (.GSR(reset_n_c));
    clock_counter counter_1 (.clk_slow(clk_slow), .clk(clk), .GND_net(GND_net)) /* synthesis syn_module_defined=1 */ ;
    Sec6_SM FSM_1 (.sel({sel_c}), .clk_slow(clk_slow)) /* synthesis syn_module_defined=1 */ ;
    OB sel_pad_0 (.I(sel_c[0]), .O(sel[0]));
    OB segments_pad_6 (.I(GND_net), .O(segments[6]));
    OB segments_pad_5 (.I(GND_net), .O(segments[5]));
    OB segments_pad_4 (.I(GND_net), .O(segments[4]));
    OB segments_pad_3 (.I(VCC_net), .O(segments[3]));
    OB segments_pad_2 (.I(VCC_net), .O(segments[2]));
    OB segments_pad_1 (.I(VCC_net), .O(segments[1]));
    OB segments_pad_0 (.I(VCC_net), .O(segments[0]));
    IB reset_n_pad (.I(reset_n), .O(reset_n_c));
endmodule