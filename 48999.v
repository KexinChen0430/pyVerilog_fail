module hardcopyii_mac_out(
                          dataa,
                          datab,
                          datac,
                          datad,
                          zeroacc,
                          addnsub0,
                          addnsub1,
                          round0,
                          round1,
                          saturate,
                          multabsaturate,
                          multcdsaturate,
                          signa,
                          signb,
                          clk,
                          aclr,
                          ena,
                          dataout,
                          accoverflow,
                          devclrn,
                          devpor
                        );
parameter operation_mode = "output_only";
parameter dataa_width = 1;
parameter datab_width = 1;
parameter datac_width = 1;
parameter datad_width = 1;
parameter dataout_width = 144;
parameter addnsub0_clock = "none";
parameter addnsub1_clock = "none";
parameter zeroacc_clock = "none";
parameter round0_clock= "none";
parameter round1_clock= "none";
parameter saturate_clock = "none";
parameter multabsaturate_clock = "none";
parameter multcdsaturate_clock = "none";
parameter signa_clock = "none";
parameter signb_clock = "none";
parameter output_clock = "none";
parameter addnsub0_clear = "none";
parameter addnsub1_clear = "none";
parameter zeroacc_clear = "none";
parameter round0_clear = "none";
parameter round1_clear = "none";
parameter saturate_clear = "none";
parameter multabsaturate_clear = "none";
parameter multcdsaturate_clear = "none";
parameter signa_clear = "none";
parameter signb_clear = "none";
parameter output_clear = "none";
parameter addnsub0_pipeline_clock = "none";
parameter addnsub1_pipeline_clock = "none";
parameter round0_pipeline_clock  = "none";
parameter round1_pipeline_clock  = "none";
parameter saturate_pipeline_clock= "none";
parameter multabsaturate_pipeline_clock = "none";
parameter multcdsaturate_pipeline_clock = "none";
parameter zeroacc_pipeline_clock = "none";
parameter signa_pipeline_clock = "none";
parameter signb_pipeline_clock = "none";
parameter addnsub0_pipeline_clear = "none";
parameter addnsub1_pipeline_clear = "none";
parameter round0_pipeline_clear  = "none";
parameter round1_pipeline_clear  = "none";
parameter saturate_pipeline_clear= "none";
parameter multabsaturate_pipeline_clear = "none";
parameter multcdsaturate_pipeline_clear = "none";
parameter zeroacc_pipeline_clear = "none";
parameter signa_pipeline_clear = "none";
parameter signb_pipeline_clear = "none";
parameter lpm_hint  = "true";
parameter lpm_type  = "hardcopyii_mac_out";
input [dataa_width-1:0] dataa;
input [datab_width-1:0] datab;
input [datac_width-1:0] datac;
input [datad_width-1:0] datad;
input   zeroacc;
input   addnsub0;
input   addnsub1;
input   round0;
input   round1;
input   saturate;
input   multabsaturate;
input   multcdsaturate;
input   signa;
input   signb;
input [3:0]     clk;
input [3:0]     aclr;
input [3:0]     ena;
input   devclrn;
input   devpor;
output [dataout_width-1:0] dataout;
output   accoverflow;
tri1 devclrn;
tri1 devpor;
    //Internal signals to instantiate the signa input register unit
wire [3:0] signa_inreg_clk_value;
wire [3:0] signa_inreg_aclr_value;
wire signa_inreg_clk;
wire signa_inreg_aclr;
wire signa_inreg_ena;
wire signa_inreg_bypass_register;
wire  signa_inreg_pipreg;
    //Internal signals to instantiate the signa pipeline register unit
wire [3:0] signa_pipreg_clk_value;
wire [3:0] signa_pipreg_aclr_value;
wire signa_pipreg_clk;
wire signa_pipreg_aclr;
wire signa_pipreg_ena;
wire signa_pipreg_bypass_register;
wire  signa_pipreg_out;
    //Internal signals to instantiate the signb input register unit
wire [3:0] signb_inreg_clk_value;
wire [3:0] signb_inreg_aclr_value;
wire signb_inreg_clk;
wire signb_inreg_aclr;
wire signb_inreg_ena;
wire signb_inreg_bypass_register;
wire  signb_inreg_pipreg;
    //Internal signals to instantiate the signb pipeline register unit
wire [3:0] signb_pipreg_clk_value;
wire [3:0] signb_pipreg_aclr_value;
wire signb_pipreg_clk;
wire signb_pipreg_aclr;
wire signb_pipreg_ena;
wire signb_pipreg_bypass_register;
wire  signb_pipreg_out;
    //Internal signals to instantiate the zeroacc input register unit
wire [3:0] zeroacc_inreg_clk_value;
wire [3:0] zeroacc_inreg_aclr_value;
wire zeroacc_inreg_clk;
wire zeroacc_inreg_aclr;
wire zeroacc_inreg_ena;
wire zeroacc_inreg_bypass_register;
wire  zeroacc_inreg_pipreg;
    //Internal signals to instantiate the zeroacc pipeline register unit
wire [3:0] zeroacc_pipreg_clk_value;
wire [3:0] zeroacc_pipreg_aclr_value;
wire zeroacc_pipreg_clk;
wire zeroacc_pipreg_aclr;
wire zeroacc_pipreg_ena;
wire zeroacc_pipreg_bypass_register;
wire  zeroacc_pipreg_out;
    //Internal signals to instantiate the addnsub0 input register unit
wire [3:0] addnsub0_inreg_clk_value;
wire [3:0] addnsub0_inreg_aclr_value;
wire addnsub0_inreg_clk;
wire addnsub0_inreg_aclr;
wire addnsub0_inreg_ena;
wire addnsub0_inreg_bypass_register;
wire  addnsub0_inreg_pipreg;
    //Internal signals to instantiate the addnsub0 pipeline register unit
wire [3:0] addnsub0_pipreg_clk_value;
wire [3:0] addnsub0_pipreg_aclr_value;
wire addnsub0_pipreg_clk;
wire addnsub0_pipreg_aclr;
wire addnsub0_pipreg_ena;
wire addnsub0_pipreg_bypass_register;
wire  addnsub0_pipreg_out;
    //Internal signals to instantiate the addnsub1 input register unit
wire [3:1] addnsub1_inreg_clk_value;
wire [3:1] addnsub1_inreg_aclr_value;
wire addnsub1_inreg_clk;
wire addnsub1_inreg_aclr;
wire addnsub1_inreg_ena;
wire addnsub1_inreg_bypass_register;
wire  addnsub1_inreg_pipreg;
    //Internal signals to instantiate the addnsub1 pipeline register unit
