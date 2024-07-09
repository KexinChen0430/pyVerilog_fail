module qtc6cea
   (
    sys_clk,
    rst_n,
    coa90ef,
    fnddca9,
    tu48ee4,
    nta504c,
    fa47723,
    qv95390,
    ksa9c85,
    ho79420,
    gd1de50,
    icef284,
    lq79e8a,
    ir3392d,
    cm72a72,
    mrc95e4,
    zkd03c5,
    fne316a,
    vic0c83,
    db320df,
    uv6f189,
    yk78c4c,
    db84510,
    mtb4ec3,
    fne984c,
    ic4c266,
    th61330,
    ri1ec4a,
    shc6261,
    tj9987,
    vxb5a9a,
    xwe4b62,
    ea4cc3f,
    ps661f9,
    tw25b12,
    ph2d892,
    lq6c496,
    qg6dca3,
    vv6e518,
    go728c6,
    xl94630,
    oua3187,
    an18c38,
    ofc61c4,
    db1617d,
    co8712b,
    yz8514c,
    sw3b91b,
    ri25679,
    aa2b3cb,
    ui59e58,
    os561a1,
    ps79603,
    sucb01a,
    xw580d1,
    co88624,
    zz345a,
    os7ddeb,
    kf9f8b9,
    lq58741,
    icc4288,
    ui43120,
    xyb83fe
    );
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
input                       sys_clk;
input                       rst_n;
input                       coa90ef;
input                       fnddca9;
input [7:0]                 tu48ee4;
input [4:0]                 nta504c;
input [3:0]                 fa47723 ;
input [16*LANE_WIDTH-1:0]   qv95390;
input [2*LANE_WIDTH-1:0]    ksa9c85;
input [LANE_WIDTH-1:0]      ho79420;
input [LANE_WIDTH-1:0]      gd1de50;
input [LANE_WIDTH-1:0]      icef284;
input [LANE_WIDTH-1:0]      lq79e8a;
input [LANE_WIDTH-1:0]      ir3392d;
input [LANE_WIDTH-1:0]      cm72a72;
input                       zkd03c5;
input   [2:0]               mrc95e4;
input                       fne316a;
input   [3:0]               vic0c83;
input                       db320df;
input                       uv6f189;
input                       yk78c4c;
input                       db84510;
input                       mtb4ec3;
input                       fne984c;
input                       ic4c266;
input                       th61330;
input                       ri1ec4a;
input [LANE_WIDTH-1:0]      shc6261;
input                       tj9987;
input                       vxb5a9a;
input                       xwe4b62;
input                       ps661f9;
input                       ea4cc3f;
input                       tw25b12;
input                       ph2d892;
input                       lq6c496;
output                      qg6dca3;
output [16*LANE_WIDTH-1:0]  vv6e518;
output [2*LANE_WIDTH-1:0]   go728c6;
output [LANE_WIDTH-1:0]     xl94630;
output [2*LANE_WIDTH-1:0]   oua3187;
output                      an18c38;
output  [2:0]               ofc61c4;
output                      db1617d;
output  [LANE_WIDTH-1:0]    co8712b;
output  [LANE_WIDTH-1:0]    yz8514c;
output  [LANE_WIDTH-1:0]    sw3b91b;
output  [LANE_WIDTH-1:0]    ri25679;
output                      aa2b3cb;
output                      ui59e58;
output                      os561a1;
output                      ps79603;
output                      sucb01a;
output                      xw580d1;
output  [MSM_WIDTH:0]       co88624;
output  [2:0]               zz345a;
output                      os7ddeb;
output [L0sTSM_WIDTH:0]     kf9f8b9;
output [L1SM_WIDTH:0]       lq58741;
output [L2SM_WIDTH:0]       icc4288;
output                      ui43120;
output                      xyb83fe;
parameter fp68d7    = 32'd8;
parameter ou346be   = 32'd2;
parameter gqa35f0   = 32'd4;
parameter mg1af80  = 32'd64;
parameter ldd7c01   = 18  * fp68d7;
parameter qgf007d   = 34  * fp68d7;
`ifdef DENALI_SIMULATE // For DENALI simulation only
parameter ls1f44 = 40 * fp68d7;
parameter me7d118    = 32'd200;
parameter wje88c0    = 2   * me7d118;
parameter an23024    = 6   * me7d118;
parameter fac0925   = 12  * me7d118;
parameter aa2495b   = 24  * me7d118;
parameter pu256c0   = 48  * me7d118;
parameter yx5b018   = 50  * me7d118;
parameter jcc0627  = 100 * me7d118;
`else
`ifdef SIMULATE // For simulation only
parameter ir189d7  = 32'd1000;
parameter me7d118    = 32'd100;
parameter an23024    = 6  * 50;
parameter yx5b018   = 50 * 50;
`ifdef LTSSM_MACO
parameter ls1f44 = 60  * fp68d7;
parameter wje88c0    = 2   * 100;
parameter fac0925   = 12  * 50;
parameter aa2495b   = 24  * 50;
parameter pu256c0   = 48  * 50;
parameter jcc0627  = 100 * 50;
`else
parameter ls1f44 = 6 * fp68d7;
parameter wje88c0    = 3  * 80;
`ifdef DOWNGRADE_X4
parameter fac0925   = 2  * 50 * 2;
parameter aa2495b   = 4  * 50 * 2;
parameter pu256c0   = 8  * 50 * 2;
parameter jcc0627  = 10 * 50 * 2;
`else
parameter fac0925   = 2  * 50;
parameter aa2495b   = 4  * 50;
parameter pu256c0   = 8  * 50;
parameter jcc0627  = 10 * 50;
`endif
`endif
`else           // Actual values
parameter ir189d7  = 32'd16000;
parameter me7d118    = 32'd125000;
parameter ls1f44 = 32'd1030* fp68d7;
parameter wje88c0    = 32'd2   * me7d118;
parameter fac0925   = 32'd12  * me7d118;
parameter aa2495b   = 32'd24  * me7d118;
parameter pu256c0   = 32'd48  * me7d118;
parameter jcc0627  = 32'd100 * me7d118;
parameter an23024    = 32'd6   * me7d118;
parameter yx5b018   = 32'd50  * me7d118;
`endif
`endif
wire   [MSM_WIDTH:0]       gq31bc6;
wire   [LANE_WIDTH-1:0]    ym8de31;
wire   [LANE_WIDTH-1:0]    kdf2093;
wire   [LANE_WIDTH-1:0]    thd79d4;
wire                       aa24e7c;
wire                       neca61e;
wire                       ic530f3;
wire                       oh39f06;
wire                       alfd309;
wire                       ou1fa61;
wire  [LANE_WIDTH-1:0]     vx1c585;
wire  [LANE_WIDTH-1:0]     ene2c2f;
wire  [LANE_WIDTH-1:0]     zx5059f;
wire  [LANE_WIDTH-1:0]     db9ba68;
wire  [LANE_WIDTH-1:0]     yz9aee0;
wire  [LANE_WIDTH-1:0]     gq87e53;
wire  [LANE_WIDTH-1:0]     wlb129f;
wire  [LANE_WIDTH-1:0]     ic624b3;
wire  [LANE_WIDTH-1:0]     lsa21bb;
wire  [LANE_WIDTH-1:0]     qg7289b;
wire  [LANE_WIDTH-1:0]     co3b0ea;
wire  [LANE_WIDTH-1:0]     hoca102;
wire  [LANE_WIDTH-1:0]     ux8a6e9;
wire  [LANE_WIDTH-1:0]     ipf72c3;
wire  [LANE_WIDTH-1:0]     ou92cc4;
wire  [LANE_WIDTH-1:0]     do14437;
wire  [LANE_WIDTH-1:0]     bae513;
wire  [LANE_WIDTH-1:0]     vk1e60c;
wire  [LANE_WIDTH-1:0]     go53f17;
wire  [OS_WIDTH -1:0]      ec82cff;
wire  [OS_WIDTH -1:0]      rtdd347;
wire  [OS_WIDTH -1:0]      dzd7705;
wire  [OS_WIDTH -1:0]      xy3f298;
wire  [OS_WIDTH -1:0]      tw894fc;
wire  [OS_WIDTH -1:0]      ep12598;
wire  [OS_WIDTH -1:0]      aa10dda;
wire  [OS_WIDTH -1:0]      zz944d8;
wire  [OS_WIDTH -1:0]      zxd8751;
wire                       ec889;
wire  [8:0]                ls4449;
reg   [31:0]               nt2224a;
wire                       ri11256;
wire                       ep29936;
wire                       ay4c9b4;
wire                       hb4acd0;
wire  [LANE_WIDTH-1:0]    bn2d5a3;
wire  [LANE_WIDTH-1:0]    ip6ad1f;
wire  [LANE_WIDTH-1:0]    mgac915;
wire  [LANE_WIDTH-1:0]    pf648a8;
wire  [LANE_WIDTH-1:0]    ohd0c6;
wire  [LANE_WIDTH-1:0]    me68634;
wire  [LANE_WIDTH-1:0]    qgef2ad;
wire  [LANE_WIDTH-1:0]    ep18d09;
wire  [LANE_WIDTH-1:0]    uvc684c;
wire  [LANE_WIDTH-1:0]    zx55a12;
wire  [LANE_WIDTH-1:0]    qg431a1;
wire  [LANE_WIDTH-1:0]    fa7944d;
wire  [LANE_WIDTH-1:0]    tj9905;
wire  [LANE_WIDTH-1:0]    ec34264;
wire  [LANE_WIDTH-1:0]    tu4d4eb;
wire  [LANE_WIDTH-1:0]    cz6a75a;
wire  [LANE_WIDTH-1:0]    rgca26a;
wire  [LANE_WIDTH-1:0]    qt51353;
wire  [LANE_WIDTH-1:0]    ls89a9d;
wire  [LANE_WIDTH-1:0]    zkeb509;
wire  [LANE_WIDTH-1:0]    gda1320;
wire  [LANE_WIDTH-1:0]    god4257;
wire  [LANE_WIDTH-1:0]    ba20bcf;
wire  [LANE_WIDTH-1:0]    bn22886;
wire  [LANE_WIDTH-1:0]    qvb47e9;
wire  [LANE_WIDTH-1:0]    rge1dc0;
wire  [LANE_WIDTH-1:0]    gbf8072;
wire  [LANE_WIDTH-1:0]    vka761d;
wire  [LANE_WIDTH-1:0]    rt64179;
wire  [LANE_WIDTH-1:0]    ea4c82f;
wire  [LANE_WIDTH-1:0]    th61a18;
wire  [LANE_WIDTH-1:0]    fp91fdb;
wire  [8*LANE_WIDTH-1:0]  yz8fede;
wire  [8*LANE_WIDTH-1:0]  oha1d64;
wire  [LANE_WIDTH-1:0]    yx6a3b1;
wire  [LANE_WIDTH-1:0]    hd8ec64;
wire  [LANE_WIDTH-1:0]    yzb1933;
wire  [LANE_WIDTH-1:0]    ld64ceb;
wire  [LANE_WIDTH-1:0]    ir33af4;
wire  [LANE_WIDTH-1:0]    tuebd21;
wire  [LANE_WIDTH-1:0]    lqf485d;
wire  [LANE_WIDTH-1:0]    co2175d;
wire  [LANE_WIDTH-1:0]    ps5d74a;
wire  [LANE_WIDTH-1:0]    dm5d29b;
wire  [LANE_WIDTH-1:0]    hb4a6df;
wire  [LANE_WIDTH-1:0]    db9b7f8;
wire  [LANE_WIDTH-1:0]    tudfe31;
wire  [LANE_WIDTH-1:0]    alf8c59;
wire  [LANE_WIDTH-1:0]    qi3166d;
wire  [LANE_WIDTH-1:0]    ay59b47;
wire  [LANE_WIDTH-1:0]    yk6d1c7;
wire  [LANE_WIDTH-1:0]    ho471c8;
wire  [LANE_WIDTH-1:0]    thc721f;
wire  [LANE_WIDTH-1:0]    vvc87fc;
wire  [16*LANE_WIDTH-1:0]  vv6e518;
wire  [2*LANE_WIDTH-1:0]   go728c6;
wire  [2*LANE_WIDTH-1:0]   oua3187;
wire  [LANE_WIDTH-1:0]     xl94630;
wire                       nt28a64;
wire                       mr4bf3a;
wire                       ldfcea7;
wire                       she753f;
wire                       ym5e7a;
wire                       hqa7f10;
wire                       pu2f3d1;
wire  [8*LANE_WIDTH-1:0]   cb26d0e;
wire  [8*LANE_WIDTH-1:0]   mt36875;
wire  [LANE_WIDTH-1:0]     zma25bb ;
wire                       rv137a2 ;
wire                       rv9bd16 ;
wire                       wwde8b7 ;
wire                       lqf45b9 ;
wire                       rgcf453;
wire                       go77012;
wire                       qt6a6bb;
reg                        ymb94fb;
reg                        neca7d8;
reg                        ic53ec3;
reg                        an9f619;
reg                        nefb0cc;
reg  [LANE_WIDTH-1:0]      mrc331f;
reg  [7:0]                 xj45326;
reg  [7:0]                 gbcc7ee;
reg  [LANE_WIDTH-1:0]      rtd88e2;
reg  [OS_WIDTH -1:0]       suc4716;
reg                        jrb0bee;
reg                        yz85f77;
reg  [LANE_WIDTH-1:0]      pu2fbbd;
reg  [31:0]                rt6bc36;
reg  [31:0]                gb5e1b7;
reg                        qv238b0;
reg                        ic4c343;
reg                        ng89868;
reg                        ui43bca  ;
reg                        sw3130d;
reg                        je119e5;
reg                        qi21ef8;
reg                        hd1909e;
reg                        ld64da1;
reg                        wlb4422;
reg                        twa2114;
reg                        do8cf2a;
reg                        swbc3b8;
reg                        pu83d89;
reg                        ep23623;
reg                        xy1b11c;
reg  [7:0]                 qg5c4ae;
reg  [MSM_WIDTH:0]         co88624;
reg  [2:0]                 zz345a;
reg  [LANE_WIDTH-1:0]      co8712b;
reg  [2:0]                 ofc61c4;
reg                        db1617d;
wire  [LANE_WIDTH-1:0]     dz64ee4;
wire  [LANE_WIDTH-1:0]     wy3b936;
wire  [LANE_WIDTH-1:0]     xwe4d84;
wire  [LANE_WIDTH-1:0]     an36115;
wire  [LANE_WIDTH-1:0]     tj8456f;
wire  [LANE_WIDTH-1:0]     mg15bf7;
wire  [LANE_WIDTH-1:0]     en6fdc2;
wire  [LANE_WIDTH-1:0]     ipf70ae;
wire  [OS_WIDTH -1:0]      vvc2baa;
wire  [OS_WIDTH -1:0]      cbaeab0;
wire   [LANE_WIDTH-1:0]    zzaac2c;
wire   [LANE_WIDTH-1:0]    jrb0b38;
wire  [CFGSM_WIDTH:0]      qv2ce3d;
wire  [CFGSM_WIDTH:0]      hd38f60;
wire                       qt7a29b;
wire                       ead14dd;
wire                       me5374d;
reg                        en60fbf;
reg                        yz7dfc  ;
reg                        ks3efe4  ;
reg                        gbf7f20  ;
reg                        xlbf904;
reg                        hbfc826  ;
reg                        lqe4137  ;
reg                        fc209bb  ;
reg   [LANE_WIDTH-1:0]     ux26ed3;
reg   [LANE_WIDTH-1:0]     mtbb4ef;
reg   [LANE_WIDTH-1:0]     gbd3bea;
reg   [LANE_WIDTH-1:0]     ykefaa8;
reg   [LANE_WIDTH-1:0]     oseaa08;
reg   [LANE_WIDTH-1:0]     hqa820f;
reg   [LANE_WIDTH-1:0]     ir83dc;
reg   [LANE_WIDTH-1:0]     swf725;
reg   [LANE_WIDTH-1:0]     wjdc94e;
reg   [LANE_WIDTH-1:0]     vk253a2;
reg   [LANE_WIDTH-1:0]     ip4e89c;
reg   [LANE_WIDTH-1:0]     vka2726;
reg   [LANE_WIDTH-1:0]     ba9c997;
reg   [LANE_WIDTH-1:0]     ep265d2;
reg   [LANE_WIDTH-1:0]     qi974a6;
reg   [LANE_WIDTH-1:0]     dzd2987;
reg   [LANE_WIDTH-1:0]     iea61fe;
reg   [LANE_WIDTH-1:0]     aa87f83;
reg   [LANE_WIDTH-1:0]     lqfe0c2;
reg   [LANE_WIDTH-1:0]     xy83098;
`ifdef GEN2
reg                     ir184c3 ;
reg                     fnc261d ;
`endif
wire  [DSM_WIDTH:0]        fp13d9d;
wire  [PSM_WIDTH:0]        osff185;
wire  [CFGSM_WIDTH:0]      gd9049d;
wire  [L0SM_WIDTH:0]       blf3062;
wire  [L0sTSM_WIDTH:0]     vvfc5cd;
wire  [L0sRSM_WIDTH:0]     tj914ac;
wire  [L1SM_WIDTH:0]       czc3a0b;
wire  [L2SM_WIDTH:0]       mg21440;
wire  [RSM_WIDTH:0]        ph2827f;
wire  [LBSM_WIDTH:0]       ph9b1d6;
wire  [HRSM_WIDTH:0]       wwea3e5;
wire  [DISM_WIDTH:0]       dmda0bd;
`ifdef LW4
`endif
`ifdef LW2
`endif
`ifdef LW1
`endif
`ifdef LW4
`endif
`ifdef LW2
`endif
`ifdef LW1
`endif
`ifdef LW4
`endif
`ifdef LW2
`endif
`ifdef LW1
`endif
`ifdef LW4
`endif
`ifdef LW2
`endif
`ifdef LW1
`endif
`ifdef GEN2
`else
`endif
localparam ir95bbb    = (32'd4096 + 1'd1);
`ifdef LW1
`endif
`ifdef LW2
`endif
`ifdef LW4
`endif
reg [3:0]     vkadddc;
reg [3:0]     jp6eee2;
`ifdef GEN2
`endif
`ifdef DOWN_X1
`else
`ifdef LW4
`endif
`ifdef LW2
`endif
`ifdef LW1
`endif
`endif
reg ym979fd;
reg of51db5;
reg [7 : 0] gq2e05c;
reg [4 : 0] gbe2e65;
reg [3 : 0] sh702e0;
reg [16 * LANE_WIDTH - 1 : 0] gqb6b32;
reg [2 * LANE_WIDTH - 1 : 0] xlb5990;
reg [LANE_WIDTH - 1 : 0] qt54e55;
reg [LANE_WIDTH - 1 : 0] nre9354;
reg [LANE_WIDTH - 1 : 0] tu4d539;
reg [LANE_WIDTH - 1 : 0] czf8ffb;
reg [LANE_WIDTH - 1 : 0] tu42f79;
reg [LANE_WIDTH - 1 : 0] by76d66;
reg [2 : 0] ph38cf2;
reg wje877b;
reg ou3b01d;
reg [3 : 0] zz9e5ec;
reg cb953d4;
reg ip7ff53;
reg osffa9c;
reg cb1d8c6;
reg nt28480;
reg she8218;
reg of410c5;
reg kf862c;
reg hbc7a97;
reg [LANE_WIDTH - 1 : 0] uiea704;
reg go43164;
reg icc4365;
reg xybde55;
reg cb18b21;
reg dmc590c;
reg icef2ab;
reg ho79558;
reg hocaac2;
reg [MSM_WIDTH : 0] en44bff;
reg [LANE_WIDTH - 1 : 0] ba2ffea;
reg [LANE_WIDTH - 1 : 0] ose0a12;
reg [LANE_WIDTH - 1 : 0] mr7aeb0;
reg zx7ec66;
reg lsa71ea;
reg phc4f1;
reg gdb19b7;
reg su7d043;
reg je2fa08;
reg [LANE_WIDTH - 1 : 0] kde7e06;
reg [LANE_WIDTH - 1 : 0] xy3f035;
reg [LANE_WIDTH - 1 : 0] nrecad5;
reg [LANE_WIDTH - 1 : 0] ou2b575;
reg [LANE_WIDTH - 1 : 0] fad5d47;
reg [LANE_WIDTH - 1 : 0] kd751d5;
reg [LANE_WIDTH - 1 : 0] dm47562;
reg [LANE_WIDTH - 1 : 0] byd589a;
reg [LANE_WIDTH - 1 : 0] ww62691;
reg [LANE_WIDTH - 1 : 0] kf9a446;
reg [LANE_WIDTH - 1 : 0] rv911a6;
reg [LANE_WIDTH - 1 : 0] ww469b9;
reg [LANE_WIDTH - 1 : 0] gqa6e41;
reg [LANE_WIDTH - 1 : 0] ymb904f;
reg [LANE_WIDTH - 1 : 0] wj413c6;
reg [LANE_WIDTH - 1 : 0] nr4f1a7;
reg [LANE_WIDTH - 1 : 0] uvc69f9;
reg [LANE_WIDTH - 1 : 0] jea7e61;
reg [LANE_WIDTH - 1 : 0] zxf985b;
reg [OS_WIDTH - 1 : 0] hb616fc;
reg [OS_WIDTH - 1 : 0] cz5bf3b;
reg [OS_WIDTH - 1 : 0] xjfceeb;
reg [OS_WIDTH - 1 : 0] sw3bafc;
reg [OS_WIDTH - 1 : 0] neebf07;
reg [OS_WIDTH - 1 : 0] blfc1df;
reg [OS_WIDTH - 1 : 0] ux77f0;
reg [OS_WIDTH - 1 : 0] psdfc28;
reg [OS_WIDTH - 1 : 0] kqf0a1b;
reg gd850d9;
reg [8 : 0] zz286cc;
reg [31 : 0] qg43667;
reg do1b339;
reg jpc2f0e;
reg wl17876;
reg ea672a5;
reg [LANE_WIDTH - 1 : 0] dz4f5ae;
reg [LANE_WIDTH - 1 : 0] qtd6bbc;
reg [LANE_WIDTH - 1 : 0] zm83d9f;
reg [LANE_WIDTH - 1 : 0] pff67d3;
reg [LANE_WIDTH - 1 : 0] lsb09a;
reg [LANE_WIDTH - 1 : 0] pfc269b;
reg [LANE_WIDTH - 1 : 0] gd2cdbf;
reg [LANE_WIDTH - 1 : 0] hd9bfa4;
reg [LANE_WIDTH - 1 : 0] dmfe93b;
reg [LANE_WIDTH - 1 : 0] pfe38b6;
reg [LANE_WIDTH - 1 : 0] mt9a6fe;
reg [LANE_WIDTH - 1 : 0] zx5fe66;
reg [LANE_WIDTH - 1 : 0] shd398a;
reg [LANE_WIDTH - 1 : 0] mta4ed3;
reg [LANE_WIDTH - 1 : 0] ph28668;
reg [LANE_WIDTH - 1 : 0] vvf99b9;
reg [LANE_WIDTH - 1 : 0] ea7d7ca;
reg [LANE_WIDTH - 1 : 0] vv5f283;
reg [LANE_WIDTH - 1 : 0] lqca0f6;
reg [LANE_WIDTH - 1 : 0] ph19a39;
reg [LANE_WIDTH - 1 : 0] aa3b4e6;
reg [LANE_WIDTH - 1 : 0] tw1e54f;
reg [LANE_WIDTH - 1 : 0] fpaac27;
reg [LANE_WIDTH - 1 : 0] ne631a7;
reg [LANE_WIDTH - 1 : 0] ecbcbe8;
reg [LANE_WIDTH - 1 : 0] rv9e387;
reg [LANE_WIDTH - 1 : 0] ipe78b7;
reg [LANE_WIDTH - 1 : 0] yz1203b;
reg [LANE_WIDTH - 1 : 0] oh8aab0;
reg [LANE_WIDTH - 1 : 0] xje62aa;
reg [LANE_WIDTH - 1 : 0] pu202c2;
reg [LANE_WIDTH - 1 : 0] mrd3e21;
reg [8 * LANE_WIDTH - 1 : 0] ls3f44f;
reg [8 * LANE_WIDTH - 1 : 0] kdf2a7a;
reg [LANE_WIDTH - 1 : 0] hb4f64b;
reg [LANE_WIDTH - 1 : 0] yxd92ff;
reg [LANE_WIDTH - 1 : 0] wj4bfec;
reg [LANE_WIDTH - 1 : 0] ykffb27;
reg [LANE_WIDTH - 1 : 0] rtec9c5;
reg [LANE_WIDTH - 1 : 0] rv27176;
reg [LANE_WIDTH - 1 : 0] zkc5db7;
reg [LANE_WIDTH - 1 : 0] tu76dd9;
reg [LANE_WIDTH - 1 : 0] dob7650;
reg [LANE_WIDTH - 1 : 0] yxd941d;
reg [LANE_WIDTH - 1 : 0] th5076b;
reg [LANE_WIDTH - 1 : 0] wl1dafa;
reg [LANE_WIDTH - 1 : 0] nr6bea5;
reg [LANE_WIDTH - 1 : 0] uifa97e;
reg [LANE_WIDTH - 1 : 0] hda5f80;
reg [LANE_WIDTH - 1 : 0] nr7e033;
reg [LANE_WIDTH - 1 : 0] wl80cf8;
reg [LANE_WIDTH - 1 : 0] oh33e2f;
reg [LANE_WIDTH - 1 : 0] alf8be4;
reg [LANE_WIDTH - 1 : 0] je2f92b;
reg aa870bc;
reg dme4adb;
reg ne42028;
reg ux80a19;
reg dbb09f8;
reg tue45b1;
reg fp27e3f;
reg [8 * LANE_WIDTH - 1 : 0] zke1da8;
reg [8 * LANE_WIDTH - 1 : 0] jeed42;
reg [LANE_WIDTH - 1 : 0] qva1aad;
reg zza00e3;
reg mg71f;
reg vx38f8;
reg ph1c7c6;
reg jpe3e37;
reg ou1f1bf;
reg wjf8df8;
reg czc6fc5;
reg tj37e2c;
reg xlbf166;
reg kdf8b37;
reg jcc59bd;
reg [LANE_WIDTH - 1 : 0] vi66f5c;
reg [7 : 0] hd385e1;
reg [7 : 0] twbd71e;
reg [LANE_WIDTH - 1 : 0] hd910e7;
reg [OS_WIDTH - 1 : 0] cm439f8;
reg fac0d5c;
reg vx6ae3;
reg [LANE_WIDTH - 1 : 0] ng3571e;
reg [31 : 0] mr7aa93;
reg [31 : 0] vid549c;
reg tj1cfc0;
reg sue080b;
reg xy9c101;
reg ls3fa4d;
reg yk53820;
reg an8f2cf;
reg zxf3736;
reg ym3e7e8;
reg gqbc3b5;
reg hq200ec;
reg ym763;
reg jc7967d;
reg ui6278e;
reg db38f52;
reg fc4c88;
reg ux26443;
reg [7 : 0] ri83ebb;
reg [LANE_WIDTH - 1 : 0] icfaed0;
reg [LANE_WIDTH - 1 : 0] qvbb406;
reg [LANE_WIDTH - 1 : 0] byd01aa;
reg [LANE_WIDTH - 1 : 0] bn6a9d;
reg [LANE_WIDTH - 1 : 0] vxaa772;
reg [LANE_WIDTH - 1 : 0] ie9dcb1;
reg [LANE_WIDTH - 1 : 0] me72c42;
reg [LANE_WIDTH - 1 : 0] qvb1082;
reg [OS_WIDTH - 1 : 0] zk420a0;
reg [OS_WIDTH - 1 : 0] gq82819;
reg [LANE_WIDTH - 1 : 0] rva0643;
reg [LANE_WIDTH - 1 : 0] fp190ff;
reg [CFGSM_WIDTH : 0] ic43ffe;
reg [CFGSM_WIDTH : 0] icfff81;
reg osffc08;
reg lqfe040;
reg qgf0203;
reg zz81018;
reg ux80c6;
reg ld40634;
reg nt31a6;
reg gd18d37;
reg kdc69bc;
reg co34de4;
reg swa6f21;
reg [LANE_WIDTH - 1 : 0] iebc84e;
reg [LANE_WIDTH - 1 : 0] qi2138b;
reg [LANE_WIDTH - 1 : 0] wj4e2cf;
reg [LANE_WIDTH - 1 : 0] ph8b3ee;
reg [LANE_WIDTH - 1 : 0] xwcfbb8;
reg [LANE_WIDTH - 1 : 0] dmeee11;
reg [LANE_WIDTH - 1 : 0] xyb8459;
reg [LANE_WIDTH - 1 : 0] je11657;
reg [LANE_WIDTH - 1 : 0] cm595df;
reg [LANE_WIDTH - 1 : 0] jc577ca;
reg [LANE_WIDTH - 1 : 0] jcdf294;
reg [LANE_WIDTH - 1 : 0] xwca516;
reg [LANE_WIDTH - 1 : 0] zz9459b;
reg [LANE_WIDTH - 1 : 0] lf166fb;
reg [LANE_WIDTH - 1 : 0] tj9bef1;
reg [LANE_WIDTH - 1 : 0] nefbc7a;
reg [LANE_WIDTH - 1 : 0] dmf1e90;
reg [LANE_WIDTH - 1 : 0] al7a41d;
reg [LANE_WIDTH - 1 : 0] ep9076e;
reg [LANE_WIDTH - 1 : 0] yz1dbaa;
reg [DSM_WIDTH : 0] hb6eaa4;
reg [PSM_WIDTH : 0] hdaa93c;
reg [CFGSM_WIDTH : 0] qva4f3c;
reg [L0SM_WIDTH : 0] cb3cf27;
reg [L0sTSM_WIDTH : 0] gd3c9ed;
reg [L0sRSM_WIDTH : 0] rv27b6a;
reg [L1SM_WIDTH : 0] gbedabf;
reg [L2SM_WIDTH : 0] yx6afe1;
reg [RSM_WIDTH : 0] jrbf86b;
reg [LBSM_WIDTH : 0] vie1af6;
reg [HRSM_WIDTH : 0] nr6bd94;
reg [DISM_WIDTH : 0] thf653d;
reg [3 : 0] zmb29ef;
reg [3 : 0] tj94f7a;
reg [2047:0] necf6c2;
wire [241:0] ld7b613;
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
`ifdef DENALI_SIMULATE // For DENALI simulation only
`else
`ifdef SIMULATE // For simulation only
`ifdef LTSSM_MACO
`else
`ifdef DOWNGRADE_X4
`else
`endif
`endif
`else           // Actual values
`endif
`endif
`ifdef GEN2
`endif
`ifdef LW4
`endif
`ifdef LW2
`endif
`ifdef LW1
`endif
`ifdef LW4
`endif
`ifdef LW2
`endif
`ifdef LW1
`endif
`ifdef LW4
`endif
`ifdef LW2
`endif
`ifdef LW1
`endif
`ifdef LW4
`endif
`ifdef LW2
`endif
`ifdef LW1
`endif
`ifdef GEN2
`else
`endif
`ifdef LW1
`endif
`ifdef LW2
`endif
`ifdef LW4
`endif
`ifdef GEN2
`endif
`ifdef DOWN_X1
`else
`ifdef LW4
`endif
`ifdef LW2
`endif
`ifdef LW1
`endif
`endif
localparam qgdb09f = 242,nrd84f8 = 32'hfdffea0b;
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
`ifdef DENALI_SIMULATE // For DENALI simulation only
`else
`ifdef SIMULATE // For simulation only
`ifdef LTSSM_MACO
`else
`ifdef DOWNGRADE_X4
`else
`endif
`endif
`else           // Actual values
`endif
`endif
`ifdef GEN2
`endif
`ifdef LW4
`endif
`ifdef LW2
`endif
`ifdef LW1
`endif
`ifdef LW4
`endif
`ifdef LW2
`endif
`ifdef LW1
`endif
`ifdef LW4
`endif
`ifdef LW2
`endif
`ifdef LW1
`endif
`ifdef LW4
`endif
`ifdef LW2
`endif
`ifdef LW1
`endif
`ifdef GEN2
`else
`endif
`ifdef LW1
`endif
`ifdef LW2
`endif
`ifdef LW4
`endif
`ifdef GEN2
`endif
`ifdef DOWN_X1
`else
`ifdef LW4
`endif
`ifdef LW2
`endif
`ifdef LW1
`endif
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
`ifdef DENALI_SIMULATE // For DENALI simulation only
`else
`ifdef SIMULATE // For simulation only
`ifdef LTSSM_MACO
`else
`ifdef DOWNGRADE_X4
`else
`endif
`endif
`else           // Actual values
`endif
`endif
`ifdef GEN2
`endif
assign qg6dca3 = (jpe3e37 | wjf8df8 | ou1f1bf);
assign wwde8b7 = (|dz4f5ae) ;
assign lqf45b9 = (|qtd6bbc) ;
assign rv137a2 = ~zz81018 & vx38f8 ;
assign rv9bd16 = ~gd18d37 & ph1c7c6;
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      en60fbf      <= 1'b0;      yz7dfc <= 1'b0 ;      ks3efe4 <= 1'b0 ;      gbf7f20 <= 1'b0 ;      xlbf904      <= 1'b0;      hbfc826 <= 1'b0 ;      lqe4137 <= 1'b0 ;      fc209bb <= 1'b0 ;   end   else begin      en60fbf      <= vx38f8 ;      yz7dfc <= zza00e3 ;      ks3efe4 <= ux80c6 ;      gbf7f20 <= ld40634 ;      xlbf904      <= ph1c7c6 ;      hbfc826 <= mg71f ;      lqe4137 <= kdc69bc ;      fc209bb <= co34de4 ;   end
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      ux26ed3  <= 0;      mtbb4ef  <= 0;      gbd3bea   <= 0;      ykefaa8 <= 0;      oseaa08  <= 0;      hqa820f   <= 0;      ir83dc     <= 0;      vka2726<= 0;      ba9c997 <= 0;      ep265d2 <= 0;      aa87f83     <= 0;      lqfe0c2    <= 0;   end   else if (aa870bc) begin      ux26ed3  <= 0;      mtbb4ef  <= 0;      gbd3bea   <= 0;      ykefaa8 <= 0;      oseaa08  <= 0;      hqa820f   <= 0;      ir83dc     <= 0;      vka2726<= 0;      ba9c997 <= 0;      ep265d2 <= 0;      aa87f83     <= 0;      lqfe0c2    <= 0;   end   else if (nt31a6)  begin      ux26ed3  <= hb4f64b;      mtbb4ef  <= yxd92ff;      gbd3bea   <= wj4bfec;      ykefaa8 <= ykffb27;      oseaa08  <= rtec9c5;      hqa820f   <= rv27176;      ir83dc     <= zkc5db7;      vka2726<= wl1dafa;      ba9c997 <= nr6bea5;      ep265d2 <= uifa97e;      aa87f83     <= oh33e2f;      lqfe0c2    <= alf8be4;   end
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      swf725         <= 0;      wjdc94e  <= 0;      qi974a6  <= 0;      dzd2987  <= 0;      xy83098    <= 0;   end   else if (aa870bc) begin      swf725         <= 0;      wjdc94e  <= 0;      qi974a6  <= 0;      dzd2987  <= 0;      xy83098    <= 0;   end   else if (swa6f21)  begin      swf725         <= tu76dd9;      wjdc94e  <= dob7650;      qi974a6  <= hda5f80;      dzd2987  <= nr7e033;      xy83098    <= je2f92b;   end
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      vk253a2 <= 0;      ip4e89c <= 0;   end   else if (aa870bc) begin      vk253a2 <= 0;      ip4e89c <= 0;   end   else if (nt31a6 || swa6f21)  begin      vk253a2 <= yxd941d;      ip4e89c <= th5076b;   end
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      iea61fe <= 0;   end   else begin      iea61fe <= wl80cf8;   end
end
assign me68634  = iebc84e;
assign qgef2ad  = qi2138b;
assign ep18d09   = wj4e2cf;
assign uvc684c = ph8b3ee;
assign zx55a12  = xwcfbb8;
assign qg431a1   = dmeee11;
assign fa7944d     = xyb8459;
assign tj9905         = je11657;
assign ec34264  = cm595df;
assign tu4d4eb = jc577ca;
assign cz6a75a = jcdf294;
assign rgca26a= xwca516;
assign qt51353 = zz9459b;
assign ls89a9d = lf166fb;
assign zkeb509  = tj9bef1;
assign gda1320  = nefbc7a;
assign ba20bcf       = dmf1e90;
assign gbf8072     = al7a41d;
assign vka761d    = ep9076e;
assign rt64179    = yz1dbaa;
ne576ee osea723 [LANE_WIDTH-1:0]
   (        .sys_clk             (sys_clk),    .rst_n               (rst_n),    .fnddca9      (of51db5),
    .ho79420        (qt54e55),    .cm72a72       (by76d66),    .qv95390            (gqb6b32),    .ksa9c85           (xlb5990),
    .mtb4ec3         (nt28480),    .yk78c4c          (osffa9c),    .shc6261          (uiea704),
    .yz8514c     (ea672a5),    .nt28a64      (aa870bc),    .xj45326       (hd385e1),    .ep29936           (jpc2f0e),    .ay4c9b4           (wl17876),    .ld64da1      (gqbc3b5),
`ifdef LW4
       .cb26d0e         (zke1da8),                  .mt36875         (jeed42),
