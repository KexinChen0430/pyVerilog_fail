module hardcopyiii_mac_mult(
                      dataa,
                      datab,
                      signa,
                      signb,
                      clk,
                      aclr,
                      ena,
                      dataout,
                      scanouta,
                      devclrn,
                      devpor
                     );
//PARAMETERS
parameter dataa_width       = 18;
parameter datab_width       = 18;
parameter dataa_clock       = "none";
parameter datab_clock       = "none";
parameter signa_clock       = "none";
parameter signb_clock       = "none";
parameter scanouta_clock    = "none";
parameter dataa_clear       = "none";
parameter datab_clear       = "none";
parameter signa_clear       = "none";
parameter signb_clear       = "none";
parameter scanouta_clear    = "none";
parameter signa_internally_grounded   = "false";
parameter signb_internally_grounded   = "false";
// SIMULATION_ONLY_PARAMETERS_BEGIN
parameter dataout_width = dataa_width + datab_width;
// SIMULATION_ONLY_PARAMETERS_END
parameter lpm_type = "hardcopyiii_mac_mult";
//INPUT PORTS
input [dataa_width-1:0]  dataa;
input [datab_width-1:0]  datab;
input                     signa;
input                     signb;
input [3:0]               clk;
input [3:0]               aclr;
input [3:0]               ena;
input                     devclrn;
input                     devpor;
//OUTPUT PORTS
output [dataout_width-1:0] dataout;
output [dataa_width-1:0] scanouta;
tri1 devclrn;
tri1 devpor;
//Internal signals to instantiate the dataa input register unit
wire [3:0] dataa_clk_value;
wire [3:0] dataa_aclr_value;
wire dataa_clk;
wire dataa_aclr;
wire dataa_sload;
wire dataa_bypass_register;
wire [dataa_width-1:0] dataa_in_reg;
//Internal signals to instantiate the datab input register unit
wire [3:0] datab_clk_value;
wire [3:0] datab_aclr_value;
wire datab_clk;
wire datab_aclr;
wire datab_sload;
wire datab_bypass_register;
wire [datab_width-1:0] datab_in_reg;
//Internal signals to instantiate the signa input register unit
wire [3:0] signa_clk_value;
wire [3:0] signa_aclr_value;
wire signa_clk;
wire signa_aclr;
wire signa_sload;
wire signa_bypass_register;
wire signa_in_reg;
//Internal signbls to instantiate the signb input register unit
wire [3:0] signb_clk_value;
wire [3:0] signb_aclr_value;
wire signb_clk;
wire signb_aclr;
wire signb_sload;
wire signb_bypass_register;
wire signb_in_reg;
//Internal scanoutals to instantiate the scanouta input register unit
wire [3:0] scanouta_clk_value;
wire [3:0] scanouta_aclr_value;
wire scanouta_clk;
wire scanouta_aclr;
wire scanouta_sload;
wire scanouta_bypass_register;
wire [dataa_width -1 :0] scanouta_in_reg;
//Internal Signals to instantiate the mac multiplier
wire signa_mult;
wire signb_mult;
//Instantiate the dataa input Register
hardcopyiii_mac_register dataa_input_register (
                                         .datain(dataa),
                                         .clk(dataa_clk),
                                         .aclr(dataa_aclr),
                                         .sload(dataa_sload),
                                         .bypass_register(dataa_bypass_register),
                                         .dataout(dataa_in_reg)
                                        );
defparam dataa_input_register.data_width = dataa_width;
//decode the clk and aclr values
assign dataa_clk_value = (dataa_clock == "0") ? 4'b0000 :
                         (dataa_clock == "1") ? 4'b0001 :
                         (dataa_clock == "2") ? 4'b0010 :
                         (dataa_clock == "3") ? 4'b0011 : 4'b0000;
assign dataa_aclr_value =(dataa_clear == "0")  ? 4'b0000 :
                         (dataa_clear == "1") ? 4'b0001 :
                         (dataa_clear == "2") ? 4'b0010 :
                         (dataa_clear == "3") ? 4'b0011 : 4'b0000;
//assign the corresponding clk,aclr,enable and bypass register values.
assign dataa_clk = clk[dataa_clk_value] ? 1'b1 : 1'b0;
assign dataa_aclr = aclr[dataa_aclr_value] || ~devclrn || ~devpor   ? 1'b1 : 1'b0;
assign dataa_sload = ena[dataa_clk_value] ? 1'b1 : 1'b0;
assign dataa_bypass_register = (dataa_clock == "none") ? 1'b1 : 1'b0;
//Instantiate the datab input Register
hardcopyiii_mac_register datab_input_register (
                                         .datain(datab),
                                         .clk(datab_clk),
                                         .aclr(datab_aclr),
                                         .sload(datab_sload),
                                         .bypass_register(datab_bypass_register),
                                         .dataout(datab_in_reg)
                                        );
defparam datab_input_register.data_width = datab_width;
//decode the clk and aclr values
assign datab_clk_value = (datab_clock == "0") ? 4'b0000 :
                           (datab_clock == "1") ? 4'b0001 :
                           (datab_clock == "2") ? 4'b0010 :
                           (datab_clock == "3") ? 4'b0011 : 4'b0000;
assign datab_aclr_value = (datab_clear == "0")  ? 4'b0000 :
                           (datab_clear == "1") ? 4'b0001 :
                           (datab_clear == "2") ? 4'b0010 :
                           (datab_clear == "3") ? 4'b0011 : 4'b0000;
