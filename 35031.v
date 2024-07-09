module ui53fa3 (
   input wire             sys_clk_250,
   input wire             sys_clk_125,
   input wire             rst_n,
   input wire [9:0]       yxd6218,
   input wire [13:0]      pse18cc,
   input wire [6:0]       lq697f3,
   input wire [10:0]      kd4bf9b,
   input wire [6:0]       jp5fcdc,
   input wire [10:0]      lqfe6e7,
   input wire [6:0]       thf373b,
   input wire [10:0]      bn9b9df,
   input wire [11:0]      nt8b8a0,
   input wire             wwd1bc3,
   input wire             co8de18,
   input wire             al6f0c1,
   input wire             je1681,
   input wire             xwe4b62,
   input wire             uv6f189,
   input wire             yk78c4c,
   input wire             db84510,
   input wire             mtb4ec3,
   input wire             fne984c,
   input wire             ic4c266,
   input wire             th61330,
   input wire             ri1ec4a,
   input wire             shc6261,
   input wire             tj9987,
   input wire             vxb5a9a,
   input wire             fne316a,
   input wire             uv41608,
   input wire [2:0]       rtcdaa7,
   input wire             zkd03c5,
   input wire  [1:0]      tx_dllp_val,
   input wire  [2:0]      tx_pmtype,
   input wire  [23:0]     tx_vsd_data,
   `ifdef EN_VC0
      input wire [7:0]       oh2362c,
      input wire [7:0]       zm1b164,
      input wire [7:0]       hbd8b22,
      input wire [11:0]      rgc5916,
      input wire [11:0]      mt2c8b3,
      input wire [11:0]      pf6459c,
      input wire             tx_req_vc0,
      input wire [15:0]      tx_data_vc0,
      input wire             tx_st_vc0,
      input wire             tx_end_vc0,
      input wire             tx_nlfy_vc0,
      input wire             ph_buf_status_vc0,
      input wire             pd_buf_status_vc0,
      input wire             nph_buf_status_vc0,
      input wire             npd_buf_status_vc0,
      input wire             cplh_buf_status_vc0,
      input wire             cpld_buf_status_vc0,
      input wire             ph_processed_vc0,
      input wire             pd_processed_vc0,
      input wire             nph_processed_vc0,
      input wire             npd_processed_vc0,
      input wire             cplh_processed_vc0,
      input wire             cpld_processed_vc0,
      input wire [7:0]       pd_num_vc0,
      input wire [7:0]       npd_num_vc0,
      input wire [7:0]       cpld_num_vc0,
   `endif
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
   `ifdef EN_VC0
      output wire            tx_rdy_vc0,
      output wire [8:0]      tx_ca_ph_vc0,
      output wire [12:0]     tx_ca_pd_vc0,
      output wire [8:0]      tx_ca_nph_vc0,
      output wire [12:0]     tx_ca_npd_vc0,
      output wire [8:0]      tx_ca_cplh_vc0,
      output wire [12:0]     tx_ca_cpld_vc0,
      output wire [15:0]     rx_data_vc0,
      output wire            rx_st_vc0,
      output wire            rx_end_vc0,
      `ifdef ECRC
         output wire         rx_ecrc_err_vc0 ,
      `endif
      output wire            rx_pois_tlp_vc0 ,
      output wire            rx_malf_tlp_vc0 ,
   `endif
   output wire               inta_n ,
   output wire               intb_n ,
   output wire               intc_n ,
   output wire               intd_n ,
   output wire               ftl_err_msg ,
   output wire               nftl_err_msg ,
   output wire               cor_err_msg ,
   output wire               aaf45c,
   output wire               hbf3ba3,
   output wire               dmfe774,
   output wire               gdaecfa,
   output wire               cm77093,
   output wire               mtd38a,
   output wire               tu637fb,
   output wire               mg151a8,
   output wire [2:0]         phy_cfgln_sum,
   output wire               phy_pol_compliance,
   output wire [3:0]         phy_ltssm_state,
   output wire [2:0]         phy_ltssm_substate    )