`endif
`ifdef LW2
       .cb26d0e         (zke1da8[15:0]),       .mt36875         (jeed42[15:0]),
`endif
`ifdef LW1
       .cb26d0e         (zke1da8[7:0]),       .mt36875         (jeed42[7:0]),
`endif
`ifdef LW4
       .sjb43ac    ({yz8514c[0],yz8514c[1],                           yz8514c[2],yz8514c[3]}),
`endif
`ifdef LW2
       .sjb43ac    ({yz8514c[0],yz8514c[1]}),
`endif
`ifdef LW1
       .sjb43ac    (yz8514c[0]),
`endif
    .oha1d64            (oha1d64),    .bn2d5a3              (bn2d5a3),    .ip6ad1f              (ip6ad1f),    .mgac915       (mgac915),    .pf648a8       (pf648a8),    .ohd0c6            (ohd0c6),    .me68634      (yx6a3b1),    .qgef2ad      (hd8ec64),    .ep18d09       (yzb1933),    .uvc684c     (ld64ceb),    .zx55a12      (ir33af4),    .qg431a1       (tuebd21),    .fa7944d         (lqf485d),    .rgca26a    (db9b7f8),    .qt51353     (tudfe31),    .ls89a9d     (alf8c59),    .tu4d4eb     (dm5d29b),    .cz6a75a     (hb4a6df),    .tj9905             (co2175d),    .ec34264      (ps5d74a),    .zkeb509      (qi3166d),    .gda1320      (ay59b47),    .god4257            (god4257),    .ba20bcf           (yk6d1c7),    .bn22886           (bn22886),    .qvb47e9     (qvb47e9),    .rge1dc0             (rge1dc0),    .gbf8072         (ho471c8),    .vka761d        (thc721f),    .rt64179        (vvc87fc),    .ea4c82f         (ea4c82f),    .th61a18         (th61a18),    .fp91fdb        (fp91fdb),    .yz8fede            (yz8fede)    );
vi47247 an9a92a   (        .sys_clk             (sys_clk),    .rst_n               (rst_n),    .tu48ee4            (gq2e05c),    .fa47723         (sh702e0),        .nt28a64      (aa870bc),    .xj45326       (hd385e1),    .ep23623   (fc4c88),    .xy1b11c   (ux26443),    .rtd88e2        (hd910e7),    .suc4716    (cm439f8),    .qv238b0           (tj1cfc0),    .sw3b91b      (vi66f5c),
`ifdef LW4
       .vx1c585   (kde7e06),       .ene2c2f   (xy3f035),       .pu2fbbd    (ng3571e),
