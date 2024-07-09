module dz4a43a
   (
   rst_n,
   sys_clk,
   qi875d4,
   fadf3e5,
   dzd750a,
   jrba856,
   wwd42b6,
   ira15b1,
   phy_status,
   ps57f08,
   fpbf843,
   thfc21e,
   zke10f6,
   oh87b3,
   me43d9c,
   tw1ece0,
   pff6703,
   swb381f,
   phy_ltssm_state,
   kf9f8b9,
   lq58741,
   icc4288,
   wwd1bc3,
   co8de18,
   al6f0c1,
   pub7014,
   ipc3060,
   sj18305,
   eac182d,
   ntc169,
   gb60b4e,
   reset_n,
   power_down,
   qv95390,
   ksa9c85,
   oh124b7,
   ho79420,
   gd1de50,
   icef284,
   lq79e8a,
   ir3392d,
   cm72a72
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
localparam ng468c     = 2'd2 ;
localparam ipedc80     = 2'd1 ;
localparam jp6e404 = 2'd2 ;
localparam gq158f0 = 3'd3 ;
input                     sys_clk;
input                     rst_n;
input                     qi875d4;
input  [7:0]              fadf3e5;
input                     dzd750a;
input                     jrba856;
input                     wwd42b6;
input  [2:0]              ira15b1;
input                     phy_status;
input                     ps57f08;
input                     fpbf843;
input                     thfc21e;
input                     zke10f6;
input                     oh87b3;
input                     me43d9c;
input [7:0]               tw1ece0;
input                     pff6703;
input                     swb381f;
input [MSM_WIDTH:0]       phy_ltssm_state;
input [L0sTSM_WIDTH:0]    kf9f8b9;
input [L1SM_WIDTH:0]      lq58741;
input [L2SM_WIDTH:0]      icc4288;
input                     wwd1bc3;
input                     co8de18;
input                     al6f0c1;
output [7:0]              pub7014;
output                    ipc3060;
output                    gb60b4e;
output                    sj18305;
output                    eac182d;
output                    ntc169;
output                    reset_n;
output [1:0]              power_down;
output [7:0]              qv95390;
output                    ksa9c85;
output                    oh124b7;
output                    ho79420;
output                    gd1de50;
output                    icef284;
output                    lq79e8a;
output                    ir3392d;
output                    cm72a72;
wire                      kqde96a;
wire                      tuf4b51;
wire                      bna5a8b;
wire   [7:0]              bn2d45e;
wire                      ip6a2f7;
reg [1:0]                 ip517bc            ;
reg [1:0]                 bn8bde5            ;
reg [1:0]                 power_down;
reg                       alf7975;
reg                       ymbcbac;
reg                       qge5d61;
reg                       ou2eb08;
parameter ip75841  = 2'b00;
parameter ouac20d = 2'b10;
parameter jp61069  = 2'b10;
parameter qv834f  = 2'b11;
`ifdef ECP3
`else
`endif
reg [7 : 0] en41a7c;
reg mtd3e5;
reg xw69f2c;
reg zx4f962;
reg [2 : 0] xw7cb16;
reg ice58b3;
reg ep2c598;
reg ea62cc5;
reg db16629;
reg gqb314e;
reg ym98a71;
reg xwc5388;
reg [7 : 0] ep29c42;
reg cz4e214;
reg bl710a5;
reg [MSM_WIDTH : 0] cm4c960;
reg [L0sTSM_WIDTH : 0] fpa5c12;
reg [L1SM_WIDTH : 0] cz704b0;
reg [L2SM_WIDTH : 0] oh12c21;
reg vk9610d;
reg xlb086a;
reg hd84357;
reg ec21abe;
reg yzd5f0;
reg qt6af84;
reg [7 : 0] xw57c25;
reg qvbe12b;
reg [1 : 0] eaf095d;
reg [1 : 0] lf84ae9;
reg pu2574f;
reg ks2ba7b;
reg by5d3d9;
reg ble9ecb;
reg [2047:0] necf6c2;
wire [32:0] ld7b613;
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
`ifdef ECP3
`else
`endif
localparam qgdb09f = 33,nrd84f8 = 32'hfdffe0cb;
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
`ifdef ECP3
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
assign pub7014       = ep29c42;
assign ipc3060     = cz4e214;
assign sj18305  = db16629;
assign eac182d = bl710a5;
assign ntc169   = ea62cc5;
assign reset_n       = rst_n;
assign tuf4b51 = (xw7cb16 == 3'b011) ? 1'b1 : 1'b0;
uvf7987 #(2) wy92ae5   (   .f_clk(qi875d4) ,   .s_clk(sys_clk) ,   .rst_n (rst_n),   .in_fclk({ice58b3,yzd5f0}),   .out_sclk({kqde96a,bna5a8b})   );
assign gd1de50 = ec21abe;
assign icef284  =  (hd84357) ? 1'b1 : qt6af84;
always @(posedge qi875d4 or negedge rst_n) begin   if (!rst_n) begin      alf7975 <= 1'b0;   end   else if (ice58b3) begin      alf7975 <= 1'b0;   end   else if (gqb314e) begin      alf7975 <= 1'b1;   end
end
assign gb60b4e   = pu2574f | ym98a71;
assign qv95390      = en41a7c;
assign ksa9c85     = mtd3e5;
assign cm72a72 = (vk9610d) ? 1'b1 : xw69f2c;
assign lq79e8a  = 1'b1 ;
`ifdef ECP3
      assign ho79420  = (ks2ba7b) ? 1'b0 : (xlb086a) ? 1'b1 : ~xw69f2c;
`else
   assign ho79420  = (ks2ba7b) ? 1'b0 : (xlb086a) ? 1'b1 : zx4f962;
`endif
assign ir3392d = (power_down == qv834f && zx4f962 == 1'b0) ? 1'b1 : 1'b0;
assign oh124b7       = (xw7cb16 == 3'b100 | xw7cb16 == 3'b101 | xw7cb16 == 3'b110 | xw7cb16 == 3'b111) ? 1'b1 : 1'b0;
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      ip517bc   <= jp61069;   end   else begin      case(cm4c960)         L0s:            if (fpa5c12 == gq158f0) begin               ip517bc   <= ouac20d;            end         DISABLED,         DETECT:               ip517bc   <= jp61069;         L1:            if (cz704b0 == ng468c) begin               ip517bc   <= jp61069;            end         L2:            if (oh12c21 == ipedc80 || oh12c21 == jp6e404 ) begin               ip517bc   <= qv834f;            end         default:               ip517bc   <= ip75841;      endcase   end
end
always @(posedge qi875d4 or negedge rst_n) begin   if (!rst_n) begin      bn8bde5 <= jp61069;      power_down     <= jp61069;   end   else begin      bn8bde5 <= eaf095d;      power_down     <= lf84ae9;   end
end
assign  bn2d45e  = qv95390;
assign  ip6a2f7 = ksa9c85;
always @(posedge qi875d4 or negedge rst_n) begin   if (!rst_n) begin      ymbcbac  <= 1'b0;      qge5d61        <= 1'b0;      ou2eb08    <= 1'b0;   end   else begin      qge5d61 <= (xw57c25 == COM) && qvbe12b;      if(ks2ba7b) begin            if(by5d3d9 || (cm4c960 != 'd1))            ymbcbac  <= 1'b0;      end      else if(by5d3d9 && (cm4c960 == 'd1) && ~ble9ecb)          ymbcbac  <= 1'b1;            if(cm4c960 != 'd1)          ou2eb08  <= 1'b0;      else if(ks2ba7b)            ou2eb08  <= 1'b1;   end
end
always@* begin en41a7c<={fadf3e5>>1,ld7b613[0]};mtd3e5<=ld7b613[1];xw69f2c<=ld7b613[2];zx4f962<=ld7b613[3];xw7cb16<={ira15b1>>1,ld7b613[4]};ice58b3<=ld7b613[5];ep2c598<=ld7b613[6];ea62cc5<=ld7b613[7];db16629<=ld7b613[8];gqb314e<=ld7b613[9];ym98a71<=ld7b613[10];xwc5388<=ld7b613[11];ep29c42<={tw1ece0>>1,ld7b613[12]};cz4e214<=ld7b613[13];bl710a5<=ld7b613[14];cm4c960<={phy_ltssm_state>>1,ld7b613[15]};fpa5c12<={kf9f8b9>>1,ld7b613[16]};cz704b0<={lq58741>>1,ld7b613[17]};oh12c21<={icc4288>>1,ld7b613[18]};vk9610d<=ld7b613[19];xlb086a<=ld7b613[20];hd84357<=ld7b613[21];ec21abe<=ld7b613[22];yzd5f0<=ld7b613[23];qt6af84<=ld7b613[24];xw57c25<={bn2d45e>>1,ld7b613[25]};qvbe12b<=ld7b613[26];eaf095d<={ip517bc>>1,ld7b613[27]};lf84ae9<={bn8bde5>>1,ld7b613[28]};pu2574f<=ld7b613[29];ks2ba7b<=ld7b613[30];by5d3d9<=ld7b613[31];ble9ecb<=ld7b613[32];end
always@* begin necf6c2[2047]<=dzd750a;necf6c2[2046]<=jrba856;necf6c2[2044]<=wwd42b6;necf6c2[2040]<=ira15b1[0];necf6c2[2033]<=phy_status;necf6c2[2024]<=al6f0c1;necf6c2[2018]<=ps57f08;necf6c2[2001]<=kqde96a;necf6c2[1988]<=fpbf843;necf6c2[1954]<=tuf4b51;necf6c2[1929]<=thfc21e;necf6c2[1860]<=bna5a8b;necf6c2[1811]<=zke10f6;necf6c2[1789]<=icc4288[0];necf6c2[1673]<=bn2d45e[0];necf6c2[1574]<=oh87b3;necf6c2[1530]<=wwd1bc3;necf6c2[1299]<=ip6a2f7;necf6c2[1258]<=ou2eb08;necf6c2[1247]<=phy_ltssm_state[0];necf6c2[1102]<=bn8bde5[0];necf6c2[1101]<=me43d9c;necf6c2[1023]<=fadf3e5[0];necf6c2[1012]<=co8de18;necf6c2[894]<=lq58741[0];necf6c2[629]<=qge5d61;necf6c2[623]<=swb381f;necf6c2[551]<=ip517bc[0];necf6c2[447]<=kf9f8b9[0];necf6c2[314]<=ymbcbac;necf6c2[311]<=pff6703;necf6c2[157]<=alf7975;necf6c2[155]<=tw1ece0[0];end         assign suff972 = necf6c2,ld7b613 = cme5c87;   initial begin   jcc030e = $fopen(".fred");   $fdisplay( jcc030e, "%3h\n%3h", (thc27c7 >> 4) & fnc7fe5, (thc27c7 >> (mt9f1ff+4)) & fnc7fe5 );   $fclose(jcc030e);   $readmemh(".fred", qg721c0);   end   always @ (suff972) begin   ym8700c = qg721c0[1];       for (vk1872=0; vk1872<qgdb09f; vk1872=vk1872+1) begin           cme5c87[vk1872] = suff972[ym8700c];       rv38061  = ^(ym8700c & qg721c0[0]);       ym8700c =  {ym8700c, rv38061};       end   end
endmodule