;
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
wire [D_WIDTH -1:0]          wwf5804 ;
wire [D_WIDTH -1:0]          vi6ceee ;
wire [15:0]                  jrb0b93 ;
wire [31:0]                  yz85c9f ;
wire [D_WIDTH -1:0]          kf9ae61 ;
wire [D_WIDTH -1:0]          ksa79d ;
wire [D_WIDTH -1:0]          icd170d ;
wire [15:0]                  ng30b67 ;
wire [2:0]                   yxcc596;
wire [1:0]                   os62cb4;
wire [2:0]                   xyb2d0e;
wire [1:0]                   ba96872;
wire [(`NUM_VC-1):0]         wlb4393;
wire [(`NUM_VC-1):0]         uxa1c9c;
wire [(`NUM_VC-1):0]         vke4e4;
wire [(24*`NUM_VC)-1:0]      me6705e;
wire [(24*`NUM_VC)-1:0]      lf382f0;
wire [(24*`NUM_VC)-1:0]      mec1786;
wire [`NUM_VC-1:0]           jpd27c8 ;
wire [`NUM_VC-1:0]           do93e46 ;
wire [`NUM_VC-1:0]           mt9f233 ;
wire [2:0]                   thec436 ;
wire [19:0]                  ui621b7 ;
wire [1:0]                   sj397d1 ;
wire [`NUM_VC-1:0]           ls1e282 ;
wire [`NUM_VC-1:0]           tj8b9ac ;
wire [(`NUM_VC*3)-1:0]       ay5cd66;
wire [2:0]                   yx51de5 ;
wire [FADDR:0]               ba250d2;
wire [7:0]                   tw1ece0;
wire                         pff6703;
wire [7:0]                   qv95390;
wire                         ksa9c85;
wire                         oh124b7;
wire [L0sTSM_WIDTH:0]        gbf8670;
wire [L1SM_WIDTH:0]          hd19c25;
wire [L2SM_WIDTH:0]          ip70971;
wire                         ps57f08;
wire                         fpbf843;
wire                         thfc21e;
wire                         zke10f6;
wire                         oh87b3;
wire                         me43d9c;
wire                         swb381f;
wire                         ho79420;
wire                         gd1de50;
wire                         icef284;
wire                         ir3392d;
wire                         cm72a72;
wire [(8*`NUM_VC)-1:0]      ofc3555;
wire [(8*`NUM_VC)-1:0]      mg1aaad;
wire [(8*`NUM_VC)-1:0]      jcd5569;
wire [(12*`NUM_VC)-1:0]     jraab4b;
wire [(12*`NUM_VC)-1:0]     vv55a5f;
wire [(12*`NUM_VC)-1:0]     vkad2fe;
wire [`NUM_VC -1:0]         gb65b08;
wire [(`NUM_VC*16)-1:0]     pub7014;
wire [`NUM_VC -1:0]         uk10db8;
wire [`NUM_VC -1:0]         ng86dc0;
wire [`NUM_VC -1:0]         cb36e02;
wire [`NUM_VC -1:0]         mt18edf;
wire [`NUM_VC -1:0]         hbc76fc;
wire [`NUM_VC -1:0]         ie3b7e7;
wire [`NUM_VC -1:0]         sudbf39;
wire [`NUM_VC -1:0]         fadf9c9;
wire [`NUM_VC -1:0]         hbfce4b;
wire [`NUM_VC -1:0]         mre725f;
wire [`NUM_VC -1:0]         kf392fc;
wire [`NUM_VC -1:0]         gbc97e4;
wire [`NUM_VC -1:0]         cz4bf24;
wire [`NUM_VC -1:0]         xj5f924;
wire [`NUM_VC -1:0]         vvfc927;
wire [(8*`NUM_VC)-1:0]      tue493f;
wire [(8*`NUM_VC)-1:0]      mg249fa;
wire [(8*`NUM_VC)-1:0]      ie24fd0;
wire [`NUM_VC -1:0]         zx64b62;
wire [(`NUM_VC*9)-1:0]      qi1a518;
wire [(`NUM_VC*13)-1:0]     nrd28c0;
wire [(`NUM_VC*9)-1:0]      ph94607;
wire [(`NUM_VC*13)-1:0]     coa303f;
wire [(`NUM_VC*9)-1:0]      ir181f8;
wire [(`NUM_VC*13)-1:0]     dmc0fc5;
wire [(`NUM_VC*16)-1:0]     fadf3e5;
wire [`NUM_VC -1:0]         dzf9f2a;
wire [`NUM_VC -1:0]         facf957;
wire [`NUM_VC -1:0]         cme55d3;
wire [`NUM_VC -1:0]         ls2ae99;
wire [`NUM_VC -1:0]         qi2e4ea;
wire [`NUM_VC -1:0]         mgacc3b;
wire [1:0]                  vvc8857;
wire                        jrc662;
reg                         eaea059;
reg                         dz502c8;
reg                         nt81647;
`ifdef ECRC
`endif
`ifdef ECRC
`endif
`ifdef ECRC
`endif
reg [9 : 0] en549cd;
reg [13 : 0] ldd748a;
reg [6 : 0] jr91d86;
reg [10 : 0] fp8ec36;
reg [6 : 0] tu761b6;
reg [10 : 0] bnb0db3;
reg [6 : 0] ls86d9f;
reg [10 : 0] mt36cfa;
reg [11 : 0] ir95972;
reg vk9610d;
reg xlb086a;
reg hd84357;
reg mt36395;
reg xybde55;
reg ip7ff53;
reg osffa9c;
reg cb1d8c6;
reg nt28480;
reg she8218;
reg of410c5;
reg kf862c;
reg hbc7a97;
reg uiea704;
reg go43164;
reg icc4365;
reg ou3b01d;
reg qg4956a;
reg [2 : 0] gd26aed;
reg wje877b;
reg [1 : 0] vkad436;
reg [2 : 0] ip7f3bf;
reg [23 : 0] wl1895f;
reg [7 : 0] zm86ce6;
reg ux36732;
reg gqb3995;
reg vk9cca8;
reg [2 : 0] ble6542;
reg ice58b3;
reg [15 : 0] ui43b2e;
reg [1 : 0] gd1d970;
reg [D_WIDTH - 1 : 0] qt60385;
reg [D_WIDTH - 1 : 0] kqea937;
reg [15 : 0] cbab5c6;
reg [31 : 0] nr5ae34;
reg [D_WIDTH - 1 : 0] ip41f91;
reg [D_WIDTH - 1 : 0] uk34f9c;
reg [D_WIDTH - 1 : 0] wl23286;
reg [15 : 0] thf3859;
reg [2 : 0] qv8adf7;
reg [1 : 0] cm56fbc;
reg [2 : 0] yzbef0a;
reg [1 : 0] off7854;
reg [(`NUM_VC - 1) : 0] gqbc2a4;
reg [(`NUM_VC - 1) : 0] zke1520;
reg [(`NUM_VC - 1) : 0] mga903;
reg [(24 * `NUM_VC) - 1 : 0] cb1d22c;
reg [(24 * `NUM_VC) - 1 : 0] jpe9165;
reg [(24 * `NUM_VC) - 1 : 0] tu48b2f;
reg [`NUM_VC - 1 : 0] mefa844;
reg [`NUM_VC - 1 : 0] uid4220;
reg [`NUM_VC - 1 : 0] sja1101;
reg [2 : 0] ld7b3a3;
reg [19 : 0] shd9d1f;
reg [1 : 0] pue56b;
reg [`NUM_VC - 1 : 0] vv7e6c2;
reg [`NUM_VC - 1 : 0] kfaea64;
reg [(`NUM_VC * 3) - 1 : 0] cz75325;
reg [2 : 0] qt4ecef;
reg [FADDR : 0] gdbe052;
reg [7 : 0] ep29c42;
reg cz4e214;
reg [7 : 0] gqb6b32;
reg xlb5990;
reg al51d1c;
reg [L0sTSM_WIDTH : 0] hq15aa;
reg [L1SM_WIDTH : 0] kq56a90;
reg [L2SM_WIDTH : 0] hdaa40e;
reg ep2c598;
reg ea62cc5;
reg db16629;
reg gqb314e;
reg ym98a71;
reg xwc5388;
reg bl710a5;
reg qt54e55;
reg nre9354;
reg tu4d539;
reg tu42f79;
reg by76d66;
reg [(8 * `NUM_VC) - 1 : 0] hq83f1a;
reg [(8 * `NUM_VC) - 1 : 0] ec1f8d2;
reg [(8 * `NUM_VC) - 1 : 0] zxfc691;
reg [(12 * `NUM_VC) - 1 : 0] xje348e;
reg [(12 * `NUM_VC) - 1 : 0] sw1a476;
reg [(12 * `NUM_VC) - 1 : 0] dzd23b0;
reg [`NUM_VC - 1 : 0] ym5efc;
reg [(`NUM_VC * 16) - 1 : 0] ks1f831;
reg [`NUM_VC - 1 : 0] ayce8fc;
reg [`NUM_VC - 1 : 0] hb747e0;
reg [`NUM_VC - 1 : 0] coa3f06;
reg [`NUM_VC - 1 : 0] ri1b63;
reg [`NUM_VC - 1 : 0] mtdb1b;
reg [`NUM_VC - 1 : 0] ay6d8dd;
reg [`NUM_VC - 1 : 0] vi6c6e8;
reg [`NUM_VC - 1 : 0] lq63743;
reg [`NUM_VC - 1 : 0] ba1ba1a;
reg [`NUM_VC - 1 : 0] bldd0d3;
reg [`NUM_VC - 1 : 0] ale869f;
reg [`NUM_VC - 1 : 0] yk434fd;
reg [`NUM_VC - 1 : 0] ou1a7e9;
reg [`NUM_VC - 1 : 0] wjd3f48;
reg [`NUM_VC - 1 : 0] ir9fa45;
reg [(8 * `NUM_VC) - 1 : 0] enfd22d;
reg [(8 * `NUM_VC) - 1 : 0] lde916c;
reg [(8 * `NUM_VC) - 1 : 0] jc48b67;
reg [`NUM_VC - 1 : 0] zz22abb;
reg [(`NUM_VC * 9) - 1 : 0] mg155df;
reg [(`NUM_VC * 13) - 1 : 0] hdaaef9;
reg [(`NUM_VC * 9) - 1 : 0] dm577cf;
reg [(`NUM_VC * 13) - 1 : 0] irbbe7a;
reg [(`NUM_VC * 9) - 1 : 0] psdf3d4;
reg [(`NUM_VC * 13) - 1 : 0] fnf9ea2;
reg [(`NUM_VC * 16) - 1 : 0] en41a7c;
reg [`NUM_VC - 1 : 0] wj7a8bb;
reg [`NUM_VC - 1 : 0] wwd45dc;
reg [`NUM_VC - 1 : 0] hqa2ee1;
reg [`NUM_VC - 1 : 0] an1770b;
reg [`NUM_VC - 1 : 0] kfbb85c;
reg [`NUM_VC - 1 : 0] zm2580e;
reg [1 : 0] nee1725;
reg vxba456;
reg qg5c95a;
reg lqe4ad0;
reg ba25682;
reg [2047:0] necf6c2;
wire [133:0] ld7b613;
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
`ifdef ECRC
`endif
`ifdef ECRC
`endif
`ifdef ECRC
`endif
localparam qgdb09f = 134,nrd84f8 = 32'hfdfff10b;
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
`ifdef ECRC
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
dz4a43a oh8ad9   (      .sys_clk             ( sys_clk_125 ),   .rst_n               ( rst_n ),      .qi875d4                ( sys_clk_250 ),   .fadf3e5             ( zm86ce6 ),   .dzd750a           ( ux36732 ),   .jrba856            ( gqb3995 ),   .wwd42b6        ( vk9cca8 ),   .ira15b1           ( ble6542 ),   .phy_status          ( ice58b3 ),
      .ps57f08     ( ep2c598 ),   .fpbf843       ( ea62cc5 ),   .zke10f6        ( gqb314e ),   .oh87b3       ( ym98a71 ),   .me43d9c      ( xwc5388 ),   .swb381f          ( bl710a5 ),   .tw1ece0            ( ep29c42 ),   .pff6703           ( cz4e214 ),   .thfc21e        ( db16629 ),   .phy_ltssm_state     ( phy_ltssm_state ),   .kf9f8b9        ( hq15aa ),   .lq58741            ( kq56a90 ),   .icc4288            ( hdaa40e ),
      .wwd1bc3     ( vk9610d ),   .co8de18         ( xlb086a ),   .al6f0c1     ( hd84357 ),         .pub7014             ( txp_data ),   .ipc3060           ( txp_data_k ),   .sj18305        ( txp_elec_idle ),   .eac182d       ( txp_compliance ),   .ntc169         ( rxp_polarity ),   .gb60b4e     ( txp_detect_rx_lb ),   .reset_n             ( reset_n ),   .power_down          ( power_down ),
      .qv95390            ( qv95390 ),   .ksa9c85           ( ksa9c85 ),   .oh124b7             ( oh124b7 ),   .ho79420        ( ho79420 ),   .gd1de50      ( gd1de50 ),   .icef284       ( icef284 ),   .lq79e8a        ( lq79e8a ),   .ir3392d       ( ir3392d ),   .cm72a72       ( cm72a72 )   );
dzf97e7 # (   .LANE_WIDTH       ( LANE_WIDTH ) ,   .MSM_WIDTH        ( MSM_WIDTH ) ,   .L0sTSM_WIDTH     ( L0sTSM_WIDTH ) ,   .L1SM_WIDTH       ( L1SM_WIDTH ) ,   .L2SM_WIDTH       ( L2SM_WIDTH )   )   wlb4929 (      .me77f56       ( sys_clk_250 ),   .alfd586       ( sys_clk_250 ),   .sys_clk          ( sys_clk_125 ),   .rst_n            ( rst_n ),         .coa90ef      ( 1'b1 ),   .fnddca9   ( 1'b0 ),
      .tu48ee4         ( 8'h5A ),   .nta504c        ( 5'd10 ),   .yxd6218      ( en549cd ),   .fa47723      ( 4'h2 ),
      .qv95390         ( gqb6b32 ),   .ksa9c85        ( xlb5990 ),   .oh124b7          ( qg5c95a ),   .ho79420     ( qt54e55 ),   .gd1de50   ( nre9354 ),   .icef284    ( tu4d539 ),   .lq79e8a     ( lq79e8a ),   .ir3392d    ( tu42f79 ),   .cm72a72    ( by76d66 ),
      .je1681( mt36395 ),   .xwe4b62    ( xybde55 ),   .uv6f189   ( ip7ff53 ),   .yk78c4c       ( osffa9c ),   .db84510       ( cb1d8c6 ),   .mtb4ec3      ( nt28480 ),   .fne984c     ( she8218 ),   .ic4c266        ( of410c5 ),   .th61330        ( kf862c ),   .ri1ec4a  ( hbc7a97 ),   .shc6261       ( uiea704 ),   .tj9987     ( go43164 ),   .vxb5a9a       ( icc4365 ),   .mrc95e4      ( 3'b111 ),   .ps661f9     ( qg4956a ) ,   .ea4cc3f     ( mg151a8 ) ,
      .fne316a    ( ou3b01d ),   .zkd03c5         ( wje877b ),
      .wwf5804       ( qt60385 ),   .wyac021         ( wyac021 ),   .uv60109        ( uv60109 ),   .ym84d        ( ym84d ),   .pu4269    ( pu4269 ),   .qi2134a   ( qi2134a ),   .vx9a51        ( bn169d7 ),
       .tx_lbk_data      ( ui43b2e ),   .tx_lbk_kcntl     ( gd1d970 ),      .tx_lbk_rdy       ( tx_lbk_rdy ),   .rx_lbk_data      ( rx_lbk_data ),   .rx_lbk_kcntl     ( rx_lbk_kcntl ),   .xw79cac  (  ),   .phy_ltssm_state  ( phy_ltssm_state ),   .phy_ltssm_substate ( phy_ltssm_substate ),   .phy_cfgln_sum    ( phy_cfgln_sum ),   .ho63221        ( ho63221 ),   .ui43120   ( phy_pol_compliance ),
      .vvc8857   ( vvc8857 ),   .jrc662     ( jrc662 ),
      .wj442bf     ( yx51de5 ),   .uk215fc      (  ),   .ymafe1      (  ),
      .ps57f08  ( ps57f08 ),   .oh87b3    ( oh87b3 ),   .fpbf843    ( fpbf843 ),   .thfc21e     ( thfc21e ),   .zke10f6     ( zke10f6 ),   .me43d9c   ( me43d9c ),   .tw1ece0         ( tw1ece0 ),   .pff6703        ( pff6703 ),   .swb381f       ( swb381f ),   .ng9c0f8       ( ls35987 ),   .kd7a2e1           ( kd7a2e1 ),   .gbf8670 ( gbf8670 ),   .hd19c25     ( hd19c25 ),   .ip70971     ( ip70971 ),   .ym3bfe4       ( ym3bfe4 ),
      .ng30b67       (ng30b67),   .ep85b3b     (ep85b3b),   .nt2d9dd    (nt2d9dd),   .vi6ceee       (vi6ceee),   .go67772        (go67772),   .mg3bb90          (mg3bb90),   .xjddc80         (xjddc80),   .psee406         (psee406),   .kq72032        (kq72032)    );
assign aaf45c   = kfbb85c[0];
rtcd9e4  #(   .FADDR           ( FADDR ) )   ng9cc0a (      .sys_clk         ( sys_clk_125 ),   .rst_n           ( rst_n ),      .kqce314       ( 1'b0 ),   .oh362e6    ( 12'd4095 ),   .pse18cc ( ldd748a ),      .fa79b01     ( fa79b01 ),   .kf9ae61    ( ip41f91 ),   .vvd730d      ( vvd730d ),   .ukb986e     ( ukb986e ),   .mrcc371    ( mrcc371 ),   .xjcd80b ( xjcd80b ),   .lf198b2     ( lf198b2 ),   .yxcc596       ( qv8adf7 ),   .os62cb4       ( cm56fbc ),   .fp165a1     ( fp165a1 ),   .xyb2d0e       ( yzbef0a ),   .ba96872       ( off7854 ),   .wlb4393   ( gqbc2a4 ),   .uxa1c9c  ( zke1520 ),   .vke4e4 ( mga903 ),
   .me6705e           ( cb1d22c ),   .lf382f0          ( jpe9165 ),   .mec1786         ( tu48b2f ),      .vi6ceee     ( kqea937 ),   .go67772      ( go67772 ),   .mg3bb90        ( mg3bb90 ),   .xjddc80       ( xjddc80 ),   .psee406       ( psee406 ),   .ux36419 ( thf3859 ),   .ep85b3b   ( ep85b3b ),   .nt2d9dd  ( nt2d9dd ),   .phy_ltssm_state( phy_ltssm_state ),   .ls35987    ( ls35987 ),   .kd7a2e1         ( kd7a2e1 ),   .tj8b9ac         ( 1'b1 ),   .ay5cd66       ( {(`NUM_VC){3'b000}} ),   .mtb1735        ( 1'b1 ),   .rtcdaa7    ( gd26aed ),   .jrc662   ( vxba456 ),   .zk63316 ( zk63316 ),   .mgacc3b        ( zm2580e ),      .os7da0f          ( vkad436[0] ),   .tx_pmtype      ( ip7f3bf[2:0] ),   .ww683cd      ( vkad436[1] ),   .tx_vsd_data    ( wl1895f ),         .thd20a8       ( thd20a8 ),      .wwf5804     ( wwf5804 ),   .vk30204      (  ),   .wyac021       ( wyac021 ),   .uv60109      ( uv60109 ),   .ym84d      ( ym84d ),   .pu4269  ( pu4269 ),   .qi2134a ( qi2134a ),   .bn169d7     ( bn169d7 ),
      .icd170d      ( icd170d ),   .bn8b869        ( bn8b869 ),   .me5c34e       ( me5c34e ),   .qgcbe8c  ( qgcbe8c ),   .fn5f460  ( fn5f460 ),   .ayfa306   ( ayfa306 ),   .sj397d1  ( sj397d1 ),   .ie872fa    ( {thec436, ui621b7} ),   .rxdp_vsd_data  ( rxdp_vsd_data ) ,   .rxdp_pmd_type  ( rxdp_pmd_type[2:0] ),   .rxdp_dllp_val  ( rxdp_dllp_val ),      .rib82be     ( rib82be ),   .icc15f2     ( icc15f2 ),   .jpd27c8    ( jpd27c8 ),   .do93e46   ( do93e46 ),   .mt9f233  ( mt9f233 ),      .ls1e282     ( ls1e282 ),   .gdaecfa  ( gdaecfa ),   .cm77093     ( cm77093 ),   .mtd38a   ( mtd38a ),   .mg151a8 ( mg151a8 ),   .tu637fb ( tu637fb ),      .dmfe774    ( dmfe774 ),   .hbf3ba3        ( hbf3ba3 ),   .co9dd1e      ( ),   .aaf45c          ( qi2e4ea ),
      .nrcd8df  ( ),   .sjdf8e   ( ),   .yx6fc75    ( ),      .ba250d2  ( ba250d2 ),      .cm46737   ( tx_dllp_sent )    );
