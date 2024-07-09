module hardcopyiii_clkselect
(
    inclk,
    clkselect,
    outclk
);
input [3:0] inclk;
input [1:0] clkselect;
output outclk;
parameter lpm_type = "hardcopyiii_clkselect";
wire clkmux_out; // output of CLK mux
specify
    (inclk[3] => outclk) = (0, 0);
    (inclk[2] => outclk) = (0, 0);
    (inclk[1] => outclk) = (0, 0);
    (inclk[0] => outclk) = (0, 0);
    (clkselect[1] => outclk) = (0, 0);
    (clkselect[0] => outclk) = (0, 0);
endspecify
hardcopyiii_mux41 clk_mux (
                     .MO(clkmux_out),
                     .IN0(inclk[0]),
                     .IN1(inclk[1]),
                     .IN2(inclk[2]),
                     .IN3(inclk[3]),
                     .S({clkselect[1], clkselect[0]}));
and (outclk, clkmux_out, 1'b1);
endmodule