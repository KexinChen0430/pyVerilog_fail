module tj3de81
   (
    sys_clk,
    rst_n,
    zkd03c5,
    ng89868,
    sw3130d,
    je119e5,
    do8cf2a,
    gq31bc6,
    kdf2093,
    ym5e7a,
    hqa7f10,
    pu2f3d1,
    qg431a1,
    fa7944d,
    cz6a75a,
    gda1320,
    ba20bcf,
    rgca26a,
    qt51353,
    ls89a9d,
    mgac915,
    pf648a8,
    th61a18,
    fp91fdb,
    ea4c82f,
    vxb5a9a,
    lq79e8a,
    qt6a6bb,
    su535dc,
    yz9aee0,
    dzd7705,
    ho52196,
    vxaa432,
    ri86594,
    je35486,
    bn6a90,
    oh90cb2,
    zza504f,
    ph2827f
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
localparam dmdfa85    = 3'd0 ;
localparam qtfd42b  = 3'd1 ;
localparam ayea15c = 3'd2 ;
localparam xj50ae0    = 3'd3 ;
localparam mt85706    = 3'd4 ;
input                     sys_clk;
input                     rst_n;
input                     zkd03c5;
input                     ng89868;
input                     sw3130d;
input                     je119e5;
input                     do8cf2a;
input   [MSM_WIDTH:0]     gq31bc6;
input   [LANE_WIDTH-1:0]  kdf2093;
input   [LANE_WIDTH-1:0]  ym5e7a;
input   [LANE_WIDTH-1:0]  hqa7f10;
input   [LANE_WIDTH-1:0]  pu2f3d1;
input   [LANE_WIDTH-1:0]  qg431a1;
input   [LANE_WIDTH-1:0]  fa7944d;
input   [LANE_WIDTH-1:0]  cz6a75a;
input   [LANE_WIDTH-1:0]  gda1320;
input   [LANE_WIDTH-1:0]  ba20bcf;
input   [LANE_WIDTH-1:0]  rgca26a;
input   [LANE_WIDTH-1:0]  qt51353;
input   [LANE_WIDTH-1:0]  ls89a9d;
input   [LANE_WIDTH-1:0]  mgac915;
input   [LANE_WIDTH-1:0]  pf648a8;
input   [LANE_WIDTH-1:0]  th61a18;
input   [LANE_WIDTH-1:0]  fp91fdb;
input   [LANE_WIDTH-1:0]  ea4c82f;
input                     vxb5a9a;
input   [LANE_WIDTH-1:0]  lq79e8a;
output                    qt6a6bb;
output                    su535dc;
output  [LANE_WIDTH-1:0]  yz9aee0;
output  [OS_WIDTH -1:0]   dzd7705;
output                    ho52196;
output                    vxaa432;
output                    ri86594;
output                    je35486;
output                    bn6a90;
output                    oh90cb2;
output                    zza504f;
output  [RSM_WIDTH:0]     ph2827f;
wire [LANE_WIDTH-1:0]   fn407bf;
wire [LANE_WIDTH-1:0]   ks886b5;
wire [LANE_WIDTH-1:0]   lfa501e;
wire [LANE_WIDTH-1:0]   dbb504d;
wire [LANE_WIDTH-1:0]   cz41373;
wire [LANE_WIDTH-1:0]   jp61d90;
wire [LANE_WIDTH-1:0]   dm52940;
wire [LANE_WIDTH-1:0]   gbe7792;
wire                    mg3bc94;
wire                    uide4a0;
wire                    shf2500;
wire                    ipd6214;
wire [LANE_WIDTH-1:0]   ic7d4a5;
reg  [RSM_WIDTH:0]      ph2827f;
reg                     su535dc;
reg  [LANE_WIDTH-1:0]   yz9aee0;
reg  [OS_WIDTH -1:0]    dzd7705;
reg                     ho52196;
reg                     vxaa432;
reg                     ri86594;
reg                     je35486;
reg                     bn6a90;
reg                     oh90cb2;
reg                     zza504f;
reg                     qt6a6bb;
reg                     ho5d0ef;
reg wje877b;
reg xy9c101;
reg yk53820;
reg an8f2cf;
reg jc7967d;
reg [MSM_WIDTH : 0] en44bff;
reg [LANE_WIDTH - 1 : 0] ose0a12;
reg [LANE_WIDTH - 1 : 0] dbb09f8;
reg [LANE_WIDTH - 1 : 0] tue45b1;
reg [LANE_WIDTH - 1 : 0] fp27e3f;
reg [LANE_WIDTH - 1 : 0] mt9a6fe;
reg [LANE_WIDTH - 1 : 0] zx5fe66;
reg [LANE_WIDTH - 1 : 0] vvf99b9;
reg [LANE_WIDTH - 1 : 0] aa3b4e6;
reg [LANE_WIDTH - 1 : 0] fpaac27;
reg [LANE_WIDTH - 1 : 0] ea7d7ca;
reg [LANE_WIDTH - 1 : 0] vv5f283;
reg [LANE_WIDTH - 1 : 0] lqca0f6;
reg [LANE_WIDTH - 1 : 0] zm83d9f;
reg [LANE_WIDTH - 1 : 0] pff67d3;
reg [LANE_WIDTH - 1 : 0] pu202c2;
reg [LANE_WIDTH - 1 : 0] mrd3e21;
reg [LANE_WIDTH - 1 : 0] xje62aa;
reg icc4365;
reg [LANE_WIDTH - 1 : 0] czf8ffb;
reg [LANE_WIDTH - 1 : 0] rtd25dc;
reg [LANE_WIDTH - 1 : 0] xj40aaf;
reg [LANE_WIDTH - 1 : 0] rg73497;
reg [LANE_WIDTH - 1 : 0] jrafe1e;
reg [LANE_WIDTH - 1 : 0] mrf87bd;
reg [LANE_WIDTH - 1 : 0] dz6431c;
reg [LANE_WIDTH - 1 : 0] pu11cd2;
reg [LANE_WIDTH - 1 : 0] zx6471e;
reg oh238f7;
reg fp1c7bd;
reg hbe3def;
reg tw3feee;
reg [LANE_WIDTH - 1 : 0] hof4473;
reg osefee3;
reg [2047:0] necf6c2;
wire [38:0] ld7b613;
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
localparam qgdb09f = 39,nrd84f8 = 32'hfdffe0cb;
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
assign fn407bf     = dbb09f8 & ose0a12;
assign ks886b5     = tue45b1 & ose0a12;
assign lfa501e  = fp27e3f & ose0a12;
assign dbb504d       = vvf99b9 & ose0a12;
assign cz41373        = aa3b4e6 & ose0a12;
assign gbe7792     = (ea7d7ca | vv5f283 | lqca0f6)  & ose0a12;
assign jp61d90        = (zm83d9f | pff67d3) & ose0a12;
assign dm52940      = fpaac27 & ose0a12;
assign mg3bc94    = |(pu202c2 & ose0a12);
assign uide4a0   = |(mrd3e21 & ose0a12);
assign shf2500    = (|(zx5fe66 & ose0a12) | icc4365);
assign ipd6214    = |(xje62aa & ose0a12);
assign ic7d4a5= czf8ffb & ose0a12;
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      ph2827f      <= dmdfa85;      su535dc  <= 1'b0;      yz9aee0     <= {(LANE_WIDTH){1'b0}};      dzd7705 <= OS_IDLE;      ho52196    <= 1'b0;      vxaa432   <= 1'b0;      ri86594    <= 1'b0;      je35486    <= 1'b0;      bn6a90     <= 1'b0;      oh90cb2    <= 1'b0;      zza504f  <= 1'b0;      ho5d0ef  <= 1'b0;      qt6a6bb    <= 1'b0;   end   else begin      su535dc  <= 1'b0;      ho52196    <= 1'b0;      vxaa432   <= 1'b0;      ri86594    <= 1'b0;      je35486    <= 1'b0;      bn6a90     <= 1'b0;      oh90cb2    <= 1'b0;      zza504f  <= 1'b0;      qt6a6bb    <= 1'b0;      case(ph2827f)                  dmdfa85: begin            if (en44bff == RECOVERY) begin               ph2827f      <= qtfd42b;               su535dc  <= 1'b1;               yz9aee0     <= ose0a12;               dzd7705 <= OS_T1;            end            else begin               ph2827f      <= dmdfa85;            end         end                  qtfd42b: begin            if (((wje877b == 1'b0 && jrafe1e == ose0a12) ||                 (wje877b == 1'b1 && jrafe1e == ose0a12 && jc7967d)) && ~su535dc)  begin               ph2827f      <= ayea15c;               su535dc  <= 1'b1;               yz9aee0     <= ose0a12;               dzd7705 <= OS_T2;               qt6a6bb    <= 1'b1;            end            else if (yk53820 && ~su535dc) begin               if (|dz6431c == 1'b1 || osefee3 == 1'b1) begin                  ph2827f   <= mt85706;                  yz9aee0  <= {(LANE_WIDTH){1'b0}};                  ri86594 <= 1'b1;               end               else begin                  ph2827f   <= mt85706;                  yz9aee0  <= {(LANE_WIDTH){1'b0}};                  oh90cb2 <= 1'b1;               end            end            else begin               ph2827f      <= qtfd42b;               ho5d0ef  <= (|dz6431c) ? 1'b1 : osefee3;            end         end                  ayea15c: begin            if (mrf87bd == ose0a12 && rtd25dc == ose0a12 && ~su535dc && hof4473 == ose0a12) begin               ph2827f      <= xj50ae0;               su535dc  <= 1'b1;               zza504f  <= 1'b1;               yz9aee0     <= ose0a12;               dzd7705 <= OS_IDLE;            end            else if (|zx6471e == 1'b1  && |xj40aaf == 1'b1 && ~su535dc) begin               ph2827f      <= mt85706;               yz9aee0     <= {(LANE_WIDTH){1'b0}};               ri86594    <= 1'b1;               zza504f  <= 1'b1;            end            else if (an8f2cf && ~su535dc) begin               ph2827f   <= mt85706;               yz9aee0  <= {(LANE_WIDTH){1'b0}};               oh90cb2 <= 1'b1;            end            else begin               ph2827f   <= ayea15c;            end         end                   xj50ae0: begin            casex({oh238f7, fp1c7bd, hbe3def, tw3feee})               4'b1xxx: begin                  ph2827f   <= mt85706;                  yz9aee0  <= {(LANE_WIDTH){1'b0}};                  ho52196 <= 1'b1;               end               4'bx1xx: begin                  ph2827f   <= mt85706;                  yz9aee0  <= {(LANE_WIDTH){1'b0}};                  vxaa432 <= 1'b1;               end               4'bxx1x: begin                  ph2827f   <= mt85706;                  yz9aee0  <= {(LANE_WIDTH){1'b0}};                  ri86594 <= 1'b1;               end               4'bxxx1: begin                  ph2827f   <= mt85706;                  yz9aee0  <= {(LANE_WIDTH){1'b0}};                  je35486 <= 1'b1;               end               default: begin                  if (pu11cd2 == ose0a12 && rg73497 == ose0a12 && ~su535dc) begin                     ph2827f   <= mt85706;                     yz9aee0  <= {(LANE_WIDTH){1'b0}};                     bn6a90  <= 1'b1;                  end                  else if (xy9c101 && ~su535dc) begin                     ph2827f   <= mt85706;                     yz9aee0  <= {(LANE_WIDTH){1'b0}};                     oh90cb2 <= 1'b1;                  end                  else begin                     ph2827f   <= xj50ae0;                  end               end            endcase         end                  mt85706: begin            ho5d0ef  <= 1'b0;            if (en44bff != RECOVERY) begin               ph2827f   <= dmdfa85;            end            else begin               ph2827f   <= mt85706;            end         end         default: begin            ph2827f   <= dmdfa85;         end      endcase   end
end
always@* begin wje877b<=ld7b613[0];xy9c101<=ld7b613[1];yk53820<=ld7b613[2];an8f2cf<=ld7b613[3];jc7967d<=ld7b613[4];en44bff<={gq31bc6>>1,ld7b613[5]};ose0a12<={kdf2093>>1,ld7b613[6]};dbb09f8<={ym5e7a>>1,ld7b613[7]};tue45b1<={hqa7f10>>1,ld7b613[8]};fp27e3f<={pu2f3d1>>1,ld7b613[9]};mt9a6fe<={qg431a1>>1,ld7b613[10]};zx5fe66<={fa7944d>>1,ld7b613[11]};vvf99b9<={cz6a75a>>1,ld7b613[12]};aa3b4e6<={gda1320>>1,ld7b613[13]};fpaac27<={ba20bcf>>1,ld7b613[14]};ea7d7ca<={rgca26a>>1,ld7b613[15]};vv5f283<={qt51353>>1,ld7b613[16]};lqca0f6<={ls89a9d>>1,ld7b613[17]};zm83d9f<={mgac915>>1,ld7b613[18]};pff67d3<={pf648a8>>1,ld7b613[19]};pu202c2<={th61a18>>1,ld7b613[20]};mrd3e21<={fp91fdb>>1,ld7b613[21]};xje62aa<={ea4c82f>>1,ld7b613[22]};icc4365<=ld7b613[23];czf8ffb<={lq79e8a>>1,ld7b613[24]};rtd25dc<={fn407bf>>1,ld7b613[25]};xj40aaf<={ks886b5>>1,ld7b613[26]};rg73497<={lfa501e>>1,ld7b613[27]};jrafe1e<={dbb504d>>1,ld7b613[28]};mrf87bd<={cz41373>>1,ld7b613[29]};dz6431c<={jp61d90>>1,ld7b613[30]};pu11cd2<={dm52940>>1,ld7b613[31]};zx6471e<={gbe7792>>1,ld7b613[32]};oh238f7<=ld7b613[33];fp1c7bd<=ld7b613[34];hbe3def<=ld7b613[35];tw3feee<=ld7b613[36];hof4473<={ic7d4a5>>1,ld7b613[37]};osefee3<=ld7b613[38];end
always@* begin necf6c2[2047]<=ng89868;necf6c2[2046]<=sw3130d;necf6c2[2044]<=je119e5;necf6c2[2040]<=do8cf2a;necf6c2[2033]<=gq31bc6[0];necf6c2[2024]<=fp91fdb[0];necf6c2[2018]<=kdf2093[0];necf6c2[2001]<=ea4c82f[0];necf6c2[1988]<=ym5e7a[0];necf6c2[1954]<=vxb5a9a;necf6c2[1929]<=hqa7f10[0];necf6c2[1874]<=shf2500;necf6c2[1860]<=lq79e8a[0];necf6c2[1811]<=pu2f3d1[0];necf6c2[1789]<=mgac915[0];necf6c2[1700]<=ipd6214;necf6c2[1673]<=fn407bf[0];necf6c2[1574]<=qg431a1[0];necf6c2[1530]<=pf648a8[0];necf6c2[1353]<=ic7d4a5[0];necf6c2[1299]<=ks886b5[0];necf6c2[1258]<=gbe7792[0];necf6c2[1247]<=rgca26a[0];necf6c2[1102]<=dbb504d[0];necf6c2[1101]<=fa7944d[0];necf6c2[1023]<=zkd03c5;necf6c2[1012]<=th61a18[0];necf6c2[937]<=uide4a0;necf6c2[894]<=ls89a9d[0];necf6c2[658]<=ho5d0ef;necf6c2[629]<=dm52940[0];necf6c2[623]<=ba20bcf[0];necf6c2[551]<=lfa501e[0];necf6c2[468]<=mg3bc94;necf6c2[447]<=qt51353[0];necf6c2[314]<=jp61d90[0];necf6c2[311]<=gda1320[0];necf6c2[157]<=cz41373[0];necf6c2[155]<=cz6a75a[0];end         assign suff972 = necf6c2,ld7b613 = cme5c87;   initial begin   jcc030e = $fopen(".fred");   $fdisplay( jcc030e, "%3h\n%3h", (thc27c7 >> 4) & fnc7fe5, (thc27c7 >> (mt9f1ff+4)) & fnc7fe5 );   $fclose(jcc030e);   $readmemh(".fred", qg721c0);   end   always @ (suff972) begin   ym8700c = qg721c0[1];       for (vk1872=0; vk1872<qgdb09f; vk1872=vk1872+1) begin           cme5c87[vk1872] = suff972[ym8700c];       rv38061  = ^(ym8700c & qg721c0[0]);       ym8700c =  {ym8700c, rv38061};       end   end
endmodule