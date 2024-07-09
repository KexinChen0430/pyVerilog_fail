module '%s' has multiple valid bits active in same cycle!",INSTANCE_NAME);$finish(); end end
  wire [16:0] unnamedcallArbitrate3648USEDMULTIPLEcallArbitrate;assign unnamedcallArbitrate3648USEDMULTIPLEcallArbitrate = {(set_valid||setby_valid),((set_valid)?(set_inp):(regby_inner_process_output))};
    always @ (posedge CLK) begin if ((unnamedcallArbitrate3648USEDMULTIPLEcallArbitrate[16]) && CE) begin R <= (unnamedcallArbitrate3648USEDMULTIPLEcallArbitrate[15:0]); end end
  assign SETBY_OUTPUT = regby_inner_process_output;
  assign GET_OUTPUT = R;
  // function: set pure=false ONLY WIRE
  // function: setby pure=false ONLY WIRE
  // function: get pure=true ONLY WIRE
  incif_wrapuint16_646_inc2 #(.INSTANCE_NAME({INSTANCE_NAME,"_regby_inner"})) regby_inner(.CLK(CLK), .CE(CE), .process_input({setby_inp,R}), .process_output(regby_inner_process_output));
endmodule