always @(posedge sys_clk_250 or negedge rst_n) begin   if (!rst_n) begin      dz502c8 <= 1'b0 ;      nt81647 <= 1'b0 ;   end   else begin      dz502c8 <= ho63221 ;      nt81647 <= lqe4ad0 ;   end
end
always @(posedge sys_clk_250 or negedge rst_n) begin   if (!rst_n)      eaea059 <= 1'b0;   else      eaea059 <= (al51d1c & ba25682);
end
os4cb78  #(   .FADDR                ( FADDR ),   .D_WIDTH              ( D_WIDTH ) )   hbf3231 (      .sys_clk              ( sys_clk_125 ),   .rst_n                ( rst_n ),      .ofc3555           ( hq83f1a ),   .mg1aaad          ( ec1f8d2 ),   .jcd5569         ( zxfc691 ),   .jraab4b           ( xje348e ),   .vv55a5f          ( sw1a476 ),   .vkad2fe         ( dzd23b0 ),   .lq697f3       ( jr91d86 ),   .kd4bf9b       ( fp8ec36 ),   .jp5fcdc      ( tu761b6 ),   .lqfe6e7      ( bnb0db3 ),   .thf373b     ( ls86d9f ),   .bn9b9df     ( mt36cfa ),   .nt8b8a0         ( ir95972 ),
      .gb65b08               ( ym5efc ),   .pub7014              ( ks1f831 ),   .uk10db8                ( ayce8fc ),   .ng86dc0               ( hb747e0 ),   .cb36e02              ( coa3f06 ),
      .ls35987          ( ls35987 ),   .phy_cfgln_sum        ( phy_cfgln_sum ),
      .ba250d2        ( gdbe052 ),   .thd20a8             ( thd20a8 ),   .icd170d            ( wl23286 ),   .bn8b869              ( bn8b869 ),   .me5c34e             ( me5c34e ),   .qgcbe8c        ( qgcbe8c ),   .fn5f460        ( fn5f460 ),   .ayfa306         ( ayfa306 ),   .sj397d1        ( pue56b ),   .thec436        ( ld7b3a3 ),   .ui621b7        ( shd9d1f ),   .aaf45c                ( aaf45c ),   .dmfe774          ( dmfe774 ),   .ls1e282           ( vv7e6c2 ),   .ym3bfe4           ( ym3bfe4 ),   .rib82be           ( rib82be ),   .icc15f2           ( icc15f2 ),   .jpd27c8          ( mefa844 ),   .do93e46         ( uid4220 ),   .mt9f233        ( sja1101 ),   .mt18edf        ( ri1b63 ),   .hbc76fc        ( mtdb1b ),   .ie3b7e7       ( ay6d8dd ),   .sudbf39       ( vi6c6e8 ),   .fadf9c9      ( lq63743 ),   .hbfce4b      ( ba1ba1a ),   .mre725f         ( bldd0d3 ),   .kf392fc         ( ale869f ),   .gbc97e4        ( yk434fd ),   .cz4bf24        ( ou1a7e9 ),   .xj5f924       ( wjd3f48 ),   .vvfc927       ( ir9fa45 ),   .tue493f               ( enfd22d ),   .mg249fa              ( lde916c ),   .ie24fd0             ( jc48b67 ),
