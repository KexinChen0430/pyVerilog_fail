module sw87eb1
   (
   sys_clk,
   rst_n,
   yxd6218,
   uxb10c4,
   co88624,
   ui43120,
   kf18901,
   osc480c,
   mg24061
   ) ;
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
input [9:0]                yxd6218;
input                      uxb10c4;
input [MSM_WIDTH:0]        co88624;
input                      ui43120;
output [3:0]               kf18901;
output [1:0]               osc480c;
output                     mg24061;
wire [1:0]                 osc480c;
wire                       mg24061;
reg [10:0]                 fncdaa4;
reg                        ww6d527;
reg [3:0]                  kf18901;
reg [9 : 0] en549cd;
reg qva4e6c;
reg [MSM_WIDTH : 0] yz39b26;
reg thcd935;
reg [10 : 0] fa6c9af;
reg ld64d7a;
reg [2047:0] necf6c2;
wire [5:0] ld7b613;
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
localparam qgdb09f = 6,nrd84f8 = 32'hfdffca8b;
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
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n)      fncdaa4 <= 11'h000 ;   else if (fa6c9af == {1'b0,en549cd} || yz39b26 == L0s || yz39b26 == L1 || yz39b26 == L2 || thcd935 )      fncdaa4 <= 11'h000 ;   else      fncdaa4 <= fa6c9af + 11'h001 ;
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n)      ww6d527   <= 1'b0 ;   else if (fa6c9af == 11'd1)      ww6d527   <= 1'b1 ;   else      ww6d527   <= 1'b0 ;
end
assign osc480c = ld64d7a;
assign mg24061   = ld64d7a;
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      kf18901 <= 4'd0;   end   else if (qva4e6c) begin      kf18901 <= 4'd0;   end   else if (mg24061) begin      kf18901 <= kf18901 + 1'b1;   end
end
always@* begin en549cd<={yxd6218>>1,ld7b613[0]};qva4e6c<=ld7b613[1];yz39b26<={co88624>>1,ld7b613[2]};thcd935<=ld7b613[3];fa6c9af<={fncdaa4>>1,ld7b613[4]};ld64d7a<=ld7b613[5];end
always@* begin necf6c2[2047]<=uxb10c4;necf6c2[2046]<=co88624[0];necf6c2[2044]<=ui43120;necf6c2[2040]<=fncdaa4[0];necf6c2[2032]<=ww6d527;necf6c2[1023]<=yxd6218[0];end         assign suff972 = necf6c2,ld7b613 = cme5c87;   initial begin   jcc030e = $fopen(".fred");   $fdisplay( jcc030e, "%3h\n%3h", (thc27c7 >> 4) & fnc7fe5, (thc27c7 >> (mt9f1ff+4)) & fnc7fe5 );   $fclose(jcc030e);   $readmemh(".fred", qg721c0);   end   always @ (suff972) begin   ym8700c = qg721c0[1];       for (vk1872=0; vk1872<qgdb09f; vk1872=vk1872+1) begin           cme5c87[vk1872] = suff972[ym8700c];       rv38061  = ^(ym8700c & qg721c0[0]);       ym8700c =  {ym8700c, rv38061};       end   end
endmodule