wire [3:1] addnsub1_pipreg_clk_value;
wire [3:1] addnsub1_pipreg_aclr_value;
wire addnsub1_pipreg_clk;
wire addnsub1_pipreg_aclr;
wire addnsub1_pipreg_ena;
wire addnsub1_pipreg_bypass_register;
wire  addnsub1_pipreg_out;
 //Internal signals to instantiate the round0 input register unit
wire [3:0] round0_inreg_clk_value;
wire [3:0] round0_inreg_aclr_value;
wire round0_inreg_clk;
wire round0_inreg_aclr;
wire round0_inreg_ena;
wire round0_inreg_bypass_register;
wire  round0_inreg_pipreg;
    //Internal signals to instantiate the round0 pipeline register unit
wire [3:0] round0_pipreg_clk_value;
wire [3:0] round0_pipreg_aclr_value;
wire round0_pipreg_clk;
wire round0_pipreg_aclr;
wire round0_pipreg_ena;
wire round0_pipreg_bypass_register;
wire  round0_pipreg_out;
    //Internal signals to instantiate the round1 input register unit
wire [3:1] round1_inreg_clk_value;
wire [3:1] round1_inreg_aclr_value;
wire round1_inreg_clk;
wire round1_inreg_aclr;
wire round1_inreg_ena;
wire round1_inreg_bypass_register;
wire  round1_inreg_pipreg;
    //Internal signals to instantiate the round1 pipeline register unit
wire [3:1] round1_pipreg_clk_value;
wire [3:1] round1_pipreg_aclr_value;
wire round1_pipreg_clk;
wire round1_pipreg_aclr;
wire round1_pipreg_ena;
wire round1_pipreg_bypass_register;
wire  round1_pipreg_out;
  // Internal signals to instantiate the saturate input register unit
wire [3:0] saturate_inreg_clk_value;
wire [3:0] saturate_inreg_aclr_value;
wire saturate_inreg_clk;
wire saturate_inreg_aclr;
wire saturate_inreg_ena;
wire saturate_inreg_bypass_register;
wire  saturate_inreg_pipreg;
    //Internal signals to instantiate the saturate pipeline register unit
wire [3:0] saturate_pipreg_clk_value;
wire [3:0] saturate_pipreg_aclr_value;
wire saturate_pipreg_clk;
wire saturate_pipreg_aclr;
wire saturate_pipreg_ena;
wire saturate_pipreg_bypass_register;
wire  saturate_pipreg_out;
//Internal signals to instantiate the multabsaturate input register unit
wire [3:0] multabsaturate_inreg_clk_value;
wire [3:0] multabsaturate_inreg_aclr_value;
wire multabsaturate_inreg_clk;
wire multabsaturate_inreg_aclr;
wire multabsaturate_inreg_ena;
wire multabsaturate_inreg_bypass_register;
wire  multabsaturate_inreg_pipreg;
    //Internal signals to instantiate the multabsaturate pipeline register unit
wire [3:0] multabsaturate_pipreg_clk_value;
wire [3:0] multabsaturate_pipreg_aclr_value;
wire multabsaturate_pipreg_clk;
wire multabsaturate_pipreg_aclr;
wire multabsaturate_pipreg_ena;
wire multabsaturate_pipreg_bypass_register;
wire  multabsaturate_pipreg_out;
    //Internal signals to instantiate the multcdsaturate input register unit
wire [3:1] multcdsaturate_inreg_clk_value;
wire [3:1] multcdsaturate_inreg_aclr_value;
wire multcdsaturate_inreg_clk;
wire multcdsaturate_inreg_aclr;
wire multcdsaturate_inreg_ena;
wire multcdsaturate_inreg_bypass_register;
wire  multcdsaturate_inreg_pipreg;
    //Internal signals to instantiate the multcdsaturate pipeline register unit
wire [3:1] multcdsaturate_pipreg_clk_value;
wire [3:1] multcdsaturate_pipreg_aclr_value;
wire multcdsaturate_pipreg_clk;
wire multcdsaturate_pipreg_aclr;
wire multcdsaturate_pipreg_ena;
wire multcdsaturate_pipreg_bypass_register;
wire  multcdsaturate_pipreg_out;
//Declare the signals for instantiating the mac_out internal logic
wire[35:0] mac_out_dataa;
wire[35:0] mac_out_datab;
wire[35:0] mac_out_datac;
wire[35:0] mac_out_datad;
wire [143:0] mac_out_feedback;
wire[143:0] mac_out_dataout;
wire mac_out_accoverflow;
    //Internal signals to instantiate the output register unit
wire [3:1] outreg_clk_value;
wire [3:1] outreg_aclr_value;
wire outreg_clk;
wire outreg_aclr;
wire outreg_ena;
wire outreg_bypass_register;
wire [71:0] outreg_dataout;
wire outreg_accoverflow;
    //Internal signals to instantiate the output register1 unit
wire [3:1] outreg1_clk_value;
wire [3:1] outreg1_aclr_value;
wire outreg1_clk;
wire outreg1_aclr;
wire outreg1_ena;
wire outreg1_bypass_register;
wire [17:0] outreg1_dataout;
//Internal signals to instantiate the output register2 unit
wire [3:1] outreg2_clk_value;
wire [3:1] outreg2_aclr_value;
wire outreg2_clk;
wire outreg2_aclr;
wire outreg2_ena;
wire outreg2_bypass_register;
wire [17:0] outreg2_dataout;
  //Internal signals to instantiate the output register3 unit
wire [3:1] outreg3_clk_value;
wire [3:1] outreg3_aclr_value;
wire outreg3_clk;
wire outreg3_aclr;
wire outreg3_ena;
wire outreg3_bypass_register;
wire [17:0] outreg3_dataout;
//Internal signals to instantiate the output register4 unit
wire [3:1] outreg4_clk_value;
wire [3:1] outreg4_aclr_value;
wire outreg4_clk;
wire outreg4_aclr;
wire outreg4_ena;
wire outreg4_bypass_register;
wire [17:0] outreg4_dataout;
//Internal signals to instantiate the output register5 unit
wire [3:1] outreg5_clk_value;
wire [3:1] outreg5_aclr_value;
wire outreg5_clk;
wire outreg5_aclr;
wire outreg5_ena;
wire outreg5_bypass_register;
wire [17:0] outreg5_dataout;
//Internal signals to instantiate the output register6 unit
wire [3:1] outreg6_clk_value;
wire [3:1] outreg6_aclr_value;
wire outreg6_clk;
wire outreg6_aclr;
wire outreg6_ena;
wire outreg6_bypass_register;
wire [17:0] outreg6_dataout;
 //Internal signals to instantiate the output register7 unit
