module rtcd9e4 #(
   parameter FADDR    = 6 )
   (
   input wire                  sys_clk,
   input wire                  rst_n,
   input wire                  kqce314,
   input wire   [11:0]         oh362e6,
   input wire   [13:0]         pse18cc,
   input wire                  fa79b01,
   input wire  [15:0]          kf9ae61,
   input wire                  vvd730d,
   input wire                  ukb986e,
   input wire                  mrcc371,
   input wire                  xjcd80b,
   input wire                  lf198b2,
   input wire   [2:0]          yxcc596,
   input wire   [1:0]          os62cb4,
   input wire                  fp165a1,
   input wire   [2:0]          xyb2d0e,
   input wire   [1:0]          ba96872,
   input wire   [(`NUM_VC-1):0]   wlb4393,
   input wire   [(`NUM_VC-1):0]   uxa1c9c,
   input wire   [(`NUM_VC-1):0]   vke4e4,
   input wire  [(24*`NUM_VC)-1:0] me6705e,
   input wire  [(24*`NUM_VC)-1:0] lf382f0,
   input wire  [(24*`NUM_VC)-1:0] mec1786,
   input wire                  os7da0f,
   input wire   [2:0]          tx_pmtype,
   input wire                  ww683cd,
   input wire  [23:0]          tx_vsd_data,
   input wire  [15:0]          vi6ceee,
   input wire                  go67772,
   input wire                  mg3bb90,
   input wire                  xjddc80,
   input wire                  psee406,
   input wire  [15:0]          ux36419,
   input wire                  ep85b3b,
   input wire                  nt2d9dd,
   input wire [3:0]            phy_ltssm_state,
   input wire                  ls35987,
   input wire                  kd7a2e1,
   input wire  [`NUM_VC-1:0]   tj8b9ac,
   input wire  [(`NUM_VC*3)-1:0]   ay5cd66,
   input wire                  mtb1735,
   input wire [2:0]            rtcdaa7,
   input wire                  jrc662,
   input wire                  zk63316,
   input wire  [`NUM_VC-1:0]   mgacc3b,
   output wire                thd20a8,
   output wire [15:0]         wwf5804,
   output wire                vk30204,
   output wire                wyac021,
   output wire                uv60109,
   output wire                ym84d,
   output wire                pu4269,
   output wire                qi2134a,
   output wire                bn169d7,
   output reg [15:0]          icd170d,
   output reg                 bn8b869,
   output reg                 me5c34e,
   output wire [22:0]         ie872fa,
   output wire [1:0]          sj397d1,
   output wire                qgcbe8c,
   output wire                fn5f460,
   output wire                ayfa306,
   output wire [23:0]         rxdp_vsd_data ,
   output wire [2:0]          rxdp_pmd_type,
   output wire [1:0]          rxdp_dllp_val,
   output wire [`NUM_VC-1:0]  jpd27c8,
   output wire [`NUM_VC-1:0]  do93e46,
   output wire [`NUM_VC-1:0]  mt9f233,
   output wire                rib82be,
   output wire                icc15f2,
   output wire [`NUM_VC-1:0]  ls1e282,
   output wire                mtd38a,
   output wire                gdaecfa,
   output wire                cm77093,
   output wire                mg151a8,
   output wire                tu637fb,
   output wire                dmfe774,
   output wire                hbf3ba3,
   output wire                co9dd1e,
   output wire [`NUM_VC-1:0]  aaf45c,
   output wire                nrcd8df ,
   output reg                 sjdf8e ,
   output reg                 yx6fc75 ,
   output wire [FADDR:0]      ba250d2,
   output wire                cm46737       );