//assign the corresponding clk,aclr,enable and bypass register values.
assign datab_clk = clk[datab_clk_value] ? 1'b1 : 1'b0;
assign datab_aclr = aclr[datab_aclr_value] || ~devclrn || ~devpor   ? 1'b1 : 1'b0;
assign datab_sload = ena[datab_clk_value] ? 1'b1 : 1'b0;
assign datab_bypass_register = (datab_clock == "none") ? 1'b1 : 1'b0;
//Instantiate the signa input Register
hardcopyiii_mac_register signa_input_register (
                                         .datain(signa),
                                         .clk(signa_clk),
                                         .aclr(signa_aclr),
                                         .sload(signa_sload),
                                         .bypass_register(signa_bypass_register),
                                         .dataout(signa_in_reg)
                                         );
defparam signa_input_register.data_width = 1;
//decode the clk and aclr values
assign signa_clk_value =(signa_clock == "0") ? 4'b0000 :
                          (signa_clock == "1") ? 4'b0001 :
                          (signa_clock == "2") ? 4'b0010 :
                          (signa_clock == "3") ? 4'b0011 : 4'b0000;
assign signa_aclr_value = (signa_clear == "0")  ? 4'b0000 :
                           (signa_clear == "1") ? 4'b0001 :
                           (signa_clear == "2") ? 4'b0010 :
                           (signa_clear == "3") ? 4'b0011 : 4'b0000;
//assign the corresponding clk,aclr,enable and bypass register values.
assign signa_clk = clk[signa_clk_value] ? 1'b1 : 1'b0;
assign signa_aclr = aclr[signa_aclr_value] || ~devclrn || ~devpor   ? 1'b1 : 1'b0;
assign signa_sload = ena[signa_clk_value] ? 1'b1 : 1'b0;
assign signa_bypass_register = (signa_clock == "none") ? 1'b1 : 1'b0;
//Instantiate the signb input Register
hardcopyiii_mac_register signb_input_register (
                                         .datain(signb),
                                         .clk(signb_clk),
                                         .aclr(signb_aclr),
                                         .sload(signb_sload),
                                         .bypass_register(signb_bypass_register),
                                         .dataout(signb_in_reg)
                                        );
defparam signb_input_register.data_width = 1;
//decode the clk and aclr values
assign signb_clk_value =(signb_clock == "0") ? 4'b0000 :
                        (signb_clock == "1") ? 4'b0001 :
                        (signb_clock == "2") ? 4'b0010 :
                        (signb_clock == "3") ? 4'b0011 : 4'b0000;
assign signb_aclr_value =  (signb_clear == "0")  ? 4'b0000 :
                           (signb_clear == "1") ? 4'b0001 :
                           (signb_clear == "2") ? 4'b0010 :
                           (signb_clear == "3") ? 4'b0011 : 4'b0000;
//assign the corresponding clk,aclr,enable and bypass register values.
assign signb_clk = clk[signb_clk_value] ? 1'b1 : 1'b0;
assign signb_aclr = aclr[signb_aclr_value] || ~devclrn || ~devpor   ? 1'b1 : 1'b0;
assign signb_sload = ena[signb_clk_value] ? 1'b1 : 1'b0;
assign signb_bypass_register = (signb_clock == "none") ? 1'b1 : 1'b0;
//Instantiate the scanouta input Register
hardcopyiii_mac_register scanouta_input_register (
                                             .datain(dataa_in_reg),
                                             .clk(scanouta_clk),
                                             .aclr(scanouta_aclr),
                                             .sload(scanouta_sload),
                                             .bypass_register(scanouta_bypass_register),
                                             .dataout(scanouta)
                                             );
defparam scanouta_input_register.data_width = dataa_width;
//decode the clk and aclr values
assign scanouta_clk_value =(scanouta_clock == "0") ? 4'b0000 :
                           (scanouta_clock == "1") ? 4'b0001 :
                           (scanouta_clock == "2") ? 4'b0010 :
                           (scanouta_clock == "3") ? 4'b0011 : 4'b0000;
assign scanouta_aclr_value = (scanouta_clear == "0")  ? 4'b0000 :
                             (scanouta_clear == "1") ? 4'b0001 :
                             (scanouta_clear == "2") ? 4'b0010 :
                             (scanouta_clear == "3") ? 4'b0011 : 4'b0000;
//assign the corresponding clk,aclr,enable and bypass register values.
assign scanouta_clk = clk[scanouta_clk_value] ? 1'b1 : 1'b0;
assign scanouta_aclr = aclr[scanouta_aclr_value] || ~devclrn || ~devpor   ? 1'b1 : 1'b0;
assign scanouta_sload = ena[scanouta_clk_value] ? 1'b1 : 1'b0;
assign scanouta_bypass_register = (scanouta_clock == "none") ? 1'b1 : 1'b0;
//Instantiate mac_multiplier block
hardcopyiii_mac_multiplier mac_multiplier (
                                     .dataa(dataa_in_reg),
                                     .datab(datab_in_reg),
                                     .signa(signa_mult),
                                     .signb(signb_mult),
                                     .dataout(dataout)
                                    );
defparam mac_multiplier.dataa_width = dataa_width;
defparam mac_multiplier.datab_width = datab_width;
assign    signa_mult = (signa_internally_grounded == "true")? 1'b0 : signa_in_reg;
assign    signb_mult = (signb_internally_grounded == "true")? 1'b0 : signb_in_reg;
endmodule