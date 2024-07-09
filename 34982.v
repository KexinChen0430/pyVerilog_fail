module ohdf18
   (
    sys_clk,
    rst_n,
    fne316a,
    gq31bc6,
    kdf2093,
    bn2d5a3,
    ip6ad1f,
    bn22886,
    qvb47e9,
    wya3f4c,
    ou1fa61,
    alfd309,
    fne984c,
    ic4c266,
    th61330,
    tj9987,
    ea4cc3f,
    ps661f9,
    hq30fca,
    gq87e53,
    xy3f298,
    ldf94c3,
    neca61e,
    ic530f3,
    uk98798,
    wjc3cc1,
    vk1e60c,
    blf3062
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
localparam eae09a1    = 3'd0 ;
localparam xy4d08      = 3'd1 ;
localparam ir26843    = 3'd2 ;
localparam gq3421d    = 3'd3 ;
localparam wla10e8 = 3'd4 ;
localparam qv8745 = 3'd5 ;
localparam cm43a2c    = 3'd6 ;
input                     sys_clk;
input                     rst_n;
input                     fne316a;
input   [MSM_WIDTH:0]     gq31bc6;
input   [LANE_WIDTH-1:0]  kdf2093;
input   [LANE_WIDTH-1:0]  bn2d5a3;
input   [LANE_WIDTH-1:0]  ip6ad1f;
input   [LANE_WIDTH-1:0]  bn22886;
input   [LANE_WIDTH-1:0]  qvb47e9;
input                     wya3f4c;
input                     ou1fa61;
input                     alfd309;
input                     fne984c;
input                     ic4c266;
input                     th61330;
input                     tj9987;
input                     ps661f9;
input                     ea4cc3f;
output                    hq30fca;
output  [LANE_WIDTH-1:0]  gq87e53;
output  [OS_WIDTH -1:0]   xy3f298;
output                    ldf94c3;
output                    neca61e;
output                    ic530f3;
output                    uk98798;
output                    wjc3cc1;
output  [LANE_WIDTH-1:0]  vk1e60c;
output  [L0SM_WIDTH:0]    blf3062;
wire [LANE_WIDTH-1:0]   jp61d90;
wire                    ay77844;
wire                    ps76432;
wire                    twb2193;
reg                     hq30fca;
reg                     je864dc;
reg  [L0SM_WIDTH:0]     blf3062;
reg  [LANE_WIDTH-1:0]   gq87e53;
reg  [OS_WIDTH -1:0]    xy3f298;
reg                     ldf94c3;
reg                     neca61e;
reg                     ic530f3;
reg                     uk98798;
reg                     wjc3cc1;
reg  [LANE_WIDTH-1:0]   vk1e60c;
reg ou3b01d;
reg [MSM_WIDTH : 0] en44bff;
reg [LANE_WIDTH - 1 : 0] ose0a12;
reg [LANE_WIDTH - 1 : 0] dz4f5ae;
reg [LANE_WIDTH - 1 : 0] qtd6bbc;
reg [LANE_WIDTH - 1 : 0] ne631a7;
reg [LANE_WIDTH - 1 : 0] ecbcbe8;
reg mee5f41;
reg je2fa08;
reg su7d043;
reg she8218;
reg of410c5;
reg kf862c;
reg go43164;
reg cb18b21;
reg dmc590c;
reg [LANE_WIDTH - 1 : 0] dz6431c;
reg sj18d3a;
reg hdc738;
reg jc639c6;
reg rv1ce33;
reg [2047:0] necf6c2;
wire [20:0] ld7b613;
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
localparam qgdb09f = 21,nrd84f8 = 32'hfdffd30b;
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
assign jp61d90        = (dz4f5ae | qtd6bbc) & ose0a12;
assign ay77844      = |(ne631a7 & ose0a12);
assign twb2193 = she8218;
assign ps76432 = ((!of410c5 && !kf862c && sj18d3a == 1'b1)) ? 1'b1 : 1'b0;
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      blf3062      <= eae09a1;      gq87e53     <= {(LANE_WIDTH){1'b0}};      xy3f298 <= OS_IDLE;      ldf94c3  <= 1'b0;      neca61e  <= 1'b0;      ic530f3  <= 1'b0;      uk98798     <= 1'b0;      wjc3cc1     <= 1'b0;      vk1e60c   <= {(LANE_WIDTH){1'b0}};      hq30fca         <= 1'b0;      je864dc  <= 1'b0;   end   else begin      ldf94c3  <= 1'b0;      neca61e  <= 1'b0;      ic530f3  <= 1'b0;      uk98798     <= 1'b0;      wjc3cc1     <= 1'b0;      hq30fca         <= 1'b0;      case(blf3062)                  eae09a1: begin            gq87e53       <= {(LANE_WIDTH){1'b0}};            if (en44bff == L0) begin               blf3062     <= xy4d08;               vk1e60c  <= ~ose0a12;               hq30fca        <= 1'b1;            end            else begin               blf3062     <= eae09a1;               vk1e60c  <= {(LANE_WIDTH){1'b0}};            end         end                  xy4d08: begin                if (((|dz6431c == 1'b1) || go43164== 1'b1 || dmc590c || cb18b21|| (&ecbcbe8 == 1'b1)) && !ou3b01d) begin               blf3062      <= cm43a2c;               ldf94c3  <= 1'b1;            end                        else if (jc639c6 || hdc738) begin               case({jc639c6,hdc738})                  2'b10: begin                     blf3062      <= ir26843;	                     neca61e  <= 1'b1;                                       end                  2'b01: begin                     blf3062      <= gq3421d;                                       ic530f3  <= 1'b1;                                          hq30fca         <= 1'b1;                  end                  2'b11: begin                     blf3062      <= cm43a2c;                     neca61e  <= 1'b1;                     ic530f3  <= 1'b1;                  end               endcase            end                        else if (sj18d3a) begin               blf3062      <= cm43a2c;               uk98798     <= (of410c5) ? 1'b1 : 1'b0;               wjc3cc1     <= (kf862c) ? 1'b1 : 1'b0;               gq87e53     <= {(LANE_WIDTH){1'b1}};               xy3f298 <= OS_EIDLE;            end                        else if (of410c5 || kf862c) begin               blf3062      <= wla10e8;               gq87e53     <= {(LANE_WIDTH){1'b1}};               xy3f298 <= OS_EIDLE;            end            else begin               blf3062      <= xy4d08;               hq30fca         <= 1'b1;            end         end                           ir26843: begin            if ((|dz6431c == 1'b1) || go43164== 1'b1 || dmc590c || cb18b21|| (&ecbcbe8 == 1'b1)) begin               blf3062      <= cm43a2c;               ldf94c3  <= 1'b1;            end                        else if (su7d043 || hdc738) begin               blf3062      <= cm43a2c;               ic530f3  <= (hdc738) ? 1'b1 : 1'b0;            end                        else begin               blf3062      <= ir26843;            end         end                           gq3421d: begin            if ((|dz6431c == 1'b1) || go43164== 1'b1 || dmc590c || cb18b21|| (&ecbcbe8 == 1'b1)) begin               blf3062      <= cm43a2c;               ldf94c3  <= 1'b1;            end                        else if (je2fa08 || mee5f41 || jc639c6) begin               blf3062      <= cm43a2c;                              neca61e  <= (jc639c6 && !mee5f41) ? 1'b1 : 1'b0;              end                        else begin               blf3062      <= gq3421d;               hq30fca         <= 1'b1;            end         end                  wla10e8: begin            blf3062      <= qv8745;            je864dc  <= sj18d3a;         end                  qv8745: begin            gq87e53        <= {(LANE_WIDTH){1'b0}};            vk1e60c      <= {(LANE_WIDTH){1'b1}};            if (sj18d3a || rv1ce33) begin               blf3062      <= cm43a2c;               uk98798     <= (of410c5) ? 1'b1 : 1'b0;               wjc3cc1     <= (kf862c) ? 1'b1 : 1'b0;            end            else begin               blf3062      <= qv8745;            end         end                  cm43a2c: begin            if (en44bff != L0) begin               blf3062   <= eae09a1;               gq87e53  <= {(LANE_WIDTH){1'b0}};            end            else begin               blf3062   <= cm43a2c;            end         end         default: begin            blf3062   <= eae09a1;         end      endcase   end
end
always@* begin ou3b01d<=ld7b613[0];en44bff<={gq31bc6>>1,ld7b613[1]};ose0a12<={kdf2093>>1,ld7b613[2]};dz4f5ae<={bn2d5a3>>1,ld7b613[3]};qtd6bbc<={ip6ad1f>>1,ld7b613[4]};ne631a7<={bn22886>>1,ld7b613[5]};ecbcbe8<={qvb47e9>>1,ld7b613[6]};mee5f41<=ld7b613[7];je2fa08<=ld7b613[8];su7d043<=ld7b613[9];she8218<=ld7b613[10];of410c5<=ld7b613[11];kf862c<=ld7b613[12];go43164<=ld7b613[13];cb18b21<=ld7b613[14];dmc590c<=ld7b613[15];dz6431c<={jp61d90>>1,ld7b613[16]};sj18d3a<=ld7b613[17];hdc738<=ld7b613[18];jc639c6<=ld7b613[19];rv1ce33<=ld7b613[20];end
always@* begin necf6c2[2047]<=gq31bc6[0];necf6c2[2046]<=kdf2093[0];necf6c2[2044]<=bn2d5a3[0];necf6c2[2040]<=ip6ad1f[0];necf6c2[2032]<=bn22886[0];necf6c2[2016]<=qvb47e9[0];necf6c2[1985]<=wya3f4c;necf6c2[1922]<=ou1fa61;necf6c2[1796]<=alfd309;necf6c2[1544]<=fne984c;necf6c2[1105]<=ay77844;necf6c2[1041]<=ic4c266;necf6c2[1023]<=fne316a;necf6c2[651]<=je864dc;necf6c2[552]<=jp61d90[0];necf6c2[325]<=twb2193;necf6c2[276]<=ps661f9;necf6c2[162]<=ps76432;necf6c2[138]<=ea4cc3f;necf6c2[69]<=tj9987;necf6c2[34]<=th61330;end         assign suff972 = necf6c2,ld7b613 = cme5c87;   initial begin   jcc030e = $fopen(".fred");   $fdisplay( jcc030e, "%3h\n%3h", (thc27c7 >> 4) & fnc7fe5, (thc27c7 >> (mt9f1ff+4)) & fnc7fe5 );   $fclose(jcc030e);   $readmemh(".fred", qg721c0);   end   always @ (suff972) begin   ym8700c = qg721c0[1];       for (vk1872=0; vk1872<qgdb09f; vk1872=vk1872+1) begin           cme5c87[vk1872] = suff972[ym8700c];       rv38061  = ^(ym8700c & qg721c0[0]);       ym8700c =  {ym8700c, rv38061};       end   end
endmodule