wire [3:1] outreg7_clk_value;
wire [3:1] outreg7_aclr_value;
wire outreg7_clk;
wire outreg7_aclr;
wire outreg7_ena;
wire outreg7_bypass_register;
wire [17:0] outreg7_dataout;
//Define the internal signals
wire [143:0] dataout_dynamic;
wire [143:0] dataout_tmp;
   //Instantiate signa input register
hardcopyii_mac_register  signa_inreg(
                                    .datain(signa),
                                    .clk(signa_inreg_clk),
                                    .aclr(signa_inreg_aclr),
                                    .ena(signa_inreg_ena),
                                    .bypass_register(signa_inreg_bypass_register),
                                    .dataout(signa_inreg_pipreg)
                                   );
defparam signa_inreg.data_width = 1;
      //decode the clk and aclr values
assign signa_inreg_clk_value =((signa_clock == "0") || (signa_clock == "none")) ? 4'b0000 :
                              (signa_clock == "1") ? 4'b0001 :
                              (signa_clock == "2") ? 4'b0010 :
                              (signa_clock == "3") ? 4'b0011 : 4'b0000;
assign   signa_inreg_aclr_value = ((signa_clear == "0") ||(signa_clear == "none")) ? 4'b0000 :
                                 (signa_clear == "1") ? 4'b0001 :
                                 (signa_clear == "2") ? 4'b0010 :
                                 (signa_clear == "3") ? 4'b0011 : 4'b0000;
        //assign the corresponding clk,aclr,enable and bypass register values.
assign signa_inreg_clk = clk[signa_inreg_clk_value] ? 'b1 : 'b0;
assign signa_inreg_aclr = aclr[signa_inreg_aclr_value] || ~devclrn || ~devpor   ? 'b1 : 'b0;
assign signa_inreg_ena = ena[signa_inreg_clk_value] ? 'b1 : 'b0;
assign signa_inreg_bypass_register = (signa_clock == "none") ? 'b1 : 'b0;
         //Instantiate signa pipeline register
hardcopyii_mac_register  signa_pipreg(
                                     .datain(signa_inreg_pipreg),
                                     .clk(signa_pipreg_clk),
                                     .aclr(signa_pipreg_aclr),
                                     .ena(signa_pipreg_ena),
                                     .bypass_register(signa_pipreg_bypass_register),
                                     .dataout(signa_pipreg_out)
                                    );
defparam signa_pipreg.data_width = 1;
      //decode the clk and aclr values
assign signa_pipreg_clk_value =((signa_pipeline_clock == "0") || (signa_pipeline_clock == "none")) ? 4'b0000 :
                               (signa_pipeline_clock == "1") ? 4'b0001 :
                               (signa_pipeline_clock == "2") ? 4'b0010 :
                               (signa_pipeline_clock == "3") ? 4'b0011 : 4'b0000;
assign   signa_pipreg_aclr_value = ((signa_pipeline_clear == "0") ||(signa_pipeline_clear == "none")) ? 4'b0000 :
                                   (signa_pipeline_clear == "1") ? 4'b0001 :
                                   (signa_pipeline_clear == "2") ? 4'b0010 :
                                    (signa_pipeline_clear == "3") ? 4'b0011 : 4'b0000;
        //assign the corresponding clk,aclr,enable and bypass register values.
assign signa_pipreg_clk = clk[signa_pipreg_clk_value] ? 'b1 : 'b0;
assign signa_pipreg_aclr = aclr[signa_pipreg_aclr_value] || ~devclrn || ~devpor   ? 'b1 : 'b0;
assign signa_pipreg_ena = ena[signa_pipreg_clk_value] ? 'b1 : 'b0;
assign signa_pipreg_bypass_register = (signa_pipeline_clock == "none") ? 'b1 : 'b0;
         //Instantiate signb input register
hardcopyii_mac_register  signb_inreg(
                                    .datain(signb),
                                    .clk(signb_inreg_clk),
                                    .aclr(signb_inreg_aclr),
                                    .ena(signb_inreg_ena),
                                    .bypass_register(signb_inreg_bypass_register),
                                    .dataout(signb_inreg_pipreg)
                                   );
defparam signb_inreg.data_width = 1;
      //decode the clk and aclr values
assign signb_inreg_clk_value =((signb_clock == "0") || (signb_clock == "none")) ? 4'b0000 :
                               (signb_clock == "1") ? 4'b0001 :
                               (signb_clock == "2") ? 4'b0010 :
                               (signb_clock == "3") ? 4'b0011 : 4'b0000;
assign   signb_inreg_aclr_value = ((signb_clear == "0") ||(signb_clear == "none")) ? 4'b0000 :
                                   (signb_clear == "1") ? 4'b0001 :
                                   (signb_clear == "2") ? 4'b0010 :
                                   (signb_clear == "3") ? 4'b0011 : 4'b0000;
        //assign the corresponding clk,aclr,enable and bypass register values.
assign signb_inreg_clk = clk[signb_inreg_clk_value] ? 'b1 : 'b0;
assign signb_inreg_aclr = aclr[signb_inreg_aclr_value] || ~devclrn || ~devpor   ? 'b1 : 'b0;
assign signb_inreg_ena = ena[signb_inreg_clk_value] ? 'b1 : 'b0;
assign signb_inreg_bypass_register = (signb_clock == "none") ? 'b1 : 'b0;
         //Instantiate signb pipeline register
hardcopyii_mac_register  signb_pipreg(
                                     .datain(signb_inreg_pipreg),
                                     .clk(signb_pipreg_clk),
                                     .aclr(signb_pipreg_aclr),
                                     .ena(signb_pipreg_ena),
                                     .bypass_register(signb_pipreg_bypass_register),
                                     .dataout(signb_pipreg_out)
                                    );
defparam signb_pipreg.data_width = 1;
      //decode the clk and aclr values
assign signb_pipreg_clk_value =((signb_pipeline_clock == "0") || (signb_pipeline_clock == "none")) ? 4'b0000 :
                               (signb_pipeline_clock == "1") ? 4'b0001 :
                               (signb_pipeline_clock == "2") ? 4'b0010 :
                               (signb_pipeline_clock == "3") ? 4'b0011 : 4'b0000;
assign   signb_pipreg_aclr_value = ((signb_pipeline_clear == "0") ||(signb_pipeline_clear == "none")) ? 4'b0000 :
                                    (signb_pipeline_clear == "1") ? 4'b0001 :
                                    (signb_pipeline_clear == "2") ? 4'b0010 :
                                    (signb_pipeline_clear == "3") ? 4'b0011 : 4'b0000;
        //assign the corresponding clk,aclr,enable and bypass register values.
