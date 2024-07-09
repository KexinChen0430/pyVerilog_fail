module nt22160
   (
   sys_clk,
   rst_n,
   sj2c185,
   of60c2d,
   bn616c,
   ng30b67,
   ep85b3b,
   nt2d9dd,
   vi6ceee,
   go67772,
   mg3bb90,
   xjddc80,
   psee406,
   kq72032
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
localparam kf29bd5 = 2'd0 ;
localparam xw4deac = 2'd1 ;
localparam mr6f563 = 2'd0 ;
localparam of7ab1c = 2'd1 ;
input                     sys_clk;
input                     rst_n;
input  [15:0]             sj2c185;
input  [1:0]              of60c2d;
input  [1:0]              bn616c;
output [15:0]             ng30b67;
output                    ep85b3b;
output                    nt2d9dd;
output [15:0]             vi6ceee;
output                    go67772;
output                    mg3bb90;
output                    xjddc80;
output                    psee406;
output                    kq72032;
wire                      mg3bb90;
wire                      xjddc80;
wire                      psee406;
wire                      kq72032;
reg    [1:0]              uxbb303;
reg    [1:0]              mrd981d;
reg                       gbcc0ec;
reg                       cz60764;
reg                       nt3b25;
reg                       cb1d92e;
reg                       fnec974;
reg                       ld64ba6;
reg    [7:0]              ba25d36;
reg                       ym2e9b2;
reg    [15:0]             ng30b67;
reg                       mga6c8f;
reg                       oh36479;
reg    [15:0]             vi6ceee;
reg                       go67772;
reg                       an8f35e;
reg                       jc79af5;
reg                       dzcd7ab;
wire   [15:0]             fn6bd5e;
reg [15 : 0] of5eaf7;
reg [1 : 0] ykf57bd;
reg [1 : 0] kfabde8;
reg [1 : 0] cz5ef45;
reg [1 : 0] ipf7a2d;
reg lsbd16c;
reg ofe8b62;
reg fn45b14;
reg vx2d8a7;
reg ho6c53e;
reg cm629f3;
reg [7 : 0] ls14f99;
reg twa7cca;
reg qi3e653;
reg hbf3299;
reg hq994cf;
reg vica67b;
reg ui533db;
reg [15 : 0] ng99ed8;
reg [2047:0] necf6c2;
wire [18:0] ld7b613;
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
localparam qgdb09f = 19,nrd84f8 = 32'hfdfff40b;
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
assign fn6bd5e = {of5eaf7[15:11], (of5eaf7[10:9] ^ kfabde8), of5eaf7[8:2], (of5eaf7[1:0] ^ kfabde8)};
assign wyb32ff = ((ng99ed8[7:0]   == K28_2) & ykf57bd[0]);
assign cmff2c7 = ((ng99ed8[15:8]  == K28_2) & ykf57bd[1]);
assign pfc738a = ((ng99ed8[7:0]   == K27_7) & ykf57bd[0]);
assign kf8af4e = ((ng99ed8[15:8]  == K27_7) & ykf57bd[1]);
assign gb4e8d6 =  ((ng99ed8[7:0]   == K29_7) & ykf57bd[0]);
assign uvd6981 =  ((ng99ed8[15:8]  == K29_7) & ykf57bd[1]);
assign rv81b42 = ((ng99ed8[7:0]   == K30_7) & ykf57bd[0]);
assign jc42f49 = ((ng99ed8[15:8]  == K30_7) & ykf57bd[1]);
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      ba25d36  <= 8'd0;      ym2e9b2   <= 1'd0;   end   else begin      ba25d36  <= ng99ed8[7:0];      ym2e9b2   <= kfabde8[0];   end
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      uxbb303      <= kf29bd5;      gbcc0ec    <= 1'b0;      ng30b67   <= 16'd0;      mga6c8f    <= 1'b0;      nt3b25         <= 1'b0;      fnec974    <= 1'b0;   end   else begin      case(cz5ef45)         kf29bd5: begin            mga6c8f    <= 1'b0;            nt3b25         <= 1'b0;            if (cmff2c7) begin               uxbb303   <= xw4deac;               gbcc0ec <= 1'b1;               fnec974 <= kfabde8[1];            end            else if (wyb32ff) begin               uxbb303   <= xw4deac;               gbcc0ec <= 1'b0;               fnec974 <= kfabde8[0];            end            else  begin               uxbb303   <= kf29bd5;               gbcc0ec <= 1'b0;               fnec974 <= 1'b0;            end          end         xw4deac: begin            fnec974     <= 1'b0;            if (uvd6981 && wyb32ff) begin               uxbb303    <= xw4deac;               gbcc0ec  <= 1'b0;               mga6c8f  <= 1'b0;               nt3b25       <= 1'b0;            end            else if (uvd6981 && ~wyb32ff) begin               uxbb303    <= kf29bd5;               gbcc0ec  <= 1'b0;               mga6c8f  <= 1'b0;               nt3b25       <= 1'b0;            end            else if (gb4e8d6) begin               uxbb303    <= kf29bd5;               ng30b67 <= {ls14f99[7:0],ng99ed8[15:8]};               gbcc0ec  <= 1'b0;               mga6c8f  <= 1'b1;               nt3b25       <= |{twa7cca,kfabde8[1], ho6c53e};            end            else begin               uxbb303    <= xw4deac;               ng30b67 <= (lsbd16c) ? {ls14f99[7:0],ng99ed8[15:8]} : ng99ed8;               mga6c8f  <= 1'b1;               nt3b25       <= (lsbd16c) ? |{twa7cca,kfabde8[1],ho6c53e} : |{|kfabde8, ho6c53e};            end          end          default: begin               uxbb303   <= kf29bd5;               gbcc0ec <= 1'b0;               mga6c8f <= 1'b0;               nt3b25      <= 1'b0;          end      endcase   end
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      mrd981d    <= mr6f563;      cz60764  <= 1'b0;      vi6ceee <= 16'd0;      go67772  <= 1'b0;      cb1d92e       <= 1'b0;      ld64ba6  <= 1'b0;   end   else begin      case(ipf7a2d)         mr6f563: begin            go67772    <= 1'b0;            cb1d92e         <= 1'b0;            if (kf8af4e) begin               mrd981d   <= of7ab1c;               cz60764 <= 1'b1;               ld64ba6 <= kfabde8[1];            end            else if (pfc738a) begin               mrd981d   <= of7ab1c;               cz60764 <= 1'b0;               ld64ba6 <= kfabde8[0];            end            else  begin               mrd981d   <= mr6f563;               cz60764 <= 1'b0;               ld64ba6 <= 1'b0;            end         end         of7ab1c: begin               ld64ba6 <= 1'b0;            if ((uvd6981 || jc42f49) && pfc738a) begin               mrd981d    <= of7ab1c;               cz60764  <= 1'b0;               go67772  <= 1'b0;               cb1d92e       <= 1'b0;            end            else if ((uvd6981 || jc42f49) && ~pfc738a) begin               mrd981d    <= mr6f563;               cz60764  <= 1'b0;               go67772  <= 1'b0;               cb1d92e       <= 1'b0;            end            else if (gb4e8d6 || rv81b42) begin               mrd981d    <= mr6f563;               vi6ceee <= {ls14f99[7:0],ng99ed8[15:8]};               go67772  <= 1'b1;               cb1d92e       <= |{twa7cca,kfabde8[1],cm629f3};            end            else begin               mrd981d    <= of7ab1c;               vi6ceee <= (ofe8b62) ? {ls14f99[7:0],ng99ed8[15:8]} : ng99ed8;               go67772  <= 1'b1;               cb1d92e       <= (ofe8b62) ? |{twa7cca,kfabde8[1],cm629f3} : |{|kfabde8,cm629f3};            end          end          default: begin               mrd981d    <= mr6f563;               cz60764  <= 1'b0;               go67772  <= 1'b0;               cb1d92e       <= 1'b0;          end      endcase   end
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      oh36479 <= 1'd0;      an8f35e <= 1'd0;      jc79af5  <= 1'd0;      dzcd7ab  <= 1'd0;   end   else begin      oh36479 <= qi3e653;      an8f35e <= go67772;      jc79af5  <= gb4e8d6;      dzcd7ab  <= rv81b42;   end
end
assign  ep85b3b    = qi3e653 & !hbf3299;
assign  nt2d9dd   = (qi3e653) ? (vica67b | uvd6981) : 1'b0;
assign  mg3bb90         = go67772 & !hq994cf;
assign  xjddc80        = (go67772) ? (vica67b | uvd6981) : 1'b0;
assign  psee406        = (go67772) ? (ui533db | jc42f49) : 1'b0;
assign  kq72032       = (fn45b14 | vx2d8a7);
always@* begin of5eaf7<={sj2c185>>1,ld7b613[0]};ykf57bd<={of60c2d>>1,ld7b613[1]};kfabde8<={bn616c>>1,ld7b613[2]};cz5ef45<={uxbb303>>1,ld7b613[3]};ipf7a2d<={mrd981d>>1,ld7b613[4]};lsbd16c<=ld7b613[5];ofe8b62<=ld7b613[6];fn45b14<=ld7b613[7];vx2d8a7<=ld7b613[8];ho6c53e<=ld7b613[9];cm629f3<=ld7b613[10];ls14f99<={ba25d36>>1,ld7b613[11]};twa7cca<=ld7b613[12];qi3e653<=ld7b613[13];hbf3299<=ld7b613[14];hq994cf<=ld7b613[15];vica67b<=ld7b613[16];ui533db<=ld7b613[17];ng99ed8<={fn6bd5e>>1,ld7b613[18]};end
always@* begin necf6c2[2047]<=of60c2d[0];necf6c2[2046]<=bn616c[0];necf6c2[2044]<=uxbb303[0];necf6c2[2040]<=mrd981d[0];necf6c2[2032]<=gbcc0ec;necf6c2[2016]<=cz60764;necf6c2[1984]<=nt3b25;necf6c2[1920]<=cb1d92e;necf6c2[1793]<=fnec974;necf6c2[1539]<=ld64ba6;necf6c2[1030]<=ba25d36[0];necf6c2[1023]<=sj2c185[0];necf6c2[839]<=fn6bd5e[0];necf6c2[419]<=dzcd7ab;necf6c2[209]<=jc79af5;necf6c2[104]<=an8f35e;necf6c2[52]<=oh36479;necf6c2[26]<=mga6c8f;necf6c2[13]<=ym2e9b2;end         assign suff972 = necf6c2,ld7b613 = cme5c87;   initial begin   jcc030e = $fopen(".fred");   $fdisplay( jcc030e, "%3h\n%3h", (thc27c7 >> 4) & fnc7fe5, (thc27c7 >> (mt9f1ff+4)) & fnc7fe5 );   $fclose(jcc030e);   $readmemh(".fred", qg721c0);   end   always @ (suff972) begin   ym8700c = qg721c0[1];       for (vk1872=0; vk1872<qgdb09f; vk1872=vk1872+1) begin           cme5c87[vk1872] = suff972[ym8700c];       rv38061  = ^(ym8700c & qg721c0[0]);       ym8700c =  {ym8700c, rv38061};       end   end
endmodule