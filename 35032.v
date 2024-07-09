module pci_exp_x1_core_wrap_rc (
   input wire             sys_clk_250,
   input wire             sys_clk_125,
   input wire             rst_n,
   input wire [3:0]       phy_force_cntl,
   input wire [12:0]      phy_ltssm_cntl,
   input wire  [1:0]         tx_dllp_val,
   input wire  [2:0]         tx_pmtype,
   input wire  [23:0]        tx_vsd_data,
   input wire                tx_req_vc0,
   input wire [15:0]         tx_data_vc0,
   input wire                tx_st_vc0,
   input wire                tx_end_vc0,
   input wire                tx_nlfy_vc0,
   input wire                ph_buf_status_vc0,
   input wire                pd_buf_status_vc0,
   input wire                nph_buf_status_vc0,
   input wire                npd_buf_status_vc0,
   input wire                cplh_buf_status_vc0,
   input wire                cpld_buf_status_vc0,
   input wire                ph_processed_vc0,
   input wire                pd_processed_vc0,
   input wire                nph_processed_vc0,
   input wire                npd_processed_vc0,
   input wire                cplh_processed_vc0,
   input wire                cpld_processed_vc0,
   input wire [7:0]          pd_num_vc0,
   input wire [7:0]          npd_num_vc0,
   input wire [7:0]          cpld_num_vc0,
   input wire  [7:0]         rxp_data,
   input wire                rxp_data_k,
   input wire                rxp_valid,
   input wire                rxp_elec_idle,
   input wire  [2:0]         rxp_status,
   input wire                phy_status,
   `ifdef ECRC
      input wire             ecrc_gen_enb ,
      input wire             ecrc_chk_enb ,
   `endif
   input wire  [15:0]        tx_lbk_data,
   input wire  [1:0]         tx_lbk_kcntl,
   output wire               tx_lbk_rdy,
   output wire [15:0]        rx_lbk_data,
   output wire [1:0]         rx_lbk_kcntl,
   output wire               tx_dllp_sent,
   output wire [2:0]         rxdp_pmd_type,
   output wire [23:0]        rxdp_vsd_data ,
   output wire [1:0]         rxdp_dllp_val,
   output wire [7:0]         txp_data,
   output wire               txp_data_k,
   output wire               txp_elec_idle,
   output wire               txp_compliance,
   output wire               rxp_polarity,
   output wire               txp_detect_rx_lb,
   output wire               reset_n,
   output wire [1:0]         power_down,
   output wire               tx_rdy_vc0,
   output wire [8:0]         tx_ca_ph_vc0,
   output wire [12:0]        tx_ca_pd_vc0,
   output wire [8:0]         tx_ca_nph_vc0,
   output wire [12:0]        tx_ca_npd_vc0,
   output wire [8:0]         tx_ca_cplh_vc0,
   output wire [12:0]        tx_ca_cpld_vc0,
   output wire [15:0]        rx_data_vc0,
   output wire               rx_st_vc0,
   output wire               rx_end_vc0,
   `ifdef ECRC
      output wire            rx_ecrc_err_vc0 ,
   `endif
   output wire               rx_pois_tlp_vc0 ,
   output wire               rx_malf_tlp_vc0 ,
   output wire               inta_n ,
   output wire               intb_n ,
   output wire               intc_n ,
   output wire               intd_n ,
   output wire               ftl_err_msg ,
   output wire               nftl_err_msg ,
   output wire               cor_err_msg ,
   output wire [7:0]         dll_status,
   output wire [2:0]         phy_cfgln_sum,
   output wire               phy_pol_compliance,
   output wire [3:0]         phy_ltssm_state,
   output wire [2:0]         phy_ltssm_substate    ) ;