assign signb_pipreg_clk = clk[signb_pipreg_clk_value] ? 'b1 : 'b0;
assign signb_pipreg_aclr = aclr[signb_pipreg_aclr_value] || ~devclrn || ~devpor   ? 'b1 : 'b0;
assign signb_pipreg_ena = ena[signb_pipreg_clk_value] ? 'b1 : 'b0;
assign signb_pipreg_bypass_register = (signb_pipeline_clock == "none") ? 'b1 : 'b0;
  //Instantiate zeroacc input register
hardcopyii_mac_register  zeroacc_inreg(
                                      .datain(zeroacc),
                                      .clk(zeroacc_inreg_clk),
                                      .aclr(zeroacc_inreg_aclr),
                                      .ena(zeroacc_inreg_ena),
                                      .bypass_register(zeroacc_inreg_bypass_register),
                                      .dataout(zeroacc_inreg_pipreg)
                                     );
defparam zeroacc_inreg.data_width = 1;
      //decode the clk and aclr values
assign zeroacc_inreg_clk_value =((zeroacc_clock == "0") || (zeroacc_clock == "none")) ? 4'b0000 :
                                (zeroacc_clock == "1") ? 4'b0001 :
                                (zeroacc_clock == "2") ? 4'b0010 :
                                (zeroacc_clock == "3") ? 4'b0011 : 4'b0000;
assign   zeroacc_inreg_aclr_value = ((zeroacc_clear == "0") ||(zeroacc_clear == "none")) ? 4'b0000 :
                                    (zeroacc_clear == "1") ? 4'b0001 :
                                    (zeroacc_clear == "2") ? 4'b0010 :
                                    (zeroacc_clear == "3") ? 4'b0011 : 4'b0000;
        //assign the corresponding clk,aclr,enable and bypass register values.
assign zeroacc_inreg_clk = clk[zeroacc_inreg_clk_value] ? 'b1 : 'b0;
assign zeroacc_inreg_aclr = aclr[zeroacc_inreg_aclr_value] || ~devclrn || ~devpor   ? 'b1 : 'b0;
assign zeroacc_inreg_ena = ena[zeroacc_inreg_clk_value] ? 'b1 : 'b0;
assign zeroacc_inreg_bypass_register = (zeroacc_clock == "none") ? 'b1 : 'b0;
         //Instantiate zeroacc pipeline register
hardcopyii_mac_register  zeroacc_pipreg(
                                       .datain(zeroacc_inreg_pipreg),
                                       .clk(zeroacc_pipreg_clk),
                                       .aclr(zeroacc_pipreg_aclr),
                                       .ena(zeroacc_pipreg_ena),
                                       .bypass_register(zeroacc_pipreg_bypass_register),
                                       .dataout(zeroacc_pipreg_out)
                                     );
defparam zeroacc_pipreg.data_width = 1;
      //decode the clk and aclr values
assign zeroacc_pipreg_clk_value =((zeroacc_pipeline_clock == "0") || (zeroacc_pipeline_clock == "none")) ? 4'b0000 :
                                 (zeroacc_pipeline_clock == "1") ? 4'b0001 :
                                 (zeroacc_pipeline_clock == "2") ? 4'b0010 :
                                 (zeroacc_pipeline_clock == "3") ? 4'b0011 : 4'b0000;
assign   zeroacc_pipreg_aclr_value = ((zeroacc_pipeline_clear == "0") ||(zeroacc_pipeline_clear == "none")) ? 4'b0000 :
                                    (zeroacc_pipeline_clear == "1") ? 4'b0001 :
                                    (zeroacc_pipeline_clear == "2") ? 4'b0010 :
                                    (zeroacc_pipeline_clear == "3") ? 4'b0011 : 4'b0000;
        //assign the corresponding clk,aclr,enable and bypass register values.
assign zeroacc_pipreg_clk = clk[zeroacc_pipreg_clk_value] ? 'b1 : 'b0;
assign zeroacc_pipreg_aclr = aclr[zeroacc_pipreg_aclr_value] || ~devclrn || ~devpor   ? 'b1 : 'b0;
assign zeroacc_pipreg_ena = ena[zeroacc_pipreg_clk_value] ? 'b1 : 'b0;
assign zeroacc_pipreg_bypass_register = (zeroacc_pipeline_clock == "none") ? 'b1 : 'b0;
         //Instantiate addnsub0 input register
hardcopyii_mac_register  addnsub0_inreg(
                                       .datain(addnsub0),
                                       .clk(addnsub0_inreg_clk),
                                       .aclr(addnsub0_inreg_aclr),
                                       .ena(addnsub0_inreg_ena),
                                       .bypass_register(addnsub0_inreg_bypass_register),
                                       .dataout(addnsub0_inreg_pipreg)
                                       );
defparam addnsub0_inreg.data_width = 1;
      //decode the clk and aclr values
assign addnsub0_inreg_clk_value =((addnsub0_clock == "0") || (addnsub0_clock == "none")) ? 4'b0000 :
                                 (addnsub0_clock == "1") ? 4'b0001 :
                                 (addnsub0_clock == "2") ? 4'b0010 :
                                 (addnsub0_clock == "3") ? 4'b0011 : 4'b0000;
assign   addnsub0_inreg_aclr_value = ((addnsub0_clear == "0") ||(addnsub0_clear == "none")) ? 4'b0000 :
                                    (addnsub0_clear == "1") ? 4'b0001 :
                                    (addnsub0_clear == "2") ? 4'b0010 :
                                    (addnsub0_clear == "3") ? 4'b0011 : 4'b0000;
        //assign the corresponding clk,aclr,enable and bypass register values.
assign addnsub0_inreg_clk = clk[addnsub0_inreg_clk_value] ? 'b1 : 'b0;
assign addnsub0_inreg_aclr = aclr[addnsub0_inreg_aclr_value] || ~devclrn || ~devpor   ? 'b1 : 'b0;
assign addnsub0_inreg_ena = ena[addnsub0_inreg_clk_value] ? 'b1 : 'b0;
assign addnsub0_inreg_bypass_register = (addnsub0_clock == "none") ? 'b1 : 'b0;
         //Instantiate addnsub0 pipeline register
hardcopyii_mac_register  addnsub0_pipreg(
                                        .datain(addnsub0_inreg_pipreg),
                                        .clk(addnsub0_pipreg_clk),
                                        .aclr(addnsub0_pipreg_aclr),
                                        .ena(addnsub0_pipreg_ena),
                                        .bypass_register(addnsub0_pipreg_bypass_register),
                                        .dataout(addnsub0_pipreg_out)
                                        );
defparam addnsub0_pipreg.data_width = 1;
      //decode the clk and aclr values
assign addnsub0_pipreg_clk_value =((addnsub0_pipeline_clock == "0") || (addnsub0_pipeline_clock == "none")) ? 4'b0000 :
                                  (addnsub0_pipeline_clock == "1") ? 4'b0001 :
                                  (addnsub0_pipeline_clock == "2") ? 4'b0010 :
                                  (addnsub0_pipeline_clock == "3") ? 4'b0011 : 4'b0000;
