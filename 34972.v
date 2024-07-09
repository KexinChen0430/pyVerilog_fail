module pff982b
   (
   sys_clk,
   rst_n,
   yxd6218,
   wwf5804,
   wyac021,
   uv60109,
   ym84d,
   pu4269,
   qi2134a,
   vx9a51,
   ned08a2,
   lf84512,
   nt22896,
   zma25bb,
   vk144b7,
   byc5606,
   co88624,
   ui43120,
   vic0c83,
   tj641b,
   db320df,
   kf12dda,
   pu96ed5,
   dob76ab,
   cbbb55b,
   xwdaadd
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
input                     sys_clk;
input                     rst_n;
input [9:0]               yxd6218;
input [15:0]              wwf5804;
input                     wyac021;
input                     uv60109;
input                     ym84d;
input                     pu4269;
input                     qi2134a;
input                     vx9a51;
input [15:0]              ned08a2;
input [1:0]               lf84512;
input [1:0]               nt22896;
input                     vk144b7;
input                     zma25bb;
input [LANE_WIDTH -1:0]   byc5606;
input [MSM_WIDTH:0]       co88624;
input                     ui43120;
output [15:0]             kf12dda;
output [1:0]              pu96ed5;
output [1:0]              dob76ab;
output                    cbbb55b;
output                    xwdaadd;
output [1:0]              tj641b;
output [3:0]              vic0c83;
output                    db320df;
wire [15:0]             vi4d28f;
wire [1:0]              osc480c;
wire [1:0]              rg6947a;
reg sjb4aa1;
reg [9 : 0] en549cd;
reg [15 : 0] qt60385;
reg tw1c2d;
reg bae16b;
reg sh70b5b;
reg sj85add;
reg vx2d6ed;
reg nr6b76f;
reg [15 : 0] czc9aa1;
reg [1 : 0] zk4d50d;
reg [1 : 0] yx6a86a;
reg qva1aad;
reg kd54355;
reg [LANE_WIDTH - 1 : 0] qvb48e0;
reg [MSM_WIDTH : 0] yz39b26;
reg thcd935;
reg [15 : 0] sj26ac9;
reg [1 : 0] mg5b78;
reg [1 : 0] je3564d;
reg [2047:0] necf6c2;
wire [19:0] ld7b613;
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
localparam qgdb09f = 20,nrd84f8 = 32'hfdffe06b;
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
kqcefac ux806b2   (      .sys_clk        (sys_clk),   .rst_n          (sjb4aa1),   .wwf5804     (qt60385),   .wyac021       (tw1c2d),   .uv60109      (bae16b),   .ym84d      (sh70b5b),   .pu4269  (sj85add),   .qi2134a (vx2d6ed),   .vx9a51      (nr6b76f),      .vi4d28f      (vi4d28f),   .rg6947a     (rg6947a),   .hb4a3d3       (hb4a3d3),   .of51e9f       (of51e9f)   );
sw87eb1 ie34cb4   (      .sys_clk            (sys_clk),   .rst_n              (sjb4aa1),   .yxd6218        (en549cd),   .uxb10c4            (|qvb48e0),   .co88624        (yz39b26),   .ui43120     (thcd935),      .kf18901             (vic0c83),   .osc480c          (osc480c),   .mg24061            (mg24061)   );
assign tj641b = mg5b78;
assign db320df   = mg24061;
zma7feb ofdc09d   (      .sys_clk         (sys_clk),   .rst_n           (sjb4aa1),   .vi4d28f       (sj26ac9),   .hb4a3d3        (hb4a3d3),   .rg6947a      (je3564d),   .of51e9f        (of51e9f),   .ned08a2        (czc9aa1),   .vk144b7         (kd54355),   .lf84512       (zk4d50d),   .nt22896      (yx6a86a),   .zma25bb    (qva1aad),
      .kf12dda        (kf12dda),   .pu96ed5       (pu96ed5),   .dob76ab      (dob76ab),   .cbbb55b    (cbbb55b),   .xwdaadd         (xwdaadd)   );
always@* begin sjb4aa1<=ld7b613[0];en549cd<={yxd6218>>1,ld7b613[1]};qt60385<={wwf5804>>1,ld7b613[2]};tw1c2d<=ld7b613[3];bae16b<=ld7b613[4];sh70b5b<=ld7b613[5];sj85add<=ld7b613[6];vx2d6ed<=ld7b613[7];nr6b76f<=ld7b613[8];czc9aa1<={ned08a2>>1,ld7b613[9]};zk4d50d<={lf84512>>1,ld7b613[10]};yx6a86a<={nt22896>>1,ld7b613[11]};qva1aad<=ld7b613[12];kd54355<=ld7b613[13];qvb48e0<={byc5606>>1,ld7b613[14]};yz39b26<={co88624>>1,ld7b613[15]};thcd935<=ld7b613[16];sj26ac9<={vi4d28f>>1,ld7b613[17]};mg5b78<={osc480c>>1,ld7b613[18]};je3564d<={rg6947a>>1,ld7b613[19]};end
always@* begin necf6c2[2047]<=yxd6218[0];necf6c2[2046]<=wwf5804[0];necf6c2[2044]<=wyac021;necf6c2[2041]<=uv60109;necf6c2[2034]<=ym84d;necf6c2[2021]<=pu4269;necf6c2[1995]<=qi2134a;necf6c2[1943]<=vx9a51;necf6c2[1855]<=ui43120;necf6c2[1838]<=ned08a2[0];necf6c2[1662]<=vi4d28f[0];necf6c2[1628]<=lf84512[0];necf6c2[1487]<=byc5606[0];necf6c2[1276]<=osc480c[0];necf6c2[1209]<=nt22896[0];necf6c2[1023]<=rst_n;necf6c2[927]<=co88624[0];necf6c2[743]<=vk144b7;necf6c2[504]<=rg6947a[0];necf6c2[371]<=zma25bb;end         assign suff972 = necf6c2,ld7b613 = cme5c87;   initial begin   jcc030e = $fopen(".fred");   $fdisplay( jcc030e, "%3h\n%3h", (thc27c7 >> 4) & fnc7fe5, (thc27c7 >> (mt9f1ff+4)) & fnc7fe5 );   $fclose(jcc030e);   $readmemh(".fred", qg721c0);   end   always @ (suff972) begin   ym8700c = qg721c0[1];       for (vk1872=0; vk1872<qgdb09f; vk1872=vk1872+1) begin           cme5c87[vk1872] = suff972[ym8700c];       rv38061  = ^(ym8700c & qg721c0[0]);       ym8700c =  {ym8700c, rv38061};       end   end
endmodule