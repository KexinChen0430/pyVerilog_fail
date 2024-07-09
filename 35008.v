module an8879 #(
   parameter FADDR = 6 )
   (
   input wire            sys_clk ,
   input wire            rst_n ,
   input wire            fa79b01 ,
   input wire            xjcd80b ,
   input wire            lq6c05f ,
   input wire            kd602fb ,
   input wire            xy17dd ,
   input wire [FADDR:0]  ba250d2 ,
   input wire            kd7a2e1 ,
   input wire            nrdd4b2 ,
   input wire [15:0]     qgea597 ,
   input wire            tu52cb8 ,
   input wire            je965c3 ,
   input wire            dob2e1a ,
   input wire [15:0]     wy970d2 ,
   input wire            dob8690 ,
   input wire            czc3482 ,
   input wire            uk1a415 ,
   output reg            thd20a8 ,
   output wire           gd90546 ,
   output wire           ie82a35 ,
   output reg            mg151a8 ,
   output wire [15:0]    ie8df3e ,
   output wire           wj6f9f1 ,
   output wire           tu7cf8d ,
   output wire           ene7c6b          ) ;
reg                 sh41413 ;
reg                 oua09c ;
reg                 th504e1 ;
reg                 ie8270f ;
reg                 tj13879 ;
reg                 je9c3cf ;
reg                 ou1f0d5 ;
reg                 aaf3da ;
reg                 jc79ed1 ;
reg                 bycf68b ;
reg [4:0]           th7b45b ;
reg                 dmda2df ;
reg                 kqd16fa ;
reg                 rv8b7d1 ;
reg                 qt5be8f ;
reg                 psdf47d ;
reg [4:0]           cmfa3ea ;
wire                wwd1f51 ;
wire                ep8fa88 ;
wire                kq7d444 ;
wire                eaea220 ;
wire                cz51100 ;
wire                co88805 ;
wire                al44029 ;
wire                ba2014c ;
wire                coa63 ;
wire                uk5319 ;
wire                gd298c8 ;
wire                qg4c644 ;
wire                dm63220 ;
wire                rv19102 ;
wire                zxc8817 ;
wire                cz440bf ;
wire                ri205fc ;
wire                cb2fe3 ;
reg       sj17f1c ;
reg [2:0] dbbf8e5 ;
parameter dzfc72e = 4 ;
reg dze3976;
reg vx1cbb7;
reg yke5dbe;
reg aa2edf0;
reg zk76f81;
reg [FADDR : 0] gdbe052;
reg alcc979;
reg rv814a8;
reg [15 : 0] gqa546;
reg fa52a31;
reg cb9518b;
reg doa8c5d;
reg [15 : 0] su462ea;
reg sw31751;
reg ph8ba88;
reg vi5d446;
reg cmea233;
reg mr51198;
reg ec88cc5;
reg os46629;
reg oh33149;
reg aa9d0c0;
reg psc5268;
reg sj29342;
reg me49a15;
reg [4 : 0] by4d0a9;
reg me6854a;
reg rg42a51;
reg gq1528a;
reg iea9451;
reg nr4a289;
reg [4 : 0] kd5144f;
reg qv8a27d;
reg ip513ed;
reg zm89f6d;
reg dz4fb6b;
reg cm7db5e;
reg yxedaf1;
reg ea6d78c;
reg hb6bc61;
reg en5e30f;
reg tuf187c;
reg zm8c3e3;
reg zx61f1a;
reg ief8d6;
reg rg7c6b0;
reg lde3582;
reg aa1ac16;
reg shd60b1;
reg zzb058c;
reg qi82c66;
reg [2 : 0] bn16330;
reg [2047:0] necf6c2;
wire [51:0] ld7b613;
localparam qgdb09f = 52,nrd84f8 = 32'hfdfff02b;
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
assign ie8df3e = (gqa546 | su462ea) ;
assign wj6f9f1   = (sw31751 | fa52a31) ;
assign tu7cf8d = (cb9518b | ph8ba88) ;
assign ene7c6b = doa8c5d ;
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n) begin      oua09c  <= 1'b0 ;      th504e1 <= 1'b0 ;      ie8270f <= 1'b0 ;      tj13879  <= 1'b0 ;      je9c3cf  <= 1'b0 ;      ou1f0d5    <= 1'b0 ;      bycf68b <= 1'b0 ;   end   else begin      oua09c  <= dze3976 ;      th504e1 <= aa2edf0 ;      ie8270f <= zk76f81 ;      tj13879  <= yke5dbe ;      je9c3cf  <= thd20a8 ;      ou1f0d5    <= alcc979 ;      bycf68b <= vx1cbb7 ;   end
end
assign al44029  = dze3976 & ~cmea233 ;
assign coa63 = aa2edf0 & ~mr51198 ;
assign uk5319 = zk76f81 & ~ec88cc5 ;
assign ba2014c  = yke5dbe & ~os46629 ;
assign gd298c8    = alcc979 & ~aa9d0c0 ;
assign qg4c644  = ~dze3976 & cmea233 ;
assign rv19102 = ~aa2edf0 & mr51198 ;
assign zxc8817 = ~zk76f81 & ec88cc5 ;
assign dm63220  = ~yke5dbe & os46629 ;
assign cz440bf    = ~alcc979 & aa9d0c0 ;
always @( posedge sys_clk, negedge rst_n ) begin   if (!rst_n)      aaf3da <= 1'b0 ;   else if (thd20a8 && (hb6bc61 || en5e30f || rv814a8 ||                         tuf187c || aa1ac16 || zx61f1a))      aaf3da <= 1'b1 ;   else if (vx1cbb7 || qv8a27d)      aaf3da <= 1'b0 ;   else      aaf3da <= psc5268 ;
end
always @( posedge sys_clk, negedge rst_n ) begin   if (!rst_n)      jc79ed1 <= 1'b0 ;   else if (gd90546 && (rv814a8 || aa1ac16))      jc79ed1 <= 1'b1 ;   else if (vi5d446)      jc79ed1 <= 1'b0 ;   else      jc79ed1 <= sj29342 ;
end
assign wwd1f51  = ea6d78c & ~yke5dbe & ~aa2edf0 & ~zk76f81 && alcc979 ;
assign ep8fa88 = me49a15 & ~yke5dbe & ~aa2edf0 & ~zk76f81 && alcc979 & dze3976 ;
assign kq7d444 = (ief8d6  & ~aa2edf0 & ~zk76f81  & alcc979 & dze3976) ;
assign eaea220 = (rg7c6b0 & ~yke5dbe & ~zk76f81  & alcc979 & dze3976) ;
assign cz51100 = (lde3582 & ~aa2edf0 & ~yke5dbe  & alcc979 & dze3976) ;
assign co88805 = (zm8c3e3 & ~aa2edf0 & ~yke5dbe  & ~zk76f81 & dze3976) ;
always @( posedge sys_clk, negedge rst_n ) begin   if (!rst_n)      thd20a8 <= 1'b0 ;   else if (((ip513ed || zm89f6d || dz4fb6b || cm7db5e || yxedaf1) && !psc5268) || qv8a27d)      thd20a8 <= 1'b1 ;   else if (psc5268)      thd20a8 <= 1'b0 ;   else      thd20a8 <= thd20a8 ;
end
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n)      dmda2df <= 1'b0 ;   else if (ph8ba88 && (gdbe052 > 'd2))      dmda2df <= 1'b1 ;   else if (by4d0a9 == 5'd3)      dmda2df <= 1'b0 ;   else      dmda2df <= me6854a ;
end
assign ie82a35 =  ph8ba88 ;
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n)      th7b45b <= 5'h00 ;   else if (vi5d446)         th7b45b <= gdbe052 ;   else if (me6854a)      th7b45b <=  by4d0a9 - 1'b1 ;   else      th7b45b <= by4d0a9 ;
end
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n)      sj17f1c <= 1'b0 ;   else if (yke5dbe && !thd20a8 && oh33149)      sj17f1c <= 1'b1 ;   else if (bn16330 == 3'd4)      sj17f1c <= 1'b0 ;
end
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n)      dbbf8e5 <= 3'h0 ;   else if (qi82c66)      dbbf8e5 <= bn16330 + 1  ;   else if (bn16330 == 3'd4)      dbbf8e5 <= 3'h0 ;
end
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n)      sh41413 <= 1'b0 ;
else if (yke5dbe && !thd20a8 && !psc5268 && !sj29342 && !qi82c66)      sh41413 <= 1'b1 ;   else if (!yke5dbe && gd90546 )      sh41413 <= 1'b0 ;   else      sh41413 <= (gd90546 & ~psc5268 & ~sj29342 & !qi82c66) ;
end
assign gd90546 = (sh41413 & ~me6854a & alcc979) ;
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n)      rv8b7d1 <= 1'b0 ;   else if (rv814a8)      rv8b7d1 <= 1'b1 ;   else if (!thd20a8 && !gd90546 && !psc5268)      rv8b7d1 <= 1'b0 ;   else      rv8b7d1 <= gq1528a ;
end
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n)      qt5be8f <= 1'b0 ;   else      qt5be8f <= gq1528a ;
end
assign cb2fe3 = ~gq1528a & iea9451 ;
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n)      psdf47d <= 1'b0 ;   else if (zzb058c)      psdf47d <= 1'b1 ;   else if (kd5144f == dzfc72e +2)      psdf47d <= 1'b0 ;   else      psdf47d <= nr4a289 ;
end
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n)      cmfa3ea <= 'd0 ;   else if (nr4a289)      cmfa3ea <= kd5144f + 1 ;   else      cmfa3ea <= 'd0 ;
end
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n)      mg151a8 <= 'd0 ;   else      mg151a8 <= (kd5144f == dzfc72e) ;
end
always@* begin dze3976<=ld7b613[0];vx1cbb7<=ld7b613[1];yke5dbe<=ld7b613[2];aa2edf0<=ld7b613[3];zk76f81<=ld7b613[4];gdbe052<={ba250d2>>1,ld7b613[5]};alcc979<=ld7b613[6];rv814a8<=ld7b613[7];gqa546<={qgea597>>1,ld7b613[8]};fa52a31<=ld7b613[9];cb9518b<=ld7b613[10];doa8c5d<=ld7b613[11];su462ea<={wy970d2>>1,ld7b613[12]};sw31751<=ld7b613[13];ph8ba88<=ld7b613[14];vi5d446<=ld7b613[15];cmea233<=ld7b613[16];mr51198<=ld7b613[17];ec88cc5<=ld7b613[18];os46629<=ld7b613[19];oh33149<=ld7b613[20];aa9d0c0<=ld7b613[21];psc5268<=ld7b613[22];sj29342<=ld7b613[23];me49a15<=ld7b613[24];by4d0a9<={th7b45b>>1,ld7b613[25]};me6854a<=ld7b613[26];rg42a51<=ld7b613[27];gq1528a<=ld7b613[28];iea9451<=ld7b613[29];nr4a289<=ld7b613[30];kd5144f<={cmfa3ea>>1,ld7b613[31]};qv8a27d<=ld7b613[32];ip513ed<=ld7b613[33];zm89f6d<=ld7b613[34];dz4fb6b<=ld7b613[35];cm7db5e<=ld7b613[36];yxedaf1<=ld7b613[37];ea6d78c<=ld7b613[38];hb6bc61<=ld7b613[39];en5e30f<=ld7b613[40];tuf187c<=ld7b613[41];zm8c3e3<=ld7b613[42];zx61f1a<=ld7b613[43];ief8d6<=ld7b613[44];rg7c6b0<=ld7b613[45];lde3582<=ld7b613[46];aa1ac16<=ld7b613[47];shd60b1<=ld7b613[48];zzb058c<=ld7b613[49];qi82c66<=ld7b613[50];bn16330<={dbbf8e5>>1,ld7b613[51]};end
always@* begin necf6c2[2047]<=xjcd80b;necf6c2[2046]<=lq6c05f;necf6c2[2044]<=kd602fb;necf6c2[2041]<=xy17dd;necf6c2[2035]<=ba250d2[0];necf6c2[2022]<=kd7a2e1;necf6c2[1996]<=nrdd4b2;necf6c2[1945]<=qgea597[0];necf6c2[1843]<=tu52cb8;necf6c2[1752]<=zxc8817;necf6c2[1746]<=ie8270f;necf6c2[1728]<=cb2fe3;necf6c2[1685]<=ou1f0d5;necf6c2[1645]<=czc3482;necf6c2[1638]<=je965c3;necf6c2[1605]<=ep8fa88;necf6c2[1456]<=cz440bf;necf6c2[1445]<=tj13879;necf6c2[1425]<=cmfa3ea[0];necf6c2[1408]<=sj17f1c;necf6c2[1380]<=qt5be8f;necf6c2[1369]<=kqd16fa;necf6c2[1334]<=uk5319;necf6c2[1322]<=aaf3da;necf6c2[1243]<=qg4c644;necf6c2[1242]<=uk1a415;necf6c2[1229]<=dob2e1a;necf6c2[1195]<=bycf68b;necf6c2[1162]<=kq7d444;necf6c2[1107]<=co88805;necf6c2[1023]<=fa79b01;necf6c2[876]<=rv19102;necf6c2[873]<=th504e1;necf6c2[864]<=ri205fc;necf6c2[842]<=je9c3cf;necf6c2[822]<=dob8690;necf6c2[802]<=wwd1f51;necf6c2[768]<=dbbf8e5[0];necf6c2[712]<=psdf47d;necf6c2[690]<=rv8b7d1;necf6c2[684]<=dmda2df;necf6c2[667]<=coa63;necf6c2[621]<=gd298c8;necf6c2[597]<=jc79ed1;necf6c2[553]<=cz51100;necf6c2[438]<=dm63220;necf6c2[436]<=oua09c;necf6c2[411]<=wy970d2[0];necf6c2[342]<=th7b45b[0];necf6c2[333]<=ba2014c;necf6c2[276]<=eaea220;necf6c2[166]<=al44029;end         assign suff972 = necf6c2,ld7b613 = cme5c87;   initial begin   jcc030e = $fopen(".fred");   $fdisplay( jcc030e, "%3h\n%3h", (thc27c7 >> 4) & fnc7fe5, (thc27c7 >> (mt9f1ff+4)) & fnc7fe5 );   $fclose(jcc030e);   $readmemh(".fred", qg721c0);   end   always @ (suff972) begin   ym8700c = qg721c0[1];       for (vk1872=0; vk1872<qgdb09f; vk1872=vk1872+1) begin           cme5c87[vk1872] = suff972[ym8700c];       rv38061  = ^(ym8700c & qg721c0[0]);       ym8700c =  {ym8700c, rv38061};       end   end
endmodule