assign   addnsub0_pipreg_aclr_value = ((addnsub0_pipeline_clear == "0") ||(addnsub0_pipeline_clear == "none")) ? 4'b0000 :
                                     (addnsub0_pipeline_clear == "1") ? 4'b0001 :
                                     (addnsub0_pipeline_clear == "2") ? 4'b0010 :
                                    (addnsub0_pipeline_clear == "3") ? 4'b0011 : 4'b0000;
        //assign the corresponding clk,aclr,enable and bypass register values.
assign addnsub0_pipreg_clk = clk[addnsub0_pipreg_clk_value] ? 'b1 : 'b0;
assign addnsub0_pipreg_aclr = aclr[addnsub0_pipreg_aclr_value] || ~devclrn || ~devpor   ? 'b1 : 'b0;
assign addnsub0_pipreg_ena = ena[addnsub0_pipreg_clk_value] ? 'b1 : 'b0;
assign addnsub0_pipreg_bypass_register = (addnsub0_pipeline_clock == "none") ? 'b1 : 'b0;
  //Instantiate addnsub1 input register
hardcopyii_mac_register  addnsub1_inreg(
                                       .datain(addnsub1),
                                       .clk(addnsub1_inreg_clk),
                                       .aclr(addnsub1_inreg_aclr),
                                       .ena(addnsub1_inreg_ena),
                                       .bypass_register(addnsub1_inreg_bypass_register),
                                       .dataout(addnsub1_inreg_pipreg)
                                       );
defparam addnsub1_inreg.data_width = 1;
      //decode the clk and aclr values
assign addnsub1_inreg_clk_value =((addnsub1_clock == "0") || (addnsub1_clock == "none")) ? 4'b0000 :
                                 (addnsub1_clock == "1") ? 4'b0001 :
                                 (addnsub1_clock == "2") ? 4'b0010 :
                                 (addnsub1_clock == "3") ? 4'b0011 : 4'b0000;
assign   addnsub1_inreg_aclr_value = ((addnsub1_clear == "0") ||(addnsub1_clear == "none")) ? 4'b0000 :
                                     (addnsub1_clear == "1") ? 4'b0001 :
                                     (addnsub1_clear == "2") ? 4'b0010 :
                                    (addnsub1_clear == "3") ? 4'b0011 : 4'b0000;
        //assign the corresponding clk,aclr,enable and bypass register values.
assign addnsub1_inreg_clk = clk[addnsub1_inreg_clk_value] ? 'b1 : 'b0;
assign addnsub1_inreg_aclr = aclr[addnsub1_inreg_aclr_value] || ~devclrn || ~devpor   ? 'b1 : 'b0;
assign addnsub1_inreg_ena = ena[addnsub1_inreg_clk_value] ? 'b1 : 'b0;
assign addnsub1_inreg_bypass_register = (addnsub1_clock == "none") ? 'b1 : 'b0;
         //Instantiate addnsub1 pipeline register
hardcopyii_mac_register  addnsub1_pipreg(
                                        .datain(addnsub1_inreg_pipreg),
                                        .clk(addnsub1_pipreg_clk),
                                        .aclr(addnsub1_pipreg_aclr),
                                        .ena(addnsub1_pipreg_ena),
                                        .bypass_register(addnsub1_pipreg_bypass_register),
                                        .dataout(addnsub1_pipreg_out)
                                       );
defparam addnsub1_pipreg.data_width = 1;
      //decode the clk and aclr values
assign addnsub1_pipreg_clk_value =((addnsub1_pipeline_clock == "0") || (addnsub1_pipeline_clock == "none")) ? 4'b0000 :
                                  (addnsub1_pipeline_clock == "1") ? 4'b0001 :
                                  (addnsub1_pipeline_clock == "2") ? 4'b0010 :
                                  (addnsub1_pipeline_clock == "3") ? 4'b0011 : 4'b0000;
assign   addnsub1_pipreg_aclr_value = ((addnsub1_pipeline_clear == "0") ||(addnsub1_pipeline_clear == "none")) ? 4'b0000 :
                                     (addnsub1_pipeline_clear == "1") ? 4'b0001 :
                                     (addnsub1_pipeline_clear == "2") ? 4'b0010 :
                                    (addnsub1_pipeline_clear == "3") ? 4'b0011 : 4'b0000;
        //assign the corresponding clk,aclr,enable and bypass register values.
assign addnsub1_pipreg_clk = clk[addnsub1_pipreg_clk_value] ? 'b1 : 'b0;
assign addnsub1_pipreg_aclr = aclr[addnsub1_pipreg_aclr_value] || ~devclrn || ~devpor   ? 'b1 : 'b0;
assign addnsub1_pipreg_ena = ena[addnsub1_pipreg_clk_value] ? 'b1 : 'b0;
assign addnsub1_pipreg_bypass_register = (addnsub1_pipeline_clock == "none") ? 'b1 : 'b0;
         //Instantiate round0 input register
hardcopyii_mac_register  round0_inreg(
                                     .datain(round0),
                                     .clk(round0_inreg_clk),
                                     .aclr(round0_inreg_aclr),
                                     .ena(round0_inreg_ena),
                                     .bypass_register(round0_inreg_bypass_register),
                                     .dataout(round0_inreg_pipreg)
                                    );
defparam round0_inreg.data_width = 1;
      //decode the clk and aclr values
assign round0_inreg_clk_value =((round0_clock == "0") || (round0_clock == "none")) ? 4'b0000 :
                                   (round0_clock == "1") ? 4'b0001 :
                                   (round0_clock == "2") ? 4'b0010 :
                                   (round0_clock == "3") ? 4'b0011 : 4'b0000;
assign   round0_inreg_aclr_value = ((round0_clear == "0") ||(round0_clear == "none")) ? 4'b0000 :
                                   (round0_clear == "1") ? 4'b0001 :
                                   (round0_clear == "2") ? 4'b0010 :
                                   (round0_clear == "3") ? 4'b0011 : 4'b0000;
        //assign the corresponding clk,aclr,enable and bypass register values.
assign round0_inreg_clk = clk[round0_inreg_clk_value] ? 'b1 : 'b0;
assign round0_inreg_aclr = aclr[round0_inreg_aclr_value] || ~devclrn || ~devpor   ? 'b1 : 'b0;
assign round0_inreg_ena = ena[round0_inreg_clk_value] ? 'b1 : 'b0;
assign round0_inreg_bypass_register = (round0_clock == "none") ? 'b1 : 'b0;
         //Instantiate round0 pipeline register
