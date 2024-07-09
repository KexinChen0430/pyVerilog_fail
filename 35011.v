module fad5cc5 #(
   parameter FADDR = 6 )
   (
   input wire            sys_clk ,
   input wire            rst_n ,
   input wire            fa79b01 ,
   input wire [15:0]     kf9ae61 ,
   input wire            vvd730d ,
   input wire            ukb986e ,
   input wire            mrcc371 ,
   input wire            xjcd80b ,
   input wire [11:0]     eac1777 ,
   input wire            hqbbb8 ,
   input wire            jc5ddc2 ,
   input wire            hoeee12 ,
   input wire            fnd82ee ,
   input wire [FADDR:0]  ba250d2 ,
   input wire            kd7a2e1 ,
   input wire [2:0]      rtcdaa7 ,
   output wire           thd20a8 ,
   output wire           ie82a35 ,
   output wire [15:0]    yzae707 ,
   output wire           hof1ae9 ,
   output wire           ng9c1e2 ,
   output wire           qge0f13 ,
   output wire           qv7898 ,
   output wire           nrcd8df ,
   output wire           ph9b05d ,
   output wire [11:0]    yz3360b ,
   output wire           tu637fb ,
   output wire           mg151a8       ) ;
wire [15:0]    qgea597 ;
wire [15:0]    wy970d2 ;
wire [15:0]    ie8df3e ;
reg sjb4aa1;
reg dze3976;
reg [15 : 0] ip41f91;
reg qifc8d;
reg fn7e468;
reg wjf2347;
reg vx1cbb7;
reg [11 : 0] yk6dee1;
reg gb6f708;
reg th7b844;
reg aldc226;
reg ng1a6b;
reg [FADDR : 0] gdbe052;
reg alcc979;
reg [2 : 0] gd26aed;
reg [15 : 0] su462ea;
reg [15 : 0] zz1c294;
reg [2047:0] necf6c2;
wire [16:0] ld7b613;
localparam qgdb09f = 17,nrd84f8 = 32'hfdffe81b;
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
sw1acd7 xy9ce0e (      .sys_clk       ( sys_clk ) ,   .rst_n         ( sjb4aa1 ),      .kf9ae61   ( ip41f91 ) ,   .vvd730d     ( qifc8d ) ,   .ukb986e    ( fn7e468 ) ,   .mrcc371   ( wjf2347 ) ,   .pu995e2      ( yk6dee1 ) ,   .fnd82ee      ( ng1a6b  ) ,      .nr6e335     ( kd602fb ) ,   .qgea597     ( qgea597 ) ,   .tu52cb8       ( tu52cb8 ) ,   .je965c3      ( je965c3 ) ,   .dob2e1a     ( dob2e1a ) ,   .yz3360b   ( yz3360b )  ) ;
doee24 dzf353c (      .sys_clk        ( sys_clk ) ,   .rst_n          ( sjb4aa1 ),      .qgea597      ( qgea597 ) ,   .tu52cb8        ( tu52cb8 ) ,   .je965c3       ( je965c3 ) ,   .dob2e1a      ( dob2e1a ) ,
   .eac1777    ( yk6dee1 ) ,   .hqbbb8       ( gb6f708 ) ,   .jc5ddc2      ( th7b844 ) ,   .hoeee12     ( aldc226 ) ,   .by73e6d ( gd90546 ) ,   .fnd82ee       ( ng1a6b  ) ,   .kd7a2e1         ( alcc979 ) ,   .rtcdaa7    ( gd26aed ),      .os6d53f  ( lq6c05f ) ,   .wy970d2      ( wy970d2 ) ,   .dob8690        ( dob8690 ) ,   .czc3482       ( czc3482 ) ,   .do3f363 ( babd1be ) ,   .hbf9b1b     ( xy17dd ) ,   .nrcd8df  ( nrcd8df ) ,   .ph9b05d ( ph9b05d ) ,   .tu637fb ( tu637fb ) ,   .mg151a8 ( nrdd4b2 )   ) ;
