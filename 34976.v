module pu11dfd (
   input wire         bn8efea ,
   input wire         me77f56 ,
   input wire         tjbfab0 ,
   input wire         alfd586 ,
   input wire         rst_n ,
   input wire         os561a1,
   input wire         psda058 ,
   input wire         hd94dca ,
   input wire [15:0]  sw3423a ,
   input wire [1:0]   oha11d0 ,
   input wire [1:0]   ep8e85 ,
   input wire         ps4742d,
   input wire [7:0]   vk3a16b ,
   input wire         tud0b5b ,
   input wire         gd85ada ,
   input wire         db2d6d5,
   input wire         zx6b6af,
   input wire         of5b57e,
   output wire [15:0] vidabf4 ,
   output wire [1:0]  dmd5fa3 ,
   output wire [1:0]  jrafd1a ,
   output wire [1:0]  vv7e8d7,
   output wire [1:0]  psf46be,
   output wire [1:0]  oua35f2,
   output wire [7:0]  ym1af90 ,
   output wire        dzd7c81 ,
   output reg         mtbe40f ,
   output reg         alf207d     );
wire [10:0]   ep903ed ;
wire [8:0]    vx81f6d ;
wire [1:0]    qifb6f;
reg [7:0]     cm7db78               ;
reg           yxedbc1              ;
reg [7:0]     ea6de0c               ;
reg           cz6f060              ;
reg           kq78304                ;
reg           eac1820                ;
reg           ntc101                ;
reg           gb6080e                ;
reg           ng4074           ;
reg           ba203a2           ;
reg           do1d13           ;
reg           doe89b           ;
reg           fn744da          ;
reg           nga26d6          ;
reg           tj136b2          ;
reg           hd9b596          ;
reg           rgdacb6          ;
reg           yxd65b3          ;
reg           twb2d9c          ;
reg           vk96ce2          ;
reg           cm7842d                    ;
reg           vvc2168                    ;
reg           ri9c4c8                    ;
reg           yxe2643                    ;
reg           db1321c                    ;
reg           hq990e6                    ;
reg           xjc8733                    ;
reg           go4399e                ;
reg           zz1ccf0            ;
reg           hbe6786           ;
reg           wl33c36           ;
reg           vx9e1b4           ;
reg           ykf0da6          ;
reg           ng86d31          ;
reg           cb3698a          ;
reg           qvb4c54           ;
reg           aaa62a5           ;
reg           qi31528           ;
reg           yz8a940           ;
reg qt54a04;
reg jra5024;
reg vifb0a7;
reg zz38bc3;
reg [15 : 0] je49ff;
reg [1 : 0] ym24ffb;
reg [1 : 0] db27fd8;
reg tw3fec7;
reg [7 : 0] ykff63a;
reg rgfb1d1;
reg pfd8e8b;
reg fnc745e;
reg tw3a2f7;
reg cmd17bb;
reg [8 : 0] fp8bdd9;
reg [1 : 0] uv5eece;
reg [7 : 0] wjf7675;
reg yzbb3ad;
reg [7 : 0] shd9d6d;
reg ayceb6c;
reg gb75b60;
reg zmadb05;
reg me6d82a;
reg ne6c150;
reg al60a83;
reg qi541c;
reg zm2a0e0;
reg pf50702;
reg do83817;
reg bn1c0ba;
reg yke05d7;
reg gd2eb9;
reg yz175cc;
reg vxbae64;
reg rtd7326;
reg oub9936;
reg psfb420;
reg xwda103;
reg mt26c6e;
reg oh36375;
reg mtb1bad;
reg uk8dd6d;
reg pf6eb69;
reg qt75b4f;
reg baada7d;
reg cm6d3ea;
reg ps69f51;
reg nr4fa8a;
reg ea7d456;
reg icea2b0;
reg ip51580;
reg an8ac05;
reg ea5602c;
reg rvb0160;
reg gd80b06;
reg [2047:0] necf6c2;
wire [54:0] ld7b613;
localparam qgdb09f = 55,nrd84f8 = 32'hfdffc70b;
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
fnc2d94 rg525e3 (      .rv16ca6        ( qt54a04 ),   .qgffeda        ( me77f56 ),   .rst_n          ( rst_n ),   .hd94dca   ( zz38bc3 ),      .data_in        ( {tw3fec7, db27fd8[1], ym24ffb[1], je49ff[15:8],                      tw3fec7, db27fd8[0], ym24ffb[0], je49ff[7:0]} ),      .dmd02c2       ( ep903ed )   );
fc3ffdb vid0808 (      .qgffeda        ( me77f56 ),   .rst_n          ( rst_n ),      .data_in        ( ep903ed[7:0]),   .kqdb40b       ( ep903ed[8]),   .psda058  ( vifb0a7 ),      .dmd02c2       ( ym1af90 ),   .nt81613      ( dzd7c81 )   );
always @(posedge me77f56, negedge rst_n) begin   if (!rst_n) begin      go4399e <= 1'b0;      mtbe40f <= 1'b0;   end   else begin      go4399e <= ep903ed[9];      mtbe40f <= qt75b4f;   end
end
always @(posedge me77f56, negedge rst_n) begin   if (!rst_n) begin      cm7842d <= 1'b0;      vvc2168 <= 1'b0;      ri9c4c8 <= 1'b0;      yxe2643 <= 1'b0;      db1321c <= 1'b0;      hq990e6 <= 1'b0;      xjc8733 <= 1'b0;      zz1ccf0 <= 1'b1;      hbe6786 <= 1'b1;      wl33c36 <= 1'b1;      vx9e1b4 <= 1'b1;   end   else begin      cm7842d <= zz38bc3;      vvc2168 <= psfb420;      ri9c4c8 <= xwda103;      yxe2643 <= mt26c6e;      db1321c <= oh36375;      hq990e6 <= mtb1bad;      xjc8733 <= uk8dd6d;      zz1ccf0 <= ep903ed[10];      hbe6786 <= tw3fec7;      wl33c36 <= cm6d3ea;      vx9e1b4 <= ps69f51;   end
end
always @(posedge me77f56, negedge rst_n) begin   if (!rst_n)      alf207d <= 1'b1;   else      alf207d <= (jra5024) ? 1'b0: pf6eb69 ? baada7d : nr4fa8a ;
end
always @(posedge alfd586, negedge rst_n) begin   if (!rst_n) begin      cm7db78  <= 8'd0;      yxedbc1 <= 1'b0;      ea6de0c  <= 8'd0;      cz6f060 <= 1'b0;   end   else begin      cm7db78  <= ykff63a;      yxedbc1 <= rgfb1d1;      ea6de0c  <= wjf7675;      cz6f060 <= yzbb3ad;   end
end
fc3ffdb gq3448d (      .qgffeda        ( alfd586 ),   .rst_n          ( rst_n ),      .data_in        ( shd9d6d ),   .kqdb40b       ( ayceb6c),   .psda058  ( vifb0a7 ),      .dmd02c2       ( vx81f6d[7:0]),   .nt81613      ( vx81f6d[8] )   );
always @(posedge alfd586, negedge rst_n) begin   if (!rst_n) begin      kq78304         <= 1'b0;      eac1820         <= 1'b0;      ntc101         <= 1'b0;      gb6080e         <= 1'b0;      ng4074    <= 1'b1;      ba203a2    <= 1'b1;      do1d13    <= 1'b1;      doe89b    <= 1'b1;      fn744da   <= 1'b0;      nga26d6   <= 1'b0;      tj136b2   <= 1'b0;      hd9b596   <= 1'b0;      rgdacb6   <= 1'b0;      yxd65b3   <= 1'b0;      twb2d9c   <= 1'b0;      vk96ce2   <= 1'b0;   end   else begin      kq78304         <= pfd8e8b;      eac1820         <= gb75b60;      ntc101         <= zmadb05;      gb6080e         <= me6d82a;      ng4074    <= fnc745e;      ba203a2    <= al60a83;      do1d13    <= qi541c;      doe89b    <= zm2a0e0;      fn744da   <= tw3a2f7;      nga26d6   <= do83817;      tj136b2   <= bn1c0ba;      hd9b596   <= yke05d7;      rgdacb6   <= cmd17bb;      yxd65b3   <= yz175cc;      twb2d9c   <= vxbae64;      vk96ce2   <= rtd7326;   end
end
always @(posedge tjbfab0, negedge rst_n) begin   if (!rst_n) begin      ykf0da6 <= 1'b1;      ng86d31 <= 1'b1;      cb3698a <= 1'b1;      qvb4c54  <= 1'b0;      aaa62a5  <= 1'b0;      qi31528  <= 1'b0;      yz8a940  <= 1'b0;   end   else begin      ykf0da6 <= fnc745e;      ng86d31 <= al60a83;      cb3698a <= qi541c | al60a83;      qvb4c54  <= zz38bc3;      aaa62a5  <= an8ac05;      qi31528  <= ea5602c;      yz8a940  <= rvb0160;   end
end
assign vv7e8d7[1] =  gd80b06 ? uv5eece[1] :  ip51580 ;
assign vv7e8d7[0] =  gd80b06 ? uv5eece[0] :  ip51580 ;
bn1c226 vi57dcb (      .qgffeda        ( alfd586 ),   .rv16ca6        ( tjbfab0 ),   .rst_n          ( rst_n ),   .hd94dca   ( zz38bc3 ),         .data_in        ( {oub9936, gd2eb9, pf50702, ne6c150, fp8bdd9} ),       .dmd02c2       ( {oua35f2[1], psf46be[1], qifb6f[1], jrafd1a[1], dmd5fa3[1], vidabf4[15:8],                      oua35f2[0], psf46be[0], qifb6f[0], jrafd1a[0], dmd5fa3[0], vidabf4[7:0]} )   );
always@* begin qt54a04<=ld7b613[0];jra5024<=ld7b613[1];vifb0a7<=ld7b613[2];zz38bc3<=ld7b613[3];je49ff<={sw3423a>>1,ld7b613[4]};ym24ffb<={oha11d0>>1,ld7b613[5]};db27fd8<={ep8e85>>1,ld7b613[6]};tw3fec7<=ld7b613[7];ykff63a<={vk3a16b>>1,ld7b613[8]};rgfb1d1<=ld7b613[9];pfd8e8b<=ld7b613[10];fnc745e<=ld7b613[11];tw3a2f7<=ld7b613[12];cmd17bb<=ld7b613[13];fp8bdd9<={vx81f6d>>1,ld7b613[14]};uv5eece<={qifb6f>>1,ld7b613[15]};wjf7675<={cm7db78>>1,ld7b613[16]};yzbb3ad<=ld7b613[17];shd9d6d<={ea6de0c>>1,ld7b613[18]};ayceb6c<=ld7b613[19];gb75b60<=ld7b613[20];zmadb05<=ld7b613[21];me6d82a<=ld7b613[22];ne6c150<=ld7b613[23];al60a83<=ld7b613[24];qi541c<=ld7b613[25];zm2a0e0<=ld7b613[26];pf50702<=ld7b613[27];do83817<=ld7b613[28];bn1c0ba<=ld7b613[29];yke05d7<=ld7b613[30];gd2eb9<=ld7b613[31];yz175cc<=ld7b613[32];vxbae64<=ld7b613[33];rtd7326<=ld7b613[34];oub9936<=ld7b613[35];psfb420<=ld7b613[36];xwda103<=ld7b613[37];mt26c6e<=ld7b613[38];oh36375<=ld7b613[39];mtb1bad<=ld7b613[40];uk8dd6d<=ld7b613[41];pf6eb69<=ld7b613[42];qt75b4f<=ld7b613[43];baada7d<=ld7b613[44];cm6d3ea<=ld7b613[45];ps69f51<=ld7b613[46];nr4fa8a<=ld7b613[47];ea7d456<=ld7b613[48];icea2b0<=ld7b613[49];ip51580<=ld7b613[50];an8ac05<=ld7b613[51];ea5602c<=ld7b613[52];rvb0160<=ld7b613[53];gd80b06<=ld7b613[54];end
always@* begin necf6c2[2047]<=os561a1;necf6c2[2046]<=psda058;necf6c2[2044]<=hd94dca;necf6c2[2040]<=sw3423a[0];necf6c2[2032]<=oha11d0[0];necf6c2[2016]<=ep8e85[0];necf6c2[1985]<=ps4742d;necf6c2[1922]<=vk3a16b[0];necf6c2[1867]<=cz6f060;necf6c2[1804]<=vx9e1b4;necf6c2[1797]<=tud0b5b;necf6c2[1761]<=zz1ccf0;necf6c2[1686]<=kq78304;necf6c2[1623]<=yz8a940;necf6c2[1561]<=ykf0da6;necf6c2[1558]<=fn744da;necf6c2[1547]<=gd85ada;necf6c2[1542]<=cm7842d;necf6c2[1490]<=yxedbc1;necf6c2[1475]<=hbe6786;necf6c2[1413]<=do1d13;necf6c2[1409]<=twb2d9c;necf6c2[1324]<=eac1820;necf6c2[1200]<=gb6080e;necf6c2[1074]<=ng86d31;necf6c2[1068]<=nga26d6;necf6c2[1047]<=db2d6d5;necf6c2[1037]<=vvc2168;necf6c2[1023]<=bn8efea;necf6c2[933]<=ea6de0c[0];necf6c2[902]<=wl33c36;necf6c2[880]<=go4399e;necf6c2[811]<=qi31528;necf6c2[779]<=doe89b;necf6c2[771]<=vk96ce2;necf6c2[745]<=cm7db78[0];necf6c2[706]<=ba203a2;necf6c2[704]<=yxd65b3;necf6c2[600]<=ntc101;necf6c2[440]<=xjc8733;necf6c2[405]<=aaa62a5;necf6c2[372]<=qifb6f[0];necf6c2[353]<=ng4074;necf6c2[352]<=rgdacb6;necf6c2[220]<=hq990e6;necf6c2[202]<=qvb4c54;necf6c2[186]<=vx81f6d[0];necf6c2[176]<=hd9b596;necf6c2[110]<=db1321c;necf6c2[101]<=cb3698a;necf6c2[93]<=of5b57e;necf6c2[88]<=tj136b2;necf6c2[55]<=yxe2643;necf6c2[46]<=zx6b6af;necf6c2[27]<=ri9c4c8;end         assign suff972 = necf6c2,ld7b613 = cme5c87;   initial begin   jcc030e = $fopen(".fred");   $fdisplay( jcc030e, "%3h\n%3h", (thc27c7 >> 4) & fnc7fe5, (thc27c7 >> (mt9f1ff+4)) & fnc7fe5 );   $fclose(jcc030e);   $readmemh(".fred", qg721c0);   end   always @ (suff972) begin   ym8700c = qg721c0[1];       for (vk1872=0; vk1872<qgdb09f; vk1872=vk1872+1) begin           cme5c87[vk1872] = suff972[ym8700c];       rv38061  = ^(ym8700c & qg721c0[0]);       ym8700c =  {ym8700c, rv38061};       end   end
endmodule