hardcopyii_mac_register  round0_pipreg(
                                      .datain(round0_inreg_pipreg),
                                      .clk(round0_pipreg_clk),
                                      .aclr(round0_pipreg_aclr),
                                      .ena(round0_pipreg_ena),
                                      .bypass_register(round0_pipreg_bypass_register),
                                      .dataout(round0_pipreg_out)
                                     );
defparam round0_pipreg.data_width = 1;
      //decode the clk and aclr values
assign round0_pipreg_clk_value =((round0_pipeline_clock == "0") || (round0_pipeline_clock == "none")) ? 4'b0000 :
                                (round0_pipeline_clock == "1") ? 4'b0001 :
                                (round0_pipeline_clock == "2") ? 4'b0010 :
                                (round0_pipeline_clock == "3") ? 4'b0011 : 4'b0000;
assign   round0_pipreg_aclr_value = ((round0_pipeline_clear == "0") ||(round0_pipeline_clear == "none")) ? 4'b0000 :
                                    (round0_pipeline_clear == "1") ? 4'b0001 :
                                    (round0_pipeline_clear == "2") ? 4'b0010 :
                                    (round0_pipeline_clear == "3") ? 4'b0011 : 4'b0000;
        //assign the corresponding clk,aclr,enable and bypass register values.
assign round0_pipreg_clk = clk[round0_pipreg_clk_value] ? 'b1 : 'b0;
assign round0_pipreg_aclr = aclr[round0_pipreg_aclr_value] || ~devclrn || ~devpor   ? 'b1 : 'b0;
assign round0_pipreg_ena = ena[round0_pipreg_clk_value] ? 'b1 : 'b0;
assign round0_pipreg_bypass_register = (round0_pipeline_clock == "none") ? 'b1 : 'b0;
  //Instantiate round1 input register
hardcopyii_mac_register  round1_inreg(
                                     .datain(round1),
                                     .clk(round1_inreg_clk),
                                     .aclr(round1_inreg_aclr),
                                     .ena(round1_inreg_ena),
                                     .bypass_register(round1_inreg_bypass_register),
                                     .dataout(round1_inreg_pipreg)
                                    );
defparam round1_inreg.data_width = 1;
      //decode the clk and aclr values
assign round1_inreg_clk_value =((round1_clock == "0") || (round1_clock == "none")) ? 4'b0000 :
                               (round1_clock == "1") ? 4'b0001 :
                               (round1_clock == "2") ? 4'b0010 :
                               (round1_clock == "3") ? 4'b0011 : 4'b0000;
assign   round1_inreg_aclr_value = ((round1_clear == "0") ||(round1_clear == "none")) ? 4'b0000 :
                                   (round1_clear == "1") ? 4'b0001 :
                                   (round1_clear == "2") ? 4'b0010 :
                                   (round1_clear == "3") ? 4'b0011 : 4'b0000;
        //assign the corresponding clk,aclr,enable and bypass register values.
assign round1_inreg_clk = clk[round1_inreg_clk_value] ? 'b1 : 'b0;
assign round1_inreg_aclr = aclr[round1_inreg_aclr_value] || ~devclrn || ~devpor   ? 'b1 : 'b0;
assign round1_inreg_ena = ena[round1_inreg_clk_value] ? 'b1 : 'b0;
assign round1_inreg_bypass_register = (round1_clock == "none") ? 'b1 : 'b0;
         //Instantiate round1 pipeline register
hardcopyii_mac_register  round1_pipreg(
                                      .datain(round1_inreg_pipreg),
                                      .clk(round1_pipreg_clk),
                                      .aclr(round1_pipreg_aclr),
                                      .ena(round1_pipreg_ena),
                                      .bypass_register(round1_pipreg_bypass_register),
                                      .dataout(round1_pipreg_out)
                                     );
defparam round1_pipreg.data_width = 1;
      //decode the clk and aclr values
assign round1_pipreg_clk_value =((round1_pipeline_clock == "0") || (round1_pipeline_clock == "none")) ? 4'b0000 :
                                (round1_pipeline_clock == "1") ? 4'b0001 :
                                (round1_pipeline_clock == "2") ? 4'b0010 :
                                (round1_pipeline_clock == "3") ? 4'b0011 : 4'b0000;
assign   round1_pipreg_aclr_value = ((round1_pipeline_clear == "0") ||(round1_pipeline_clear == "none")) ? 4'b0000 :
                                    (round1_pipeline_clear == "1") ? 4'b0001 :
                                    (round1_pipeline_clear == "2") ? 4'b0010 :
                                    (round1_pipeline_clear == "3") ? 4'b0011 : 4'b0000;
        //assign the corresponding clk,aclr,enable and bypass register values.
assign round1_pipreg_clk = clk[round1_pipreg_clk_value] ? 'b1 : 'b0;
assign round1_pipreg_aclr = aclr[round1_pipreg_aclr_value] || ~devclrn || ~devpor   ? 'b1 : 'b0;
assign round1_pipreg_ena = ena[round1_pipreg_clk_value] ? 'b1 : 'b0;
assign round1_pipreg_bypass_register = (round1_pipeline_clock == "none") ? 'b1 : 'b0;
         //Instantiate saturate input register
hardcopyii_mac_register  saturate_inreg(
                                       .datain(saturate),
                                       .clk(saturate_inreg_clk),
                                       .aclr(saturate_inreg_aclr),
                                       .ena(saturate_inreg_ena),
                                       .bypass_register(saturate_inreg_bypass_register),
                                       .dataout(saturate_inreg_pipreg)
                                      );
defparam saturate_inreg.data_width = 1;
      //decode the clk and aclr values
assign saturate_inreg_clk_value =((saturate_clock == "0") || (saturate_clock == "none")) ? 4'b0000 :
                                 (saturate_clock == "1") ? 4'b0001 :
                                 (saturate_clock == "2") ? 4'b0010 :
                                 (saturate_clock == "3") ? 4'b0011 : 4'b0000;
assign   saturate_inreg_aclr_value = ((saturate_clear == "0") ||(saturate_clear == "none")) ? 4'b0000 :
                                    (saturate_clear == "1") ? 4'b0001 :
                                    (saturate_clear == "2") ? 4'b0010 :
                                    (saturate_clear == "3") ? 4'b0011 : 4'b0000;
        //assign the corresponding clk,aclr,enable and bypass register values.
assign saturate_inreg_clk = clk[saturate_inreg_clk_value] ? 'b1 : 'b0;
assign saturate_inreg_aclr = aclr[saturate_inreg_aclr_value] || ~devclrn || ~devpor   ? 'b1 : 'b0;
assign saturate_inreg_ena = ena[saturate_inreg_clk_value] ? 'b1 : 'b0;
assign saturate_inreg_bypass_register = (saturate_clock == "none") ? 'b1 : 'b0;
         //Instantiate saturate pipeline register
