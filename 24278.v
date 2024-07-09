module '%s' has multiple valid bits active in same cycle!",INSTANCE_NAME);$finish(); end end
  wire [32:0] unnamedcallArbitrate8576USEDMULTIPLEcallArbitrate;assign unnamedcallArbitrate8576USEDMULTIPLEcallArbitrate = {(set_valid||setby_valid),((set_valid)?(set_inp):(regby_inner_process_output))};
    always @ (posedge CLK) begin if ((unnamedcallArbitrate8576USEDMULTIPLEcallArbitrate[32]) && CE) begin R <= (unnamedcallArbitrate8576USEDMULTIPLEcallArbitrate[31:0]); end end
  assign SETBY_OUTPUT = regby_inner_process_output;
  assign GET_OUTPUT = R;
  // function: set pure=false ONLY WIRE
  // function: setby pure=false ONLY WIRE
  // function: get pure=true ONLY WIRE
  incif_wrapuint32_153615_inc1 #(.INSTANCE_NAME({INSTANCE_NAME,"_regby_inner"})) regby_inner(.CLK(CLK), .CE(CE), .process_input({setby_inp,R}), .process_output(regby_inner_process_output));
endmodule