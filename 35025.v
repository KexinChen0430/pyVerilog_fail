module dzf97e7 #(
   parameter LANE_WIDTH   = 1 ,   parameter MSM_WIDTH    = 3 ,   parameter L0sTSM_WIDTH = 2 ,   parameter L1SM_WIDTH   = 1 ,   parameter L2SM_WIDTH   = 1 )
  (input wire                    me77f56 ,
   input wire                    alfd586 ,
   input wire                    sys_clk ,
   input wire                    rst_n ,
   input wire                    coa90ef ,
   input wire                    fnddca9 ,
   input wire [7:0]              tu48ee4,
   input wire [4:0]              nta504c,
   input wire [9:0]              yxd6218,
   input wire [3:0]              fa47723,
   input wire [7:0]              qv95390,
   input wire                    ksa9c85,
   input wire                    oh124b7,
   input wire                    ho79420,
   input wire                    gd1de50,
   input wire                    icef284,
   input wire                    lq79e8a,
   input wire                    ir3392d,
   input wire                    cm72a72,
   input wire                    je1681,
   input wire                    uv6f189,
   input wire                    yk78c4c,
   input wire                    db84510,
   input wire                    mtb4ec3,
   input wire                    fne984c,
   input wire                    ic4c266,
   input wire                    th61330,
   input wire                    ri1ec4a,
   input wire                    shc6261,
   input wire                    tj9987,
   input wire                    vxb5a9a,
   input wire                    xwe4b62,
   input wire [2:0]              mrc95e4,
   input wire                    ea4cc3f,
   input wire                    ps661f9,
   input wire                    zkd03c5,
   input wire                    fne316a,
   input wire [15:0]             wwf5804,
   input wire                    wyac021,
   input wire                    uv60109,
   input wire                    ym84d,
   input wire                    pu4269,
   input wire                    qi2134a,
   input wire                    vx9a51,
   input wire  [15:0]            tx_lbk_data,
   input wire  [1:0]             tx_lbk_kcntl,
   output wire                   tx_lbk_rdy,
   output reg  [15:0]            rx_lbk_data,
   output reg  [1:0]             rx_lbk_kcntl,
   output wire                   xw79cac,
   output wire [MSM_WIDTH:0]     phy_ltssm_state,
   output wire [2:0]             phy_ltssm_substate,
   output wire [2:0]             phy_cfgln_sum,
   output wire                   ho63221,
   output wire                   jrc662,
   output wire [1:0]             vvc8857,
   output wire [2:0]             wj442bf,
   output wire                   uk215fc,
   output wire                   ymafe1,
   output wire                   ps57f08,
   output wire                   fpbf843,
   output wire                   thfc21e,
   output wire                   zke10f6,
   output wire                   oh87b3,
   output wire                   me43d9c,
   output wire [7:0]             tw1ece0,
   output wire                   pff6703,
   output wire                   swb381f,
   output wire                   ng9c0f8,
   output wire                   kd7a2e1,
   output wire                   ym3bfe4,
   output wire [L0sTSM_WIDTH:0]  gbf8670,
   output wire [L1SM_WIDTH:0]    hd19c25,
   output wire [L2SM_WIDTH:0]    ip70971,
   output wire                   ui43120,
   output wire [15:0]            ng30b67,
   output wire                   ep85b3b,
   output wire                   nt2d9dd,
   output wire [15:0]            vi6ceee,
   output wire                   go67772,
   output wire                   mg3bb90,
   output wire                   xjddc80,
   output wire                   psee406,
   output wire                   kq72032           );
