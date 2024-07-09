module cycloneive_clkctrl (
                        inclk,
                        clkselect,
                        ena,
                        devpor,
                        devclrn,
                        outclk
                        );
input [3:0] inclk;
input [1:0] clkselect;
input ena;
input devpor;
input devclrn;
output outclk;
tri1 devclrn;
tri1 devpor;
parameter clock_type = "auto";
parameter ena_register_mode = "falling edge";
parameter lpm_type = "cycloneive_clkctrl";
wire clkmux_out; // output of CLK mux
wire cereg1_out; // output of ENA register1
wire cereg2_out; // output of ENA register2
wire ena_out; // choice of registered ENA or none.
wire inclk3_ipd;
wire inclk2_ipd;
wire inclk1_ipd;
wire inclk0_ipd;
wire clkselect1_ipd;
wire clkselect0_ipd;
wire ena_ipd;
buf (inclk3_ipd, inclk[3]);
buf (inclk2_ipd, inclk[2]);
buf (inclk1_ipd, inclk[1]);
buf (inclk0_ipd, inclk[0]);
buf (clkselect1_ipd, clkselect[1]);
buf (clkselect0_ipd, clkselect[0]);
buf (ena_ipd, ena);
specify
    (inclk *> outclk) = (0, 0) ;
endspecify
cycloneive_mux41 clk_mux (.MO(clkmux_out),
               .IN0(inclk0_ipd),
               .IN1(inclk1_ipd),
               .IN2(inclk2_ipd),
               .IN3(inclk3_ipd),
               .S({clkselect1_ipd, clkselect0_ipd}));
cycloneive_ena_reg extena0_reg(
                    .clk(!clkmux_out),
                    .ena(1'b1),
                    .d(ena_ipd),
                    .clrn(1'b1),
                    .prn(devpor),
                    .q(cereg1_out)
                   );
cycloneive_ena_reg extena1_reg(
                    .clk(!clkmux_out),
                    .ena(1'b1),
                    .d(cereg1_out),
                    .clrn(1'b1),
                    .prn(devpor),
                    .q(cereg2_out)
                   );
assign ena_out = (ena_register_mode == "falling edge") ? cereg1_out :
                 ((ena_register_mode == "none") ? ena_ipd : cereg2_out);
and (outclk, ena_out, clkmux_out);
endmodule