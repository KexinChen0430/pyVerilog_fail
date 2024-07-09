module doee24 (
   input wire        sys_clk ,
   input wire        rst_n ,
   input wire [15:0] qgea597 ,
   input wire        tu52cb8 ,
   input wire        je965c3 ,
   input wire        dob2e1a ,
   input wire [11:0] eac1777 ,
   input wire        hqbbb8 ,
   input wire        jc5ddc2 ,
   input wire        hoeee12 ,
   input wire        by73e6d ,
   input wire        kd7a2e1 ,
   input wire        fnd82ee ,
   input wire [2:0]  rtcdaa7 ,
   output wire       os6d53f ,
   output reg [15:0] wy970d2 ,
   output reg        dob8690 ,
   output reg        czc3482 ,
   output wire       do3f363 ,
   output reg        hbf9b1b ,
   output wire       nrcd8df ,
   output reg        ph9b05d ,
   output reg        tu637fb ,
   output reg        mg151a8      ) ;
`ifdef MAX_TLP_512
localparam rgdfed3    = ((512/2) + 4) ;
localparam mt8a8ae   = 512/2 * 4 ;
localparam yx54574  = 10 ;
localparam psda6cb = 20 ;
localparam end365a = 8 ;
localparam rv9b2d4  = mt8a8ae/7 ;
`endif
`ifdef MAX_TLP_1K
localparam rgdfed3    = ((1024/2) + 4) ;
localparam mt8a8ae   = 1024/2 * 4 ;
localparam yx54574  = 11 ;
localparam psda6cb = 22 ;
localparam end365a = 9 ;
localparam rv9b2d4  = mt8a8ae/7 ;
`endif
`ifdef MAX_TLP_2K
localparam rgdfed3    = ((2048/2) + 4) ;
localparam mt8a8ae   = 2048/2 * 4 ;
localparam yx54574  = 12 ;
localparam psda6cb = 24 ;
localparam end365a = 10 ;
localparam rv9b2d4  = mt8a8ae/7 ;
`endif
`ifdef MAX_TLP_4K
localparam rgdfed3    = ((4096/2) + 4) ;
localparam mt8a8ae   = 4096/2 * 4 ;
localparam yx54574  = 13 ;
localparam psda6cb = 26 ;
localparam end365a = 11 ;
localparam rv9b2d4  = mt8a8ae/7 ;
`endif
reg [15:0]                 psdfe57 ;
reg                        goff2bb ;
reg                        fnf95d9 ;
reg                        rgcaece ;
reg                        lq57672 ;
reg                        uxbb392 ;
reg                        mrd9c95 ;
reg                        eace4ac ;
reg [yx54574 -1:0]  ks92b09 ;
reg [yx54574 -1:0]  gqac24c ;
reg [yx54574 -1:0]  zz930f ;
reg [yx54574 -1:0]  cm4c3f1 ;
reg [yx54574 -1:0]  swfc46 ;
reg [yx54574 -1:0]  tuf1187 ;
reg [end365a -1:0] me461d1 ;
reg [end365a -1:0] ec8744b ;
reg                        ls3a259 ;
reg                        qgd12cb ;
reg                        ls89659 ;
reg                        qt4b2ca ;
reg                        go59655 ;
reg                        mecb2a9 ;
reg                        ay59549 ;
reg                        rgcaa49 ;
reg                        nr5524a ;
reg [yx54574 -1:0]  qg492b9 ;
reg [end365a -1:0] xj4ae40 ;
reg                        ho57206 ;
reg                        tj13879 ;
reg                        xjc8190 ;
reg                        jp40c86 ;
reg                        bn6437 ;
reg                        ph321bf ;
reg                        ux90dff ;
reg                        ng86ffc ;
reg                        db37fe2 ;
reg [11:0]                 zzbff16 ;
reg [11:0]                 uiff8b6 ;
reg [11:0]                 jpfc5b0 ;
reg                        yxe2d86 ;
reg                        hd16c35 ;
reg [2:0]                  qib61af ;
reg [2:0]                  dbb0d79 ;
reg [12:0]                 ba86bcf ;
reg                        je35e7a ;
reg                        zzaf3d3 ;
reg                        ne79e9e ;
reg                        hocf4f3 ;
reg                        of7a79b ;
reg                        qtd3cdd ;
reg                        nt9e6ed;
reg                        pff376e ;
reg                        vx9bb77 ;
reg                        ou1f0d5 ;
reg [2:0]                  czeddfe ;
reg                        nr6eff4 ;
reg                        yk77fa7 ;
wire [end365a -1:0] nefe9c6 ;
wire [yx54574 -1:0]  baa7193 ;
wire [yx54574:0]     qtc64d7 ;
wire [psda6cb -1:0] ri935ef ;
wire [psda6cb -1:0] rtd7bd5 ;
wire [end365a -1:0] cmef57b ;
wire [15:0]                 mr7abd8 ;
wire [11:0]                 tj134c4 ;
wire                        xlaf622 ;
wire                        zx7b116 ;
wire                        bld88b7 ;
wire                        uic45be ;
wire                        hd22df0 ;
wire                        bn16f87 ;
wire                        vkb7c3f ;
wire                        mtbe1fa ;
wire                        ykf0fd5 ;
wire                        mg87ea9 ;
wire                        tw3f548 ;
wire                        cmfaa43 ;
wire                        tud5218 ;
wire                        iea90c3 ;
wire                        lq48619 ;
wire                        os430ca ;
reg [12:0] oh18651 ;
reg [12:0] alc328d ;
`ifdef ECP3
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
`ifdef ECP3
`else
`endif
`ifdef ECP3
`else
`endif
reg [15 : 0] gqa546;
reg fa52a31;
reg cb9518b;
reg doa8c5d;
reg [11 : 0] yk6dee1;
reg gb6f708;
reg th7b844;
reg aldc226;
reg rge1135;
reg alcc979;
reg ng1a6b;
reg [2 : 0] gd26aed;
reg [15 : 0] ri3576d;
reg gdabb6a;
reg vi5db55;
reg aledaaa;
reg ui6d554;
reg en6aaa1;
reg hb5550d;
reg tjaa86f;
reg [yx54574 - 1 : 0] ira1bfd;
reg [yx54574 - 1 : 0] qt6ff65;
reg [yx54574 - 1 : 0] offd96c;
reg [yx54574 - 1 : 0] cz65b2e;
reg [yx54574 - 1 : 0] ps6cba6;
reg [yx54574 - 1 : 0] ie2e994;
reg [end365a - 1 : 0] coa650f;
reg [end365a - 1 : 0] vx943c6;
reg ana1e37;
reg qif1bc;
reg go78de1;
reg enc6f09;
reg jr3784c;
reg swbc266;
reg rge1330;
reg db9983;
reg go4cc1f;
reg [yx54574 - 1 : 0] fc307ca;
reg [end365a - 1 : 0] aa1f292;
reg pff9490;
reg os46629;
reg fa52433;
reg wy9219a;
reg ep90cd0;
reg pu86684;
reg wl33423;
reg yz9a11d;
reg xwd08ec;
reg [11 : 0] nt84762;
reg [11 : 0] cb23b16;
reg [11 : 0] mt1d8b5;
reg hbec5ac;
reg cm62d67;
reg [2 : 0] nt16b39;
reg [2 : 0] phb59cf;
reg [12 : 0] swace7f;
reg ic673f8;
reg ep39fc0;
reg necfe05;
reg gb7f02a;
reg enf8155;
reg jcc0aac;
reg ym5563;
reg ls2ab18;
reg ld558c3;
reg aa9d0c0;
reg [2 : 0] ne630f1;
reg sj1878a;
reg gbc3c55;
reg [end365a - 1 : 0] psf1562;
reg [yx54574 - 1 : 0] fn55894;
reg [yx54574 : 0] su62531;
reg [psda6cb - 1 : 0] lf94c45;
reg [psda6cb - 1 : 0] ec31170;
reg [end365a - 1 : 0] rt45c01;
reg [15 : 0] ks2e00f;
reg [11 : 0] fc96b65;
reg kf803c4;
reg do1e24;
reg cof123;
reg yk78919;
reg qgc48c9;
reg co24649;
reg mt23249;
reg lf1924c;
reg czc9267;
reg ui4933c;
reg ic499e0;
reg ui4cf01;
reg me67809;
reg oh3c049;
reg kqe024c;
reg xy1261;
reg [12 : 0] fp930a;
reg [12 : 0] su49856;
reg [2047:0] necf6c2;
wire [94:0] ld7b613;
`ifdef MAX_TLP_512
`endif
`ifdef MAX_TLP_1K
`endif
`ifdef MAX_TLP_2K
`endif
`ifdef MAX_TLP_4K
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
`ifdef ECP3
`else
`endif
`ifdef ECP3
`else
`endif
`ifdef ECP3
`else
`endif
localparam qgdb09f = 95,nrd84f8 = 32'hfdffd48b;
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
`ifdef ECP3
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
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n)      czeddfe <= 3'b000 ;   else      czeddfe <= gd26aed ;
end
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n)      oh18651 <= 12'd0 ;   else begin      case (ne630f1)         3'd0 : oh18651 <= 13'd176 ;           3'd1 : oh18651 <= 13'd368 ;           3'd2 : oh18651 <= 13'd752 ;           3'd3 : oh18651 <= 13'd1520 ;          3'd4 : oh18651 <= 13'd3056 ;          3'd5 : oh18651 <= 13'd6128 ;          3'd6 : oh18651 <= 13'd208 ;         3'd7 : oh18651 <= 13'd208 ;      endcase   end
end
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n)      alc328d <= 12'd0 ;   else begin      case (ne630f1)         3'd0 : alc328d <= 13'd360 ;           3'd1 : alc328d <= 13'd630 ;           3'd2 : alc328d <= 13'd840 ;           3'd3 : alc328d <= 13'd1610 ;          3'd4 : alc328d <= 13'd3150 ;          3'd5 : alc328d <= 13'd6230 ;          3'd6 : alc328d <= 13'd360 ;         3'd7 : alc328d <= 13'd360 ;      endcase   end
end
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n) begin      psdfe57  <= 16'b0 ;      goff2bb    <= 1'b0 ;      fnf95d9   <= 1'b0 ;      rgcaece <= 1'b0 ;   end   else begin      psdfe57  <= gqa546 ;      goff2bb    <= fa52a31 ;      fnf95d9   <= cb9518b ;      rgcaece <= doa8c5d ;   end
end
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n)      uxbb392 <= 1'b0 ;   else if (fa52a31)      uxbb392 <= 1'b1 ;   else if (vi5db55 || aledaaa)      uxbb392 <= 1'b0 ;   else      uxbb392 <= en6aaa1 ;
end
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n)      swfc46 <= {(yx54574){1'b1}} ;   else if (jr3784c && en6aaa1)      swfc46 <= {(yx54574){1'b0}} ;   else if (en6aaa1)      swfc46 <= ps6cba6 + 1'b1 ;   else if (jr3784c)      swfc46 <= {(yx54574){1'b1}} ;   else      swfc46 <= ps6cba6 ;
end
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n)      zzbff16 <= 12'hFFF ;   else if (fa52a31)      zzbff16 <= gqa546[11:0];   else      zzbff16 <= nt84762 ;
end
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n)      uiff8b6 <= 12'hFFF ;   else if (cb9518b)      uiff8b6 <= nt84762;   else      uiff8b6 <= cb23b16 ;
end
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n)      cm4c3f1 <= {(yx54574){1'b0}} ;   else if (gdabb6a)      cm4c3f1 <= ira1bfd ;   else      cm4c3f1 <= cz65b2e ;
end
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n)      ks92b09 <= {(yx54574){1'b0}} ;   else if (ng1a6b)      ks92b09 <= {(yx54574){1'b0}} ;   else if (aledaaa)      ks92b09 <= cz65b2e ;   else if (en6aaa1)      ks92b09 <= ira1bfd + 1'b1 ;   else      ks92b09 <= ira1bfd ;
end
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n)      mrd9c95 <= 1'b0 ;   else if (pff9490 ||            (hbec5ac && rge1135 && go4cc1f && !necfe05))      mrd9c95 <= 1'b1 ;   else if (mt23249)      mrd9c95 <= 1'b0 ;   else      mrd9c95 <= hb5550d  ;
end
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n)      gqac24c <= {(yx54574){1'b0}} ;   else if (ng1a6b)      gqac24c <= {(yx54574){1'b0}} ;   else if (kf803c4)      gqac24c <= cz65b2e ;   else if ( pff9490 ||             (vi5db55 & ~rge1135 & ~kf803c4) ||     (aledaaa & ~rge1135 & ~kf803c4) ||             (!rge1135 & pu86684) ||             (hbec5ac & rge1135 & go4cc1f & ~necfe05))      gqac24c <= ec31170[(psda6cb/2)-1:0] ;   else if (co24649 & ~cm62d67)      gqac24c <= fc307ca ;   else if (hb5550d)      gqac24c <= qt6ff65 + 1'b1 ;   else      gqac24c <= qt6ff65 ;
end
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n)      ne79e9e <= 1'b0 ;   else if (rge1330 && do1e24)      ne79e9e <= 1'b1 ;   else if (dob8690 && !do1e24)      ne79e9e <= 1'b0 ;   else if (ph9b05d)      ne79e9e <= 1'b0 ;   else      ne79e9e <= necfe05 ;
end
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n)      tuf1187 <= {(yx54574){1'b1}} ;   else if (necfe05 && ph9b05d)      tuf1187 <= {(yx54574){1'b1}} ;   else if ( pff9490 ||             (hbec5ac & rge1135 & go4cc1f & !necfe05))      tuf1187 <= ec31170[psda6cb -1:(psda6cb/2)] ;   else if (hb5550d)      tuf1187 <= ie2e994 - 1'b1 ;   else      tuf1187 <= ie2e994 ;
end
assign qtc64d7 = ira1bfd + ~qt6ff65 + 1'b1 ;
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n)      zz930f <= {(yx54574){1'b0}} ;   else if (ng1a6b || kf803c4)      zz930f <= {(yx54574){1'b0}} ;   else if ((wl33423 && !th7b844) ||            ph9b05d || ((cb9518b || doa8c5d)) ||            (ps6cba6 == rgdfed3-18) ) begin      if (su62531[yx54574] )         zz930f <= su62531[yx54574 -1:0] + {(yx54574){1'b1}} ;      else         zz930f <= su62531[yx54574 -1:0] ;   end   else      zz930f <= offd96c ;
end
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n) begin      nr6eff4   <= 1'b0 ;      yk77fa7   <= 1'b0 ;      hbf9b1b <= 1'b0 ;   end   else if (ng1a6b) begin      nr6eff4   <= 1'b0 ;      yk77fa7   <= 1'b0 ;      hbf9b1b <= 1'b0 ;   end   else if (offd96c >= fp930a) begin      nr6eff4   <= 1'b1 ;      hbf9b1b <= 1'b1 ;   end      else if (os6d53f) begin      yk77fa7   <= 1'b1 ;      hbf9b1b <= 1'b1 ;   end      else if (~|fc96b65 && gbc3c55) begin      yk77fa7   <= 1'b0 ;      hbf9b1b <= 1'b0 ;   end      else if (!os6d53f & (offd96c < fp930a) && sj1878a) begin      nr6eff4   <= 1'b0 ;      hbf9b1b <= 1'b0 ;   end   else      hbf9b1b <= hbf9b1b ;
end
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n) begin      eace4ac    <= 1'b0 ;      lq57672     <= 1'b0 ;      of7a79b <= 1'b0 ;   end   else begin      eace4ac    <= qgc48c9 ;      lq57672     <= (vi5db55 | aledaaa) ;      of7a79b <= ui6d554 ;   end
end
assign vkb7c3f = (ie2e994 == {(yx54574){1'b0}}) ;
assign hd22df0 = ((qt6ff65 == {(yx54574){1'b0}}) &                    (ira1bfd == {(yx54574){1'b0}})) |                    (qt6ff65 == (ira1bfd - 1)) ;
pmi_ram_dp #(   .pmi_wr_addr_depth    ( mt8a8ae ),   .pmi_wr_addr_width    ( yx54574 ),   .pmi_wr_data_width    ( 16 ),   .pmi_rd_addr_depth    ( mt8a8ae ),   .pmi_rd_addr_width    ( yx54574 ),   .pmi_rd_data_width    ( 16 ),   .pmi_regmode          ( "noreg" ),   .pmi_gsr              ( "enable" ),
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
   .module_type          ("pmi_ram_dp")   )   pff6257 (   .Data         ( psdfe57 ),   .WrAddress    ( ks92b09 ),   .RdAddress    ( gqac24c ),   .WrClock      ( sys_clk ),   .RdClock      ( sys_clk ),   .WrClockEn    ( 1'b1 ),   .RdClockEn    ( mrd9c95 ),   .WE           ( uxbb392 ),
`ifdef ECP3
   .Reset        (1'b0),
`else
   .Reset        (~rst_n),
`endif
   .Q            ( mr7abd8 )   );
assign ri935ef = {ps6cba6, cz65b2e} ;
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n)      go59655     <= 1'b0 ;   else      go59655     <= (vi5db55 && !aledaaa) ;
end
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n)      me461d1 <= {(end365a){1'b0}} ;   else if (ng1a6b)      me461d1 <= {(end365a){1'b0}} ;   else if (jr3784c)      me461d1 <= coa650f + 1'b1 ;   else      me461d1 <= coa650f ;
end
assign xlaf622  = (vx943c6 == coa650f) ;
assign nefe9c6 = (coa650f-1) ;
assign zx7b116 = (vx943c6 == psf1562) ;
assign bld88b7 = (mt23249 & ~necfe05) & ~kf803c4 ;
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n)      ec8744b <= {(end365a){1'b0}} ;   else if (ng1a6b)      ec8744b <= {(end365a){1'b0}} ;   else if (co24649 || enf8155 ||            (!rge1135 && !os46629 && wy9219a) ||            (gb6f708 && ~|fc96b65) ) begin      if (cm62d67 || wy9219a )         ec8744b <= rt45c01 ;      else         ec8744b <= (aa1f292) ;   end   else if (go78de1)      ec8744b <= vx943c6 + 1'b1 ;   else      ec8744b <= vx943c6 ;
end
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n) begin      jp40c86  <= 1'b0 ;      bn6437 <= 1'b0 ;      ph321bf <= 1'b0 ;      ux90dff <= 1'b0 ;      ng86ffc    <= 1'b0 ;      ls3a259  <= 1'b0 ;      qgd12cb <= 1'b0 ;      ls89659       <= 1'b0 ;      qt4b2ca   <= 1'b0 ;   end   else begin      jp40c86  <= aldc226 ;      bn6437 <= wy9219a ;      ph321bf <= ep90cd0 ;      ux90dff <= pu86684 ;      ng86ffc    <= gb6f708 ;      ls3a259  <= kf803c4 ;      qgd12cb <= ana1e37 ;      ls89659       <= cof123  ;      qt4b2ca   <= go78de1 ;   end
end
assign uic45be = kf803c4 & ~ana1e37 ;
assign nrcd8df = qif1bc ;
pmi_ram_dp #(   .pmi_wr_addr_depth    ( rv9b2d4 ),   .pmi_wr_addr_width    ( end365a ),   .pmi_wr_data_width    ( psda6cb ),   .pmi_rd_addr_depth    ( rv9b2d4 ),   .pmi_rd_addr_width    ( end365a ),   .pmi_rd_data_width    ( psda6cb ),   .pmi_regmode          ( "noreg" ),   .pmi_gsr              ( "enable" ),
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
   .module_type          ("pmi_ram_dp")   )   fafbb9b (   .Data         ( ri935ef ),   .WrAddress    ( me461d1 ),   .RdAddress    ( ec8744b ),   .WrClock      ( sys_clk ),   .RdClock      ( sys_clk ),   .WrClockEn    ( 1'b1 ),   .RdClockEn    ( 1'b1 ),   .WE           ( go59655 ),
`ifdef ECP3
   .Reset        (1'b0),
`else
   .Reset        (~rst_n),
`endif
   .Q            ( rtd7bd5 )   );
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n)      jpfc5b0 <= 12'h000 ;   else if (gb6f708 || aldc226)      jpfc5b0 <= yk6dee1 ;   else      jpfc5b0 <= mt1d8b5 ;
end
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n)      hd16c35 <= 1'b0 ;   else if (aldc226)      hd16c35 <= 1'b1 ;   else if (enc6f09 || mt23249 || enf8155 )      hd16c35 <= 1'b0 ;   else      hd16c35 <= cm62d67 ;
end
assign tj134c4 = cb23b16 + ~mt1d8b5 + 1 ;
assign cmef57b = coa650f + ~fc96b65 + 1 ;
assign baa7193 =  ec31170[10:0] ;
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n) begin      xjc8190    <= 1'b0 ;      db37fe2     <= 1'b0 ;      ho57206  <= 1'b0 ;      hocf4f3 <= 1'b0 ;      nt9e6ed   <= 1'b0 ;      ou1f0d5       <= 1'b0 ;   end   else  begin      xjc8190    <= th7b844 ;      db37fe2     <= rge1135  ;      ho57206  <= (czc9267 & hbec5ac) |                          (rge1135 & jcc0aac & ym5563) ;      hocf4f3 <= mt23249 ;      nt9e6ed   <= ph9b05d ;      ou1f0d5       <= alcc979 ;   end
end
assign mtbe1fa = th7b844 & ~fa52433 ;
assign ykf0fd5  = rge1135 & ~xwd08ec ;
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n) begin      qg492b9 <= {(yx54574){1'b0}} ;      xj4ae40 <= {(end365a){1'b0}} ;   end   else if (cm62d67 & (mt23249 || enf8155)) begin      qg492b9  <= fn55894 ;      xj4ae40 <= rt45c01 ;   end   else if (ui4933c) begin      qg492b9  <= qt6ff65 ;      xj4ae40 <= vx943c6 ;   end   else begin      qg492b9  <= fc307ca ;      xj4ae40 <= aa1f292 ;   end
end
assign bn16f87= (gb7f02a & necfe05 & rge1135) ;
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n)      qib61af <= 3'b000 ;      else  if (ng1a6b || ((nt16b39 == 3'b100) && ph9b05d ) || (aldc226 && !th7b844))      qib61af <= 3'b000 ;   else  if ((lf1924c  || tu637fb) && !kf803c4)      qib61af <= nt16b39 + 3'b001 ;
end
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n) begin      dbb0d79 <= 3'b000 ;      mg151a8 <= 1'b0 ;   end   else begin      dbb0d79 <= nt16b39 ;      mg151a8 <= ((nt16b39 == 3'b100) & (phb59cf == 3'b011)) ;   end
end
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n)      ba86bcf  <= 13'h0000 ;   else  if (kqe024c || xy1261 || yk78919)      ba86bcf <= 13'h0000 ;   else  if (ic499e0 || ls2ab18 ||             ld558c3 || kf803c4 )      ba86bcf <= swace7f ;   else      ba86bcf <= swace7f + 13'h0001 ;
end
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n)      je35e7a <= 1'b0 ;   else  if (xy1261)      je35e7a <= 1'b1 ;   else  if (kqe024c || ic499e0 ||             ls2ab18 || ld558c3 || tjaa86f)      je35e7a <= 1'b0 ;   else      je35e7a <= ic673f8 ;
end
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n)      zzaf3d3 <= 1'b0 ;   else  if (fa52433 && db9983 )      zzaf3d3 <= 1'b1 ;   else  if (!fa52433)      zzaf3d3 <= 1'b0 ;   else      zzaf3d3 <= ep39fc0 ;
end
assign tw3f548 = ~ep39fc0 & fa52433 & (|fc96b65) ;
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n)      pff376e <= 1'b0 ;   else  if (ui4cf01 )      pff376e <= 1'b1 ;   else  if (xy1261 | oh3c049 | me67809 | mg151a8)      pff376e <= 1'b0 ;   else      pff376e <= ls2ab18 ;
end
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n)      vx9bb77 <= 1'b0 ;   else  if (mg151a8 )      vx9bb77 <= 1'b1 ;   else  if (alcc979 & ~aa9d0c0)      vx9bb77 <= 1'b0 ;   else      vx9bb77 <= ld558c3 ;
end
assign tud5218 = (~kf803c4 & lf1924c) ;
assign iea90c3 = (~kf803c4 & yz9a11d) ;
assign cmfaa43 = (swace7f == su49856)  ;
assign lq48619 = oh3c049 | me67809 | ui4cf01 ;
assign os430ca =  (!ic673f8 & (cb9518b | db9983)) ;
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n)      tu637fb   <= 1'b0 ;   else      tu637fb   <= ui4cf01 ;
end
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n)      qtd3cdd <= 1'b0 ;   else if  (tu637fb && xwd08ec)      qtd3cdd <= 1'b1 ;   else if (!xwd08ec)      qtd3cdd <= 1'b0 ;
end
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n)      yxe2d86 <= 1'b0 ;   else if (ng1a6b)      yxe2d86 <= 1'b0 ;  else if ((lf1924c  || tu637fb) && !kf803c4 && (nt16b39 != 3'b011))      yxe2d86 <= 1'b1 ;  else  if ((alcc979 & ~aa9d0c0) && !kf803c4 && (nt16b39 == 3'b100))      yxe2d86 <= 1'b1 ;   else if (ph9b05d || (gb6f708 && ~|fc96b65))      yxe2d86 <= 1'b0 ;   else if (jcc0aac )      yxe2d86 <= 1'b1 ;   else      yxe2d86 <= hbec5ac ;
end
assign os6d53f = hbec5ac | jcc0aac ;
assign mg87ea9 = hbec5ac & ~os46629 ;
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n)      ph9b05d <= 1'b0 ;      else if (co24649)      ph9b05d <= 1'b1 ;   else if (th7b844 && ~|fc96b65 && kf803c4)      ph9b05d <= lf1924c ;   else      ph9b05d <= 1'b0 ;
end
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n) begin      tj13879  <= 1'b0 ;      mecb2a9  <= 1'b0 ;      wy970d2     <= 16'b0 ;      ay59549   <= 1'b0 ;      dob8690       <= 1'b0 ;      rgcaa49 <= 1'b0 ;      czc3482     <= 1'b0 ;      nr5524a <= 1'b0 ;   end   else begin      tj13879  <= hbec5ac ;      mecb2a9  <= hb5550d ;      wy970d2     <= swbc266 ? ks2e00f[15:0] : 16'h0000 ;      ay59549   <= (hb5550d & ~swbc266) ;      dob8690       <= rge1330 ;      rgcaa49 <= mt23249 ;      czc3482     <= db9983 ;      nr5524a <= czc3482 ;   end
end
assign do3f363 =  mt23249 ;
always@* begin gqa546<={qgea597>>1,ld7b613[0]};fa52a31<=ld7b613[1];cb9518b<=ld7b613[2];doa8c5d<=ld7b613[3];yk6dee1<={eac1777>>1,ld7b613[4]};gb6f708<=ld7b613[5];th7b844<=ld7b613[6];aldc226<=ld7b613[7];rge1135<=ld7b613[8];alcc979<=ld7b613[9];ng1a6b<=ld7b613[10];gd26aed<={rtcdaa7>>1,ld7b613[11]};ri3576d<={psdfe57>>1,ld7b613[12]};gdabb6a<=ld7b613[13];vi5db55<=ld7b613[14];aledaaa<=ld7b613[15];ui6d554<=ld7b613[16];en6aaa1<=ld7b613[17];hb5550d<=ld7b613[18];tjaa86f<=ld7b613[19];ira1bfd<={ks92b09>>1,ld7b613[20]};qt6ff65<={gqac24c>>1,ld7b613[21]};offd96c<={zz930f>>1,ld7b613[22]};cz65b2e<={cm4c3f1>>1,ld7b613[23]};ps6cba6<={swfc46>>1,ld7b613[24]};ie2e994<={tuf1187>>1,ld7b613[25]};coa650f<={me461d1>>1,ld7b613[26]};vx943c6<={ec8744b>>1,ld7b613[27]};ana1e37<=ld7b613[28];qif1bc<=ld7b613[29];go78de1<=ld7b613[30];enc6f09<=ld7b613[31];jr3784c<=ld7b613[32];swbc266<=ld7b613[33];rge1330<=ld7b613[34];db9983<=ld7b613[35];go4cc1f<=ld7b613[36];fc307ca<={qg492b9>>1,ld7b613[37]};aa1f292<={xj4ae40>>1,ld7b613[38]};pff9490<=ld7b613[39];os46629<=ld7b613[40];fa52433<=ld7b613[41];wy9219a<=ld7b613[42];ep90cd0<=ld7b613[43];pu86684<=ld7b613[44];wl33423<=ld7b613[45];yz9a11d<=ld7b613[46];xwd08ec<=ld7b613[47];nt84762<={zzbff16>>1,ld7b613[48]};cb23b16<={uiff8b6>>1,ld7b613[49]};mt1d8b5<={jpfc5b0>>1,ld7b613[50]};hbec5ac<=ld7b613[51];cm62d67<=ld7b613[52];nt16b39<={qib61af>>1,ld7b613[53]};phb59cf<={dbb0d79>>1,ld7b613[54]};swace7f<={ba86bcf>>1,ld7b613[55]};ic673f8<=ld7b613[56];ep39fc0<=ld7b613[57];necfe05<=ld7b613[58];gb7f02a<=ld7b613[59];enf8155<=ld7b613[60];jcc0aac<=ld7b613[61];ym5563<=ld7b613[62];ls2ab18<=ld7b613[63];ld558c3<=ld7b613[64];aa9d0c0<=ld7b613[65];ne630f1<={czeddfe>>1,ld7b613[66]};sj1878a<=ld7b613[67];gbc3c55<=ld7b613[68];psf1562<={nefe9c6>>1,ld7b613[69]};fn55894<={baa7193>>1,ld7b613[70]};su62531<={qtc64d7>>1,ld7b613[71]};lf94c45<={ri935ef>>1,ld7b613[72]};ec31170<={rtd7bd5>>1,ld7b613[73]};rt45c01<={cmef57b>>1,ld7b613[74]};ks2e00f<={mr7abd8>>1,ld7b613[75]};fc96b65<={tj134c4>>1,ld7b613[76]};kf803c4<=ld7b613[77];do1e24<=ld7b613[78];cof123<=ld7b613[79];yk78919<=ld7b613[80];qgc48c9<=ld7b613[81];co24649<=ld7b613[82];mt23249<=ld7b613[83];lf1924c<=ld7b613[84];czc9267<=ld7b613[85];ui4933c<=ld7b613[86];ic499e0<=ld7b613[87];ui4cf01<=ld7b613[88];me67809<=ld7b613[89];oh3c049<=ld7b613[90];kqe024c<=ld7b613[91];xy1261<=ld7b613[92];fp930a<={oh18651>>1,ld7b613[93]};su49856<={alc328d>>1,ld7b613[94]};end
always@* begin necf6c2[2047]<=tu52cb8;necf6c2[2046]<=je965c3;necf6c2[2044]<=dob2e1a;necf6c2[2040]<=eac1777[0];necf6c2[2032]<=hqbbb8;necf6c2[2018]<=jp40c86;necf6c2[2017]<=jc5ddc2;necf6c2[1989]<=bn6437;necf6c2[1987]<=hoeee12;necf6c2[1931]<=ph321bf;necf6c2[1927]<=by73e6d;necf6c2[1865]<=lq57672;necf6c2[1859]<=mecb2a9;necf6c2[1844]<=qib61af[0];necf6c2[1815]<=ux90dff;necf6c2[1806]<=kd7a2e1;necf6c2[1719]<=oh18651[0];necf6c2[1717]<=cmfaa43;necf6c2[1682]<=uxbb392;necf6c2[1674]<=ne79e9e;necf6c2[1671]<=ay59549;necf6c2[1640]<=dbb0d79[0];necf6c2[1603]<=bld88b7;necf6c2[1582]<=ng86ffc;necf6c2[1565]<=fnd82ee;necf6c2[1488]<=qt4b2ca;necf6c2[1485]<=yxe2d86;necf6c2[1453]<=lq48619;necf6c2[1391]<=alc328d[0];necf6c2[1387]<=tud5218;necf6c2[1326]<=me461d1[0];necf6c2[1317]<=mrd9c95;necf6c2[1300]<=hocf4f3;necf6c2[1297]<=ou1f0d5;necf6c2[1295]<=rgcaa49;necf6c2[1233]<=ba86bcf[0];necf6c2[1210]<=ls3a259;necf6c2[1189]<=cm4c3f1[0];necf6c2[1172]<=ks92b09[0];necf6c2[1158]<=uic45be;necf6c2[1124]<=mr7abd8[0];necf6c2[1116]<=db37fe2;necf6c2[1105]<=qtd3cdd;necf6c2[1094]<=qtc64d7[0];necf6c2[1092]<=nr6eff4;necf6c2[1087]<=qg492b9[0];necf6c2[1082]<=rtcdaa7[0];necf6c2[1077]<=vkb7c3f;necf6c2[1023]<=qgea597[0];necf6c2[1009]<=xjc8190;necf6c2[932]<=rgcaece;necf6c2[929]<=go59655;necf6c2[922]<=hd16c35;necf6c2[859]<=os430ca;necf6c2[858]<=tw3f548;necf6c2[837]<=zzaf3d3;necf6c2[801]<=zx7b116;necf6c2[744]<=ls89659;necf6c2[742]<=jpfc5b0[0];necf6c2[726]<=iea90c3;necf6c2[663]<=tuf1187[0];necf6c2[648]<=vx9bb77;necf6c2[605]<=ec8744b[0];necf6c2[594]<=zz930f[0];necf6c2[586]<=eace4ac;necf6c2[562]<=cmef57b[0];necf6c2[552]<=of7a79b;necf6c2[547]<=baa7193[0];necf6c2[546]<=czeddfe[0];necf6c2[543]<=nr5524a;necf6c2[538]<=bn16f87;necf6c2[504]<=tj13879;necf6c2[466]<=fnf95d9;necf6c2[429]<=mg87ea9;necf6c2[418]<=je35e7a;necf6c2[400]<=xlaf622;necf6c2[372]<=qgd12cb;necf6c2[371]<=uiff8b6[0];necf6c2[331]<=swfc46[0];necf6c2[324]<=pff376e;necf6c2[297]<=gqac24c[0];necf6c2[281]<=rtd7bd5[0];necf6c2[273]<=nefe9c6[0];necf6c2[269]<=hd22df0;necf6c2[252]<=ho57206;necf6c2[233]<=goff2bb;necf6c2[214]<=ykf0fd5;necf6c2[200]<=tj134c4[0];necf6c2[185]<=zzbff16[0];necf6c2[162]<=nt9e6ed;necf6c2[140]<=ri935ef[0];necf6c2[136]<=yk77fa7;necf6c2[126]<=xj4ae40[0];necf6c2[116]<=psdfe57[0];necf6c2[107]<=mtbe1fa;end         assign suff972 = necf6c2,ld7b613 = cme5c87;   initial begin   jcc030e = $fopen(".fred");   $fdisplay( jcc030e, "%3h\n%3h", (thc27c7 >> 4) & fnc7fe5, (thc27c7 >> (mt9f1ff+4)) & fnc7fe5 );   $fclose(jcc030e);   $readmemh(".fred", qg721c0);   end   always @ (suff972) begin   ym8700c = qg721c0[1];       for (vk1872=0; vk1872<qgdb09f; vk1872=vk1872+1) begin           cme5c87[vk1872] = suff972[ym8700c];       rv38061  = ^(ym8700c & qg721c0[0]);       ym8700c =  {ym8700c, rv38061};       end   end
endmodule