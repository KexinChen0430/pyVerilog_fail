module zma7feb
   (
   sys_clk,
   rst_n,
   vi4d28f,
   rg6947a,
   hb4a3d3,
   of51e9f,
   ned08a2,
   lf84512,
   nt22896,
   vk144b7,
   zma25bb,
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
input                      sys_clk;
input                      rst_n;
input [15:0]               vi4d28f;
input                      hb4a3d3;
input                      of51e9f;
input [1:0]                rg6947a;
input [15:0]               ned08a2;
input [1:0]                lf84512;
input [1:0]                nt22896;
input                      vk144b7;
input                      zma25bb;
output [15:0]              kf12dda;
output [1:0]               pu96ed5;
output [1:0]               dob76ab;
output                     cbbb55b;
output                     xwdaadd;
reg [15:0]             jp5a939;
reg [15:0]             kqd49cf;
reg [15:0]             kf12dda;
reg [1:0]              pu96ed5;
reg [1:0]              dob76ab;
reg                    cbbb55b;
reg                    kq789ab;
reg                    xwdaadd;
reg [15 : 0] sj26ac9;
reg [1 : 0] je3564d;
reg uxab26a;
reg yk59354;
reg [15 : 0] czc9aa1;
reg [1 : 0] zk4d50d;
reg [1 : 0] yx6a86a;
reg kd54355;
reg qva1aad;
reg [15 : 0] qvd56c;
reg [15 : 0] en6ab64;
reg hb55b25;
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
localparam qgdb09f = 12,nrd84f8 = 32'hfdffc68b;
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
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n)  begin      kf12dda     <= 16'd0;      pu96ed5    <= 2'd0;      dob76ab   <= 2'd0;      cbbb55b <= 1'd0;      xwdaadd      <= 1'd0;   end   else begin      cbbb55b    <= qva1aad;      case (1'b1)         |kd54355 :  begin            kf12dda[15:0]  <= kd54355 ? czc9aa1[15:0] : 16'h0000;            pu96ed5[1:0]  <= kd54355 ? zk4d50d[1:0] : 2'b00;            dob76ab[1:0] <= kd54355 ? yx6a86a[1:0] : 2'b00;            xwdaadd         <= 1'b1;         end         uxab26a : begin            kf12dda  <= sj26ac9;            pu96ed5 <= je3564d;            dob76ab<= 2'd0;            xwdaadd   <= 1'b1;         end         yk59354: begin            kf12dda  <= (hb55b25) ? qvd56c : en6ab64;            pu96ed5 <= 2'b11;            dob76ab<= 2'd0;            xwdaadd   <= 1'b1;         end         default :  begin            kf12dda  <= 16'd0;            pu96ed5 <= 2'd0;            dob76ab<= 2'd0;            xwdaadd   <= 1'b0;         end      endcase   end
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n)      kq789ab <= 1'b0;   else if (yk59354)      kq789ab <= ~hb55b25;
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      kqd49cf <= 16'd0;      jp5a939 <= 16'd0;   end   else begin      kqd49cf <= {K28_5, K28_0};      jp5a939 <= {K28_0, K28_0};   end
end
always@* begin sj26ac9<={vi4d28f>>1,ld7b613[0]};je3564d<={rg6947a>>1,ld7b613[1]};uxab26a<=ld7b613[2];yk59354<=ld7b613[3];czc9aa1<={ned08a2>>1,ld7b613[4]};zk4d50d<={lf84512>>1,ld7b613[5]};yx6a86a<={nt22896>>1,ld7b613[6]};kd54355<=ld7b613[7];qva1aad<=ld7b613[8];qvd56c<={jp5a939>>1,ld7b613[9]};en6ab64<={kqd49cf>>1,ld7b613[10]};hb55b25<=ld7b613[11];end
always@* begin necf6c2[2047]<=rg6947a[0];necf6c2[2046]<=hb4a3d3;necf6c2[2044]<=of51e9f;necf6c2[2040]<=ned08a2[0];necf6c2[2032]<=lf84512[0];necf6c2[2017]<=nt22896[0];necf6c2[1987]<=vk144b7;necf6c2[1926]<=zma25bb;necf6c2[1805]<=jp5a939[0];necf6c2[1562]<=kqd49cf[0];necf6c2[1076]<=kq789ab;necf6c2[1023]<=vi4d28f[0];end         assign suff972 = necf6c2,ld7b613 = cme5c87;   initial begin   jcc030e = $fopen(".fred");   $fdisplay( jcc030e, "%3h\n%3h", (thc27c7 >> 4) & fnc7fe5, (thc27c7 >> (mt9f1ff+4)) & fnc7fe5 );   $fclose(jcc030e);   $readmemh(".fred", qg721c0);   end   always @ (suff972) begin   ym8700c = qg721c0[1];       for (vk1872=0; vk1872<qgdb09f; vk1872=vk1872+1) begin           cme5c87[vk1872] = suff972[ym8700c];       rv38061  = ^(ym8700c & qg721c0[0]);       ym8700c =  {ym8700c, rv38061};       end   end
endmodule