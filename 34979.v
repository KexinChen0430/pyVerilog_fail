module zmad548
   (
    sys_clk,
    rst_n,
    coa90ef,
    gq31bc6,
    ui43bca,
    gd1de50,
    icef284,
    ho79420,
    hoca102,
    pf50813,
    bn8409e,
    je204f6,
    ym8de31,
    fp13d9d
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
localparam byf4e11     = 3'd0 ;
localparam lsa708b    = 3'd1 ;
localparam db3845a   = 3'd2 ;
localparam dzc22d6  = 3'd3 ;
localparam do116b7 = 3'd4 ;
localparam nt8b5bb   = 3'd5 ;
localparam ld5addf  = 3'd6 ;
localparam czd6eff     = 3'd7 ;
input                    sys_clk;
input                    rst_n;
input                    coa90ef;
input   [MSM_WIDTH:0]    gq31bc6;
input                    ui43bca;
input   [LANE_WIDTH-1:0] gd1de50;
input   [LANE_WIDTH-1:0] icef284;
input   [LANE_WIDTH-1:0] ho79420;
output  [LANE_WIDTH-1:0] hoca102;
output  [LANE_WIDTH-1:0] pf50813;
output                   bn8409e;
output                   je204f6;
output  [LANE_WIDTH-1:0] ym8de31;
output  [DSM_WIDTH:0]    fp13d9d;
reg [DSM_WIDTH:0]      fp13d9d;
reg [4:0]              jcd50f1;
reg [LANE_WIDTH-1:0]   hoca102;
reg [LANE_WIDTH-1:0]   pf50813;
reg                    bn8409e;
reg                    je204f6;
reg [LANE_WIDTH-1:0]   ym8de31;
reg  [15*8:0] ir12f3f;
reg ym979fd;
reg [MSM_WIDTH : 0] en44bff;
reg ls3fa4d;
reg [LANE_WIDTH - 1 : 0] nre9354;
reg [LANE_WIDTH - 1 : 0] tu4d539;
reg [LANE_WIDTH - 1 : 0] qt54e55;
reg [4 : 0] hqa72ac;
reg [15 * 8 : 0] wl39562;
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
localparam qgdb09f = 8,nrd84f8 = 32'hfdffe44b;
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
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      fp13d9d     <= byf4e11;      hoca102  <= {(LANE_WIDTH){1'b1}};      bn8409e <= 1'b0;      pf50813  <= {(LANE_WIDTH){1'b0}};      ym8de31     <= {(LANE_WIDTH){1'b0}};      je204f6   <= 1'b0;   end   else begin      bn8409e <= 1'b0;      pf50813  <= {(LANE_WIDTH){1'b0}};      je204f6   <= 1'b0;      case(fp13d9d)                  byf4e11: begin            if (en44bff == DETECT) begin               fp13d9d    <= lsa708b;               hoca102 <= {(LANE_WIDTH){1'b1}};               bn8409e<= 1'b1;               ym8de31    <= {(LANE_WIDTH){1'b0}};            end            else begin               fp13d9d    <= byf4e11;                           end         end                  lsa708b: begin    if ((ls3fa4d == 1'b1 || ((&qt54e55 == 1'b0) & ~ym979fd)) && ~bn8409e) begin                           fp13d9d    <= db3845a;               pf50813 <= {(LANE_WIDTH){1'b1}};            end            else begin               fp13d9d    <= lsa708b;            end         end                  db3845a: begin            if (hqa72ac == 5'd15) begin               fp13d9d    <= dzc22d6;               pf50813 <= {(LANE_WIDTH){1'b0}};            end            else begin               fp13d9d    <= db3845a;               pf50813 <= {(LANE_WIDTH){1'b1}};            end         end                  dzc22d6: begin            if (nre9354 =={(LANE_WIDTH){1'b1}}) begin               ym8de31  <= tu4d539;               case(tu4d539)                  {(LANE_WIDTH){1'b1}} :  begin                       fp13d9d    <= czd6eff;                     je204f6  <= 1'b1;                     hoca102 <= {(LANE_WIDTH){1'b0}};                  end                  {(LANE_WIDTH){1'b0}} :  begin                       fp13d9d    <= lsa708b;                     bn8409e<= 1'b1;                  end                  default: begin                                       fp13d9d    <= do116b7;                     bn8409e<= 1'b1;                  end               endcase            end            else begin               fp13d9d   <= dzc22d6;            end         end                  do116b7: begin            if (ls3fa4d == 1'b1 && ~bn8409e) begin               fp13d9d    <= nt8b5bb;               pf50813 <= {(LANE_WIDTH){1'b1}};            end            else begin               fp13d9d    <= do116b7;            end         end                  nt8b5bb: begin            if (hqa72ac == 5'd15) begin               fp13d9d    <= ld5addf;               pf50813 <= {(LANE_WIDTH){1'b0}};            end            else begin               fp13d9d    <= nt8b5bb;               pf50813 <= {(LANE_WIDTH){1'b1}};            end         end                  ld5addf: begin            if (nre9354 =={(LANE_WIDTH){1'b1}}) begin               if (tu4d539 == ym8de31) begin                  fp13d9d    <= czd6eff;                  je204f6  <= 1'b1;                  hoca102 <= ~ym8de31;               end               else begin                  fp13d9d    <= lsa708b;                  bn8409e<= 1'b1;               end            end            else begin               fp13d9d       <= ld5addf;            end         end         czd6eff: begin            if (en44bff != DETECT) begin               fp13d9d    <= byf4e11;            end            else begin               fp13d9d    <= czd6eff;            end         end         default: begin            fp13d9d   <= byf4e11;         end      endcase   end
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n)      jcd50f1 <= 5'd0;   else if ((fp13d9d ==db3845a) || (fp13d9d ==nt8b5bb))      jcd50f1 <= hqa72ac + 5'd1;   else      jcd50f1 <= 5'd0;
end
always @ (fp13d9d)
begin   case(fp13d9d)      byf4e11     : ir12f3f = "DET_WAIT";      lsa708b    : ir12f3f = "DET_Q";      db3845a   : ir12f3f = "DET_GODET1";      dzc22d6  : ir12f3f = "DET_ACTIVE1";      do116b7 : ir12f3f = "DET_WAIT12MS";      nt8b5bb   : ir12f3f = "DET_GODET2";      ld5addf  : ir12f3f = "DET_ACTIVE2";      czd6eff     : ir12f3f = "DET_EXIT";      default      : ir12f3f = "ERROR";   endcase
end
always@* begin ym979fd<=ld7b613[0];en44bff<={gq31bc6>>1,ld7b613[1]};ls3fa4d<=ld7b613[2];nre9354<={gd1de50>>1,ld7b613[3]};tu4d539<={icef284>>1,ld7b613[4]};qt54e55<={ho79420>>1,ld7b613[5]};hqa72ac<={jcd50f1>>1,ld7b613[6]};wl39562<={ir12f3f>>1,ld7b613[7]};end
always@* begin necf6c2[2047]<=gq31bc6[0];necf6c2[2046]<=ui43bca;necf6c2[2044]<=gd1de50[0];necf6c2[2040]<=icef284[0];necf6c2[2033]<=ho79420[0];necf6c2[2019]<=jcd50f1[0];necf6c2[1991]<=ir12f3f[0];necf6c2[1023]<=coa90ef;end         assign suff972 = necf6c2,ld7b613 = cme5c87;   initial begin   jcc030e = $fopen(".fred");   $fdisplay( jcc030e, "%3h\n%3h", (thc27c7 >> 4) & fnc7fe5, (thc27c7 >> (mt9f1ff+4)) & fnc7fe5 );   $fclose(jcc030e);   $readmemh(".fred", qg721c0);   end   always @ (suff972) begin   ym8700c = qg721c0[1];       for (vk1872=0; vk1872<qgdb09f; vk1872=vk1872+1) begin           cme5c87[vk1872] = suff972[ym8700c];       rv38061  = ^(ym8700c & qg721c0[0]);       ym8700c =  {ym8700c, rv38061};       end   end
endmodule