`endif
`ifdef LW2
       .vx1c585   ({kde7e06, 2'd0}),       .ene2c2f   ({xy3f035, 2'd0}),       .pu2fbbd    ({ng3571e, 2'd0}),
`endif
`ifdef LW1
       .vx1c585   ({kde7e06, 3'd0}),       .ene2c2f   ({xy3f035, 3'd0}),       .pu2fbbd    ({ng3571e, 3'd0}),
`endif
    .db1617d   (db1617d),    .jrb0bee      (fac0d5c),    .yz85f77       (vx6ae3),    .os7ddeb            (os7ddeb),
        .bn2d5a3              (|dz4f5ae),    .ip6ad1f              (|qtd6bbc),    .god4257            (|tw1e54f),
`ifdef LW4
       .oha1d64         (kdf2a7a),
`endif
`ifdef LW2
       .oha1d64         ({kdf2a7a, 16'd0}),
`endif
`ifdef LW1
       .oha1d64         ({kdf2a7a, 24'd0}),
`endif
       .db320df         (cb953d4),   .tw25b12         (icef2ab),        .ned08a2            (vv6e518),    .lf84512           (go728c6),    .vk144b7             (xl94630),    .nt22896          (oua3187),    .zma25bb        (zma25bb),    .cb26d0e            (cb26d0e),    .mt36875            (mt36875),    .byc5606         (an18c38),    .mr4bf3a         (mr4bf3a),    .ldfcea7      (ldfcea7),    .she753f        (she753f),    .pu2f3d1     (pu2f3d1),    .ym5e7a         (ym5e7a),    .hqa7f10         (hqa7f10)    );
assign sw3b91b = qva1aad;
assign aa24e7c = lsa71ea | phc4f1;
assign oh39f06 = su7d043 | je2fa08;
zz13dc9 icde0a7   (        .sys_clk           (sys_clk),    .rst_n             (rst_n),    .fne316a     (ou3b01d),    .je204f6       (je204f6),    .vv4ff45       (vv4ff45),    .sh7fa2e       (sh7fa2e),    .xwfe412        (xwfe412),    .ea68ff2       (ea68ff2),    .je3fc82       (je3fc82),    .by47f90       (by47f90),    .uk98798         (uk98798),    .wjc3cc1         (wjc3cc1),    .aa24e7c        (zx7ec66),    .ldf94c3      (ldf94c3),    .oh39f06        (gdb19b7),    .pscf835     (wya3f4c),    .kqcb0e8      (kqcb0e8),    .ukb310a        (ukb310a),    .bn6a90      (bn6a90),    .je35486     (je35486),    .vxaa432    (vxaa432),    .ho52196     (ho52196),    .oh90cb2     (oh90cb2),    .ri86594     (ri86594),    .hd1363a       (hd1363a),    .ep1d47c      (ep1d47c),    .xl37682       (xl37682),
        .ri1e4b9       (ps79603),    .jr94792      (sucb01a),    .gqa3c97      (xw580d1),    .gq31bc6        (gq31bc6),    .gq92e55          (ep29936),    .ie972a9          (ay4c9b4),    .ukb9548       (xyb83fe)    );
zmad548 ohab71b   (        .sys_clk           (sys_clk),    .rst_n             (rst_n),    .coa90ef       (ym979fd),    .gq31bc6        (en44bff),    .ui43bca     (ls3fa4d),    .gd1de50    (nre9354),    .icef284     (tu4d539),    .ho79420      (qt54e55),        .hoca102      (hoca102),    .pf50813      (ri25679),    .bn8409e     (bn8409e),    .je204f6       (je204f6),    .ym8de31         (ym8de31),    .fp13d9d         (fp13d9d)    );
en6a011 lqd0cdf   (        .sys_clk           (sys_clk),    .rst_n             (rst_n),    .sw3130d     (yk53820),    .je119e5     (an8f2cf),    .do8cf2a   (jc7967d),    .gq31bc6        (en44bff),    .ym8de31         (ba2ffea),    .ho79420      (qt54e55),    .ldfcea7    ({(LANE_WIDTH){ne42028}}),    .she753f      ({(LANE_WIDTH){ux80a19}}),    .tu4d4eb   (ph28668),    .zkeb509    (ph19a39),
        .ho69416     (hb4acd0),    .fn4a0b3     (fn4a0b3),    .zx5059f        (zx5059f),    .ec82cff    (ec82cff),    .sh7fa2e       (sh7fa2e),    .vv4ff45       (vv4ff45),    .ui43120    (ui43120),    .osff185         (osff185)    );
wl12806 qt6f5cc   (        .sys_clk           (sys_clk),    .rst_n             (rst_n),    .gq31bc6        (en44bff),    .ym8de31         (ba2ffea),    .uv6f189    (ip7ff53),    .yk78c4c        (osffa9c),    .shc6261        (uiea704),    .sw3130d     (yk53820),    .ng89868      (xy9c101),    .ic4c343    (sue080b),    .ohd0c6          (lsb09a),    .me68634    (pfc269b),    .qgef2ad    (gd2cdbf),    .uvc684c   (dmfe93b),    .zx55a12    (pfe38b6),    .ep18d09     (hd9bfa4),    .gda1320    (aa3b4e6),    .ea4c82f       (xje62aa),    .rt64179      (oh8aab0),    .ba20bcf         (fpaac27),    .ym5e7a       ({(LANE_WIDTH){dbb09f8}}),    .pu2f3d1   ({(LANE_WIDTH){fp27e3f}}),    .lq79e8a      (czf8ffb),
        .rgcf453      (lqd0ff8),    .qt7a29b   (pu3fe10),    .ead14dd     (wjf8411),    .ux8a6e9      (mg15bf7),    .me5374d     (ba119c9),    .db9ba68        (ipf70ae),    .rtdd347    (cbaeab0),    .zxe9a3f      (xwe4d84),    .ne4d1fe      (an36115),    .ea68ff2       (jr27008),    .by47f90       (dmc0236),    .je3fc82       (ux8d92),    .xwfe412        (ux364a8),    .kdf2093         (jrb0b38),    .gd9049d         (hd38f60)    );
xj6b98d aa2b356   (        .sys_clk           (sys_clk),    .rst_n             (rst_n),    .gq31bc6        (en44bff),    .ym8de31         (ba2ffea),    .uv6f189    (ip7ff53),    .yk78c4c        (osffa9c),    .shc6261        (uiea704),    .sw3130d     (yk53820),    .ng89868      (xy9c101),    .ic4c343    (sue080b),    .th61a18       (pu202c2),    .ohd0c6          (lsb09a),    .me68634    (pfc269b),    .qg431a1     (mt9a6fe),    .ep18d09     (hd9bfa4),    .uvc684c   (dmfe93b),    .ec34264    (mta4ed3),    .gda1320    (aa3b4e6),    .tj9905           (shd398a),    .ea4c82f       (xje62aa),    .rt64179      (oh8aab0),    .ba20bcf         (fpaac27),    .ym5e7a       ({(LANE_WIDTH){dbb09f8}}),    .pu2f3d1   ({(LANE_WIDTH){fp27e3f}}),    .lq79e8a      (czf8ffb),
        .rgcf453      (fp1cd60),    .qt7a29b   (tw35837),    .ead14dd     (kd60dd9),    .ux8a6e9      (tj8456f),    .me5374d     (mrd99bd),    .db9ba68        (en6fdc2),    .rtdd347    (vvc2baa),    .zxe9a3f      (dz64ee4),    .ne4d1fe      (wy3b936),    .ea68ff2       (hd9ea66),    .by47f90       (coa99b8),    .je3fc82       (lq66e01),    .xwfe412        (hqb805f),    .kdf2093         (zzaac2c),    .gd9049d         (qv2ce3d)    );
assign rgcf453    = (icef2ab) ? lqd0ff8    : fp1cd60;
assign qt7a29b = (icef2ab) ? pu3fe10 : tw35837;
assign ead14dd   = (icef2ab) ? wjf8411   : kd60dd9;
assign ux8a6e9    = (icef2ab) ? ie9dcb1    : vxaa772;
assign me5374d   = (icef2ab) ? ba119c9   : mrd99bd;
assign db9ba68      = (icef2ab) ? qvb1082      : me72c42;
assign rtdd347  = (icef2ab) ? gq82819  : zk420a0;
assign vx1c585  = (icef2ab) ? byd01aa  : icfaed0;
assign ene2c2f  = (icef2ab) ? bn6a9d  : qvbb406;
assign ea68ff2     = (icef2ab) ? jr27008     : hd9ea66;
assign by47f90     = (icef2ab) ? dmc0236     : coa99b8;
assign je3fc82     = (icef2ab) ? ux8d92     : lq66e01;
assign xwfe412      = (icef2ab) ? ux364a8      : hqb805f;
assign thd79d4    = (icef2ab) ? fp190ff       : rva0643;
assign gd9049d       = (icef2ab) ? icfff81       : ic43ffe;
tj3de81 qt54447   (        .sys_clk           (sys_clk),    .rst_n             (rst_n),    .zkd03c5          (wje877b),    .ng89868      (xy9c101),    .sw3130d     (yk53820),    .je119e5     (an8f2cf),    .do8cf2a   (jc7967d),    .gq31bc6        (en44bff),    .kdf2093         (ose0a12),    .ym5e7a       ({(LANE_WIDTH){dbb09f8}}),    .hqa7f10       ({(LANE_WIDTH){tue45b1}}),    .pu2f3d1   ({(LANE_WIDTH){fp27e3f}}),    .qg431a1     (mt9a6fe),    .fa7944d       (zx5fe66),    .cz6a75a   (vvf99b9),    .gda1320    (aa3b4e6),    .ba20bcf         (fpaac27),    .rgca26a  (ea7d7ca),    .qt51353   (vv5f283),    .ls89a9d   (lqca0f6),    .mgac915     (zm83d9f),    .pf648a8     (pff67d3),    .th61a18       (pu202c2),    .fp91fdb      (mrd3e21),    .ea4c82f       (xje62aa),    .vxb5a9a        (icc4365),    .lq79e8a      (czf8ffb),
        .qt6a6bb     (qt6a6bb),    .su535dc   (su535dc),    .yz9aee0      (yz9aee0),    .dzd7705  (dzd7705),    .ho52196     (ho52196),    .vxaa432    (vxaa432),    .ri86594     (ri86594),    .je35486     (je35486),    .bn6a90      (bn6a90),    .oh90cb2     (oh90cb2),    .zza504f   (zza504f),    .ph2827f       (ph2827f)    );
ohdf18 rgc5998   (        .sys_clk           (sys_clk),    .rst_n             (rst_n),    .gq31bc6        (en44bff),    .fne316a     (ou3b01d),    .kdf2093         (ose0a12),    .bn2d5a3            (dz4f5ae),    .ip6ad1f            (qtd6bbc),    .bn22886         (ne631a7),    .qvb47e9   (ecbcbe8),    .wya3f4c  (wya3f4c),    .ou1fa61     (je2fa08),    .alfd309     (su7d043),    .fne984c      (she8218),    .ic4c266         (of410c5),    .th61330         (kf862c),    .tj9987      (go43164),    .ps661f9      (dmc590c),    .ea4cc3f      (cb18b21),
        .hq30fca             (os7ddeb),    .gq87e53         (gq87e53),    .xy3f298     (xy3f298),    .ldf94c3      (ldf94c3),    .neca61e      (neca61e),    .ic530f3      (ic530f3),    .uk98798         (uk98798),    .wjc3cc1         (wjc3cc1),    .vk1e60c       (vk1e60c),    .blf3062          (blf3062)    );
pfdd82d ip753d6   (        .sys_clk           (sys_clk),    .rst_n             (rst_n),    .gq31bc6        (en44bff),    .kdf2093         (ose0a12),    .ho79420      (qt54e55),    .ic530f3      (phc4f1),    .swbc3b8  (ui6278e),    .rge1dc0           (rv9e387),    .lq79e8a      (czf8ffb),
        .go77012        (go77012),    .zmb8091  (zmb8091),    .ou1fa61     (ou1fa61),    .wya3f4c  (wya3f4c),    .oh12295  (oh12295),    .tj914ac      (tj914ac)    );
jea2c10 ep129e9   (        .sys_clk           (sys_clk),    .rst_n             (rst_n),    .gq31bc6        (en44bff),    .neca61e      (lsa71ea),    .pu83d89  (db38f52),    .ri1ec4a   (hbc7a97),
        .zxf6253  (zxf6253),    .wlb129f     (wlb129f),    .tw894fc (tw894fc),    .alfd309     (alfd309),    .go53f17   (go53f17),    .kf9f8b9      (kf9f8b9),    .vvfc5cd      (vvfc5cd)    );
mga6115 mre26c2   (        .sys_clk           (sys_clk),    .rst_n             (rst_n),    .gq31bc6        (en44bff),    .kdf2093         (ose0a12),    .ho79420      (qt54e55),    .hd1909e     (ym3e7e8),    .tj9987      (go43164),
        .ipf72c3       (ipf72c3),    .oub961d      (oub961d),    .kqcb0e8      (kqcb0e8),    .lq58741          (lq58741),    .czc3a0b          (czc3a0b)    );
jp50cf8 nt16b46   (        .sys_clk           (sys_clk),    .rst_n             (rst_n),    .gq31bc6        (en44bff),    .kdf2093         (ose0a12),    .ho79420      (qt54e55),    .ir3392d     (tu42f79),    .db84510        (cb1d8c6),    .xwe4b62     (xybde55),
    .tw25b12      (icef2ab),    .ph2d892      (ho79558),    .lq6c496      (hocaac2),
        .ic624b3         (ic624b3),    .ep12598     (ep12598),    .ou92cc4       (ou92cc4),    .vk96621      (vk96621),    .ukb310a        (ukb310a),    .gq98851     (os561a1),    .icc4288          (icc4288),    .mg21440          (mg21440)    );
alc6a76 zkc0b3f   (        .sys_clk           (sys_clk),    .rst_n             (rst_n),        .gq31bc6        (en44bff),    .ho79420      (qt54e55),    .wlb4422     (hq200ec),    .twa2114     (ym763),    .ng89868      (xy9c101),    .db84510        (cb1d8c6),    .bn22886         (ne631a7),
        .do14437      (do14437),    .lsa21bb        (lsa21bb),    .aa10dda    (aa10dda),    .je86ed0     (je86ed0),    .xl37682       (xl37682),    .gdbb417    (),    .dmda0bd         (dmda0bd)    );
kq591c4 hq86a9f   (        .sys_clk         (sys_clk),    .rst_n           (rst_n),    .gq31bc6      (en44bff),    .ng89868    (xy9c101),    .qi21ef8  (zxf3736),    .shc6261      (uiea704),    .ho79420    (qt54e55),    .bn22886       (ne631a7),    .gbf8072     (ipe78b7),
        .zkc0394   (aa2b3cb),    .tw1ca2   (ui59e58),    .bae513    (bae513),    .qg7289b      (qg7289b),    .zz944d8  (zz944d8),    .fca26c7   (fca26c7),    .hd1363a     (hd1363a),    .ph9b1d6       (ph9b1d6)    );
th6e072 qv2c304   (        .sys_clk         (sys_clk),    .rst_n           (rst_n),    .gq31bc6      (en44bff),    .kdf2093       (ose0a12),    .ng89868    (xy9c101),    .mtb4ec3     (nt28480),    .vka761d    (yz1203b),
        .co3b0ea     (co3b0ea),    .zxd8751 (zxd8751),    .kdc3a8f  (kdc3a8f),    .ep1d47c    (ep1d47c),    .wwea3e5      (wwea3e5)    );
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      co88624 <= 0;   end   else begin      co88624 <= en44bff;   end
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      zz345a <= 0;   end   else begin      zz345a <= 0;      case(en44bff)         DETECT   : zz345a  <= hb6eaa4;         POLLING  : zz345a  <= hdaa93c;         CONFIG   : zz345a  <= qva4f3c;         L0       : zz345a  <= cb3cf27;                             L0s      : zz345a  <= rv27b6a;           L1       : zz345a  <= gbedabf;         L2       : zz345a  <= yx6afe1;         RECOVERY : zz345a  <= jrbf86b;         LOOPBACK : zz345a  <= vie1af6;         HOTRST   : zz345a  <= nr6bd94;         DISABLED : zz345a  <= thf653d;         default  : zz345a  <= 0;      endcase   end
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      qg5c4ae <= 0;   end   else begin      case(ph38cf2)         3'd0: qg5c4ae <= 8'd4;         3'd1: qg5c4ae <= 8'd8;         3'd2: qg5c4ae <= 8'd16;         3'd3: qg5c4ae <= 8'd32;         3'd4: qg5c4ae <= 8'd62;         3'd5: qg5c4ae <= 8'd125;         3'd6: qg5c4ae <= 8'd250;         3'd7: qg5c4ae <= 8'd255;      endcase   end
end
`ifdef GEN2
   assign ec889 = (bn8409e | fn4a0b3 | qgf0203 | su535dc |                         zmb8091 | oub961d | vk96621 |                         je86ed0 | fca26c7 | kdc3a8f | fnc261d);
`else
   assign ec889 = (bn8409e | fn4a0b3 | qgf0203 | su535dc |                         zmb8091 | oub961d | vk96621 |                         je86ed0 | fca26c7 | kdc3a8f);
`endif
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      ymb94fb  <= 0;      neca7d8  <= 0;      ic53ec3  <= 0;      an9f619  <= 0;      nefb0cc <= 0;   end   else begin      ymb94fb  <= gd850d9;      neca7d8  <= czc6fc5;      ic53ec3  <= tj37e2c;      an9f619  <= gd850d9 | czc6fc5 | tj37e2c | xlbf166;      nefb0cc <= zxf6253;   end
end
assign nt28a64    = gd850d9;
assign ri11256 = zxf6253;
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      rt6bc36 <= 0;   end   else if (gd850d9 | kdf8b37) begin      rt6bc36 <= 0;   end   else begin      rt6bc36 <= mr7aa93 + 1'b1;   end
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      gb5e1b7 <= 0;   end   else if (zxf6253 | jcc59bd) begin      gb5e1b7 <= 0;   end   else if (cm439f8 == OS_NFTS && dme4adb == 1'b1) begin      gb5e1b7 <= vid549c;   end   else begin      gb5e1b7 <= vid549c + 1'b1;   end
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      nt2224a <= 0;   end   else begin      nt2224a <= (twbd71e + zz9e5ec + 1'd1) * ou346be;   end
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      ng89868       <= 1'b0;      ui43bca      <= 1'b0;      sw3130d      <= 1'b0;      je119e5      <= 1'b0;      qi21ef8     <= 1'b0;      hd1909e      <= 1'b0;      ic4c343     <= 1'b0;      ld64da1     <= 1'b0;      wlb4422      <= 1'b0;      twa2114      <= 1'b0;      do8cf2a    <= 1'b0;      swbc3b8   <= 1'b0;   end   else if (aa870bc) begin      ng89868       <= 1'b0;      ui43bca      <= 1'b0;      sw3130d      <= 1'b0;      je119e5      <= 1'b0;      qi21ef8     <= 1'b0;      hd1909e      <= 1'b0;      ic4c343     <= 1'b0;      ld64da1     <= 1'b0;      wlb4422      <= 1'b0;      twa2114      <= 1'b0;      do8cf2a    <= 1'b0;      swbc3b8   <= 1'b0;   end   else begin      if (ym979fd) begin      ng89868       <= (mr7aa93 == wje88c0)    ? 1'b1 : 1'b0;      ui43bca      <= (mr7aa93 == fac0925)   ? 1'b1 : 1'b0;      sw3130d      <= (mr7aa93 == aa2495b)   ? 1'b1 : 1'b0;      je119e5      <= (mr7aa93 == pu256c0)   ? 1'b1 : 1'b0;      qi21ef8     <= (mr7aa93 == jcc0627)  ? 1'b1 : 1'b0;      end      else begin      ng89868       <= (mr7aa93 == wje88c0/4)   ? 1'b1 : 1'b0;      ui43bca      <= (mr7aa93 == fac0925/4)  ? 1'b1 : 1'b0;      sw3130d      <= (mr7aa93 == aa2495b/4)  ? 1'b1 : 1'b0;      je119e5      <= (mr7aa93 == pu256c0/4)  ? 1'b1 : 1'b0;      qi21ef8     <= (mr7aa93 == jcc0627/4) ? 1'b1 : 1'b0;      end      hd1909e      <= (mr7aa93 == gqa35f0)   ? 1'b1 : 1'b0;      ic4c343     <= (mr7aa93 == mg1af80)  ? 1'b1 : 1'b0;      ld64da1     <= (mr7aa93 == ir189d7)  ? 1'b1 : 1'b0;      wlb4422      <= (mr7aa93 >= ldd7c01)   ? 1'b1 : 1'b0;      twa2114      <= (mr7aa93 >= qgf007d)   ? 1'b1 : 1'b0;      do8cf2a    <= (mr7aa93 >= ls1f44) ? 1'b1 : 1'b0;      if (wje877b) begin                  swbc3b8  <= (mr7aa93    >= (32'd4096 * ou346be)) ? 1'b1 : 1'b0;      end      else begin                  swbc3b8  <= (mr7aa93    >= (hd385e1 * ou346be))  ? 1'b1 : 1'b0;      end   end
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      pu83d89   <= 1'b0;      xy1b11c  <= 1'b0;      ep23623  <= 1'b0;   end   else if (do1b339) begin      pu83d89   <= 1'b0;      xy1b11c  <= 1'b0;      ep23623  <= 1'b0;   end   else begin      if (wje877b) begin                  pu83d89    <= (vid549c <  ((ir95bbb * ou346be     )-3)) ? 1'b0 : 1'b1;                  xy1b11c   <= (vid549c >= (((ir95bbb-1) * ou346be )-2) &&                                 vid549c <  ((ir95bbb * ou346be     )-2)) ? 1'b1 : 1'b0;      end      else begin                  pu83d89    <= (vid549c <  ((qg43667)-3)) ? 1'b0 : 1'b1;                  xy1b11c   <= (vid549c >= ((twbd71e * ou346be   )-2) &&                                 vid549c <  ((qg43667)-2)) ? 1'b1 : 1'b0;      end            ep23623      <= (vid549c < (twbd71e * ou346be     )-2)  ? 1'b1 : 1'b0;   end
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      xj45326 <= 0;   end   else if (oh12295) begin      xj45326 <= ri83ebb + gbe2e65;   end   else begin      xj45326 <= ri83ebb;   end
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      gbcc7ee <= 0;   end   else if (lqfe040 || zza504f) begin
`ifdef LW1
         if (ose0a12[0] == 1'b1)            gbcc7ee <= ls3f44f[7:0];
`endif
`ifdef LW2
         if (ose0a12[0] == 1'b1)            gbcc7ee <= ls3f44f[7:0];         else if (ose0a12[1] == 1'b1)            gbcc7ee <= ls3f44f[15:8];
`endif
`ifdef LW4
         if (ose0a12[0] == 1'b1)            gbcc7ee <= ls3f44f[7:0];         else if (ose0a12[1] == 1'b1)            gbcc7ee <= ls3f44f[15:8];         else if (ose0a12[2] == 1'b1)            gbcc7ee <= ls3f44f[23:16];         else if (ose0a12[3] == 1'b1)            gbcc7ee <= ls3f44f[31:24];
`endif
   end
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      vkadddc <= 4'hF;      jp6eee2 <= 4'hF;   end   else begin      vkadddc <= nr4f1a7;      jp6eee2 <= zmb29ef;   end
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      mrc331f <= 4'b1111;      qv238b0          <= 0;   end   else begin      mrc331f <= (ww469b9 | gqa6e41 | ymb904f | wj413c6 |                                                          nr4f1a7 | uvc69f9 | jea7e61 | zxf985b);      qv238b0          <= (|ou2b575 == 1'b1) ? 1'b1 : 1'b0;   end
end
`ifdef GEN2
   always @(posedge sys_clk or negedge rst_n) begin      if (!rst_n)         ir184c3 <= 1'b0;      else         ir184c3 <= os7ddeb;   end   always @(posedge sys_clk or negedge rst_n) begin      if (!rst_n)         fnc261d <= 1'b0;      else if (!os7ddeb && ir184c3)         fnc261d <= 1'b1;      else if (gqbc3b5 && os7ddeb)         fnc261d <= 1'b1;      else         fnc261d <= 1'b0;   end
`endif
assign ls4449      = {(|nrecad5),   (|ou2b575), (|fad5d47), (|kd751d5),                           (|dm47562),(|byd589a),  (|ww62691),   (|kf9a446),   (|rv911a6)};
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      rtd88e2     <= 0;      suc4716 <= 0;      jrb0bee   <= 1'd0;      yz85f77    <= 1'd0;      pu2fbbd    <= 4'd0;   end   else if (ou3b01d == 1'b1) begin      rtd88e2     <= 0;      suc4716 <= 0;      jrb0bee   <= 1'd0;      yz85f77    <= 1'd0;      pu2fbbd    <= 4'd0;   end   else begin      jrb0bee   <=  rv911a6;      yz85f77    <=  ww62691;      pu2fbbd    <=  kf9a446;
      if (co88624 == 'd1 || co88624 == 'd2)         rtd88e2     <= ba2ffea ;      else         rtd88e2     <= (nrecad5    | ou2b575 | fad5d47 | kd751d5  |              dm47562 | byd589a  | ww62691   | kf9a446 |              rv911a6);
      casex(zz286cc)         9'b1xxxxxxxx : suc4716 <= hb616fc;         9'bx1xxxxxxx : suc4716 <= cz5bf3b;         9'bxx1xxxxxx : suc4716 <= xjfceeb;         9'bxxx1xxxxx : suc4716 <= sw3bafc;         9'bxxxx1xxxx : suc4716 <= neebf07;         9'bxxxxx1xxx : suc4716 <= blfc1df;         9'bxxxxxx1xx : suc4716 <= ux77f0;         9'bxxxxxxx1x : suc4716 <= psdfc28;         9'bxxxxxxxx1 : suc4716 <= kqf0a1b;         default      : suc4716 <= (en44bff == 'd1 || en44bff == 'd2) ? cm439f8 : OS_IDLE;      endcase   end
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      co8712b <= 0;      ofc61c4 <= 0;   end   else begin
`ifdef DOWN_X1
      co8712b <= 4'b1000;      ofc61c4 <= 3'd1;
`else
      if (ou3b01d == 1'b1) begin         co8712b <= 4'b1111;         ofc61c4 <= 3'd4;      end      else begin         co8712b <= ose0a12;
`ifdef LW4
            ofc61c4 <= ose0a12[0] + ose0a12[1] + ose0a12[2] + ose0a12[3];
`endif
`ifdef LW2
            ofc61c4 <= ose0a12[0] + ose0a12[1];
`endif
`ifdef LW1
            ofc61c4 <= ose0a12[0];
`endif
      end
`endif
   end
end
assign kdf2093 = (ou3b01d) ? 4'b1111 : mr7aeb0;
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      db1617d <= 0;   end   else if (en44bff == DETECT) begin      db1617d <= 0;   end   else if (osffc08) begin      db1617d <= 1'b1;   end
end
always@* begin ym979fd<=ld7b613[0];of51db5<=ld7b613[1];gq2e05c<={tu48ee4>>1,ld7b613[2]};gbe2e65<={nta504c>>1,ld7b613[3]};sh702e0<={fa47723>>1,ld7b613[4]};gqb6b32<={qv95390>>1,ld7b613[5]};xlb5990<={ksa9c85>>1,ld7b613[6]};qt54e55<={ho79420>>1,ld7b613[7]};nre9354<={gd1de50>>1,ld7b613[8]};tu4d539<={icef284>>1,ld7b613[9]};czf8ffb<={lq79e8a>>1,ld7b613[10]};tu42f79<={ir3392d>>1,ld7b613[11]};by76d66<={cm72a72>>1,ld7b613[12]};ph38cf2<={mrc95e4>>1,ld7b613[13]};wje877b<=ld7b613[14];ou3b01d<=ld7b613[15];zz9e5ec<={vic0c83>>1,ld7b613[16]};cb953d4<=ld7b613[17];ip7ff53<=ld7b613[18];osffa9c<=ld7b613[19];cb1d8c6<=ld7b613[20];nt28480<=ld7b613[21];she8218<=ld7b613[22];of410c5<=ld7b613[23];kf862c<=ld7b613[24];hbc7a97<=ld7b613[25];uiea704<={shc6261>>1,ld7b613[26]};go43164<=ld7b613[27];icc4365<=ld7b613[28];xybde55<=ld7b613[29];cb18b21<=ld7b613[30];dmc590c<=ld7b613[31];icef2ab<=ld7b613[32];ho79558<=ld7b613[33];hocaac2<=ld7b613[34];en44bff<={gq31bc6>>1,ld7b613[35]};ba2ffea<={ym8de31>>1,ld7b613[36]};ose0a12<={kdf2093>>1,ld7b613[37]};mr7aeb0<={thd79d4>>1,ld7b613[38]};zx7ec66<=ld7b613[39];lsa71ea<=ld7b613[40];phc4f1<=ld7b613[41];gdb19b7<=ld7b613[42];su7d043<=ld7b613[43];je2fa08<=ld7b613[44];kde7e06<={vx1c585>>1,ld7b613[45]};xy3f035<={ene2c2f>>1,ld7b613[46]};nrecad5<={zx5059f>>1,ld7b613[47]};ou2b575<={db9ba68>>1,ld7b613[48]};fad5d47<={yz9aee0>>1,ld7b613[49]};kd751d5<={gq87e53>>1,ld7b613[50]};dm47562<={wlb129f>>1,ld7b613[51]};byd589a<={ic624b3>>1,ld7b613[52]};ww62691<={lsa21bb>>1,ld7b613[53]};kf9a446<={qg7289b>>1,ld7b613[54]};rv911a6<={co3b0ea>>1,ld7b613[55]};ww469b9<={hoca102>>1,ld7b613[56]};gqa6e41<={ux8a6e9>>1,ld7b613[57]};ymb904f<={ipf72c3>>1,ld7b613[58]};wj413c6<={ou92cc4>>1,ld7b613[59]};nr4f1a7<={do14437>>1,ld7b613[60]};uvc69f9<={bae513>>1,ld7b613[61]};jea7e61<={vk1e60c>>1,ld7b613[62]};zxf985b<={go53f17>>1,ld7b613[63]};hb616fc<={ec82cff>>1,ld7b613[64]};cz5bf3b<={rtdd347>>1,ld7b613[65]};xjfceeb<={dzd7705>>1,ld7b613[66]};sw3bafc<={xy3f298>>1,ld7b613[67]};neebf07<={tw894fc>>1,ld7b613[68]};blfc1df<={ep12598>>1,ld7b613[69]};ux77f0<={aa10dda>>1,ld7b613[70]};psdfc28<={zz944d8>>1,ld7b613[71]};kqf0a1b<={zxd8751>>1,ld7b613[72]};gd850d9<=ld7b613[73];zz286cc<={ls4449>>1,ld7b613[74]};qg43667<={nt2224a>>1,ld7b613[75]};do1b339<=ld7b613[76];jpc2f0e<=ld7b613[77];wl17876<=ld7b613[78];ea672a5<=ld7b613[79];dz4f5ae<={bn2d5a3>>1,ld7b613[80]};qtd6bbc<={ip6ad1f>>1,ld7b613[81]};zm83d9f<={mgac915>>1,ld7b613[82]};pff67d3<={pf648a8>>1,ld7b613[83]};lsb09a<={ohd0c6>>1,ld7b613[84]};pfc269b<={me68634>>1,ld7b613[85]};gd2cdbf<={qgef2ad>>1,ld7b613[86]};hd9bfa4<={ep18d09>>1,ld7b613[87]};dmfe93b<={uvc684c>>1,ld7b613[88]};pfe38b6<={zx55a12>>1,ld7b613[89]};mt9a6fe<={qg431a1>>1,ld7b613[90]};zx5fe66<={fa7944d>>1,ld7b613[91]};shd398a<={tj9905>>1,ld7b613[92]};mta4ed3<={ec34264>>1,ld7b613[93]};ph28668<={tu4d4eb>>1,ld7b613[94]};vvf99b9<={cz6a75a>>1,ld7b613[95]};ea7d7ca<={rgca26a>>1,ld7b613[96]};vv5f283<={qt51353>>1,ld7b613[97]};lqca0f6<={ls89a9d>>1,ld7b613[98]};ph19a39<={zkeb509>>1,ld7b613[99]};aa3b4e6<={gda1320>>1,ld7b613[100]};tw1e54f<={god4257>>1,ld7b613[101]};fpaac27<={ba20bcf>>1,ld7b613[102]};ne631a7<={bn22886>>1,ld7b613[103]};ecbcbe8<={qvb47e9>>1,ld7b613[104]};rv9e387<={rge1dc0>>1,ld7b613[105]};ipe78b7<={gbf8072>>1,ld7b613[106]};yz1203b<={vka761d>>1,ld7b613[107]};oh8aab0<={rt64179>>1,ld7b613[108]};xje62aa<={ea4c82f>>1,ld7b613[109]};pu202c2<={th61a18>>1,ld7b613[110]};mrd3e21<={fp91fdb>>1,ld7b613[111]};ls3f44f<={yz8fede>>1,ld7b613[112]};kdf2a7a<={oha1d64>>1,ld7b613[113]};hb4f64b<={yx6a3b1>>1,ld7b613[114]};yxd92ff<={hd8ec64>>1,ld7b613[115]};wj4bfec<={yzb1933>>1,ld7b613[116]};ykffb27<={ld64ceb>>1,ld7b613[117]};rtec9c5<={ir33af4>>1,ld7b613[118]};rv27176<={tuebd21>>1,ld7b613[119]};zkc5db7<={lqf485d>>1,ld7b613[120]};tu76dd9<={co2175d>>1,ld7b613[121]};dob7650<={ps5d74a>>1,ld7b613[122]};yxd941d<={dm5d29b>>1,ld7b613[123]};th5076b<={hb4a6df>>1,ld7b613[124]};wl1dafa<={db9b7f8>>1,ld7b613[125]};nr6bea5<={tudfe31>>1,ld7b613[126]};uifa97e<={alf8c59>>1,ld7b613[127]};hda5f80<={qi3166d>>1,ld7b613[128]};nr7e033<={ay59b47>>1,ld7b613[129]};wl80cf8<={yk6d1c7>>1,ld7b613[130]};oh33e2f<={ho471c8>>1,ld7b613[131]};alf8be4<={thc721f>>1,ld7b613[132]};je2f92b<={vvc87fc>>1,ld7b613[133]};aa870bc<=ld7b613[134];dme4adb<=ld7b613[135];ne42028<=ld7b613[136];ux80a19<=ld7b613[137];dbb09f8<=ld7b613[138];tue45b1<=ld7b613[139];fp27e3f<=ld7b613[140];zke1da8<={cb26d0e>>1,ld7b613[141]};jeed42<={mt36875>>1,ld7b613[142]};qva1aad<={zma25bb>>1,ld7b613[143]};zza00e3<=ld7b613[144];mg71f<=ld7b613[145];vx38f8<=ld7b613[146];ph1c7c6<=ld7b613[147];jpe3e37<=ld7b613[148];ou1f1bf<=ld7b613[149];wjf8df8<=ld7b613[150];czc6fc5<=ld7b613[151];tj37e2c<=ld7b613[152];xlbf166<=ld7b613[153];kdf8b37<=ld7b613[154];jcc59bd<=ld7b613[155];vi66f5c<={mrc331f>>1,ld7b613[156]};hd385e1<={xj45326>>1,ld7b613[157]};twbd71e<={gbcc7ee>>1,ld7b613[158]};hd910e7<={rtd88e2>>1,ld7b613[159]};cm439f8<={suc4716>>1,ld7b613[160]};fac0d5c<=ld7b613[161];vx6ae3<=ld7b613[162];ng3571e<={pu2fbbd>>1,ld7b613[163]};mr7aa93<={rt6bc36>>1,ld7b613[
164]};vid549c<={gb5e1b7>>1,ld7b613[165]};tj1cfc0<=ld7b613[166];sue080b<=ld7b613[167];xy9c101<=ld7b613[168];ls3fa4d<=ld7b613[169];yk53820<=ld7b613[170];an8f2cf<=ld7b613[171];zxf3736<=ld7b613[172];ym3e7e8<=ld7b613[173];gqbc3b5<=ld7b613[174];hq200ec<=ld7b613[175];ym763<=ld7b613[176];jc7967d<=ld7b613[177];ui6278e<=ld7b613[178];db38f52<=ld7b613[179];fc4c88<=ld7b613[180];ux26443<=ld7b613[181];ri83ebb<={qg5c4ae>>1,ld7b613[182]};icfaed0<={dz64ee4>>1,ld7b613[183]};qvbb406<={wy3b936>>1,ld7b613[184]};byd01aa<={xwe4d84>>1,ld7b613[185]};bn6a9d<={an36115>>1,ld7b613[186]};vxaa772<={tj8456f>>1,ld7b613[187]};ie9dcb1<={mg15bf7>>1,ld7b613[188]};me72c42<={en6fdc2>>1,ld7b613[189]};qvb1082<={ipf70ae>>1,ld7b613[190]};zk420a0<={vvc2baa>>1,ld7b613[191]};gq82819<={cbaeab0>>1,ld7b613[192]};rva0643<={zzaac2c>>1,ld7b613[193]};fp190ff<={jrb0b38>>1,ld7b613[194]};ic43ffe<={qv2ce3d>>1,ld7b613[195]};icfff81<={hd38f60>>1,ld7b613[196]};osffc08<=ld7b613[197];lqfe040<=ld7b613[198];qgf0203<=ld7b613[199];zz81018<=ld7b613[200];ux80c6<=ld7b613[201];ld40634<=ld7b613[202];nt31a6<=ld7b613[203];gd18d37<=ld7b613[204];kdc69bc<=ld7b613[205];co34de4<=ld7b613[206];swa6f21<=ld7b613[207];iebc84e<={ux26ed3>>1,ld7b613[208]};qi2138b<={mtbb4ef>>1,ld7b613[209]};wj4e2cf<={gbd3bea>>1,ld7b613[210]};ph8b3ee<={ykefaa8>>1,ld7b613[211]};xwcfbb8<={oseaa08>>1,ld7b613[212]};dmeee11<={hqa820f>>1,ld7b613[213]};xyb8459<={ir83dc>>1,ld7b613[214]};je11657<={swf725>>1,ld7b613[215]};cm595df<={wjdc94e>>1,ld7b613[216]};jc577ca<={vk253a2>>1,ld7b613[217]};jcdf294<={ip4e89c>>1,ld7b613[218]};xwca516<={vka2726>>1,ld7b613[219]};zz9459b<={ba9c997>>1,ld7b613[220]};lf166fb<={ep265d2>>1,ld7b613[221]};tj9bef1<={qi974a6>>1,ld7b613[222]};nefbc7a<={dzd2987>>1,ld7b613[223]};dmf1e90<={iea61fe>>1,ld7b613[224]};al7a41d<={aa87f83>>1,ld7b613[225]};ep9076e<={lqfe0c2>>1,ld7b613[226]};yz1dbaa<={xy83098>>1,ld7b613[227]};hb6eaa4<={fp13d9d>>1,ld7b613[228]};hdaa93c<={osff185>>1,ld7b613[229]};qva4f3c<={gd9049d>>1,ld7b613[230]};cb3cf27<={blf3062>>1,ld7b613[231]};gd3c9ed<={vvfc5cd>>1,ld7b613[232]};rv27b6a<={tj914ac>>1,ld7b613[233]};gbedabf<={czc3a0b>>1,ld7b613[234]};yx6afe1<={mg21440>>1,ld7b613[235]};jrbf86b<={ph2827f>>1,ld7b613[236]};vie1af6<={ph9b1d6>>1,ld7b613[237]};nr6bd94<={wwea3e5>>1,ld7b613[238]};thf653d<={dmda0bd>>1,ld7b613[239]};zmb29ef<={vkadddc>>1,ld7b613[240]};tj94f7a<={jp6eee2>>1,ld7b613[241]};end
always@* begin necf6c2[2047]<=fnddca9;necf6c2[2046]<=tu48ee4[0];necf6c2[2044]<=nta504c[0];necf6c2[2041]<=mt36875[0];necf6c2[2040]<=fa47723[0];necf6c2[2034]<=zma25bb[0];necf6c2[2033]<=ba9c997[0];necf6c2[2032]<=qv95390[0];necf6c2[2027]<=hb4a6df[0];necf6c2[2020]<=rv137a2;necf6c2[2018]<=ep265d2[0];necf6c2[2016]<=ksa9c85[0];necf6c2[2015]<=ir33af4[0];necf6c2[2006]<=db9b7f8[0];necf6c2[1995]<=ea4c82f[0];necf6c2[1992]<=rv9bd16;necf6c2[1988]<=qi974a6[0];necf6c2[1984]<=ho79420[0];necf6c2[1983]<=tuebd21[0];necf6c2[1982]<=qvb47e9[0];necf6c2[1980]<=ea4cc3f;necf6c2[1965]<=tudfe31[0];necf6c2[1950]<=th61330;necf6c2[1943]<=th61a18[0];necf6c2[1937]<=wwde8b7;necf6c2[1930]<=gq31bc6[0];necf6c2[1929]<=dzd2987[0];necf6c2[1922]<=ph2827f[0];necf6c2[1921]<=gd1de50[0];necf6c2[1918]<=lqf485d[0];necf6c2[1916]<=rge1dc0[0];necf6c2[1912]<=ps661f9;necf6c2[1882]<=alf8c59[0];necf6c2[1853]<=ri1ec4a;necf6c2[1839]<=fp91fdb[0];necf6c2[1827]<=lqf45b9;necf6c2[1818]<=ep29936;necf6c2[1813]<=ym8de31[0];necf6c2[1811]<=iea61fe[0];necf6c2[1806]<=ic624b3[0];necf6c2[1802]<=ou92cc4[0];necf6c2[1798]<=fc209bb;necf6c2[1797]<=ph9b1d6[0];necf6c2[1795]<=icef284[0];necf6c2[1794]<=mrc331f[0];necf6c2[1789]<=co2175d[0];necf6c2[1785]<=gbf8072[0];necf6c2[1777]<=tw25b12;necf6c2[1776]<=tj914ac[0];necf6c2[1746]<=ec34264[0];necf6c2[1716]<=qi3166d[0];necf6c2[1687]<=rgca26a[0];necf6c2[1685]<=pf648a8[0];necf6c2[1667]<=vvc87fc[0];necf6c2[1659]<=shc6261[0];necf6c2[1648]<=db9ba68[0];necf6c2[1631]<=yz8fede[0];necf6c2[1630]<=uv6f189;necf6c2[1618]<=pu83d89;necf6c2[1607]<=rgcf453;necf6c2[1599]<=swf725[0];necf6c2[1588]<=ay4c9b4;necf6c2[1578]<=kdf2093[0];necf6c2[1577]<=qt7a29b;necf6c2[1574]<=aa87f83[0];necf6c2[1564]<=lsa21bb[0];necf6c2[1556]<=do14437[0];necf6c2[1548]<=ux26ed3[0];necf6c2[1546]<=wwea3e5[0];necf6c2[1542]<=lq79e8a[0];necf6c2[1540]<=xj45326[0];necf6c2[1530]<=ps5d74a[0];necf6c2[1527]<=yzb1933[0];necf6c2[1522]<=vka761d[0];necf6c2[1519]<=ba20bcf[0];necf6c2[1511]<=fne984c;necf6c2[1506]<=ph2d892;necf6c2[1504]<=czc3a0b[0];necf6c2[1460]<=fa7944d[0];necf6c2[1445]<=tu4d4eb[0];necf6c2[1440]<=ho471c8[0];necf6c2[1436]<=ene2c2f[0];necf6c2[1418]<=qv2ce3d[0];necf6c2[1389]<=zx55a12[0];necf6c2[1384]<=ay59b47[0];necf6c2[1383]<=ou1fa61;necf6c2[1369]<=oh39f06;necf6c2[1353]<=ui43bca;necf6c2[1336]<=ks3efe4;necf6c2[1327]<=qt51353[0];necf6c2[1323]<=ohd0c6[0];necf6c2[1318]<=je119e5;necf6c2[1316]<=dz64ee4[0];necf6c2[1287]<=nt28a64;necf6c2[1280]<=dzd7705[0];necf6c2[1271]<=tj9987;necf6c2[1249]<=yz9aee0[0];necf6c2[1248]<=xlbf904;necf6c2[1246]<=gd9049d[0];necf6c2[1226]<=twa2114;necf6c2[1214]<=oha1d64[0];necf6c2[1213]<=zkeb509[0];necf6c2[1212]<=yk78c4c;necf6c2[1197]<=qgef2ad[0];necf6c2[1188]<=ep23623;necf6c2[1177]<=hd1909e;necf6c2[1169]<=xwe4d84[0];necf6c2[1166]<=go77012;necf6c2[1163]<=mg15bf7[0];necf6c2[1151]<=wjdc94e[0];necf6c2[1136]<=neca7d8;necf6c2[1129]<=hb4acd0;necf6c2[1112]<=vvc2baa[0];necf6c2[1109]<=thd79d4[0];necf6c2[1108]<=gb5e1b7[0];necf6c2[1107]<=ead14dd;necf6c2[1101]<=lqfe0c2[0];necf6c2[1080]<=qg7289b[0];necf6c2[1064]<=bae513[0];necf6c2[1055]<=ldfcea7;necf6c2[1048]<=mtbb4ef[0];necf6c2[1044]<=dmda0bd[0];necf6c2[1036]<=ir3392d[0];necf6c2[1032]<=gbcc7ee[0];necf6c2[1027]<=tw894fc[0];necf6c2[1023]<=coa90ef;necf6c2[1020]<=cb26d0e[0];necf6c2[1016]<=vka2726[0];necf6c2[1013]<=dm5d29b[0];necf6c2[1007]<=ld64ceb[0];necf6c2[997]<=rt64179[0];necf6c2[991]<=bn22886[0];necf6c2[990]<=xwe4b62;necf6c2[975]<=ic4c266;necf6c2[965]<=lq6c496;necf6c2[961]<=mg21440[0];necf6c2[909]<=ri11256;necf6c2[903]<=wlb129f[0];necf6c2[901]<=ipf72c3[0];necf6c2[899]<=lqe4137;necf6c2[897]<=nefb0cc;necf6c2[888]<=vvfc5cd[0];necf6c2[873]<=tj9905[0];necf6c2[843]<=cz6a75a[0];necf6c2[842]<=mgac915[0];necf6c2[833]<=thc721f[0];necf6c2[824]<=zx5059f[0];necf6c2[815]<=db320df;necf6c2[809]<=swbc3b8;necf6c2[799]<=ir83dc[0];necf6c2[788]<=hd38f60[0];necf6c2[763]<=hd8ec64[0];necf6c2[759]<=god4257[0];necf6c2[755]<=mtb4ec3;necf6c2[730]<=qg431a1[0];necf6c2[720]<=yk6d1c7[0];necf6c2[718]<=vx1c585[0];necf6c2[709]<=jrb0b38[0];necf6c2[694]<=uvc684c[0];necf6c2[691]<=alfd309;necf6c2[684]<=ic530f3;necf6c2[676]<=ng89868;necf6c2[668]<=yz7dfc;necf6c2[659]<=sw3130d;necf6c2[658]<=qg5c4ae[0];necf6c2[640]<=rtdd347[0];necf6c2[624]<=gbf7f20;necf6c2[623]<=osff185[0];necf6c2[613]<=wlb4422;necf6c2[606]<=ls89a9d[0];necf6c2[598]<=me68634[0];necf6c2[588]<=qi21ef8;necf6c2[584]<=wy3b936[0];necf6c2[581]<=tj8456f[0];necf6c2[568]<=ymb94fb;necf6c2[556]<=ipf70ae[0];necf6c2[554]<=rt6bc36[0];necf6c2[527]<=mr4bf3a;necf6c2[513]<=xy3f298[0];necf6c2[510]<=pu2f3d1;necf6c2[508]<=ip4e89c[0];necf6c2[495]<=vxb5a9a;necf6c2[454]<=nt2224a[0];necf6c2[451]<=gq87e53[0];necf6c2[450]<=ux8a6e9[0];necf6c2[449]<=hbfc826;necf6c2[448]<=an9f619;necf6c2[444]<=blf3062[0];necf6c2[421]<=ip6ad1f[0];necf6c2[407]<=vic0c83[0];necf6c2[404]<=do8cf2a;necf6c2[399]<=hqa820f[0];necf6c2[381]<=yx6a3b1[0];necf6c2[379]<=gda1320[0];necf6c2[377]<=db84510;necf6c2[354]<=zzaac2c[0];necf6c2[347]<=ep18d09[0];necf6c2[342]<=neca61e;necf6c2[338]<=ic4c343;necf6c2[334]<=en60fbf;necf6c2[329]<=xy1b11c;necf6c2[320]<=ec82cff[0];necf6c2[311]<=fp13d9d[0];necf6c2[306]<=ld64da1;necf6c2[290]<=an36115[0];necf6c2[284]<=qt6a6bb;necf6c2[278]<=en6fdc2[0];necf6c2[277]<=pu2fbbd[0];necf6c2[255]<=hqa7f10;necf6c2[254]<=vk253a2[0];necf6c2[227]<=ls4449[0];necf6c2[225]<=hoca102[0];necf6c2[224]<=ic53ec3;necf6c2[210]<=bn2d5a3[0];necf6c2[203]<=fne316a;necf6c2[199]<=oseaa08[0];necf6c2[177]<=cbaeab0[0];necf6c2[171]<=aa24e7c;necf6c2[169]<=qv238b0;necf6c2[167]<=me5374d;necf6c2[160]<=go53f17[0];necf6c2[155]<=xy83098[0];necf6c2[138]<=yz85f77;necf6c2[127]<=ym5e7a;necf6c2[113]<=ec889;necf6c2[112]<=co3b0ea[0];necf6c2[101]<=zkd03c5;necf6c2[99]<=ykefaa8[0];necf6c2[83]<=jp6eee2[0];necf6c2[80]<=vk1e60c[0];necf6c2[69]<=jrb0bee;necf6c2[63]<=she753f;necf6c2[56]<=zxd8751[0];necf6c2[50]<=mrc95e4[0];necf6c2[49]<=gbd3bea[0];necf6c2[41]<=vkadddc[0];necf6c2[34]<=suc4716[0];necf6c2[28]<=zz944d8[0];necf6c2[25]<=cm72a72[0];necf6c2[17]<=rtd88e2[0];necf6c2[14]<=aa10dda[0];necf6c2[7]<=ep12598[0];end         assign suff972 = necf6c2,ld7b613 = cme5c87;   initial begin   jcc030e = $fopen(".fred");   $fdisplay( jcc030e, "%3h\n%3h", (thc27c7 >> 4) & fnc7fe5, (thc27c7 >> (mt9f1ff+4)) & fnc7fe5 );   $fclose(jcc030e);   $readmemh(".fred", qg721c0);   end   always @ (suff972) begin   ym8700c = qg721c0[1];       for (vk1872=0; vk1872<qgdb09f; vk1872=vk1872+1) begin           cme5c87[vk1872] = suff972[ym8700c];       rv38061  = ^(ym8700c & qg721c0[0]);       ym8700c =  {ym8700c, rv38061};       end   end
endmodule