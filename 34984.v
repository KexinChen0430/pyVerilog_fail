module jea2c10
   (
    sys_clk,
    rst_n,
    gq31bc6,
    neca61e,
    pu83d89,
    ri1ec4a,
    zxf6253,
    wlb129f,
    tw894fc,
    alfd309,
    go53f17,
    kf9f8b9,
    vvfc5cd
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
localparam vi760ac  = 3'd0 ;
localparam rvb0563 = 3'd1 ;
localparam ec82b1e = 3'd2 ;
localparam gq158f0  = 3'd3 ;
localparam ecac780   = 3'd4 ;
localparam fa63c01  = 3'd5 ;
input                     sys_clk;
input                     rst_n;
input   [MSM_WIDTH:0]     gq31bc6;
input                     neca61e;
input                     pu83d89;
input                     ri1ec4a;
output                    zxf6253;
output  [LANE_WIDTH-1:0]  wlb129f;
output  [OS_WIDTH -1:0]   tw894fc;
output                    alfd309;
output  [LANE_WIDTH-1:0]  go53f17;
output  [L0sTSM_WIDTH:0]  kf9f8b9;
output  [L0sTSM_WIDTH:0]  vvfc5cd;
wire                    hd1909e;
reg  [L0sTSM_WIDTH:0]   vvfc5cd;
reg  [LANE_WIDTH-1:0]   wlb129f;
reg  [OS_WIDTH -1:0]    tw894fc;
reg                     zxf6253;
reg                     alfd309;
reg  [LANE_WIDTH-1:0]   go53f17;
reg  [2:0]              ldfcba8;
reg                     qge5d47;
reg [MSM_WIDTH : 0] en44bff;
reg lsa71ea;
reg db38f52;
reg hbc7a97;
reg ym3e7e8;
reg [2 : 0] mrfd075;
reg wje83ac;
reg [2047:0] necf6c2;
wire [6:0] ld7b613;
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
localparam qgdb09f = 7,nrd84f8 = 32'hfdffe30b;
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
assign kf9f8b9 = vvfc5cd;
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      vvfc5cd      <= vi760ac;      qge5d47    <= 1'b0;      wlb129f     <= {(LANE_WIDTH){1'b0}};      tw894fc <= OS_IDLE;      zxf6253  <= 1'b0;      alfd309     <= 1'b0;      go53f17   <= {(LANE_WIDTH){1'b0}};   end   else begin      zxf6253  <= 1'b0;      alfd309     <= 1'b0;      case(vvfc5cd)                  vi760ac: begin            if (lsa71ea) begin               vvfc5cd     <= rvb0563;               wlb129f    <= {(LANE_WIDTH){1'b1}};               tw894fc<= OS_EIDLE;               qge5d47   <= 1'b1;            end            else begin               vvfc5cd     <= vi760ac;            end         end         rvb0563: begin            vvfc5cd     <= ec82b1e;         end                  ec82b1e: begin            wlb129f       <= {(LANE_WIDTH){1'b0}};            go53f17     <= {(LANE_WIDTH){1'b1}};            if (ym3e7e8) begin               vvfc5cd     <= gq158f0;               qge5d47   <= 1'b0;            end            else begin               vvfc5cd     <= ec82b1e;            end         end                  gq158f0: begin            if (hbc7a97) begin               vvfc5cd     <= ecac780;               wlb129f    <= {(LANE_WIDTH){1'b1}};               tw894fc<= OS_NFTS;               zxf6253 <= 1'b1;               go53f17  <= {(LANE_WIDTH){1'b0}};            end            else begin               vvfc5cd     <= gq158f0;            end         end                  ecac780: begin            if (db38f52 && ~zxf6253) begin               vvfc5cd     <= fa63c01;               alfd309    <= 1'b1;               wlb129f    <= {(LANE_WIDTH){1'b0}};            end            else begin               vvfc5cd     <= ecac780;            end         end                  fa63c01: begin            if (en44bff != L0s) begin               vvfc5cd   <= vi760ac;            end            else begin               vvfc5cd   <= fa63c01;            end         end         default: begin            vvfc5cd   <= vi760ac;         end      endcase   end
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      ldfcba8 <= 0;   end   else if (wje83ac) begin      ldfcba8 <= mrfd075 + 1'b1;   end   else begin      ldfcba8 <= 0;   end
end
assign hd1909e =(mrfd075 >= 3'b100) ? 1'b1 : 1'b0;
always@* begin en44bff<={gq31bc6>>1,ld7b613[0]};lsa71ea<=ld7b613[1];db38f52<=ld7b613[2];hbc7a97<=ld7b613[3];ym3e7e8<=ld7b613[4];mrfd075<={ldfcba8>>1,ld7b613[5]};wje83ac<=ld7b613[6];end
always@* begin necf6c2[2047]<=neca61e;necf6c2[2046]<=pu83d89;necf6c2[2044]<=ri1ec4a;necf6c2[2040]<=hd1909e;necf6c2[2032]<=ldfcba8[0];necf6c2[2016]<=qge5d47;necf6c2[1023]<=gq31bc6[0];end         assign suff972 = necf6c2,ld7b613 = cme5c87;   initial begin   jcc030e = $fopen(".fred");   $fdisplay( jcc030e, "%3h\n%3h", (thc27c7 >> 4) & fnc7fe5, (thc27c7 >> (mt9f1ff+4)) & fnc7fe5 );   $fclose(jcc030e);   $readmemh(".fred", qg721c0);   end   always @ (suff972) begin   ym8700c = qg721c0[1];       for (vk1872=0; vk1872<qgdb09f; vk1872=vk1872+1) begin           cme5c87[vk1872] = suff972[ym8700c];       rv38061  = ^(ym8700c & qg721c0[0]);       ym8700c =  {ym8700c, rv38061};       end   end
endmodule