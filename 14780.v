module stratix_mac_out
  (
   dataa,
   datab,
   datac,
   datad,
   zeroacc,
   addnsub0,
   addnsub1,
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
   parameter addnsub0_clock = "none";
   parameter addnsub1_clock = "none";
   parameter zeroacc_clock = "none";
   parameter signa_clock = "none";
   parameter signb_clock = "none";
   parameter output_clock = "none";
   parameter addnsub0_clear = "none";
   parameter addnsub1_clear = "none";
   parameter zeroacc_clear = "none";
   parameter signa_clear = "none";
   parameter signb_clear = "none";
   parameter output_clear = "none";
   parameter addnsub0_pipeline_clock = "none";
   parameter addnsub1_pipeline_clock = "none";
   parameter zeroacc_pipeline_clock = "none";
   parameter signa_pipeline_clock = "none";
   parameter signb_pipeline_clock = "none";
   parameter addnsub0_pipeline_clear = "none";
   parameter addnsub1_pipeline_clear = "none";
   parameter zeroacc_pipeline_clear = "none";
   parameter signa_pipeline_clear = "none";
   parameter signb_pipeline_clear = "none";
   parameter lpm_hint           = "true";
   parameter lpm_type           = "stratix_mac_out";
// SIMULATION_ONLY_PARAMETERS_BEGIN
   parameter dataout_width = (dataa_width > datab_width ? dataa_width : datab_width)
                                + (datac_width > datad_width ? datac_width : datad_width);
   parameter overflow_programmable_invert = 1'b0;
   parameter data_out_programmable_invert = 72'b0;
// SIMULATION_ONLY_PARAMETERS_END
   input [dataa_width-1:0] dataa;
   input [datab_width-1:0] datab;
   input [datac_width-1:0] datac;
   input [datad_width-1:0] datad;
   input 	zeroacc;
   input 	addnsub0;
   input 	addnsub1;
   input 	signa;
   input 	signb;
   input [3:0] 	clk;
   input [3:0] 	aclr;
   input [3:0] 	ena;
   input 	devclrn;
   input 	devpor;
   output [dataout_width-1:0] dataout;
   output 	 accoverflow;
   tri1 devclrn;
   tri1 devpor;
   wire [71:0] 	 signa_pipe;
   wire [71:0] 	 signb_pipe;
   wire [71:0] 	 signa_out;
   wire [71:0] 	 signb_out;
   wire [71:0] 	 addnsub0_pipe;
   wire [71:0] 	 addnsub1_pipe;
   wire [71:0] 	 addnsub0_out;
   wire [71:0] 	 addnsub1_out;
   wire [71:0] 	 zeroacc_pipe;
   wire [71:0] 	 zeroacc_out;
   wire [71:0] 	 dataout_wire;
   wire 	 accoverflow_wire;
   wire [71:0] 	 dataout_tmp;
   wire [71:0] 	 accoverflow_tmp;
   stratix_mac_register	signa_mac_reg
      (
       .data ({{(71){1'b0}},signa}),
       .clk (clk[select_the(signa_clock)]),
       .aclr (aclr[select_the(signa_clear)] || ~devclrn || ~devpor),
       .if_aclr ((signa_clear != "none") ? 1'b1 : 1'b0),
       .ena (ena[select_the(signa_clock)]),
       .dataout (signa_pipe),
       .async ((signa_clock == "none") ? 1'b1 : 1'b0 )
       );
   defparam signa_mac_reg.data_width = 1;
   defparam signa_mac_reg.power_up = 1'b0;
   stratix_mac_register	signb_mac_reg
      (
       .data ({{(71){1'b0}},signb}),
       .clk (clk[select_the(signb_clock)]),
       .aclr (aclr[select_the(signb_clear)] || ~devclrn || ~devpor),
       .if_aclr ((signb_clear != "none") ? 1'b1 : 1'b0),
       .ena (ena[select_the(signb_clock)]),
       .dataout (signb_pipe),
       .async ((signb_clock == "none") ? 1'b1 : 1'b0 )
       );
   defparam signb_mac_reg.data_width = 1;
   defparam signb_mac_reg.power_up = 1'b0;
   stratix_mac_register	zeroacc_mac_reg
      (
       .data ({{(71){1'b0}},zeroacc}),
       .clk (clk[select_the(zeroacc_clock)]),
       .aclr (aclr[select_the(zeroacc_clear)] || ~devclrn || ~devpor),
       .if_aclr ((zeroacc_clear != "none") ? 1'b1 : 1'b0),
       .ena (ena[select_the(zeroacc_clock)]),
       .dataout (zeroacc_pipe),
       .async ((zeroacc_clock == "none") ? 1'b1 : 1'b0 )
       );
   defparam zeroacc_mac_reg.data_width = 1;
   defparam zeroacc_mac_reg.power_up = 1'b0;
   stratix_mac_register	addnsub0_mac_reg
      (
       .data ({{(71){1'b0}},addnsub0}),
       .clk (clk[select_the(addnsub0_clock)]),
       .aclr (aclr[select_the(addnsub0_clear)] || ~devclrn || ~devpor),
       .if_aclr ((addnsub0_clear != "none") ? 1'b1 : 1'b0),
       .ena (ena[select_the(addnsub0_clock)]),
       .dataout (addnsub0_pipe),
       .async ((addnsub0_clock == "none") ? 1'b1 : 1'b0 )
       );
   defparam addnsub0_mac_reg.data_width = 1;
   defparam addnsub0_mac_reg.power_up = 1'b0;
   stratix_mac_register	addnsub1_mac_reg
      (
       .data ({{(71){1'b0}},addnsub1}),
       .clk (clk[select_the(addnsub1_clock)]),
       .aclr (aclr[select_the(addnsub1_clear)] || ~devclrn || ~devpor),
       .if_aclr ((addnsub1_clear != "none") ? 1'b1 : 1'b0),
       .ena (ena[select_the(addnsub1_clock)]),
       .dataout (addnsub1_pipe),
       .async ((addnsub1_clock == "none") ? 1'b1 : 1'b0 )
       );
   defparam addnsub1_mac_reg.data_width = 1;
   defparam addnsub1_mac_reg.power_up = 1'b0;
   stratix_mac_register	signa_mac_pipeline_reg
      (
       .data (signa_pipe),
       .clk (clk[select_the(signa_pipeline_clock)]),
       .aclr (aclr[select_the(signa_pipeline_clear)] || ~devclrn || ~devpor),
       .if_aclr ((signa_pipeline_clear != "none") ? 1'b1 : 1'b0 ),
       .ena (ena[select_the(signa_pipeline_clock)]),
       .dataout (signa_out),
       .async ((signa_pipeline_clock == "none") ? 1'b1 : 1'b0 )
       );
   defparam signa_mac_pipeline_reg.data_width = 1;
   defparam signa_mac_pipeline_reg.power_up = 1'b0;
   stratix_mac_register	signb_mac_pipeline_reg
      (
       .data (signb_pipe),
       .clk (clk[select_the(signb_pipeline_clock)]),
       .aclr (aclr[select_the(signb_pipeline_clear)] || ~devclrn || ~devpor),
       .if_aclr ((signb_pipeline_clear != "none") ? 1'b1 : 1'b0 ),
       .ena (ena[select_the(signb_pipeline_clock)]),
       .dataout (signb_out),
       .async ((signb_pipeline_clock == "none") ? 1'b1 : 1'b0 )
       );
   defparam signb_mac_pipeline_reg.data_width = 1;
   defparam signb_mac_pipeline_reg.power_up = 1'b0;
   stratix_mac_register	zeroacc_mac_pipeline_reg
      (
       .data (zeroacc_pipe),
       .clk (clk[select_the(zeroacc_pipeline_clock)]),
       .aclr (aclr[select_the(zeroacc_pipeline_clear)] || ~devclrn || ~devpor),
       .if_aclr ((zeroacc_pipeline_clear != "none") ? 1'b1 : 1'b0 ),
       .ena (ena[select_the(zeroacc_pipeline_clock)]),
       .dataout (zeroacc_out),
       .async ((zeroacc_pipeline_clock == "none") ? 1'b1 : 1'b0 )
       );
   defparam zeroacc_mac_pipeline_reg.data_width = 1;
   defparam zeroacc_mac_pipeline_reg.power_up = 1'b0;
   stratix_mac_register	addnsub0_mac_pipeline_reg
      (
       .data (addnsub0_pipe),
       .clk (clk[select_the(addnsub0_pipeline_clock)]),
       .aclr (aclr[select_the(addnsub0_pipeline_clear)] || ~devclrn || ~devpor),
       .if_aclr ((addnsub0_pipeline_clear != "none") ? 1'b1 : 1'b0 ),
       .ena (ena[select_the(addnsub0_pipeline_clock)]),
       .dataout (addnsub0_out),
       .async ((addnsub0_pipeline_clock == "none") ? 1'b1 : 1'b0 )
       );
   defparam addnsub0_mac_pipeline_reg.data_width = 1;
   defparam addnsub0_mac_pipeline_reg.power_up = 1'b0;
   stratix_mac_register	addnsub1_mac_pipeline_reg
      (
       .data (addnsub1_pipe),
       .clk (clk[select_the(addnsub1_pipeline_clock)]),
       .aclr (aclr[select_the(addnsub1_pipeline_clear)] || ~devclrn || ~devpor),
       .if_aclr ((addnsub1_pipeline_clear != "none") ? 1'b1 : 1'b0 ),
       .ena (ena[select_the(addnsub1_pipeline_clock)]),
       .dataout (addnsub1_out),
       .async ((addnsub1_pipeline_clock == "none") ? 1'b1 : 1'b0 )
       );
   defparam addnsub1_mac_pipeline_reg.data_width = 1;
   defparam addnsub1_mac_pipeline_reg.power_up = 1'b0;
   stratix_mac_out_internal mac_adder
      (
       .dataa ({{37-dataa_width{1'bz}},dataa}),
       .datab ({{37-datab_width{1'bz}},datab}),
       .datac ({{37-datac_width{1'bz}},datac}),
       .datad ({{37-datad_width{1'bz}},datad}),
       .signx (signa_out[0]),
       .signy (signb_out[0]),
       .addnsub0 (addnsub0_out[0]),
       .addnsub1 (addnsub1_out[0]),
       .zeroacc (zeroacc_out[0]),
       .dataout_global (dataout_tmp[71:0]),
       .dataout (dataout_wire[71:0]),
       .accoverflow (accoverflow_wire)
       );
   defparam mac_adder.dataa_width = dataa_width;
   defparam mac_adder.datab_width = datab_width;
   defparam mac_adder.datac_width = datac_width;
   defparam mac_adder.datad_width = datad_width;
   defparam mac_adder.dataout_width = dataout_width;
   defparam mac_adder.operation_mode = operation_mode;
   stratix_mac_register	dataout_out_reg
      (
       .data (dataout_wire),
       .clk (clk[select_the(output_clock)]),
       .aclr (aclr[select_the(output_clear)] || ~devclrn || ~devpor),
       .if_aclr ((output_clear != "none") ? 1'b1 : 1'b0 ),
       .ena (ena[select_the(output_clock)]),
       .dataout (dataout_tmp),
       .async ((output_clock == "none") ? 1'b1 : 1'b0 )
       );
   defparam dataout_out_reg.data_width = dataout_width;
   defparam dataout_out_reg.power_up = 1'b0;
   stratix_mac_register	accoverflow_out_reg
      (
       .data ({{(71){1'b0}},accoverflow_wire}),
       .clk (clk[select_the(output_clock)]),
       .aclr (aclr[select_the(output_clear)] || ~devclrn || ~devpor),
       .if_aclr ((output_clear != "none") ? 1'b1 : 1'b0 ),
       .ena (ena[select_the(output_clock)]),
       .dataout (accoverflow_tmp),
       .async ((output_clock == "none") ? 1'b1 : 1'b0 )
       );
   defparam accoverflow_out_reg.data_width = 1;
   defparam accoverflow_out_reg.power_up = 1'b0;
   assign   dataout = dataout_tmp ^ data_out_programmable_invert;
   assign   accoverflow = accoverflow_tmp[0] ^ overflow_programmable_invert;
//                                   SELECT_THE
   function integer select_the;
      input [8*4:1] string_name;
      begin
	 if (string_name == "0")
	   select_the = 0;
	 else if (string_name == "1")
	   select_the = 1;
	 else if (string_name == "2")
	   select_the = 2;
	 else if (string_name == "3")
	   select_the = 3;
	 else if (string_name == "none")
	   select_the = 0;
      end
   endfunction
endmodule