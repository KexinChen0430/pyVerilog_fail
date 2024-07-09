module hardcopyiii_mac_out(
                     dataa,
                     datab,
                     datac,
                     datad,
                     signa,
                     signb,
                     chainin,
                     round,
                     saturate,
                     zeroacc,
                     roundchainout,
                     saturatechainout,
                     zerochainout,
                     zeroloopback,
                     rotate,
                     shiftright,
                     clk,
                     ena,
                     aclr,
                     loopbackout,
                     dataout,
                     overflow,
                     dftout,
                     saturatechainoutoverflow,
                     devpor,
                     devclrn
                    );
//Parameter declaration
parameter operation_mode = "output_only";
parameter dataa_width = 1;
parameter datab_width = 1;
parameter datac_width = 1;
parameter datad_width = 1;
parameter chainin_width = 1;
parameter round_width = 15;
parameter round_chain_out_width = 15;
parameter saturate_width = 15;
parameter saturate_chain_out_width = 15;
parameter first_adder0_clock = "none";
parameter first_adder0_clear = "none";
parameter first_adder1_clock = "none";
parameter first_adder1_clear = "none";
parameter second_adder_clock = "none";
parameter second_adder_clear = "none";
parameter output_clock = "none";
parameter output_clear = "none";
parameter signa_clock = "none";
parameter signa_clear = "none";
parameter signb_clock = "none";
parameter signb_clear = "none";
parameter round_clock = "none";
parameter round_clear = "none";
parameter roundchainout_clock = "none";
parameter roundchainout_clear = "none";
parameter saturate_clock = "none";
parameter saturate_clear = "none";
parameter saturatechainout_clock = "none";
parameter saturatechainout_clear = "none";
parameter zeroacc_clock = "none";
parameter zeroacc_clear = "none";
parameter zeroloopback_clock = "none";
parameter zeroloopback_clear = "none";
parameter rotate_clock = "none";
parameter rotate_clear = "none";
parameter shiftright_clock = "none";
parameter shiftright_clear = "none";
parameter signa_pipeline_clock = "none";
parameter signa_pipeline_clear = "none";
parameter signb_pipeline_clock = "none";
parameter signb_pipeline_clear = "none";
parameter round_pipeline_clock = "none";
parameter round_pipeline_clear = "none";
parameter roundchainout_pipeline_clock = "none";
parameter roundchainout_pipeline_clear = "none";
parameter saturate_pipeline_clock = "none";
parameter saturate_pipeline_clear = "none";
parameter saturatechainout_pipeline_clock = "none";
parameter saturatechainout_pipeline_clear = "none";
parameter zeroacc_pipeline_clock = "none";
parameter zeroacc_pipeline_clear = "none";
parameter zeroloopback_pipeline_clock = "none";
parameter zeroloopback_pipeline_clear = "none";
parameter rotate_pipeline_clock = "none";
parameter rotate_pipeline_clear = "none";
parameter shiftright_pipeline_clock = "none";
parameter shiftright_pipeline_clear = "none";
parameter roundchainout_output_clock = "none";
parameter roundchainout_output_clear = "none";
parameter saturatechainout_output_clock = "none";
parameter saturatechainout_output_clear = "none";
parameter zerochainout_output_clock = "none";
parameter zerochainout_output_clear = "none";
parameter zeroloopback_output_clock = "none";
parameter zeroloopback_output_clear = "none";
parameter rotate_output_clock = "none";
parameter rotate_output_clear = "none";
parameter shiftright_output_clock = "none";
parameter shiftright_output_clear = "none";
parameter first_adder0_mode = "add";
parameter first_adder1_mode = "add";
parameter acc_adder_operation = "add";
parameter round_mode = "nearest_integer";
parameter round_chain_out_mode = "nearest_integer";
parameter saturate_mode = "asymmetric";
parameter saturate_chain_out_mode = "asymmetric";
// SIMULATION_ONLY_PARAMETERS_BEGIN
parameter multa_signa_internally_grounded = "false";
parameter multa_signb_internally_grounded = "false";
parameter multb_signa_internally_grounded = "false";
parameter multb_signb_internally_grounded = "false";
parameter multc_signa_internally_grounded = "false";
parameter multc_signb_internally_grounded = "false";
parameter multd_signa_internally_grounded = "false";
parameter multd_signb_internally_grounded = "false";
// SIMULATION_ONLY_PARAMETERS_END
parameter lpm_type = "hardcopyiii_mac_out";
// SIMULATION_ONLY_PARAMETERS_BEGIN
parameter dataout_width = 72;
// SIMULATION_ONLY_PARAMETERS_END
input [dataa_width -1 :0] dataa;
input [datab_width -1 :0] datab;
input [datac_width -1 :0] datac;
input [datad_width -1 :0] datad;
input signa;
input signb;
input [chainin_width -1 : 0] chainin;
input round;
input saturate;
input roundchainout;
input saturatechainout;
input zeroacc;
input zerochainout;
input zeroloopback;
input rotate;
input shiftright;
input [3:0] clk;
input [3:0] aclr;
input [3:0] ena;
input devpor;
input devclrn;
output [17:0] loopbackout;
output [71:0] dataout;
output overflow;
output saturatechainoutoverflow;
output dftout;
tri1 devclrn;
tri1 devpor;
//signals for zeroloopback input register
wire [3:0] zeroloopback_clkval_ir;
wire [3:0] zeroloopback_aclrval_ir;
wire zeroloopback_clk_ir;
wire zeroloopback_aclr_ir;
wire zeroloopback_sload_ir;
wire zeroloopback_bypass_register_ir;
wire zeroloopback_in_reg;
//signals for zeroacc input register
wire [3:0] zeroacc_clkval_ir;
wire [3:0] zeroacc_aclrval_ir;
wire zeroacc_clk_ir;
wire zeroacc_aclr_ir;
wire zeroacc_sload_ir;
wire zeroacc_bypass_register_ir;
wire zeroacc_in_reg;
//Signals for signa input register
wire [3:0] signa_clkval_ir;
wire [3:0] signa_aclrval_ir;
wire signa_clk_ir;
wire signa_aclr_ir;
wire signa_sload_ir;
wire signa_bypass_register_ir;
wire signa_in_reg;
//signals for signb input register
wire [3:0] signb_clkval_ir;
wire [3:0] signb_aclrval_ir;
wire signb_clk_ir;
wire signb_aclr_ir;
wire signb_sload_ir;
wire signb_bypass_register_ir;
wire signb_in_reg;
//signals for rotate input register
wire [3:0] rotate_clkval_ir;
wire [3:0] rotate_aclrval_ir;
wire rotate_clk_ir;
wire rotate_aclr_ir;
wire rotate_sload_ir;
wire rotate_bypass_register_ir;
wire rotate_in_reg;
//signals for shiftright input register
wire [3:0] shiftright_clkval_ir;
wire [3:0] shiftright_aclrval_ir;
wire shiftright_clk_ir;
wire shiftright_aclr_ir;
wire shiftright_sload_ir;
wire shiftright_bypass_register_ir;
wire shiftright_in_reg;
//signals for round input register
wire [3:0] round_clkval_ir;
wire [3:0] round_aclrval_ir;
wire round_clk_ir;
wire round_aclr_ir;
wire round_sload_ir;
wire round_bypass_register_ir;
wire round_in_reg;
//signals for saturate input register
wire [3:0] saturate_clkval_ir;
wire [3:0] saturate_aclrval_ir;
wire saturate_clk_ir;
wire saturate_aclr_ir;
wire saturate_sload_ir;
wire saturate_bypass_register_ir;
wire saturate_in_reg;
//signals for roundchainout input register
wire [3:0] roundchainout_clkval_ir;
wire [3:0] roundchainout_aclrval_ir;
wire roundchainout_clk_ir;
wire roundchainout_aclr_ir;
wire roundchainout_sload_ir;
wire roundchainout_bypass_register_ir;
wire roundchainout_in_reg;
//signals for saturatechainout input register
wire [3:0] saturatechainout_clkval_ir;
wire [3:0] saturatechainout_aclrval_ir;
wire saturatechainout_clk_ir;
wire saturatechainout_aclr_ir;
wire saturatechainout_sload_ir;
wire saturatechainout_bypass_register_ir;
wire saturatechainout_in_reg;
//signals for fsa_input_interface
wire [71:0] dataa_fsa_in;
wire [71:0] datab_fsa_in;
wire [71:0] datac_fsa_in;
wire [71:0] datad_fsa_in;
wire [71:0] chainin_coa_in;
wire sign;
wire [3:0]operation;
//Signals for First Stage Adder units
wire [71:0] dataout_fsa0;
wire [71:0] fsa_pip_datain1;
wire [71:0] dataout_fsa1;
wire overflow_fsa0;
wire overflow_fsa1;
//signals for zeroloopback pipeline register
wire [3:0] zeroloopback_clkval_pip;
wire [3:0] zeroloopback_aclrval_pip;
wire zeroloopback_clk_pip;
wire zeroloopback_aclr_pip;
wire zeroloopback_sload_pip;
wire zeroloopback_bypass_register_pip;
wire zeroloopback_pip_reg;
//signals for zeroacc pipeline register
wire [3:0] zeroacc_clkval_pip;
wire [3:0] zeroacc_aclrval_pip;
wire zeroacc_clk_pip;
wire zeroacc_aclr_pip;
wire zeroacc_sload_pip;
wire zeroacc_bypass_register_pip;
wire zeroacc_pip_reg;
//Signals for signa pipeline register
wire [3:0] signa_clkval_pip;
wire [3:0] signa_aclrval_pip;
wire signa_clk_pip;
wire signa_aclr_pip;
wire signa_sload_pip;
wire signa_bypass_register_pip;
wire signa_pip_reg;
//signals for signb pipeline register
wire [3:0] signb_clkval_pip;
wire [3:0] signb_aclrval_pip;
wire signb_clk_pip;
wire signb_aclr_pip;
wire signb_sload_pip;
wire signb_bypass_register_pip;
wire signb_pip_reg;
//signals for rotate pipeline register
wire [3:0] rotate_clkval_pip;
wire [3:0] rotate_aclrval_pip;
wire rotate_clk_pip;
wire rotate_aclr_pip;
wire rotate_sload_pip;
wire rotate_bypass_register_pip;
wire rotate_pip_reg;
//signals for shiftright pipeline register
wire [3:0] shiftright_clkval_pip;
wire [3:0] shiftright_aclrval_pip;
wire shiftright_clk_pip;
wire shiftright_aclr_pip;
wire shiftright_sload_pip;
wire shiftright_bypass_register_pip;
wire shiftright_pip_reg;
//signals for round pipeline register
wire [3:0] round_clkval_pip;
wire [3:0] round_aclrval_pip;
wire round_clk_pip;
wire round_aclr_pip;
wire round_sload_pip;
wire round_bypass_register_pip;
wire round_pip_reg;
//signals for saturate pipeline register
wire [3:0] saturate_clkval_pip;
wire [3:0] saturate_aclrval_pip;
wire saturate_clk_pip;
wire saturate_aclr_pip;
wire saturate_sload_pip;
wire saturate_bypass_register_pip;
wire saturate_pip_reg;
//signals for roundchainout pipeline register
wire [3:0] roundchainout_clkval_pip;
wire [3:0] roundchainout_aclrval_pip;
wire roundchainout_clk_pip;
wire roundchainout_aclr_pip;
wire roundchainout_sload_pip;
wire roundchainout_bypass_register_pip;
wire roundchainout_pip_reg;
//signals for saturatechainout pipeline register
wire [3:0] saturatechainout_clkval_pip;
wire [3:0] saturatechainout_aclrval_pip;
wire saturatechainout_clk_pip;
wire saturatechainout_aclr_pip;
wire saturatechainout_sload_pip;
wire saturatechainout_bypass_register_pip;
wire saturatechainout_pip_reg;
//signals for fsa0 pipeline register
wire [3:0] fsa0_clkval_pip;
wire [3:0] fsa0_aclrval_pip;
wire fsa0_clk_pip;
wire fsa0_aclr_pip;
wire fsa0_sload_pip;
wire fsa0_bypass_register_pip;
wire[71:0] fsa0_pip_reg;
//signals for fsa1 pipeline register
wire [3:0] fsa1_clkval_pip;
wire [3:0] fsa1_aclrval_pip;
wire fsa1_clk_pip;
wire fsa1_aclr_pip;
wire fsa1_sload_pip;
wire fsa1_bypass_register_pip;
wire[71:0] fsa1_pip_reg;
//Signals for second stage adder
wire [71:0] ssa_accum_in;
wire ssa_sign;
wire [71:0] ssa_dataout;
wire ssa_overflow;
//Signals for RS block
wire[71:0] rs_datain;
wire [71:0] rs_dataout;
reg [71:0] rs_dataout_of;
wire [71:0] rs_dataout_tmp;
wire rs_saturation_overflow;
wire [7:0] ssa_datain_width;
wire [7:0] ssa_datain_width_tmp;
wire [3:0] ssa_round_width;
wire [7:0] ssa_fraction_width;
//signals for zeroloopback output register
wire [3:0] zeroloopback_clkval_or;
wire [3:0] zeroloopback_aclrval_or;
wire zeroloopback_clk_or;
wire zeroloopback_aclr_or;
wire zeroloopback_sload_or;
wire zeroloopback_bypass_register_or;
wire zeroloopback_out_reg;
//signals for zerochainout output register
wire [3:0] zerochainout_clkval_or;
wire [3:0] zerochainout_aclrval_or;
wire zerochainout_clk_or;
wire zerochainout_aclr_or;
wire zerochainout_sload_or;
wire zerochainout_bypass_register_or;
wire zerochainout_out_reg;
//Signals for saturation_overflow output register
wire [3:0] saturation_overflow_clkval_or;
wire [3:0] saturation_overflow_aclrval_or;
wire saturation_overflow_clk_or;
wire saturation_overflow_aclr_or;
wire saturation_overflow_sload_or;
wire saturation_overflow_bypass_register_or;
wire saturation_overflow_out_reg;
//signals for rs_dataout output register
wire [71:0] rs_dataout_in;
wire [3:0] rs_dataout_clkval_or;
wire [3:0] rs_dataout_aclrval_or;
wire [3:0] rs_dataout_clkval_or_co;
wire [3:0] rs_dataout_aclrval_or_co;
wire [3:0] rs_dataout_clkval_or_o;
wire [3:0] rs_dataout_aclrval_or_o;
wire rs_dataout_clk_or;
wire rs_dataout_aclr_or;
wire rs_dataout_sload_or;
wire rs_dataout_bypass_register_or;
wire rs_dataout_bypass_register_or_co;
wire rs_dataout_bypass_register_or_o;
wire[71:0] rs_dataout_out_reg;
wire rs_saturation_overflow_out_reg;
wire rs_saturation_overflow_in;
//signals for rotate output register
wire [3:0] rotate_clkval_or;
wire [3:0] rotate_aclrval_or;
wire rotate_clk_or;
wire rotate_aclr_or;
wire rotate_sload_or;
wire rotate_bypass_register_or;
wire rotate_out_reg;
//signals for shiftright output register
wire [3:0] shiftright_clkval_or;
wire [3:0] shiftright_aclrval_or;
wire shiftright_clk_or;
wire shiftright_aclr_or;
wire shiftright_sload_or;
wire shiftright_bypass_register_or;
wire shiftright_out_reg;
//signals for roundchainout output register
wire [3:0] roundchainout_clkval_or;
wire [3:0] roundchainout_aclrval_or;
wire roundchainout_clk_or;
wire roundchainout_aclr_or;
wire roundchainout_sload_or;
wire roundchainout_bypass_register_or;
wire roundchainout_out_reg;
//signals for saturatechainout output register
wire [3:0] saturatechainout_clkval_or;
wire [3:0] saturatechainout_aclrval_or;
wire saturatechainout_clk_or;
wire saturatechainout_aclr_or;
wire saturatechainout_sload_or;
wire saturatechainout_bypass_register_or;
wire saturatechainout_out_reg;
//Signals for chainout Adder RS Block
wire [71:0] coa_dataout;
wire [7:0] coa_datain_width;
wire [3:0] coa_round_width;
wire [7:0] coa_fraction_width;
wire [71:0] coa_rs_dataout;
wire coa_rs_saturation_overflow;
//signals for control signals for COA output register
wire [3:0] coa_reg_clkval_or;
wire [3:0] coa_reg_aclrval_or;
wire coa_reg_clk_or;
wire coa_reg_aclr_or;
wire coa_reg_sload_or;
wire coa_reg_bypass_register_or;
wire coa_reg_out_reg;
wire coa_rs_saturation_overflow_out_reg;
wire coa_rs_saturationchainout_overflow_out_reg;
wire [71:0] coa_rs_dataout_out_reg;
wire [71:0] dataout_shift_rot ;
reg  [5:0] dataa_width_local;
wire [71:0] dataout_tmp;
wire [71:0] loopbackout_tmp;
always@(rs_dataout or rs_saturation_overflow or saturate_pip_reg)
begin
 rs_dataout_of = rs_dataout;
 rs_dataout_of[dataa_width -1] = (((operation_mode == "output_only")||(operation_mode == "one_level_adder") ||(operation_mode == "loopback"))
                       &&(dataa_width > 1) && (saturate_pip_reg == 1'b1))? rs_saturation_overflow : rs_dataout[dataa_width -1];
end
//Instantiate the zeroloopback input Register
hardcopyiii_mac_register zeroloopback_input_register (
                                                .datain(zeroloopback),
                                                .clk(zeroloopback_clk_ir),
                                                .aclr(zeroloopback_aclr_ir),
                                                .sload(zeroloopback_sload_ir),
                                                .bypass_register(zeroloopback_bypass_register_ir),
                                                .dataout(zeroloopback_in_reg)
                                              );
defparam zeroloopback_input_register.data_width = 1;
//decode the clk and aclr values
assign zeroloopback_clkval_ir = (zeroloopback_clock == "0") ? 4'b0000 :
                                  (zeroloopback_clock == "1") ? 4'b0001 :
                                  (zeroloopback_clock == "2") ? 4'b0010 :
                                  (zeroloopback_clock == "3") ? 4'b0011 : 4'b0000;
assign zeroloopback_aclrval_ir = (zeroloopback_clear == "0")  ? 4'b0000 :
                                  (zeroloopback_clear == "1") ? 4'b0001 :
                                  (zeroloopback_clear == "2") ? 4'b0010 :
                                  (zeroloopback_clear == "3") ? 4'b0011 : 4'b0000;
//assign the corresponding clk,aclr,enable and bypass register values.
assign zeroloopback_clk_ir = clk[zeroloopback_clkval_ir] ? 1'b1 : 1'b0;
assign zeroloopback_aclr_ir = aclr[zeroloopback_aclrval_ir] || ~devclrn || ~devpor   ? 1'b1 : 1'b0;
assign zeroloopback_sload_ir = ena[zeroloopback_clkval_ir] ? 1'b1 : 1'b0;
assign zeroloopback_bypass_register_ir = (zeroloopback_clock == "none") ? 1'b1 : 1'b0;
//Instantiate the zeroacc input Register
hardcopyiii_mac_register zeroacc_input_register (
                                           .datain(zeroacc),
                                           .clk(zeroacc_clk_ir),
                                           .aclr(zeroacc_aclr_ir),
                                           .sload(zeroacc_sload_ir),
                                           .bypass_register(zeroacc_bypass_register_ir),
                                           .dataout(zeroacc_in_reg)
                                          );
defparam zeroacc_input_register.data_width = 1;
//decode the clk and aclr values
assign zeroacc_clkval_ir =(zeroacc_clock == "0") ? 4'b0000 :
                            (zeroacc_clock == "1") ? 4'b0001 :
                            (zeroacc_clock == "2") ? 4'b0010 :
                            (zeroacc_clock == "3") ? 4'b0011 : 4'b0000;
assign zeroacc_aclrval_ir = (zeroacc_clear == "0")  ? 4'b0000 :
                             (zeroacc_clear == "1") ? 4'b0001 :
                             (zeroacc_clear == "2") ? 4'b0010 :
                             (zeroacc_clear == "3") ? 4'b0011 : 4'b0000;
//assign the corresponding clk,aclr,enable and bypass register values.
assign zeroacc_clk_ir = clk[zeroacc_clkval_ir] ? 1'b1 : 1'b0;
assign zeroacc_aclr_ir = aclr[zeroacc_aclrval_ir] || ~devclrn || ~devpor   ? 1'b1 : 1'b0;
assign zeroacc_sload_ir = ena[zeroacc_clkval_ir] ? 1'b1 : 1'b0;
assign zeroacc_bypass_register_ir = (zeroacc_clock == "none") ? 1'b1 : 1'b0;
//Instantiate the signa input Register
hardcopyiii_mac_register signa_input_register (
                                         .datain(signa),
                                         .clk(signa_clk_ir),
                                         .aclr(signa_aclr_ir),
                                         .sload(signa_sload_ir),
                                         .bypass_register(signa_bypass_register_ir),
                                         .dataout(signa_in_reg)
                                        );
defparam signa_input_register.data_width = 1;
//decode the clk and aclr values
assign signa_clkval_ir =(signa_clock == "0") ? 4'b0000 :
                          (signa_clock == "1") ? 4'b0001 :
                          (signa_clock == "2") ? 4'b0010 :
                          (signa_clock == "3") ? 4'b0011 : 4'b0000;
assign signa_aclrval_ir = (signa_clear == "0")  ? 4'b0000 :
                           (signa_clear == "1") ? 4'b0001 :
                           (signa_clear == "2") ? 4'b0010 :
                           (signa_clear == "3") ? 4'b0011 : 4'b0000;
//assign the corresponding clk,aclr,enable and bypass register values.
assign signa_clk_ir = clk[signa_clkval_ir] ? 1'b1 : 1'b0;
assign signa_aclr_ir = aclr[signa_aclrval_ir] || ~devclrn || ~devpor   ? 1'b1 : 1'b0;
assign signa_sload_ir = ena[signa_clkval_ir] ? 1'b1 : 1'b0;
assign signa_bypass_register_ir = (signa_clock == "none") ? 1'b1 : 1'b0;
//Instantiate the signb input Register
hardcopyiii_mac_register signb_input_register (
                                         .datain(signb),
                                         .clk(signb_clk_ir),
                                         .aclr(signb_aclr_ir),
                                         .sload(signb_sload_ir),
                                         .bypass_register(signb_bypass_register_ir),
                                         .dataout(signb_in_reg)
                                        );
defparam signb_input_register.data_width = 1;
//decode the clk and aclr values
assign signb_clkval_ir =(signb_clock == "0") ? 4'b0000 :
                          (signb_clock == "1") ? 4'b0001 :
                          (signb_clock == "2") ? 4'b0010 :
                          (signb_clock == "3") ? 4'b0011 : 4'b0000;
assign signb_aclrval_ir = (signb_clear == "0")  ? 4'b0000 :
                           (signb_clear == "1") ? 4'b0001 :
                           (signb_clear == "2") ? 4'b0010 :
                           (signb_clear == "3") ? 4'b0011 : 4'b0000;
//assign the corresponding clk,aclr,enable and bypass register values.
assign signb_clk_ir = clk[signb_clkval_ir] ? 1'b1 : 1'b0;
assign signb_aclr_ir = aclr[signb_aclrval_ir] || ~devclrn || ~devpor   ? 1'b1 : 1'b0;
assign signb_sload_ir = ena[signb_clkval_ir] ? 1'b1 : 1'b0;
assign signb_bypass_register_ir = (signb_clock == "none") ? 1'b1 : 1'b0;
//Instantiate the rotate input Register
hardcopyiii_mac_register rotate_input_register (
                                         .datain(rotate),
                                         .clk(rotate_clk_ir),
                                         .aclr(rotate_aclr_ir),
                                         .sload(rotate_sload_ir),
                                         .bypass_register(rotate_bypass_register_ir),
                                         .dataout(rotate_in_reg)
                                        );
defparam rotate_input_register.data_width = 1;
//decode the clk and aclr values
assign rotate_clkval_ir =(rotate_clock == "0") ? 4'b0000 :
                          (rotate_clock == "1") ? 4'b0001 :
                          (rotate_clock == "2") ? 4'b0010 :
                          (rotate_clock == "3") ? 4'b0011 : 4'b0000;
assign rotate_aclrval_ir = (rotate_clear == "0")  ? 4'b0000 :
                           (rotate_clear == "1") ? 4'b0001 :
                           (rotate_clear == "2") ? 4'b0010 :
                           (rotate_clear == "3") ? 4'b0011 : 4'b0000;
//assign the corresponding clk,aclr,enable and bypass register values.
assign rotate_clk_ir = clk[rotate_clkval_ir] ? 1'b1 : 1'b0;
assign rotate_aclr_ir = aclr[rotate_aclrval_ir] || ~devclrn || ~devpor   ? 1'b1 : 1'b0;
assign rotate_sload_ir = ena[rotate_clkval_ir] ? 1'b1 : 1'b0;
assign rotate_bypass_register_ir = (rotate_clock == "none") ? 1'b1 : 1'b0;
//Instantiate the shiftright input Register
hardcopyiii_mac_register shiftright_input_register (
                                              .datain(shiftright),
                                              .clk(shiftright_clk_ir),
                                              .aclr(shiftright_aclr_ir),
                                              .sload(shiftright_sload_ir),
                                              .bypass_register(shiftright_bypass_register_ir),
                                              .dataout(shiftright_in_reg)
                                             );
defparam shiftright_input_register.data_width = 1;
//decode the clk and aclr values
assign shiftright_clkval_ir =(shiftright_clock == "0") ? 4'b0000 :
                               (shiftright_clock == "1") ? 4'b0001 :
                               (shiftright_clock == "2") ? 4'b0010 :
                               (shiftright_clock == "3") ? 4'b0011 : 4'b0000;
assign shiftright_aclrval_ir = (shiftright_clear == "0")  ? 4'b0000 :
                                (shiftright_clear == "1") ? 4'b0001 :
                                (shiftright_clear == "2") ? 4'b0010 :
                                (shiftright_clear == "3") ? 4'b0011 : 4'b0000;
//assign the corresponding clk,aclr,enable and bypass register values.
assign shiftright_clk_ir = clk[shiftright_clkval_ir] ? 1'b1 : 1'b0;
assign shiftright_aclr_ir = aclr[shiftright_aclrval_ir] || ~devclrn || ~devpor   ? 1'b1 : 1'b0;
assign shiftright_sload_ir = ena[shiftright_clkval_ir] ? 1'b1 : 1'b0;
assign shiftright_bypass_register_ir = (shiftright_clock == "none") ? 1'b1 : 1'b0;
//Instantiate the round input Register
hardcopyiii_mac_register round_input_register (
                                         .datain(round),
                                         .clk(round_clk_ir),
                                         .aclr(round_aclr_ir),
                                         .sload(round_sload_ir),
                                         .bypass_register(round_bypass_register_ir),
                                         .dataout(round_in_reg)
                                        );
defparam round_input_register.data_width = 1;
//decode the clk and aclr values
assign round_clkval_ir =(round_clock == "0") ? 4'b0000 :
                          (round_clock == "1") ? 4'b0001 :
                          (round_clock == "2") ? 4'b0010 :
                          (round_clock == "3") ? 4'b0011 : 4'b0000;
assign round_aclrval_ir = (round_clear == "0")  ? 4'b0000 :
                           (round_clear == "1") ? 4'b0001 :
                           (round_clear == "2") ? 4'b0010 :
                           (round_clear == "3") ? 4'b0011 : 4'b0000;
//assign the corresponding clk,aclr,enable and bypass register values.
assign round_clk_ir = clk[round_clkval_ir] ? 1'b1 : 1'b0;
assign round_aclr_ir = aclr[round_aclrval_ir] || ~devclrn || ~devpor   ? 1'b1 : 1'b0;
assign round_sload_ir = ena[round_clkval_ir] ? 1'b1 : 1'b0;
assign round_bypass_register_ir = (round_clock == "none") ? 1'b1 : 1'b0;
//Instantiate the saturate input Register
hardcopyiii_mac_register saturate_input_register (
                                            .datain(saturate),
                                            .clk(saturate_clk_ir),
                                            .aclr(saturate_aclr_ir),
                                            .sload(saturate_sload_ir),
                                            .bypass_register(saturate_bypass_register_ir),
                                            .dataout(saturate_in_reg)
                                        );
defparam saturate_input_register.data_width = 1;
//decode the clk and aclr values
assign saturate_clkval_ir =(saturate_clock == "0") ? 4'b0000 :
                             (saturate_clock == "1") ? 4'b0001 :
                             (saturate_clock == "2") ? 4'b0010 :
                             (saturate_clock == "3") ? 4'b0011 : 4'b0000;
assign saturate_aclrval_ir = (saturate_clear == "0")  ? 4'b0000 :
                              (saturate_clear == "1") ? 4'b0001 :
                              (saturate_clear == "2") ? 4'b0010 :
                              (saturate_clear == "3") ? 4'b0011 : 4'b0000;
//assign the corresponding clk,aclr,enable and bypass register values.
assign saturate_clk_ir = clk[saturate_clkval_ir] ? 1'b1 : 1'b0;
assign saturate_aclr_ir = aclr[saturate_aclrval_ir] || ~devclrn || ~devpor   ? 1'b1 : 1'b0;
assign saturate_sload_ir = ena[saturate_clkval_ir] ? 1'b1 : 1'b0;
assign saturate_bypass_register_ir = (saturate_clock == "none") ? 1'b1 : 1'b0;
//Instantiate the roundchainout input Register
hardcopyiii_mac_register roundchainout_input_register (
                                                 .datain(roundchainout),
                                                 .clk(roundchainout_clk_ir),
                                                 .aclr(roundchainout_aclr_ir),
                                                 .sload(roundchainout_sload_ir),
                                                 .bypass_register(roundchainout_bypass_register_ir),
                                                 .dataout(roundchainout_in_reg)
                                                );
defparam roundchainout_input_register.data_width = 1;
//decode the clk and aclr values
assign roundchainout_clkval_ir =(roundchainout_clock == "0") ? 4'b0000 :
                                  (roundchainout_clock == "1") ? 4'b0001 :
                                  (roundchainout_clock == "2") ? 4'b0010 :
                                  (roundchainout_clock == "3") ? 4'b0011 : 4'b0000;
assign roundchainout_aclrval_ir = (roundchainout_clear == "0")  ? 4'b0000 :
                                   (roundchainout_clear == "1") ? 4'b0001 :
                                   (roundchainout_clear == "2") ? 4'b0010 :
                                   (roundchainout_clear == "3") ? 4'b0011 : 4'b0000;
//assign the corresponding clk,aclr,enable and bypass register values.
assign roundchainout_clk_ir = clk[roundchainout_clkval_ir] ? 1'b1 : 1'b0;
assign roundchainout_aclr_ir = aclr[roundchainout_aclrval_ir] || ~devclrn || ~devpor   ? 1'b1 : 1'b0;
assign roundchainout_sload_ir = ena[roundchainout_clkval_ir] ? 1'b1 : 1'b0;
assign roundchainout_bypass_register_ir = (roundchainout_clock == "none") ? 1'b1 : 1'b0;
//Instantiate the saturatechainout input Register
hardcopyiii_mac_register saturatechainout_input_register (
                             .datain(saturatechainout),
                                                     .clk(saturatechainout_clk_ir),
                                                     .aclr(saturatechainout_aclr_ir),
                                                     .sload(saturatechainout_sload_ir),
                                                     .bypass_register(saturatechainout_bypass_register_ir),
                                                     .dataout(saturatechainout_in_reg)
                                                    );
defparam saturatechainout_input_register.data_width = 1;
//decode the clk and aclr values
assign saturatechainout_clkval_ir =(saturatechainout_clock == "0") ? 4'b0000 :
                                    (saturatechainout_clock == "1") ? 4'b0001 :
                                    (saturatechainout_clock == "2") ? 4'b0010 :
                                    (saturatechainout_clock == "3") ? 4'b0011 : 4'b0000;
assign saturatechainout_aclrval_ir =(saturatechainout_clear == "0")  ? 4'b0000 :
                                    (saturatechainout_clear == "1") ? 4'b0001 :
                                    (saturatechainout_clear == "2") ? 4'b0010 :
                                    (saturatechainout_clear == "3") ? 4'b0011 : 4'b0000;
//assign the corresponding clk,aclr,enable and bypass register values.
assign saturatechainout_clk_ir = clk[saturatechainout_clkval_ir] ? 1'b1 : 1'b0;
assign saturatechainout_aclr_ir = aclr[saturatechainout_aclrval_ir] || ~devclrn || ~devpor   ? 1'b1 : 1'b0;
assign saturatechainout_sload_ir = ena[saturatechainout_clkval_ir] ? 1'b1 : 1'b0;
assign saturatechainout_bypass_register_ir = (saturatechainout_clock == "none") ? 1'b1 : 1'b0;
//Instantiate the First level adder interface and sign extension block
 hardcopyiii_fsa_isse fsa_interface(
                              .dataa(dataa),
                              .datab(datab),
                              .datac(datac),
                              .datad(datad),
                              .chainin(chainin),
                              .signa(signa_in_reg),
                              .signb(signb_in_reg),
                              .dataa_out(dataa_fsa_in),
                              .datab_out(datab_fsa_in),
                              .datac_out(datac_fsa_in),
                              .datad_out(datad_fsa_in),
                              .chainin_out(chainin_coa_in),
                              .operation(operation)
                              );
defparam fsa_interface.dataa_width = dataa_width;
defparam fsa_interface.datab_width = datab_width;
defparam fsa_interface.datac_width = datac_width;
defparam fsa_interface.datad_width = datad_width;
defparam fsa_interface.chainin_width = chainin_width;
defparam fsa_interface.operation_mode = operation_mode;
defparam fsa_interface.multa_signa_internally_grounded = multa_signa_internally_grounded;
defparam fsa_interface.multa_signb_internally_grounded = multa_signb_internally_grounded;
defparam fsa_interface.multb_signa_internally_grounded = multb_signa_internally_grounded;
defparam fsa_interface.multb_signb_internally_grounded = multb_signb_internally_grounded;
defparam fsa_interface.multc_signa_internally_grounded = multc_signa_internally_grounded;
defparam fsa_interface.multc_signb_internally_grounded = multc_signb_internally_grounded;
defparam fsa_interface.multd_signa_internally_grounded = multd_signa_internally_grounded;
defparam fsa_interface.multd_signb_internally_grounded = multd_signb_internally_grounded;
assign sign = signa_in_reg | signb_in_reg;
//Instantiate First Stage Adder/Subtractor Unit0
hardcopyiii_first_stage_add_sub fsaunit0(
                                  .dataa(dataa_fsa_in),
                                  .datab(datab_fsa_in),
                                  .sign(sign),
                                  .operation(operation),
                                  .dataout(dataout_fsa0)
                                );
defparam fsaunit0.dataa_width = dataa_width;
defparam fsaunit0.datab_width = datab_width;
defparam fsaunit0.fsa_mode = first_adder0_mode;
//Instantiate First Stage Adder/Subtractor Unit1
hardcopyiii_first_stage_add_sub fsaunit1(
                                  .dataa(datac_fsa_in),
                                  .datab(datad_fsa_in),
                                  .sign(sign),
                                  .operation(operation),
                                  .dataout(dataout_fsa1)
                                  );
defparam fsaunit1.dataa_width = datac_width;
defparam fsaunit1.datab_width = datad_width;
defparam fsaunit1.fsa_mode = first_adder1_mode;
//Instantiate the zeroloopback pipeline Register
hardcopyiii_mac_register zeroloopback_pipeline_register (
                                                    .datain(zeroloopback_in_reg),
                                                    .clk(zeroloopback_clk_pip),
                                                    .aclr(zeroloopback_aclr_pip),
                                                    .sload(zeroloopback_sload_pip),
                                                    .bypass_register(zeroloopback_bypass_register_pip),
                                                    .dataout(zeroloopback_pip_reg)
                                                    );
defparam zeroloopback_pipeline_register.data_width = 1;
//decode the clk and aclr values
assign zeroloopback_clkval_pip =(zeroloopback_pipeline_clock == "0") ? 4'b0000 :
                                (zeroloopback_pipeline_clock == "1") ? 4'b0001 :
                                (zeroloopback_pipeline_clock == "2") ? 4'b0010 :
                                (zeroloopback_pipeline_clock == "3") ? 4'b0011 : 4'b0000;
assign zeroloopback_aclrval_pip = (zeroloopback_pipeline_clear == "0")  ? 4'b0000 :
                                   (zeroloopback_pipeline_clear == "1") ? 4'b0001 :
                                   (zeroloopback_pipeline_clear == "2") ? 4'b0010 :
                                   (zeroloopback_pipeline_clear == "3") ? 4'b0011 : 4'b0000;
//assign the corresponding clk,aclr,enable and bypass register values.
assign zeroloopback_clk_pip = clk[zeroloopback_clkval_pip] ? 1'b1 : 1'b0;
assign zeroloopback_aclr_pip = aclr[zeroloopback_aclrval_pip] || ~devclrn || ~devpor   ? 1'b1 : 1'b0;
assign zeroloopback_sload_pip = ena[zeroloopback_clkval_pip] ? 1'b1 : 1'b0;
assign zeroloopback_bypass_register_pip = (zeroloopback_pipeline_clock == "none") ? 1'b1 : 1'b0;
//Instantiate the zeroacc pipeline Register
hardcopyiii_mac_register zeroacc_pipeline_register (
                                              .datain(zeroacc_in_reg),
                                              .clk(zeroacc_clk_pip),
                                              .aclr(zeroacc_aclr_pip),
                                              .sload(zeroacc_sload_pip),
                                              .bypass_register(zeroacc_bypass_register_pip),
                                              .dataout(zeroacc_pip_reg)
                                             );
defparam zeroacc_pipeline_register.data_width = 1;
//decode the clk and aclr values
assign zeroacc_clkval_pip =(zeroacc_pipeline_clock == "0") ? 4'b0000 :
                             (zeroacc_pipeline_clock == "1") ? 4'b0001 :
                             (zeroacc_pipeline_clock == "2") ? 4'b0010 :
                             (zeroacc_pipeline_clock == "3") ? 4'b0011 : 4'b0000;
assign zeroacc_aclrval_pip = (zeroacc_pipeline_clear == "0")  ? 4'b0000 :
                              (zeroacc_pipeline_clear == "1") ? 4'b0001 :
                              (zeroacc_pipeline_clear == "2") ? 4'b0010 :
                              (zeroacc_pipeline_clear == "3") ? 4'b0011 : 4'b0000;
//assign the corresponding clk,aclr,enable and bypass register values.
assign zeroacc_clk_pip = clk[zeroacc_clkval_pip] ? 1'b1 : 1'b0;
assign zeroacc_aclr_pip = aclr[zeroacc_aclrval_pip] || ~devclrn || ~devpor   ? 1'b1 : 1'b0;
assign zeroacc_sload_pip = ena[zeroacc_clkval_pip] ? 1'b1 : 1'b0;
assign zeroacc_bypass_register_pip = (zeroacc_pipeline_clock == "none") ? 1'b1 : 1'b0;
//Instantiate the signa pipeline Register
hardcopyiii_mac_register signa_pipeline_register (
                                             .datain(signa_in_reg),
                                             .clk(signa_clk_pip),
                                             .aclr(signa_aclr_pip),
                                             .sload(signa_sload_pip),
                                             .bypass_register(signa_bypass_register_pip),
                                             .dataout(signa_pip_reg)
                                           );
defparam signa_pipeline_register.data_width = 1;
//decode the clk and aclr values
assign signa_clkval_pip =(signa_pipeline_clock == "0") ? 4'b0000 :
                           (signa_pipeline_clock == "1") ? 4'b0001 :
                           (signa_pipeline_clock == "2") ? 4'b0010 :
                           (signa_pipeline_clock == "3") ? 4'b0011 : 4'b0000;
assign signa_aclrval_pip = (signa_pipeline_clear == "0")  ? 4'b0000 :
                            (signa_pipeline_clear == "1") ? 4'b0001 :
                            (signa_pipeline_clear == "2") ? 4'b0010 :
                            (signa_pipeline_clear == "3") ? 4'b0011 : 4'b0000;
//assign the corresponding clk,aclr,enable and bypass register values.
assign signa_clk_pip = clk[signa_clkval_pip] ? 1'b1 : 1'b0;
assign signa_aclr_pip = aclr[signa_aclrval_pip] || ~devclrn || ~devpor   ? 1'b1 : 1'b0;
assign signa_sload_pip = ena[signa_clkval_pip] ? 1'b1 : 1'b0;
assign signa_bypass_register_pip = (signa_pipeline_clock == "none") ? 1'b1 : 1'b0;
//Instantiate the signb pipeline Register
hardcopyiii_mac_register signb_pipeline_register (
                                             .datain(signb_in_reg),
                                             .clk(signb_clk_pip),
                                             .aclr(signb_aclr_pip),
                                             .sload(signb_sload_pip),
                                             .bypass_register(signb_bypass_register_pip),
                                             .dataout(signb_pip_reg)
                                            );
defparam signb_pipeline_register.data_width = 1;
//decode the clk and aclr values
assign signb_clkval_pip = (signb_pipeline_clock == "0") ? 4'b0000 :
                            (signb_pipeline_clock == "1") ? 4'b0001 :
                            (signb_pipeline_clock == "2") ? 4'b0010 :
                            (signb_pipeline_clock == "3") ? 4'b0011 : 4'b0000;
assign signb_aclrval_pip = (signb_pipeline_clear == "0")  ? 4'b0000 :
                            (signb_pipeline_clear == "1") ? 4'b0001 :
                            (signb_pipeline_clear == "2") ? 4'b0010 :
                            (signb_pipeline_clear == "3") ? 4'b0011 : 4'b0000;
//assign the corresponding clk,aclr,enable and bypass register values.
assign signb_clk_pip = clk[signb_clkval_pip] ? 1'b1 : 1'b0;
assign signb_aclr_pip = aclr[signb_aclrval_pip] || ~devclrn || ~devpor   ? 1'b1 : 1'b0;
assign signb_sload_pip = ena[signb_clkval_pip] ? 1'b1 : 1'b0;
assign signb_bypass_register_pip = (signb_pipeline_clock == "none") ? 1'b1 : 1'b0;
//Instantiate the rotate pipeline Register
hardcopyiii_mac_register rotate_pipeline_register (
                                             .datain(rotate_in_reg),
                                             .clk(rotate_clk_pip),
                                             .aclr(rotate_aclr_pip),
                                             .sload(rotate_sload_pip),
                                             .bypass_register(rotate_bypass_register_pip),
                                             .dataout(rotate_pip_reg)
                                            );
defparam rotate_pipeline_register.data_width = 1;
//decode the clk and aclr values
assign rotate_clkval_pip =(rotate_pipeline_clock == "0") ? 4'b0000 :
                            (rotate_pipeline_clock == "1") ? 4'b0001 :
                            (rotate_pipeline_clock == "2") ? 4'b0010 :
                            (rotate_pipeline_clock == "3") ? 4'b0011 : 4'b0000;
assign rotate_aclrval_pip =(rotate_pipeline_clear == "0")  ? 4'b0000 :
                            (rotate_pipeline_clear == "1") ? 4'b0001 :
                            (rotate_pipeline_clear == "2") ? 4'b0010 :
                            (rotate_pipeline_clear == "3") ? 4'b0011 : 4'b0000;
//assign the corresponding clk,aclr,enable and bypass register values.
assign rotate_clk_pip = clk[rotate_clkval_pip] ? 1'b1 : 1'b0;
assign rotate_aclr_pip = aclr[rotate_aclrval_pip] || ~devclrn || ~devpor   ? 1'b1 : 1'b0;
assign rotate_sload_pip = ena[rotate_clkval_pip] ? 1'b1 : 1'b0;
assign rotate_bypass_register_pip = (rotate_pipeline_clock == "none") ? 1'b1 : 1'b0;
//Instantiate the shiftright pipeline Register
hardcopyiii_mac_register shiftright_pipeline_register (
                                                 .datain(shiftright_in_reg),
                                                 .clk(shiftright_clk_pip),
                                                 .aclr(shiftright_aclr_pip),
                                                 .sload(shiftright_sload_pip),
                                                 .bypass_register(shiftright_bypass_register_pip),
                                                 .dataout(shiftright_pip_reg)
                                                 );
defparam shiftright_pipeline_register.data_width = 1;
//decode the clk and aclr values
assign shiftright_clkval_pip =(shiftright_pipeline_clock == "0") ? 4'b0000 :
                                (shiftright_pipeline_clock == "1") ? 4'b0001 :
                                (shiftright_pipeline_clock == "2") ? 4'b0010 :
                                (shiftright_pipeline_clock == "3") ? 4'b0011 : 4'b0000;
assign shiftright_aclrval_pip = (shiftright_pipeline_clear == "0")  ? 4'b0000 :
                                 (shiftright_pipeline_clear == "1") ? 4'b0001 :
                                 (shiftright_pipeline_clear == "2") ? 4'b0010 :
                                 (shiftright_pipeline_clear == "3") ? 4'b0011 : 4'b0000;
//assign the corresponding clk,aclr,enable and bypass register values.
assign shiftright_clk_pip = clk[shiftright_clkval_pip] ? 1'b1 : 1'b0;
assign shiftright_aclr_pip = aclr[shiftright_aclrval_pip] || ~devclrn || ~devpor   ? 1'b1 : 1'b0;
assign shiftright_sload_pip = ena[shiftright_clkval_pip] ? 1'b1 : 1'b0;
assign shiftright_bypass_register_pip = (shiftright_pipeline_clock == "none") ? 1'b1 : 1'b0;
//Instantiate the round pipeline Register
hardcopyiii_mac_register round_pipeline_register (
                                             .datain(round_in_reg),
                                             .clk(round_clk_pip),
                                             .aclr(round_aclr_pip),
                                             .sload(round_sload_pip),
                                             .bypass_register(round_bypass_register_pip),
                                             .dataout(round_pip_reg)
                                           );
defparam round_pipeline_register.data_width = 1;
//decode the clk and aclr values
assign round_clkval_pip = (round_pipeline_clock == "0") ? 4'b0000 :
                            (round_pipeline_clock == "1") ? 4'b0001 :
                            (round_pipeline_clock == "2") ? 4'b0010 :
                            (round_pipeline_clock == "3") ? 4'b0011 : 4'b0000;
assign round_aclrval_pip = (round_pipeline_clear == "0")  ? 4'b0000 :
                            (round_pipeline_clear == "1") ? 4'b0001 :
                            (round_pipeline_clear == "2") ? 4'b0010 :
                            (round_pipeline_clear == "3") ? 4'b0011 : 4'b0000;
//assign the corresponding clk,aclr,enable and bypass register values.
assign round_clk_pip = clk[round_clkval_pip] ? 1'b1 : 1'b0;
assign round_aclr_pip = aclr[round_aclrval_pip] || ~devclrn || ~devpor   ? 1'b1 : 1'b0;
assign round_sload_pip = ena[round_clkval_pip] ? 1'b1 : 1'b0;
assign round_bypass_register_pip = (round_pipeline_clock == "none") ? 1'b1 : 1'b0;
//Instantiate the saturate pipeline Register
hardcopyiii_mac_register saturate_pipeline_register (
                                                .datain(saturate_in_reg),
                                                .clk(saturate_clk_pip),
                                                .aclr(saturate_aclr_pip),
                                                .sload(saturate_sload_pip),
                                                .bypass_register(saturate_bypass_register_pip),
                                                .dataout(saturate_pip_reg)
                                              );
defparam saturate_pipeline_register.data_width = 1;
//decode the clk and aclr values
assign saturate_clkval_pip =(saturate_pipeline_clock == "0") ? 4'b0000 :
                              (saturate_pipeline_clock == "1") ? 4'b0001 :
                              (saturate_pipeline_clock == "2") ? 4'b0010 :
                              (saturate_pipeline_clock == "3") ? 4'b0011 : 4'b0000;
assign saturate_aclrval_pip = (saturate_pipeline_clear == "0")  ? 4'b0000 :
                               (saturate_pipeline_clear == "1") ? 4'b0001 :
                               (saturate_pipeline_clear == "2") ? 4'b0010 :
                               (saturate_pipeline_clear == "3") ? 4'b0011 : 4'b0000;
//assign the corresponding clk,aclr,enable and bypass register values.
assign saturate_clk_pip = clk[saturate_clkval_pip] ? 1'b1 : 1'b0;
assign saturate_aclr_pip = aclr[saturate_aclrval_pip] || ~devclrn || ~devpor   ? 1'b1 : 1'b0;
assign saturate_sload_pip = ena[saturate_clkval_pip] ? 1'b1 : 1'b0;
assign saturate_bypass_register_pip = (saturate_pipeline_clock == "none") ? 1'b1 : 1'b0;
//Instantiate the roundchainout pipeline Register
hardcopyiii_mac_register roundchainout_pipeline_register (
                                                     .datain(roundchainout_in_reg),
                                                     .clk(roundchainout_clk_pip),
                                                     .aclr(roundchainout_aclr_pip),
                                                     .sload(roundchainout_sload_pip),
                                                     .bypass_register(roundchainout_bypass_register_pip),
                                                     .dataout(roundchainout_pip_reg)
                                                   );
defparam roundchainout_pipeline_register.data_width = 1;
//decode the clk and aclr values
assign roundchainout_clkval_pip = (roundchainout_pipeline_clock == "0") ? 4'b0000 :
                                    (roundchainout_pipeline_clock == "1") ? 4'b0001 :
                                    (roundchainout_pipeline_clock == "2") ? 4'b0010 :
                                    (roundchainout_pipeline_clock == "3") ? 4'b0011 : 4'b0000;
assign roundchainout_aclrval_pip = (roundchainout_pipeline_clear == "0")  ? 4'b0000 :
                                    (roundchainout_pipeline_clear == "1") ? 4'b0001 :
                                    (roundchainout_pipeline_clear == "2") ? 4'b0010 :
                                    (roundchainout_pipeline_clear == "3") ? 4'b0011 : 4'b0000;
//assign the corresponding clk,aclr,enable and bypass register values.
assign roundchainout_clk_pip = clk[roundchainout_clkval_pip] ? 1'b1 : 1'b0;
assign roundchainout_aclr_pip = aclr[roundchainout_aclrval_pip] || ~devclrn || ~devpor   ? 1'b1 : 1'b0;
assign roundchainout_sload_pip = ena[roundchainout_clkval_pip] ? 1'b1 : 1'b0;
assign roundchainout_bypass_register_pip = (roundchainout_pipeline_clock == "none") ? 1'b1 : 1'b0;
//Instantiate the saturatechainout pipeline Register
hardcopyiii_mac_register saturatechainout_pipeline_register (
                                                        .datain(saturatechainout_in_reg),
                                                        .clk(saturatechainout_clk_pip),
                                                        .aclr(saturatechainout_aclr_pip),
                                                        .sload(saturatechainout_sload_pip),
                                                        .bypass_register(saturatechainout_bypass_register_pip),
                                                        .dataout(saturatechainout_pip_reg)
                                                      );
defparam saturatechainout_pipeline_register.data_width = 1;
//decode the clk and aclr values
assign saturatechainout_clkval_pip =(saturatechainout_pipeline_clock == "0") ? 4'b0000 :
                                     (saturatechainout_pipeline_clock == "1") ? 4'b0001 :
                                     (saturatechainout_pipeline_clock == "2") ? 4'b0010 :
                                     (saturatechainout_pipeline_clock == "3") ? 4'b0011 : 4'b0000;
assign saturatechainout_aclrval_pip = (saturatechainout_pipeline_clear == "0")  ? 4'b0000 :
                                       (saturatechainout_pipeline_clear == "1") ? 4'b0001 :
                                       (saturatechainout_pipeline_clear == "2") ? 4'b0010 :
                                       (saturatechainout_pipeline_clear == "3") ? 4'b0011 : 4'b0000;
//assign the corresponding clk,aclr,enable and bypass register values.
assign saturatechainout_clk_pip = clk[saturatechainout_clkval_pip] ? 1'b1 : 1'b0;
assign saturatechainout_aclr_pip = aclr[saturatechainout_aclrval_pip] || ~devclrn || ~devpor   ? 1'b1 : 1'b0;
assign saturatechainout_sload_pip = ena[saturatechainout_clkval_pip] ? 1'b1 : 1'b0;
assign saturatechainout_bypass_register_pip = (saturatechainout_pipeline_clock == "none") ? 1'b1 : 1'b0;
// Instantiate fsa0 dataout pipline register
hardcopyiii_mac_register fsa0_pipeline_register (
                                           .datain(fsa_pip_datain1),
                                           .clk(fsa0_clk_pip),
                                           .aclr(fsa0_aclr_pip),
                                           .sload(fsa0_sload_pip),
                                           .bypass_register(fsa0_bypass_register_pip),
                                           .dataout(fsa0_pip_reg)
                                        );
defparam fsa0_pipeline_register.data_width = 72;
assign fsa_pip_datain1 = (operation_mode == "output_only") ? dataa_fsa_in : dataout_fsa0;
//decode the clk and aclr values
assign fsa0_clkval_pip =(first_adder0_clock == "0") ? 4'b0000 :
                         (first_adder0_clock == "1") ? 4'b0001 :
                         (first_adder0_clock == "2") ? 4'b0010 :
                         (first_adder0_clock == "3") ? 4'b0011 : 4'b0000;
assign fsa0_aclrval_pip =  (first_adder0_clear == "0")  ? 4'b0000 :
                            (first_adder0_clear == "1") ? 4'b0001 :
                            (first_adder0_clear == "2") ? 4'b0010 :
                            (first_adder0_clear == "3") ? 4'b0011 : 4'b0000;
//assign the corresponding clk,aclr,enable and bypass register values.
assign fsa0_clk_pip = clk[fsa0_clkval_pip] ? 1'b1 : 1'b0;
assign fsa0_aclr_pip = aclr[fsa0_aclrval_pip] || ~devclrn || ~devpor   ? 1'b1 : 1'b0;
assign fsa0_sload_pip = ena[fsa0_clkval_pip] ? 1'b1 : 1'b0;
assign fsa0_bypass_register_pip = (first_adder0_clock == "none") ? 1'b1 : 1'b0;
// Instantiate fsa1 dataout pipline register
hardcopyiii_mac_register fsa1_pipeline_register (
                                           .datain(dataout_fsa1),
                                           .clk(fsa1_clk_pip),
                                           .aclr(fsa1_aclr_pip),
                                           .sload(fsa1_sload_pip),
                                           .bypass_register(fsa1_bypass_register_pip),
                                           .dataout(fsa1_pip_reg)
                                          );
defparam fsa1_pipeline_register.data_width = 72;
//decode the clk and aclr values
assign fsa1_clkval_pip =(first_adder1_clock == "0") ? 4'b0000 :
                          (first_adder1_clock == "1") ? 4'b0001 :
                          (first_adder1_clock == "2") ? 4'b0010 :
                          (first_adder1_clock == "3") ? 4'b0011 : 4'b0000;
assign fsa1_aclrval_pip =  (first_adder1_clear == "0")  ? 4'b0000 :
                            (first_adder1_clear == "1") ? 4'b0001 :
                            (first_adder1_clear == "2") ? 4'b0010 :
                            (first_adder1_clear == "3") ? 4'b0011 : 4'b0000;
//assign the corresponding clk,aclr,enable and bypass register values.
assign fsa1_clk_pip = clk[fsa1_clkval_pip] ? 1'b1 : 1'b0;
assign fsa1_aclr_pip = aclr[fsa1_aclrval_pip] || ~devclrn || ~devpor   ? 1'b1 : 1'b0;
assign fsa1_sload_pip = ena[fsa1_clkval_pip] ? 1'b1 : 1'b0;
assign fsa1_bypass_register_pip = (first_adder1_clock == "none") ? 1'b1 : 1'b0;
//Instantiate the second level adder/accumulator block
hardcopyiii_second_stage_add_accum ssa_unit(
                                      .dataa(fsa0_pip_reg),
                                      .datab(fsa1_pip_reg),
                                      .accumin(ssa_accum_in),
                                      .sign(ssa_sign),
                                      .operation(operation),
                                      .dataout(ssa_dataout),
                                      .overflow(ssa_overflow)
                                     );
defparam ssa_unit.dataa_width = dataa_width +1;
defparam ssa_unit.datab_width = datac_width + 1;
defparam ssa_unit.accum_width = dataa_width + 8;
defparam ssa_unit.ssa_mode = acc_adder_operation;
assign ssa_accum_in = (!zeroacc_pip_reg) ? rs_dataout_out_reg : 0;
assign ssa_sign = signa_pip_reg | signb_pip_reg;
// Instantiate round and saturation block
hardcopyiii_round_saturate_block rs_block(
                                   .datain(rs_datain),
                                   .round(round_pip_reg),
                                   .saturate(saturate_pip_reg),
                                   .signa(signa_pip_reg),
                                   .signb(signb_pip_reg),
                                   .datain_width(ssa_datain_width),
                                   .dataout(rs_dataout),
                                   .saturationoverflow(rs_saturation_overflow)
                                   );
defparam rs_block.dataa_width = dataa_width;
defparam rs_block.datab_width = datab_width;
defparam rs_block.saturate_width = saturate_width;
defparam rs_block.round_width = round_width;
defparam rs_block.saturate_mode = saturate_mode;
defparam rs_block.round_mode = round_mode;
defparam rs_block.operation_mode = operation_mode;
assign rs_datain = ((operation_mode == "output_only") ||
                   (operation_mode == "one_level_adder")||
                   (operation_mode == "loopback")) ? fsa0_pip_reg :ssa_dataout ;
assign ssa_datain_width_tmp = (((operation_mode == "accumulator")||(operation_mode == "accumulator_chain_out")||(operation_mode == "two_level_adder_chain_out"))  ? (dataa_width[7:0] + 4'h8) :
                          (operation_mode == "two_level_adder") ? (dataa_width[7:0] + 4'h2) :
                          ((operation_mode == "shift" ) || (operation_mode == "36_bit_multiply" )) ? (dataa_width[7:0] + datab_width[7:0]):
                          ((operation_mode == "double" )) ? (dataa_width[7:0] + 4'h8) : dataa_width[7:0]);
assign ssa_datain_width = (ssa_datain_width_tmp >= round_width) ? ssa_datain_width_tmp : round_width[7:0];
//Instantiate the zeroloopback output Register
hardcopyiii_mac_register zeroloopback_output_register (
                                                 .datain(zeroloopback_pip_reg),
                                                 .clk(zeroloopback_clk_or),
                                                 .aclr(zeroloopback_aclr_or),
                                                 .sload(zeroloopback_sload_or),
                                                 .bypass_register(zeroloopback_bypass_register_or),
                                                 .dataout(zeroloopback_out_reg)
                                                );
defparam zeroloopback_output_register.data_width = 1;
//decode the clk and aclr values
assign zeroloopback_clkval_or =(zeroloopback_output_clock == "0") ? 4'b0000 :
                                (zeroloopback_output_clock == "1") ? 4'b0001 :
                                (zeroloopback_output_clock == "2") ? 4'b0010 :
                                (zeroloopback_output_clock == "3") ? 4'b0011 : 4'b0000;
assign zeroloopback_aclrval_or =(zeroloopback_output_clear == "0")  ? 4'b0000 :
                                 (zeroloopback_output_clear == "1") ? 4'b0001 :
                                 (zeroloopback_output_clear == "2") ? 4'b0010 :
                                 (zeroloopback_output_clear == "3") ? 4'b0011 : 4'b0000;
//assign the corresponding clk,aclr,enable and bypass register values.
assign zeroloopback_clk_or = clk[zeroloopback_clkval_or] ? 1'b1 : 1'b0;
assign zeroloopback_aclr_or = aclr[zeroloopback_aclrval_or] || ~devclrn || ~devpor   ? 1'b1 : 1'b0;
assign zeroloopback_sload_or = ena[zeroloopback_clkval_or] ? 1'b1 : 1'b0;
assign zeroloopback_bypass_register_or = (zeroloopback_output_clock == "none") ? 1'b1 : 1'b0;
//Instantiate the zerochainout output Register
hardcopyiii_mac_register zerochainout_output_register (
                                                 .datain(zerochainout),
                                                 .clk(zerochainout_clk_or),
                                                 .aclr(zerochainout_aclr_or),
                                                 .sload(zerochainout_sload_or),
                                                 .bypass_register(zerochainout_bypass_register_or),
                                                 .dataout(zerochainout_out_reg)
                                                );
defparam zerochainout_output_register.data_width = 1;
//decode the clk and aclr values
assign zerochainout_clkval_or =(zerochainout_output_clock == "0") ? 4'b0000 :
                                 (zerochainout_output_clock == "1") ? 4'b0001 :
                                 (zerochainout_output_clock == "2") ? 4'b0010 :
                                 (zerochainout_output_clock == "3") ? 4'b0011 : 4'b0000;
assign zerochainout_aclrval_or =(zerochainout_output_clear == "0")  ? 4'b0000 :
                                 (zerochainout_output_clear == "1") ? 4'b0001 :
                                 (zerochainout_output_clear == "2") ? 4'b0010 :
                                 (zerochainout_output_clear == "3") ? 4'b0011 : 4'b0000;
//assign the corresponding clk,aclr,enable and bypass register values.
assign zerochainout_clk_or = clk[zerochainout_clkval_or] ? 1'b1 : 1'b0;
assign zerochainout_aclr_or = aclr[zerochainout_aclrval_or] || ~devclrn || ~devpor   ? 1'b1 : 1'b0;
assign zerochainout_sload_or = ena[zerochainout_clkval_or] ? 1'b1 : 1'b0;
assign zerochainout_bypass_register_or = (zerochainout_output_clock == "none") ? 1'b1 : 1'b0;
// Instantiate Round_Saturate dataout output register
hardcopyiii_mac_register rs_dataout_output_register (
                                                .datain(rs_dataout_in),
                                                .clk(rs_dataout_clk_or),
                                                .aclr(rs_dataout_aclr_or),
                                                .sload(rs_dataout_sload_or),
                                                .bypass_register(rs_dataout_bypass_register_or),
                                                .dataout(rs_dataout_out_reg)
                                               );
defparam rs_dataout_output_register.data_width = 72;
assign rs_dataout_in = ((operation_mode == "36_bit_multiply" )||(operation_mode == "shift")) ?
                        ssa_dataout : rs_dataout_of;
// Instantiate Round_Saturate saturation_overflow output register
hardcopyiii_mac_register rs_saturation_overflow_output_register (
                                                            .datain(rs_saturation_overflow_in),
                                                            .clk(rs_dataout_clk_or),
                                                            .aclr(rs_dataout_aclr_or),
                                                            .sload(rs_dataout_sload_or),
                                                            .bypass_register(rs_dataout_bypass_register_or),
                                                            .dataout(rs_saturation_overflow_out_reg)
                                                          );
defparam rs_saturation_overflow_output_register.data_width = 1;
// rs_dataout and the saturation_overflow uses the same control signals "second_adder_clock/clear" in chainout mode else output_clock/clear
//decode the clk and aclr values
assign rs_saturation_overflow_in = (saturate_pip_reg == 1'b1) ? rs_saturation_overflow : ssa_overflow;
assign rs_dataout_clkval_or_co = (second_adder_clock == "0") ? 4'b0000 :
                                (second_adder_clock == "1") ? 4'b0001 :
                                (second_adder_clock == "2") ? 4'b0010 :
                                (second_adder_clock == "3") ? 4'b0011 : 4'b0000;
assign rs_dataout_aclrval_or_co = (second_adder_clear == "0")  ? 4'b0000 :
                                (second_adder_clear == "1") ? 4'b0001 :
                                (second_adder_clear == "2") ? 4'b0010 :
                                (second_adder_clear == "3") ? 4'b0011 : 4'b0000;
assign rs_dataout_clkval_or_o = (output_clock == "0") ? 4'b0000 :
                                (output_clock == "1") ? 4'b0001 :
                                (output_clock == "2") ? 4'b0010 :
                                (output_clock == "3") ? 4'b0011 : 4'b0000;
assign rs_dataout_aclrval_or_o = (output_clear == "0")  ? 4'b0000 :
                                (output_clear == "1") ? 4'b0001 :
                                (output_clear == "2") ? 4'b0010 :
                                (output_clear == "3") ? 4'b0011 : 4'b0000;
assign rs_dataout_clkval_or = ((operation_mode == "two_level_adder_chain_out") || (operation_mode == "accumulator_chain_out" )) ? rs_dataout_clkval_or_co : rs_dataout_clkval_or_o;
assign rs_dataout_aclrval_or = ((operation_mode == "two_level_adder_chain_out") || (operation_mode == "accumulator_chain_out" )) ? rs_dataout_aclrval_or_co : rs_dataout_aclrval_or_o;
//assign the corresponding clk,aclr,enable and bypass register values.
assign rs_dataout_clk_or = clk[rs_dataout_clkval_or] ? 1'b1 : 1'b0;
assign rs_dataout_aclr_or = aclr[rs_dataout_aclrval_or] || ~devclrn || ~devpor   ? 1'b1 : 1'b0;
assign rs_dataout_sload_or = ena[rs_dataout_clkval_or] ? 1'b1 : 1'b0;
assign rs_dataout_bypass_register_or_co = (second_adder_clock == "none") ? 1'b1 : 1'b0;
assign rs_dataout_bypass_register_or_o = (output_clock == "none") ? 1'b1 : 1'b0;
assign rs_dataout_bypass_register_or = ((operation_mode == "two_level_adder_chain_out") || (operation_mode == "accumulator_chain_out" )) ? rs_dataout_bypass_register_or_co : rs_dataout_bypass_register_or_o;
//Instantiate the rotate output Register
hardcopyiii_mac_register rotate_output_register (
                                           .datain(rotate_pip_reg),
                                           .clk(rotate_clk_or),
                                           .aclr(rotate_aclr_or),
                                           .sload(rotate_sload_or),
                                           .bypass_register(rotate_bypass_register_or),
                                           .dataout(rotate_out_reg)
                                          );
defparam rotate_output_register.data_width = 1;
//decode the clk and aclr values
assign rotate_clkval_or = (rotate_output_clock == "0") ? 4'b0000 :
                            (rotate_output_clock == "1") ? 4'b0001 :
                            (rotate_output_clock == "2") ? 4'b0010 :
                            (rotate_output_clock == "3") ? 4'b0011 : 4'b0000;
assign rotate_aclrval_or = (rotate_output_clear == "0")  ? 4'b0000 :
                            (rotate_output_clear == "1") ? 4'b0001 :
                            (rotate_output_clear == "2") ? 4'b0010 :
                            (rotate_output_clear == "3") ? 4'b0011 : 4'b0000;
//assign the corresponding clk,aclr,enable and bypass register values.
assign rotate_clk_or = clk[rotate_clkval_or] ? 1'b1 : 1'b0;
assign rotate_aclr_or = aclr[rotate_aclrval_or] || ~devclrn || ~devpor   ? 1'b1 : 1'b0;
assign rotate_sload_or = ena[rotate_clkval_or] ? 1'b1 : 1'b0;
assign rotate_bypass_register_or = (rotate_output_clock == "none") ? 1'b1 : 1'b0;
//Instantiate the shiftright output Register
hardcopyiii_mac_register shiftright_output_register (
                                                .datain(shiftright_pip_reg),
                                                .clk(shiftright_clk_or),
                                                .aclr(shiftright_aclr_or),
                                                .sload(shiftright_sload_or),
                                                .bypass_register(shiftright_bypass_register_or),
                                                .dataout(shiftright_out_reg)
                                               );
defparam shiftright_output_register.data_width = 1;
//decode the clk and aclr values
assign shiftright_clkval_or = (shiftright_output_clock == "0") ? 4'b0000 :
                                (shiftright_output_clock == "1") ? 4'b0001 :
                                (shiftright_output_clock == "2") ? 4'b0010 :
                                (shiftright_output_clock == "3") ? 4'b0011 : 4'b0000;
assign shiftright_aclrval_or = (shiftright_output_clear == "0")  ? 4'b0000 :
                                (shiftright_output_clear == "1") ? 4'b0001 :
                                (shiftright_output_clear == "2") ? 4'b0010 :
                                (shiftright_output_clear == "3") ? 4'b0011 : 4'b0000;
//assign the corresponding clk,aclr,enable and bypass register values.
assign shiftright_clk_or = clk[shiftright_clkval_or] ? 1'b1 : 1'b0;
assign shiftright_aclr_or = aclr[shiftright_aclrval_or] || ~devclrn || ~devpor   ? 1'b1 : 1'b0;
assign shiftright_sload_or = ena[shiftright_clkval_or] ? 1'b1 : 1'b0;
assign shiftright_bypass_register_or = (shiftright_output_clock == "none") ? 1'b1 : 1'b0;
//Instantiate the roundchainout output Register
hardcopyiii_mac_register roundchainout_output_register (
                                                  .datain(roundchainout_pip_reg),
                                                  .clk(roundchainout_clk_or),
                                                  .aclr(roundchainout_aclr_or),
                                                  .sload(roundchainout_sload_or),
                                                  .bypass_register(roundchainout_bypass_register_or),
                                                  .dataout(roundchainout_out_reg)
                                                 );
defparam roundchainout_output_register.data_width = 1;
//decode the clk and aclr values
assign roundchainout_clkval_or =(roundchainout_output_clock == "0") ? 4'b0000 :
                                  (roundchainout_output_clock == "1") ? 4'b0001 :
                                  (roundchainout_output_clock == "2") ? 4'b0010 :
                                  (roundchainout_output_clock == "3") ? 4'b0011 : 4'b0000;
assign roundchainout_aclrval_or = (roundchainout_output_clear == "0")  ? 4'b0000 :
                                   (roundchainout_output_clear == "1") ? 4'b0001 :
                                   (roundchainout_output_clear == "2") ? 4'b0010 :
                                   (roundchainout_output_clear == "3") ? 4'b0011 : 4'b0000;
//assign the corresponding clk,aclr,enable and bypass register values.
assign roundchainout_clk_or = clk[roundchainout_clkval_or] ? 1'b1 : 1'b0;
assign roundchainout_aclr_or = aclr[roundchainout_aclrval_or] || ~devclrn || ~devpor   ? 1'b1 : 1'b0;
assign roundchainout_sload_or = ena[roundchainout_clkval_or] ? 1'b1 : 1'b0;
assign roundchainout_bypass_register_or = (roundchainout_output_clock == "none") ? 1'b1 : 1'b0;
//Instantiate the saturatechainout output Register
hardcopyiii_mac_register saturatechainout_output_register (
                                                     .datain(saturatechainout_pip_reg),
                                                     .clk(saturatechainout_clk_or),
                                                     .aclr(saturatechainout_aclr_or),
                                                     .sload(saturatechainout_sload_or),
                                                     .bypass_register(saturatechainout_bypass_register_or),
                                                     .dataout(saturatechainout_out_reg)
                                                    );
defparam saturatechainout_output_register.data_width = 1;
//decode the clk and aclr values
assign saturatechainout_clkval_or =(saturatechainout_output_clock == "0") ? 4'b0000 :
                                     (saturatechainout_output_clock == "1") ? 4'b0001 :
                                     (saturatechainout_output_clock == "2") ? 4'b0010 :
                                     (saturatechainout_output_clock == "3") ? 4'b0011 : 4'b0000;
assign saturatechainout_aclrval_or = (saturatechainout_output_clear == "0")  ? 4'b0000 :
                                      (saturatechainout_output_clear == "1") ? 4'b0001 :
                                      (saturatechainout_output_clear == "2") ? 4'b0010 :
                                      (saturatechainout_output_clear == "3") ? 4'b0011 : 4'b0000;
//assign the corresponding clk,aclr,enable and bypass register values.
assign saturatechainout_clk_or = clk[saturatechainout_clkval_or] ? 1'b1 : 1'b0;
assign saturatechainout_aclr_or = aclr[saturatechainout_aclrval_or] || ~devclrn || ~devpor   ? 1'b1 : 1'b0;
assign saturatechainout_sload_or = ena[saturatechainout_clkval_or] ? 1'b1 : 1'b0;
assign saturatechainout_bypass_register_or = (saturatechainout_output_clock == "none") ? 1'b1 : 1'b0;
//Instantiate the Carry chainout Adder
hardcopyiii_carry_chain_adder chainout_adder(
                                        .dataa(rs_dataout_out_reg),
                                        .datab(chainin_coa_in),
                                        .dataout(coa_dataout)
                      );
//Instantiate the carry chainout adder RS Block
hardcopyiii_round_saturate_block coa_rs_block(
                                        .datain(coa_dataout),
                                        .round(roundchainout_out_reg),
                                        .saturate(saturatechainout_out_reg),
                                        .signa(signa_pip_reg),
                                        .signb(signb_pip_reg),
                                        .datain_width(coa_datain_width),
                                        .dataout(coa_rs_dataout),
                                        .saturationoverflow(coa_rs_saturation_overflow)
                                       );
defparam coa_rs_block.dataa_width = dataa_width;
defparam coa_rs_block.datab_width = datab_width;
defparam coa_rs_block.saturate_width = saturate_chain_out_width;
defparam coa_rs_block.round_width =round_width;
defparam coa_rs_block.saturate_mode = saturate_chain_out_mode;
defparam coa_rs_block.round_mode = round_chain_out_mode;
defparam coa_rs_block.operation_mode = operation_mode;
assign coa_datain_width = ssa_datain_width;
assign coa_round_width = round_chain_out_width[3:0];
assign coa_fraction_width  = coa_datain_width - saturate_chain_out_width[7:0];
//Instantiate the rs_saturation_overflow output register (after COA)
hardcopyiii_mac_register coa_rs_saturation_overflow_register (
                                                        .datain(rs_saturation_overflow_out_reg),
                                                        .clk(coa_reg_clk_or),
                                                        .aclr(coa_reg_aclr_or),
                                                        .sload(coa_reg_sload_or),
                                                        .bypass_register(1'b1),
                                                        .dataout(coa_rs_saturation_overflow_out_reg)
                                                        );
defparam coa_rs_saturation_overflow_register.data_width = 1;
//Instantiate the rs_saturationchainout_overflow output register
hardcopyiii_mac_register coa_rs_saturationchainout_overflow_register (
                                                                .datain(coa_rs_saturation_overflow),
                                                                .clk(coa_reg_clk_or),
                                                                .aclr(coa_reg_aclr_or),
                                                                .sload(coa_reg_sload_or),
                                                                .bypass_register(coa_reg_bypass_register_or),
                                                                .dataout(coa_rs_saturationchainout_overflow_out_reg)
                                                                );
defparam coa_rs_saturationchainout_overflow_register.data_width = 1;
// Instantiate the coa_rs_dataout output register
hardcopyiii_mac_register coa_rs_dataout_register (
                                             .datain(coa_rs_dataout),
                                             .clk(coa_reg_clk_or),
                                             .aclr(coa_reg_aclr_or),
                                             .sload(coa_reg_sload_or),
                                             .bypass_register(coa_reg_bypass_register_or),
                                             .dataout(coa_rs_dataout_out_reg)
                                             );
defparam coa_rs_dataout_register.data_width = 72;
//decode the clk and aclr values
assign coa_reg_clkval_or =(output_clock == "0") ? 4'b0000 :
                            (output_clock == "1") ? 4'b0001 :
                            (output_clock == "2") ? 4'b0010 :
                            (output_clock == "3") ? 4'b0011 : 4'b0000;
assign coa_reg_aclrval_or =(output_clear == "0")  ? 4'b0000 :
                            (output_clear == "1") ? 4'b0001 :
                            (output_clear == "2") ? 4'b0010 :
                            (output_clear == "3") ? 4'b0011 : 4'b0000;
//assign the corresponding clk,aclr,enable and bypass register values.
assign coa_reg_clk_or = clk[coa_reg_clkval_or] ? 1'b1 : 1'b0;
assign coa_reg_aclr_or = aclr[coa_reg_aclrval_or] || ~devclrn || ~devpor   ? 1'b1 : 1'b0;
assign coa_reg_sload_or = ena[coa_reg_clkval_or] ? 1'b1 : 1'b0;
assign coa_reg_bypass_register_or = (output_clock == "none") ? 1'b1 : 1'b0;
//Instantiate the Shift/Rotate Unit
hardcopyiii_rotate_shift_block shift_rot_unit(
                                         .datain(rs_dataout_out_reg),
                                         .rotate(rotate_out_reg),
                                         .shiftright(shiftright_out_reg),
                                         .signa(signa_pip_reg),
                                         .signb(signb_pip_reg),
                                         .dataout(dataout_shift_rot)
                                        );
defparam shift_rot_unit.dataa_width = dataa_width;
defparam shift_rot_unit.datab_width = datab_width;
//Assign the dataout depending on the mode of operation
assign dataout_tmp = ((operation_mode == "accumulator_chain_out")||(operation_mode == "two_level_adder_chain_out"))
                     ? coa_rs_dataout_out_reg :
                     (operation_mode == "shift") ? dataout_shift_rot : rs_dataout_out_reg;
//Assign the loopbackout for loopback mode
assign loopbackout_tmp = ((operation_mode == "loopback") && (!zeroloopback_out_reg)) ? rs_dataout_out_reg : 0;
//Assign the saturation overflow output
assign overflow = ((operation_mode == "accumulator") ||(operation_mode == "two_level_adder"))
                  ? rs_saturation_overflow_out_reg :
                  ((operation_mode == "accumulator_chain_out")||(operation_mode == "two_level_adder_chain_out"))
                  ? coa_rs_saturation_overflow_out_reg : 1'b0;
//Assign the saturationchainout overflow output
assign saturatechainoutoverflow = ((operation_mode == "accumulator_chain_out") ||(operation_mode == "two_level_adder_chain_out"))
                                    ? coa_rs_saturationchainout_overflow_out_reg : 1'b0;
assign dataout = (((operation_mode == "accumulator_chain_out")||(operation_mode == "two_level_adder_chain_out")) &&(zerochainout_out_reg == 1'b1)) ? 72'b0 :dataout_tmp;
assign loopbackout = loopbackout_tmp[35:18];
endmodule