module    stratixv_dqs_config    (
    datain,
  	clk,
  	ena,
  	update,
	postamblepowerdown,
  	dqsbusoutdelaysetting,
  	dqsbusoutdelaysetting2,
  	dqsinputphasesetting,
  	dqsoutputphasesetting,
  	dqoutputphasesetting,
  	resyncinputphasesetting,
  	enaoctcycledelaysetting,
  	enainputcycledelaysetting,
  	enaoutputcycledelaysetting,
  	dqsenabledelaysetting,
  	octdelaysetting1,
  	octdelaysetting2,
  	enadqsenablephasetransferreg,
  	enaoctphasetransferreg,
  	enaoutputphasetransferreg,
  	enainputphasetransferreg,
	enadqscycledelaysetting,
	enadqsphasetransferreg,
  	resyncinputphaseinvert,
  	dqoutputphaseinvert,
  	dqsoutputphaseinvert,
  	dataout,
  	resyncinputzerophaseinvert,
  	dqs2xoutputphasesetting,
  	dqs2xoutputphaseinvert,
  	ck2xoutputphasesetting,
    ck2xoutputphaseinvert,
    dq2xoutputphasesetting,
    dq2xoutputphaseinvert,
    postamblephasesetting,
    postamblephaseinvert,
    dividerphaseinvert,
    addrphasesetting,
    addrphaseinvert,
    dqoutputzerophasesetting,
    postamblezerophasesetting,
    dividerioehratephaseinvert,
    dqsdisablendelaysetting,
    addrpowerdown,
	dqsoutputpowerdown,
	dqoutputpowerdown,
	resyncinputpowerdown,
	dqs2xoutputpowerdown,
	ck2xoutputpowerdown,
	dq2xoutputpowerdown);
    parameter    lpm_type    =    "stratixv_dqs_config";
    // INPUT PORTS
	input        datain;
	input        clk;
	input        ena;
	input        update;
	// OUTPUT PORTS
	output       dqoutputpowerdown;
	output       dqsoutputpowerdown;
	output       resyncinputpowerdown;
	output       postamblepowerdown;
	output [5:0] dqsbusoutdelaysetting;
	output [5:0] dqsbusoutdelaysetting2; // SPR 362735
	output [1:0] dqsinputphasesetting;  // SPR 362735
	output [1:0] dqsoutputphasesetting; // SPR 362735
	output [1:0] dqoutputphasesetting; // SPR 362735
	output [1:0] resyncinputphasesetting; // SPR 362735
	output [2:0] enaoctcycledelaysetting; // SPR 362735
	output       enainputcycledelaysetting;
	output [2:0] enaoutputcycledelaysetting; // SPR 362735
	output [7:0] dqsenabledelaysetting; // SPR 362735
	output [4:0] octdelaysetting1; // SPR 362735
	output [4:0] octdelaysetting2; // SPR 362735
	output       enadqsenablephasetransferreg;
	output       enaoctphasetransferreg;
	output       enaoutputphasetransferreg;
	output       enainputphasetransferreg;
	output [2:0] enadqscycledelaysetting; // SPR 362735
	output       enadqsphasetransferreg;
	output       resyncinputphaseinvert;
	output       dqoutputphaseinvert;
	output       dqsoutputphaseinvert;
	output       dataout;
	output       resyncinputzerophaseinvert;
	output [1:0] dqs2xoutputphasesetting; // SPR 362735
	output       dqs2xoutputphaseinvert;
	output [1:0] ck2xoutputphasesetting; // SPR 362735
	output       ck2xoutputphaseinvert;
	output [1:0] dq2xoutputphasesetting; // SPR 362735
	output       dq2xoutputphaseinvert;
	output [1:0] postamblephasesetting; // SPR 362735
	output       postamblephaseinvert;
	output [1:0] addrphasesetting; // SPR 362735
	output       addrphaseinvert;
	output [1:0] dqoutputzerophasesetting; //SPR 362735
	output [2:0] postamblezerophasesetting; //SPR 362735
	output       dividerioehratephaseinvert; // SPR 362735
	output       dividerphaseinvert; // SPR 362735
	output [7:0] dqsdisablendelaysetting; // SPR 362735
	output 		 addrpowerdown;
	output 		 dqs2xoutputpowerdown;
	output		 ck2xoutputpowerdown;
	output	     dq2xoutputpowerdown;
    stratixv_dqs_config_encrypted inst (
    	.datain(datain),
  		.clk(clk),
  		.ena(ena),
  		.update(update),
  		.dqsbusoutdelaysetting(dqsbusoutdelaysetting),
  		.dqsbusoutdelaysetting2(dqsbusoutdelaysetting2),
  		.dqsinputphasesetting(dqsinputphasesetting),
  		.dqsoutputphasesetting(dqsoutputphasesetting),
  		.dqoutputphasesetting(dqoutputphasesetting),
  		.resyncinputphasesetting(resyncinputphasesetting),
  		.enaoctcycledelaysetting(enaoctcycledelaysetting),
  		.enainputcycledelaysetting(enainputcycledelaysetting),
  		.enaoutputcycledelaysetting(enaoutputcycledelaysetting),
  		.dqsenabledelaysetting(dqsenabledelaysetting),
  		.octdelaysetting1(octdelaysetting1),
  		.octdelaysetting2(octdelaysetting2),
  		.enadqsenablephasetransferreg(enadqsenablephasetransferreg),
  		.enaoctphasetransferreg(enaoctphasetransferreg),
  		.enaoutputphasetransferreg(enaoutputphasetransferreg),
  		.enainputphasetransferreg(enainputphasetransferreg),
		.enadqscycledelaysetting(enadqscycledelaysetting),
		.enadqsphasetransferreg(enadqsphasetransferreg),
  		.resyncinputphaseinvert(resyncinputphaseinvert),
  		.dqoutputphaseinvert(dqoutputphaseinvert),
  		.dqsoutputphaseinvert(dqsoutputphaseinvert),
  		.dataout(dataout),
  		.resyncinputzerophaseinvert(resyncinputzerophaseinvert),
  		.dqs2xoutputphasesetting(dqs2xoutputphasesetting),
  		.dqs2xoutputphaseinvert(dqs2xoutputphaseinvert),
  		.ck2xoutputphasesetting(ck2xoutputphasesetting),
    	.ck2xoutputphaseinvert(ck2xoutputphaseinvert),
    	.dq2xoutputphasesetting(dq2xoutputphasesetting),
    	.dq2xoutputphaseinvert(dq2xoutputphaseinvert),
    	.postamblephasesetting(postamblephasesetting),
    	.postamblephaseinvert(postamblephaseinvert),
    	.dividerphaseinvert(dividerphaseinvert),
    	.addrphasesetting(addrphasesetting),
    	.addrphaseinvert(addrphaseinvert),
    	.dqoutputzerophasesetting(dqoutputzerophasesetting),
    	.postamblezerophasesetting(postamblezerophasesetting),
    	.dividerioehratephaseinvert(dividerioehratephaseinvert),
    	.dqsdisablendelaysetting(dqsdisablendelaysetting),
    	.addrpowerdown(addrpowerdown),
		.dqsoutputpowerdown(dqsoutputpowerdown),
		.dqoutputpowerdown(dqoutputpowerdown),
		.resyncinputpowerdown(resyncinputpowerdown),
		.dqs2xoutputpowerdown(dqs2xoutputpowerdown),
		.ck2xoutputpowerdown(ck2xoutputpowerdown),
		.dq2xoutputpowerdown(dq2xoutputpowerdown),
		.postamblepowerdown(postamblepowerdown));
    defparam inst.lpm_type = lpm_type;
endmodule