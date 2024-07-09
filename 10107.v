module PE(clk, reset, ctrl, d0, d1, d2, out);
    input clk;
    input reset;
    input [10:0] ctrl;
    input [197:0] d0;
    input [`WIDTH:0] d1, d2;
    output [`WIDTH:0] out;
    reg [197:0] R0;
    reg [`WIDTH:0] R1, R2, R3;
    wire [1:0] e0, e1, e2; /* part of R0 */
    wire [`WIDTH:0] ppg0, ppg1, ppg2, /* output of PPG */
                    mx0, mx1, mx2, mx3, mx4, mx5, mx6, /* output of MUX */
                    ad0, ad1, ad2, /* output of GF(3^m) adder */
                    cu0, cu1, cu2, /* output of cubic */
                    mo0, mo1, mo2, /* output of mod_p */
                    t0, t1, t2;
    wire c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10;
    assign {c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10} = ctrl;
    assign mx0 = c0 ? d1 : ad2;
    assign mx1 = c2 ? d2 : ad2;
    always @ (posedge clk)
        if(reset) R1 <= 0;
        else if (c1) R1 <= mx0;
    always @ (posedge clk)
        if(reset) R2 <= 0;
        else if (c3) R2 <= mx1;
    always @ (posedge clk)
        if(reset) R0 <= 0;
        else if (c4) R0 <= d0;
        else if (c5) R0 <= R0 << 6;
    assign {e2,e1,e0} = R0[197:192];
    PPG
        ppg_0 (e0, R1, ppg0),
        ppg_1 (e1, R2, ppg1),
        ppg_2 (e2, R1, ppg2);
    v0  v0_ (ppg0, cu0);
    v1  v1_ (ppg1, cu1);
    v2  v2_ (ppg2, cu2);
    assign mx2 = c6 ? ppg0 : cu0;
    assign mx3 = c6 ? ppg1 : cu1;
    assign mx4 = c6 ? mo1 : cu2;
    assign mx5 = c7 ? mo2 : R3;
    mod_p
        mod_p_0 (mx3, mo0),
        mod_p_1 (ppg2, t0),
        mod_p_2 (t0, mo1),
        mod_p_3 (R3, t1),
        mod_p_4 (t1, t2),
        mod_p_5 (t2, mo2);
    assign mx6 = c9 ? mo0 : mx3;
    f3m_add
        f3m_add_0 (mx2, mx6, ad0),
        f3m_add_1 (mx4, c8 ? mx5 : 0, ad1),
        f3m_add_2 (ad0, ad1, ad2);
    always @ (posedge clk)
        if (reset) R3 <= 0;
        else if (c10) R3 <= ad2;
        else R3 <= 0; /* change */
    assign out = R3;
endmodule