wire                        co8712b;
wire   [15:0]               vv6e518;
wire   [1:0]                go728c6;
wire   [1:0]                oua3187;
wire                        xl94630;
wire                        an18c38;
wire   [1:0]                tj641b;
wire   [3:0]                vic0c83;
wire   [2:0]                ofc61c4;
wire   [15:0]               yza106d ;
wire   [1:0]                gd836d ;
wire   [15:0]               vidabf4 ;
wire   [1:0]                dmd5fa3 ;
wire   [1:0]                jrafd1a ;
wire   [1:0]                vv7e8d7;
wire   [1:0]                psf46be;
wire   [1:0]                oua35f2;
wire   [1:0]                db2d014;
reg    [15:0]               ww680a7;
reg    [1:0]                vv40539;
wire                        tw25b12;
wire                        ph2d892;
wire                        lq6c496;
reg                         hd94dca;
`ifdef DWN_STRM_LANE
`else
`endif
`ifdef ROOT_COMP
`else
`endif
`ifdef DWN_STRM_PORT
`else
`endif
wire   eace895;
wire   nr744a8;
wire   zma2546;
reg ym979fd;
reg of51db5;
reg [7 : 0] gq2e05c;
reg [4 : 0] gbe2e65;
reg [9 : 0] en549cd;
reg [3 : 0] sh702e0;
reg [7 : 0] gqb6b32;
reg xlb5990;
reg al51d1c;
reg qt54e55;
reg nre9354;
reg tu4d539;
reg czf8ffb;
reg tu42f79;
reg by76d66;
reg mt36395;
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
reg xybde55;
reg [2 : 0] ph38cf2;
reg cb18b21;
reg dmc590c;
reg wje877b;
reg ou3b01d;
reg [15 : 0] qt60385;
reg tw1c2d;
reg bae16b;
reg sh70b5b;
reg sj85add;
reg vx2d6ed;
reg nr6b76f;
reg [15 : 0] ui43b2e;
reg [1 : 0] gd1d970;
reg [15 : 0] ldecb84;
reg [1 : 0] gb65c26;
reg [1 : 0] mg2e134;
reg of709a0;
reg nt84d05;
reg [1 : 0] gd2682f;
reg [3 : 0] zz9e5ec;
reg [2 : 0] zza0be8;
reg [15 : 0] ie5f46;
reg [1 : 0] ri2fa31;
reg [15 : 0] ea7d18b;
reg [1 : 0] kde8c58;
reg [1 : 0] ww462c4;
reg [1 : 0] ym31621;
reg [1 : 0] lf8b108;
reg [1 : 0] tu58847;
reg [1 : 0] icc423a;
reg [15 : 0] mg211d0;
reg [1 : 0] oh8e81;
reg icef2ab;
reg ho79558;
reg hocaac2;
reg zz38bc3;
reg sjd6df;
reg vv6b6fc;
reg ip5b7e6;
reg [2047:0] necf6c2;
wire [67:0] ld7b613;
`ifdef DWN_STRM_LANE
`else
`endif
`ifdef ROOT_COMP
`else
`endif
`ifdef DWN_STRM_PORT
`else
`endif
localparam qgdb09f = 68,nrd84f8 = 32'hfdffd88b;
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
`ifdef DWN_STRM_LANE
`else
`endif
`ifdef ROOT_COMP
`else
`endif
`ifdef DWN_STRM_PORT
`else
`endif
`ifdef DWN_STRM_LANE
   assign tw25b12 = 1'b1;
`else
   assign tw25b12 = 1'b0;
`endif
`ifdef ROOT_COMP
   assign lq6c496 = 1'b1;
`else
   assign lq6c496 = 1'b0;
`endif
`ifdef DWN_STRM_PORT
   assign ph2d892 = 1'b1;