hardcopyii_mac_register  saturate_pipreg(
                                        .datain(saturate_inreg_pipreg),
                                        .clk(saturate_pipreg_clk),
                                        .aclr(saturate_pipreg_aclr),
                                        .ena(saturate_pipreg_ena),
                                        .bypass_register(saturate_pipreg_bypass_register),
                                        .dataout(saturate_pipreg_out)
                                       );
defparam saturate_pipreg.data_width = 1;
      //decode the clk and aclr values
assign saturate_pipreg_clk_value =((saturate_pipeline_clock == "0") || (saturate_pipeline_clock == "none")) ? 4'b0000 :
                                   (saturate_pipeline_clock == "1") ? 4'b0001 :
                                   (saturate_pipeline_clock == "2") ? 4'b0010 :
                                   (saturate_pipeline_clock == "3") ? 4'b0011 : 4'b0000;
assign   saturate_pipreg_aclr_value = ((saturate_pipeline_clear == "0") ||(saturate_pipeline_clear == "none")) ? 4'b0000 :
                                      (saturate_pipeline_clear == "1") ? 4'b0001 :
                                      (saturate_pipeline_clear == "2") ? 4'b0010 :
                                    (saturate_pipeline_clear == "3") ? 4'b0011 : 4'b0000;
        //assign the corresponding clk,aclr,enable and bypass register values.
assign saturate_pipreg_clk = clk[saturate_pipreg_clk_value] ? 'b1 : 'b0;
assign saturate_pipreg_aclr = aclr[saturate_pipreg_aclr_value] || ~devclrn || ~devpor   ? 'b1 : 'b0;
assign saturate_pipreg_ena = ena[saturate_pipreg_clk_value] ? 'b1 : 'b0;
assign saturate_pipreg_bypass_register = (saturate_pipeline_clock == "none") ? 'b1 : 'b0;
         //Instantiate multabsaturate input register
hardcopyii_mac_register  multabsaturate_inreg(
                                             .datain(multabsaturate),
                                             .clk(multabsaturate_inreg_clk),
                                             .aclr(multabsaturate_inreg_aclr),
                                             .ena(multabsaturate_inreg_ena),
                                             .bypass_register(multabsaturate_inreg_bypass_register),
                                             .dataout(multabsaturate_inreg_pipreg)
                                            );
defparam multabsaturate_inreg.data_width = 1;
      //decode the clk and aclr values
assign multabsaturate_inreg_clk_value =((multabsaturate_clock == "0") || (multabsaturate_clock == "none")) ? 4'b0000 :
                                   (multabsaturate_clock == "1") ? 4'b0001 :
                                   (multabsaturate_clock == "2") ? 4'b0010 :
                                   (multabsaturate_clock == "3") ? 4'b0011 : 4'b0000;
assign   multabsaturate_inreg_aclr_value = ((multabsaturate_clear == "0") ||(multabsaturate_clear == "none")) ? 4'b0000 :
                                        (multabsaturate_clear == "1") ? 4'b0001 :
                                        (multabsaturate_clear == "2") ? 4'b0010 :
                                        (multabsaturate_clear == "3") ? 4'b0011 : 4'b0000;
        //assign the corresponding clk,aclr,enable and bypass register values.
assign multabsaturate_inreg_clk = clk[multabsaturate_inreg_clk_value] ? 'b1 : 'b0;
assign multabsaturate_inreg_aclr = aclr[multabsaturate_inreg_aclr_value] || ~devclrn || ~devpor   ? 'b1 : 'b0;
assign multabsaturate_inreg_ena = ena[multabsaturate_inreg_clk_value] ? 'b1 : 'b0;
assign multabsaturate_inreg_bypass_register = (multabsaturate_clock == "none") ? 'b1 : 'b0;
         //Instantiate multabsaturate pipeline register
hardcopyii_mac_register  multabsaturate_pipreg(
                                              .datain(multabsaturate_inreg_pipreg),
                                              .clk(multabsaturate_pipreg_clk),
                                              .aclr(multabsaturate_pipreg_aclr),
                                              .ena(multabsaturate_pipreg_ena),
                                              .bypass_register(multabsaturate_pipreg_bypass_register),
                                              .dataout(multabsaturate_pipreg_out)
                                             );
defparam multabsaturate_pipreg.data_width = 1;
      //decode the clk and aclr values
assign multabsaturate_pipreg_clk_value =((multabsaturate_pipeline_clock == "0") || (multabsaturate_pipeline_clock == "none")) ? 4'b0000 :
                                        (multabsaturate_pipeline_clock == "1") ? 4'b0001 :
                                        (multabsaturate_pipeline_clock == "2") ? 4'b0010 :
                                        (multabsaturate_pipeline_clock == "3") ? 4'b0011 : 4'b0000;
assign   multabsaturate_pipreg_aclr_value = ((multabsaturate_pipeline_clear == "0") ||(multabsaturate_pipeline_clear == "none")) ? 4'b0000 :
                                            (multabsaturate_pipeline_clear == "1") ? 4'b0001 :
                                            (multabsaturate_pipeline_clear == "2") ? 4'b0010 :
                                            (multabsaturate_pipeline_clear == "3") ? 4'b0011 : 4'b0000;
        //assign the corresponding clk,aclr,enable and bypass register values.
assign multabsaturate_pipreg_clk = clk[multabsaturate_pipreg_clk_value] ? 'b1 : 'b0;
assign multabsaturate_pipreg_aclr = aclr[multabsaturate_pipreg_aclr_value] || ~devclrn || ~devpor   ? 'b1 : 'b0;
assign multabsaturate_pipreg_ena = ena[multabsaturate_pipreg_clk_value] ? 'b1 : 'b0;
assign multabsaturate_pipreg_bypass_register = (multabsaturate_pipeline_clock == "none") ? 'b1 : 'b0;
  //Instantiate multcdsaturate input register
hardcopyii_mac_register  multcdsaturate_inreg(
                                              .datain(multcdsaturate),
                                              .clk(multcdsaturate_inreg_clk),
                                              .aclr(multcdsaturate_inreg_aclr),
                                              .ena(multcdsaturate_inreg_ena),
                                              .bypass_register(multcdsaturate_inreg_bypass_register),
                                              .dataout(multcdsaturate_inreg_pipreg)
                                            );
defparam multcdsaturate_inreg.data_width = 1;
      //decode the clk and aclr values
assign multcdsaturate_inreg_clk_value =((multcdsaturate_clock == "0") || (multcdsaturate_clock == "none")) ? 4'b0000 :
                                       (multcdsaturate_clock == "1") ? 4'b0001 :
                                       (multcdsaturate_clock == "2") ? 4'b0010 :
                                       (multcdsaturate_clock == "3") ? 4'b0011 : 4'b0000;
