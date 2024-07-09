module  wjfdce2(
   sys_clk,
   rst_n,
   rib82be,
   icc15f2,
   ym1549d,
   zzaa4e9,
   ne5274e,
   je93a72,
   gq9d393,
   pfe9c99,
   mr4e4ce,
   ay72675,
   do933a9,
   hq99d4a,
   qgcea52,
   en75290,
   lf198b2,
   yxcc596,
   os62cb4,
   fp165a1,
   xyb2d0e,
   ba96872
   );
parameter qif530 = 3*`NUM_VC;
input                     sys_clk;
input                     rst_n;
input                     rib82be;
input                     icc15f2;
input [`NUM_VC-1:0]       ym1549d;
input [`NUM_VC-1:0]       zzaa4e9;
input [`NUM_VC-1:0]       ne5274e;
input [`NUM_VC-1:0]       je93a72;
input [`NUM_VC-1:0]       gq9d393;
input [`NUM_VC-1:0]       pfe9c99;
input [`NUM_VC-1:0]       mr4e4ce;
input [`NUM_VC-1:0]       ay72675;
input [`NUM_VC-1:0]       do933a9;
output                    lf198b2;
output   [2:0]            yxcc596;
output   [1:0]            os62cb4;
output                    fp165a1;
output   [2:0]            xyb2d0e;
output   [1:0]            ba96872;
output [`NUM_VC-1:0]      hq99d4a;
output [`NUM_VC-1:0]      qgcea52;
output [`NUM_VC-1:0]      en75290;
reg                       lf198b2;
reg   [2:0]               yxcc596;
reg   [1:0]               os62cb4;
reg                       fp165a1;
reg   [2:0]               xyb2d0e;
reg   [1:0]               ba96872;
wire  [`NUM_VC-1:0]       hq99d4a;
wire  [`NUM_VC-1:0]       qgcea52;
wire  [`NUM_VC-1:0]       en75290;
reg   [`NUM_VC-1:0]       db3d788;
reg   [`NUM_VC-1:0]       byebc46;
reg   [`NUM_VC-1:0]       ip5e233;
reg   [4:0]               zkf119c;
reg   [4:0]               qi88ce2;
reg   [1:0]               go46711;
`ifdef VC1
reg                       cb33889;
`else
`ifdef VC2
reg                          cb33889;
`else
`ifdef VC3
reg  [1:0]                         cb33889;
`else
`ifdef VC4
reg  [1:0]                         cb33889;
`else   // 5 - 8
reg  [2:0]                         cb33889;
`endif
`endif
`endif
`endif
reg   [qif530-1:0]       tu638d8;
wire  [qif530-1:0]       pfe361f;
wire  [qif530-1:0]       thd87f2;
reg ofc3f97;
reg ie1fcbc;
reg [`NUM_VC - 1 : 0] dmfe5e1;
reg [`NUM_VC - 1 : 0] gbf2f0b;
reg [`NUM_VC - 1 : 0] uk9785c;
reg [`NUM_VC - 1 : 0] qibc2e1;
reg [`NUM_VC - 1 : 0] bye1708;
reg [`NUM_VC - 1 : 0] dob843;
reg [`NUM_VC - 1 : 0] cm5c21a;
reg [`NUM_VC - 1 : 0] hoe10d1;
reg [`NUM_VC - 1 : 0] an868b;
reg [`NUM_VC - 1 : 0] ea4345c;
reg [`NUM_VC - 1 : 0] ks1a2e1;
reg [`NUM_VC - 1 : 0] osd1708;
reg [4 : 0] xl8b841;
reg [4 : 0] go5c20e;
reg [1 : 0] nee1071;
reg [qif530 - 1 : 0] al41c5c;
reg [qif530 - 1 : 0] zx7172b;
reg [qif530 - 1 : 0] ay5caf6;
reg [2047:0] necf6c2;
wire [19:0] ld7b613;
`ifdef VC1
`else
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
localparam qgdb09f = 20,nrd84f8 = 32'hfdffe81b;
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
`ifdef VC1
`else
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
`ifdef VC1
`else
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
always @(posedge sys_clk or negedge rst_n) begin   if (rst_n == 1'b0) begin      db3d788   <= 0;      byebc46  <= 0;      ip5e233 <= 0;   end   else begin      db3d788   <= dmfe5e1 | qibc2e1;      byebc46  <= gbf2f0b | bye1708;      ip5e233 <= uk9785c | dob843;   end
end
assign pfe361f = {osd1708, ks1a2e1, ea4345c};
assign {en75290, qgcea52, hq99d4a} = al41c5c;
always @(posedge sys_clk or negedge rst_n) begin   if (rst_n == 1'b0) begin      tu638d8       <= 0;      lf198b2  <= 1'b0;      yxcc596    <= 3'b000;      os62cb4    <= 2'b00;   end   else begin            yxcc596    <= 3'b000;      lf198b2  <= 1'b0;      tu638d8       <= 0;      if(!ofc3f97) begin         lf198b2  <= zx7172b[xl8b841];         yxcc596    <= cb33889;         os62cb4    <= nee1071;         tu638d8[go5c20e] <= lf198b2;         end   end
end
assign thd87f2 = {an868b, hoe10d1, cm5c21a};
always @(posedge sys_clk or negedge rst_n) begin   if (rst_n == 1'b0) begin      fp165a1  <= 1'b0;      xyb2d0e    <= 3'b000;      ba96872    <= 2'b00;   end   else begin            xyb2d0e    <= 3'b000;      fp165a1  <= 1'b0;      if(!ie1fcbc) begin         fp165a1  <= ay5caf6[xl8b841];         xyb2d0e    <= cb33889;         ba96872    <= nee1071;      end   end
end
always @(posedge sys_clk or negedge rst_n) begin   if (rst_n == 1'b0) begin      zkf119c     <= 0;      qi88ce2 <= 0;      cb33889     <= 0;      go46711     <= 2'b00;   end   else begin      if(!ofc3f97) begin                  zkf119c <= (xl8b841 == (qif530 - 1)) ? 0 : (xl8b841 + 1);         qi88ce2 <= xl8b841;                  cb33889 <= (cb33889 == (`NUM_VC-1)) ? 0 : (cb33889 + 1);                  if(cb33889 == (`NUM_VC-1))            go46711 <= (nee1071 == 2'b10) ? 2'b00 : (nee1071 + 2'b01);      end   end
end
always@* begin ofc3f97<=ld7b613[0];ie1fcbc<=ld7b613[1];dmfe5e1<={ym1549d>>1,ld7b613[2]};gbf2f0b<={zzaa4e9>>1,ld7b613[3]};uk9785c<={ne5274e>>1,ld7b613[4]};qibc2e1<={je93a72>>1,ld7b613[5]};bye1708<={gq9d393>>1,ld7b613[6]};dob843<={pfe9c99>>1,ld7b613[7]};cm5c21a<={mr4e4ce>>1,ld7b613[8]};hoe10d1<={ay72675>>1,ld7b613[9]};an868b<={do933a9>>1,ld7b613[10]};ea4345c<={db3d788>>1,ld7b613[11]};ks1a2e1<={byebc46>>1,ld7b613[12]};osd1708<={ip5e233>>1,ld7b613[13]};xl8b841<={zkf119c>>1,ld7b613[14]};go5c20e<={qi88ce2>>1,ld7b613[15]};nee1071<={go46711>>1,ld7b613[16]};al41c5c<={tu638d8>>1,ld7b613[17]};zx7172b<={pfe361f>>1,ld7b613[18]};ay5caf6<={thd87f2>>1,ld7b613[19]};end
always@* begin necf6c2[2047]<=icc15f2;necf6c2[2046]<=ym1549d[0];necf6c2[2045]<=zzaa4e9[0];necf6c2[2042]<=ne5274e[0];necf6c2[2037]<=je93a72[0];necf6c2[2026]<=gq9d393[0];necf6c2[2005]<=pfe9c99[0];necf6c2[1962]<=mr4e4ce[0];necf6c2[1877]<=ay72675[0];necf6c2[1742]<=thd87f2[0];necf6c2[1707]<=do933a9[0];necf6c2[1459]<=tu638d8[0];necf6c2[1388]<=qi88ce2[0];necf6c2[1371]<=ip5e233[0];necf6c2[1366]<=db3d788[0];necf6c2[1023]<=rib82be;necf6c2[871]<=pfe361f[0];necf6c2[729]<=go46711[0];necf6c2[694]<=zkf119c[0];necf6c2[685]<=byebc46[0];end         assign suff972 = necf6c2,ld7b613 = cme5c87;   initial begin   jcc030e = $fopen(".fred");   $fdisplay( jcc030e, "%3h\n%3h", (thc27c7 >> 4) & fnc7fe5, (thc27c7 >> (mt9f1ff+4)) & fnc7fe5 );   $fclose(jcc030e);   $readmemh(".fred", qg721c0);   end   always @ (suff972) begin   ym8700c = qg721c0[1];       for (vk1872=0; vk1872<qgdb09f; vk1872=vk1872+1) begin           cme5c87[vk1872] = suff972[ym8700c];       rv38061  = ^(ym8700c & qg721c0[0]);       ym8700c =  {ym8700c, rv38061};       end   end
endmodule