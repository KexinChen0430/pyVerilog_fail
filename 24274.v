module '%s' has multiple valid bits active in same cycle!",INSTANCE_NAME);$finish(); end end
  wire [1:0] unnamedcallArbitrate8075USEDMULTIPLEcallArbitrate;assign unnamedcallArbitrate8075USEDMULTIPLEcallArbitrate = {(pushPop_valid||reset),((pushPop_valid)?(SR1):((1'd0)))};
    always @ (posedge CLK) begin if ((unnamedcallArbitrate8075USEDMULTIPLEcallArbitrate[1]) && CE) begin SR2 <= (unnamedcallArbitrate8075USEDMULTIPLEcallArbitrate[0]); end end
  assign pushPop_out = SR2;
  // function: pushPop pure=false delay=0
  // function: reset pure=false delay=0
endmodule