`else
   assign ph2d892 = 1'b0;
`endif
assign wj442bf = 3'b001;
assign psda058 = mt36395 ? 1'b1 : ps57f08 ;
pu11dfd vid0808 (      .bn8efea       ( sys_clk ),   .me77f56       ( me77f56 ),   .tjbfab0       ( sys_clk ),   .alfd586       ( alfd586 ),   .rst_n            ( rst_n ),      .os561a1 ( me43d9c ),   .psda058    ( psda058 ),   .hd94dca     ( zz38bc3 ),   .sw3423a    ( mg211d0 ),   .oha11d0   ( oh8e81 ),   .ep8e85  ( icc423a ),   .ps4742d( jcd0b5f),   .vk3a16b       ( gqb6b32 ),   .tud0b5b      ( xlb5990 ),   .gd85ada        ( al51d1c ),   .db2d6d5   ( qt54e55 ),   .zx6b6af  ( tu42f79 ),   .of5b57e  ( by76d66 ),      .ym1af90     ( tw1ece0 ),   .dzd7c81    ( pff6703 ),   .mtbe40f   ( swb381f ),   .alf207d ( thfc21e),   .vidabf4      ( vidabf4 ),   .dmd5fa3     ( dmd5fa3 ),   .jrafd1a       ( jrafd1a ),   .vv7e8d7  ( vv7e8d7 ),   .psf46be ( psf46be ),   .oua35f2 ( oua35f2 )   );
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n)      hd94dca <= 'd0;   else begin      if (phy_ltssm_state == 'd1)         hd94dca <= 1'b1;      else if (phy_ltssm_state == 'd0)         hd94dca <= 'd0;   end
end
nt22160 th6b3dc   (      .sys_clk              (sys_clk),   .rst_n                (rst_n),   .sj2c185            (ea7d18b),   .of60c2d           (kde8c58),   .bn616c             (ww462c4),
      .ng30b67           (ng30b67),   .ep85b3b         (ep85b3b),   .nt2d9dd        (nt2d9dd),   .vi6ceee           (vi6ceee),   .go67772            (go67772),   .mg3bb90              (mg3bb90),   .xjddc80             (xjddc80),   .psee406             (psee406),   .kq72032            (kq72032)   );
assign eace895  = ym31621[1] |  ym31621[0] ;
assign nr744a8 = lf8b108[1] |  lf8b108[0] ;
assign zma2546 = tu58847[1] |  tu58847[0] ;
qtc6cea mee5cde   (        .sys_clk             (sys_clk),    .rst_n               (rst_n),    .coa90ef         (ym979fd),    .fnddca9      (of51db5),    .tu48ee4            (gq2e05c),    .nta504c           (gbe2e65),    .fa47723         (sh702e0),
        .mrc95e4         (ph38cf2),    .zkd03c5            (wje877b),    .fne316a       (ou3b01d),
        .qv95390            (ea7d18b),    .ksa9c85           (kde8c58),                .ho79420        (sjd6df),    .ir3392d       (vv6b6fc),    .cm72a72       (ip5b7e6),    .gd1de50      (nre9354),    .icef284       (tu4d539),    .lq79e8a        (czf8ffb),
    .vic0c83         (zz9e5ec),    .db320df        (db320df),        .uv6f189      (ip7ff53),    .yk78c4c          (osffa9c),    .db84510          (cb1d8c6),    .mtb4ec3         (nt28480),    .fne984c        (she8218),    .ic4c266           (of410c5),    .th61330           (kf862c),    .ri1ec4a     (hbc7a97),    .shc6261          (uiea704),    .tj9987        (go43164),    .vxb5a9a          (icc4365),    .xwe4b62       (xybde55),    .ps661f9        (dmc590c),    .ea4cc3f        (cb18b21),
    .tw25b12        (icef2ab),    .ph2d892        (ho79558),    .lq6c496        (hocaac2),
        .qg6dca3   (xw79cac),    .vv6e518          (vv6e518),    .go728c6         (go728c6),    .xl94630           (xl94630),    .oua3187        (oua3187),    .an18c38       (an18c38),
    .co8712b     (co8712b),    .ofc61c4     (ofc61c4),
    .db1617d   (ps57f08),    .yz8514c     (fpbf843),    .sw3b91b      (sw3b91b),    .ri25679      (zke10f6),    .aa2b3cb     (bl4fa94),    .ui59e58     (oh87b3),    .os561a1    (me43d9c),    .ps79603        (ng9c0f8),    .sucb01a       (uk215fc),    .xw580d1       (ymafe1),    .co88624         (phy_ltssm_state),    .zz345a      (phy_ltssm_substate),    .os7ddeb            (os7ddeb),    .kf9f8b9        (gbf8670),    .lq58741            (hd19c25),    .icc4288            (ip70971),    .ui43120      (ui43120),    .xyb83fe        (ym3bfe4)    );
