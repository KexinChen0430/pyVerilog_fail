module kq591c4
   (
    sys_clk,
    rst_n,
    gq31bc6,
    ng89868,
    qi21ef8,
    shc6261,
    ho79420,
    bn22886,
    gbf8072,
    zkc0394,
    tw1ca2,
    bae513,
    qg7289b,
    zz944d8,
    fca26c7,
    hd1363a,
    ph9b1d6
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
localparam bye178a   = 3'd0 ;
localparam dobc53  = 3'd1 ;
localparam en5e29a = 3'd2 ;
localparam tuf14d4  = 3'd4 ;
localparam wl8a6a2  = 3'd5 ;
localparam cm53515   = 3'd6 ;
input                     sys_clk;
input                     rst_n;
input   [MSM_WIDTH:0]     gq31bc6;
input                     ng89868;
input                     qi21ef8;
input   [LANE_WIDTH-1:0]  shc6261;
input   [LANE_WIDTH-1:0]  ho79420;
input   [LANE_WIDTH-1:0]  bn22886;
input   [LANE_WIDTH-1:0]  gbf8072;
output                    zkc0394;
output                    tw1ca2;
output  [LANE_WIDTH-1:0]  bae513;
output  [LANE_WIDTH-1:0]  qg7289b;
output  [OS_WIDTH -1:0]   zz944d8;
output                    fca26c7;
output                    hd1363a;
output  [LBSM_WIDTH:0]    ph9b1d6;
reg  [LBSM_WIDTH:0]     ph9b1d6;
reg  [LANE_WIDTH-1:0]   bae513;
reg                     fca26c7;
reg                     hd1363a;
reg  [LANE_WIDTH-1:0]   qg7289b;
reg  [OS_WIDTH -1:0]    zz944d8;
reg  [LANE_WIDTH-1:0]   bn8baf3;
reg                     zkc0394;
reg                     tw1ca2;
reg [MSM_WIDTH : 0] en44bff;
reg xy9c101;
reg zxf3736;
reg [LANE_WIDTH - 1 : 0] uiea704;
reg [LANE_WIDTH - 1 : 0] qt54e55;
reg [LANE_WIDTH - 1 : 0] ne631a7;
reg [LANE_WIDTH - 1 : 0] ipe78b7;
reg [LANE_WIDTH - 1 : 0] qte2dec;
reg [2047:0] necf6c2;
wire [7:0] ld7b613;
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
localparam qgdb09f = 8,nrd84f8 = 32'hfdffd14b;
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
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      ph9b1d6      <= bye178a;      qg7289b     <= {(LANE_WIDTH){1'b0}};      zz944d8 <= OS_T1;      fca26c7  <= 1'b0;      hd1363a    <= 1'b0;      bae513   <= {(LANE_WIDTH){1'b0}};      bn8baf3     <= {(LANE_WIDTH){1'b0}};      zkc0394  <= 1'b0;      tw1ca2  <= 1'b0;   end   else begin      fca26c7  <= 1'b0;      hd1363a    <= 1'b0;      case(ph9b1d6)                  bye178a: begin            zkc0394 <= 1'b0;            if (en44bff == LOOPBACK) begin               zz944d8   <= OS_T1;               fca26c7    <= 1'b1;                              if (|uiea704) begin                  ph9b1d6     <= dobc53;                  qg7289b    <= uiea704;                  tw1ca2 <= 1'b0;                  bn8baf3    <= uiea704;               end                              else begin                  ph9b1d6     <= en5e29a;                  qg7289b    <= {(LANE_WIDTH){1'b0}};                  tw1ca2 <= 1'b1;                  bn8baf3    <= 0;               end            end            else begin               bn8baf3    <= 0;               tw1ca2 <= 1'b0;               ph9b1d6     <= bye178a;            end         end                  dobc53: begin            if ((ipe78b7 & qte2dec) == qte2dec && ~fca26c7) begin               ph9b1d6     <= en5e29a;               qg7289b    <= {(LANE_WIDTH){1'b0}};            end            else if (zxf3736 && ~fca26c7) begin               ph9b1d6     <= tuf14d4;               qg7289b    <= {(LANE_WIDTH){1'b1}};               zz944d8<= OS_EIDLE;               fca26c7 <= 1'b1;            end            else begin               ph9b1d6     <= dobc53;            end         end                  en5e29a: begin            if (|qte2dec == 1'b1 && |uiea704 == 1'b0 && ~fca26c7) begin               ph9b1d6     <= tuf14d4;               qg7289b    <= {(LANE_WIDTH){1'b1}};               zz944d8<= OS_EIDLE;               fca26c7 <= 1'b1;               zkc0394 <= 1'b0;            end            else if (|qte2dec == 1'b0 && (|ne631a7 == 1'b1 || |qt54e55 == 1'b1) && ~fca26c7) begin               ph9b1d6     <= wl8a6a2;               qg7289b    <= {(LANE_WIDTH){1'b0}};               fca26c7 <= 1'b1;               tw1ca2 <= 1'b0;            end            else begin               ph9b1d6     <= en5e29a;               zkc0394 <= (qte2dec) ? 1'b1 : 1'b0;            end         end                  tuf14d4: begin            ph9b1d6     <= wl8a6a2;         end                  wl8a6a2: begin            qg7289b    <= {(LANE_WIDTH){1'b0}};            if (xy9c101 && ~fca26c7) begin               ph9b1d6     <= cm53515;               hd1363a   <= 1'b1;               bae513  <= {(LANE_WIDTH){1'b0}};            end            else begin               ph9b1d6     <= wl8a6a2;               bae513  <= {(LANE_WIDTH){1'b1}};            end         end                  cm53515: begin            if (en44bff != LOOPBACK) begin               ph9b1d6   <= bye178a;            end            else begin               ph9b1d6   <= cm53515;            end         end         default: begin            ph9b1d6   <= bye178a;         end      endcase   end
end
always@* begin en44bff<={gq31bc6>>1,ld7b613[0]};xy9c101<=ld7b613[1];zxf3736<=ld7b613[2];uiea704<={shc6261>>1,ld7b613[3]};qt54e55<={ho79420>>1,ld7b613[4]};ne631a7<={bn22886>>1,ld7b613[5]};ipe78b7<={gbf8072>>1,ld7b613[6]};qte2dec<={bn8baf3>>1,ld7b613[7]};end
always@* begin necf6c2[2047]<=ng89868;necf6c2[2046]<=qi21ef8;necf6c2[2044]<=shc6261[0];necf6c2[2040]<=ho79420[0];necf6c2[2033]<=bn22886[0];necf6c2[2019]<=gbf8072[0];necf6c2[1990]<=bn8baf3[0];necf6c2[1023]<=gq31bc6[0];end         assign suff972 = necf6c2,ld7b613 = cme5c87;   initial begin   jcc030e = $fopen(".fred");   $fdisplay( jcc030e, "%3h\n%3h", (thc27c7 >> 4) & fnc7fe5, (thc27c7 >> (mt9f1ff+4)) & fnc7fe5 );   $fclose(jcc030e);   $readmemh(".fred", qg721c0);   end   always @ (suff972) begin   ym8700c = qg721c0[1];       for (vk1872=0; vk1872<qgdb09f; vk1872=vk1872+1) begin           cme5c87[vk1872] = suff972[ym8700c];       rv38061  = ^(ym8700c & qg721c0[0]);       ym8700c =  {ym8700c, rv38061};       end   end
endmodule