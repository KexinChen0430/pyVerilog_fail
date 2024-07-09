module ouacceb (
   input wire           sys_clk ,
   input wire           rst_n ,
   input wire [15:0]   icd170d ,
   input wire          bn8b869 ,
   input wire          me5c34e ,
   input wire [2:0]    rtcdaa7 ,
   input wire          aaf45c ,
   `ifdef ECRC
      input wire       cba14f3 ,
   `endif
   output reg [15:0]   ksa79d ,
   output reg          kq53ce9 ,
   output reg          rv9e749 ,
   output reg         ayfa03b,
   `ifdef ECRC
      output reg      ks9d276 ,
   `endif
   output reg         vve93b1 ,
   output reg         kq49d8f ,
   output reg         inta_n ,
   output reg         intb_n ,
   output reg         intc_n ,
   output reg         intd_n ,
   output reg         ftl_err_msg ,
   output reg         nftl_err_msg ,
   output reg         cor_err_msg          ) ;
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
reg [15:0]             kq72727 ;
reg [15:0]             fc93939 ;
reg [15:0]             ba9c9cb ;
reg [15:0]             vie4e5a ;
reg                    fp272d2 ;
reg                    gd39696 ;
reg                    ykcb4b4 ;
reg                    vv5a5a1 ;
reg                    bld2d0e ;
reg                    vk96877 ;
reg                    anb43bb ;
reg                    ana1ddc ;
reg                    rieee4 ;
reg                    kq77722 ;
reg                    gdbb911 ;
reg                    aldc88c ;
reg                    nee4464 ;
reg                    xl22323 ;
reg                    tw1191e ;
reg                    fc8c8f2 ;
reg [D_WIDTH -1:0]     oh23c9f ;
reg [D_WIDTH -1:0]     mrf27ea ;
reg [D_WIDTH -1:0]     an9faab ;
reg [D_WIDTH -1:0]     qgeaaec ;
reg [D_WIDTH -1:0]     gdabb0f ;
reg [D_WIDTH -1:0]     blec3ea ;
reg [D_WIDTH -1:0]     ksfabe ;
reg [10:0]             go7d5f0 ;
reg                    ykeaf80 ;
reg                    jc57c01 ;
reg                    irbe00b ;
reg [2:0]              suf005d ;
reg                    oh802e8 ;
reg                    je1744 ;
reg                    vkba22 ;
reg                    rg5d112;
reg                    yxe8893;
reg [10:0]             qg7de9b ;
reg                    zz224e4 ;
`ifdef ECRC
reg                 kf12726 ;
`endif
wire [31:0]            ls93934 ;
wire [31:0]            xy9c9a3 ;
wire [1:0]             zxe9ec4 ;
wire [4:0]             pf4f626 ;
wire [2:0]             gq34695 ;
wire                   uka34a8 ;
wire                   uk1a540 ;
wire [1:0]             thd2a00 ;
wire [1:0]             kf95007 ;
wire [15:0]            pua803d ;
wire [7:0]             rt401eb ;
wire [2:0]             gqf5e ;
wire [3:0]             cb7af1 ;
wire [3:0]             tj3d78c ;
wire [7:0]             zkebc66 ;
wire                   sh5e333 ;
wire                   byf199c ;
wire                   ls8cce3 ;
wire                   tu6671b ;
wire                   oh338da ;
wire                   hq9c6d4 ;
wire                   xje36a3 ;
wire                   tw1b51e ;
wire                   jcda8f2 ;
wire                   kqd4793 ;
wire                   oua3c99 ;
wire                   do1e4c9 ;
wire                   mrf264a ;
wire                   vk93255 ;
wire                   vk992aa ;
wire                   enc9553  ;
wire                   nr4aa9c  ;
wire                   hb554e6 ;
wire                   tjaa737 ;
wire                   qg539be  ;
wire                   ls9cdf1 ;
wire                   zxe6f8a  ;
wire                   ph37c57 ;
wire                   qvbe2be ;
wire                   faf15f5 ;
wire                   oh8afaa ;
wire                   ne57d54 ;
wire                   ohbeaa3;
wire                   kqf551c;
wire                   dbaa8e0  ;
wire                   yx54707 ;
wire                   wya383d ;
wire                   rv1c1e9 ;
wire                   wwe0f4f ;
wire                   mt7a78 ;
wire                   vx3d3c4 ;
wire                   rte9e26 ;
`ifdef ECRC
wire [15:0]         dz4f136 ;
wire                go789b7 ;
wire                cmc4db9 ;
wire [31:0]         wl26dc9 ;
wire [31:0]         jpe9c91 ;
wire [31:0]         nr61d36 ;
wire                half_data ;
wire                qt4e48e ;
wire                lq4d8c5 ;
`endif
wire                   tu6c62b ;
wire                   vi6315b ;
reg        ep18ada;
reg [10:0] tuc56d4;
reg [10:0] wy2b6a2;
reg        qt5b510;
`ifdef ECRC
`endif
`ifdef ECRC
`else
`endif
`ifdef ECRC
`endif
reg lqda884;
reg ayd4423;
reg nga2119;
reg qi108ca;
reg jr84650;
reg [15 : 0] wl23286;
reg nt19434;
reg rgca1a7;
reg [2 : 0] gd26aed;
reg mgb992f;
reg [15 : 0] qi34ef2;
reg [15 : 0] baa7791;
reg [15 : 0] ym3bc8a;
reg [15 : 0] mede450;
reg gbf2280;
reg bn91405;
reg wl8a02f;
reg fn5017d;
reg cb80bef;
reg uk5f7d;
reg je2fbe9;
reg su7df4b;
reg uiefa59;
reg cm7d2c9;
reg vve9648;
reg mr4b247;
reg ay5923d;
reg shc91e9;
reg tu48f4c;
reg fa47a63;
reg [D_WIDTH - 1 : 0] lde98d6;
reg [D_WIDTH - 1 : 0] lq635b0;
reg [D_WIDTH - 1 : 0] shd6c11;
reg [D_WIDTH - 1 : 0] fpb0469;
reg [D_WIDTH - 1 : 0] xy11a71;
reg [D_WIDTH - 1 : 0] ho69c50;
reg [D_WIDTH - 1 : 0] ld71415;
reg [10 : 0] kf8a0ae;
reg nr50575;
reg mg82baf;
reg sw15d78;
reg [2 : 0] yzaebc0;
reg kd75e05;
reg hdaf02d;
reg yk7816e;
reg nec0b70;
reg ec5b83;
reg [10 : 0] wwefda0;
reg xj6e0ce;
reg [31 : 0] yx70676;
reg [31 : 0] je833b4;
reg [1 : 0] rtdd291;
reg [4 : 0] zxe948f;
reg [2 : 0] jc768f0;
reg uxb4782;
reg coa3c14;
reg [1 : 0] ls1e0a1;
reg [1 : 0] wwf050a;
reg [15 : 0] sw82850;
reg [7 : 0] pu14280;
reg [2 : 0] epa1403;
reg [3 : 0] aaa01d;
reg [3 : 0] ld500e9;
reg [7 : 0] yz8074f;
reg nt3a7c;
reg cb1d3e6;
reg jpe9f35;
reg rt4f9ae;
reg lq7cd76;
reg the6bb3;
reg ri35d9f;
reg kfaecfb;
reg by767dd;
reg ksb3eeb;
reg cb9f758;
reg dmfbac4;
reg dzdd622;
reg pseb117;
reg lq588ba;
reg wwc45d2;
reg xl22e90;
reg yz17487;
reg vxba43c;
reg vvd21e7;
reg wl90f3e;
reg co879f4;
reg sj3cfa0;
reg wje7d05;
reg ou3e82d;
reg lqf4168;
reg lfa0b42;
reg aa5a16;
reg hd2d0b1;
reg cm6858f;
reg ps42c79;
reg tj163ca;
reg gdb1e56;
reg an8f2b5;
reg jc795ad;
reg xwcad6a;
reg go56b52;
reg lfb5a91;
reg ngad48f;
reg al6a47b;
reg [10 : 0] vi523dc;
reg [10 : 0] xl91ee2;
reg mt8f716;
reg dz7b8b5;
reg czdc5ae;
reg ipe2d75;
reg jr16bad;
reg jrb5d6f;
reg [2047:0] necf6c2;
wire [106:0] ld7b613;
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
`ifdef ECRC
`else
`endif
`ifdef ECRC
`endif
localparam qgdb09f = 107,nrd84f8 = 32'hfdffe06b;
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
`ifdef ECRC
`else
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
`ifdef ECRC
`endif
`ifdef ECRC
`endif
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin     ykcb4b4  <= 1'b0 ;     vv5a5a1  <= 1'b0 ;     bld2d0e  <= 1'b0 ;     vk96877  <= 1'b0 ;     anb43bb  <= 1'b0 ;     ana1ddc  <= 1'b0 ;     rieee4  <= 1'b0 ;
     kq77722 <= 1'b0 ;     gdbb911 <= 1'b0 ;     aldc88c <= 1'b0 ;     nee4464 <= 1'b0 ;     xl22323 <= 1'b0 ;     tw1191e <= 1'b0 ;     fc8c8f2 <= 1'b0 ;
     oh23c9f  <= {(D_WIDTH){1'b0}} ;     mrf27ea  <= {(D_WIDTH){1'b0}} ;     an9faab  <= {(D_WIDTH){1'b0}} ;     qgeaaec  <= 16'd0 ;     gdabb0f  <= 16'd0 ;     blec3ea  <= 16'd0 ;     ksfabe  <= 16'd0 ;
     suf005d <= 3'b000 ;   end   else begin     ykcb4b4 <= nt19434 ;     vv5a5a1 <= wl8a02f ;     bld2d0e <= fn5017d ;     vk96877 <= cb80bef ;     anb43bb <= uk5f7d ;     ana1ddc <= je2fbe9 ;     rieee4 <= su7df4b ;     kq77722 <= rgca1a7 ;     gdbb911 <= cm7d2c9 ;     aldc88c <= vve9648 ;     nee4464 <= mr4b247 ;     xl22323 <= ay5923d ;     tw1191e <= shc91e9 ;     fc8c8f2 <= tu48f4c ;     oh23c9f  <= wl23286 ;     mrf27ea  <= lde98d6 ;     an9faab  <= lq635b0 ;     qgeaaec  <= shd6c11 ;     gdabb0f  <= fpb0469 ;     blec3ea  <= xy11a71 ;     ksfabe  <= ho69c50 ;
     suf005d <= gd26aed ;   end
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n)      je1744   <= 1'b0 ;   else if (nt19434)      je1744   <= 1'b1 ;   else      je1744  <= ~hdaf02d ;
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin     kq53ce9   <= 1'b0 ;     ksa79d <= {(D_WIDTH){1'b0}} ;   end   else begin     kq53ce9   <= uiefa59 ;     ksa79d <= ld71415 ;   end
end
assign tu6c62b = (uxb4782) ? ay5923d : tu48f4c ;
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      zz224e4 <= 1'b0 ;      rv9e749     <= 1'b0 ;   end   else begin      zz224e4 <= lfb5a91 ;      rv9e749     <= xj6e0ce ;   end
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin     kq72727 <= 16'hFF00 ;     fc93939 <= 16'h0000 ;     ba9c9cb <= 16'hFF00 ;     vie4e5a <= 16'h0000 ;   end   else if (uk5f7d) begin     kq72727 <= fpb0469[15: 0] ;     fc93939 <= shd6c11[15: 0] ;     ba9c9cb <= lq635b0[15: 0] ;     vie4e5a <= lde98d6[15: 0] ;   end   else if (tu48f4c) begin     kq72727 <= 16'hFF00 ;     fc93939 <= 16'h0000 ;     ba9c9cb <= 16'hFF00 ;     vie4e5a <= 16'h0000 ;   end   else begin     kq72727 <= qi34ef2 ;     fc93939 <= baa7791 ;     ba9c9cb <= ym3bc8a ;     vie4e5a <= mede450 ;   end
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n)     qg7de9b <= 11'h0 ;   else if (je2fbe9) begin     qg7de9b[9:0] <= fpb0469[9:0] ;     qg7de9b[10]  <= ~(|fpb0469[9:0]) ;   end
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n)     yxe8893 <= 1'b0 ;   else if (fn5017d )     yxe8893 <= (lq635b0[12:8] ==5'b0_0100) ? 1'b1 : 1'b0 ;   else if (rgca1a7 )     yxe8893 <= 1'b0 ;   else     yxe8893 <= ec5b83 ;
end
assign  ls93934 = {qi34ef2,baa7791};
assign  xy9c9a3 = {ym3bc8a,mede450};
assign zxe9ec4    =  yx70676[30:29] ;
assign pf4f626   =  yx70676[28:24] ;
assign gq34695     =  yx70676[22:20] ;
assign uka34a8     =  yx70676[15] ;
assign uk1a540     =  yx70676[14] ;
assign thd2a00   =  yx70676[13:12] ;
assign kf95007     =  yx70676[11:10] ;
assign oh338da  = (zxe948f ==  5'b0_0000) ;
assign hq9c6d4 = (zxe948f ==  5'b0_0010) ;
assign xje36a3 = (zxe948f ==  5'b0_0100) ;
assign tw1b51e = (zxe948f ==  5'b0_0101) ;
assign kqd4793     = (zxe948f[4:3] ==  2'b10) & ~(zxe948f[2:1] ==  2'b11) ;
assign oua3c99     = (zxe948f ==  5'b0_1010) ;
assign do1e4c9 = (rtdd291 ==  2'b00) ;
assign mrf264a = (rtdd291 ==  2'b01) ;
assign vk93255 = (rtdd291 ==  2'b10) ;
assign vk992aa = (rtdd291 ==  2'b11) ;
assign enc9553    = (dmfbac4 | dzdd622) & lq7cd76 ;
assign nr4aa9c    = (pseb117 | lq588ba) & lq7cd76 ;
assign hb554e6   = dmfbac4 & ri35d9f ;
assign tjaa737   = pseb117 & ri35d9f ;
assign cz6fecc   = dmfbac4 & kfaecfb ;
assign wjd996b   = pseb117 & kfaecfb ;
assign qg539be    = dzdd622 & ksb3eeb ;
assign ls9cdf1   = lq588ba & ksb3eeb ;
assign zxe6f8a    = dmfbac4 & cb9f758 ;
assign ph37c57   = pseb117 & cb9f758 ;
assign faf15f5     = (dmfbac4 | pseb117)  & the6bb3 ;
assign oh8afaa  = (dmfbac4 | dzdd622)  & (zxe948f ==  5'b0_0001) ;
assign dbaa8e0  = (dmfbac4)  & (zxe948f ==  5'b0_1011) ;
assign yx54707 = (pseb117)  & (zxe948f ==  5'b0_1011) ;
assign pua803d   =  je833b4[31:16] ;
assign rt401eb      =  je833b4[15:8] ;
assign cb7af1      =  je833b4[7:4] ;
assign tj3d78c      =  je833b4[3:0] ;
assign zkebc66 =  je833b4[7:0] ;
assign ohbeaa3    =  (yz8074f[7:4] == 4'b0111) ? 1'b1 : 1'b0;
assign qvae343    =  (yz8074f[7:4] == 4'b0100) ? 1'b1 : 1'b0;
assign kqf551c =  aa5a16 & (yz8074f[3:0] == 4'b1110) ;
assign gqf5e = je833b4[15:13] ;
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n)      fp272d2 <= 1'b0 ;   else if ( wl8a02f )      fp272d2 <= 1'b1 ;   else if (cm7d2c9 )      fp272d2 <= 1'b0 ;   else      fp272d2 <= gbf2280 ;
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n)      gd39696 <= 1'b0 ;   else if ( su7df4b )      gd39696 <= 1'b1 ;   else if (xj6e0ce )      gd39696 <= 1'b0 ;   else      gd39696 <= bn91405 ;
end
assign vi6315b = wl8a02f | fn5017d | cb80bef | uk5f7d |                   je2fbe9 | su7df4b | uiefa59 ;
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n)      ep18ada <= 1'b0 ;   else if (nt19434)      ep18ada <= 1'b1 ;   else if (cm7d2c9)      ep18ada <= 1'b0 ;
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n)      tuc56d4 <= 11'h000 ;   else if (nt19434)      tuc56d4 <= 11'h000 ;   else if (al6a47b)      tuc56d4 <= vi523dc + 1 ;
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n)      wy2b6a2 <= 11'h000 ;   else if (rgca1a7) begin      if ((rtdd291 == 2'b00) && !uxb4782) wy2b6a2 <= 'd5 ;      if ((rtdd291 == 2'b00) && uxb4782) wy2b6a2 <= 'd7 ;      if ((rtdd291 == 2'b01) && !uxb4782) wy2b6a2 <= 'd7 ;      if ((rtdd291 == 2'b01) && uxb4782) wy2b6a2 <= 'd9 ;      if ((rtdd291 == 2'b10) && !uxb4782 && (the6bb3 || ri35d9f || kfaecfb)) wy2b6a2 <= 'd7 ;      if ((rtdd291 == 2'b10) && uxb4782 && (the6bb3 || ri35d9f || kfaecfb)) wy2b6a2 <= 'd9 ;      if ((rtdd291 == 2'b11) && !uxb4782 && ksb3eeb) wy2b6a2 <= 'd9 ;      if ((rtdd291 == 2'b11) && uxb4782 && ksb3eeb) wy2b6a2 <= 'd11 ;   end
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n)      qt5b510 <= 1'b0 ;   else if (cm7d2c9 && (vi523dc != xl91ee2) && !xl22e90 && !sj3cfa0 & !ps42c79)      qt5b510 <= 1'b1 ;   else if (shc91e9)      qt5b510 <= 1'b0 ;
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n)      go7d5f0 <= 11'h000 ;   else if (cm7d2c9)      go7d5f0 <= 11'h000 ;   else if (gbf2280 && hdaf02d && !kd75e05)      if (uiefa59 && pseb117)         go7d5f0 <=  kf8a0ae + 11'h001 ;      else if (rgca1a7 && (!uxb4782 || (uxb4782 && ec5b83)))         go7d5f0 <=  kf8a0ae + 11'h001 ;      else if (!ngad48f && !rgca1a7 )         go7d5f0 <=  kf8a0ae + 11'h001 ;   else      go7d5f0 <= kf8a0ae ;
end
always @(yzaebc0 or kf8a0ae) begin   case (yzaebc0)      3'b000 :         oh802e8 = kf8a0ae[5] & kf8a0ae[0] ;      3'b001 :         oh802e8 = kf8a0ae[6] & kf8a0ae[0] ;      3'b010 :         oh802e8 = kf8a0ae[7] & kf8a0ae[0] ;      3'b011 :         oh802e8 = kf8a0ae[8] & kf8a0ae[0] ;      3'b100 :         oh802e8 = kf8a0ae[9] & kf8a0ae[0] ;      3'b101 :         oh802e8 = kf8a0ae[10] & kf8a0ae[0] ;      default :         oh802e8 = kf8a0ae[10] & kf8a0ae[0] ;   endcase
end
assign tu6671b = (xl22e90 | wl90f3e | sj3cfa0 | ps42c79) ;
assign sh5e333 = (kf8a0ae > wwefda0) ;
assign byf199c = cm7d2c9 & ((kf8a0ae ^ wwefda0) != 11'd0) ;
assign ls8cce3 = ((nt3a7c | cb1d3e6) & rt4f9ae)  ;
assign wya383d = bn91405 & (~wwc45d2 & ~lqf4168 &                                  ~xl22e90 &  ~ou3e82d &                                  ~yz17487 & ~vxba43c & ~cz6fecc & ~wjd996b &                                  ~vvd21e7 & ~wl90f3e &  ~co879f4 & ~sj3cfa0 &  ~cm6858f & ~ps42c79         ) ;
assign rv1c1e9 = (bn91405 & (dzdd622 | lq588ba) & zxe948f[4] & ~aa5a16 & ~qvae343 & (jc768f0 != 3'b00)) ;
assign wwe0f4f = bn91405 & ~mgb992f ;
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n)      ykeaf80 <= 1'b0 ;   else if (vve9648)      ykeaf80 <= 1'b0 ;   else if (kd75e05 | jpe9f35 | tj163ca | gdb1e56 | an8f2b5 | mt8f716)      ykeaf80 <= 1'b1 ;   else      ykeaf80 <= nr50575 ;
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n)       kq49d8f <= 1'b0 ;   else       kq49d8f <= nr50575 & xj6e0ce ;
end
`ifdef ECRC
   assign lq4d8c5 = cba14f3 & uxb4782 & ~qt4e48e & go789b7 ;   always @(posedge sys_clk or negedge rst_n) begin
      if (!rst_n)         kf12726 <= 1'b0 ;      else if (xj6e0ce)         kf12726 <= 1'b0 ;      else if (lq4d8c5)         kf12726 <= 1'b1 ;      else         kf12726 <= kf12726 ;   end
`endif
assign zmb7c0 = coa3c14 & rgca1a7 & (rtdd291[1] & ~tj163ca) ;
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n)      vkba22 <= 1'b0 ;   else if (xj6e0ce)      vkba22 <= 1'b0 ;   else if (zmb7c0)      vkba22 <= 1'b1 ;   else      vkba22 <= yk7816e ;
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n)       vve93b1 <= 1'b0 ;   else       vve93b1 <= (yk7816e & xj6e0ce);
end
`ifdef ECRC
                  assign dz4f136 =  wl8a02f ? {lde98d6[15:9], 1'b1, lde98d6[7:0]} :                     fn5017d ? {lde98d6[15],1'b1, lde98d6[13:0]} : lde98d6 ;      assign go789b7 = rgca1a7 ;      assign cmc4db9 = (wl8a02f | gbf2280) & ~nt19434 ;   hqb7379 tw83647(      .sys_clk    ( sys_clk ) ,      .rst_n      ( rst_n ) ,      .data_in    ( dz4f136 ) ,      .enable_crc ( cmc4db9 ) ,
      .nr61d36    ( nr61d36 )      ) ;      assign jpe9c91[15: 0] = (nr61d36[15:0] ^ wl23286) ;   assign jpe9c91[31:16] = (nr61d36[31:16] ^ lde98d6) ;   assign qt4e48e = (jpe9c91 == 32'h0000_0000) ;   always @(posedge sys_clk or negedge rst_n) begin      if (!rst_n)         rg5d112 <= 1'b0;      else         rg5d112 <= cba14f3 & uxb4782 & qt4e48e;   end
`else
   always @(posedge sys_clk or negedge rst_n) begin      if (!rst_n)         rg5d112 <= 1'b0;      else         rg5d112 <= tu48f4c;   end
