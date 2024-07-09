module alc6a76
   (
    sys_clk,
    rst_n,
    gq31bc6,
    ho79420,
    wlb4422,
    twa2114,
    ng89868,
    db84510,
    bn22886,
    do14437,
    lsa21bb,
    aa10dda,
    je86ed0,
    xl37682,
    gdbb417,
    dmda0bd
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
localparam ou98450    = 3'd0 ;
localparam blc2281     = 3'd1 ;
localparam ng1140f = 3'd2 ;
localparam oh8a07b = 3'd3 ;
localparam th503dd    = 3'd4 ;
input                     sys_clk;
input                     rst_n;
input   [MSM_WIDTH:0]     gq31bc6;
input   [LANE_WIDTH-1:0]  ho79420;
input                     wlb4422;
input                     twa2114;
input                     ng89868;
input                     db84510;
input   [LANE_WIDTH-1:0]  bn22886;
output  [LANE_WIDTH-1:0]  do14437;
output  [LANE_WIDTH-1:0]  lsa21bb;
output  [OS_WIDTH -1:0]   aa10dda;
output                    je86ed0;
output                    xl37682;
output                    gdbb417;
output  [DISM_WIDTH:0]    dmda0bd;
reg  [DISM_WIDTH:0]     dmda0bd;
reg  [LANE_WIDTH-1:0]   do14437;
reg                     je86ed0;
reg                     xl37682;
reg  [LANE_WIDTH-1:0]   lsa21bb;
reg  [OS_WIDTH -1:0]    aa10dda;
reg                     gdbb417;
reg                     ay77844;
reg [MSM_WIDTH : 0] en44bff;
reg [LANE_WIDTH - 1 : 0] qt54e55;
reg hq200ec;
reg ym763;
reg xy9c101;
reg cb1d8c6;
reg [LANE_WIDTH - 1 : 0] ne631a7;
reg sj18d3a;
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
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      dmda0bd      <= ou98450;      lsa21bb     <= {(LANE_WIDTH){1'b0}};      do14437   <= {(LANE_WIDTH){1'b0}};      aa10dda <= OS_T1;      je86ed0  <= 1'b0;      xl37682    <= 1'b0;      gdbb417 <= 1'b0;      ay77844     <= 1'b0;   end   else begin      je86ed0  <= 1'b0;      xl37682    <= 1'b0;      gdbb417 <= 1'b0;      do14437   <= {(LANE_WIDTH){1'b0}};      case(dmda0bd)                  ou98450: begin            ay77844     <= 1'b0;            if (en44bff == DISABLED) begin               dmda0bd     <= blc2281;               je86ed0 <= 1'b1;               lsa21bb    <= {(LANE_WIDTH){1'b1}};               aa10dda<= OS_T1;            end            else begin               dmda0bd     <= ou98450;            end         end                  blc2281: begin            ay77844       <= (ne631a7[LANE_WIDTH-1]== 1'b1) ? 1'b1 : sj18d3a;            if (ym763 && ~je86ed0) begin               dmda0bd     <= ng1140f;               lsa21bb    <= {(LANE_WIDTH){1'b1}};               aa10dda<= OS_EIDLE;            end            else begin               dmda0bd     <= blc2281;            end         end         ng1140f: begin                        ay77844    <= (ne631a7[LANE_WIDTH-1]== 1'b1) ? 1'b1 : sj18d3a;            dmda0bd     <= oh8a07b;         end                  oh8a07b: begin            ay77844    <= (ne631a7[LANE_WIDTH-1]== 1'b1) ? 1'b1 : sj18d3a;            lsa21bb    <= {(LANE_WIDTH){1'b0}};            do14437  <= {(LANE_WIDTH){1'b1}};            if (sj18d3a == 1'b1) begin               gdbb417   <= 1'b1;                              if (&qt54e55 == 1'b0 || cb1d8c6) begin                  dmda0bd     <= th503dd;                  xl37682   <= 1'b1;               end               else begin                  dmda0bd     <= oh8a07b;               end            end            else if (xy9c101) begin               dmda0bd     <= th503dd;               xl37682   <= 1'b1;            end            else begin               dmda0bd     <= oh8a07b;            end         end                  th503dd: begin            ay77844     <= 1'b0;            if (en44bff != DISABLED) begin               dmda0bd   <= ou98450;            end            else begin               dmda0bd   <= th503dd;            end         end         default: begin            dmda0bd   <= ou98450;         end      endcase   end
end
always@* begin en44bff<={gq31bc6>>1,ld7b613[0]};qt54e55<={ho79420>>1,ld7b613[1]};hq200ec<=ld7b613[2];ym763<=ld7b613[3];xy9c101<=ld7b613[4];cb1d8c6<=ld7b613[5];ne631a7<={bn22886>>1,ld7b613[6]};sj18d3a<=ld7b613[7];end
always@* begin necf6c2[2047]<=ho79420[0];necf6c2[2046]<=wlb4422;necf6c2[2044]<=twa2114;necf6c2[2040]<=ng89868;necf6c2[2033]<=db84510;necf6c2[2019]<=bn22886[0];necf6c2[1990]<=ay77844;necf6c2[1023]<=gq31bc6[0];end         assign suff972 = necf6c2,ld7b613 = cme5c87;   initial begin   jcc030e = $fopen(".fred");   $fdisplay( jcc030e, "%3h\n%3h", (thc27c7 >> 4) & fnc7fe5, (thc27c7 >> (mt9f1ff+4)) & fnc7fe5 );   $fclose(jcc030e);   $readmemh(".fred", qg721c0);   end   always @ (suff972) begin   ym8700c = qg721c0[1];       for (vk1872=0; vk1872<qgdb09f; vk1872=vk1872+1) begin           cme5c87[vk1872] = suff972[ym8700c];       rv38061  = ^(ym8700c & qg721c0[0]);       ym8700c =  {ym8700c, rv38061};       end   end
endmodule