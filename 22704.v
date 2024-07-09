module hardcopyiii_bias_block(
			clk,
			shiftnld,
			captnupdt,
			din,
			dout
			);
// INPUT PORTS
input  clk;
input  shiftnld;
input  captnupdt;
input  din;
// OUTPUTPUT PORTS
output dout;
parameter lpm_type = "hardcopyiii_bias_block";
// INTERNAL VARIABLES
reg din_viol;
reg shiftnld_viol;
reg captnupdt_viol;
wire mainclk_wire;
wire updateclk_wire;
wire capture_wire;
wire update_wire;
wire dout_tmp;
specify
    $setuphold (posedge clk, din, 0, 0, din_viol) ;
    $setuphold (posedge clk, shiftnld, 0, 0, shiftnld_viol) ;
    $setuphold (posedge clk, captnupdt, 0, 0, captnupdt_viol) ;
    (posedge clk => (dout +: dout_tmp)) = 0 ;
endspecify
hardcopyiii_bias_logic logic_block (
                             .clk(clk),
                             .shiftnld(shiftnld),
                             .captnupdt(captnupdt),
                             .mainclk(mainclk_wire),
                             .updateclk(updateclk_wire),
                             .capture(capture_wire),
                             .update(update_wire)
                             );
hardcopyiii_bias_generator bias_generator (
                                    .din(din),
                                    .mainclk(mainclk_wire),
                                    .updateclk(updateclk_wire),
                                    .capture(capture_wire),
                                    .update(update_wire),
                                    .dout(dout_tmp)
                                    );
and (dout, dout_tmp, 1'b1);
endmodule