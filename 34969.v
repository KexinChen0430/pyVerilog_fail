module kqcefac
   (
   sys_clk,
   rst_n,
   wwf5804,
   wyac021,
   uv60109,
   ym84d,
   pu4269,
   qi2134a,
   vx9a51,
   vi4d28f,
   rg6947a,
   hb4a3d3,
   of51e9f
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
input                   sys_clk;
input                   rst_n;
input [15:0]   wwf5804;
input                   wyac021;
input                   pu4269;
input                   qi2134a;
input                   uv60109;
input                   ym84d;
input                   vx9a51;
output [15:0]           vi4d28f;
output [1:0]            rg6947a;
output                  hb4a3d3;
output                  of51e9f;
reg [15:0]             vi4d28f;
reg [1:0]              rg6947a;
reg                    hb4a3d3;
reg                    of51e9f;
reg [15 : 0] qt60385;
reg tw1c2d;
reg bae16b;
reg sh70b5b;
reg sj85add;
reg vx2d6ed;
reg nr6b76f;
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
localparam qgdb09f = 7,nrd84f8 = 32'hfdffc68b;
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
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      vi4d28f  <= 16'd0;      rg6947a <= 2'd0;      of51e9f   <= 1'd0;      hb4a3d3   <= 1'd0;   end   else begin      of51e9f   <= nr6b76f;      case(1'b1)         sj85add : begin            hb4a3d3   <= 1'b1;            vi4d28f  <= {K28_2, qt60385[7:0]};            rg6947a <= 2'b10;         end         vx2d6ed : begin            hb4a3d3   <= 1'b1;            vi4d28f  <= {qt60385[15:8],K29_7};            rg6947a <= 2'b01;         end         tw1c2d : begin            hb4a3d3   <= 1'b1;            vi4d28f  <= {K27_7, qt60385[7:0]};            rg6947a <= 2'b10;         end         bae16b : begin            hb4a3d3   <= 1'b1;            vi4d28f  <= {qt60385[15:8], K29_7};            rg6947a <= 2'b01;         end         sh70b5b : begin            hb4a3d3   <= 1'b1;            vi4d28f  <= {qt60385[15:8], K30_7};            rg6947a <= 2'b01;         end         nr6b76f : begin            hb4a3d3   <= 1'b0;         end         default : begin            hb4a3d3   <= 1'b1;            vi4d28f  <= qt60385;            rg6947a <= 2'b00;         end      endcase   end
end
always@* begin qt60385<={wwf5804>>1,ld7b613[0]};tw1c2d<=ld7b613[1];bae16b<=ld7b613[2];sh70b5b<=ld7b613[3];sj85add<=ld7b613[4];vx2d6ed<=ld7b613[5];nr6b76f<=ld7b613[6];end
always@* begin necf6c2[2047]<=wyac021;necf6c2[2046]<=uv60109;necf6c2[2044]<=ym84d;necf6c2[2040]<=pu4269;necf6c2[2032]<=qi2134a;necf6c2[2017]<=vx9a51;necf6c2[1023]<=wwf5804[0];end         assign suff972 = necf6c2,ld7b613 = cme5c87;   initial begin   jcc030e = $fopen(".fred");   $fdisplay( jcc030e, "%3h\n%3h", (thc27c7 >> 4) & fnc7fe5, (thc27c7 >> (mt9f1ff+4)) & fnc7fe5 );   $fclose(jcc030e);   $readmemh(".fred", qg721c0);   end   always @ (suff972) begin   ym8700c = qg721c0[1];       for (vk1872=0; vk1872<qgdb09f; vk1872=vk1872+1) begin           cme5c87[vk1872] = suff972[ym8700c];       rv38061  = ^(ym8700c & qg721c0[0]);       ym8700c =  {ym8700c, rv38061};       end   end
endmodule