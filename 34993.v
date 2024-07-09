module ir1d094 (
    sys_clk,
    rst_n,
    xl2d776,
    xw5ddbf,
    ps76fd3,
    rvbf4d2,
    ald34b9,
    rtd2e64,
    wyb9938,
    bl64e0d,
    bn38376,
    irddb1,
    by76c6f
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
localparam sh702ed = 4'd0 ;
localparam ph8176c  = 4'd1 ;
localparam ribb66  = 4'd2 ;
localparam lq5db32  = 4'd3 ;
localparam yxed992 = 4'd4 ;
localparam fa6cc94  = 4'd5 ;
localparam jc664a2   = 4'd6 ;
localparam nt32512   = 4'd7 ;
localparam co92897   = 4'd8 ;
localparam fp944b9   = 4'd9 ;
localparam baa25cf   = 4'd10 ;
localparam an12e7a   = 4'd11 ;
input                     sys_clk;
input                     rst_n;
input   [15:0]            xl2d776;
input   [1:0]             xw5ddbf;
output                    ps76fd3 ;
output                    rvbf4d2 ;
output                    ald34b9 ;
output  [7:0]             rtd2e64;
output                    wyb9938;
output  [7:0]             bl64e0d;
output                    bn38376;
output  [7:0]             irddb1;
output  [7:0]             by76c6f;
wire                  pu11cec ;
wire                  bn8e762 ;
wire                  rg73b17 ;
wire                  ec9d8ba ;
wire                  vvec5d0 ;
wire                  kq62e87 ;
wire                  yz17439 ;
wire                  vxba1cc ;
wire                  tud0e67 ;
wire                  ec8733a ;
wire                  mt399d1 ;
wire                  alcce8d ;
wire                  ic6746d ;
wire                  do3a368 ;
wire                  ead1b43 ;
wire                  ou8da18 ;
wire                  qg6d0c1 ;
reg                   ps76fd3 ;
reg                   rvbf4d2 ;
reg                   ald34b9 ;
reg  [7:0]            rtd2e64;
reg  [7:0]            bl64e0d;
reg                   wyb9938;
reg                   bn38376;
reg  [7:0]            irddb1;
reg  [7:0]            by76c6f;
reg                   go46050 ;
reg [3:0]             ba30281 ;
reg                   jr8140a ;
reg                   uka056 ;
reg                   pf502b1 ;
reg [7:0]             fp8158f;
reg [7:0]             ouac7e;
reg                   me563f0;
reg                   cbb1f80;
reg [7:0]             ux8fc05;
reg [7:0]             ld7e02c;
reg [15 : 0] qgf0167;
reg [1 : 0] yz80b38;
reg ou59c5;
reg oh2ce29;
reg cm6714c;
reg jr38a60;
reg byc5307;
reg kf2983a;
reg ww4c1d4;
reg al60ea0;
reg sj7504;
reg tw3a825;
reg ykd412a;
reg zza0951;
reg je4a8e;
reg zm25473;
reg ng2a39b;
reg wj51cda;
reg fp8e6d4;
reg xw736a7;
reg [3 : 0] hd9b53b;
reg rgda9de;
reg wwd4ef3;
reg doa7798;
reg [7 : 0] ou3bcc2;
reg [7 : 0] kqde610;
reg rtf3080;
reg ie98407;
reg [7 : 0] fnc2039;
reg [7 : 0] sw101cf;
reg [2047:0] necf6c2;
wire [29:0] ld7b613;
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
localparam qgdb09f = 30,nrd84f8 = 32'hfdfff40b;
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
assign pu11cec = (yz80b38[0] & (qgf0167[7:0]  ==K28_5)) ;
assign bn8e762 = (yz80b38[1] & (qgf0167[15:8] ==K28_5)) ;
assign rg73b17 = (~yz80b38[0] & (qgf0167[7:0]  == D10_2)) ;
assign ec9d8ba = (~yz80b38[1] & (qgf0167[15:8] == D10_2)) ;
assign vvec5d0  = cm6714c & jr38a60 ;
assign kq62e87 = (~yz80b38[0] & (qgf0167[7:0]  == D5_2)) ;
assign yz17439 = (~yz80b38[1] & (qgf0167[15:8] == D5_2)) ;
assign vxba1cc  = kf2983a & ww4c1d4 ;
assign tud0e67 = (~yz80b38[0] & (qgf0167[7:0]  == D21_5)) ;
assign ec8733a = (~yz80b38[1] & (qgf0167[15:8] == D21_5)) ;
assign mt399d1  = sj7504 & tw3a825 ;
assign alcce8d = (~yz80b38[0] & (qgf0167[7:0]  == D26_5)) ;
assign ic6746d = (~yz80b38[1] & (qgf0167[15:8] == D26_5)) ;
assign do3a368  = zza0951 & je4a8e ;
assign ead1b43  = cm6714c | sj7504  | kf2983a | zza0951 ;
assign ou8da18  = jr38a60 | tw3a825  | ww4c1d4 | je4a8e ;
assign qg6d0c1   = byc5307  | ykd412a   | al60ea0  | zm25473 ;
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      ba30281    <= sh702ed;   end   else begin      case(hd9b53b)                              sh702ed:                                if (oh2ce29)                           ba30281 <= ph8176c;            else if (ou59c5)                      ba30281 <= ribb66;            else               ba30281 <= sh702ed;         ph8176c:                                  if (!yz80b38[0])               ba30281 <= yxed992;            else if (oh2ce29)                       ba30281 <= ph8176c;            else if (ou59c5)                       ba30281 <= ribb66;            else               ba30281 <= sh702ed;         ribb66:                                  if (oh2ce29)                            ba30281 <= ph8176c;            else if (ou59c5)                       ba30281 <= ribb66;            else               ba30281 <= lq5db32;         lq5db32:                                  if (!yz80b38[1])               ba30281 <= fa6cc94;            else if (oh2ce29)                       ba30281 <= ph8176c;            else if (ou59c5)                       ba30281 <= ribb66;            else               ba30281 <= sh702ed;         yxed992:                                  if (oh2ce29)                             ba30281 <= ph8176c;            else if (ou59c5)                        ba30281 <= ribb66;                        else if ((yz80b38 == 2'b00) && (qgf0167[9] == 1'b1) && !xw736a7)                    ba30281 <= jc664a2;                else if ((yz80b38 == 2'b00) && (qgf0167[1] == 1'b1) && xw736a7)                     ba30281 <= fa6cc94;            else               ba30281 <= sh702ed;         fa6cc94:                                  if (oh2ce29)                            ba30281 <= ph8176c;            else if (ou59c5)                      ba30281 <= ribb66;    else               ba30281 <= jc664a2;         jc664a2:            if (fp8e6d4 && !xw736a7)               ba30281    <= nt32512;            else if (ng2a39b && xw736a7)               ba30281 <= nt32512;            else               ba30281 <= sh702ed;         nt32512:            if (fp8e6d4)               ba30281 <= co92897;            else               ba30281 <= sh702ed;         co92897:            if (fp8e6d4)               ba30281 <= fp944b9;            else               ba30281 <= sh702ed;         fp944b9:            if (fp8e6d4)               ba30281 <= baa25cf;            else               ba30281 <= sh702ed;         baa25cf:            if (ou59c5)                              ba30281 <= ribb66;            else               ba30281 <= sh702ed;         default:            ba30281    <= sh702ed;      endcase   end
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n)      go46050  <= 1'b0;      else begin      if (ou59c5)         go46050  <= 1'b1;      else if(oh2ce29)         go46050  <= 1'b0;   end
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n)      jr8140a  <= 1'b0;   else if ((hd9b53b == baa25cf) && (byc5307 || ykd412a))      jr8140a  <= 1'b1;   else if ((hd9b53b == baa25cf) && (jr38a60 || tw3a825) && xw736a7)      jr8140a <= 1'b1;   else      jr8140a  <= 1'b0;
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n)      uka056  <= 1'b0;   else if ((hd9b53b == baa25cf) && (al60ea0 ||zm25473))      uka056  <= 1'b1;   else if ((hd9b53b == baa25cf) && (ww4c1d4 || je4a8e) && xw736a7)      uka056 <= 1'b1;   else      uka056  <= 1'b0;
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n)      pf502b1  <= 1'b0;   else if ((hd9b53b == baa25cf) && (ykd412a || zm25473))      pf502b1  <= 1'b1;   else if ((hd9b53b == baa25cf) && (tw3a825 || je4a8e) && xw736a7)      pf502b1 <= 1'b1;   else      pf502b1  <= 1'b0;
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      ps76fd3   <= 1'b0;      rvbf4d2   <= 1'b0;      ald34b9 <= 1'b0;   end   else begin      ps76fd3   <= rgda9de;      rvbf4d2   <= wwd4ef3;      ald34b9 <= doa7798;   end
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      fp8158f       <= 8'h00;      me563f0 <= 1'b0;   end                           else if (oh2ce29) begin      fp8158f       <= qgf0167[7:0];      me563f0 <= yz80b38[0];   end   else if (xw736a7 && (hd9b53b == ribb66)) begin      fp8158f       <= qgf0167[15:8];      me563f0 <= yz80b38[1];   end   else begin      fp8158f       <= ou3bcc2;      me563f0 <= rtf3080;   end
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      ouac7e       <= 8'h00;      cbb1f80 <= 1'b0;   end   else if (xw736a7 && (hd9b53b == ribb66)) begin      ouac7e       <= qgf0167[7:0];      cbb1f80 <= yz80b38[0];   end   else if (!xw736a7 && (hd9b53b == ph8176c)) begin      ouac7e       <= qgf0167[15:8];      cbb1f80 <= yz80b38[1];   end   else begin      ouac7e       <= kqde610;      cbb1f80 <= ie98407;   end
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n)      ux8fc05 <= 8'h00;   else if (!xw736a7 && (hd9b53b == ph8176c))      ux8fc05 <= qgf0167[7:0];   else if (xw736a7 && (hd9b53b == lq5db32))      ux8fc05 <= qgf0167[15:8];   else      ux8fc05 <= fnc2039;
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n)      ld7e02c <= 8'h00;   else if (!xw736a7 && (hd9b53b == yxed992))      ld7e02c <= qgf0167[7:0];   else if (xw736a7 && (hd9b53b == fa6cc94))      ld7e02c <= qgf0167[15:8];   else      ld7e02c <= sw101cf;
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      rtd2e64       <= 8'h00;      wyb9938 <= 1'b0;      bl64e0d       <= 8'h00;      bn38376 <= 1'b0;      irddb1       <= 8'h00;      by76c6f       <= 8'h00;   end   else if (rgda9de || wwd4ef3 || ald34b9)  begin      rtd2e64       <= ou3bcc2;      wyb9938 <= rtf3080;      bl64e0d       <= kqde610;      bn38376 <= ie98407;      irddb1       <= fnc2039;      by76c6f       <= sw101cf;   end
end
always@* begin qgf0167<={xl2d776>>1,ld7b613[0]};yz80b38<={xw5ddbf>>1,ld7b613[1]};ou59c5<=ld7b613[2];oh2ce29<=ld7b613[3];cm6714c<=ld7b613[4];jr38a60<=ld7b613[5];byc5307<=ld7b613[6];kf2983a<=ld7b613[7];ww4c1d4<=ld7b613[8];al60ea0<=ld7b613[9];sj7504<=ld7b613[10];tw3a825<=ld7b613[11];ykd412a<=ld7b613[12];zza0951<=ld7b613[13];je4a8e<=ld7b613[14];zm25473<=ld7b613[15];ng2a39b<=ld7b613[16];wj51cda<=ld7b613[17];fp8e6d4<=ld7b613[18];xw736a7<=ld7b613[19];hd9b53b<={ba30281>>1,ld7b613[20]};rgda9de<=ld7b613[21];wwd4ef3<=ld7b613[22];doa7798<=ld7b613[23];ou3bcc2<={fp8158f>>1,ld7b613[24]};kqde610<={ouac7e>>1,ld7b613[25]};rtf3080<=ld7b613[26];ie98407<=ld7b613[27];fnc2039<={ux8fc05>>1,ld7b613[28]};sw101cf<={ld7e02c>>1,ld7b613[29]};end
always@* begin necf6c2[2047]<=xw5ddbf[0];necf6c2[2046]<=pu11cec;necf6c2[2044]<=bn8e762;necf6c2[2040]<=rg73b17;necf6c2[2032]<=ec9d8ba;necf6c2[2016]<=vvec5d0;necf6c2[1984]<=kq62e87;necf6c2[1941]<=me563f0;necf6c2[1920]<=yz17439;necf6c2[1835]<=cbb1f80;necf6c2[1793]<=vxba1cc;necf6c2[1679]<=go46050;necf6c2[1623]<=ux8fc05[0];necf6c2[1539]<=tud0e67;necf6c2[1310]<=ba30281[0];necf6c2[1199]<=ld7e02c[0];necf6c2[1145]<=uka056;necf6c2[1030]<=ec8733a;necf6c2[1023]<=xl2d776[0];necf6c2[970]<=ouac7e[0];necf6c2[839]<=qg6d0c1;necf6c2[572]<=jr8140a;necf6c2[485]<=fp8158f[0];necf6c2[419]<=ou8da18;necf6c2[242]<=pf502b1;necf6c2[209]<=ead1b43;necf6c2[104]<=do3a368;necf6c2[52]<=ic6746d;necf6c2[26]<=alcce8d;necf6c2[13]<=mt399d1;end         assign suff972 = necf6c2,ld7b613 = cme5c87;   initial begin   jcc030e = $fopen(".fred");   $fdisplay( jcc030e, "%3h\n%3h", (thc27c7 >> 4) & fnc7fe5, (thc27c7 >> (mt9f1ff+4)) & fnc7fe5 );   $fclose(jcc030e);   $readmemh(".fred", qg721c0);   end   always @ (suff972) begin   ym8700c = qg721c0[1];       for (vk1872=0; vk1872<qgdb09f; vk1872=vk1872+1) begin           cme5c87[vk1872] = suff972[ym8700c];       rv38061  = ^(ym8700c & qg721c0[0]);       ym8700c =  {ym8700c, rv38061};       end   end
endmodule