pff982b hdaff01   (      .sys_clk              (sys_clk),   .rst_n                (rst_n),   .yxd6218          (en549cd),   .wwf5804           (qt60385),   .wyac021             (tw1c2d),   .uv60109            (bae16b),   .ym84d            (sh70b5b),   .pu4269        (sj85add),   .qi2134a       (vx2d6ed),   .vx9a51            (nr6b76f),   .ned08a2             (ldecb84),   .lf84512            (gb65c26),   .vk144b7              (of709a0),   .nt22896           (mg2e134),   .zma25bb         (sw3b91b),   .byc5606          ({(LANE_WIDTH){nt84d05}}),   .co88624          (phy_ltssm_state),   .ui43120       (ui43120),      .vic0c83          (vic0c83),   .tj641b       (tj641b),   .db320df         (db320df),   .kf12dda             (yza106d),   .pu96ed5            (gd836d),   .dob76ab           (db2d014),   .cbbb55b         (jcd0b5f),   .xwdaadd              ()   );
assign vvc8857 = (os7ddeb) ? gd2682f : 1'b0;
assign jrc662   = (os7ddeb) ? db320df   : 1'b0;
assign kd7a2e1         = os7ddeb;
assign phy_cfgln_sum  = zza0be8;
assign ho63221      = co8712b;
always @(*) begin   if (bl4fa94) begin            ww680a7  = ui43b2e;      vv40539 = gd1d970;
            rx_lbk_data    = ea7d18b;      rx_lbk_kcntl   = kde8c58;   end   else begin            ww680a7  = ie5f46;      vv40539 = ri2fa31;
            rx_lbk_data    = 0;      rx_lbk_kcntl   = 0;   end
