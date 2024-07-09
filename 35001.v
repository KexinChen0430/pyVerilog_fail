module  lq6c1b1(
   sys_clk,
   rst_n,
   oh362e6,
   mtb1735,
   tj8b9ac,
   ay5cd66,
   phy_ltssm_state,
   ls35987,
   mgacc3b,
   qgcbe8c,
   fn5f460,
   ayfa306,
   sj397d1,
   hbd84c9,
   xjc264f,
   jr1327f,
   do993fe,
   qtc9ff3,
   yx4e2a2,
   al7fcee,
   dmfe774,
   hbf3ba3,
   co9dd1e,
   aaf45c,
   zx74783,
   qia3c1e,
   tw1e0f1,
   icf078a,
   ls83c50,
   ls1e282
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
parameter uvc3724   = 2'b00;
parameter je1b925  = 2'b01;
parameter mrdc92b = 2'b10;
parameter fae495c = 1'b0;
parameter ec24ae2 = 1'b1;
parameter xy25710 = 2'b00;
parameter wy2b883     = 2'b01;
parameter su5c419   = 2'b10;
parameter gbe20c9  = 3'b000;
parameter mg1064c     = 3'b001;
parameter fc83261    = 3'b010;
parameter vx1930b   = 3'b011;
parameter enc985f = 3'b100;
parameter os4c2fd   = 1'b0;
parameter pf617e8   = 1'b1;
input                     sys_clk;
input                     rst_n;
input [11:0]              oh362e6;
input                     mtb1735;
input [`NUM_VC -1:0]      tj8b9ac;
input [(`NUM_VC*3)-1:0]   ay5cd66;
input [MSM_WIDTH:0]       phy_ltssm_state;
input                     ls35987;
input [`NUM_VC -1:0]      mgacc3b;
input                     qgcbe8c;
input                     fn5f460;
input                     ayfa306;
input [1:0]               sj397d1;
input [2:0]               hbd84c9;
input                     xjc264f;
input                     jr1327f;
input                     do993fe;
input                     qtc9ff3;
input                     yx4e2a2;
input                     al7fcee;
output                    dmfe774;
output                    hbf3ba3;
output                    co9dd1e;
output [`NUM_VC -1:0]     aaf45c;
output                    zx74783;
output                    qia3c1e;
output [2:0]              tw1e0f1;
output                    icf078a;
output [1:0]              ls83c50;
output [`NUM_VC -1:0]     ls1e282;
reg                       dmfe774;
reg                       hbf3ba3;
reg                       co9dd1e;
reg    [`NUM_VC -1:0]     aaf45c;
reg                       zx74783;
reg                       qia3c1e;
reg    [2:0]              tw1e0f1;
reg                       icf078a;
reg    [1:0]              ls83c50;
reg    [`NUM_VC -1:0]     ls1e282;
reg  [1:0]                db3586;
reg  [2:0]                co1ac37;
reg                       ipd61b9;
reg                       xlb0dcc;
reg  [11:0]               fc86e67;
reg                       rv3733a;
reg                       ieb99d7;
reg                       uvcceb9;
reg                       me675cd;
reg                       je3ae68;
reg                       zxd7342;
reg                       aab9a16;
reg                       jpcd0b1;
reg                       yk6858e;
reg                       jc42c71;
reg                       xl1638a;
reg  [`NUM_VC -1:0]       mtb1c56;
`ifdef VC1
wire  [2:0]               xl8e2b5;
`else
reg   [2:0]               xl8e2b5;
`endif
`ifndef VC1
`ifdef VC2
reg    an8ad7e;
`else
`ifdef VC3
reg  [1:0]   an8ad7e;
`else
`ifdef VC4
reg  [1:0]   an8ad7e;
`else   // 5 - 8
reg  [2:0]   an8ad7e;
`endif
`endif
`endif
`endif
wire  [7:0]               hb7e87f;
wire  [2:0]               hof43fe;
wire  [2:0]               epa1ff2;
wire  [2:0]               wyff94;
wire  [2:0]               al7fca0;
wire  [2:0]               dmfe504;
wire  [2:0]               gbf2823;
wire  [2:0]               xl9411c;
wire  [2:0]               rva08e7;
wire                      xy473e;
wire                      ep239f2;
`ifdef VC1   //VC0 only
`else
`endif
`ifdef VC1   //VC0 only
`else
`endif
`ifdef VC1
`else
`ifdef EN_VC1
`endif
`ifdef EN_VC2
`endif
`ifdef EN_VC3
`endif
`ifdef EN_VC4
`endif
`ifdef EN_VC5
`endif
`ifdef EN_VC6
`endif
`ifdef EN_VC7
`endif
`endif
`ifndef VC1
`endif
`ifdef VC1   //VC0 only
`else
`endif
`ifdef VC1   //VC0 only
`else
`endif
`ifdef VC1   //VC0 only
`else
`endif
`ifdef VC1   //VC0 only
`else
`ifdef EN_VC1
`endif
`ifdef EN_VC2
`endif
`ifdef EN_VC3
`endif
`ifdef EN_VC4
`endif
`ifdef EN_VC5
`endif
`ifdef EN_VC6
`endif
`ifdef EN_VC7
`endif
`endif
`ifdef EN_VC0
`endif
`ifdef EN_VC1
`endif
`ifdef EN_VC2
`endif
`ifdef EN_VC3
`endif
`ifdef EN_VC4
`endif
`ifdef EN_VC5
`endif
`ifdef EN_VC6
`endif
`ifdef EN_VC7
`endif
`ifdef EN_VC0
`else
`endif
`ifdef EN_VC1
`else
`endif
`ifdef EN_VC2
`else
`endif
`ifdef EN_VC3
`else
`endif
`ifdef EN_VC4
`else
`endif
`ifdef EN_VC5
`else
`endif
`ifdef EN_VC6
`else
`endif
`ifdef EN_VC7
`else
`endif
reg [8*10:1]     db1cf95;
reg [8*10:1]     mre7cae;
reg [8*10:1]     mg3e575;
reg [11 : 0] alf2ba9;
reg an95d4c;
reg [`NUM_VC - 1 : 0] kfaea64;
reg [(`NUM_VC * 3) - 1 : 0] cz75325;
reg [MSM_WIDTH : 0] cm4c960;
reg bl64b01;
reg [`NUM_VC - 1 : 0] zm2580e;
reg kf2c072;
reg cz60395;
reg ls1cad;
reg [1 : 0] pue56b;
reg [2 : 0] yk72b5b;
reg kf95ad8;
reg lsad6c4;
reg ld6b623;
reg gb5b11e;
reg ldd88f4;
reg wwc47a6;
reg [1 : 0] wl23d30;
reg [2 : 0] pu1e985;
reg hof4c2b;
reg gqa615b;
reg [11 : 0] ng30ad8;
reg ep856c3;
reg gq2b61c;
reg sh5b0e0;
reg dzd8704;
reg qtc3827;
reg bn1c13c;
reg yke09e7;
reg ba4f38;
reg ph279c3;
reg mt3ce1f;
reg ale70fd;
reg [`NUM_VC - 1 : 0] tj387ec;
reg [7 : 0] alc3f66;
reg [2 : 0] aa1fb34;
reg [2 : 0] shfd9a1;
reg [2 : 0] xjecd0d;
reg [2 : 0] xw6686e;
reg [2 : 0] wy34373;
reg [2 : 0] uxa1b98;
reg [2 : 0] wldcc4;
reg [2 : 0] fn6e625;
reg jc7312e;
reg wy98973;
reg [8 * 10 : 1] goc4b98;
reg [8 * 10 : 1] ba25cc1;
reg [8 * 10 : 1] ym2e60a;
reg [2047:0] necf6c2;
wire [48:0] ld7b613;
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
`ifdef VC1
`else
`endif
`ifndef VC1
`ifdef VC2
`else
`ifdef VC3
`else
`ifdef VC4
`else   // 5 - 8
`endif
`endif
`endif
`endif
`ifdef VC1   //VC0 only
`else
`endif
`ifdef VC1   //VC0 only
`else
`endif
`ifdef VC1
`else
`ifdef EN_VC1
`endif
`ifdef EN_VC2
`endif
`ifdef EN_VC3
`endif
`ifdef EN_VC4
`endif
`ifdef EN_VC5
`endif
`ifdef EN_VC6
`endif
`ifdef EN_VC7
`endif
`endif
`ifndef VC1
`endif
`ifdef VC1   //VC0 only
`else
`endif
`ifdef VC1   //VC0 only
`else
`endif
`ifdef VC1   //VC0 only
`else
`endif
`ifdef VC1   //VC0 only
`else
`ifdef EN_VC1
`endif
`ifdef EN_VC2
`endif
`ifdef EN_VC3
`endif
`ifdef EN_VC4
`endif
`ifdef EN_VC5
`endif
`ifdef EN_VC6
`endif
`ifdef EN_VC7
`endif
`endif
`ifdef EN_VC0
`endif
`ifdef EN_VC1
`endif
`ifdef EN_VC2
`endif
`ifdef EN_VC3
`endif
`ifdef EN_VC4
`endif
`ifdef EN_VC5
`endif
`ifdef EN_VC6
`endif
`ifdef EN_VC7
`endif
`ifdef EN_VC0
`else
`endif
`ifdef EN_VC1
`else
`endif
`ifdef EN_VC2
`else
`endif
`ifdef EN_VC3
`else
`endif
`ifdef EN_VC4
`else
`endif
`ifdef EN_VC5
`else
`endif
`ifdef EN_VC6
`else
`endif
`ifdef EN_VC7
`else
`endif
localparam qgdb09f = 49,nrd84f8 = 32'hfdffd28b;
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
`ifdef VC1
`else
`endif
`ifndef VC1
`ifdef VC2
`else
`ifdef VC3
`else
`ifdef VC4
`else   // 5 - 8
`endif
`endif
`endif
`endif
`ifdef VC1   //VC0 only
`else
`endif
`ifdef VC1   //VC0 only
`else
`endif
`ifdef VC1
`else
`ifdef EN_VC1
`endif
`ifdef EN_VC2
`endif
`ifdef EN_VC3
`endif
`ifdef EN_VC4
`endif
`ifdef EN_VC5
`endif
`ifdef EN_VC6
`endif
`ifdef EN_VC7
`endif
`endif
`ifndef VC1
`endif
`ifdef VC1   //VC0 only
`else
`endif
`ifdef VC1   //VC0 only
`else
`endif
`ifdef VC1   //VC0 only
`else
`endif
`ifdef VC1   //VC0 only
`else
`ifdef EN_VC1
`endif
`ifdef EN_VC2
`endif
`ifdef EN_VC3
`endif
`ifdef EN_VC4
`endif
`ifdef EN_VC5
`endif
`ifdef EN_VC6
`endif
`ifdef EN_VC7
`endif
`endif
`ifdef EN_VC0
`endif
`ifdef EN_VC1
`endif
`ifdef EN_VC2
`endif
`ifdef EN_VC3
`endif
`ifdef EN_VC4
`endif
`ifdef EN_VC5
`endif
`ifdef EN_VC6
`endif
`ifdef EN_VC7
`endif
`ifdef EN_VC0
`else
`endif
`ifdef EN_VC1
`else
`endif
`ifdef EN_VC2
`else
`endif
`ifdef EN_VC3
`else
`endif
`ifdef EN_VC4
`else
`endif
`ifdef EN_VC5
`else
`endif
`ifdef EN_VC6
`else
`endif
`ifdef EN_VC7
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
`ifdef VC1
`else
`endif
`ifndef VC1
`ifdef VC2
`else
`ifdef VC3
`else
`ifdef VC4
`else   // 5 - 8
`endif
`endif
`endif
`endif
always @(posedge sys_clk or negedge rst_n) begin   if (rst_n == 1'b0) begin      dmfe774  <= 1'b0;      hbf3ba3      <= 1'b0;      co9dd1e    <= 1'b0;            db3586    <= xy25710;   end   else begin      dmfe774  <= 1'b0;      hbf3ba3      <= 1'b0;      co9dd1e    <= 1'b0;      case(wl23d30)         xy25710 : begin            dmfe774  <= 1'b1;                        if(an95d4c && bl64b01)               db3586  <= wy2b883;         end         wy2b883 : begin            hbf3ba3    <= 1'b1;                                       if(!bl64b01 || !an95d4c)               db3586  <= xy25710;            else if(alc3f66[0] && ba4f38)               db3586  <= su5c419;         end         su5c419 : begin                        co9dd1e <= 1'b1;            if(!bl64b01 || !an95d4c)               db3586  <= xy25710;         end         default : begin            db3586    <= xy25710;         end      endcase   end
end
always @(posedge sys_clk or negedge rst_n) begin   if (rst_n == 1'b0) begin      co1ac37   <= gbe20c9;      icf078a <= fae495c;      zx74783  <= 1'b0;      qia3c1e <= 1'b0;      ls83c50 <= uvc3724;      ipd61b9 <= 1'b0;      aaf45c       <= 0;   end   else begin      ipd61b9 <= 1'b0;      case(pu1e985)         gbe20c9 : begin            ipd61b9 <= 1'b1;            icf078a <= fae495c;                        if(wl23d30 != su5c419)               aaf45c      <= 0;            if(mt3ce1f && (wl23d30 != xy25710))               co1ac37  <= mg1064c;         end         mg1064c : begin            if(gqa615b) begin               if(kf95ad8) begin                  co1ac37   <= fc83261;                  zx74783  <= 1'b1;                  ls83c50 <= uvc3724;               end            end            else if(lsad6c4) begin               ipd61b9 <= 1'b1;               co1ac37   <= fc83261;               qia3c1e <= 1'b1;               ls83c50 <= uvc3724;            end         end         fc83261 : begin            if(gqa615b) begin               if(ld6b623) begin                  co1ac37   <= vx1930b;                  ls83c50 <= je1b925;               end            end            else if(gb5b11e) begin               co1ac37   <= vx1930b;               ls83c50 <= je1b925;            end         end         vx1930b : begin            if(gqa615b) begin               if(ld6b623) begin                  co1ac37   <= enc985f;                  ls83c50 <= mrdc92b;               end            end            else if(gb5b11e) begin               co1ac37   <= enc985f;               ls83c50 <= mrdc92b;            end         end         enc985f : begin            if((gb5b11e && !gqa615b) || (ld6b623 && gqa615b)) begin               zx74783  <= 1'b0;               qia3c1e <= 1'b0;               if(yke09e7)                   icf078a <= ec24ae2;               if(dmfe774)                  aaf45c       <= 0;               else if(yke09e7 && !ph279c3) begin
`ifdef VC1   //VC0 only
                     aaf45c[0]      <= 1'b1;
`else
                     aaf45c[an8ad7e] <= 1'b1;
`endif
               end               if(ba4f38 || dmfe774 || ph279c3)                    co1ac37   <= gbe20c9;               else                  co1ac37   <= mg1064c;            end         end         default : begin            co1ac37   <= gbe20c9;         end      endcase   end
end
always @(posedge sys_clk or negedge rst_n) begin   if (rst_n == 1'b0) begin      xlb0dcc  <= 1'b0;      fc86e67 <= 0;   end   else begin      if(gqa615b && ld6b623 && (pu1e985 == enc985f))         xlb0dcc  <= 1'b0;      else if(ng30ad8 == alf2ba9)         xlb0dcc  <= 1'b1;            if(hof4c2b)         fc86e67  <= 0;      else if(cm4c960 != RECOVERY)         fc86e67  <= ng30ad8 + 1;   end
end
`ifdef VC1   //VC0 only
   assign xy473e = gq2b61c;   assign ep239f2        = gq2b61c | dmfe774;
`else
   assign xy473e = gq2b61c | ~alc3f66[an8ad7e] ;   assign ep239f2        = gq2b61c | dmfe774 | ~alc3f66[an8ad7e];
`endif
always @(posedge sys_clk or negedge rst_n) begin   if (rst_n == 1'b0) begin      rv3733a   <= 1'b0;      ieb99d7 <= 1'b0;      uvcceb9    <= 1'b0;      me675cd   <= 1'b0;      je3ae68  <= 1'b0;      zxd7342      <= 1'b0;   end   else begin                                                rv3733a  <= zm2580e[xl8e2b5];      if( jc7312e )         ieb99d7 <= 1'b0;               else if(ba4f38 && (pu1e985 == enc985f))         ieb99d7 <= 1'b1;      if( wy98973 ) begin         uvcceb9   <= 1'b0;         me675cd  <= 1'b0;         je3ae68 <= 1'b0;         zxd7342     <= 1'b0;      end      else if(icf078a == fae495c) begin         if((yk72b5b == xl8e2b5) && (kf2c072 || cz60395)) begin            if(pue56b == uvc3724)               uvcceb9   <= 1'b1;            if(pue56b == je1b925)               me675cd   <= 1'b1;            if(pue56b == mrdc92b)               je3ae68  <= 1'b1;         end      end      else begin          if(((yk72b5b == xl8e2b5) && (cz60395 || ls1cad)) || ep856c3)            zxd7342  <= 1'b1;      end   end
end
`ifdef VC1
   assign xl8e2b5  = 3'b000;
`else
   always@(*) begin         xl8e2b5  = 3'b000;         case(an8ad7e)            0 : xl8e2b5  = 3'b000;
`ifdef EN_VC1
               1 : xl8e2b5  = shfd9a1;
`endif
`ifdef EN_VC2
               2 : xl8e2b5  = xjecd0d;
`endif
`ifdef EN_VC3
               3 : xl8e2b5  = xw6686e;
`endif
`ifdef EN_VC4
               4 : xl8e2b5  = wy34373;
`endif
`ifdef EN_VC5
               5 : xl8e2b5  = uxa1b98;
`endif
`ifdef EN_VC6
               6 : xl8e2b5  = wldcc4;
`endif
`ifdef EN_VC7
               7 : xl8e2b5  = fn6e625;
`endif
         endcase   end
`endif
always @(posedge sys_clk or negedge rst_n) begin   if (rst_n == 1'b0) begin      aab9a16  <= 1'b0;      jpcd0b1  <= 1'b0;
`ifndef VC1
         an8ad7e           <= 0;
`endif
      jc42c71        <= 1'b0;      xl1638a         <= os4c2fd;      yk6858e      <= 1'b0;   end   else begin      if(ale70fd == pf617e8) begin
`ifdef VC1   //VC0 only
            jc42c71   <= (ba4f38) ? 1'b0 : 1'b1;
`else
            jc42c71   <= (ba4f38 || !alc3f66[an8ad7e]) ? 1'b0 : 1'b1;
`endif
         if(pu1e985 == gbe20c9)            aab9a16  <= 1'b0;         else if(sh5b0e0 && dzd8704 && qtc3827)            aab9a16  <= 1'b1;         if(pu1e985 == gbe20c9)            jpcd0b1  <= 1'b0;         else if(bn1c13c)            jpcd0b1  <= 1'b1;      end      else if(dmfe774) begin         aab9a16  <= 1'b0;         jpcd0b1  <= 1'b0;         jc42c71        <= 1'b0;      end
`ifdef VC1   //VC0 only
         yk6858e  <= 1'b0;
`else
         if(ale70fd == pf617e8) begin            if(alc3f66[an8ad7e] == 1'b0)                 yk6858e  <= 1'b1;         end         else            yk6858e  <= 1'b0;
`endif
`ifdef VC1   //VC0 only
         case(ale70fd)            os4c2fd : begin               if(!dmfe774 && alc3f66[0] && ~tj387ec[0])                 xl1638a  <= pf617e8;            end            pf617e8 : begin               if((ba4f38 && (pu1e985 == gbe20c9)) || dmfe774)                  xl1638a <= os4c2fd;            end            default : begin               xl1638a         <= os4c2fd;            end         endcase
`else
                           case(ale70fd)            os4c2fd : begin               if(!dmfe774 && alc3f66[an8ad7e] && ~tj387ec[an8ad7e])                 xl1638a  <= pf617e8;                              if(dmfe774)                  an8ad7e   <= 0;               else if((!alc3f66[an8ad7e] || tj387ec[an8ad7e]) && (an8ad7e != 0))                                                an8ad7e   <= (an8ad7e == (`NUM_VC -1)) ? 1 : (an8ad7e + 1);            end            pf617e8 : begin                              if(gq2b61c || (ph279c3 && (pu1e985 == gbe20c9)))                  an8ad7e   <= (an8ad7e == (`NUM_VC -1)) ? 1 : (an8ad7e + 1);               if(((ba4f38 || ph279c3) && (pu1e985 == gbe20c9)) || dmfe774)                  xl1638a <= os4c2fd;            end            default : begin               xl1638a         <= os4c2fd;            end         endcase
`endif
   end
end
always @(posedge sys_clk or negedge rst_n) begin   if (rst_n == 1'b0) begin      tw1e0f1      <= 3'b000;      mtb1c56              <= {(`NUM_VC){1'b0}};      ls1e282       <= {(`NUM_VC){1'b1}};   end   else begin      ls1e282     <= ~tj387ec;
`ifdef VC1   //VC0 only
         tw1e0f1  <= 3'b000;
`else
         if(pu1e985 == gbe20c9) begin            case(an8ad7e)                0 : tw1e0f1    <= 3'b000;
`ifdef EN_VC1
                  1 : tw1e0f1    <= 3'd1;
`endif
`ifdef EN_VC2
                  2 : tw1e0f1    <= 3'd2;
`endif
`ifdef EN_VC3
                  3 : tw1e0f1    <= 3'd3;
`endif
`ifdef EN_VC4
                  4 : tw1e0f1    <= 3'd4;
`endif
`ifdef EN_VC5
                  5 : tw1e0f1    <= 3'd5;
`endif
`ifdef EN_VC6
                  6 : tw1e0f1    <= 3'd6;
`endif
`ifdef EN_VC7
                  7 : tw1e0f1    <= 3'd7;
`endif
            endcase         end
`endif
`ifdef EN_VC0
                  if(dmfe774)            mtb1c56[0]  <= 1'b0;                  else if(gq2b61c)            mtb1c56[0] <= 1'b1;
`endif
`ifdef EN_VC1
         if(dmfe774 || !alc3f66[1])            mtb1c56[1]  <= 1'b0;         else if(gq2b61c && (an8ad7e == 1))            mtb1c56[1] <= 1'b1;
`endif
`ifdef EN_VC2
         if(dmfe774 || !alc3f66[2])            mtb1c56[2]  <= 1'b0;         else if(gq2b61c && (an8ad7e == 2))            mtb1c56[2] <= 1'b1;
`endif
`ifdef EN_VC3
         if(dmfe774 || !alc3f66[3])            mtb1c56[3]  <= 1'b0;         else if(gq2b61c && (an8ad7e == 3))            mtb1c56[3] <= 1'b1;
`endif
`ifdef EN_VC4
         if(dmfe774 || !alc3f66[4])            mtb1c56[4]  <= 1'b0;         else if(gq2b61c && (an8ad7e == 4))            mtb1c56[4] <= 1'b1;
`endif
`ifdef EN_VC5
         if(dmfe774 || !alc3f66[5])            mtb1c56[5]  <= 1'b0;         else if(gq2b61c && (an8ad7e == 5))            mtb1c56[5] <= 1'b1;
`endif
`ifdef EN_VC6
         if(dmfe774 || !alc3f66[6])            mtb1c56[6]  <= 1'b0;         else if(gq2b61c && (an8ad7e == 6))            mtb1c56[6] <= 1'b1;
`endif
`ifdef EN_VC7
         if(dmfe774 || !alc3f66[7])            mtb1c56[7]  <= 1'b0;         else if(gq2b61c && (an8ad7e == 7))            mtb1c56[7] <= 1'b1;
`endif
   end
end
`ifdef EN_VC0
   assign hof43fe    = cz75325[2:0];   assign hb7e87f[0] = kfaea64[0];
`else
   assign hof43fe    = 3'b000;   assign hb7e87f[0] = 1'b0;
`endif
`ifdef EN_VC1
   assign epa1ff2    = cz75325[5:3];   assign hb7e87f[1] = kfaea64[1];
`else
   assign epa1ff2    = 3'b000;   assign hb7e87f[1] = 1'b0;
`endif
`ifdef EN_VC2
   assign wyff94    = cz75325[8:6];   assign hb7e87f[2] = kfaea64[2];
`else
   assign wyff94    = 3'b000;   assign hb7e87f[2] = 1'b0;
`endif
`ifdef EN_VC3
   assign al7fca0    = cz75325[11:9];   assign hb7e87f[3] = kfaea64[3];
`else
   assign al7fca0    = 3'b000;   assign hb7e87f[3] = 1'b0;
`endif
`ifdef EN_VC4
   assign dmfe504    = cz75325[14:12];   assign hb7e87f[4] = kfaea64[4];
`else
   assign dmfe504    = 3'b000;   assign hb7e87f[4] = 1'b0;
`endif
`ifdef EN_VC5
   assign gbf2823    = cz75325[17:15];   assign hb7e87f[5] = kfaea64[5];
`else
   assign gbf2823    = 3'b000;   assign hb7e87f[5] = 1'b0;
`endif
`ifdef EN_VC6
   assign xl9411c    = cz75325[20:18];   assign hb7e87f[6] = kfaea64[6];
`else
   assign xl9411c    = 3'b000;   assign hb7e87f[6] = 1'b0;
`endif
`ifdef EN_VC7
   assign rva08e7    = cz75325[23:21];   assign hb7e87f[7] = kfaea64[7];
`else
   assign rva08e7    = 3'b000;   assign hb7e87f[7] = 1'b0;
`endif
always @(wl23d30 or pu1e985 or ale70fd) begin   case(wl23d30)      xy25710 : db1cf95 = "INACTIVE";      wy2b883     : db1cf95 = "  INIT  ";      su5c419   : db1cf95 = " ACTIVE ";   endcase   case(pu1e985)      gbe20c9  : mre7cae = "IDLE";      mg1064c     : mre7cae = " P  ";      fc83261    : mre7cae = " NP ";      vx1930b   : mre7cae = " CPL";      enc985f : mre7cae = "CHCK";   endcase   case(ale70fd)      os4c2fd : mg3e575 = "IDLE";      pf617e8 : mg3e575 = "WAIT";   endcase
end
always@* begin alf2ba9<={oh362e6>>1,ld7b613[0]};an95d4c<=ld7b613[1];kfaea64<={tj8b9ac>>1,ld7b613[2]};cz75325<={ay5cd66>>1,ld7b613[3]};cm4c960<={phy_ltssm_state>>1,ld7b613[4]};bl64b01<=ld7b613[5];zm2580e<={mgacc3b>>1,ld7b613[6]};kf2c072<=ld7b613[7];cz60395<=ld7b613[8];ls1cad<=ld7b613[9];pue56b<={sj397d1>>1,ld7b613[10]};yk72b5b<={hbd84c9>>1,ld7b613[11]};kf95ad8<=ld7b613[12];lsad6c4<=ld7b613[13];ld6b623<=ld7b613[14];gb5b11e<=ld7b613[15];ldd88f4<=ld7b613[16];wwc47a6<=ld7b613[17];wl23d30<={db3586>>1,ld7b613[18]};pu1e985<={co1ac37>>1,ld7b613[19]};hof4c2b<=ld7b613[20];gqa615b<=ld7b613[21];ng30ad8<={fc86e67>>1,ld7b613[22]};ep856c3<=ld7b613[23];gq2b61c<=ld7b613[24];sh5b0e0<=ld7b613[25];dzd8704<=ld7b613[26];qtc3827<=ld7b613[27];bn1c13c<=ld7b613[28];yke09e7<=ld7b613[29];ba4f38<=ld7b613[30];ph279c3<=ld7b613[31];mt3ce1f<=ld7b613[32];ale70fd<=ld7b613[33];tj387ec<={mtb1c56>>1,ld7b613[34]};alc3f66<={hb7e87f>>1,ld7b613[35]};aa1fb34<={hof43fe>>1,ld7b613[36]};shfd9a1<={epa1ff2>>1,ld7b613[37]};xjecd0d<={wyff94>>1,ld7b613[38]};xw6686e<={al7fca0>>1,ld7b613[39]};wy34373<={dmfe504>>1,ld7b613[40]};uxa1b98<={gbf2823>>1,ld7b613[41]};wldcc4<={xl9411c>>1,ld7b613[42]};fn6e625<={rva08e7>>1,ld7b613[43]};jc7312e<=ld7b613[44];wy98973<=ld7b613[45];goc4b98<={db1cf95>>1,ld7b613[46]};ba25cc1<={mre7cae>>1,ld7b613[47]};ym2e60a<={mg3e575>>1,ld7b613[48]};end
always@* begin necf6c2[2047]<=mtb1735;necf6c2[2046]<=tj8b9ac[0];necf6c2[2044]<=ay5cd66[0];necf6c2[2040]<=phy_ltssm_state[0];necf6c2[2032]<=ls35987;necf6c2[2017]<=mgacc3b[0];necf6c2[1987]<=qgcbe8c;necf6c2[1950]<=ep239f2;necf6c2[1926]<=fn5f460;necf6c2[1853]<=db1cf95[1];necf6c2[1839]<=wyff94[0];necf6c2[1818]<=rv3733a;necf6c2[1804]<=ayfa306;necf6c2[1707]<=aab9a16;necf6c2[1658]<=mre7cae[1];necf6c2[1630]<=al7fca0[0];necf6c2[1614]<=yx4e2a2;necf6c2[1589]<=ieb99d7;necf6c2[1561]<=sj397d1[0];necf6c2[1511]<=rva08e7[0];necf6c2[1483]<=hof43fe[0];necf6c2[1394]<=mtb1c56[0];necf6c2[1372]<=jc42c71;necf6c2[1367]<=jpcd0b1;necf6c2[1269]<=mg3e575[1];necf6c2[1251]<=ipd61b9;necf6c2[1212]<=dmfe504[0];necf6c2[1180]<=al7fcee;necf6c2[1130]<=uvcceb9;necf6c2[1074]<=hbd84c9[0];necf6c2[1023]<=oh362e6[0];necf6c2[975]<=xy473e;necf6c2[919]<=epa1ff2[0];necf6c2[909]<=fc86e67[0];necf6c2[853]<=zxd7342;necf6c2[807]<=qtc9ff3;necf6c2[755]<=xl9411c[0];necf6c2[741]<=hb7e87f[0];necf6c2[697]<=xl1638a;necf6c2[686]<=yk6858e;necf6c2[625]<=co1ac37[0];necf6c2[454]<=xlb0dcc;necf6c2[426]<=je3ae68;necf6c2[403]<=do993fe;necf6c2[377]<=gbf2823[0];necf6c2[312]<=db3586[0];necf6c2[213]<=me675cd;necf6c2[201]<=jr1327f;necf6c2[100]<=xjc264f;end         assign suff972 = necf6c2,ld7b613 = cme5c87;   initial begin   jcc030e = $fopen(".fred");   $fdisplay( jcc030e, "%3h\n%3h", (thc27c7 >> 4) & fnc7fe5, (thc27c7 >> (mt9f1ff+4)) & fnc7fe5 );   $fclose(jcc030e);   $readmemh(".fred", qg721c0);   end   always @ (suff972) begin   ym8700c = qg721c0[1];       for (vk1872=0; vk1872<qgdb09f; vk1872=vk1872+1) begin           cme5c87[vk1872] = suff972[ym8700c];       rv38061  = ^(ym8700c & qg721c0[0]);       ym8700c =  {ym8700c, rv38061};       end   end
endmodule