`endif
`ifdef ECRC
   always @(posedge sys_clk or negedge rst_n) begin      if (!rst_n)         ks9d276 <= 1'b0 ;      else if (!uxb4782)         ks9d276 <= 1'b0 ;      else         ks9d276 <= kf12726 & ~nr50575 & xj6e0ce ;   end
`endif
assign swb696e = (jc768f0 == 3'b000) & nec0b70 ;
assign tj2dc2e  =  (dzdd622 & (zxe948f == 5'b10_100) & (yz8074f[7:4] == 4'b0010)) ;
assign sw2edad =  (tj2dc2e & (yz8074f[3:0] == 4'd0)) ;
assign lfb5a50 =  (tj2dc2e & (yz8074f[3:0] == 4'd1)) ;
assign th4a1db =  (tj2dc2e & (yz8074f[3:0] == 4'd2)) ;
assign wy3b7f1 =  (tj2dc2e & (yz8074f[3:0] == 4'd3)) ;
assign xwfe24b = (tj2dc2e & (yz8074f[3:0] == 4'd4)) ;
assign ay496d2 = (tj2dc2e & (yz8074f[3:0] == 4'd5)) ;
assign jcda42c = (tj2dc2e & (yz8074f[3:0] == 4'd6)) ;
assign qv858b4 = (tj2dc2e & (yz8074f[3:0] == 4'd7)) ;
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      inta_n <= 1'b1 ;      intb_n <= 1'b1 ;      intc_n <= 1'b1 ;      intd_n <= 1'b1 ;   end   else begin            if (!mgb992f)         inta_n <= 1'b1 ;      else if (sw2edad)         inta_n <= 1'b0 ;      else if (xwfe24b)         inta_n <= 1'b1 ;            if (!mgb992f)         intb_n <= 1'b1 ;      else if (lfb5a50)         intb_n <= 1'b0 ;      else if (ay496d2)         intb_n <= 1'b1 ;            if (!mgb992f)         intc_n <= 1'b1 ;      else if (th4a1db)         intc_n <= 1'b0 ;      else if (jcda42c)         intc_n <= 1'b1 ;            if (!mgb992f)         intd_n <= 1'b1 ;      else if (wy3b7f1)         intd_n <= 1'b0 ;      else if (qv858b4)         intd_n <= 1'b1 ;   end
end
assign rte9e26   = (dzdd622 & (zxe948f == 5'b10_000) & (yz8074f[7:4] == 4'b0011)) ;
assign ec2b2e2   = (go56b52 & (yz8074f[3:0] == 4'd0)) ;
assign cm5c408  = (go56b52 & (yz8074f[3:0] == 4'd1)) ;
assign fp81061   = (go56b52 & (yz8074f[3:0] == 4'd3)) ;
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      lqda884    <= 1'b0;      ayd4423    <= 1'b0;      nga2119    <= 1'b0;      qi108ca   <= 1'b0;      jr84650    <= 1'b0;   end   else begin      lqda884    <= tj2dc2e;      ayd4423    <= go56b52;      nga2119    <= ec2b2e2;      qi108ca   <= cm5c408;      jr84650    <= fp81061;   end
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      ftl_err_msg  <= 1'b0 ;      nftl_err_msg <= 1'b0 ;      cor_err_msg  <= 1'b0 ;   end   else begin      ftl_err_msg  <= jrb5d6f & swb696e ;      nftl_err_msg <= jr16bad & swb696e;      cor_err_msg  <= ipe2d75 & swb696e ;   end
end
assign mt7a78 = (dz7b8b5 || czdc5ae) ;
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      ayfa03b  <= 1'b0 ;   end   else  begin      ayfa03b  <= (fa47a63 && jc795ad) ;   end
end
always@* begin wl23286<={icd170d>>1,ld7b613[0]};nt19434<=ld7b613[1];rgca1a7<=ld7b613[2];gd26aed<={rtcdaa7>>1,ld7b613[3]};mgb992f<=ld7b613[4];qi34ef2<={kq72727>>1,ld7b613[5]};baa7791<={fc93939>>1,ld7b613[6]};ym3bc8a<={ba9c9cb>>1,ld7b613[7]};mede450<={vie4e5a>>1,ld7b613[8]};gbf2280<=ld7b613[9];bn91405<=ld7b613[10];wl8a02f<=ld7b613[11];fn5017d<=ld7b613[12];cb80bef<=ld7b613[13];uk5f7d<=ld7b613[14];je2fbe9<=ld7b613[15];su7df4b<=ld7b613[16];uiefa59<=ld7b613[17];cm7d2c9<=ld7b613[18];vve9648<=ld7b613[19];mr4b247<=ld7b613[20];ay5923d<=ld7b613[21];shc91e9<=ld7b613[22];tu48f4c<=ld7b613[23];fa47a63<=ld7b613[24];lde98d6<={oh23c9f>>1,ld7b613[25]};lq635b0<={mrf27ea>>1,ld7b613[26]};shd6c11<={an9faab>>1,ld7b613[27]};fpb0469<={qgeaaec>>1,ld7b613[28]};xy11a71<={gdabb0f>>1,ld7b613[29]};ho69c50<={blec3ea>>1,ld7b613[30]};ld71415<={ksfabe>>1,ld7b613[31]};kf8a0ae<={go7d5f0>>1,ld7b613[32]};nr50575<=ld7b613[33];mg82baf<=ld7b613[34];sw15d78<=ld7b613[35];yzaebc0<={suf005d>>1,ld7b613[36]};kd75e05<=ld7b613[37];hdaf02d<=ld7b613[38];yk7816e<=ld7b613[39];nec0b70<=ld7b613[40];ec5b83<=ld7b613[41];wwefda0<={qg7de9b>>1,ld7b613[42]};xj6e0ce<=ld7b613[43];yx70676<={ls93934>>1,ld7b613[44]};je833b4<={xy9c9a3>>1,ld7b613[45]};rtdd291<={zxe9ec4>>1,ld7b613[46]};zxe948f<={pf4f626>>1,ld7b613[47]};jc768f0<={gq34695>>1,ld7b613[48]};uxb4782<=ld7b613[49];coa3c14<=ld7b613[50];ls1e0a1<={thd2a00>>1,ld7b613[51]};wwf050a<={kf95007>>1,ld7b613[52]};sw82850<={pua803d>>1,ld7b613[53]};pu14280<={rt401eb>>1,ld7b613[54]};epa1403<={gqf5e>>1,ld7b613[55]};aaa01d<={cb7af1>>1,ld7b613[56]};ld500e9<={tj3d78c>>1,ld7b613[57]};yz8074f<={zkebc66>>1,ld7b613[58]};nt3a7c<=ld7b613[59];cb1d3e6<=ld7b613[60];jpe9f35<=ld7b613[61];rt4f9ae<=ld7b613[62];lq7cd76<=ld7b613[63];the6bb3<=ld7b613[64];ri35d9f<=ld7b613[65];kfaecfb<=ld7b613[66];by767dd<=ld7b613[67];ksb3eeb<=ld7b613[68];cb9f758<=ld7b613[69];dmfbac4<=ld7b613[70];dzdd622<=ld7b613[71];pseb117<=ld7b613[72];lq588ba<=ld7b613[73];wwc45d2<=ld7b613[74];xl22e90<=ld7b613[75];yz17487<=ld7b613[76];vxba43c<=ld7b613[77];vvd21e7<=ld7b613[78];wl90f3e<=ld7b613[79];co879f4<=ld7b613[80];sj3cfa0<=ld7b613[81];wje7d05<=ld7b613[82];ou3e82d<=ld7b613[83];lqf4168<=ld7b613[84];lfa0b42<=ld7b613[85];aa5a16<=ld7b613[86];hd2d0b1<=ld7b613[87];cm6858f<=ld7b613[88];ps42c79<=ld7b613[89];tj163ca<=ld7b613[90];gdb1e56<=ld7b613[91];an8f2b5<=ld7b613[92];jc795ad<=ld7b613[93];xwcad6a<=ld7b613[94];go56b52<=ld7b613[95];lfb5a91<=ld7b613[96];ngad48f<=ld7b613[97];al6a47b<=ld7b613[98];vi523dc<={tuc56d4>>1,ld7b613[99]};xl91ee2<={wy2b6a2>>1,ld7b613[100]};mt8f716<=ld7b613[101];dz7b8b5<=ld7b613[102];czdc5ae<=ld7b613[103];ipe2d75<=ld7b613[104];jr16bad<=ld7b613[105];jrb5d6f<=ld7b613[106];end
always@* begin necf6c2[2047]<=bn8b869;necf6c2[2046]<=me5c34e;necf6c2[2044]<=rtcdaa7[0];necf6c2[2041]<=aaf45c;necf6c2[2034]<=kq72727[0];necf6c2[2022]<=tu6671b;necf6c2[2021]<=fc93939[0];necf6c2[2017]<=nee4464;necf6c2[1996]<=oh338da;necf6c2[1995]<=ba9c9cb[0];necf6c2[1986]<=xl22323;necf6c2[1983]<=tj3d78c[0];necf6c2[1945]<=hq9c6d4;necf6c2[1943]<=vie4e5a[0];necf6c2[1925]<=tw1191e;necf6c2[1918]<=zkebc66[0];necf6c2[1908]<=ykeaf80;necf6c2[1901]<=qi108ca;necf6c2[1864]<=oh802e8;necf6c2[1855]<=ana1ddc;necf6c2[1842]<=xje36a3;necf6c2[1838]<=fp272d2;necf6c2[1803]<=fc8c8f2;necf6c2[1788]<=sh5e333;necf6c2[1773]<=lqda884;necf6c2[1769]<=jc57c01;necf6c2[1757]<=tuc56d4[0];necf6c2[1755]<=jr84650;necf6c2[1680]<=je1744;necf6c2[1662]<=rieee4;necf6c2[1637]<=tw1b51e;necf6c2[1628]<=gd39696;necf6c2[1624]<=do1e4c9;necf6c2[1583]<=uk1a540;necf6c2[1559]<=oh23c9f[0];necf6c2[1553]<=hb554e6;necf6c2[1529]<=byf199c;necf6c2[1519]<=gqf5e[0];necf6c2[1501]<=ksfabe[0];necf6c2[1499]<=ayd4423;necf6c2[1490]<=irbe00b;necf6c2[1487]<=vk96877;necf6c2[1467]<=wy2b6a2[0];necf6c2[1412]<=enc9553;necf6c2[1313]<=yx54707;necf6c2[1312]<=vkba22;necf6c2[1276]<=kq77722;necf6c2[1227]<=jcda8f2;necf6c2[1209]<=ykcb4b4;necf6c2[1200]<=mrf264a;necf6c2[1188]<=ohbeaa3;necf6c2[1158]<=rv1c1e9;necf6c2[1155]<=yxe8893;necf6c2[1118]<=thd2a00[0];necf6c2[1098]<=qvbe2be;necf6c2[1078]<=vx3d3c4;necf6c2[1070]<=mrf27ea[0];necf6c2[1058]<=tjaa737;necf6c2[1048]<=ls93934[0];necf6c2[1023]<=icd170d[0];necf6c2[1011]<=ls8cce3;necf6c2[1008]<=aldc88c;necf6c2[991]<=cb7af1[0];necf6c2[954]<=go7d5f0[0];necf6c2[950]<=nga2119;necf6c2[932]<=suf005d[0];necf6c2[927]<=anb43bb;necf6c2[886]<=qt5b510;necf6c2[878]<=ep18ada;necf6c2[812]<=oua3c99;necf6c2[791]<=uka34a8;necf6c2[776]<=nr4aa9c;necf6c2[759]<=rt401eb[0];necf6c2[750]<=blec3ea[0];necf6c2[743]<=bld2d0e;necf6c2[706]<=vk992aa;necf6c2[656]<=dbaa8e0;necf6c2[594]<=ne57d54;necf6c2[579]<=wya383d;necf6c2[577]<=rg5d112;necf6c2[549]<=ph37c57;necf6c2[539]<=mt7a78;necf6c2[524]<=zz224e4;necf6c2[504]<=gdbb911;necf6c2[439]<=vi6315b;necf6c2[406]<=kqd4793;necf6c2[395]<=gq34695[0];necf6c2[379]<=pua803d[0];necf6c2[375]<=gdabb0f[0];necf6c2[371]<=vv5a5a1;necf6c2[353]<=vk93255;necf6c2[328]<=kqf551c;necf6c2[297]<=oh8afaa;necf6c2[274]<=zxe6f8a;necf6c2[269]<=wwe0f4f;necf6c2[262]<=qg7de9b[0];necf6c2[219]<=tu6c62b;necf6c2[197]<=pf4f626[0];necf6c2[189]<=kf95007[0];necf6c2[187]<=qgeaaec[0];necf6c2[148]<=faf15f5;necf6c2[137]<=ls9cdf1;necf6c2[109]<=rte9e26;necf6c2[98]<=zxe9ec4[0];necf6c2[93]<=an9faab[0];necf6c2[68]<=qg539be;necf6c2[49]<=xy9c9a3[0];end         assign suff972 = necf6c2,ld7b613 = cme5c87;   initial begin   jcc030e = $fopen(".fred");   $fdisplay( jcc030e, "%3h\n%3h", (thc27c7 >> 4) & fnc7fe5, (thc27c7 >> (mt9f1ff+4)) & fnc7fe5 );   $fclose(jcc030e);   $readmemh(".fred", qg721c0);   end   always @ (suff972) begin   ym8700c = qg721c0[1];       for (vk1872=0; vk1872<qgdb09f; vk1872=vk1872+1) begin           cme5c87[vk1872] = suff972[ym8700c];       rv38061  = ^(ym8700c & qg721c0[0]);       ym8700c =  {ym8700c, rv38061};       end   end
endmodule