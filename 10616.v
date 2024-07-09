module    stratixv_termination    (
    rzqin,
    enserusr,
    nclrusr,
    clkenusr,
    clkusr,
    scanen,
    serdatafromcore,
    scanclk,
    otherenser,
	 serdatain,
    serdataout,
    enserout,
    compoutrup,
    compoutrdn,
    serdatatocore,
    scanin,
    scanout,
    clkusrdftout);
    parameter lpm_type = "stratixv_termination";
	parameter a_oct_cal_mode = "a_oct_cal_mode_none";
	parameter a_oct_user_oct = "a_oct_user_oct_off";
	parameter a_oct_nclrusr_inv = "a_oct_nclrusr_inv_off";
	parameter a_oct_pwrdn = "a_oct_pwrdn_on";
	parameter a_oct_intosc = "a_oct_intosc_none";
	parameter a_oct_test_0 = "a_oct_test_0_off";
	parameter a_oct_test_1 = "a_oct_test_1_off";
	parameter a_oct_test_4 = "a_oct_test_4_off";
	parameter a_oct_test_5 = "a_oct_test_5_off";
	parameter a_oct_pllbiasen = "a_oct_pllbiasen_dis";
	parameter a_oct_clkenusr_inv = "a_oct_clkenusr_inv_off";
	parameter a_oct_enserusr_inv = "a_oct_enserusr_inv_off";
	parameter a_oct_scanen_inv = "a_oct_scanen_inv_off";
	parameter a_oct_vrefl = "a_oct_vrefl_m";
	parameter a_oct_vrefh = "a_oct_vrefh_m";
	parameter a_oct_rsmult = "a_oct_rsmult_1";
	parameter a_oct_rsadjust = "a_oct_rsadjust_none";
	parameter a_oct_calclr = "a_oct_calclr_off";
	parameter a_oct_rshft_rup = "a_oct_rshft_rup_enable";
	parameter a_oct_rshft_rdn = "a_oct_rshft_rdn_enable";
	parameter a_oct_usermode = "false";
    input rzqin;
    input enserusr;
    input nclrusr;
    input clkenusr;
    input clkusr;
    input scanen;
    input serdatafromcore;
    input serdatain;
    input scanclk;
    input [9 : 0] otherenser;
    output serdataout;
    output enserout;
    output compoutrup;
    output compoutrdn;
    output serdatatocore;
    input scanin;
    output scanout;
    output clkusrdftout;
    stratixv_termination_encrypted inst (
        .rzqin(rzqin),
	.enserusr(enserusr),
    	.nclrusr(nclrusr),
    	.clkenusr(clkenusr),
    	.clkusr(clkusr),
    	.scanen(scanen),
    	.serdatafromcore(serdatafromcore),
    	.scanclk(scanclk),
    	.otherenser(otherenser),
    	.serdataout(serdataout),
    	.enserout(enserout),
    	.compoutrup(compoutrup),
    	.compoutrdn(compoutrdn),
    	.serdatatocore(serdatatocore),
    	.scanin(scanin),
    	.scanout(scanout),
        .clkusrdftout(clkusrdftout));
    defparam inst.lpm_type = lpm_type;
/*
    defparam inst.a_oct_nclrusr_inv = a_oct_nclrusr_inv;
    defparam inst.a_oct_pwrdn = a_oct_pwrdn;
    defparam inst.a_oct_clkdiv = a_oct_clkdiv;
    defparam inst.a_oct_intosc = a_oct_intosc;
    defparam inst.a_oct_vref = a_oct_vref;
    defparam inst.a_oct_test_0 = a_oct_test_0;
    defparam inst.a_oct_test_1 = a_oct_test_1;
    defparam inst.a_oct_test_2 = a_oct_test_2;
    defparam inst.a_oct_test_3 = a_oct_test_3;
    defparam inst.a_oct_test_4 = a_oct_test_4;
    defparam inst.a_oct_test_5 = a_oct_test_5;
    defparam inst.a_oct_pllbiasen = a_oct_pllbiasen;
    defparam inst.a_oct_usermode = a_oct_usermode;
*/
	defparam inst.a_oct_cal_mode = "a_oct_cal_mode_none";
	defparam inst.a_oct_user_oct = "a_oct_user_oct_off";
	defparam inst.a_oct_nclrusr_inv = "a_oct_nclrusr_inv_off";
	defparam inst.a_oct_pwrdn = "a_oct_pwrdn_on";
	defparam inst.a_oct_intosc = "a_oct_intosc_none";
	defparam inst.a_oct_test_0 = "a_oct_test_0_off";
	defparam inst.a_oct_test_1 = "a_oct_test_1_off";
	defparam inst.a_oct_test_4 = "a_oct_test_4_off";
	defparam inst.a_oct_test_5 = "a_oct_test_5_off";
	defparam inst.a_oct_pllbiasen = "a_oct_pllbiasen_dis";
	defparam inst.a_oct_clkenusr_inv = "a_oct_clkenusr_inv_off";
	defparam inst.a_oct_enserusr_inv = "a_oct_enserusr_inv_off";
	defparam inst.a_oct_scanen_inv = "a_oct_scanen_inv_off";
	defparam inst.a_oct_vrefl = "a_oct_vrefl_m";
	defparam inst.a_oct_vrefh = "a_oct_vrefh_m";
	defparam inst.a_oct_rsmult = "a_oct_rsmult_1";
	defparam inst.a_oct_rsadjust = "a_oct_rsadjust_none";
	defparam inst.a_oct_calclr = "a_oct_calclr_off";
	defparam inst.a_oct_rshft_rup = "a_oct_rshft_rup_enable";
	defparam inst.a_oct_rshft_rdn = "a_oct_rshft_rdn_enable";
	defparam inst.a_oct_usermode = "false";
endmodule