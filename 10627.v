module stratixv_phy_clkbuf (
                           inclk,
                           outclk
                          );
    parameter	 level1_mux = "VALUE_FAST";
    parameter 	 level2_mux  = "VALUE_FAST";
    input [3:0] inclk;
    output [3:0] outclk;
    stratixv_phy_clkbuf_encrypted inst (
    	.inclk(inclk),
    	.outclk(outclk));
    defparam inst.level1_mux = level1_mux;
    defparam inst.level2_mux = level2_mux;
endmodule