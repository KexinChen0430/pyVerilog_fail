module stratixiigx_mac_out(
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
                          mode0,
                          mode1,
                          zeroacc1,
                          saturate1,
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
parameter mode0_clock = "none";
parameter mode1_clock = "none";
parameter zeroacc1_clock = "none";
parameter saturate1_clock= "none";
parameter output1_clock  = "none";
parameter output2_clock  = "none";
parameter output3_clock  = "none";
parameter output4_clock  = "none";
parameter output5_clock  = "none";
parameter output6_clock  = "none";
parameter output7_clock  = "none";
parameter mode0_clear = "none";
parameter mode1_clear = "none";
parameter zeroacc1_clear = "none";
parameter saturate1_clear= "none";
parameter output1_clear  = "none";
parameter output2_clear  = "none";
parameter output3_clear  = "none";
parameter output4_clear  = "none";
parameter output5_clear  = "none";
parameter output6_clear  = "none";
parameter output7_clear  = "none";
parameter mode0_pipeline_clock  = "none";
parameter mode1_pipeline_clock  = "none";
parameter zeroacc1_pipeline_clock  = "none";
parameter saturate1_pipeline_clock = "none";
parameter mode0_pipeline_clear  = "none";
parameter mode1_pipeline_clear  = "none";
parameter zeroacc1_pipeline_clear  = "none";
parameter saturate1_pipeline_clear = "none";
parameter dataa_forced_to_zero= "no";
parameter datac_forced_to_zero= "no";
parameter lpm_hint  = "true";
parameter lpm_type  = "stratixiigx_mac_out";
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
input   saturate1;
input   mode0;
input   mode1;
input   zeroacc1;
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
//Internal signals to instantiate the zeroacc1 input register unit
wire [3:0] zeroacc1_inreg_clk_value;
wire [3:0] zeroacc1_inreg_aclr_value;
wire zeroacc1_inreg_clk;
wire zeroacc1_inreg_aclr;
wire zeroacc1_inreg_ena;
wire zeroacc1_inreg_bypass_register;
wire  zeroacc1_inreg_pipreg;
    //Internal signals to instantiate the zeroacc1 pipeline register unit
wire [3:0] zeroacc1_pipreg_clk_value;
wire [3:0] zeroacc1_pipreg_aclr_value;
wire zeroacc1_pipreg_clk;
wire zeroacc1_pipreg_aclr;
wire zeroacc1_pipreg_ena;
wire zeroacc1_pipreg_bypass_register;
wire  zeroacc1_pipreg_out;
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
    //Internal signals to instantiate the saturate1 input register unit
wire [3:1] saturate1_inreg_clk_value;
wire [3:1] saturate1_inreg_aclr_value;
wire saturate1_inreg_clk;
wire saturate1_inreg_aclr;
wire saturate1_inreg_ena;
wire saturate1_inreg_bypass_register;
wire  saturate1_inreg_pipreg;
    //Internal signals to instantiate the saturate1 pipeline register unit
wire [3:1] saturate1_pipreg_clk_value;
wire [3:1] saturate1_pipreg_aclr_value;
wire saturate1_pipreg_clk;
wire saturate1_pipreg_aclr;
wire saturate1_pipreg_ena;
wire saturate1_pipreg_bypass_register;
wire  saturate1_pipreg_out;
//Internal signals to instantiate the mode0 input register unit
wire [3:0] mode0_inreg_clk_value;
wire [3:0] mode0_inreg_aclr_value;
wire mode0_inreg_clk;
wire mode0_inreg_aclr;
wire mode0_inreg_ena;
wire mode0_inreg_bypass_register;
wire  mode0_inreg_pipreg;
    //Internal signals to instantiate the mode0 pipeline register unit
wire [3:0] mode0_pipreg_clk_value;
wire [3:0] mode0_pipreg_aclr_value;
wire mode0_pipreg_clk;
wire mode0_pipreg_aclr;
wire mode0_pipreg_ena;
wire mode0_pipreg_bypass_register;
wire  mode0_pipreg_out;
    //Internal signals to instantiate the mode1 input register unit
wire [3:1] mode1_inreg_clk_value;
wire [3:1] mode1_inreg_aclr_value;
wire mode1_inreg_clk;
wire mode1_inreg_aclr;
wire mode1_inreg_ena;
wire mode1_inreg_bypass_register;
wire  mode1_inreg_pipreg;
    //Internal signals to instantiate the mode1 pipeline register unit
wire [3:1] mode1_pipreg_clk_value;
wire [3:1] mode1_pipreg_aclr_value;
wire mode1_pipreg_clk;
wire mode1_pipreg_aclr;
wire mode1_pipreg_ena;
wire mode1_pipreg_bypass_register;
wire  mode1_pipreg_out;
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
stratixiigx_mac_register  signa_inreg(
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
stratixiigx_mac_register  signa_pipreg(
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
stratixiigx_mac_register  signb_inreg(
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
stratixiigx_mac_register  signb_pipreg(
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
stratixiigx_mac_register  zeroacc_inreg(
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
stratixiigx_mac_register  zeroacc_pipreg(
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
  //Instantiate zeroacc1 input register
stratixiigx_mac_register  zeroacc1_inreg (
                                         .datain(zeroacc1),
                                         .clk(zeroacc1_inreg_clk),
                                         .aclr(zeroacc1_inreg_aclr),
                                         .ena(zeroacc1_inreg_ena),
                                         .bypass_register(zeroacc1_inreg_bypass_register),
                                         .dataout(zeroacc1_inreg_pipreg)
                                        );
defparam zeroacc1_inreg.data_width = 1;
      //decode the clk and aclr values
assign zeroacc1_inreg_clk_value =((zeroacc1_clock == "0") || (zeroacc1_clock == "none")) ? 4'b0000 :
                                (zeroacc1_clock == "1") ? 4'b0001 :
                                (zeroacc1_clock == "2") ? 4'b0010 :
                                (zeroacc1_clock == "3") ? 4'b0011 : 4'b0000;
assign   zeroacc1_inreg_aclr_value = ((zeroacc1_clear == "0") ||(zeroacc1_clear == "none")) ? 4'b0000 :
                                    (zeroacc1_clear == "1") ? 4'b0001 :
                                    (zeroacc1_clear == "2") ? 4'b0010 :
                                    (zeroacc1_clear == "3") ? 4'b0011 : 4'b0000;
        //assign the corresponding clk,aclr,enable and bypass register values.
assign zeroacc1_inreg_clk = clk[zeroacc1_inreg_clk_value] ? 'b1 : 'b0;
assign zeroacc1_inreg_aclr = aclr[zeroacc1_inreg_aclr_value] || ~devclrn || ~devpor   ? 'b1 : 'b0;
assign zeroacc1_inreg_ena = ena[zeroacc1_inreg_clk_value] ? 'b1 : 'b0;
assign zeroacc1_inreg_bypass_register = (zeroacc1_clock == "none") ? 'b1 : 'b0;
         //Instantiate zeroacc1 pipeline register
stratixiigx_mac_register  zeroacc1_pipreg(
                                        .datain(zeroacc1_inreg_pipreg),
                                        .clk(zeroacc1_pipreg_clk),
                                        .aclr(zeroacc1_pipreg_aclr),
                                        .ena(zeroacc1_pipreg_ena),
                                        .bypass_register(zeroacc1_pipreg_bypass_register),
                                        .dataout(zeroacc1_pipreg_out)
                                       );
defparam zeroacc1_pipreg.data_width = 1;
      //decode the clk and aclr values
assign zeroacc1_pipreg_clk_value =((zeroacc1_pipeline_clock == "0") || (zeroacc1_pipeline_clock == "none")) ? 4'b0000 :
                                   (zeroacc1_pipeline_clock == "1") ? 4'b0001 :
                                   (zeroacc1_pipeline_clock == "2") ? 4'b0010 :
                                   (zeroacc1_pipeline_clock == "3") ? 4'b0011 : 4'b0000;
assign   zeroacc1_pipreg_aclr_value = ((zeroacc1_pipeline_clear == "0") ||(zeroacc1_pipeline_clear == "none")) ? 4'b0000 :
                                     (zeroacc1_pipeline_clear == "1") ? 4'b0001 :
                                     (zeroacc1_pipeline_clear == "2") ? 4'b0010 :
                                    (zeroacc1_pipeline_clear == "3") ? 4'b0011 : 4'b0000;
        //assign the corresponding clk,aclr,enable and bypass register values.
assign zeroacc1_pipreg_clk = clk[zeroacc1_pipreg_clk_value] ? 'b1 : 'b0;
assign zeroacc1_pipreg_aclr = aclr[zeroacc1_pipreg_aclr_value] || ~devclrn || ~devpor   ? 'b1 : 'b0;
assign zeroacc1_pipreg_ena = ena[zeroacc1_pipreg_clk_value] ? 'b1 : 'b0;
assign zeroacc1_pipreg_bypass_register = (zeroacc1_pipeline_clock == "none") ? 'b1 : 'b0;
         //Instantiate addnsub0 input register
stratixiigx_mac_register  addnsub0_inreg(
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
stratixiigx_mac_register  addnsub0_pipreg(
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
stratixiigx_mac_register  addnsub1_inreg(
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
stratixiigx_mac_register  addnsub1_pipreg(
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
stratixiigx_mac_register  round0_inreg(
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
stratixiigx_mac_register  round0_pipreg(
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
stratixiigx_mac_register  round1_inreg(
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
stratixiigx_mac_register  round1_pipreg(
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
stratixiigx_mac_register  saturate_inreg(
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
stratixiigx_mac_register  saturate_pipreg(
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
  //Instantiate saturate1 input register
stratixiigx_mac_register  saturate1_inreg(
                                        .datain(saturate1),
                                        .clk(saturate1_inreg_clk),
                                        .aclr(saturate1_inreg_aclr),
                                        .ena(saturate1_inreg_ena),
                                        .bypass_register(saturate1_inreg_bypass_register),
                                        .dataout(saturate1_inreg_pipreg)
                                       );
defparam saturate1_inreg.data_width = 1;
      //decode the clk and aclr values
assign saturate1_inreg_clk_value =((saturate1_clock == "0") || (saturate1_clock == "none")) ? 4'b0000 :
                                   (saturate1_clock == "1") ? 4'b0001 :
                                   (saturate1_clock == "2") ? 4'b0010 :
                                   (saturate1_clock == "3") ? 4'b0011 : 4'b0000;
assign   saturate1_inreg_aclr_value = ((saturate1_clear == "0") ||(saturate1_clear == "none")) ? 4'b0000 :
                                     (saturate1_clear == "1") ? 4'b0001 :
                                     (saturate1_clear == "2") ? 4'b0010 :
                                    (saturate1_clear == "3") ? 4'b0011 : 4'b0000;
        //assign the corresponding clk,aclr,enable and bypass register values.
assign saturate1_inreg_clk = clk[saturate1_inreg_clk_value] ? 'b1 : 'b0;
assign saturate1_inreg_aclr = aclr[saturate1_inreg_aclr_value] || ~devclrn || ~devpor   ? 'b1 : 'b0;
assign saturate1_inreg_ena = ena[saturate1_inreg_clk_value] ? 'b1 : 'b0;
assign saturate1_inreg_bypass_register = (saturate1_clock == "none") ? 'b1 : 'b0;
         //Instantiate saturate1 pipeline register
stratixiigx_mac_register  saturate1_pipreg(
                                         .datain(saturate1_inreg_pipreg),
                                         .clk(saturate1_pipreg_clk),
                                         .aclr(saturate1_pipreg_aclr),
                                         .ena(saturate1_pipreg_ena),
                                         .bypass_register(saturate1_pipreg_bypass_register),
                                         .dataout(saturate1_pipreg_out)
                                       );
defparam saturate1_pipreg.data_width = 1;
      //decode the clk and aclr values
assign saturate1_pipreg_clk_value =((saturate1_pipeline_clock == "0") || (saturate1_pipeline_clock == "none")) ? 4'b0000 :
                                   (saturate1_pipeline_clock == "1") ? 4'b0001 :
                                   (saturate1_pipeline_clock == "2") ? 4'b0010 :
                                   (saturate1_pipeline_clock == "3") ? 4'b0011 : 4'b0000;
assign   saturate1_pipreg_aclr_value = ((saturate1_pipeline_clear == "0") ||(saturate1_pipeline_clear == "none")) ? 4'b0000 :
                                     (saturate1_pipeline_clear == "1") ? 4'b0001 :
                                     (saturate1_pipeline_clear == "2") ? 4'b0010 :
                                    (saturate1_pipeline_clear == "3") ? 4'b0011 : 4'b0000;
        //assign the corresponding clk,aclr,enable and bypass register values.
assign saturate1_pipreg_clk = clk[saturate1_pipreg_clk_value] ? 'b1 : 'b0;
assign saturate1_pipreg_aclr = aclr[saturate1_pipreg_aclr_value] || ~devclrn || ~devpor   ? 'b1 : 'b0;
assign saturate1_pipreg_ena = ena[saturate1_pipreg_clk_value] ? 'b1 : 'b0;
assign saturate1_pipreg_bypass_register = (saturate1_pipeline_clock == "none") ? 'b1 : 'b0;
         //Instantiate mode0 input register
stratixiigx_mac_register  mode0_inreg(
                                    .datain(mode0),
                                    .clk(mode0_inreg_clk),
                                    .aclr(mode0_inreg_aclr),
                                    .ena(mode0_inreg_ena),
                                    .bypass_register(mode0_inreg_bypass_register),
                                    .dataout(mode0_inreg_pipreg)
                                   );
defparam mode0_inreg.data_width = 1;
      //decode the clk and aclr values
assign mode0_inreg_clk_value =((mode0_clock == "0") || (mode0_clock == "none")) ? 4'b0000 :
                              (mode0_clock == "1") ? 4'b0001 :
                              (mode0_clock == "2") ? 4'b0010 :
                              (mode0_clock == "3") ? 4'b0011 : 4'b0000;
assign   mode0_inreg_aclr_value = ((mode0_clear == "0") ||(mode0_clear == "none")) ? 4'b0000 :
                                   (mode0_clear == "1") ? 4'b0001 :
                                   (mode0_clear == "2") ? 4'b0010 :
                                   (mode0_clear == "3") ? 4'b0011 : 4'b0000;
        //assign the corresponding clk,aclr,enable and bypass register values.
assign mode0_inreg_clk = clk[mode0_inreg_clk_value] ? 'b1 : 'b0;
assign mode0_inreg_aclr = aclr[mode0_inreg_aclr_value] || ~devclrn || ~devpor   ? 'b1 : 'b0;
assign mode0_inreg_ena = ena[mode0_inreg_clk_value] ? 'b1 : 'b0;
assign mode0_inreg_bypass_register = (mode0_clock == "none") ? 'b1 : 'b0;
         //Instantiate mode0 pipeline register
stratixiigx_mac_register  mode0_pipreg(
                                     .datain(mode0_inreg_pipreg),
                                     .clk(mode0_pipreg_clk),
                                     .aclr(mode0_pipreg_aclr),
                                     .ena(mode0_pipreg_ena),
                                     .bypass_register(mode0_pipreg_bypass_register),
                                     .dataout(mode0_pipreg_out)
                                   );
defparam mode0_pipreg.data_width = 1;
      //decode the clk and aclr values
assign mode0_pipreg_clk_value =((mode0_pipeline_clock == "0") || (mode0_pipeline_clock == "none")) ? 4'b0000 :
                               (mode0_pipeline_clock == "1") ? 4'b0001 :
                               (mode0_pipeline_clock == "2") ? 4'b0010 :
                               (mode0_pipeline_clock == "3") ? 4'b0011 : 4'b0000;
assign   mode0_pipreg_aclr_value = ((mode0_pipeline_clear == "0") ||(mode0_pipeline_clear == "none")) ? 4'b0000 :
                                   (mode0_pipeline_clear == "1") ? 4'b0001 :
                                   (mode0_pipeline_clear == "2") ? 4'b0010 :
                                   (mode0_pipeline_clear == "3") ? 4'b0011 : 4'b0000;
        //assign the corresponding clk,aclr,enable and bypass register values.
assign mode0_pipreg_clk = clk[mode0_pipreg_clk_value] ? 'b1 : 'b0;
assign mode0_pipreg_aclr = aclr[mode0_pipreg_aclr_value] || ~devclrn || ~devpor   ? 'b1 : 'b0;
assign mode0_pipreg_ena = ena[mode0_pipreg_clk_value] ? 'b1 : 'b0;
assign mode0_pipreg_bypass_register = (mode0_pipeline_clock == "none") ? 'b1 : 'b0;
  //Instantiate mode1 input register
stratixiigx_mac_register  mode1_inreg (
                                     .datain(mode1),
                                     .clk(mode1_inreg_clk),
                                     .aclr(mode1_inreg_aclr),
                                     .ena(mode1_inreg_ena),
                                     .bypass_register(mode1_inreg_bypass_register),
                                     .dataout(mode1_inreg_pipreg)
                                   );
defparam mode1_inreg.data_width = 1;
      //decode the clk and aclr values
assign mode1_inreg_clk_value =((mode1_clock == "0") || (mode1_clock == "none")) ? 4'b0000 :
                              (mode1_clock == "1") ? 4'b0001 :
                              (mode1_clock == "2") ? 4'b0010 :
                              (mode1_clock == "3") ? 4'b0011 : 4'b0000;
assign   mode1_inreg_aclr_value = ((mode1_clear == "0") ||(mode1_clear == "none")) ? 4'b0000 :
                                  (mode1_clear == "1") ? 4'b0001 :
                                  (mode1_clear == "2") ? 4'b0010 :
                                  (mode1_clear == "3") ? 4'b0011 : 4'b0000;
        //assign the corresponding clk,aclr,enable and bypass register values.
assign mode1_inreg_clk = clk[mode1_inreg_clk_value] ? 'b1 : 'b0;
assign mode1_inreg_aclr = aclr[mode1_inreg_aclr_value] || ~devclrn || ~devpor   ? 'b1 : 'b0;
assign mode1_inreg_ena = ena[mode1_inreg_clk_value] ? 'b1 : 'b0;
assign mode1_inreg_bypass_register = (mode1_clock == "none") ? 'b1 : 'b0;
         //Instantiate mode1 pipeline register
stratixiigx_mac_register  mode1_pipreg (
                                       .datain(mode1_inreg_pipreg),
                                       .clk(mode1_pipreg_clk),
                                       .aclr(mode1_pipreg_aclr),
                                       .ena(mode1_pipreg_ena),
                                       .bypass_register(mode1_pipreg_bypass_register),
                                       .dataout(mode1_pipreg_out)
                                      );
defparam mode1_pipreg.data_width = 1;
      //decode the clk and aclr values
assign mode1_pipreg_clk_value =((mode1_pipeline_clock == "0") || (mode1_pipeline_clock == "none")) ? 4'b0000 :
                               (mode1_pipeline_clock == "1") ? 4'b0001 :
                               (mode1_pipeline_clock == "2") ? 4'b0010 :
                               (mode1_pipeline_clock == "3") ? 4'b0011 : 4'b0000;
assign   mode1_pipreg_aclr_value = ((mode1_pipeline_clear == "0") ||(mode1_pipeline_clear == "none")) ? 4'b0000 :
                                   (mode1_pipeline_clear == "1") ? 4'b0001 :
                                   (mode1_pipeline_clear == "2") ? 4'b0010 :
                                   (mode1_pipeline_clear == "3") ? 4'b0011 : 4'b0000;
        //assign the corresponding clk,aclr,enable and bypass register values.
assign mode1_pipreg_clk = clk[mode1_pipreg_clk_value] ? 'b1 : 'b0;
assign mode1_pipreg_aclr = aclr[mode1_pipreg_aclr_value] || ~devclrn || ~devpor   ? 'b1 : 'b0;
assign mode1_pipreg_ena = ena[mode1_pipreg_clk_value] ? 'b1 : 'b0;
assign mode1_pipreg_bypass_register = (mode1_pipeline_clock == "none") ? 'b1 : 'b0;
         //Instantiate multabsaturate input register
stratixiigx_mac_register  multabsaturate_inreg(
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
stratixiigx_mac_register  multabsaturate_pipreg(
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
stratixiigx_mac_register  multcdsaturate_inreg(
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
stratixiigx_mac_register  multcdsaturate_pipreg(
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
stratixiigx_mac_out_internal mac_out_block(
                                         .dataa(mac_out_dataa),
                                         .datab(mac_out_datab),
                                         .datac(mac_out_datac),
                                         .datad(mac_out_datad),
                                         .mode0(mode0_pipreg_out),
                                         .mode1(mode1_pipreg_out),
                                         .roundab(round0_pipreg_out),
                                         .saturateab(saturate_pipreg_out),
                                         .roundcd(round1_pipreg_out),
                                         .saturatecd(saturate1_pipreg_out),
                                         .multabsaturate(multabsaturate_pipreg_out),
                                         .multcdsaturate(multcdsaturate_pipreg_out),
                                         .signa(signa_pipreg_out),
                                         .signb(signb_pipreg_out),
                                         .addnsub0(addnsub0_pipreg_out),
                                         .addnsub1(addnsub1_pipreg_out),
                                         .zeroacc(zeroacc_pipreg_out),
                                         .zeroacc1(zeroacc1_pipreg_out),
                                         .feedback(mac_out_feedback),
                                         .dataout(mac_out_dataout),
                                         .accoverflow(mac_out_accoverflow)
                                        );
defparam  mac_out_block.operation_mode = operation_mode;
defparam  mac_out_block.dataa_width = dataa_width;
defparam  mac_out_block.datab_width = datab_width;
defparam  mac_out_block.datac_width = datac_width;
defparam  mac_out_block.datad_width = datad_width;
assign    mac_out_dataa = (dataa_forced_to_zero == "yes") ? 36'b0 : dataa;
assign    mac_out_datac = (datac_forced_to_zero == "yes") ? 36'b0 : datac;
assign mac_out_datab = datab;
assign mac_out_datad = datad;
   //Instantiate the output register
stratixiigx_mac_register  output_register(
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
stratixiigx_mac_register  accoverflow_register(
                                              .datain(mac_out_accoverflow),
                                              .clk(outreg_clk),
                                              .aclr(outreg_aclr),
                                              .ena(outreg_ena),
                                              .bypass_register(outreg_bypass_register),
                                              .dataout(accoverflow)
                                             );
defparam accoverflow_register.data_width = 1;
      //Instantiate the output register1
stratixiigx_mac_register  output_register1(
                                         .datain(mac_out_dataout[35:18]),
                                         .clk(outreg1_clk),
                                         .aclr(outreg1_aclr),
                                         .ena(outreg1_ena),
                                         .bypass_register(outreg1_bypass_register),
                                         .dataout(outreg1_dataout)
                                         );
defparam output_register1.data_width = 18;
      //decode the clk and aclr values
assign outreg1_clk_value =((output1_clock== "0") || (output1_clock== "none")) ? 4'b0000 :
                           (output1_clock== "1") ? 4'b0001 :
                           (output1_clock== "2") ? 4'b0010 :
                           (output1_clock== "3") ? 4'b0011 : 4'b0000;
assign   outreg1_aclr_value = ((output1_clear == "0") ||(output1_clear == "none")) ? 4'b0000 :
                              (output1_clear == "1") ? 4'b0001 :
                              (output1_clear == "2") ? 4'b0010 :
                              (output1_clear == "3") ? 4'b0011 : 4'b0000;
        //assign the corresponding clk,aclr,enable and bypass register values.
assign outreg1_clk = clk[outreg1_clk_value] ? 'b1 : 'b0;
assign outreg1_aclr = aclr[outreg1_aclr_value] || ~devclrn || ~devpor   ? 'b1 : 'b0;
assign outreg1_ena = ena[outreg1_clk_value] ? 'b1 : 'b0;
assign outreg1_bypass_register = (output1_clock== "none") ? 'b1 : 'b0;
        //Instantiate the output register2
stratixiigx_mac_register  output_register2(
                                         .datain(mac_out_dataout[53:36]),
                                         .clk(outreg2_clk),
                                         .aclr(outreg2_aclr),
                                         .ena(outreg2_ena),
                                         .bypass_register(outreg2_bypass_register),
                                         .dataout(outreg2_dataout)
                                        );
defparam output_register2.data_width = 18;
      //decode the clk and aclr values
assign outreg2_clk_value =((output2_clock== "0") || (output2_clock== "none")) ? 4'b0000 :
                          (output2_clock== "1") ? 4'b0001 :
                          (output2_clock== "2") ? 4'b0010 :
                          (output2_clock== "3") ? 4'b0011 : 4'b0000;
assign   outreg2_aclr_value = ((output2_clear == "0") ||(output2_clear == "none")) ? 4'b0000 :
                              (output2_clear == "1") ? 4'b0001 :
                              (output2_clear == "2") ? 4'b0010 :
                              (output2_clear == "3") ? 4'b0011 : 4'b0000;
        //assign the corresponding clk,aclr,enable and bypass register values.
assign outreg2_clk = clk[outreg2_clk_value] ? 'b1 : 'b0;
assign outreg2_aclr = aclr[outreg2_aclr_value] || ~devclrn || ~devpor   ? 'b1 : 'b0;
assign outreg2_ena = ena[outreg2_clk_value] ? 'b1 : 'b0;
assign outreg2_bypass_register = (output2_clock== "none") ? 'b1 : 'b0;
         //Instantiate the output register3
stratixiigx_mac_register  output_register3(
                                         .datain(mac_out_dataout[71:54]),
                                         .clk(outreg3_clk),
                                         .aclr(outreg3_aclr),
                                         .ena(outreg3_ena),
                                         .bypass_register(outreg3_bypass_register),
                                         .dataout(outreg3_dataout)
                                       );
defparam output_register3.data_width = 18;
      //decode the clk and aclr values
assign outreg3_clk_value =((output3_clock== "0") || (output3_clock== "none")) ? 4'b0000 :
                           (output3_clock== "1") ? 4'b0001 :
                           (output3_clock== "2") ? 4'b0010 :
                           (output3_clock== "3") ? 4'b0011 : 4'b0000;
assign   outreg3_aclr_value = ((output3_clear == "0") ||(output3_clear == "none")) ? 4'b0000 :
                              (output3_clear == "1") ? 4'b0001 :
                              (output3_clear == "2") ? 4'b0010 :
                              (output3_clear == "3") ? 4'b0011 : 4'b0000;
        //assign the corresponding clk,aclr,enable and bypass register values.
assign outreg3_clk = clk[outreg3_clk_value] ? 'b1 : 'b0;
assign outreg3_aclr = aclr[outreg3_aclr_value] || ~devclrn || ~devpor   ? 'b1 : 'b0;
assign outreg3_ena = ena[outreg3_clk_value] ? 'b1 : 'b0;
assign outreg3_bypass_register = (output3_clock== "none") ? 'b1 : 'b0;
         //Instantiate the output register4
stratixiigx_mac_register  output_register4(
                                        .datain(mac_out_dataout[89:72]),
                                        .clk(outreg4_clk),
                                        .aclr(outreg4_aclr),
                                        .ena(outreg4_ena),
                                        .bypass_register(outreg4_bypass_register),
                                        .dataout(outreg4_dataout)
                                       );
defparam output_register4.data_width = 18;
      //decode the clk and aclr values
assign outreg4_clk_value =((output4_clock== "0") || (output4_clock== "none")) ? 4'b0000 :
                          (output4_clock== "1") ? 4'b0001 :
                          (output4_clock== "2") ? 4'b0010 :
                          (output4_clock== "3") ? 4'b0011 : 4'b0000;
assign   outreg4_aclr_value = ((output4_clear == "0") ||(output4_clear == "none")) ? 4'b0000 :
                              (output4_clear == "1") ? 4'b0001 :
                              (output4_clear == "2") ? 4'b0010 :
                              (output4_clear == "3") ? 4'b0011 : 4'b0000;
        //assign the corresponding clk,aclr,enable and bypass register values.
assign outreg4_clk = clk[outreg4_clk_value] ? 'b1 : 'b0;
assign outreg4_aclr = aclr[outreg4_aclr_value] || ~devclrn || ~devpor   ? 'b1 : 'b0;
assign outreg4_ena = ena[outreg4_clk_value] ? 'b1 : 'b0;
assign outreg4_bypass_register = (output4_clock== "none") ? 'b1 : 'b0;
 //Instantiate the output register5
stratixiigx_mac_register  output_register5(
                                         .datain(mac_out_dataout[107:90]),
                                         .clk(outreg5_clk),
                                         .aclr(outreg5_aclr),
                                         .ena(outreg5_ena),
                                         .bypass_register(outreg5_bypass_register),
                                         .dataout(outreg5_dataout)
                                        );
defparam output_register5.data_width = 18;
      //decode the clk and aclr values
assign outreg5_clk_value =((output5_clock== "0") || (output5_clock== "none")) ? 4'b0000 :
                          (output5_clock== "1") ? 4'b0001 :
                          (output5_clock== "2") ? 4'b0010 :
                          (output5_clock== "3") ? 4'b0011 : 4'b0000;
assign   outreg5_aclr_value = ((output5_clear == "0") ||(output5_clear == "none")) ? 4'b0000 :
                               (output5_clear == "1") ? 4'b0001 :
                               (output5_clear == "2") ? 4'b0010 :
                               (output5_clear == "3") ? 4'b0011 : 4'b0000;
        //assign the corresponding clk,aclr,enable and bypass register values.
assign outreg5_clk = clk[outreg5_clk_value] ? 'b1 : 'b0;
assign outreg5_aclr = aclr[outreg5_aclr_value] || ~devclrn || ~devpor   ? 'b1 : 'b0;
assign outreg5_ena = ena[outreg5_clk_value] ? 'b1 : 'b0;
assign outreg5_bypass_register = (output5_clock== "none") ? 'b1 : 'b0;
        //Instantiate the output register6
stratixiigx_mac_register  output_register6(
                                         .datain(mac_out_dataout[125:108]),
                                         .clk(outreg6_clk),
                                         .aclr(outreg6_aclr),
                                         .ena(outreg6_ena),
                                         .bypass_register(outreg6_bypass_register),
                                         .dataout(outreg6_dataout)
                                       );
defparam output_register6.data_width = 18;
      //decode the clk and aclr values
assign outreg6_clk_value =((output6_clock== "0") || (output6_clock== "none")) ? 4'b0000 :
                          (output6_clock== "1") ? 4'b0001 :
                          (output6_clock== "2") ? 4'b0010 :
                          (output6_clock== "3") ? 4'b0011 : 4'b0000;
assign   outreg6_aclr_value = ((output6_clear == "0") ||(output6_clear == "none")) ? 4'b0000 :
                              (output6_clear == "1") ? 4'b0001 :
                              (output6_clear == "2") ? 4'b0010 :
                              (output6_clear == "3") ? 4'b0011 : 4'b0000;
        //assign the corresponding clk,aclr,enable and bypass register values.
assign outreg6_clk = clk[outreg6_clk_value] ? 'b1 : 'b0;
assign outreg6_aclr = aclr[outreg6_aclr_value] || ~devclrn || ~devpor   ? 'b1 : 'b0;
assign outreg6_ena = ena[outreg6_clk_value] ? 'b1 : 'b0;
assign outreg6_bypass_register = (output6_clock== "none") ? 'b1 : 'b0;
        //Instantiate the output register7
stratixiigx_mac_register  output_register7(
                                         .datain(mac_out_dataout[143:126]),
                                         .clk(outreg7_clk),
                                         .aclr(outreg7_aclr),
                                         .ena(outreg7_ena),
                                         .bypass_register(outreg7_bypass_register),
                                         .dataout(outreg7_dataout)
                                        );
defparam output_register7.data_width = 18;
      //decode the clk and aclr values
assign outreg7_clk_value =((output7_clock== "0") || (output7_clock== "none")) ? 4'b0000 :
                           (output7_clock== "1") ? 4'b0001 :
                           (output7_clock== "2") ? 4'b0010 :
                           (output7_clock== "3") ? 4'b0011 : 4'b0000;
assign   outreg7_aclr_value = ((output7_clear == "0") ||(output7_clear == "none")) ? 4'b0000 :
                              (output7_clear == "1") ? 4'b0001 :
                              (output7_clear == "2") ? 4'b0010 :
                              (output7_clear == "3") ? 4'b0011 : 4'b0000;
        //assign the corresponding clk,aclr,enable and bypass register values.
assign outreg7_clk = clk[outreg7_clk_value] ? 'b1 : 'b0;
assign outreg7_aclr = aclr[outreg7_aclr_value] || ~devclrn || ~devpor   ? 'b1 : 'b0;
assign outreg7_ena = ena[outreg7_clk_value] ? 'b1 : 'b0;
assign outreg7_bypass_register = (output7_clock== "none") ? 'b1 : 'b0;
    //assign the dynamic-mode output
assign dataout_dynamic = {outreg7_dataout,outreg6_dataout,outreg5_dataout,outreg4_dataout,
                               outreg3_dataout,outreg2_dataout,outreg1_dataout,outreg_dataout[17:0]};
    //assign the dataout depending on the mode of operation
assign dataout_tmp = (operation_mode == "dynamic") ? dataout_dynamic : outreg_dataout;
assign dataout = dataout_tmp;
    //assign the feedback for accumulator mode of operation
assign mac_out_feedback = dataout_tmp;
endmodule