module BUFGMUX (O, I0, I1, S);
    parameter CLK_SEL_TYPE = "SYNC";
    output O;
    input  I0, I1, S;
    reg q0, q1;
    reg q0_enable, q1_enable;
    wire q0_t, q1_t;
    reg clk_sel_in;
    tri0 GSR = glbl.GSR;
    bufif1 B0 (O, I0, q0_t);
    bufif1 B1 (O, I1, q1_t);
    pulldown P1 (O);
    initial
       clk_sel_in = (CLK_SEL_TYPE == "ASYNC") ? 1 : 0;
       assign q0_t = (clk_sel_in) ? ~S : q0;
       assign q1_t = (clk_sel_in) ? S : q1;
	always @(GSR or I0 or S or q0_enable)
 	    if (GSR)
		q0 <= 1;
 	    else if (!I0)
		q0 <= !S && q0_enable;
	always @(GSR or I1 or S or q1_enable)
 	    if (GSR)
		q1 <= 0;
 	    else if (!I1)
		q1 <= S && q1_enable;
	always @(GSR or q1 or I0)
 	    if (GSR)
		q0_enable <= 1;
	    else if (q1)
		q0_enable <= 0;
	    else if (I0)
		q0_enable <= !q1;
	always @(GSR or q0 or I1)
 	    if (GSR)
		q1_enable <= 0;
	    else if (q0)
		q1_enable <= 0;
	    else if (I1)
		q1_enable <= !q0;
endmodule