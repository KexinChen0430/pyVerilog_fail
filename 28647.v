module stratixii_mac_mult(
                           dataa,
                           datab,
                           scanina,
                           scaninb,
                           sourcea,
                           sourceb,
                           signa,
                           signb,
                           round,
                           saturate,
                           clk,
                           aclr,
                           ena,
                           mode,
                           zeroacc,
                           dataout,
                           scanouta,
                           scanoutb,
                           devclrn,
                           devpor
                        );
//PARAMETERS
parameter dataa_width       = 18;
parameter datab_width       = 18;
parameter dataa_clock         = "none";
parameter datab_clock       = "none";
parameter signa_clock         = "none";
parameter signb_clock         = "none";
parameter round_clock       = "none";
parameter saturate_clock    = "none";
parameter output_clock       = "none";
parameter dataa_clear         = "none";
parameter datab_clear         = "none";
parameter signa_clear         = "none";
parameter signb_clear         = "none";
parameter round_clear       = "none";
parameter saturate_clear    = "none";
parameter output_clear       = "none";
parameter bypass_multiplier = "no";
parameter mode_clock        = "none";
parameter zeroacc_clock     = "none";
parameter mode_clear        = "none";
parameter zeroacc_clear     = "none";
// SIMULATION_ONLY_PARAMETERS_BEGIN
parameter signa_internally_grounded   = "false";
parameter signb_internally_grounded   = "false";
parameter lpm_hint                    = "true";
parameter lpm_type                    = "stratixii_mac_mult";
parameter dynamic_mode                = "no";
parameter dataout_width               = dataa_width + datab_width;
// SIMULATION_ONLY_PARAMETERS_END
//INPUT PORTS
input [dataa_width-1:0]  dataa;
input [datab_width-1:0]  datab;
input [dataa_width-1:0]  scanina;
input [datab_width-1:0]  scaninb;
input                     sourcea;
input                     sourceb;
input                     signa;
input                     signb;
input                     round;
input                     saturate;
input [3:0]                 clk;
input [3:0]                 aclr;
input [3:0]                 ena;
input                     mode;
input   zeroacc;
input                     devclrn;
input                     devpor;
//OUTPUT PORTS
output [dataout_width-1:0] dataout;
output [dataa_width-1:0] scanouta;
output [datab_width-1:0] scanoutb;
tri1 devclrn;
tri1 devpor;
//Internal Signals
wire [dataa_width-1:0] dataa_in; //dataa or scaninA depending on sourceA
wire [datab_width-1:0] datab_in;//datab or scaninB depending on sourceB
//Internal signals to instantiate the dataa input register unit
wire [3:0] dataa_clk_value;
wire [3:0] dataa_aclr_value;
wire dataa_clk;
wire dataa_aclr;
wire dataa_ena;
wire dataa_bypass_register;
wire [dataa_width-1:0] dataa_in_reg;
//Internal signals to instantiate the datab input register unit
wire [3:0] datab_clk_value;
wire [3:0] datab_aclr_value;
wire datab_clk;
wire datab_aclr;
wire datab_ena;
wire datab_bypass_register;
wire [datab_width-1:0] datab_in_reg;
//Internal signals to instantiate the signa input register unit
wire [3:0] signa_clk_value;
wire [3:0] signa_aclr_value;
wire signa_clk;
wire signa_aclr;
wire signa_ena;
wire signa_bypass_register;
wire  signa_in_reg;
//Internal signals to instantiate the signb input register unit
wire [3:0] signb_clk_value;
wire [3:0] signb_aclr_value;
wire signb_clk;
wire signb_aclr;
wire signb_ena;
wire signb_bypass_register;
wire  signb_in_reg;
//Internal signals to instantiate the round input register unit
wire [3:0] round_clk_value;
wire [3:0] round_aclr_value;
wire round_clk;
wire round_aclr;
wire round_ena;
wire round_bypass_register;
wire round_in_reg;
//Internal signals to instantiate the saturate input register unit
wire [3:0] saturate_clk_value;
wire [3:0] saturate_aclr_value;
wire saturate_clk;
wire saturate_aclr;
wire saturate_ena;
wire saturate_bypass_register;
wire saturate_in_reg;
//Internal signals to instantiate the mode input register unit
wire [3:0] mode_clk_value;
wire [3:0] mode_aclr_value;
wire mode_clk;
wire mode_aclr;
wire mode_ena;
wire mode_bypass_register;
wire  mode_in_reg;
//Internal signals to instantiate the zeroacc input register unit
wire [3:0] zeroacc_clk_value;
wire [3:0] zeroacc_aclr_value;
wire zeroacc_clk;
wire zeroacc_aclr;
wire zeroacc_ena;
wire zeroacc_bypass_register;
wire  zeroacc_in_reg;
//Internal signals to instantiate the multiplier block
wire bypass_mult;
wire signa_mult;
wire signb_mult;
wire [dataa_width-1:0] scanouta_mult;
wire [datab_width-1:0] scanoutb_mult;
wire [dataout_width-1:0] dataout_mult;
//Internal signals to instantiate round and saturate block
wire[7:0] mac_rs_dataout_size;
wire [71:0] mac_rs_dataa;
wire [71:0] mac_rs_datab;
wire [71:0] mac_rs_datain;
wire [71:0] mac_rs_dataout;
wire [71:0] dataout_reg;
//Internal signals to instantiate the output register unit
wire [3:0] output_clk_value;
wire [3:0] output_aclr_value;
wire output_clk;
wire output_aclr;
wire output_ena;
wire output_bypass_register;
//Select the scanin data or the multiplier data
assign  dataa_in = (sourcea == 1'b1) ? scanina : dataa;
assign  datab_in = (sourceb == 1'b1) ? scaninb : datab;
//Instantiate the dataa input Register
stratixii_mac_register dataa_input_register (
                                             .datain(dataa_in),
                                             .clk(dataa_clk),
                                             .aclr(dataa_aclr),
                                             .ena(dataa_ena),
                                             .bypass_register(dataa_bypass_register),
                                             .dataout(dataa_in_reg)
                                             );
defparam dataa_input_register.data_width = dataa_width;
//decode the clk and aclr values
assign dataa_clk_value =((dataa_clock == "0") || (dataa_clock == "none")) ? 4'b0000 :
                        (dataa_clock == "1") ? 4'b0001 :
                        (dataa_clock == "2") ? 4'b0010 :
                        (dataa_clock == "3") ? 4'b0011 : 4'b0000;
assign dataa_aclr_value = ((dataa_clear == "0") ||(dataa_clear == "none")) ? 4'b0000 :
                          (dataa_clear == "1") ? 4'b0001 :
                          (dataa_clear == "2") ? 4'b0010 :
                          (dataa_clear == "3") ? 4'b0011 : 4'b0000;
//assign the corresponding clk,aclr,enable and bypass register values.
assign dataa_clk = clk[dataa_clk_value] ? 'b1 : 'b0;
assign dataa_aclr = aclr[dataa_aclr_value] || ~devclrn || ~devpor   ? 'b1 : 'b0;
assign dataa_ena = ena[dataa_clk_value] ? 'b1 : 'b0;
assign dataa_bypass_register = (dataa_clock == "none") ? 'b1 : 'b0;
//Instantiate the datab input Register
stratixii_mac_register datab_input_register (
                                             .datain(datab_in),
                                             .clk(datab_clk),
                                             .aclr(datab_aclr),
                                             .ena(datab_ena),
                                             .bypass_register(datab_bypass_register),
                                             .dataout(datab_in_reg)
                                             );
defparam datab_input_register.data_width = datab_width;
//decode the clk and aclr values
assign datab_clk_value =((datab_clock == "0") || (datab_clock == "none")) ? 4'b0000 :
                        (datab_clock == "1") ? 4'b0001 :
                        (datab_clock == "2") ? 4'b0010 :
                        (datab_clock == "3") ? 4'b0011 : 4'b0000;
assign   datab_aclr_value = ((datab_clear == "0") ||(datab_clear == "none")) ? 4'b0000 :
                            (datab_clear == "1") ? 4'b0001 :
                            (datab_clear == "2") ? 4'b0010 :
                            (datab_clear == "3") ? 4'b0011 : 4'b0000;
//assign the corresponding clk,aclr,enable and bypass register values.
assign datab_clk = clk[datab_clk_value] ? 'b1 : 'b0;
assign datab_aclr = aclr[datab_aclr_value] || ~devclrn || ~devpor   ? 'b1 : 'b0;
assign datab_ena = ena[datab_clk_value] ? 'b1 : 'b0;
assign datab_bypass_register = (datab_clock == "none") ? 'b1 : 'b0;
//Instantiate the signa input Register
stratixii_mac_register signa_input_register (
                                             .datain(signa),
                                             .clk(signa_clk),
                                             .aclr(signa_aclr),
                                             .ena(signa_ena),
                                             .bypass_register(signa_bypass_register),
                                             .dataout(signa_in_reg)
                                             );
defparam signa_input_register.data_width = 1;
//decode the clk and aclr values
assign signa_clk_value =((signa_clock == "0") || (signa_clock == "none")) ? 4'b0000 :
                        (signa_clock == "1") ? 4'b0001 :
                        (signa_clock == "2") ? 4'b0010 :
                        (signa_clock == "3") ? 4'b0011 : 4'b0000;
assign   signa_aclr_value = ((signa_clear == "0") ||(signa_clear == "none")) ? 4'b0000 :
                            (signa_clear == "1") ? 4'b0001 :
                            (signa_clear == "2") ? 4'b0010 :
                            (signa_clear == "3") ? 4'b0011 : 4'b0000;
//assign the corresponding clk,aclr,enable and bypass register values.
assign signa_clk = clk[signa_clk_value] ? 'b1 : 'b0;
assign signa_aclr = aclr[signa_aclr_value] || ~devclrn || ~devpor   ? 'b1 : 'b0;
assign signa_ena = ena[signa_clk_value] ? 'b1 : 'b0;
assign signa_bypass_register = (signa_clock == "none") ? 'b1 : 'b0;
//Instantiate the signb input Register
stratixii_mac_register signb_input_register (
                                             .datain(signb),
                                             .clk(signb_clk),
                                             .aclr(signb_aclr),
                                             .ena(signb_ena),
                                             .bypass_register(signb_bypass_register),
                                             .dataout(signb_in_reg)
                                             );
defparam signb_input_register.data_width = 1;
//decode the clk and aclr values
assign signb_clk_value =((signb_clock == "0") || (signb_clock == "none")) ? 4'b0000 :
                        (signb_clock == "1") ? 4'b0001 :
                        (signb_clock == "2") ? 4'b0010 :
                        (signb_clock == "3") ? 4'b0011 : 4'b0000;
assign   signb_aclr_value = ((signb_clear == "0") ||(signb_clear == "none")) ? 4'b0000 :
                            (signb_clear == "1") ? 4'b0001 :
                            (signb_clear == "2") ? 4'b0010 :
                            (signb_clear == "3") ? 4'b0011 : 4'b0000;
//assign the corresponding clk,aclr,enable and bypass register values.
assign signb_clk = clk[signb_clk_value] ? 'b1 : 'b0;
assign signb_aclr = aclr[signb_aclr_value] || ~devclrn || ~devpor   ? 'b1 : 'b0;
assign signb_ena = ena[signb_clk_value] ? 'b1 : 'b0;
assign signb_bypass_register = (signb_clock == "none") ? 'b1 : 'b0;
//Instantiate the round input Register
stratixii_mac_register round_input_register (
                                             .datain(round),
                                             .clk(round_clk),
                                             .aclr(round_aclr),
                                             .ena(round_ena),
                                             .bypass_register(round_bypass_register),
                                             .dataout(round_in_reg)
                                             );
defparam round_input_register.data_width = 1;
//decode the clk and aclr values
assign round_clk_value =((round_clock == "0") || (round_clock == "none")) ? 4'b0000 :
                        (round_clock == "1") ? 4'b0001 :
                        (round_clock == "2") ? 4'b0010 :
                        (round_clock == "3") ? 4'b0011 : 4'b0000;
assign   round_aclr_value = ((round_clear == "0") ||(round_clear == "none")) ? 4'b0000 :
                            (round_clear == "1") ? 4'b0001 :
                            (round_clear == "2") ? 4'b0010 :
                            (round_clear == "3") ? 4'b0011 : 4'b0000;
//assign the corresponding clk,aclr,enable and bypass register values.
assign round_clk = clk[round_clk_value] ? 'b1 : 'b0;
assign round_aclr = aclr[round_aclr_value] || ~devclrn || ~devpor   ? 'b1 : 'b0;
assign round_ena = ena[round_clk_value] ? 'b1 : 'b0;
assign round_bypass_register = (round_clock == "none") ? 'b1 : 'b0;
//Instantiate the saturate input Register
stratixii_mac_register saturate_input_register (
                                             .datain(saturate),
                                             .clk(saturate_clk),
                                             .aclr(saturate_aclr),
                                             .ena(saturate_ena),
                                             .bypass_register(saturate_bypass_register),
                                             .dataout(saturate_in_reg)
                                             );
defparam saturate_input_register.data_width = 1;
//decode the clk and aclr values
assign saturate_clk_value =((saturate_clock == "0") || (saturate_clock == "none")) ? 4'b0000 :
                           (saturate_clock == "1") ? 4'b0001 :
                           (saturate_clock == "2") ? 4'b0010 :
                           (saturate_clock == "3") ? 4'b0011 : 4'b0000;
assign   saturate_aclr_value = ((saturate_clear == "0") ||(saturate_clear == "none")) ? 4'b0000 :
                               (saturate_clear == "1") ? 4'b0001 :
                               (saturate_clear == "2") ? 4'b0010 :
                               (saturate_clear == "3") ? 4'b0011 : 4'b0000;
//assign the corresponding clk,aclr,enable and bypass register values.
assign saturate_clk = clk[saturate_clk_value] ? 'b1 : 'b0;
assign saturate_aclr = aclr[saturate_aclr_value] || ~devclrn || ~devpor   ? 'b1 : 'b0;
assign saturate_ena = ena[saturate_clk_value] ? 'b1 : 'b0;
assign saturate_bypass_register = (saturate_clock == "none") ? 'b1 : 'b0;
//Instantiate the mode input Register
stratixii_mac_register mode_input_register (
                                            .datain(mode),
                                            .clk(mode_clk),
                                            .aclr(mode_aclr),
                                            .ena(mode_ena),
                                            .bypass_register(mode_bypass_register),
                                            .dataout(mode_in_reg)
                                            );
defparam mode_input_register.data_width = 1;
//decode the clk and aclr values
assign mode_clk_value =((mode_clock == "0") || (mode_clock == "none")) ? 4'b0000 :
                       (mode_clock == "1") ? 4'b0001 :
                       (mode_clock == "2") ? 4'b0010 :
                       (mode_clock == "3") ? 4'b0011 : 4'b0000;
assign   mode_aclr_value = ((mode_clear == "0") ||(mode_clear == "none")) ? 4'b0000 :
                           (mode_clear == "1") ? 4'b0001 :
                           (mode_clear == "2") ? 4'b0010 :
                           (mode_clear == "3") ? 4'b0011 : 4'b0000;
//assign the corresponding clk,aclr,enable and bypass register values.
assign mode_clk = clk[mode_clk_value] ? 'b1 : 'b0;
assign mode_aclr = aclr[mode_aclr_value] || ~devclrn || ~devpor   ? 'b1 : 'b0;
assign mode_ena = ena[mode_clk_value] ? 'b1 : 'b0;
assign mode_bypass_register = (mode_clock == "none") ? 'b1 : 'b0;
//Instantiate the zeroacc input Register
stratixii_mac_register zeroacc_input_register (
                                             .datain(zeroacc),
                                             .clk(zeroacc_clk),
                                             .aclr(zeroacc_aclr),
                                             .ena(zeroacc_ena),
                                             .bypass_register(zeroacc_bypass_register),
                                             .dataout(zeroacc_in_reg)
                                             );
defparam zeroacc_input_register.data_width = 1;
//decode the clk and aclr values
assign zeroacc_clk_value =((zeroacc_clock == "0") || (zeroacc_clock == "none")) ? 4'b0000 :
                          (zeroacc_clock == "1") ? 4'b0001 :
                          (zeroacc_clock == "2") ? 4'b0010 :
                          (zeroacc_clock == "3") ? 4'b0011 : 4'b0000;
assign   zeroacc_aclr_value = ((zeroacc_clear == "0") ||(zeroacc_clear == "none")) ? 4'b0000 :
                              (zeroacc_clear == "1") ? 4'b0001 :
                              (zeroacc_clear == "2") ? 4'b0010 :
                              (zeroacc_clear == "3") ? 4'b0011 : 4'b0000;
//assign the corresponding clk,aclr,enable and bypass register values.
assign zeroacc_clk = clk[zeroacc_clk_value] ? 'b1 : 'b0;
assign zeroacc_aclr = aclr[zeroacc_aclr_value] || ~devclrn || ~devpor   ? 'b1 : 'b0;
assign zeroacc_ena = ena[zeroacc_clk_value] ? 'b1 : 'b0;
assign zeroacc_bypass_register = (zeroacc_clock == "none") ? 'b1 : 'b0;
//Instantiate mac_multiplier block
stratixii_mac_mult_block mac_multiplier (
                                         .dataa(dataa_in_reg),
                                         .datab(datab_in_reg),
                                         .signa(signa_mult),
                                         .signb(signb_mult),
                                         .bypass_multiplier(bypass_mult),
                                         .scanouta(scanouta_mult),
                                         .scanoutb(scanoutb_mult),
                                         .dataout(dataout_mult)
                                          );
defparam mac_multiplier.dataa_width = dataa_width;
defparam mac_multiplier.datab_width = datab_width;
defparam mac_multiplier.dynamic_mode = dynamic_mode;
assign    signa_mult = ((signa_internally_grounded == "true")
                        &&(dynamic_mode == "no")) ||
                         ((signa_internally_grounded == "true") &&
                         (dynamic_mode == "yes")
                         &&(zeroacc_in_reg == 1'b1)
                         &&(mode_in_reg == 1'b0)
                         ) ? 1'b0 : signa_in_reg;
assign    signb_mult = ((signb_internally_grounded == "true")
                        &&(dynamic_mode == "no")) ||
                         ((signb_internally_grounded == "true") &&
                         (dynamic_mode == "yes")
                         &&(zeroacc_in_reg == 1'b1)
                         &&(mode_in_reg == 1'b0)
                          ) ? 1'b0 : signb_in_reg;
assign    bypass_mult = ((bypass_multiplier == "yes")
                        &&(dynamic_mode == "no")) ||
                        ((bypass_multiplier == "yes")&&
                        (dynamic_mode == "yes")
                        &&(mode_in_reg == 'b1)
                        ) ? 1'b1 : 1'b0;
//Instantiate round and saturate block
stratixii_mac_rs_block mac_rs_block(
                                    .operation(4'b1111),
                                    .round(round_in_reg),
                                    .saturate(saturate_in_reg),
                                    .addnsub(1'b0),
                                    .signa(signa_in_reg),
                                    .signb(signb_in_reg),
                                    .signsize(6'd2),
                                    .roundsize(8'd15),
                                    .dataoutsize(mac_rs_dataout_size),
                                    .dataa(mac_rs_dataa),
                                    .datab(mac_rs_datab),
                                    .datain(mac_rs_datain),
                                    .dataout(mac_rs_dataout)
                                    );
defparam mac_rs_block.block_type = "mac_mult";
defparam mac_rs_block.dataa_width = dataa_width;
defparam mac_rs_block.datab_width = datab_width;
assign   mac_rs_dataout_size = dataa_width + datab_width;
assign mac_rs_dataa = scanouta_mult;
assign mac_rs_datab = scanoutb_mult;
assign mac_rs_datain = dataout_mult;
assign   dataout_reg = (bypass_mult == 1'b1) ? mac_rs_datain : mac_rs_dataout;
stratixii_mac_register mult_output_register(
                                             .datain(dataout_reg[dataout_width -1:0]),
                                             .clk(output_clk),
                                             .aclr(output_aclr),
                                             .ena(output_ena),
                                             .bypass_register(output_bypass_register),
                                             .dataout(dataout)
                                             );
defparam mult_output_register.data_width = dataout_width;
   //decode the clk and aclr values
assign output_clk_value =((output_clock == "0") || (output_clock == "none")) ? 4'b0000 :
                          (output_clock == "1") ? 4'b0001 :
                          (output_clock == "2") ? 4'b0010 :
                          (output_clock == "3") ? 4'b0011 : 4'b0000;
assign   output_aclr_value = ((output_clear == "0") ||(output_clear == "none")) ? 4'b0000 :
                              (output_clear == "1") ? 4'b0001 :
                              (output_clear == "2") ? 4'b0010 :
                              (output_clear == "3") ? 4'b0011 : 4'b0000;
//assign the corresponding clk,aclr,enable and bypass register values.
assign output_clk = clk[output_clk_value] ? 'b1 : 'b0;
assign output_aclr = aclr[output_aclr_value] || ~devclrn || ~devpor   ? 'b1 : 'b0;
assign output_ena = ena[output_clk_value] ? 'b1 : 'b0;
assign output_bypass_register = (output_clock == "none") ? 'b1 : 'b0;
//assign the scanout values
assign scanouta = dataa_in_reg;
assign scanoutb = datab_in_reg;
endmodule