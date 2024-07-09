module arriaiigz_clkena (
                        inclk,
                        ena,
                        devpor,
                        devclrn,
                        enaout,
                        outclk
                        );
// INPUT PORTS
input inclk;
input ena;
input devpor;
input devclrn;
// OUTPUT PORTS
output enaout;
output outclk;
parameter clock_type = "Auto";
parameter ena_register_mode = "falling edge";
parameter lpm_type = "arriaiigz_clkena";
tri1 devclrn;
tri1 devpor;
wire cereg1_out; // output of ENA register1
wire cereg2_out; // output of ENA register2
wire ena_out; // choice of registered ENA or none.
arriaiigz_ena_reg extena_reg1(
                    .clk(!inclk),
                    .ena(1'b1),
                    .d(ena),
                    .clrn(1'b1),
                    .prn(devpor),
                    .q(cereg1_out)
                   );
arriaiigz_ena_reg extena_reg2(
                    .clk(!inclk),
                    .ena(1'b1),
                    .d(cereg1_out),
                    .clrn(1'b1),
                    .prn(devpor),
                    .q(cereg2_out)
                   );
assign ena_out = (ena_register_mode == "falling edge") ? cereg1_out :
                 ((ena_register_mode == "none") ? ena : cereg2_out);
arriaiigz_and2 outclk_and(
                .IN1(inclk),
                .IN2(ena_out),
                .Y(outclk)
                );
arriaiigz_and2 enaout_and(
                .IN1(1'b1),
                .IN2(ena_out),
                .Y(enaout)
                );
endmodule