assign   multcdsaturate_inreg_aclr_value = ((multcdsaturate_clear == "0") ||(multcdsaturate_clear == "none")) ? 4'b0000 :
                                        (multcdsaturate_clear == "1") ? 4'b0001 :
                                        (multcdsaturate_clear == "2") ? 4'b0010 :
                                        (multcdsaturate_clear == "3") ? 4'b0011 : 4'b0000;
        //assign the corresponding clk,aclr,enable and bypass register values.
assign multcdsaturate_inreg_clk = clk[multcdsaturate_inreg_clk_value] ? 'b1 : 'b0;
assign multcdsaturate_inreg_aclr = aclr[multcdsaturate_inreg_aclr_value] || ~devclrn || ~devpor   ? 'b1 : 'b0;
assign multcdsaturate_inreg_ena = ena[multcdsaturate_inreg_clk_value] ? 'b1 : 'b0;
assign multcdsaturate_inreg_bypass_register = (multcdsaturate_clock == "none") ? 'b1 : 'b0;
         //Instantiate multcdsaturate pipeline register
hardcopyii_mac_register  multcdsaturate_pipreg(
                                               .datain(multcdsaturate_inreg_pipreg),
                                               .clk(multcdsaturate_pipreg_clk),
                                               .aclr(multcdsaturate_pipreg_aclr),
                                               .ena(multcdsaturate_pipreg_ena),
                                               .bypass_register(multcdsaturate_pipreg_bypass_register),
                                               .dataout(multcdsaturate_pipreg_out)
                                             );
defparam multcdsaturate_pipreg.data_width = 1;
      //decode the clk and aclr values
assign multcdsaturate_pipreg_clk_value =((multcdsaturate_pipeline_clock == "0") || (multcdsaturate_pipeline_clock == "none")) ? 4'b0000 :
                                        (multcdsaturate_pipeline_clock == "1") ? 4'b0001 :
                                        (multcdsaturate_pipeline_clock == "2") ? 4'b0010 :
                                        (multcdsaturate_pipeline_clock == "3") ? 4'b0011 : 4'b0000;
assign   multcdsaturate_pipreg_aclr_value = ((multcdsaturate_pipeline_clear == "0") ||(multcdsaturate_pipeline_clear == "none")) ? 4'b0000 :
                                        (multcdsaturate_pipeline_clear == "1") ? 4'b0001 :
                                        (multcdsaturate_pipeline_clear == "2") ? 4'b0010 :
                                        (multcdsaturate_pipeline_clear == "3") ? 4'b0011 : 4'b0000;
        //assign the corresponding clk,aclr,enable and bypass register values.
assign multcdsaturate_pipreg_clk = clk[multcdsaturate_pipreg_clk_value] ? 'b1 : 'b0;
assign multcdsaturate_pipreg_aclr = aclr[multcdsaturate_pipreg_aclr_value] || ~devclrn || ~devpor   ? 'b1 : 'b0;
assign multcdsaturate_pipreg_ena = ena[multcdsaturate_pipreg_clk_value] ? 'b1 : 'b0;
assign multcdsaturate_pipreg_bypass_register = (multcdsaturate_pipeline_clock == "none") ? 'b1 : 'b0;
     //Instantiate the mac_out internal logic
hardcopyii_mac_out_internal mac_out_block(
                                         .dataa(mac_out_dataa),
                                         .datab(mac_out_datab),
                                         .datac(mac_out_datac),
                                         .datad(mac_out_datad),
                                         .roundab(round0_pipreg_out),
                                         .saturateab(saturate_pipreg_out),
                                         .roundcd(round1_pipreg_out),
                                         .multabsaturate(multabsaturate_pipreg_out),
                                         .multcdsaturate(multcdsaturate_pipreg_out),
                                         .signa(signa_pipreg_out),
                                         .signb(signb_pipreg_out),
                                         .addnsub0(addnsub0_pipreg_out),
                                         .addnsub1(addnsub1_pipreg_out),
                                         .zeroacc(zeroacc_pipreg_out),
                                         .feedback(mac_out_feedback),
                                         .dataout(mac_out_dataout),
                                         .accoverflow(mac_out_accoverflow)
                                        );
defparam  mac_out_block.operation_mode = operation_mode;
defparam  mac_out_block.dataa_width = dataa_width;
defparam  mac_out_block.datab_width = datab_width;
defparam  mac_out_block.datac_width = datac_width;
defparam  mac_out_block.datad_width = datad_width;
assign mac_out_dataa = dataa;
assign mac_out_datac = datac;
assign mac_out_datab = datab;
assign mac_out_datad = datad;
   //Instantiate the output register
hardcopyii_mac_register  output_register(
                                        .datain(mac_out_dataout[71:0]),
                                        .clk(outreg_clk),
                                        .aclr(outreg_aclr),
                                        .ena(outreg_ena),
                                        .bypass_register(outreg_bypass_register),
                                        .dataout(outreg_dataout)
                                       );
defparam output_register.data_width = 72;
      //decode the clk and aclr values
assign outreg_clk_value =((output_clock== "0") || (output_clock== "none")) ? 4'b0000 :
                         (output_clock== "1") ? 4'b0001 :
                         (output_clock== "2") ? 4'b0010 :
                         (output_clock== "3") ? 4'b0011 : 4'b0000;
assign   outreg_aclr_value = ((output_clear == "0") ||(output_clear == "none")) ? 4'b0000 :
                             (output_clear == "1") ? 4'b0001 :
                             (output_clear == "2") ? 4'b0010 :
                             (output_clear == "3") ? 4'b0011 : 4'b0000;
        //assign the corresponding clk,aclr,enable and bypass register values.
assign outreg_clk = clk[outreg_clk_value] ? 'b1 : 'b0;
assign outreg_aclr = aclr[outreg_aclr_value] || ~devclrn || ~devpor   ? 'b1 : 'b0;
assign outreg_ena = ena[outreg_clk_value] ? 'b1 : 'b0;
assign outreg_bypass_register = (output_clock== "none") ? 'b1 : 'b0;
   //Instantiate the accum overflow register
hardcopyii_mac_register  accoverflow_register(
                                              .datain(mac_out_accoverflow),
                                              .clk(outreg_clk),
                                              .aclr(outreg_aclr),
                                              .ena(outreg_ena),
                                              .bypass_register(outreg_bypass_register),
                                              .dataout(accoverflow)
                                             );
defparam accoverflow_register.data_width = 1;
assign dataout_tmp = outreg_dataout;
assign dataout = dataout_tmp;
    //assign the feedback for accumulator mode of operation
assign mac_out_feedback = dataout_tmp;
endmodule