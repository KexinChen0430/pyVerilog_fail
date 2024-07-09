module '%s' has multiple valid bits active in same cycle!",INSTANCE_NAME);$finish(); end end
  wire [8:0] unnamedcallArbitrate445USEDMULTIPLEcallArbitrate;assign unnamedcallArbitrate445USEDMULTIPLEcallArbitrate = {(set_valid||setby_valid),((set_valid)?(set_inp):(regby_inner_process_output))};
    always @ (posedge CLK) begin if ((unnamedcallArbitrate445USEDMULTIPLEcallArbitrate[8]) && CE) begin R <= (unnamedcallArbitrate445USEDMULTIPLEcallArbitrate[7:0]); end end
  assign SETBY_OUTPUT = regby_inner_process_output;
  assign GET_OUTPUT = R;
  // function: set pure=false ONLY WIRE
  // function: setby pure=false ONLY WIRE
  // function: get pure=true ONLY WIRE
  incif_wrapuint8_127_incnil #(.INSTANCE_NAME({INSTANCE_NAME,"_regby_inner"})) regby_inner(.CLK(CLK), .CE(CE), .process_input({setby_inp,R}), .process_output(regby_inner_process_output));
endmodule