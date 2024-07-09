module ep23671(
   sys_clk,
   rst_n,
   kqce314,
   vi6ceee,
   go67772,
   mg3bb90,
   xjddc80,
   psee406,
   aaf45c,
   kd7a2e1,
   icd170d,
   bn8b869,
   me5c34e,
   jce1a71,
   mtd38a,
   xw69c54,
   yx4e2a2,
   vv71515
  ) ;
`ifdef MAX_TLP_512
localparam mt8a8ae   = 1024;
localparam yx54574  = 10 ;
`endif
`ifdef MAX_TLP_1K
localparam mt8a8ae   = 1024;
localparam yx54574  = 10 ;
`endif
`ifdef MAX_TLP_2K
localparam mt8a8ae   = 2048;
localparam yx54574  = 11 ;
`endif
`ifdef MAX_TLP_4K
localparam mt8a8ae   = 3072;
localparam yx54574  = 12 ;
`endif
parameter dm58bf8 = 2'b00;
parameter lqc5fc2  = 2'b01;
parameter pu2fe13  = 2'b11;
input                  sys_clk;
input                  rst_n;
input                  kqce314;
input [15:0]           vi6ceee;
input                  go67772;
input                  mg3bb90;
input                  xjddc80;
input                  psee406;
input                  aaf45c;
input                  kd7a2e1;
output [15:0]          icd170d;
output                 bn8b869;
output                 me5c34e;
output [11:0]          jce1a71;
output                 mtd38a;
output                 xw69c54;
output                 yx4e2a2;
output                 vv71515;
wire   [15:0]          icd170d;
wire                   bn8b869;
reg                    me5c34e;
wire   [11:0]          jce1a71;
wire                   mtd38a;
reg                    xw69c54;
reg                    yx4e2a2;
reg                    vv71515;
reg  [15:0]            mt295f;
reg  [15:0]            tw14afc;
reg  [15:0]            hda57e2;
reg                    ym2bf17;
reg                    ld5f8b9;
reg                    dzfc5cf;
reg                    cze2e7e;
reg                    mt173f5;
reg                    aab9fac;
reg  [11:0]            hocfd61;
reg                    ld7eb0a;
reg                    mef5856;
reg                    ukac2b1;
reg                    fn61589;
reg  [11:0]            ieac4f;
reg                    qg56278;
reg                    irb13c0;
reg                    ls89e04;
reg                    vv4f023;
reg  [1:0]             ui7811f;
reg                    hoc08f8;
reg                    je47c3;
reg                    wl23e1a;
reg                    ou1f0d5;
reg                    wjf86a8;
reg                    yxc3544;
reg                    ou1aa25;
reg [yx54574-1:0] fca894b;
reg [yx54574-1:0] hq252d5;
reg                    an296ab;
reg                    al4b55d;
reg [yx54574-1:0] byd576f;
wire  [31:0]           nr61d36;
wire  [11:0]           tu5dbdd;
wire  [17:0]           kdedeea;
wire  [17:0]           yx6f754;
wire                   hb7baa4;
`ifdef MAX_TLP_4K
`else
`endif
`ifdef MAX_TLP_4K
`else
`endif
`ifdef ECP3
`else
`endif
`ifdef ECP3
`else
`endif
`ifdef ECP3
`else
`endif
reg jpdd526;
reg [15 : 0] kqea937;
reg cz549b9;
reg ana4dcc;
reg sj26e64;
reg lf37325;
reg mgb992f;
reg alcc979;
reg [15 : 0] ld64bcd;
reg [15 : 0] ba25e6e;
reg [15 : 0] zm2f372;
reg ne79b92;
reg jpcdc93;
reg fn6e49f;
reg ic724fe;
reg ou927f1;
reg ri93f88;
reg [11 : 0] ux9fc43;
reg vife21d;
reg tuf10eb;
reg uk8875a;
reg ic43ad0;
reg [11 : 0] oh1d680;
reg zkeb405;
reg pf5a02a;
reg dmd0156;
reg mt80ab3;
reg [1 : 0] wy559d;
reg vk2ace8;
reg kq56743;
reg ksb3a18;
reg aa9d0c0;
reg she8601;
reg me4300d;
reg yz18069;
reg [yx54574 - 1 : 0] je1a6a;
reg [yx54574 - 1 : 0] fa69a9c;
reg jc4d4e2;
reg al6a712;
reg [yx54574 - 1 : 0] ri9c4a1;
reg [31 : 0] yxe250b;
reg [11 : 0] cb1285c;
reg [17 : 0] fp942e5;
reg [17 : 0] cba172f;
reg lsb97d;
reg [2047:0] necf6c2;
wire [44:0] ld7b613;
`ifdef MAX_TLP_512
`endif
`ifdef MAX_TLP_1K
`endif
`ifdef MAX_TLP_2K
`endif
`ifdef MAX_TLP_4K
`endif
`ifdef MAX_TLP_4K
`else
`endif
`ifdef MAX_TLP_4K
`else
`endif
`ifdef ECP3
`else
`endif
`ifdef ECP3
`else
`endif
`ifdef ECP3
`else
`endif
localparam qgdb09f = 45,nrd84f8 = 32'hfdffca4b;
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
`ifdef MAX_TLP_512
`endif
`ifdef MAX_TLP_1K
`endif
`ifdef MAX_TLP_2K
`endif
`ifdef MAX_TLP_4K
`endif
`ifdef MAX_TLP_4K
`else
`endif
`ifdef MAX_TLP_4K
`else
`endif
`ifdef ECP3
`else
`endif
`ifdef ECP3
`else
`endif
`ifdef ECP3
`else
`endif
`ifdef MAX_TLP_512
`endif
`ifdef MAX_TLP_1K
`endif
`ifdef MAX_TLP_2K
`endif
`ifdef MAX_TLP_4K
`endif
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      mt295f  <= 16'd0;      tw14afc  <= 16'd0;      hda57e2  <= 16'd0;      ym2bf17    <= 1'b0;      ld5f8b9    <= 1'b0;      dzfc5cf    <= 1'b0;      cze2e7e    <= 1'b0;      mt173f5   <= 1'b0;      aab9fac   <= 1'b0;   end   else  begin      mt295f  <= kqea937;      tw14afc  <= ld64bcd;      hda57e2  <= ba25e6e;      ym2bf17    <= ana4dcc;      ld5f8b9    <= ne79b92;      dzfc5cf    <= jpcdc93;      cze2e7e    <= fn6e49f;         mt173f5   <= sj26e64;      aab9fac   <= lf37325;   end
end
assign tu5dbdd   = ld64bcd[11:0];
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      ld7eb0a   <= 1'b0;      mef5856   <= 1'b0;      ukac2b1  <= 1'b0;      fn61589   <= 1'b0;      ieac4f  <= 12'h000;      qg56278     <= 1'b0;      irb13c0      <= 1'b0;      ls89e04      <= 1'b0;      vv4f023     <= 1'b0;   end   else  begin      ld7eb0a   <= ({ld64bcd, kqea937} == yxe250b) ? 1'b1 : 1'b0;      mef5856   <= ({ld64bcd, kqea937} == ~yxe250b) ? 1'b1 : 1'b0;      ieac4f  <= ux9fc43 - cb1285c;      if(jpcdc93) begin         ukac2b1 <= (oh1d680 == 12'h000) ? 1'b1 : 1'b0;         fn61589  <= (oh1d680 <= 12'd2048) ? 1'b1 : 1'b0;      end      qg56278 <= 1'b0;      irb13c0  <= 1'b0;      ls89e04  <= 1'b0;      vv4f023 <= 1'b0;      if(kq56743) begin         if(ou927f1) begin            if(vife21d)               if(uk8875a)                       qg56278 <= 1'b1;               else if(ic43ad0)                   ls89e04  <= 1'b1;               else                                  irb13c0  <= 1'b1;            else                                  irb13c0  <= 1'b1;         end         else if(ri93f88) begin            if(tuf10eb)                        vv4f023 <= 1'b1;            else                                  irb13c0  <= 1'b1;         end     end     end
end
assign mtd38a  = pf5a02a;
assign jce1a71      = ux9fc43 - 12'h001;
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      xw69c54      <= 1'b0;      vv71515   <= 1'b0;      yx4e2a2      <= 1'b0;   end   else begin      xw69c54      <= zkeb405;      vv71515   <= dmd0156;      yx4e2a2      <= pf5a02a | vk2ace8;   end
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      ui7811f  <= dm58bf8;      hoc08f8    <= 1'b0;      je47c3 <= 1'b0;      ou1f0d5  <= 1'b0;   end   else  begin      hoc08f8    <= 1'b0;      je47c3 <= 1'b0;      ou1f0d5  <= alcc979;      wjf86a8   <= (alcc979 & ~aa9d0c0);      if (she8601) begin         ui7811f  <= dm58bf8;      end      else begin      case(wy559d)         dm58bf8 : begin                                    if(mgb992f) begin               if(sj26e64 || lf37325) begin                  hoc08f8    <= 1'b1;                  ui7811f  <= pu2fe13;               end               else if(ana4dcc) begin                  ui7811f  <= lqc5fc2;               end       else begin                  ui7811f  <= dm58bf8;                  hoc08f8    <= 1'b0;               end            end    else begin               ui7811f  <= dm58bf8;               hoc08f8    <= 1'b0;            end         end         lqc5fc2 : begin                                    if(she8601) begin               ui7811f  <= dm58bf8;               hoc08f8    <= 1'b1;            end            else if(mgb992f) begin               hoc08f8 <= (ana4dcc) ? 1'b1 : 1'b0;               if(sj26e64 || lf37325) begin                  ui7811f  <= dm58bf8;                  je47c3 <= 1'b1;               end            end            else               ui7811f  <= dm58bf8;         end         pu2fe13 : begin            if(she8601) begin               ui7811f  <= dm58bf8;               hoc08f8    <= 1'b1;            end            else if(mgb992f) begin               if(ana4dcc)                  ui7811f  <= lqc5fc2;       else if(sj26e64 || lf37325) begin                  ui7811f  <= pu2fe13;                  hoc08f8 <= 1'b1;               end       else begin                  ui7811f  <= dm58bf8;                  hoc08f8 <= 1'b0;               end            end            else               ui7811f  <= dm58bf8;        end        default : begin           ui7811f  <= dm58bf8;        end      endcase      end   end
end
assign yx6f754 = {zm2f372, ic724fe, sj26e64};
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      yxc3544          <= 1'b0;      wl23e1a<= 1'b0;      ou1aa25        <= 1'b0;      fca894b   <= 0;      hq252d5 <= 0;      hocfd61    <= 12'h000;   end   else  begin      if(vk2ace8 || sj26e64 || lf37325 || !mgb992f)         yxc3544  <= 1'b0;      else if(jpcdc93)         yxc3544  <= 1'b1;      ou1aa25          <= me4300d;      wl23e1a  <= kq56743;      if(!mgb992f || vk2ace8 || (ksb3a18 && !zkeb405))          fca894b <= fa69a9c;      else if(me4300d)
`ifdef MAX_TLP_4K
            fca894b <= (je1a6a == 12'd3071) ? 12'd0 : je1a6a + 1;
`else
            fca894b <= je1a6a + 1;
`endif
            if(!mgb992f)          hq252d5 <= 0;      else if(zkeb405)            hq252d5 <= je1a6a;            if(!mgb992f)         hocfd61  <= 12'h000;      else if(zkeb405)           hocfd61  <= ux9fc43 + 12'h001 ;   end
end
assign icd170d      = (jpdd526) ? cba172f[17:2] : fp942e5[17:2];
assign bn8b869        = (jpdd526) ? cba172f[1] : (al6a712 ? fp942e5[1] : 1'b0);
assign hb7baa4 = (jpdd526) ? cba172f[0] : (al6a712 ? fp942e5[0] : 1'b0);
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      an296ab      <= 1'b0;      al4b55d    <= 1'b0;      byd576f <= 0;      me5c34e     <= 1'b0;   end   else  begin      an296ab    <= 1'b0;      if(!mgb992f)         byd576f <= 0;      else if((ri9c4a1 != fa69a9c) && !lsb97d) begin         an296ab      <= 1'b1;
`ifdef MAX_TLP_4K
            byd576f <= (ri9c4a1 == 12'd3071) ? 12'd0 : ri9c4a1 + 1;
`else
            byd576f <= ri9c4a1 + 1;
`endif
      end      me5c34e        <= lsb97d;      al4b55d       <= jc4d4e2;   end
end
pmi_ram_dp #(   .pmi_wr_addr_depth    (mt8a8ae),   .pmi_wr_addr_width    (yx54574),   .pmi_wr_data_width    (18),   .pmi_rd_addr_depth    (mt8a8ae),   .pmi_rd_addr_width    (yx54574),   .pmi_rd_data_width    (18),   .pmi_regmode          ("noreg"),   .pmi_gsr              ("enable"),
`ifdef ECP3
   .pmi_resetmode        ("sync"),
`else
   .pmi_resetmode        ("async"),
`endif
   .pmi_init_file        ("none"),   .pmi_init_file_format ("binary"),
`ifdef ECP3
   .pmi_family           ("ECP3"),
`else
   .pmi_family           ("EC2"),
`endif
   .module_type          ("pmi_ram_dp")   )   gdabed1 (   .Data         (yx6f754),   .WrAddress    (fca894b),   .RdAddress    (byd576f),   .WrClock      (sys_clk),   .RdClock      (sys_clk),   .WrClockEn    (1'b1),   .RdClockEn    (an296ab),   .WE           (ou1aa25),
`ifdef ECP3
   .Reset        (1'b0),
`else
   .Reset        (~rst_n),
`endif
   .Q            (kdedeea)   );
me4330c rie71f(      .sys_clk    (sys_clk) ,   .rst_n      (rst_n),      .data_in    (ld64bcd),   .rvc3a6      (ana4dcc),      .nr61d36    (nr61d36)   ) ;
always@* begin jpdd526<=ld7b613[0];kqea937<={vi6ceee>>1,ld7b613[1]};cz549b9<=ld7b613[2];ana4dcc<=ld7b613[3];sj26e64<=ld7b613[4];lf37325<=ld7b613[5];mgb992f<=ld7b613[6];alcc979<=ld7b613[7];ld64bcd<={mt295f>>1,ld7b613[8]};ba25e6e<={tw14afc>>1,ld7b613[9]};zm2f372<={hda57e2>>1,ld7b613[10]};ne79b92<=ld7b613[11];jpcdc93<=ld7b613[12];fn6e49f<=ld7b613[13];ic724fe<=ld7b613[14];ou927f1<=ld7b613[15];ri93f88<=ld7b613[16];ux9fc43<={hocfd61>>1,ld7b613[17]};vife21d<=ld7b613[18];tuf10eb<=ld7b613[19];uk8875a<=ld7b613[20];ic43ad0<=ld7b613[21];oh1d680<={ieac4f>>1,ld7b613[22]};zkeb405<=ld7b613[23];pf5a02a<=ld7b613[24];dmd0156<=ld7b613[25];mt80ab3<=ld7b613[26];wy559d<={ui7811f>>1,ld7b613[27]};vk2ace8<=ld7b613[28];kq56743<=ld7b613[29];ksb3a18<=ld7b613[30];aa9d0c0<=ld7b613[31];she8601<=ld7b613[32];me4300d<=ld7b613[33];yz18069<=ld7b613[34];je1a6a<={fca894b>>1,ld7b613[35]};fa69a9c<={hq252d5>>1,ld7b613[36]};jc4d4e2<=ld7b613[37];al6a712<=ld7b613[38];ri9c4a1<={byd576f>>1,ld7b613[39]};yxe250b<={nr61d36>>1,ld7b613[40]};cb1285c<={tu5dbdd>>1,ld7b613[41]};fp942e5<={kdedeea>>1,ld7b613[42]};cba172f<={yx6f754>>1,ld7b613[43]};lsb97d<=ld7b613[44];end
always@* begin necf6c2[2047]<=vi6ceee[0];necf6c2[2046]<=go67772;necf6c2[2044]<=mg3bb90;necf6c2[2040]<=xjddc80;necf6c2[2033]<=psee406;necf6c2[2019]<=aaf45c;necf6c2[2011]<=mt173f5;necf6c2[1991]<=kd7a2e1;necf6c2[1974]<=aab9fac;necf6c2[1935]<=mt295f[0];necf6c2[1900]<=hocfd61[0];necf6c2[1862]<=yxc3544;necf6c2[1823]<=tw14afc[0];necf6c2[1753]<=ld7eb0a;necf6c2[1738]<=fn61589;necf6c2[1676]<=ou1aa25;necf6c2[1656]<=tu5dbdd[0];necf6c2[1619]<=irb13c0;necf6c2[1598]<=hda57e2[0];necf6c2[1458]<=mef5856;necf6c2[1428]<=ieac4f[0];necf6c2[1338]<=hoc08f8;necf6c2[1305]<=fca894b[0];necf6c2[1264]<=kdedeea[0];necf6c2[1256]<=wl23e1a;necf6c2[1191]<=ls89e04;necf6c2[1149]<=ym2bf17;necf6c2[1127]<=an296ab;necf6c2[1023]<=kqce314;necf6c2[1005]<=cze2e7e;necf6c2[962]<=hb7baa4;necf6c2[931]<=wjf86a8;necf6c2[869]<=ukac2b1;necf6c2[828]<=nr61d36[0];necf6c2[809]<=qg56278;necf6c2[669]<=ui7811f[0];necf6c2[628]<=je47c3;necf6c2[563]<=hq252d5[0];necf6c2[502]<=dzfc5cf;necf6c2[481]<=yx6f754[0];necf6c2[465]<=ou1f0d5;necf6c2[414]<=byd576f[0];necf6c2[334]<=vv4f023;necf6c2[251]<=ld5f8b9;necf6c2[207]<=al4b55d;end         assign suff972 = necf6c2,ld7b613 = cme5c87;   initial begin   jcc030e = $fopen(".fred");   $fdisplay( jcc030e, "%3h\n%3h", (thc27c7 >> 4) & fnc7fe5, (thc27c7 >> (mt9f1ff+4)) & fnc7fe5 );   $fclose(jcc030e);   $readmemh(".fred", qg721c0);   end   always @ (suff972) begin   ym8700c = qg721c0[1];       for (vk1872=0; vk1872<qgdb09f; vk1872=vk1872+1) begin           cme5c87[vk1872] = suff972[ym8700c];       rv38061  = ^(ym8700c & qg721c0[0]);       ym8700c =  {ym8700c, rv38061};       end   end
endmodule