`ifdef ECRC
      .ecrc_gen_enb      ( ecrc_gen_enb ) ,      .ecrc_chk_enb      ( ecrc_chk_enb ) ,
`endif
   .rtcdaa7          ( gd26aed ),   .zkd03c5             ( wje877b ),         .fa79b01           ( fa79b01 ),   .kf9ae61          ( kf9ae61 ),   .vvd730d            ( vvd730d ),   .ukb986e           ( ukb986e ),   .mrcc371          ( mrcc371 ),   .xjcd80b       ( xjcd80b ),   .zk63316       ( zk63316 ),      .zx64b62               ( zx64b62 ),   .qi1a518             ( qi1a518 ),   .nrd28c0             ( nrd28c0 ),   .ph94607            ( ph94607 ),   .coa303f            ( coa303f ),   .ir181f8           ( ir181f8 ),   .dmc0fc5           ( dmc0fc5 ),      .fadf3e5              ( fadf3e5 ),   .dzf9f2a                ( dzf9f2a ),   .facf957               ( facf957 ),
`ifdef ECRC
      .tu7caba       ( tu7caba ),
`endif
   .cme55d3          ( cme55d3 ),   .ls2ae99          ( ls2ae99 ),
   .inta_n               ( inta_n ) ,   .intb_n               ( intb_n ) ,   .intc_n               ( intc_n ) ,   .intd_n               ( intd_n ) ,   .ftl_err_msg          ( ftl_err_msg ) ,   .nftl_err_msg         ( nftl_err_msg ) ,   .cor_err_msg          ( cor_err_msg ) ,   .mgacc3b              ( mgacc3b ),   .lf198b2           ( lf198b2 ),   .yxcc596             ( yxcc596 ),   .os62cb4             ( os62cb4 ),   .fp165a1           ( fp165a1 ),   .xyb2d0e             ( xyb2d0e ),   .ba96872             ( ba96872 ),   .wlb4393        ( wlb4393 ),   .uxa1c9c       ( uxa1c9c ),   .vke4e4      ( vke4e4 ),   .me6705e                 ( me6705e ),   .lf382f0                ( lf382f0 ),   .mec1786               ( mec1786 )    );
      assign ofc3555           = oh2362c;   assign mg1aaad          = zm1b164;   assign jcd5569         = hbd8b22;   assign jraab4b           = rgc5916;   assign vv55a5f          = mt2c8b3;   assign vkad2fe         = pf6459c;   assign gb65b08               = tx_req_vc0;   assign pub7014              = tx_data_vc0;   assign uk10db8                = tx_st_vc0;   assign ng86dc0               = tx_end_vc0;   assign cb36e02              = tx_nlfy_vc0;   assign mt18edf        = ph_buf_status_vc0;   assign hbc76fc        = pd_buf_status_vc0;   assign ie3b7e7       = nph_buf_status_vc0;   assign sudbf39       = npd_buf_status_vc0;   assign fadf9c9      = cplh_buf_status_vc0;   assign hbfce4b      = cpld_buf_status_vc0;   assign mre725f         = ph_processed_vc0;   assign kf392fc         = pd_processed_vc0;   assign gbc97e4        = nph_processed_vc0;   assign cz4bf24        = npd_processed_vc0;   assign xj5f924       = cplh_processed_vc0;   assign vvfc927       = cpld_processed_vc0;   assign tue493f               = pd_num_vc0;   assign mg249fa              = npd_num_vc0;   assign ie24fd0             = cpld_num_vc0;
      assign tx_rdy_vc0           = zz22abb;   assign tx_ca_ph_vc0         = mg155df;   assign tx_ca_pd_vc0         = hdaaef9;   assign tx_ca_nph_vc0        = dm577cf;   assign tx_ca_npd_vc0        = irbbe7a;   assign tx_ca_cplh_vc0       = psdf3d4;   assign tx_ca_cpld_vc0       = fnf9ea2;   assign rx_data_vc0          = en41a7c;   assign rx_st_vc0            = wj7a8bb;   assign rx_end_vc0           = wwd45dc;