end
assign tx_lbk_rdy = bl4fa94;
always@* begin ym979fd<=ld7b613[0];of51db5<=ld7b613[1];gq2e05c<={tu48ee4>>1,ld7b613[2]};gbe2e65<={nta504c>>1,ld7b613[3]};en549cd<={yxd6218>>1,ld7b613[4]};sh702e0<={fa47723>>1,ld7b613[5]};gqb6b32<={qv95390>>1,ld7b613[6]};xlb5990<=ld7b613[7];al51d1c<=ld7b613[8];qt54e55<=ld7b613[9];nre9354<=ld7b613[10];tu4d539<=ld7b613[11];czf8ffb<=ld7b613[12];tu42f79<=ld7b613[13];by76d66<=ld7b613[14];mt36395<=ld7b613[15];ip7ff53<=ld7b613[16];osffa9c<=ld7b613[17];cb1d8c6<=ld7b613[18];nt28480<=ld7b613[19];she8218<=ld7b613[20];of410c5<=ld7b613[21];kf862c<=ld7b613[22];hbc7a97<=ld7b613[23];uiea704<=ld7b613[24];go43164<=ld7b613[25];icc4365<=ld7b613[26];xybde55<=ld7b613[27];ph38cf2<={mrc95e4>>1,ld7b613[28]};cb18b21<=ld7b613[29];dmc590c<=ld7b613[30];wje877b<=ld7b613[31];ou3b01d<=ld7b613[32];qt60385<={wwf5804>>1,ld7b613[33]};tw1c2d<=ld7b613[34];bae16b<=ld7b613[35];sh70b5b<=ld7b613[36];sj85add<=ld7b613[37];vx2d6ed<=ld7b613[38];nr6b76f<=ld7b613[39];ui43b2e<={tx_lbk_data>>1,ld7b613[40]};gd1d970<={tx_lbk_kcntl>>1,ld7b613[41]};ldecb84<={vv6e518>>1,ld7b613[42]};gb65c26<={go728c6>>1,ld7b613[43]};mg2e134<={oua3187>>1,ld7b613[44]};of709a0<=ld7b613[45];nt84d05<=ld7b613[46];gd2682f<={tj641b>>1,ld7b613[47]};zz9e5ec<={vic0c83>>1,ld7b613[48]};zza0be8<={ofc61c4>>1,ld7b613[49]};ie5f46<={yza106d>>1,ld7b613[50]};ri2fa31<={gd836d>>1,ld7b613[51]};ea7d18b<={vidabf4>>1,ld7b613[52]};kde8c58<={dmd5fa3>>1,ld7b613[53]};ww462c4<={jrafd1a>>1,ld7b613[54]};ym31621<={vv7e8d7>>1,ld7b613[55]};lf8b108<={psf46be>>1,ld7b613[56]};tu58847<={oua35f2>>1,ld7b613[57]};icc423a<={db2d014>>1,ld7b613[58]};mg211d0<={ww680a7>>1,ld7b613[59]};oh8e81<={vv40539>>1,ld7b613[60]};icef2ab<=ld7b613[61];ho79558<=ld7b613[62];hocaac2<=ld7b613[63];zz38bc3<=ld7b613[64];sjd6df<=ld7b613[65];vv6b6fc<=ld7b613[66];ip5b7e6<=ld7b613[67];end
always@* begin necf6c2[2047]<=fnddca9;necf6c2[2046]<=tu48ee4[0];necf6c2[2044]<=nta504c[0];necf6c2[2040]<=yxd6218[0];necf6c2[2032]<=fa47723[0];necf6c2[2017]<=qv95390[0];necf6c2[1992]<=uv6f189;necf6c2[1987]<=ksa9c85;necf6c2[1936]<=yk78c4c;necf6c2[1927]<=oh124b7;necf6c2[1873]<=ym84d;necf6c2[1851]<=nr744a8;necf6c2[1849]<=tw25b12;necf6c2[1847]<=dmd5fa3[0];necf6c2[1825]<=db84510;necf6c2[1807]<=ho79420;necf6c2[1767]<=db2d014[0];necf6c2[1698]<=pu4269;necf6c2[1655]<=zma2546;necf6c2[1651]<=ph2d892;necf6c2[1646]<=jrafd1a[0];necf6c2[1602]<=mtb4ec3;necf6c2[1567]<=gd1de50;necf6c2[1486]<=ww680a7[0];necf6c2[1348]<=qi2134a;necf6c2[1296]<=tx_lbk_data[0];necf6c2[1287]<=mrc95e4[0];necf6c2[1255]<=lq6c496;necf6c2[1244]<=vv7e8d7[0];necf6c2[1157]<=fne984c;necf6c2[1088]<=vv6e518[0];necf6c2[1086]<=icef284;necf6c2[1064]<=ri1ec4a;necf6c2[1053]<=ps661f9;necf6c2[1038]<=an18c38;necf6c2[1023]<=coa90ef;necf6c2[996]<=je1681;necf6c2[936]<=uv60109;necf6c2[925]<=eace895;necf6c2[924]<=vv40539[0];necf6c2[923]<=vidabf4[0];necf6c2[883]<=oua35f2[0];necf6c2[648]<=vx9a51;necf6c2[643]<=xwe4b62;necf6c2[544]<=tx_lbk_kcntl[0];necf6c2[532]<=th61330;necf6c2[526]<=ea4cc3f;necf6c2[519]<=xl94630;necf6c2[498]<=cm72a72;necf6c2[468]<=wyac021;necf6c2[462]<=hd94dca;necf6c2[461]<=gd836d[0];necf6c2[441]<=psf46be[0];necf6c2[321]<=vxb5a9a;necf6c2[266]<=ic4c266;necf6c2[259]<=oua3187[0];necf6c2[249]<=ir3392d;necf6c2[234]<=wwf5804[0];necf6c2[230]<=yza106d[0];necf6c2[160]<=tj9987;necf6c2[129]<=go728c6[0];necf6c2[124]<=lq79e8a;necf6c2[117]<=fne316a;necf6c2[115]<=ofc61c4[0];necf6c2[80]<=shc6261;necf6c2[58]<=zkd03c5;necf6c2[57]<=vic0c83[0];necf6c2[28]<=tj641b[0];end         assign suff972 = necf6c2,ld7b613 = cme5c87;   initial begin   jcc030e = $fopen(".fred");   $fdisplay( jcc030e, "%3h\n%3h", (thc27c7 >> 4) & fnc7fe5, (thc27c7 >> (mt9f1ff+4)) & fnc7fe5 );   $fclose(jcc030e);   $readmemh(".fred", qg721c0);   end   always @ (suff972) begin   ym8700c = qg721c0[1];       for (vk1872=0; vk1872<qgdb09f; vk1872=vk1872+1) begin           cme5c87[vk1872] = suff972[ym8700c];       rv38061  = ^(ym8700c & qg721c0[0]);       ym8700c =  {ym8700c, rv38061};       end   end
endmodule