wire [15:0]           yzae707;
wire [11:0]           eac1777;
wire [11:0]           jce1a71;
wire [11:0]           yz3360b;
wire [2:0]            hbd84c9;
wire [19:0]           qgf5531;
wire  [2:0]           tw1e0f1;
wire  [1:0]           ls83c50;
reg         wya623c;
reg         ks311e0;
reg [3:0]   aa88f00;
reg [11:0]  jc47801;
reg [11:0]  wl3c00a;
reg         wwe0054;
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
wire [15:0]    ou2a1 ;
wire           je1508 ;
wire           uka842 ;
reg jpdd526;
reg [11 : 0] alf2ba9;
reg [13 : 0] ldd748a;
reg dze3976;
reg [15 : 0] ip41f91;
reg qifc8d;
reg fn7e468;
reg wjf2347;
reg vx1cbb7;
reg xl915be;
reg [2 : 0] qv8adf7;
reg [1 : 0] cm56fbc;
reg dob7de1;
reg [2 : 0] yzbef0a;
reg [1 : 0] off7854;
reg [(`NUM_VC - 1) : 0] gqbc2a4;
reg [(`NUM_VC - 1) : 0] zke1520;
reg [(`NUM_VC - 1) : 0] mga903;
reg [(24 * `NUM_VC) - 1 : 0] cb1d22c;
reg [(24 * `NUM_VC) - 1 : 0] jpe9165;
reg [(24 * `NUM_VC) - 1 : 0] tu48b2f;
reg uxa40c4;
reg [2 : 0] ip7f3bf;
reg ph312b;
reg [23 : 0] wl1895f;
reg [15 : 0] kqea937;
reg cz549b9;
reg ana4dcc;
reg sj26e64;
reg lf37325;
reg [15 : 0] ym923a9;
reg vx91d48;
reg xl8ea46;
reg [3 : 0] cm4c960;
reg bl64b01;
reg alcc979;
reg [`NUM_VC - 1 : 0] kfaea64;
reg [(`NUM_VC * 3) - 1 : 0] cz75325;
reg an95d4c;
reg [2 : 0] gd26aed;
reg vxba456;
reg vvd22b7;
reg [`NUM_VC - 1 : 0] zm2580e;
reg [11 : 0] yk6dee1;
reg [11 : 0] rt5f859;
reg [11 : 0] uxa4069;
reg [2 : 0] yk72b5b;
reg [19 : 0] fpa0404;
reg [2 : 0] hqb3f3;
reg [1 : 0] facfcd8;
reg kf809e9;
reg hq4f4d;
reg [3 : 0] lf27a6b;
reg [11 : 0] hd3d35f;
reg [11 : 0] jpe9afe;
reg ps4d7f6;
reg [15 : 0] xj6bfb2;
reg dz5fd97;
reg psfecbf;
reg [2047:0] necf6c2;
wire [58:0] ld7b613;
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
localparam qgdb09f = 59,nrd84f8 = 32'hfdfff40b;
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
lq6c1b1 qv82cd (      .sys_clk          (sys_clk),   .rst_n            (rst_n),   .oh362e6     (alf2ba9),      .mtb1735          (an95d4c),   .tj8b9ac           (kfaea64),   .ay5cd66         (cz75325),      .phy_ltssm_state  (cm4c960),   .ls35987      (bl64b01),      .mgacc3b          (zm2580e),      .qgcbe8c    (qgcbe8c),   .fn5f460    (fn5f460),   .ayfa306     (ayfa306),   .sj397d1    (sj397d1),   .hbd84c9        (yk72b5b),
      .xjc264f         (xjc264f),   .jr1327f        (jr1327f),   .do993fe    (do993fe),   .qtc9ff3    (qtc9ff3),      .yx4e2a2         (yx4e2a2),   .al7fcee     (al7fcee),      .dmfe774      (dmfe774),   .hbf3ba3          (hbf3ba3),   .co9dd1e        (co9dd1e),   .aaf45c            (aaf45c),      .zx74783       (zx74783),   .qia3c1e      (qia3c1e),   .tw1e0f1      (tw1e0f1),   .icf078a      (icf078a),   .ls83c50      (ls83c50),      .ls1e282       (ls1e282)   );
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      wya623c <= 1'b0;      ks311e0 <= 1'b0;   end   else begin      wya623c <= pu4269;      ks311e0 <= kf809e9;   end
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      jc47801 <= 12'd0;      wl3c00a  <= 12'd0;      wwe0054   <= 1'b0;   end   else begin      if (kf809e9 && vk30204)         aa88f00[3:0] <= wwf5804[3:0];      if (hq4f4d && vk30204)         jc47801 <= {lf27a6b[3:0], wwf5804[15:8]};      wl3c00a <= rt5f859;      wwe0054 <= ~(jpe9afe == hd3d35f);      sjdf8e <= ps4d7f6;   end
end
fad5cc5 #(   .FADDR           (FADDR) )   fc2f353 (      .sys_clk         (sys_clk),   .rst_n           (rst_n),      .fa79b01      (dze3976),   .kf9ae61     (ip41f91),   .vvd730d       (qifc8d),   .ukb986e      (fn7e468),   .mrcc371     (wjf2347),   .xjcd80b  (vx1cbb7),   .eac1777     (yk6dee1),   .hqbbb8        (hqbbb8),   .jc5ddc2       (jc5ddc2),   .hoeee12      (hoeee12),   .fnd82ee        (dmfe774),   .ba250d2   (ba250d2),   .kd7a2e1          (alcc979),   .rtcdaa7     (gd26aed),      .thd20a8        (thd20a8),   .ie82a35  (),   .yzae707      (yzae707),   .hof1ae9   (fa7383c),   .ng9c1e2         (ng9c1e2),   .qge0f13        (qge0f13),   .qv7898        (qv7898),   .nrcd8df   (nrcd8df) ,   .ph9b05d  (ph9b05d),   .yz3360b     (yz3360b),   .tu637fb  (tu637fb),   .mg151a8  (mg151a8)  );
rtfc71e vx321a0 (      .sys_clk                  (sys_clk),   .rst_n                    (rst_n),      .pse18cc          (ldd748a),      .ls35987              (bl64b01),   .jrc662             (vxba456),      .zk63316           (vvd22b7),      .lf198b2               (xl915be),   .yxcc596                 (qv8adf7),   .os62cb4                 (cm56fbc),   .fp165a1               (dob7de1),   .xyb2d0e                 (yzbef0a),   .ba96872                 (off7854),
   .wlb4393            (gqbc2a4),   .uxa1c9c           (zke1520),   .vke4e4          (mga903),   .ay5cd66                 (cz75325),
`ifdef EN_VC0
   .hq93919                   (cb1d22c[23:0]),   .ri9c8cb                  (jpe9165[23:0]),   .tue465a                 (tu48b2f[23:0]),
`endif
`ifdef EN_VC1
   .sj232d3                   (cb1d22c[47:24]),   .hd1969c                  (jpe9165[47:24]),   .uicb4e7                 (tu48b2f[47:24]),
`endif
`ifdef EN_VC2
   .pf5a739                   (cb1d22c[71:48]),   .end39ce                  (jpe9165[71:48]),   .tw9ce75                 (tu48b2f[71:48]),
`endif
`ifdef EN_VC3
   .kde73aa                   (cb1d22c[95:72]),   .ux39d54                  (jpe9165[95:72]),   .kqceaa5                 (tu48b2f[95:72]),
`endif
`ifdef EN_VC4
   .ip75528                   (cb1d22c[119:96]),   .ntaa944                  (jpe9165[119:96]),   .al54a27                 (tu48b2f[119:96]),
`endif
`ifdef EN_VC5
   .lfa513c                   (cb1d22c[143:120]),   .hd289e7                  (jpe9165[143:120]),   .al44f3e                 (tu48b2f[143:120]),
`endif
`ifdef EN_VC6
   .hd279f5                   (cb1d22c[167:144]),   .an3cfaf                  (jpe9165[167:144]),   .ipe7d7d                 (tu48b2f[167:144]),
`endif
`ifdef EN_VC7
   .gq3ebed                   (cb1d22c[191:168]),   .ykf5f68                  (jpe9165[191:168]),   .phafb41                 (tu48b2f[191:168]),
`endif
      .os7da0f                    (uxa40c4),   .tx_pmtype                (ip7f3bf),   .ww683cd                (ph312b),   .tx_vsd_data              (wl1895f),      .yx4e2a2                 (yx4e2a2),   .al7fcee             (al7fcee),   .xw69c54                 (xw69c54),   .jce1a71                 (rt5f859),      .zx74783               (zx74783),   .qia3c1e              (qia3c1e),   .tw1e0f1              (hqb3f3),   .icf078a              (icf078a),   .ls83c50              (facfcd8),   .ls1e282               (ls1e282),      .yzae707               (yzae707),   .fa7383c           (fa7383c),   .ng9c1e2                  (ng9c1e2),   .qge0f13                 (qge0f13),   .qv7898                 (qv7898),         .ba250d2            (ba250d2),      .wwf5804               (wwf5804),   .vk30204                (vk30204),   .wyac021                 (wyac021),   .uv60109                (uv60109),   .ym84d                (ym84d),   .pu4269            (pu4269),   .qi2134a           (qi2134a),   .bn169d7               (bn169d7),
      .jpd27c8              (jpd27c8),   .do93e46             (do93e46),   .mt9f233            (mt9f233),   .rib82be               (rib82be),   .icc15f2               (icc15f2),      .xjc264f                 (xjc264f),   .jr1327f                (jr1327f),   .do993fe            (do993fe),   .qtc9ff3            (qtc9ff3),      .cm46737             (cm46737)   );
cm4c987 uk881f8 (      .sys_clk        (sys_clk),   .rst_n          (rst_n),      .ux36419 (ym923a9),   .ep85b3b   (vx91d48),   .nt2d9dd  (xl8ea46),   .yz3360b    (uxa4069),   .ph9b05d (ph9b05d),   .fnd82ee       (dmfe774),      .ie872fa    (ie872fa),   .sj397d1  (sj397d1),   .qgcbe8c  (qgcbe8c),   .fn5f460  (fn5f460),   .ayfa306   (ayfa306),   .rxdp_vsd_data  (rxdp_vsd_data) ,   .rxdp_pmd_type  (rxdp_pmd_type),   .rxdp_dllp_val  (rxdp_dllp_val),   .eac1777    (eac1777),   .hqbbb8       (hqbbb8),   .jc5ddc2      (jc5ddc2),   .hoeee12     (hoeee12),   .gdaecfa  (gdaecfa),   .cm77093     (cm77093)  );
assign {hbd84c9, qgf5531} = ie872fa;
ep23671 lfb52f3 (      .sys_clk        (sys_clk),   .rst_n          (rst_n),      .kqce314      (jpdd526),   .vi6ceee     (kqea937),   .go67772      (cz549b9),   .mg3bb90        (ana4dcc),   .xjddc80       (sj26e64),   .psee406       (lf37325),   .aaf45c          (aaf45c[0]),   .kd7a2e1         (alcc979),      .icd170d      (ou2a1),   .bn8b869        (je1508),   .me5c34e       (uka842),   .jce1a71       (jce1a71),   .mtd38a   (mtd38a),   .xw69c54       (xw69c54),   .yx4e2a2       (yx4e2a2),   .vv71515    (al7fcee)  );
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      yx6fc75  <= 1'b0 ;      icd170d <= 16'd0 ;      bn8b869   <= 1'b0 ;      me5c34e  <= 1'b0 ;   end   else begin      yx6fc75  <= ana4dcc ;      icd170d <= xj6bfb2 ;      bn8b869   <= dz5fd97 ;      me5c34e  <= psfecbf ;   end
end
always@* begin jpdd526<=ld7b613[0];alf2ba9<={oh362e6>>1,ld7b613[1]};ldd748a<={pse18cc>>1,ld7b613[2]};dze3976<=ld7b613[3];ip41f91<={kf9ae61>>1,ld7b613[4]};qifc8d<=ld7b613[5];fn7e468<=ld7b613[6];wjf2347<=ld7b613[7];vx1cbb7<=ld7b613[8];xl915be<=ld7b613[9];qv8adf7<={yxcc596>>1,ld7b613[10]};cm56fbc<={os62cb4>>1,ld7b613[11]};dob7de1<=ld7b613[12];yzbef0a<={xyb2d0e>>1,ld7b613[13]};off7854<={ba96872>>1,ld7b613[14]};gqbc2a4<={wlb4393>>1,ld7b613[15]};zke1520<={uxa1c9c>>1,ld7b613[16]};mga903<={vke4e4>>1,ld7b613[17]};cb1d22c<={me6705e>>1,ld7b613[18]};jpe9165<={lf382f0>>1,ld7b613[19]};tu48b2f<={mec1786>>1,ld7b613[20]};uxa40c4<=ld7b613[21];ip7f3bf<={tx_pmtype>>1,ld7b613[22]};ph312b<=ld7b613[23];wl1895f<={tx_vsd_data>>1,ld7b613[24]};kqea937<={vi6ceee>>1,ld7b613[25]};cz549b9<=ld7b613[26];ana4dcc<=ld7b613[27];sj26e64<=ld7b613[28];lf37325<=ld7b613[29];ym923a9<={ux36419>>1,ld7b613[30]};vx91d48<=ld7b613[31];xl8ea46<=ld7b613[32];cm4c960<={phy_ltssm_state>>1,ld7b613[33]};bl64b01<=ld7b613[34];alcc979<=ld7b613[35];kfaea64<={tj8b9ac>>1,ld7b613[36]};cz75325<={ay5cd66>>1,ld7b613[37]};an95d4c<=ld7b613[38];gd26aed<={rtcdaa7>>1,ld7b613[39]};vxba456<=ld7b613[40];vvd22b7<=ld7b613[41];zm2580e<={mgacc3b>>1,ld7b613[42]};yk6dee1<={eac1777>>1,ld7b613[43]};rt5f859<={jce1a71>>1,ld7b613[44]};uxa4069<={yz3360b>>1,ld7b613[45]};yk72b5b<={hbd84c9>>1,ld7b613[46]};fpa0404<={qgf5531>>1,ld7b613[47]};hqb3f3<={tw1e0f1>>1,ld7b613[48]};facfcd8<={ls83c50>>1,ld7b613[49]};kf809e9<=ld7b613[50];hq4f4d<=ld7b613[51];lf27a6b<={aa88f00>>1,ld7b613[52]};hd3d35f<={jc47801>>1,ld7b613[53]};jpe9afe<={wl3c00a>>1,ld7b613[54]};ps4d7f6<=ld7b613[55];xj6bfb2<={ou2a1>>1,ld7b613[56]};dz5fd97<=ld7b613[57];psfecbf<=ld7b613[58];end
always@* begin necf6c2[2047]<=oh362e6[0];necf6c2[2046]<=pse18cc[0];necf6c2[2044]<=fa79b01;necf6c2[2040]<=kf9ae61[0];necf6c2[2032]<=vvd730d;necf6c2[2016]<=ukb986e;necf6c2[2011]<=tj8b9ac[0];necf6c2[1984]<=mrcc371;necf6c2[1974]<=ay5cd66[0];necf6c2[1941]<=go67772;necf6c2[1920]<=xjcd80b;necf6c2[1901]<=mtb1735;necf6c2[1835]<=mg3bb90;necf6c2[1834]<=je1508;necf6c2[1793]<=lf198b2;necf6c2[1754]<=rtcdaa7[0];necf6c2[1749]<=mgacc3b[0];necf6c2[1721]<=aa88f00[0];necf6c2[1709]<=yz3360b[0];necf6c2[1679]<=lf382f0[0];necf6c2[1623]<=xjddc80;necf6c2[1621]<=uka842;necf6c2[1539]<=yxcc596[0];necf6c2[1526]<=ls35987;necf6c2[1482]<=wwe0054;necf6c2[1461]<=jrc662;necf6c2[1454]<=wya623c;necf6c2[1451]<=eac1777[0];necf6c2[1405]<=nt2d9dd;necf6c2[1394]<=jc47801[0];necf6c2[1387]<=tw1e0f1[0];necf6c2[1370]<=hbd84c9[0];necf6c2[1310]<=mec1786[0];necf6c2[1199]<=psee406;necf6c2[1145]<=tx_pmtype[0];necf6c2[1030]<=os62cb4[0];necf6c2[1023]<=kqce314;necf6c2[1005]<=kd7a2e1;necf6c2[970]<=vi6ceee[0];necf6c2[917]<=ou2a1[0];necf6c2[874]<=zk63316;necf6c2[860]<=ks311e0;necf6c2[854]<=jce1a71[0];necf6c2[839]<=me6705e[0];necf6c2[763]<=phy_ltssm_state[0];necf6c2[741]<=wl3c00a[0];necf6c2[727]<=ls83c50[0];necf6c2[702]<=ep85b3b;necf6c2[693]<=qgf5531[0];necf6c2[572]<=os7da0f;necf6c2[485]<=tx_vsd_data[0];necf6c2[419]<=vke4e4[0];necf6c2[351]<=ux36419[0];necf6c2[242]<=ww683cd;necf6c2[209]<=uxa1c9c[0];necf6c2[104]<=wlb4393[0];necf6c2[52]<=ba96872[0];necf6c2[26]<=xyb2d0e[0];necf6c2[13]<=fp165a1;end         assign suff972 = necf6c2,ld7b613 = cme5c87;   initial begin   jcc030e = $fopen(".fred");   $fdisplay( jcc030e, "%3h\n%3h", (thc27c7 >> 4) & fnc7fe5, (thc27c7 >> (mt9f1ff+4)) & fnc7fe5 );   $fclose(jcc030e);   $readmemh(".fred", qg721c0);   end   always @ (suff972) begin   ym8700c = qg721c0[1];       for (vk1872=0; vk1872<qgdb09f; vk1872=vk1872+1) begin           cme5c87[vk1872] = suff972[ym8700c];       rv38061  = ^(ym8700c & qg721c0[0]);       ym8700c =  {ym8700c, rv38061};       end   end
endmodule