an8879 #(   .FADDR         ( FADDR ))   ukb3047 (      .sys_clk       ( sys_clk ) ,   .rst_n         ( sjb4aa1 ),      .fa79b01     ( dze3976 ) ,   .xjcd80b ( vx1cbb7 ) ,   .lq6c05f       ( lq6c05f ) ,   .kd602fb  ( kd602fb ) ,   .xy17dd  ( xy17dd ) ,   .ba250d2  ( gdbe052 ) ,   .kd7a2e1         ( alcc979 ) ,   .nrdd4b2      ( nrdd4b2 ) ,   .qgea597      ( qgea597 ) ,   .tu52cb8        ( tu52cb8 ) ,   .je965c3       ( je965c3 ) ,   .dob2e1a      ( dob2e1a ) ,   .wy970d2      ( su462ea ) ,   .dob8690        ( dob8690 ) ,   .czc3482       ( czc3482 ) ,   .uk1a415      ( babd1be ) ,      .thd20a8       ( thd20a8 ) ,   .gd90546       ( gd90546 ) ,   .ie82a35 ( ie82a35 ) ,   .mg151a8 ( mg151a8 ) ,   .ie8df3e      ( ie8df3e ) ,   .wj6f9f1        ( wj6f9f1 ) ,   .tu7cf8d       ( tu7cf8d ) ,   .ene7c6b       ( ene7c6b )  ) ;
oh2646f hq1b8dd (      .sys_clk       ( sys_clk ) ,   .rst_n         ( sjb4aa1 ),      .ie8df3e     ( zz1c294 ) ,   .wj6f9f1       ( wj6f9f1 ) ,   .tu7cf8d      ( tu7cf8d ) ,   .ene7c6b      ( ene7c6b ) ,
      .yzae707    ( yzae707 ) ,   .hof1ae9 ( hof1ae9 ) ,   .ng9c1e2       ( ng9c1e2 ) ,   .qge0f13      ( qge0f13 ) ,   .qv7898      ( qv7898 )  ) ;
always@* begin sjb4aa1<=ld7b613[0];dze3976<=ld7b613[1];ip41f91<={kf9ae61>>1,ld7b613[2]};qifc8d<=ld7b613[3];fn7e468<=ld7b613[4];wjf2347<=ld7b613[5];vx1cbb7<=ld7b613[6];yk6dee1<={eac1777>>1,ld7b613[7]};gb6f708<=ld7b613[8];th7b844<=ld7b613[9];aldc226<=ld7b613[10];ng1a6b<=ld7b613[11];gdbe052<={ba250d2>>1,ld7b613[12]};alcc979<=ld7b613[13];gd26aed<={rtcdaa7>>1,ld7b613[14]};su462ea<={wy970d2>>1,ld7b613[15]};zz1c294<={ie8df3e>>1,ld7b613[16]};end
always@* begin necf6c2[2047]<=fa79b01;necf6c2[2046]<=kf9ae61[0];necf6c2[2045]<=vvd730d;necf6c2[2042]<=ukb986e;necf6c2[2037]<=mrcc371;necf6c2[2026]<=xjcd80b;necf6c2[2005]<=eac1777[0];necf6c2[1962]<=hqbbb8;necf6c2[1877]<=jc5ddc2;necf6c2[1707]<=hoeee12;necf6c2[1388]<=wy970d2[0];necf6c2[1371]<=kd7a2e1;necf6c2[1366]<=fnd82ee;necf6c2[1023]<=rst_n;necf6c2[729]<=ie8df3e[0];necf6c2[694]<=rtcdaa7[0];necf6c2[685]<=ba250d2[0];end         assign suff972 = necf6c2,ld7b613 = cme5c87;   initial begin   jcc030e = $fopen(".fred");   $fdisplay( jcc030e, "%3h\n%3h", (thc27c7 >> 4) & fnc7fe5, (thc27c7 >> (mt9f1ff+4)) & fnc7fe5 );   $fclose(jcc030e);   $readmemh(".fred", qg721c0);   end   always @ (suff972) begin   ym8700c = qg721c0[1];       for (vk1872=0; vk1872<qgdb09f; vk1872=vk1872+1) begin           cme5c87[vk1872] = suff972[ym8700c];       rv38061  = ^(ym8700c & qg721c0[0]);       ym8700c =  {ym8700c, rv38061};       end   end
endmodule