`ifdef LW1
parameter LANE_WIDTH = 1 ;
`else
`ifdef LW2
parameter LANE_WIDTH = 2 ;
`else
`ifdef LW4
parameter LANE_WIDTH = 4 ;
`else
parameter LANE_WIDTH = 1 ;
`endif
`endif
`endif
parameter D_WIDTH = 16 ;
parameter K27_7 = 8'hFB ;
parameter K28_0 = 8'h1C ;
parameter K28_2 = 8'h5C ;
parameter K28_3 = 8'h7C ;
parameter K28_5 = 8'hBC ;
parameter K29_7 = 8'hFD ;
parameter K30_7 = 8'hFE ;
parameter K23_7 = 8'hF7 ;
parameter K28_1 = 8'h3C ;
parameter D5_2  = 8'h45 ;
parameter D10_2 = 8'h4A ;
parameter D21_5 = 8'hB5 ;
parameter D26_5 = 8'hBA ;
parameter COM = K28_5 ;
parameter STP = K27_7 ;
parameter SDP = K28_2 ;
parameter END = K29_7 ;
parameter EDB = K30_7 ;
parameter SKP = K28_0 ;
parameter IDL = K28_3 ;
parameter PAD = K23_7 ;
parameter FTS = K28_1 ;
parameter OS_WIDTH      = 4 ;
parameter OS_T1_LIP_LAP = 4'd0 ;
parameter OS_T2_LIP_LAP = 4'd1 ;
parameter OS_COMPLI     = 4'd2 ;
parameter OS_T1         = 4'd3 ;
parameter OS_T2         = 4'd4 ;
parameter OS_IDLE       = 4'd5 ;
parameter OS_EIDLE      = 4'd6 ;
parameter OS_NFTS       = 4'd7 ;
parameter OS_BEACON     = 4'd8 ;
parameter DSM_WIDTH    = 2 ;
parameter PSM_WIDTH    = 2 ;
parameter RSM_WIDTH    = 2 ;
parameter L0SM_WIDTH   = 2 ;
parameter L0sTSM_WIDTH = 2 ;
parameter L0sRSM_WIDTH = 2 ;
parameter L1SM_WIDTH   = 1 ;
parameter L2SM_WIDTH   = 1 ;
parameter DISM_WIDTH   = 2 ;
parameter LBSM_WIDTH   = 2 ;
parameter HRSM_WIDTH   = 1 ;
parameter CFGSM_WIDTH  = 2 ;
parameter MSM_WIDTH    = 3 ;
parameter DETECT    = 4'd0 ;
parameter POLLING   = 4'd1 ;
parameter CONFIG    = 4'd2 ;
parameter L0        = 4'd3 ;
parameter L0s       = 4'd4 ;
parameter L1        = 4'd5 ;
parameter L2        = 4'd6 ;
parameter RECOVERY  = 4'd7 ;
parameter LOOPBACK  = 4'd8 ;
parameter HOTRST    = 4'd9 ;
parameter DISABLED  = 4'd10 ;
`ifdef VC1
parameter FADDR = 3 ;
`else
`ifdef VC2
parameter FADDR = 3 ;
`else
`ifdef VC3
parameter FADDR = 5 ;
`else
`ifdef VC4
parameter FADDR = 5 ;
`else
parameter FADDR = 6 ;
`endif
`endif
`endif
`endif
wire [2:0] rtcdaa7;
`ifdef MAX_PL_SIZE_128
`endif
`ifdef MAX_PL_SIZE_256
`endif
`ifdef MAX_PL_SIZE_512
`endif
`ifdef MAX_PL_SIZE_1K
`endif
`ifdef MAX_PL_SIZE_2K
`endif
`ifdef MAX_PL_SIZE_4K
`endif
`ifdef ECRC
`endif
`ifdef ECRC
`endif
reg sjb4aa1;
reg [3 : 0] faeb468;
reg [12 : 0] ld5a342;
reg [1 : 0] vkad436;
reg [2 : 0] ip7f3bf;
reg [23 : 0] wl1895f;
reg dm42c01;
reg [15 : 0] bn1600a;
reg tjb0056;
reg wl802b6;
reg vk15b4;
reg mgada2;
reg ww56d10;
reg gqb6881;
reg wlb4408;
reg twa2044;
reg mg10222;
reg hd81111;
reg gd888e;
reg gb44475;
reg zz223ac;
reg je11d66;
reg fp8eb32;
reg [7 : 0] uv75996;
reg [7 : 0] gqaccb5;
reg [7 : 0] rg665a8;
reg [7 : 0] zm86ce6;
reg ux36732;
reg gqb3995;
reg vk9cca8;
reg [2 : 0] ble6542;
reg ice58b3;
reg [15 : 0] ui43b2e;
reg [1 : 0] gd1d970;
reg [2 : 0] gd26aed;
reg [2047:0] necf6c2;
wire [34:0] ld7b613;
`ifdef LW1
`else
`ifdef LW2
`else
`ifdef LW4
`else
`endif
`endif
`endif
`ifdef VC1
`else
`ifdef VC2
`else
`ifdef VC3
`else
`ifdef VC4
`else
`endif
`endif
`endif
`endif
`ifdef MAX_PL_SIZE_128
`endif
`ifdef MAX_PL_SIZE_256
`endif
`ifdef MAX_PL_SIZE_512
`endif
`ifdef MAX_PL_SIZE_1K
`endif
`ifdef MAX_PL_SIZE_2K
`endif
`ifdef MAX_PL_SIZE_4K
`endif
`ifdef ECRC
`endif
`ifdef ECRC
`endif
localparam qgdb09f = 35,nrd84f8 = 32'hfdffe0cb;
localparam [31:0] thc27c7 = nrd84f8;
localparam mt9f1ff = nrd84f8 & 4'hf;
localparam [11:0] fnc7fe5 = 'h7ff;
wire  [(1 << mt9f1ff)  -1:0] suff972;
reg    [qgdb09f-1:0] cme5c87;
reg [mt9f1ff-1:0] qg721c0 [0:1];
reg [mt9f1ff-1:0] ym8700c;
reg rv38061;
integer jcc030e;
integer vk1872;
`ifdef LW1
`else
`ifdef LW2
`else
`ifdef LW4
`else
`endif
`endif
`endif
`ifdef VC1
`else
`ifdef VC2
`else
`ifdef VC3
`else
`ifdef VC4
`else
`endif
`endif
`endif
`endif
`ifdef MAX_PL_SIZE_128
`endif
`ifdef MAX_PL_SIZE_256
`endif
`ifdef MAX_PL_SIZE_512
`endif
`ifdef MAX_PL_SIZE_1K
`endif
`ifdef MAX_PL_SIZE_2K
`endif
`ifdef MAX_PL_SIZE_4K
`endif
`ifdef ECRC
`endif
`ifdef ECRC
`endif
`ifdef LW1
`else
`ifdef LW2
`else
`ifdef LW4
`else
`endif
`endif
`endif
`ifdef VC1
`else
`ifdef VC2
`else
`ifdef VC3
`else
`ifdef VC4
`else
`endif
`endif
`endif
`endif
`ifdef MAX_PL_SIZE_128
   assign rtcdaa7 = 3'b000 ;
`endif
`ifdef MAX_PL_SIZE_256
   assign rtcdaa7 = 3'b001 ;
`endif
`ifdef MAX_PL_SIZE_512
   assign rtcdaa7 = 3'b010 ;
`endif
`ifdef MAX_PL_SIZE_1K
   assign rtcdaa7 = 3'b011 ;
`endif
`ifdef MAX_PL_SIZE_2K
   assign rtcdaa7 = 3'b100 ;
`endif
`ifdef MAX_PL_SIZE_4K
   assign rtcdaa7 = 3'b101 ;
`endif
ui53fa3 byee020(      .sys_clk_250             ( sys_clk_250 ) ,   .sys_clk_125             ( sys_clk_125 ) ,   .rst_n                   ( sjb4aa1 ),   .yxd6218             ( `SKP_INS_CNT ),   .pse18cc         ( `ACKNAK_LAT_TIME ),   .lq697f3          ( `UPDATE_FREQ_PH ),   .kd4bf9b          ( `UPDATE_FREQ_PD ),   .jp5fcdc         ( `UPDATE_FREQ_NPH ),   .lqfe6e7         ( `UPDATE_FREQ_NPD ),   .thf373b        ( `UPDATE_FREQ_CPLH ),   .bn9b9df        ( `UPDATE_FREQ_CPLD ),   .nt8b8a0            ( `UPDATE_TIMER ),
   .wwd1bc3        ( faeb468[0] ),   .co8de18            ( faeb468[1] ),   .al6f0c1        ( faeb468[2] ),   .je1681       ( faeb468[3] ),   .fne316a           ( ld5a342[0] ),   .uv41608             ( ld5a342[1] ),   .uv6f189          ( ld5a342[2] ),   .yk78c4c              ( ld5a342[3] ),   .db84510              ( ld5a342[4] ),   .mtb4ec3             ( ld5a342[5] ),   .fne984c            ( ld5a342[6] ),   .ri1ec4a         ( ld5a342[7] ),   .ic4c266               ( ld5a342[8] ),   .th61330               ( ld5a342[9] ),   .shc6261              ( ld5a342[10] ),   .tj9987            ( ld5a342[11] ),   .vxb5a9a              ( ld5a342[12] ),   .xwe4b62           ( 1'b0 ),   .rtcdaa7             ( gd26aed ),   .zkd03c5                ( 1'b0 ),
      .tx_dllp_val             ( vkad436 ),   .tx_pmtype               ( ip7f3bf ),   .tx_vsd_data             ( wl1895f ),   .oh2362c          ( `INIT_PH_FC_VC0 ),   .zm1b164         ( `INIT_NPH_FC_VC0 ),   .hbd8b22        ( `INIT_CPLH_FC_VC0 ),   .rgc5916          ( `INIT_PD_FC_VC0 ),   .mt2c8b3         ( `INIT_NPD_FC_VC0 ),   .pf6459c        ( `INIT_CPLD_FC_VC0 ),   .tx_req_vc0              ( dm42c01 ),   .tx_data_vc0             ( bn1600a ),   .tx_st_vc0               ( tjb0056 ),   .tx_end_vc0              ( wl802b6 ),   .tx_nlfy_vc0             ( vk15b4 ),   .ph_buf_status_vc0       ( mgada2 ),   .pd_buf_status_vc0       ( ww56d10 ),   .nph_buf_status_vc0      ( gqb6881 ),   .npd_buf_status_vc0      ( wlb4408 ),   .cplh_buf_status_vc0     ( twa2044 ),   .cpld_buf_status_vc0     ( mg10222 ),   .ph_processed_vc0        ( hd81111 ),   .pd_processed_vc0        ( gd888e ),   .nph_processed_vc0       ( gb44475 ),   .npd_processed_vc0       ( zz223ac ),   .cplh_processed_vc0      ( je11d66 ),   .cpld_processed_vc0      ( fp8eb32 ),   .pd_num_vc0              ( uv75996 ),   .npd_num_vc0             ( gqaccb5 ),   .cpld_num_vc0            ( rg665a8 ),       .rxp_data               ( zm86ce6 ),   .rxp_data_k             ( ux36732 ),   .rxp_valid              ( gqb3995 ),   .rxp_elec_idle          ( vk9cca8 ),   .rxp_status             ( ble6542 ),
   .phy_status                 ( ice58b3),
`ifdef ECRC
      .ecrc_gen_enb            ( ecrc_gen_enb ) ,      .ecrc_chk_enb            ( ecrc_chk_enb ) ,
`endif
      .tx_lbk_data                ( ui43b2e ),   .tx_lbk_kcntl               ( gd1d970 ),   .tx_lbk_rdy                 ( tx_lbk_rdy ),   .rx_lbk_data                ( rx_lbk_data ),   .rx_lbk_kcntl               ( rx_lbk_kcntl ),      .tx_dllp_sent               ( tx_dllp_sent ),   .rxdp_pmd_type              ( rxdp_pmd_type ),   .rxdp_vsd_data              ( rxdp_vsd_data ),   .rxdp_dllp_val              ( rxdp_dllp_val ),         .txp_data                   ( txp_data ),   .txp_data_k                 ( txp_data_k ),   .txp_elec_idle              ( txp_elec_idle ),   .txp_compliance             ( txp_compliance ),   .rxp_polarity               ( rxp_polarity ),
   .txp_detect_rx_lb           ( txp_detect_rx_lb ),   .reset_n                    ( reset_n ),   .power_down                 ( power_down ),
      .tx_rdy_vc0                 ( tx_rdy_vc0),   .tx_ca_ph_vc0               ( tx_ca_ph_vc0),   .tx_ca_pd_vc0               ( tx_ca_pd_vc0),   .tx_ca_nph_vc0              ( tx_ca_nph_vc0),   .tx_ca_npd_vc0              ( tx_ca_npd_vc0),   .tx_ca_cplh_vc0             ( tx_ca_cplh_vc0),   .tx_ca_cpld_vc0             ( tx_ca_cpld_vc0),   .rx_data_vc0                ( rx_data_vc0),   .rx_st_vc0                  ( rx_st_vc0),   .rx_end_vc0                 ( rx_end_vc0),
`ifdef ECRC
      .rx_ecrc_err_vc0         ( rx_ecrc_err_vc0 ),
`endif
   .rx_pois_tlp_vc0            ( rx_pois_tlp_vc0 ),   .rx_malf_tlp_vc0            ( rx_malf_tlp_vc0 ),
      .inta_n                     ( inta_n ) ,   .intb_n                     ( intb_n ) ,   .intc_n                     ( intc_n ) ,   .intd_n                     ( intd_n ) ,   .ftl_err_msg                ( ftl_err_msg ) ,   .nftl_err_msg               ( nftl_err_msg ) ,   .cor_err_msg                ( cor_err_msg ) ,      .aaf45c                      ( dll_status[0] ),   .hbf3ba3                    ( dll_status[1] ),   .dmfe774                ( dll_status[2] ),   .gdaecfa              ( dll_status[3] ),   .cm77093                 ( dll_status[4] ),   .mtd38a               ( dll_status[5] ),   .mg151a8             ( dll_status[6] ),   .tu637fb             ( dll_status[7] ),      .phy_cfgln_sum              ( phy_cfgln_sum ),   .phy_pol_compliance         ( phy_pol_compliance ),   .phy_ltssm_state            ( phy_ltssm_state ),   .phy_ltssm_substate         ( phy_ltssm_substate )   );
always@* begin sjb4aa1<=ld7b613[0];faeb468<={phy_force_cntl>>1,ld7b613[1]};ld5a342<={phy_ltssm_cntl>>1,ld7b613[2]};vkad436<={tx_dllp_val>>1,ld7b613[3]};ip7f3bf<={tx_pmtype>>1,ld7b613[4]};wl1895f<={tx_vsd_data>>1,ld7b613[5]};dm42c01<=ld7b613[6];bn1600a<={tx_data_vc0>>1,ld7b613[7]};tjb0056<=ld7b613[8];wl802b6<=ld7b613[9];vk15b4<=ld7b613[10];mgada2<=ld7b613[11];ww56d10<=ld7b613[12];gqb6881<=ld7b613[13];wlb4408<=ld7b613[14];twa2044<=ld7b613[15];mg10222<=ld7b613[16];hd81111<=ld7b613[17];gd888e<=ld7b613[18];gb44475<=ld7b613[19];zz223ac<=ld7b613[20];je11d66<=ld7b613[21];fp8eb32<=ld7b613[22];uv75996<={pd_num_vc0>>1,ld7b613[23]};gqaccb5<={npd_num_vc0>>1,ld7b613[24]};rg665a8<={cpld_num_vc0>>1,ld7b613[25]};zm86ce6<={rxp_data>>1,ld7b613[26]};ux36732<=ld7b613[27];gqb3995<=ld7b613[28];vk9cca8<=ld7b613[29];ble6542<={rxp_status>>1,ld7b613[30]};ice58b3<=ld7b613[31];ui43b2e<={tx_lbk_data>>1,ld7b613[32]};gd1d970<={tx_lbk_kcntl>>1,ld7b613[33]};gd26aed<={rtcdaa7>>1,ld7b613[34]};end
always@* begin necf6c2[2047]<=phy_force_cntl[0];necf6c2[2046]<=phy_ltssm_cntl[0];necf6c2[2044]<=tx_dllp_val[0];necf6c2[2040]<=tx_pmtype[0];necf6c2[2033]<=tx_vsd_data[0];necf6c2[2024]<=cplh_processed_vc0;necf6c2[2018]<=tx_req_vc0;necf6c2[2001]<=cpld_processed_vc0;necf6c2[1988]<=tx_data_vc0[0];necf6c2[1954]<=pd_num_vc0[0];necf6c2[1929]<=tx_st_vc0;necf6c2[1860]<=npd_num_vc0[0];necf6c2[1811]<=tx_end_vc0;necf6c2[1789]<=pd_processed_vc0;necf6c2[1673]<=cpld_num_vc0[0];necf6c2[1574]<=tx_nlfy_vc0;necf6c2[1530]<=nph_processed_vc0;necf6c2[1299]<=rxp_data[0];necf6c2[1258]<=tx_lbk_data[0];necf6c2[1247]<=cplh_buf_status_vc0;necf6c2[1102]<=rxp_valid;necf6c2[1101]<=ph_buf_status_vc0;necf6c2[1023]<=rst_n;necf6c2[1012]<=npd_processed_vc0;necf6c2[937]<=rtcdaa7[0];necf6c2[894]<=ph_processed_vc0;necf6c2[629]<=phy_status;necf6c2[623]<=npd_buf_status_vc0;necf6c2[551]<=rxp_data_k;necf6c2[468]<=tx_lbk_kcntl[0];necf6c2[447]<=cpld_buf_status_vc0;necf6c2[314]<=rxp_status[0];necf6c2[311]<=nph_buf_status_vc0;necf6c2[157]<=rxp_elec_idle;necf6c2[155]<=pd_buf_status_vc0;end         assign suff972 = necf6c2,ld7b613 = cme5c87;   initial begin   jcc030e = $fopen(".fred");   $fdisplay( jcc030e, "%3h\n%3h", (thc27c7 >> 4) & fnc7fe5, (thc27c7 >> (mt9f1ff+4)) & fnc7fe5 );   $fclose(jcc030e);   $readmemh(".fred", qg721c0);   end   always @ (suff972) begin   ym8700c = qg721c0[1];       for (vk1872=0; vk1872<qgdb09f; vk1872=vk1872+1) begin           cme5c87[vk1872] = suff972[ym8700c];       rv38061  = ^(ym8700c & qg721c0[0]);       ym8700c =  {ym8700c, rv38061};       end   end
endmodule