`ifdef ECRC
      assign rx_ecrc_err_vc0   = tu7caba;
`endif
   assign rx_pois_tlp_vc0      = hqa2ee1;   assign rx_malf_tlp_vc0      = an1770b;
always@* begin en549cd<={yxd6218>>1,ld7b613[0]};ldd748a<={pse18cc>>1,ld7b613[1]};jr91d86<={lq697f3>>1,ld7b613[2]};fp8ec36<={kd4bf9b>>1,ld7b613[3]};tu761b6<={jp5fcdc>>1,ld7b613[4]};bnb0db3<={lqfe6e7>>1,ld7b613[5]};ls86d9f<={thf373b>>1,ld7b613[6]};mt36cfa<={bn9b9df>>1,ld7b613[7]};ir95972<={nt8b8a0>>1,ld7b613[8]};vk9610d<=ld7b613[9];xlb086a<=ld7b613[10];hd84357<=ld7b613[11];mt36395<=ld7b613[12];xybde55<=ld7b613[13];ip7ff53<=ld7b613[14];osffa9c<=ld7b613[15];cb1d8c6<=ld7b613[16];nt28480<=ld7b613[17];she8218<=ld7b613[18];of410c5<=ld7b613[19];kf862c<=ld7b613[20];hbc7a97<=ld7b613[21];uiea704<=ld7b613[22];go43164<=ld7b613[23];icc4365<=ld7b613[24];ou3b01d<=ld7b613[25];qg4956a<=ld7b613[26];gd26aed<={rtcdaa7>>1,ld7b613[27]};wje877b<=ld7b613[28];vkad436<={tx_dllp_val>>1,ld7b613[29]};ip7f3bf<={tx_pmtype>>1,ld7b613[30]};wl1895f<={tx_vsd_data>>1,ld7b613[31]};zm86ce6<={rxp_data>>1,ld7b613[32]};ux36732<=ld7b613[33];gqb3995<=ld7b613[34];vk9cca8<=ld7b613[35];ble6542<={rxp_status>>1,ld7b613[36]};ice58b3<=ld7b613[37];ui43b2e<={tx_lbk_data>>1,ld7b613[38]};gd1d970<={tx_lbk_kcntl>>1,ld7b613[39]};qt60385<={wwf5804>>1,ld7b613[40]};kqea937<={vi6ceee>>1,ld7b613[41]};cbab5c6<={jrb0b93>>1,ld7b613[42]};nr5ae34<={yz85c9f>>1,ld7b613[43]};ip41f91<={kf9ae61>>1,ld7b613[44]};uk34f9c<={ksa79d>>1,ld7b613[45]};wl23286<={icd170d>>1,ld7b613[46]};thf3859<={ng30b67>>1,ld7b613[47]};qv8adf7<={yxcc596>>1,ld7b613[48]};cm56fbc<={os62cb4>>1,ld7b613[49]};yzbef0a<={xyb2d0e>>1,ld7b613[50]};off7854<={ba96872>>1,ld7b613[51]};gqbc2a4<={wlb4393>>1,ld7b613[52]};zke1520<={uxa1c9c>>1,ld7b613[53]};mga903<={vke4e4>>1,ld7b613[54]};cb1d22c<={me6705e>>1,ld7b613[55]};jpe9165<={lf382f0>>1,ld7b613[56]};tu48b2f<={mec1786>>1,ld7b613[57]};mefa844<={jpd27c8>>1,ld7b613[58]};uid4220<={do93e46>>1,ld7b613[59]};sja1101<={mt9f233>>1,ld7b613[60]};ld7b3a3<={thec436>>1,ld7b613[61]};shd9d1f<={ui621b7>>1,ld7b613[62]};pue56b<={sj397d1>>1,ld7b613[63]};vv7e6c2<={ls1e282>>1,ld7b613[64]};kfaea64<={tj8b9ac>>1,ld7b613[65]};cz75325<={ay5cd66>>1,ld7b613[66]};qt4ecef<={yx51de5>>1,ld7b613[67]};gdbe052<={ba250d2>>1,ld7b613[68]};ep29c42<={tw1ece0>>1,ld7b613[69]};cz4e214<=ld7b613[70];gqb6b32<={qv95390>>1,ld7b613[71]};xlb5990<=ld7b613[72];al51d1c<=ld7b613[73];hq15aa<={gbf8670>>1,ld7b613[74]};kq56a90<={hd19c25>>1,ld7b613[75]};hdaa40e<={ip70971>>1,ld7b613[76]};ep2c598<=ld7b613[77];ea62cc5<=ld7b613[78];db16629<=ld7b613[79];gqb314e<=ld7b613[80];ym98a71<=ld7b613[81];xwc5388<=ld7b613[82];bl710a5<=ld7b613[83];qt54e55<=ld7b613[84];nre9354<=ld7b613[85];tu4d539<=ld7b613[86];tu42f79<=ld7b613[87];by76d66<=ld7b613[88];hq83f1a<={ofc3555>>1,ld7b613[89]};ec1f8d2<={mg1aaad>>1,ld7b613[90]};zxfc691<={jcd5569>>1,ld7b613[91]};xje348e<={jraab4b>>1,ld7b613[92]};sw1a476<={vv55a5f>>1,ld7b613[93]};dzd23b0<={vkad2fe>>1,ld7b613[94]};ym5efc<={gb65b08>>1,ld7b613[95]};ks1f831<={pub7014>>1,ld7b613[96]};ayce8fc<={uk10db8>>1,ld7b613[97]};hb747e0<={ng86dc0>>1,ld7b613[98]};coa3f06<={cb36e02>>1,ld7b613[99]};ri1b63<={mt18edf>>1,ld7b613[100]};mtdb1b<={hbc76fc>>1,ld7b613[101]};ay6d8dd<={ie3b7e7>>1,ld7b613[102]};vi6c6e8<={sudbf39>>1,ld7b613[103]};lq63743<={fadf9c9>>1,ld7b613[104]};ba1ba1a<={hbfce4b>>1,ld7b613[105]};bldd0d3<={mre725f>>1,ld7b613[106]};ale869f<={kf392fc>>1,ld7b613[107]};yk434fd<={gbc97e4>>1,ld7b613[108]};ou1a7e9<={cz4bf24>>1,ld7b613[109]};wjd3f48<={xj5f924>>1,ld7b613[110]};ir9fa45<={vvfc927>>1,ld7b613[111]};enfd22d<={tue493f>>1,ld7b613[112]};lde916c<={mg249fa>>1,ld7b613[113]};jc48b67<={ie24fd0>>1,ld7b613[114]};zz22abb<={zx64b62>>1,ld7b613[115]};mg155df<={qi1a518>>1,ld7b613[116]};hdaaef9<={nrd28c0>>1,ld7b613[117]};dm577cf<={ph94607>>1,ld7b613[118]};irbbe7a<={coa303f>>1,ld7b613[119]};psdf3d4<={ir181f8>>1,ld7b613[120]};fnf9ea2<={dmc0fc5>>1,ld7b613[121]};en41a7c<={fadf3e5>>1,ld7b613[122]};wj7a8bb<={dzf9f2a>>1,ld7b613[123]};wwd45dc<={facf957>>1,ld7b613[124]};hqa2ee1<={cme55d3>>1,ld7b613[125]};an1770b<={ls2ae99>>1,ld7b613[126]};kfbb85c<={qi2e4ea>>1,ld7b613[127]};zm2580e<={mgacc3b>>1,ld7b613[128]};nee1725<={vvc8857>>1,ld7b613[129]};vxba456<=ld7b613[130];qg5c95a<=ld7b613[131];lqe4ad0<=ld7b613[132];ba25682<=ld7b613[133];end
always@* begin necf6c2[2047]<=pse18cc[0];necf6c2[2046]<=lq697f3[0];necf6c2[2045]<=sudbf39[0];necf6c2[2044]<=kd4bf9b[0];necf6c2[2042]<=fadf9c9[0];necf6c2[2040]<=jp5fcdc[0];necf6c2[2036]<=hbfce4b[0];necf6c2[2032]<=lqfe6e7[0];necf6c2[2024]<=mre725f[0];necf6c2[2016]<=thf373b[0];necf6c2[2001]<=kf392fc[0];necf6c2[1985]<=bn9b9df[0];necf6c2[1954]<=gbc97e4[0];necf6c2[1950]<=mtb4ec3;necf6c2[1930]<=tj9987;necf6c2[1923]<=nt8b8a0[0];necf6c2[1909]<=swb381f;necf6c2[1878]<=lf382f0[0];necf6c2[1874]<=ir3392d;necf6c2[1870]<=ip70971[0];necf6c2[1861]<=cz4bf24[0];necf6c2[1852]<=fne984c;necf6c2[1813]<=vxb5a9a;necf6c2[1799]<=wwd1bc3;necf6c2[1770]<=ho79420;necf6c2[1754]<=coa303f[0];necf6c2[1750]<=fadf3e5[0];necf6c2[1717]<=cme55d3[0];necf6c2[1713]<=jrc662;necf6c2[1708]<=mec1786[0];necf6c2[1700]<=cm72a72;necf6c2[1693]<=ps57f08;necf6c2[1675]<=xj5f924[0];necf6c2[1656]<=ic4c266;necf6c2[1578]<=fne316a;necf6c2[1573]<=ls1e282[0];necf6c2[1551]<=co8de18;necf6c2[1493]<=vke4e4[0];necf6c2[1492]<=gd1de50;necf6c2[1491]<=gbf8670[0];necf6c2[1462]<=nrd28c0[0];necf6c2[1461]<=ir181f8[0];necf6c2[1453]<=dzf9f2a[0];necf6c2[1452]<=mgacc3b[0];necf6c2[1421]<=nt81647;necf6c2[1417]<=ui621b7[0];necf6c2[1396]<=ksa9c85;necf6c2[1387]<=ls2ae99[0];necf6c2[1379]<=eaea059;necf6c2[1378]<=mt9f233[0];necf6c2[1368]<=jpd27c8[0];necf6c2[1353]<=wwf5804[0];necf6c2[1352]<=ofc3555[0];necf6c2[1345]<=tx_pmtype[0];necf6c2[1339]<=fpbf843;necf6c2[1316]<=jrb0b93[0];necf6c2[1312]<=jcd5569[0];necf6c2[1302]<=vvfc927[0];necf6c2[1285]<=rxp_data[0];necf6c2[1265]<=th61330;necf6c2[1262]<=zke10f6;necf6c2[1198]<=tw1ece0[0];necf6c2[1169]<=kf9ae61[0];necf6c2[1163]<=ng30b67[0];necf6c2[1153]<=vv55a5f[0];necf6c2[1117]<=xyb2d0e[0];necf6c2[1115]<=mg249fa[0];necf6c2[1108]<=uv41608;necf6c2[1098]<=tj8b9ac[0];necf6c2[1054]<=al6f0c1;necf6c2[1045]<=rxp_valid;necf6c2[1039]<=pub7014[0];necf6c2[1023]<=yxd6218[0];necf6c2[1022]<=ie3b7e7[0];necf6c2[975]<=db84510;necf6c2[965]<=shc6261;necf6c2[954]<=me43d9c;necf6c2[939]<=me6705e[0];necf6c2[937]<=icef284;necf6c2[935]<=hd19c25[0];necf6c2[877]<=ph94607[0];necf6c2[875]<=dmc0fc5[0];necf6c2[858]<=facf957[0];necf6c2[856]<=vvc8857[0];necf6c2[786]<=sj397d1[0];necf6c2[746]<=uxa1c9c[0];necf6c2[745]<=oh124b7;necf6c2[731]<=qi1a518[0];necf6c2[726]<=qi2e4ea[0];necf6c2[710]<=dz502c8;necf6c2[708]<=thec436[0];necf6c2[698]<=qv95390[0];necf6c2[689]<=do93e46[0];necf6c2[676]<=tx_lbk_kcntl[0];necf6c2[672]<=tx_dllp_val[0];necf6c2[658]<=vi6ceee[0];necf6c2[656]<=mg1aaad[0];necf6c2[642]<=tx_vsd_data[0];necf6c2[631]<=thfc21e;necf6c2[599]<=ba250d2[0];necf6c2[584]<=yz85c9f[0];necf6c2[581]<=icd170d[0];necf6c2[576]<=jraab4b[0];necf6c2[558]<=os62cb4[0];necf6c2[557]<=tue493f[0];necf6c2[522]<=rxp_data_k;necf6c2[519]<=gb65b08[0];necf6c2[511]<=hbc76fc[0];necf6c2[487]<=yk78c4c;necf6c2[482]<=ri1ec4a;necf6c2[477]<=oh87b3;necf6c2[373]<=wlb4393[0];necf6c2[365]<=zx64b62[0];necf6c2[349]<=pff6703;necf6c2[338]<=tx_lbk_data[0];necf6c2[336]<=zkd03c5;necf6c2[299]<=yx51de5[0];necf6c2[290]<=ksa79d[0];necf6c2[279]<=yxcc596[0];necf6c2[259]<=vkad2fe[0];necf6c2[255]<=mt18edf[0];necf6c2[243]<=uv6f189;necf6c2[186]<=ba96872[0];necf6c2[182]<=ie24fd0[0];necf6c2[169]<=phy_status;necf6c2[168]<=rtcdaa7[0];necf6c2[149]<=ay5cd66[0];necf6c2[127]<=cb36e02[0];necf6c2[121]<=xwe4b62;necf6c2[84]<=rxp_status[0];necf6c2[63]<=ng86dc0[0];necf6c2[60]<=je1681;necf6c2[42]<=rxp_elec_idle;necf6c2[31]<=uk10db8[0];end         assign suff972 = necf6c2,ld7b613 = cme5c87;   initial begin   jcc030e = $fopen(".fred");   $fdisplay( jcc030e, "%3h\n%3h", (thc27c7 >> 4) & fnc7fe5, (thc27c7 >> (mt9f1ff+4)) & fnc7fe5 );   $fclose(jcc030e);   $readmemh(".fred", qg721c0);   end   always @ (suff972) begin   ym8700c = qg721c0[1];       for (vk1872=0; vk1872<qgdb09f; vk1872=vk1872+1) begin           cme5c87[vk1872] = suff972[ym8700c];       rv38061  = ^(ym8700c & qg721c0[0]);       ym8700c =  {ym8700c, rv38061};       end   end
endmodule