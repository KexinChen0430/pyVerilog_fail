module  bn1c004(
   sys_clk,
   rst_n,
   dmfe774,
   hb7e87f,
   al4bbdd,
   qgcbe8c,
   fn5f460,
   ayfa306,
   sj397d1,
   thec436,
   ui621b7,
   twb80a3,
   zkc051a,
   ux28d2,
   fc14694,
   uk10db8,
   ng86dc0,
   cb36e02,
   pub7014,
   aaa34a3,
   qi1a518,
   nrd28c0,
   ph94607,
   coa303f,
   ir181f8,
   dmc0fc5
   );
input                         sys_clk;
input                         rst_n;
input                         dmfe774;
input [`NUM_VC-1:0]           hb7e87f;
input [`NUM_VC*3-1:0]         al4bbdd;
input                         qgcbe8c;
input                         fn5f460;
input                         ayfa306;
input  [1:0]                  sj397d1;
input  [2:0]                  thec436;
input  [19:0]                 ui621b7;
input                         twb80a3;
input                         zkc051a;
input                         ux28d2;
input                         fc14694;
input  [`NUM_VC -1:0]         uk10db8;
input  [`NUM_VC -1:0]         ng86dc0;
input  [`NUM_VC -1:0]         cb36e02;
input  [(`NUM_VC*16)-1:0]     pub7014;
output                        aaa34a3;
output  [(`NUM_VC*9)-1:0]     qi1a518;
output  [(`NUM_VC*13)-1:0]    nrd28c0;
output  [(`NUM_VC*9)-1:0]     ph94607;
output  [(`NUM_VC*13)-1:0]    coa303f;
output  [(`NUM_VC*9)-1:0]     ir181f8;
output  [(`NUM_VC*13)-1:0]    dmc0fc5;
reg                           aaa34a3;
reg  [`NUM_VC -1:0]           gq341cf;
reg  [`NUM_VC -1:0]           xla0e78;
reg  [`NUM_VC -1:0]           ux73c6;
reg  [`NUM_VC -1:0]           kf39e35;
wire   [`NUM_VC -1:0]         jccf1ad;
reg wy8dd9b;
reg [`NUM_VC - 1 : 0] alc3f66;
reg [`NUM_VC * 3 - 1 : 0] ne766cf;
reg kf2c072;
reg cz60395;
reg ls1cad;
reg [1 : 0] pue56b;
reg [2 : 0] ld7b3a3;
reg [19 : 0] shd9d1f;
reg vvfc189;
reg ose0c4e;
reg bn6270;
reg mg31387;
reg [`NUM_VC - 1 : 0] ayce8fc;
reg [`NUM_VC - 1 : 0] hb747e0;
reg [`NUM_VC - 1 : 0] coa3f06;
reg [(`NUM_VC * 16) - 1 : 0] ks1f831;
reg [`NUM_VC - 1 : 0] jc76c4a;
reg [`NUM_VC - 1 : 0] swb6252;
reg [`NUM_VC - 1 : 0] sjb1291;
reg [`NUM_VC - 1 : 0] ng8948c;
reg [`NUM_VC - 1 : 0] hb4a462;
reg [2047:0] necf6c2;
wire [21:0] ld7b613;
localparam qgdb09f = 22,nrd84f8 = 32'hfdffc68b;
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
always@(*) begin   gq341cf   = 0;   xla0e78   = 0;   ux73c6 = 0;   kf39e35 = 0;   gq341cf[0]   = vvfc189;      xla0e78[0]   = ose0c4e;   ux73c6[0] = bn6270;   kf39e35[0] = mg31387;
end
always @(posedge sys_clk or negedge rst_n) begin   if (rst_n == 1'b0) begin      aaa34a3 <= 1'b0;   end   else begin      aaa34a3 <= |hb4a462;   end
end
xye129 ic4696e [`NUM_VC -1:0] (         .sys_clk         (sys_clk),    .rst_n           (rst_n),    .dmfe774     (wy8dd9b),    .hb7e87f           (alc3f66),    .al4bbdd            (ne766cf),    .qgcbe8c   (kf2c072),    .fn5f460   (cz60395),    .ayfa306    (ls1cad),    .sj397d1   (pue56b),    .thec436   (ld7b3a3),    .ui621b7   (shd9d1f),    .twb80a3       (jc76c4a),    .zkc051a       (swb6252),    .ux28d2     (sjb1291),    .fc14694     (ng8948c),    .uk10db8           (ayce8fc),    .ng86dc0          (hb747e0),    .cb36e02         (coa3f06),    .pub7014         (ks1f831),        .aaa34a3 (jccf1ad),    .qi1a518        (qi1a518),    .nrd28c0        (nrd28c0),    .ph94607       (ph94607),    .coa303f       (coa303f),    .ir181f8      (ir181f8),    .dmc0fc5      (dmc0fc5)
    );
always@* begin wy8dd9b<=ld7b613[0];alc3f66<={hb7e87f>>1,ld7b613[1]};ne766cf<={al4bbdd>>1,ld7b613[2]};kf2c072<=ld7b613[3];cz60395<=ld7b613[4];ls1cad<=ld7b613[5];pue56b<={sj397d1>>1,ld7b613[6]};ld7b3a3<={thec436>>1,ld7b613[7]};shd9d1f<={ui621b7>>1,ld7b613[8]};vvfc189<=ld7b613[9];ose0c4e<=ld7b613[10];bn6270<=ld7b613[11];mg31387<=ld7b613[12];ayce8fc<={uk10db8>>1,ld7b613[13]};hb747e0<={ng86dc0>>1,ld7b613[14]};coa3f06<={cb36e02>>1,ld7b613[15]};ks1f831<={pub7014>>1,ld7b613[16]};jc76c4a<={gq341cf>>1,ld7b613[17]};swb6252<={xla0e78>>1,ld7b613[18]};sjb1291<={ux73c6>>1,ld7b613[19]};ng8948c<={kf39e35>>1,ld7b613[20]};hb4a462<={jccf1ad>>1,ld7b613[21]};end
always@* begin necf6c2[2047]<=hb7e87f[0];necf6c2[2046]<=al4bbdd[0];necf6c2[2044]<=qgcbe8c;necf6c2[2040]<=fn5f460;necf6c2[2032]<=ayfa306;necf6c2[2017]<=sj397d1[0];necf6c2[1987]<=thec436[0];necf6c2[1926]<=ui621b7[0];necf6c2[1805]<=twb80a3;necf6c2[1679]<=pub7014[0];necf6c2[1562]<=zkc051a;necf6c2[1310]<=gq341cf[0];necf6c2[1144]<=ux73c6[0];necf6c2[1076]<=ux28d2;necf6c2[1023]<=dmfe774;necf6c2[839]<=cb36e02[0];necf6c2[572]<=xla0e78[0];necf6c2[480]<=jccf1ad[0];necf6c2[419]<=ng86dc0[0];necf6c2[240]<=kf39e35[0];necf6c2[209]<=uk10db8[0];necf6c2[104]<=fc14694;end         assign suff972 = necf6c2,ld7b613 = cme5c87;   initial begin   jcc030e = $fopen(".fred");   $fdisplay( jcc030e, "%3h\n%3h", (thc27c7 >> 4) & fnc7fe5, (thc27c7 >> (mt9f1ff+4)) & fnc7fe5 );   $fclose(jcc030e);   $readmemh(".fred", qg721c0);   end   always @ (suff972) begin   ym8700c = qg721c0[1];       for (vk1872=0; vk1872<qgdb09f; vk1872=vk1872+1) begin           cme5c87[vk1872] = suff972[ym8700c];       rv38061  = ^(ym8700c & qg721c0[0]);       ym8700c =  {ym8700c, rv38061};       end   end
endmodule