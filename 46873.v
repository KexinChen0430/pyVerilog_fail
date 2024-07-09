module    stratixv_hssi_pma_cdr_refclk_select_mux    (
    calclk,
    ffplloutbot,
    ffpllouttop,
    pldclk,
    refiqclk0,
    refiqclk1,
    refiqclk10,
    refiqclk2,
    refiqclk3,
    refiqclk4,
    refiqclk5,
    refiqclk6,
    refiqclk7,
    refiqclk8,
    refiqclk9,
    rxiqclk0,
    rxiqclk1,
    rxiqclk10,
    rxiqclk2,
    rxiqclk3,
    rxiqclk4,
    rxiqclk5,
    rxiqclk6,
    rxiqclk7,
    rxiqclk8,
    rxiqclk9,
    avmmclk,
    avmmrstn,
    avmmwrite,
    avmmread,
    avmmbyteen,
    avmmaddress,
    avmmwritedata,
    avmmreaddata,
    blockselect,
    clkout);
    parameter    lpm_type    =    "stratixv_hssi_pma_cdr_refclk_select_mux";
    parameter    channel_number    =    0;
      // the mux_type parameter is used for dynamic reconfiguration
   // support. It specifies whethter this mux should listen to the
   // DPRIO memory space for the CDR REF CLK mux or for the LC REF CLK
   // mux
parameter mux_type = "cdr_refclk_select_mux"; // cdr_refclk_select_mux|lc_refclk_select_mux
    parameter    refclk_select    =    "ref_iqclk0";
    parameter    reference_clock_frequency    =    "0 ps";
    parameter    avmm_group_channel_index = 0;
    parameter    use_default_base_address = "true";
    parameter    user_base_address = 0;
    input         calclk;
    input         ffplloutbot;
    input         ffpllouttop;
    input         pldclk;
    input         refiqclk0;
    input         refiqclk1;
    input         refiqclk10;
    input         refiqclk2;
    input         refiqclk3;
    input         refiqclk4;
    input         refiqclk5;
    input         refiqclk6;
    input         refiqclk7;
    input         refiqclk8;
    input         refiqclk9;
    input         rxiqclk0;
    input         rxiqclk1;
    input         rxiqclk10;
    input         rxiqclk2;
    input         rxiqclk3;
    input         rxiqclk4;
    input         rxiqclk5;
    input         rxiqclk6;
    input         rxiqclk7;
    input         rxiqclk8;
    input         rxiqclk9;
    input         avmmclk;
    input         avmmrstn;
    input         avmmwrite;
    input         avmmread;
    input  [ 1:0] avmmbyteen;
    input  [10:0] avmmaddress;
    input  [15:0] avmmwritedata;
    output [15:0] avmmreaddata;
    output        blockselect;
    output        clkout;
    stratixv_hssi_pma_cdr_refclk_select_mux_encrypted inst (
        .calclk(calclk),
        .ffplloutbot(ffplloutbot),
        .ffpllouttop(ffpllouttop),
        .pldclk(pldclk),
        .refiqclk0(refiqclk0),
        .refiqclk1(refiqclk1),
        .refiqclk10(refiqclk10),
        .refiqclk2(refiqclk2),
        .refiqclk3(refiqclk3),
        .refiqclk4(refiqclk4),
        .refiqclk5(refiqclk5),
        .refiqclk6(refiqclk6),
        .refiqclk7(refiqclk7),
        .refiqclk8(refiqclk8),
        .refiqclk9(refiqclk9),
        .rxiqclk0(rxiqclk0),
        .rxiqclk1(rxiqclk1),
        .rxiqclk10(rxiqclk10),
        .rxiqclk2(rxiqclk2),
        .rxiqclk3(rxiqclk3),
        .rxiqclk4(rxiqclk4),
        .rxiqclk5(rxiqclk5),
        .rxiqclk6(rxiqclk6),
        .rxiqclk7(rxiqclk7),
        .rxiqclk8(rxiqclk8),
        .rxiqclk9(rxiqclk9),
	.avmmclk(avmmclk),
	.avmmrstn(avmmrstn),
	.avmmwrite(avmmwrite),
	.avmmread(avmmread),
	.avmmbyteen(avmmbyteen),
	.avmmaddress(avmmaddress),
	.avmmwritedata(avmmwritedata),
	.avmmreaddata(avmmreaddata),
	.blockselect(blockselect),
        .clkout(clkout) );
    defparam inst.lpm_type = lpm_type;
    defparam inst.channel_number = channel_number;
    defparam inst.refclk_select = refclk_select;
    defparam inst.reference_clock_frequency = reference_clock_frequency;
    defparam inst.avmm_group_channel_index = avmm_group_channel_index;
    defparam inst.use_default_base_address = use_default_base_address;
    defparam inst.user_base_address = user_base_address;
endmodule