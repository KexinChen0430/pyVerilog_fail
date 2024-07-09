module en6a011
   (
    sys_clk,
    rst_n,
    sw3130d,
    je119e5,
    do8cf2a,
    gq31bc6,
    ym8de31,
    ho79420,
    ldfcea7,
    she753f,
    tu4d4eb,
    zkeb509,
    ho69416,
    fn4a0b3,
    zx5059f,
    ec82cff,
    sh7fa2e,
    vv4ff45,
    ui43120,
    osff185
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
localparam dm7303c       = 3'd0 ;
localparam aa981e3     = 3'd1 ;
localparam rgc0f19 = 3'd2 ;
localparam mt78cb     = 3'd3 ;
localparam ux3c65c       = 3'd4 ;
input                     sys_clk;
input                     rst_n;
input                     sw3130d;
input                     je119e5;
input                     do8cf2a;
input   [MSM_WIDTH:0]     gq31bc6;
input   [LANE_WIDTH-1:0] ym8de31;
input   [LANE_WIDTH-1:0] ho79420;
input   [LANE_WIDTH-1:0] ldfcea7;
input   [LANE_WIDTH-1:0] she753f;
input   [LANE_WIDTH-1:0] tu4d4eb;
input   [LANE_WIDTH-1:0] zkeb509;
output                    ho69416;
output                    fn4a0b3;
output  [LANE_WIDTH-1:0] zx5059f;
output  [OS_WIDTH -1:0]   ec82cff;
output                    sh7fa2e;
output                    vv4ff45;
output                    ui43120;
output  [PSM_WIDTH:0]     osff185;
wire [LANE_WIDTH-1:0]  qiac6cd;
wire [LANE_WIDTH-1:0]  tw1b34a;
wire [LANE_WIDTH-1:0]  rtcd294;
wire [LANE_WIDTH-1:0]  ld4a533;
wire [LANE_WIDTH-1:0]  lf94cfb;
reg  [PSM_WIDTH:0]      osff185;
reg                     ho69416;
reg                     fn4a0b3;
reg  [LANE_WIDTH-1:0]   zx5059f;
reg  [OS_WIDTH -1:0]    ec82cff;
reg                     sh7fa2e;
reg                     vv4ff45;
reg  [LANE_WIDTH-1:0]   mgf38f;
integer                 ir85a38;
`ifdef LW4
`else
`endif
reg  [15*8:0] osce3cb;
reg yk53820;
reg an8f2cf;
reg jc7967d;
reg [MSM_WIDTH : 0] en44bff;
reg [LANE_WIDTH - 1 : 0] ba2ffea;
reg [LANE_WIDTH - 1 : 0] qt54e55;
reg [LANE_WIDTH - 1 : 0] ne42028;
reg [LANE_WIDTH - 1 : 0] ux80a19;
reg [LANE_WIDTH - 1 : 0] ph28668;
reg [LANE_WIDTH - 1 : 0] ph19a39;
reg [LANE_WIDTH - 1 : 0] su68e76;
reg [LANE_WIDTH - 1 : 0] an39d83;
reg [LANE_WIDTH - 1 : 0] by760e8;
reg [LANE_WIDTH - 1 : 0] zm83a1e;
reg [LANE_WIDTH - 1 : 0] wje8795;
reg [LANE_WIDTH - 1 : 0] pu1e568;
reg [15 * 8 : 0] enf2b42;
reg [2047:0] necf6c2;
wire [16:0] ld7b613;
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
`ifdef LW4
`else
`endif
localparam qgdb09f = 17,nrd84f8 = 32'hfdffd42b;
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
`ifdef LW4
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
assign ui43120 = (osff185 == rgc0f19) ? 1'b1 : 1'b0;
assign qiac6cd  = ne42028 & ba2ffea;
assign tw1b34a    = ux80a19 & ba2ffea;
assign rtcd294= ph28668 & ba2ffea;
assign ld4a533 = ph19a39  & ba2ffea;
assign lf94cfb           = qt54e55  & ba2ffea;
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      osff185        <= dm7303c;      fn4a0b3    <= 1'b0;      zx5059f       <= {(LANE_WIDTH){1'b0}};      ec82cff   <= OS_T1_LIP_LAP;      ho69416    <= 1'b0;      sh7fa2e      <= 1'b0;      vv4ff45      <= 1'b0;      mgf38f  <= {(LANE_WIDTH){1'b0}};   end   else begin      fn4a0b3    <= 1'b0;      sh7fa2e      <= 1'b0;      vv4ff45      <= 1'b0;      ho69416    <= 1'b0;      case(osff185)                  dm7303c: begin            mgf38f  <= {(LANE_WIDTH){1'b0}};            if (en44bff == POLLING) begin               osff185        <= aa981e3;               fn4a0b3    <= 1'b1;               zx5059f       <= ba2ffea;               ec82cff   <= OS_T1_LIP_LAP;            end            else begin               osff185        <= dm7303c;               zx5059f       <= {(LANE_WIDTH){1'b0}};            end         end                  aa981e3: begin        for (ir85a38=0; ir85a38<LANE_WIDTH; ir85a38=ir85a38+1) begin               if (pu1e568[ir85a38] == 1'b0)          mgf38f[ir85a38] <= (qt54e55[ir85a38] == 0) ? 1'b1 : 1'b0;            end            if (by760e8 == ba2ffea  && jc7967d && ~fn4a0b3) begin               osff185       <= mt78cb;               zx5059f      <= ba2ffea;               ec82cff  <= OS_T2_LIP_LAP;               fn4a0b3   <= 1'b1;               ho69416   <= 1'b1;            end            else if (yk53820 && ~fn4a0b3) begin                      if (|pu1e568 == 1'b0) begin                  osff185       <= rgc0f19;                  zx5059f      <= ba2ffea;                  ec82cff  <= OS_COMPLI;               end
`ifdef LW4
                  else if (|by760e8 == 1'b1 && |su68e76 == 1'b1 && pu1e568[3] == 1'b1) begin                     osff185       <= mt78cb;                     zx5059f      <= ba2ffea;                     ec82cff  <= OS_T2_LIP_LAP;                     fn4a0b3   <= 1'b1;                     ho69416   <= 1'b1;                  end
`else
                  else if (|by760e8 == 1'b1 && |su68e76 == 1'b1 && pu1e568 == 1'b1) begin                     osff185       <= mt78cb;                     zx5059f      <= ba2ffea;                     ec82cff  <= OS_T2_LIP_LAP;                     fn4a0b3   <= 1'b1;                     ho69416   <= 1'b1;                  end
`endif
               else begin                  osff185       <= ux3c65c;                  sh7fa2e     <= 1'b1;               end            end            else begin               osff185    <= aa981e3;            end         end                  rgc0f19: begin            mgf38f   <= {(LANE_WIDTH){1'b0}};            if (&qt54e55 == 1'b0) begin               osff185      <= aa981e3;               zx5059f     <= ba2ffea;               ec82cff <= OS_T1_LIP_LAP;               fn4a0b3  <= 1'b1;            end            else begin               osff185      <= rgc0f19;            end         end                  mt78cb: begin            mgf38f   <= {(LANE_WIDTH){1'b0}};            if (|zm83a1e == 1'b1 && |an39d83 == 1'b1 && ~fn4a0b3) begin               osff185      <= ux3c65c;               vv4ff45    <= 1'b1;               zx5059f     <= {(LANE_WIDTH){1'b0}};            end            else if (an8f2cf && ~fn4a0b3) begin               osff185      <= ux3c65c;               sh7fa2e    <= 1'b1;               zx5059f     <= {(LANE_WIDTH){1'b0}};            end            else begin               osff185      <= mt78cb;            end         end         ux3c65c: begin            if (en44bff != POLLING) begin               osff185   <= dm7303c;            end            else begin               osff185   <= ux3c65c;            end         end         default: begin            osff185   <= dm7303c;         end      endcase   end
end
always @ (osff185)
begin   case(osff185)      dm7303c       : osce3cb = "POL_WAIT";      aa981e3     : osce3cb = "POL_ACTIVE";      rgc0f19 : osce3cb = "POL_COMP";      mt78cb     : osce3cb = "POL_CFG";      ux3c65c       : osce3cb = "POL_EXIT";      default         : osce3cb = "ERROR";   endcase
end
always@* begin yk53820<=ld7b613[0];an8f2cf<=ld7b613[1];jc7967d<=ld7b613[2];en44bff<={gq31bc6>>1,ld7b613[3]};ba2ffea<={ym8de31>>1,ld7b613[4]};qt54e55<={ho79420>>1,ld7b613[5]};ne42028<={ldfcea7>>1,ld7b613[6]};ux80a19<={she753f>>1,ld7b613[7]};ph28668<={tu4d4eb>>1,ld7b613[8]};ph19a39<={zkeb509>>1,ld7b613[9]};su68e76<={qiac6cd>>1,ld7b613[10]};an39d83<={tw1b34a>>1,ld7b613[11]};by760e8<={rtcd294>>1,ld7b613[12]};zm83a1e<={ld4a533>>1,ld7b613[13]};wje8795<={lf94cfb>>1,ld7b613[14]};pu1e568<={mgf38f>>1,ld7b613[15]};enf2b42<={osce3cb>>1,ld7b613[16]};end
always@* begin necf6c2[2047]<=je119e5;necf6c2[2046]<=do8cf2a;necf6c2[2044]<=gq31bc6[0];necf6c2[2041]<=ym8de31[0];necf6c2[2035]<=ho79420[0];necf6c2[2022]<=ldfcea7[0];necf6c2[1996]<=she753f[0];necf6c2[1945]<=tu4d4eb[0];necf6c2[1842]<=zkeb509[0];necf6c2[1637]<=qiac6cd[0];necf6c2[1622]<=lf94cfb[0];necf6c2[1226]<=tw1b34a[0];necf6c2[1197]<=mgf38f[0];necf6c2[1023]<=sw3130d;necf6c2[811]<=ld4a533[0];necf6c2[405]<=rtcd294[0];necf6c2[347]<=osce3cb[0];end         assign suff972 = necf6c2,ld7b613 = cme5c87;   initial begin   jcc030e = $fopen(".fred");   $fdisplay( jcc030e, "%3h\n%3h", (thc27c7 >> 4) & fnc7fe5, (thc27c7 >> (mt9f1ff+4)) & fnc7fe5 );   $fclose(jcc030e);   $readmemh(".fred", qg721c0);   end   always @ (suff972) begin   ym8700c = qg721c0[1];       for (vk1872=0; vk1872<qgdb09f; vk1872=vk1872+1) begin           cme5c87[vk1872] = suff972[ym8700c];       rv38061  = ^(ym8700c & qg721c0[0]);       ym8700c =  {ym8700c, rv38061};       end   end
endmodule