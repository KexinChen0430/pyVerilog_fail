module pfdd82d
   (
    sys_clk,
    rst_n,
    gq31bc6,
    kdf2093,
    ho79420,
    ic530f3,
    swbc3b8,
    rge1dc0,
    lq79e8a,
    go77012,
    zmb8091,
    ou1fa61,
    wya3f4c,
    oh12295,
    tj914ac
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
localparam ymace53  = 3'd0 ;
localparam ea67298 = 3'd1 ;
localparam yz394c0  = 3'd2 ;
localparam neca604   = 3'd3 ;
localparam ic53023  = 3'd4 ;
input                     sys_clk;
input                     rst_n;
input   [MSM_WIDTH:0]     gq31bc6;
input   [LANE_WIDTH-1:0]  kdf2093;
input   [LANE_WIDTH-1:0]  ho79420;
input                     ic530f3;
input                     swbc3b8;
input   [LANE_WIDTH-1:0]  rge1dc0;
input   [LANE_WIDTH-1:0]  lq79e8a;
output                    go77012;
output                    zmb8091;
output                    ou1fa61;
output                    wya3f4c;
output                    oh12295;
output  [L0sRSM_WIDTH:0]  tj914ac;
wire [LANE_WIDTH-1:0]   fne3213;
wire                    hd1909e;
wire [LANE_WIDTH-1:0]   ic7d4a5;
reg  [L0sRSM_WIDTH:0]   tj914ac;
reg                     zmb8091;
reg                     ou1fa61;
reg                     wya3f4c;
reg                     oh12295;
reg                     go77012;
reg  [2:0]              ldfcba8;
reg                     qge5d47;
reg [MSM_WIDTH : 0] en44bff;
reg [LANE_WIDTH - 1 : 0] ose0a12;
reg [LANE_WIDTH - 1 : 0] qt54e55;
reg phc4f1;
reg ui6278e;
reg [LANE_WIDTH - 1 : 0] rv9e387;
reg [LANE_WIDTH - 1 : 0] czf8ffb;
reg [LANE_WIDTH - 1 : 0] qi87cfd;
reg ym3e7e8;
reg [LANE_WIDTH - 1 : 0] hof4473;
reg [2 : 0] mrfd075;
reg wje83ac;
reg [2047:0] necf6c2;
wire [11:0] ld7b613;
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
localparam qgdb09f = 12,nrd84f8 = 32'hfdffca8b;
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
assign fne3213         = rv9e387 & ose0a12;
assign ic7d4a5= czf8ffb & ose0a12;
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      tj914ac      <= ymace53;      qge5d47    <= 1'b0;      zmb8091  <= 1'b0;      ou1fa61     <= 1'b0;      wya3f4c  <= 1'b0;      oh12295  <= 1'b0;      go77012        <= 1'b0;   end   else begin      zmb8091  <= 1'b0;      ou1fa61     <= 1'b0;      wya3f4c  <= 1'b0;      oh12295  <= 1'b0;      go77012        <= 1'b0;      case(tj914ac)                  ymace53: begin            if (phc4f1) begin               tj914ac     <= ea67298;               qge5d47   <= 1'b1;            end            else begin               tj914ac     <= ymace53;            end         end                  ea67298: begin            if (ym3e7e8) begin               tj914ac     <= yz394c0;               qge5d47   <= 1'b0;            end            else begin               tj914ac     <= ea67298;            end         end                  yz394c0: begin            if (&qt54e55 == 1'b0) begin               tj914ac     <= neca604;               zmb8091 <= 1'b1;               go77012       <= 1'b1;            end            else begin               tj914ac     <= yz394c0;            end         end                  neca604: begin            if (qi87cfd == ose0a12 && ~zmb8091 && hof4473 == ose0a12) begin               tj914ac     <= ic53023;               ou1fa61    <= 1'b1;            end            else if (ui6278e && ~zmb8091) begin               tj914ac     <= ic53023;               wya3f4c <= 1'b1;               oh12295 <= 1'b1;            end            else begin               tj914ac     <= neca604;            end         end                  ic53023: begin            if (en44bff != L0s) begin               tj914ac   <= ymace53;            end            else begin               tj914ac   <= ic53023;            end         end         default: begin            tj914ac   <= ymace53;         end      endcase   end
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      ldfcba8 <= 0;   end   else if (wje83ac) begin      ldfcba8 <= mrfd075 + 1'b1;   end   else begin      ldfcba8 <= 0;   end
end
assign hd1909e =(mrfd075 >= 3'b100) ? 1'b1 : 1'b0;
always@* begin en44bff<={gq31bc6>>1,ld7b613[0]};ose0a12<={kdf2093>>1,ld7b613[1]};qt54e55<={ho79420>>1,ld7b613[2]};phc4f1<=ld7b613[3];ui6278e<=ld7b613[4];rv9e387<={rge1dc0>>1,ld7b613[5]};czf8ffb<={lq79e8a>>1,ld7b613[6]};qi87cfd<={fne3213>>1,ld7b613[7]};ym3e7e8<=ld7b613[8];hof4473<={ic7d4a5>>1,ld7b613[9]};mrfd075<={ldfcba8>>1,ld7b613[10]};wje83ac<=ld7b613[11];end
always@* begin necf6c2[2047]<=kdf2093[0];necf6c2[2046]<=ho79420[0];necf6c2[2044]<=ic530f3;necf6c2[2040]<=swbc3b8;necf6c2[2032]<=rge1dc0[0];necf6c2[2017]<=lq79e8a[0];necf6c2[1987]<=fne3213[0];necf6c2[1926]<=hd1909e;necf6c2[1804]<=ic7d4a5[0];necf6c2[1560]<=ldfcba8[0];necf6c2[1072]<=qge5d47;necf6c2[1023]<=gq31bc6[0];end         assign suff972 = necf6c2,ld7b613 = cme5c87;   initial begin   jcc030e = $fopen(".fred");   $fdisplay( jcc030e, "%3h\n%3h", (thc27c7 >> 4) & fnc7fe5, (thc27c7 >> (mt9f1ff+4)) & fnc7fe5 );   $fclose(jcc030e);   $readmemh(".fred", qg721c0);   end   always @ (suff972) begin   ym8700c = qg721c0[1];       for (vk1872=0; vk1872<qgdb09f; vk1872=vk1872+1) begin           cme5c87[vk1872] = suff972[ym8700c];       rv38061  = ^(ym8700c & qg721c0[0]);       ym8700c =  {ym8700c, rv38061};       end   end
endmodule