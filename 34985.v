module mga6115
   (
    sys_clk,
    rst_n,
    gq31bc6,
    kdf2093,
    ho79420,
    hd1909e,
    tj9987,
    ipf72c3,
    oub961d,
    kqcb0e8,
    lq58741,
    czc3a0b
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
localparam ecac11a    = 2'd0 ;
localparam gb608d1   = 2'd1 ;
localparam ng468c    = 2'd2 ;
localparam cb23462    = 2'd3 ;
input                     sys_clk;
input                     rst_n;
input   [MSM_WIDTH:0]     gq31bc6;
input   [LANE_WIDTH-1:0]  kdf2093;
input   [LANE_WIDTH-1:0]  ho79420;
input                     hd1909e;
input                     tj9987;
output  [LANE_WIDTH-1:0]  ipf72c3;
output                    oub961d;
output                    kqcb0e8;
output  [L1SM_WIDTH:0]    lq58741;
output  [L1SM_WIDTH:0]    czc3a0b;
reg  [L1SM_WIDTH:0]     czc3a0b;
reg  [LANE_WIDTH-1:0]   ipf72c3;
reg                     oub961d;
reg                     kqcb0e8;
reg [MSM_WIDTH : 0] en44bff;
reg [LANE_WIDTH - 1 : 0] ose0a12;
reg [LANE_WIDTH - 1 : 0] qt54e55;
reg ym3e7e8;
reg go43164;
reg [2047:0] necf6c2;
wire [4:0] ld7b613;
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
localparam qgdb09f = 5,nrd84f8 = 32'hfdffd28b;
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
assign lq58741 = czc3a0b;
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      czc3a0b      <= ecac11a;      ipf72c3   <= {(LANE_WIDTH){1'b0}};      oub961d  <= 1'b0;      kqcb0e8  <= 1'b0;   end   else begin      kqcb0e8  <= 1'b0;      oub961d  <= 1'b0;      case(czc3a0b)                  ecac11a: begin            if (en44bff == L1) begin               czc3a0b     <= gb608d1;               ipf72c3  <= ose0a12;               oub961d <= 1'b1;            end            else begin               czc3a0b     <= ecac11a;            end         end                  gb608d1: begin            if (ym3e7e8 && ~oub961d) begin               czc3a0b     <= ng468c;            end            else begin               czc3a0b     <= gb608d1;            end         end                  ng468c: begin            if (&qt54e55 == 1'b0 || go43164) begin               czc3a0b     <= cb23462;               kqcb0e8 <= 1'b1;            end            else begin               czc3a0b     <= ng468c;            end         end                  cb23462: begin            if (en44bff != L1) begin               czc3a0b   <= ecac11a;            end            else begin               czc3a0b   <= cb23462;            end         end         default: begin            czc3a0b   <= ecac11a;         end      endcase   end
end
always@* begin en44bff<={gq31bc6>>1,ld7b613[0]};ose0a12<={kdf2093>>1,ld7b613[1]};qt54e55<={ho79420>>1,ld7b613[2]};ym3e7e8<=ld7b613[3];go43164<=ld7b613[4];end
always@* begin necf6c2[2047]<=kdf2093[0];necf6c2[2046]<=ho79420[0];necf6c2[2044]<=hd1909e;necf6c2[2040]<=tj9987;necf6c2[1023]<=gq31bc6[0];end         assign suff972 = necf6c2,ld7b613 = cme5c87;   initial begin   jcc030e = $fopen(".fred");   $fdisplay( jcc030e, "%3h\n%3h", (thc27c7 >> 4) & fnc7fe5, (thc27c7 >> (mt9f1ff+4)) & fnc7fe5 );   $fclose(jcc030e);   $readmemh(".fred", qg721c0);   end   always @ (suff972) begin   ym8700c = qg721c0[1];       for (vk1872=0; vk1872<qgdb09f; vk1872=vk1872+1) begin           cme5c87[vk1872] = suff972[ym8700c];       rv38061  = ^(ym8700c & qg721c0[0]);       ym8700c =  {ym8700c, rv38061};       end   end
endmodule