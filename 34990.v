module vi47247
   (
    sys_clk,
    rst_n,
    tu48ee4,
    fa47723,
    sw3b91b,
    nt28a64,
    xj45326,
    ep23623,
    xy1b11c,
    rtd88e2,
    suc4716,
    qv238b0,
    vx1c585,
    ene2c2f,
    db1617d,
    jrb0bee,
    yz85f77,
    pu2fbbd,
    os7ddeb,
    bn2d5a3,
    ip6ad1f,
    god4257,
    oha1d64,
    db320df,
    tw25b12,
    zma25bb,
    nt22896,
    ned08a2,
    lf84512,
    vk144b7,
    mr4bf3a,
    byc5606,
    ldfcea7,
    she753f,
    pu2f3d1,
    ym5e7a,
    hqa7f10,
    cb26d0e,
    mt36875
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
`ifdef SIMULATE
parameter rib700e   = 10'd6 ;
`else
parameter rib700e   = 10'd1023 ;
`endif
localparam xwc039a = 2 ;
localparam do1cd2 = 3'd0 ;
localparam doe693  = 3'd1 ;
localparam ho7349b  = 3'd2 ;
localparam ir9a4db= 3'd3 ;
localparam bld26dc  = 3'd4 ;
localparam ri936e6 = 1 ;
localparam rv9b732 = 2'd0 ;
localparam sudb996  = 2'd1 ;
localparam gbdccb1  = 2'd2 ;
localparam lde658c = 0 ;
localparam db32c66 = 1'd0 ;
localparam xy96336  = 1'd1 ;
localparam mtb19b2 = 1 ;
localparam vk8cd95 = 2'd0 ;
localparam vi66cab  = 2'd1 ;
localparam ir3655b  = 2'd2 ;
localparam pub2add = 1 ;
localparam qv956ea = 2'd0 ;
localparam mtab755  = 2'd1 ;
localparam of5baac  = 2'd2 ;
localparam bldd565      = 8'hFC ;
localparam ykeab2f        = bldd565 ;
localparam swacbce   = {ykeab2f,ykeab2f} ;
localparam rg79c22  = 2'b11;
`ifdef LTSSM_MACO
`else
localparam mece113 = 16 ;
localparam cz70899 = 4 ;
localparam vx844cd = LANE_WIDTH ;
`endif
input                       sys_clk;
input                       rst_n;
input   [7:0]               tu48ee4;
input   [3:0]               fa47723 ;
input   [LANE_WIDTH-1:0]    sw3b91b;
input                       nt28a64;
input   [7:0]               xj45326;
input                       ep23623;
input                       xy1b11c;
input   [LANE_WIDTH-1:0]    rtd88e2;
input   [OS_WIDTH-1:0]      suc4716;
input                       qv238b0;
input   [3:0]               vx1c585;
input   [3:0]               ene2c2f;
input                       db1617d;
input                       jrb0bee;
input                       yz85f77;
input   [3:0]               pu2fbbd;
input                       os7ddeb;
input                       bn2d5a3;
input                       ip6ad1f;
input                       god4257;
input   [31:0]              oha1d64;
input                       db320df;
input                       tw25b12;
output [LANE_WIDTH-1:0]     zma25bb;
output [2*LANE_WIDTH-1:0]   nt22896;
output [16*LANE_WIDTH-1:0]  ned08a2;
output [2*LANE_WIDTH-1:0]   lf84512;
output [LANE_WIDTH-1:0]     vk144b7;
output                      mr4bf3a;
output                      byc5606;
output                      ldfcea7;
output                      she753f;
output                      ym5e7a;
output                      hqa7f10;
output                      pu2f3d1;
output [8*LANE_WIDTH-1:0]   cb26d0e;
output [8*LANE_WIDTH-1:0]   mt36875;
wire [7:0]                 vka2996;
wire [7:0]                 hq14cb3;
wire [7:0]                 mga659a;
wire [7:0]                 lf32cd0;
wire [7:0]                 je96686;
wire [16*LANE_WIDTH-1:0]  ux9a191;
wire [2*LANE_WIDTH-1:0]   pu86462;
wire [16*LANE_WIDTH-1:0]  hd9189f;
wire [2*LANE_WIDTH-1:0]   ea627f2;
wire [2*LANE_WIDTH-1:0]   gd9fc87;
wire [16*LANE_WIDTH-1:0]  ipf21eb;
wire [2*LANE_WIDTH-1:0]   gq87aec;
reg [7:0]                  zz3d760;
reg [7:0]                  viebb06;
reg [7:0]                  lq5d833;
reg [7:0]                  zxec19a;
reg                        sh60cd7;
reg                        hd66bc;
reg                        kf335e7;
reg                        gd9af3d;
reg [7:0]                  pfd79ed;
reg [7:0]                  cobcf6f;
reg [7:0]                  yxe7b79;
reg [7:0]                  hd3dbcd;
reg                        mrede6f;
reg                        of6f37c;
reg                        dm79be4;
reg                        hbcdf23;
reg [xwc039a:0]         ho7c8fd;
reg [63:0]                 lqe47eb;
reg [7:0]                  gd23f5b;
reg                        qi1fadd;
reg [2:0]                  qtfd6e9;
reg                        byeb74c;
reg                        en5ba62;
reg                        zxdd315;
reg                        lde98af;
reg                        ea4c57e;
reg                        kq62bf0;
reg                        wy15f81;
reg                        fpafc08;
reg [ri936e6:0]         wwf023f;
reg [15:0]                 vx811f8;
reg [1:0]                  oh8fc6;
reg [lde658c:0]         hq3f1aa;
reg [15:0]                 mrf8d53;
reg [1:0]                  alc6a9d;
reg [mtb19b2:0]         jraa762;
reg [15:0]                 os53b16;
reg [1:0]                  uk9d8b1;
reg                        thec588;
reg [pub2add:0]         bn16239;
reg [pub2add:0]         mg88e74;
reg [pub2add:0]         oh39d0b;
reg [pub2add:0]         pf742e8;
reg [15:0]                 qva1746;
reg [15:0]                 twba35;
reg [15:0]                 by5d1aa;
reg [15:0]                 ale8d53;
reg [1:0]                  ui46a9c;
reg [1:0]                  fc354e0;
reg [1:0]                  phaa702;
reg [1:0]                  kq53816;
reg [1:0]                  pu9c0b1;
reg [1:0]                  goe058b;
reg [1:0]                  sj2c59;
reg [1:0]                  rv162cc;
reg [4:0]                  qvb1666;
reg [16*LANE_WIDTH-1:0]    ned08a2;
reg [2*LANE_WIDTH-1:0]     lf84512;
reg [2*LANE_WIDTH-1:0]     nt22896;
reg [LANE_WIDTH-1:0]       vk144b7;
reg                        aa2b2ba;
reg                        ui595d0;
reg                        vicae81;
reg                        rg5740a;
reg                        rvba052;
reg                        jp61d90;
reg                        ph814bb;
reg                        qia5de;
reg                        ho52ef1;
reg [9:0]                  qi9778b;
reg [4:0]                  irbbc58;
reg [4:0]                  osde2c4;
reg [4:0]                  vif1620;
reg [4:0]                  nt8b102;
reg                        jc58817;
reg                        goc40ba;
reg                        xy205d0;
reg                        yz2e83;
reg                        mt1741c;
reg                        dbba0e4;
reg                        fad0727;
reg [LANE_WIDTH -1:0]      lf1c9da;
reg [7:0]                  xwe4ed6 ;
reg [7:0]                  vx276b2 ;
reg [7:0]                  co3b596 ;
reg [7:0]                  xwdacb1 ;
`ifdef LTSSM_MACO
reg [1:0]                  uvd658b ;
reg [1:0]                  ngb2c5c ;
`else
reg [cz70899 -1:0]      uvd658b ;
reg [cz70899 -1:0]      ngb2c5c ;
`endif
reg                        kq563c2 ;
wire [LANE_WIDTH -1:0]     zma25bb ;
parameter coa632e = 2'd0;
parameter gq31970 = 2'd1;
parameter zm8cb81 = 2'd2;
parameter cz65c0b = 2'd3;
`ifdef PCIE_GTEQ_X8   //For More than or equal to 8 lanes
`else
`endif
`ifdef PCIE_GTEQ_X8   //For More than or equal to 8 lanes
`endif
`ifdef LW4
`endif
`ifdef LW2
`endif
`ifdef LW1
`endif
`ifdef LTSSM_MACO
`else
`endif
reg [7 : 0] gq2e05c;
reg [3 : 0] sh702e0;
reg [LANE_WIDTH - 1 : 0] rib826;
reg aa870bc;
reg [7 : 0] hd385e1;
reg fc4c88;
reg ux26443;
reg [LANE_WIDTH - 1 : 0] hd910e7;
reg [OS_WIDTH - 1 : 0] cm439f8;
reg tj1cfc0;
reg [3 : 0] kde7e06;
reg [3 : 0] xy3f035;
reg kdf81ab;
reg fac0d5c;
reg vx6ae3;
reg [3 : 0] ng3571e;
reg anab8f2;
reg dz4f5ae;
reg qtd6bbc;
reg tw1e54f;
reg [31 : 0] kdf2a7a;
reg cb953d4;
reg icef2ab;
reg [7 : 0] nr4f528;
reg [7 : 0] kd7a947;
reg [7 : 0] ead4a3c;
reg [7 : 0] rva51e0;
reg [7 : 0] db28f07;
reg [16 * LANE_WIDTH - 1 : 0] yz3c1f2;
reg [2 * LANE_WIDTH - 1 : 0] kf7ca0;
reg [16 * LANE_WIDTH - 1 : 0] yxf2821;
reg [2 * LANE_WIDTH - 1 : 0] zza0867;
reg [2 * LANE_WIDTH - 1 : 0] uk219f2;
reg [16 * LANE_WIDTH - 1 : 0] kq67c87;
reg [2 * LANE_WIDTH - 1 : 0] czf21c9;
reg [7 : 0] ux90e4d;
reg [7 : 0] mg8726c;
reg [7 : 0] yz39361;
reg [7 : 0] ofc9b0c;
reg rg4d865;
reg ps6c32b;
reg rt6195b;
reg zzcade;
reg [7 : 0] cz656f7;
reg [7 : 0] ks2b7bd;
reg [7 : 0] yx5bde8;
reg [7 : 0] aydef45;
reg shf7a29;
reg ngbd14c;
reg ene8a62;
reg dz45314;
reg [xwc039a : 0] ui4c534;
reg [63 : 0] ic629a0;
reg [7 : 0] hq14d01;
reg mga680a;
reg [2 : 0] mg34051;
reg tja0288;
reg ri1447;
reg gqa23a;
reg gb511d1;
reg ie88e8d;
reg vi47469;
reg ri3a34b;
reg med1a5b;
reg [ri936e6 : 0] fa696c0;
reg [15 : 0] of4b603;
reg [1 : 0] sh5b01d;
reg [lde658c : 0] psc0767;
reg [15 : 0] tj3b3a;
reg [1 : 0] yz1d9d6;
reg [mtb19b2 : 0] me675a6;
reg [15 : 0] je3ad30;
reg [1 : 0] yxd6982;
reg yzb4c15;
reg [pub2add : 0] je30568;
reg [pub2add : 0] ou15a10;
reg [pub2add : 0] ea68403;
reg [pub2add : 0] sw100cb;
reg [15 : 0] cb80659;
reg [15 : 0] tj32cc;
reg [15 : 0] db19667;
reg [15 : 0] oscb33f;
reg [1 : 0] qg599f9;
reg [1 : 0] mrccfc8;
reg [1 : 0] ay67e45;
reg [1 : 0] vk3f229;
reg [1 : 0] vvf914b;
reg [1 : 0] rtc8a5e;
reg [1 : 0] rt452f7;
reg [1 : 0] ir297be;
reg [4 : 0] mr4bdf5;
reg yx5efac;
reg czf7d65;
reg qvbeb2c;
reg ayf5964;
reg coacb21;
reg dz6431c;
reg kf2c844;
reg zx64224;
reg mg21127;
reg [9 : 0] oh8939;
reg [4 : 0] sh449cd;
reg [4 : 0] sw24e6d;
reg [4 : 0] hd27368;
reg [4 : 0] wl39b46;
reg dzcda35;
reg go6d1af;
reg ui68d79;
reg yk46bc8;
reg ls35e40;
reg phaf203;
reg lq7901e;
reg [LANE_WIDTH - 1 : 0] xj40796;
reg [7 : 0] fp3cb6;
reg [7 : 0] pu1e5b6;
reg [7 : 0] enf2db2;
reg [7 : 0] fc96d94;
reg ww787da;
reg [2047:0] necf6c2;
wire [117:0] ld7b613;
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
`ifdef SIMULATE
`else
`endif
`ifdef LTSSM_MACO
`else
`endif
`ifdef LTSSM_MACO
`else
`endif
`ifdef PCIE_GTEQ_X8   //For More than or equal to 8 lanes
`else
`endif
`ifdef PCIE_GTEQ_X8   //For More than or equal to 8 lanes
`endif
`ifdef LW4
`endif
`ifdef LW2
`endif
`ifdef LW1
`endif
`ifdef LTSSM_MACO
`else
`endif
localparam qgdb09f = 118,nrd84f8 = 32'hfdffd48b;
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
`ifdef SIMULATE
`else
`endif
`ifdef LTSSM_MACO
`else
`endif
`ifdef LTSSM_MACO
`else
`endif
`ifdef PCIE_GTEQ_X8   //For More than or equal to 8 lanes
`else
`endif
`ifdef PCIE_GTEQ_X8   //For More than or equal to 8 lanes
`endif
`ifdef LW4
`endif
`ifdef LW2
`endif
`ifdef LW1
`endif
`ifdef LTSSM_MACO
`else
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
`ifdef SIMULATE
`else
`endif
`ifdef LTSSM_MACO
`else
`endif
`ifdef LTSSM_MACO
`else
`endif
always @(xy3f035) begin   case (xy3f035[3:0])      4'b1000 : {xwe4ed6, vx276b2, co3b596, xwdacb1 } = {8'd0,PAD,PAD,PAD} ;      4'b0100 : {xwe4ed6, vx276b2, co3b596, xwdacb1 } = {PAD,8'd0,PAD,PAD} ;      4'b0010 : {xwe4ed6, vx276b2, co3b596, xwdacb1 } = {PAD,PAD,8'd0,PAD} ;      4'b0001 : {xwe4ed6, vx276b2, co3b596, xwdacb1 } = {PAD,PAD,PAD,8'd0} ;      4'b1100 : {xwe4ed6, vx276b2, co3b596, xwdacb1 } = {8'd0,8'd1,PAD,PAD} ;      4'b0110 : {xwe4ed6, vx276b2, co3b596, xwdacb1 } = {PAD,8'd0,8'd1,PAD} ;      4'b0011 : {xwe4ed6, vx276b2, co3b596, xwdacb1 } = {PAD,PAD,8'd0,8'd1} ;      4'b1001 : {xwe4ed6, vx276b2, co3b596, xwdacb1 } = {8'd0,PAD,PAD,8'd1} ;      4'b1111 : {xwe4ed6, vx276b2, co3b596, xwdacb1 } = {8'd0,8'd1,8'd2,8'd3} ;      default : {xwe4ed6, vx276b2, co3b596, xwdacb1 } = {8'd0,PAD,PAD,PAD} ;   endcase
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      pfd79ed       <= PAD;      cobcf6f       <= PAD;      yxe7b79       <= PAD;      hd3dbcd       <= PAD;      mrede6f <= 1'b1;      of6f37c <= 1'b1;      dm79be4 <= 1'b1;      hbcdf23 <= 1'b1;   end   else if (gqa23a) begin      pfd79ed       <= PAD;      cobcf6f       <= PAD;      yxe7b79       <= PAD;      hd3dbcd       <= PAD;      mrede6f <= 1'b1;      of6f37c <= 1'b1;      dm79be4 <= 1'b1;      hbcdf23 <= 1'b1;   end   else if (tj1cfc0) begin      pfd79ed       <= xy3f035[3] ? fp3cb6 : PAD;      cobcf6f       <= xy3f035[2] ? pu1e5b6 : PAD;      yxe7b79       <= xy3f035[1] ? enf2db2 : PAD;      hd3dbcd       <= xy3f035[0] ? fc96d94 : PAD;      mrede6f <= xy3f035[3] ? 1'b0 : 1'b1;      of6f37c <= xy3f035[2] ? 1'b0 : 1'b1;      dm79be4 <= xy3f035[1] ? 1'b0 : 1'b1;      hbcdf23 <= xy3f035[0] ? 1'b0 : 1'b1;   end
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      zz3d760      <= PAD;      viebb06      <= PAD;      lq5d833      <= PAD;      zxec19a      <= PAD;      sh60cd7 <= 1'b1;      hd66bc <= 1'b1;      kf335e7 <= 1'b1;      gd9af3d <= 1'b1;   end   else if (gqa23a) begin      zz3d760      <= PAD;      viebb06      <= PAD;      lq5d833      <= PAD;      zxec19a      <= PAD;      sh60cd7 <= 1'b1;      hd66bc <= 1'b1;      kf335e7 <= 1'b1;      gd9af3d <= 1'b1;   end   else if (tj1cfc0) begin      if (icef2ab) begin      zz3d760 <= (kde7e06[3]) ? gq2e05c : PAD;      viebb06 <= (kde7e06[2]) ? gq2e05c : PAD;      lq5d833 <= (kde7e06[1]) ? gq2e05c : PAD;      zxec19a <= (kde7e06[0]) ? gq2e05c : PAD;      end   else begin      zz3d760 <= (kde7e06[3]) ? kdf2a7a[31:24] : PAD;      viebb06 <= (kde7e06[2]) ? kdf2a7a[23:16] : PAD;      lq5d833 <= (kde7e06[1]) ? kdf2a7a[15:8] : PAD;      zxec19a <= (kde7e06[0]) ? kdf2a7a[7:0] : PAD;   end         sh60cd7 <= (kde7e06[3]) ? 1'b0 : 1'b1;      hd66bc <= (kde7e06[2]) ? 1'b0 : 1'b1;      kf335e7 <= (kde7e06[1]) ? 1'b0 : 1'b1;      gd9af3d <= (kde7e06[0]) ? 1'b0 : 1'b1;   end
end
assign vka2996 = {4'b0000, kdf81ab, ng3571e[3], vx6ae3, fac0d5c};
assign hq14cb3 = {4'b0000, kdf81ab, ng3571e[2], vx6ae3, fac0d5c};
assign mga659a = {4'b0000, kdf81ab, ng3571e[1], vx6ae3, fac0d5c};
assign lf32cd0 = {4'b0000, kdf81ab, ng3571e[0], vx6ae3, fac0d5c};
assign je96686 = hd385e1;
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      ho7c8fd   <= do1cd2;      lqe47eb    <= 64'd0;      gd23f5b   <= 8'd0;      qi1fadd     <= 1'b0;      xy205d0 <= 1'b0;      qtfd6e9   <= 3'd0;   end   else begin      qi1fadd     <= 1'b0;      xy205d0 <= 1'b0;      case(ui4c534)         do1cd2: begin            if (tja0288) begin               ho7c8fd  <= doe693;            end            else begin               ho7c8fd  <= do1cd2;            end            lqe47eb   <= {K28_5,ux90e4d, K28_5,mg8726c, K28_5,yz39361, K28_5,ofc9b0c};            gd23f5b  <= {1'b1,rg4d865, 1'b1,ps6c32b, 1'b1,rt6195b, 1'b1,zzcade};            qtfd6e9  <= 3'd0;         end         doe693: begin            ho7c8fd  <= ho7349b;            lqe47eb   <= {cz656f7,db28f07, ks2b7bd,db28f07, yx5bde8,db28f07, aydef45,db28f07};            gd23f5b  <= {shf7a29,1'b0, ngbd14c,1'b0, ene8a62,1'b0, dz45314,1'b0};         end         ho7349b: begin            ho7c8fd  <= ir9a4db;            lqe47eb   <= {8'h02,nr4f528, 8'h02,kd7a947, 8'h02,ead4a3c, 8'h02,rva51e0};            gd23f5b  <= {2'b00, 2'b00, 2'b00, 2'b00};         end         ir9a4db: begin            qi1fadd    <= (mg34051 >= 4) ? 1'b1 : 1'b0;            lqe47eb   <= (ri1447) ? {D10_2,D10_2,D10_2,D10_2,D10_2,D10_2,D10_2,D10_2} :                                    {D5_2,D5_2,D5_2,D5_2,D5_2,D5_2,D5_2,D5_2};            gd23f5b  <= {2'b00, 2'b00, 2'b00, 2'b00};            qtfd6e9  <= mg34051 + 1;            if (mg34051 >= 4) begin               ho7c8fd  <= (go6d1af) ? bld26dc : do1cd2;               xy205d0<= (go6d1af) ? 1'b1 : 1'b0;            end            else begin               ho7c8fd  <= ir9a4db;            end         end         bld26dc: begin            ho7c8fd  <= (dzcda35) ? do1cd2 : bld26dc;         end         default: begin            ho7c8fd  <= do1cd2;            qtfd6e9  <= 3'd0;         end      endcase   end
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      wwf023f   <= rv9b732;      vx811f8    <= 16'd0;      oh8fc6   <= 2'd0;      yz2e83 <= 1'b0;   end   else begin      yz2e83 <= 1'b0;      case(fa696c0)         rv9b732: begin            if (cm439f8 == OS_EIDLE) begin               wwf023f <= sudb996;            end            else begin               wwf023f <= rv9b732;            end            vx811f8  <= {K28_5, IDL};            oh8fc6 <= {1'b1  , 1'b1};         end         sudb996: begin            wwf023f   <= (go6d1af) ? gbdccb1 : rv9b732;            yz2e83 <= (go6d1af) ? 1'b1: 1'b0;            vx811f8    <= {IDL, IDL};            oh8fc6   <= {1'b1  , 1'b1};         end         gbdccb1: begin            wwf023f   <= (dzcda35 == 1'b1) ? rv9b732 : gbdccb1;         end         default: begin            wwf023f <= rv9b732;         end      endcase   end
end
assign byc5606 = (vi47469) ? yzb4c15 : dzcda35;
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      goc40ba    <= 1'b0;   end   else if (byc5606) begin      goc40ba    <= 1'b0;   end   else if (cb953d4 && (|hd910e7 == 1'b1) &&                            (cm439f8 != OS_COMPLI) && (anab8f2 == 1'b0)) begin      goc40ba    <= 1'b1;   end
end
assign mr4bf3a = dzcda35;
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      hq3f1aa     <= db32c66;      mrf8d53      <= 16'd0;      alc6a9d     <= 2'd0;      jc58817       <= 1'b0;      fad0727   <= 1'b0;      dbba0e4  <= 1'b0;   end   else begin                  fad0727  <= gb511d1;      dbba0e4 <= gb511d1 & !lq7901e;      case(psc0767)         db32c66: begin                        if ((ui68d79) || (yk46bc8) || (ls35e40) || phaf203) begin               hq3f1aa <= xy96336;               mrf8d53  <= {K28_5, SKP};               alc6a9d <= {1'b1  , 1'b1};               jc58817   <= 1'b1;            end            else begin               hq3f1aa <= db32c66;               jc58817   <= 1'b0;            end         end         xy96336: begin            hq3f1aa <= db32c66;            mrf8d53  <= {SKP, SKP};            alc6a9d <= {1'b1  , 1'b1};            jc58817   <= 1'b1;         end         default: begin            hq3f1aa <= db32c66;         end      endcase   end
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      jraa762   <= vk8cd95;      os53b16    <= 16'd0;      uk9d8b1   <= 2'd0;      mt1741c <= 1'b0;      thec588 <= 1'b0;   end   else begin      mt1741c <= 1'b0;      thec588 <= 1'b0;      case(me675a6)         vk8cd95: begin            if (vi47469) begin               jraa762 <= vi66cab;            end            else begin               jraa762 <= vk8cd95;            end            os53b16  <= {K28_5, FTS};            uk9d8b1 <= {1'b1  , 1'b1};         end         vi66cab: begin                        if (fc4c88 == 1'b1) begin               jraa762   <= vk8cd95;               mt1741c <= 1'b0;            end                        else if (ux26443) begin               jraa762   <= vi66cab;               mt1741c <= 1'b1;            end                        else if (go6d1af) begin               jraa762   <= ir3655b;               mt1741c <= 1'b1;            end            else begin              jraa762   <= vk8cd95;              mt1741c <= 1'b0;            end            os53b16    <= {FTS, FTS};            uk9d8b1   <= {1'b1  , 1'b1};         end         ir3655b: begin            jraa762   <= (dzcda35 == 1'b1) ? vk8cd95 : ir3655b;            thec588 <= 1'b1;         end         default: begin            jraa762 <= vk8cd95;         end      endcase   end
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      bn16239     <= qv956ea;      mg88e74     <= qv956ea;      oh39d0b     <= qv956ea;      pf742e8     <= qv956ea;      qva1746      <= 15'd0;      twba35      <= 15'd0;      by5d1aa      <= 15'd0;      ale8d53      <= 15'd0;      ui46a9c     <= 2'd0;      fc354e0     <= 2'd0;      phaa702     <= 2'd0;      kq53816     <= 2'd0;      pu9c0b1    <= 2'd0;      goe058b    <= 2'd0;      sj2c59    <= 2'd0;      rv162cc    <= 2'd0;
`ifdef PCIE_GTEQ_X8   //For More than or equal to 8 lanes
         qvb1666  <= 5'd0;
`else
         qvb1666  <= 5'b11111;
`endif
   end   else begin
`ifdef PCIE_GTEQ_X8   //For More than or equal to 8 lanes
         qvb1666 <=  mr4bdf5 + 1;
`endif
      case (je30568)         qv956ea: begin            bn16239  <= mtab755;            qva1746   <= {K28_5, D21_5};            ui46a9c  <= {1'b1  , 1'b0};            pu9c0b1 <= {1'b1  , 1'b0};         end         mtab755: begin            qva1746    <= {K28_5, D10_2};            ui46a9c   <= {1'b1  , 1'b0};            pu9c0b1  <= {1'b0  , 1'b0};            if (mr4bdf5 == (coa632e*4) || mr4bdf5 == (coa632e*4+3))               bn16239 <= of5baac;            else               bn16239 <= qv956ea;         end         of5baac: begin            bn16239   <= qv956ea;            qva1746    <= {K28_5, K28_5};            ui46a9c   <= {1'b1  , 1'b1};            pu9c0b1  <= {1'b0  , 1'b0};         end         default: begin            bn16239 <= qv956ea;         end      endcase      case (ou15a10)         qv956ea: begin            mg88e74  <= mtab755;            twba35   <= {K28_5, D21_5};            fc354e0  <= {1'b1  , 1'b0};            goe058b <= {1'b1  , 1'b0};         end         mtab755: begin            twba35    <= {K28_5, D10_2};            fc354e0   <= {1'b1  , 1'b0};            goe058b  <= {1'b0  , 1'b0};            if (mr4bdf5 == (gq31970*4) || mr4bdf5 == (gq31970*4+3))               mg88e74 <= of5baac;            else               mg88e74 <= qv956ea;         end         of5baac: begin            mg88e74   <= qv956ea;            twba35    <= {K28_5, K28_5};            fc354e0   <= {1'b1  , 1'b1};            goe058b  <= {1'b0  , 1'b0};         end         default: begin            mg88e74 <= qv956ea;         end      endcase      case (ea68403)         qv956ea: begin            oh39d0b  <= mtab755;            by5d1aa   <= {K28_5, D21_5};            phaa702  <= {1'b1  , 1'b0};            sj2c59 <= {1'b1  , 1'b0};         end         mtab755: begin            by5d1aa    <= {K28_5, D10_2};            phaa702   <= {1'b1  , 1'b0};            sj2c59  <= {1'b0  , 1'b0};            if (mr4bdf5 == (zm8cb81*4) || mr4bdf5 == (zm8cb81*4+3))               oh39d0b <= of5baac;            else               oh39d0b <= qv956ea;         end         of5baac: begin            oh39d0b   <= qv956ea;            by5d1aa    <= {K28_5, K28_5};            phaa702   <= {1'b1  , 1'b1};            sj2c59  <= {1'b0  , 1'b0};         end         default: begin            oh39d0b <= qv956ea;         end      endcase      case (sw100cb)         qv956ea: begin            pf742e8  <= mtab755;            ale8d53   <= {K28_5, D21_5};            kq53816  <= {1'b1  , 1'b0};            rv162cc <= {1'b1  , 1'b0};         end         mtab755: begin            ale8d53    <= {K28_5, D10_2};            kq53816   <= {1'b1  , 1'b0};            rv162cc  <= {1'b0  , 1'b0};            if (mr4bdf5 == (cz65c0b*4) || mr4bdf5 == (cz65c0b*4+3))               pf742e8 <= of5baac;            else               pf742e8 <= qv956ea;         end         of5baac: begin            pf742e8   <= qv956ea;            ale8d53    <= {K28_5, K28_5};            kq53816   <= {1'b1  , 1'b1};            rv162cc  <= {1'b0  , 1'b0};         end         default: begin            pf742e8 <= qv956ea;         end      endcase   end
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      byeb74c    <= 1'b0;      en5ba62    <= 1'b0;      zxdd315   <= 1'b0;      lde98af  <= 1'b0;      ea4c57e <= 1'b0;      kq62bf0   <= 1'b0;      fpafc08    <= 1'b0;   end   else if (|hd910e7) begin      byeb74c    <= 1'b0;      zxdd315   <= 1'b0;      lde98af  <= 1'b0;      ea4c57e <= 1'b0;      kq62bf0   <= 1'b0;      fpafc08    <= 1'b0;      case(cm439f8)         OS_T1_LIP_LAP: begin            byeb74c    <= 1'b1;            en5ba62    <= (ui4c534 == do1cd2) ? 1'b1 : ri1447;            zxdd315   <= 1'b1;         end         OS_T2_LIP_LAP: begin            byeb74c    <= 1'b1;            en5ba62    <= (ui4c534 == do1cd2) ? 1'b0 : ri1447;            zxdd315   <= 1'b1;         end         OS_COMPLI: begin            fpafc08    <= 1'b1;         end         OS_T1: begin            byeb74c    <= 1'b1;            en5ba62    <= (ui4c534 == do1cd2) ? 1'b1 : ri1447;         end         OS_T2: begin            byeb74c    <= 1'b1;            en5ba62    <= (ui4c534 == do1cd2) ? 1'b0 : ri1447;         end         OS_IDLE: begin            lde98af  <= (ui4c534 == do1cd2) ? 1'b1 : gb511d1;         end         OS_EIDLE: begin            ea4c57e <= 1'b1;         end         OS_NFTS: begin            kq62bf0   <= 1'b1;         end         OS_BEACON: begin            wy15f81   <= 1'b1;         end         default : begin            byeb74c    <= 1'b0;            zxdd315   <= 1'b0;            lde98af  <= 1'b0;            ea4c57e <= 1'b0;            kq62bf0   <= 1'b0;            fpafc08    <= 1'b0;         end      endcase   end   else begin      byeb74c    <= 1'b0;      en5ba62    <= 1'b0;      zxdd315   <= 1'b0;      lde98af  <= 1'b0;      ea4c57e <= 1'b0;      kq62bf0   <= 1'b0;      wy15f81   <= 1'b0;      fpafc08    <= 1'b0;   end
end
`ifdef LW4
   assign ux9a191   = ic629a0;   assign pu86462  = hq14d01;   assign hd9189f   = {cb80659,tj32cc, db19667, oscb33f};   assign ea627f2  = {qg599f9, mrccfc8, ay67e45, vk3f229};   assign gd9fc87 = {vvf914b, rtc8a5e, rt452f7, ir297be} ;   assign ipf21eb  = {swacbce,swacbce,swacbce,swacbce};   assign gq87aec = {rg79c22,rg79c22,rg79c22,rg79c22};   assign cb26d0e    = {ux90e4d, mg8726c, yz39361, ofc9b0c};   assign mt36875    = {cz656f7, ks2b7bd, yx5bde8, aydef45};
`endif
`ifdef LW2
   assign ux9a191   = ic629a0[63:32];   assign pu86462  = hq14d01[7:4];   assign hd9189f   = {cb80659,tj32cc};   assign ea627f2  = {qg599f9, mrccfc8};   assign gd9fc87 = {vvf914b, rtc8a5e};   assign ipf21eb  = {swacbce,swacbce};   assign gq87aec = {rg79c22,rg79c22};   assign cb26d0e    = {ux90e4d, mg8726c};   assign mt36875    = {cz656f7, ks2b7bd};
`endif
`ifdef LW1
   assign ux9a191   = ic629a0[63:48];   assign pu86462  = hq14d01[7:6];   assign hd9189f   = cb80659;   assign ea627f2  = qg599f9;   assign gd9fc87 = vvf914b;   assign ipf21eb  = swacbce;   assign gq87aec = rg79c22;   assign cb26d0e    = ux90e4d;   assign mt36875    = cz656f7;
`endif
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n)      lf1c9da <= {LANE_WIDTH{1'b0}};   else      lf1c9da <= hd910e7;
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      ned08a2  <= {16*LANE_WIDTH{1'b0}};      lf84512 <= {2*LANE_WIDTH{1'b0}};      nt22896<= {2*LANE_WIDTH{1'b0}};      vk144b7   <= {LANE_WIDTH{1'b0}};   end      else if (dzcda35) begin      ned08a2   <= {LANE_WIDTH{tj3b3a}};      lf84512  <= {LANE_WIDTH{yz1d9d6}};      nt22896 <= {2*LANE_WIDTH{1'b0}};      vk144b7    <= 4'b1111;   end   else begin      vk144b7    <= xj40796;      casex({tja0288, ie88e8d, vi47469, med1a5b, gb511d1,ri3a34b})         6'b1xxxxx: begin            ned08a2   <= yz3c1f2;            lf84512  <= kf7ca0;            nt22896 <= {2*LANE_WIDTH{1'b0}};         end         6'bx1xxxx: begin            ned08a2   <= {LANE_WIDTH{of4b603}} ;            lf84512  <= {LANE_WIDTH{sh5b01d}} ;            nt22896 <= {2*LANE_WIDTH{1'b0}};         end         6'bxx1xxx: begin            ned08a2   <= {LANE_WIDTH{je3ad30}};            lf84512  <= {LANE_WIDTH{yxd6982}};            nt22896 <= {2*LANE_WIDTH{1'b0}};         end           6'bxxx1xx: begin            ned08a2   <= yxf2821;            lf84512  <= zza0867;            nt22896 <= uk219f2;         end          6'bxxxx1x: begin            ned08a2  <= {16*LANE_WIDTH{1'b0}};            lf84512 <= {2*LANE_WIDTH{1'b0}};            nt22896<= {2*LANE_WIDTH{1'b0}};         end         6'bxxxxx1: begin            ned08a2   <= kq67c87;            lf84512  <= czf21c9;            nt22896<= {2*LANE_WIDTH{1'b0}};         end      endcase   end
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      jp61d90      <= 1'b0;      ph814bb       <= 1'b0;      qia5de       <= 1'b0;      ho52ef1     <= 1'b0;      qi9778b    <= 10'd0;      irbbc58    <= 5'd0;      osde2c4     <= 5'd0;      vif1620     <= 5'd0;      nt8b102 <= 5'd0;   end   else begin            if (aa870bc) begin         jp61d90  <= 1'b0;         ph814bb   <= 1'b0;         qia5de   <= 1'b0;         ho52ef1 <= 1'b0;      end      else begin         jp61d90  <= (dz4f5ae|qtd6bbc)   ? 1'b1 : dz6431c;         ph814bb   <= (dz4f5ae)   ? 1'b1 : kf2c844;         qia5de   <= (qtd6bbc)   ? 1'b1 : zx64224;         ho52ef1 <= (tw1e54f) ? 1'b1 : mg21127;      end            if (dz6431c == 1'b0) begin         qi9778b <= 10'd0;      end            else if (tja0288 && ri1447 && gqa23a && mga680a && oh8939 < rib700e) begin         qi9778b <= oh8939 + 1;      end      else begin         qi9778b <= oh8939;      end            if (zx64224 == 1'b0) begin         irbbc58 <= 5'd0;      end            else if (tja0288 && !ri1447 && gqa23a && mga680a && (sh449cd[4] == 1'b0)) begin         irbbc58 <= sh449cd + 1;      end      else begin         irbbc58 <= sh449cd;      end            if (zx64224 == 1'b0) begin         osde2c4 <= 5'd0;      end            else if (tja0288 && !ri1447 && mga680a && (sw24e6d[4] == 1'b0)) begin         osde2c4 <= sw24e6d + 1;      end      else begin         osde2c4 <= sw24e6d;      end            if (kf2c844 == 1'b0) begin         vif1620 <= 5'd0;      end            else if (tja0288 && !ri1447 && mga680a && (hd27368[4] == 1'b0)) begin         vif1620 <= hd27368 + 1;      end      else begin         vif1620 <= hd27368;      end            if (mg21127 == 1'b0) begin         nt8b102 <= 5'd0;      end      else if (gb511d1 && wl39b46 < 15) begin         nt8b102 <= wl39b46 + 2;      end      else begin         nt8b102 <= wl39b46;      end   end
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      aa2b2ba  <= 1'b0;      ui595d0    <= 1'b0;      vicae81     <= 1'b0;      rg5740a     <= 1'b0;      rvba052 <= 1'b0;   end   else if (aa870bc) begin      aa2b2ba  <= 1'b0;      ui595d0    <= 1'b0;      vicae81     <= 1'b0;      rg5740a     <= 1'b0;      rvba052 <= 1'b0;   end   else begin            aa2b2ba  <= (oh8939    == rib700e);      ui595d0    <= (sh449cd    == 5'd16);      vicae81     <= (sw24e6d     == 5'd16);      rg5740a     <= (hd27368     == 5'd16);      rvba052 <= (wl39b46 == 5'd16);   end
end
assign ldfcea7   = (yx5efac);
assign she753f     = (czf7d65);
assign ym5e7a      = (qvbeb2c);
assign hqa7f10      = (ayf5964);
assign pu2f3d1  = (coacb21);
`ifdef LTSSM_MACO
fb_rf_phy #(2, 4) twa2f4c (                              .rst_n (rst_n),                              .clk_a (sys_clk),                              .a_a   (uvd658b),                              .d_a   (sw3b91b),                                                            .we_a  (rst_n),                              .clk_b (sys_clk),                              .a_b   (ngb2c5c),                              .d_b   (zma25bb)                              );
`else
pmi_distributed_dpram #(   .pmi_addr_depth       ( mece113 ),   .pmi_addr_width       ( cz70899 ),   .pmi_data_width       ( vx844cd ),   .pmi_regmode          ("noreg" ),   .pmi_init_file        ("none" ),   .pmi_init_file_format ("binary" ),   .pmi_family           ("EC2" ),   .module_type          ("pmi_distributed_dpram"))
   the9195 (   .WrAddress            ( uvd658b ),   .Data                 ( sw3b91b ),   .WrClock              ( sys_clk ),   .WE                   ( 1'b1 ),   .WrClockEn            ( 1'b1 ),   .RdAddress            ( ngb2c5c ),   .RdClock              ( sys_clk ),   .RdClockEn            ( kq563c2 ),   .Reset                ( ~rst_n ),   .Q                    ( zma25bb )   );
`endif
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n)      uvd658b <= 4'd0 ;   else      uvd658b <=  uvd658b + 4'd1;
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n)      kq563c2 <= 1'b0 ;   else if (uvd658b == sh702e0 - 1)      kq563c2 <=  1'b1;   else      kq563c2 <=  ww787da;
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n)      ngb2c5c <= 4'd0 ;   else if (ww787da)      ngb2c5c <= ngb2c5c + 4'd1 ;
end
always@* begin gq2e05c<={tu48ee4>>1,ld7b613[0]};sh702e0<={fa47723>>1,ld7b613[1]};rib826<={sw3b91b>>1,ld7b613[2]};aa870bc<=ld7b613[3];hd385e1<={xj45326>>1,ld7b613[4]};fc4c88<=ld7b613[5];ux26443<=ld7b613[6];hd910e7<={rtd88e2>>1,ld7b613[7]};cm439f8<={suc4716>>1,ld7b613[8]};tj1cfc0<=ld7b613[9];kde7e06<={vx1c585>>1,ld7b613[10]};xy3f035<={ene2c2f>>1,ld7b613[11]};kdf81ab<=ld7b613[12];fac0d5c<=ld7b613[13];vx6ae3<=ld7b613[14];ng3571e<={pu2fbbd>>1,ld7b613[15]};anab8f2<=ld7b613[16];dz4f5ae<=ld7b613[17];qtd6bbc<=ld7b613[18];tw1e54f<=ld7b613[19];kdf2a7a<={oha1d64>>1,ld7b613[20]};cb953d4<=ld7b613[21];icef2ab<=ld7b613[22];nr4f528<={vka2996>>1,ld7b613[23]};kd7a947<={hq14cb3>>1,ld7b613[24]};ead4a3c<={mga659a>>1,ld7b613[25]};rva51e0<={lf32cd0>>1,ld7b613[26]};db28f07<={je96686>>1,ld7b613[27]};yz3c1f2<={ux9a191>>1,ld7b613[28]};kf7ca0<={pu86462>>1,ld7b613[29]};yxf2821<={hd9189f>>1,ld7b613[30]};zza0867<={ea627f2>>1,ld7b613[31]};uk219f2<={gd9fc87>>1,ld7b613[32]};kq67c87<={ipf21eb>>1,ld7b613[33]};czf21c9<={gq87aec>>1,ld7b613[34]};ux90e4d<={zz3d760>>1,ld7b613[35]};mg8726c<={viebb06>>1,ld7b613[36]};yz39361<={lq5d833>>1,ld7b613[37]};ofc9b0c<={zxec19a>>1,ld7b613[38]};rg4d865<=ld7b613[39];ps6c32b<=ld7b613[40];rt6195b<=ld7b613[41];zzcade<=ld7b613[42];cz656f7<={pfd79ed>>1,ld7b613[43]};ks2b7bd<={cobcf6f>>1,ld7b613[44]};yx5bde8<={yxe7b79>>1,ld7b613[45]};aydef45<={hd3dbcd>>1,ld7b613[46]};shf7a29<=ld7b613[47];ngbd14c<=ld7b613[48];ene8a62<=ld7b613[49];dz45314<=ld7b613[50];ui4c534<={ho7c8fd>>1,ld7b613[51]};ic629a0<={lqe47eb>>1,ld7b613[52]};hq14d01<={gd23f5b>>1,ld7b613[53]};mga680a<=ld7b613[54];mg34051<={qtfd6e9>>1,ld7b613[55]};tja0288<=ld7b613[56];ri1447<=ld7b613[57];gqa23a<=ld7b613[58];gb511d1<=ld7b613[59];ie88e8d<=ld7b613[60];vi47469<=ld7b613[61];ri3a34b<=ld7b613[62];med1a5b<=ld7b613[63];fa696c0<={wwf023f>>1,ld7b613[64]};of4b603<={vx811f8>>1,ld7b613[65]};sh5b01d<={oh8fc6>>1,ld7b613[66]};psc0767<={hq3f1aa>>1,ld7b613[67]};tj3b3a<={mrf8d53>>1,ld7b613[68]};yz1d9d6<={alc6a9d>>1,ld7b613[69]};me675a6<={jraa762>>1,ld7b613[70]};je3ad30<={os53b16>>1,ld7b613[71]};yxd6982<={uk9d8b1>>1,ld7b613[72]};yzb4c15<=ld7b613[73];je30568<={bn16239>>1,ld7b613[74]};ou15a10<={mg88e74>>1,ld7b613[75]};ea68403<={oh39d0b>>1,ld7b613[76]};sw100cb<={pf742e8>>1,ld7b613[77]};cb80659<={qva1746>>1,ld7b613[78]};tj32cc<={twba35>>1,ld7b613[79]};db19667<={by5d1aa>>1,ld7b613[80]};oscb33f<={ale8d53>>1,ld7b613[81]};qg599f9<={ui46a9c>>1,ld7b613[82]};mrccfc8<={fc354e0>>1,ld7b613[83]};ay67e45<={phaa702>>1,ld7b613[84]};vk3f229<={kq53816>>1,ld7b613[85]};vvf914b<={pu9c0b1>>1,ld7b613[86]};rtc8a5e<={goe058b>>1,ld7b613[87]};rt452f7<={sj2c59>>1,ld7b613[88]};ir297be<={rv162cc>>1,ld7b613[89]};mr4bdf5<={qvb1666>>1,ld7b613[90]};yx5efac<=ld7b613[91];czf7d65<=ld7b613[92];qvbeb2c<=ld7b613[93];ayf5964<=ld7b613[94];coacb21<=ld7b613[95];dz6431c<=ld7b613[96];kf2c844<=ld7b613[97];zx64224<=ld7b613[98];mg21127<=ld7b613[99];oh8939<={qi9778b>>1,ld7b613[100]};sh449cd<={irbbc58>>1,ld7b613[101]};sw24e6d<={osde2c4>>1,ld7b613[102]};hd27368<={vif1620>>1,ld7b613[103]};wl39b46<={nt8b102>>1,ld7b613[104]};dzcda35<=ld7b613[105];go6d1af<=ld7b613[106];ui68d79<=ld7b613[107];yk46bc8<=ld7b613[108];ls35e40<=ld7b613[109];phaf203<=ld7b613[110];lq7901e<=ld7b613[111];xj40796<={lf1c9da>>1,ld7b613[112]};fp3cb6<={xwe4ed6>>1,ld7b613[113]};pu1e5b6<={vx276b2>>1,ld7b613[114]};enf2db2<={co3b596>>1,ld7b613[115]};fc96d94<={xwdacb1>>1,ld7b613[116]};ww787da<=ld7b613[117];end
always@* begin necf6c2[2047]<=fa47723[0];necf6c2[2046]<=sw3b91b[0];necf6c2[2044]<=nt28a64;necf6c2[2040]<=xj45326[0];necf6c2[2032]<=ep23623;necf6c2[2018]<=gd9af3d;necf6c2[2017]<=xy1b11c;necf6c2[1989]<=pfd79ed[0];necf6c2[1987]<=rtd88e2[0];necf6c2[1947]<=irbbc58[0];necf6c2[1931]<=cobcf6f[0];necf6c2[1927]<=suc4716[0];necf6c2[1893]<=dbba0e4;necf6c2[1865]<=os7ddeb;necf6c2[1859]<=ipf21eb[0];necf6c2[1847]<=osde2c4[0];necf6c2[1844]<=gd23f5b[0];necf6c2[1815]<=yxe7b79[0];necf6c2[1806]<=qv238b0;necf6c2[1779]<=qia5de;necf6c2[1772]<=xy205d0;necf6c2[1739]<=fad0727;necf6c2[1719]<=vicae81;necf6c2[1717]<=sj2c59[0];necf6c2[1682]<=bn2d5a3;necf6c2[1674]<=zxdd315;necf6c2[1671]<=gq87aec[0];necf6c2[1646]<=vif1620[0];necf6c2[1640]<=qi1fadd;necf6c2[1628]<=vx276b2[0];necf6c2[1603]<=twba35[0];necf6c2[1582]<=hd3dbcd[0];necf6c2[1565]<=vx1c585[0];necf6c2[1510]<=ho52ef1;necf6c2[1497]<=yz2e83;necf6c2[1488]<=ea627f2[0];necf6c2[1485]<=ho7c8fd[0];necf6c2[1468]<=jp61d90;necf6c2[1453]<=aa2b2ba;necf6c2[1431]<=lf1c9da[0];necf6c2[1391]<=rg5740a;necf6c2[1387]<=rv162cc[0];necf6c2[1326]<=lf32cd0[0];necf6c2[1317]<=ip6ad1f;necf6c2[1300]<=lde98af;necf6c2[1297]<=vx811f8[0];necf6c2[1295]<=zz3d760[0];necf6c2[1245]<=nt8b102[0];necf6c2[1233]<=qtfd6e9[0];necf6c2[1210]<=ux9a191[0];necf6c2[1209]<=co3b596[0];necf6c2[1189]<=vka2996[0];necf6c2[1172]<=oha1d64[0];necf6c2[1158]<=by5d1aa[0];necf6c2[1124]<=mg88e74[0];necf6c2[1116]<=mrede6f;necf6c2[1105]<=kq62bf0;necf6c2[1094]<=os53b16[0];necf6c2[1092]<=hq3f1aa[0];necf6c2[1087]<=lq5d833[0];necf6c2[1082]<=ene2c2f[0];necf6c2[1077]<=fc354e0[0];necf6c2[1023]<=tu48ee4[0];necf6c2[1009]<=kf335e7;necf6c2[973]<=qi9778b[0];necf6c2[946]<=mt1741c;necf6c2[932]<=pu2fbbd[0];necf6c2[929]<=gd9fc87[0];necf6c2[922]<=lqe47eb[0];necf6c2[889]<=ph814bb;necf6c2[886]<=goc40ba;necf6c2[859]<=ui595d0;necf6c2[858]<=goe058b[0];necf6c2[837]<=en5ba62;necf6c2[814]<=xwe4ed6[0];necf6c2[801]<=qva1746[0];necf6c2[744]<=hd9189f[0];necf6c2[742]<=hbcdf23;necf6c2[740]<=kq563c2;necf6c2[734]<=rvba052;necf6c2[726]<=qvb1666[0];necf6c2[663]<=mga659a[0];necf6c2[648]<=wwf023f[0];necf6c2[605]<=je96686[0];necf6c2[594]<=tw25b12;necf6c2[586]<=god4257;necf6c2[562]<=bn16239[0];necf6c2[552]<=ea4c57e;necf6c2[547]<=jraa762[0];necf6c2[546]<=oh8fc6[0];necf6c2[543]<=viebb06[0];necf6c2[538]<=ui46a9c[0];necf6c2[504]<=hd66bc;necf6c2[466]<=yz85f77;necf6c2[443]<=jc58817;necf6c2[429]<=pu9c0b1[0];necf6c2[418]<=byeb74c;necf6c2[400]<=pf742e8[0];necf6c2[372]<=pu86462[0];necf6c2[371]<=dm79be4;necf6c2[370]<=xwdacb1[0];necf6c2[331]<=hq14cb3[0];necf6c2[324]<=fpafc08;necf6c2[297]<=db320df;necf6c2[281]<=thec588;necf6c2[273]<=alc6a9d[0];necf6c2[269]<=ale8d53[0];necf6c2[252]<=sh60cd7;necf6c2[233]<=jrb0bee;necf6c2[214]<=kq53816[0];necf6c2[200]<=oh39d0b[0];necf6c2[185]<=of6f37c;necf6c2[162]<=wy15f81;necf6c2[140]<=uk9d8b1[0];necf6c2[136]<=mrf8d53[0];necf6c2[126]<=zxec19a[0];necf6c2[116]<=db1617d;necf6c2[107]<=phaa702[0];end         assign suff972 = necf6c2,ld7b613 = cme5c87;   initial begin   jcc030e = $fopen(".fred");   $fdisplay( jcc030e, "%3h\n%3h", (thc27c7 >> 4) & fnc7fe5, (thc27c7 >> (mt9f1ff+4)) & fnc7fe5 );   $fclose(jcc030e);   $readmemh(".fred", qg721c0);   end   always @ (suff972) begin   ym8700c = qg721c0[1];       for (vk1872=0; vk1872<qgdb09f; vk1872=vk1872+1) begin           cme5c87[vk1872] = suff972[ym8700c];       rv38061  = ^(ym8700c & qg721c0[0]);       ym8700c =  {ym8700c, rv38061};       end   end
endmodule