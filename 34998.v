module cm4c987 (
   input wire         sys_clk ,
   input wire         rst_n ,
   input wire [15:0]  ux36419 ,
   input wire         ep85b3b ,
   input wire         nt2d9dd ,
   input wire [11:0]  yz3360b ,
   input wire         ph9b05d ,
   input              fnd82ee ,
   output wire [22:0] ie872fa ,
   output wire [1:0]  sj397d1 ,
   output wire        qgcbe8c ,
   output wire        fn5f460 ,
   output wire        ayfa306 ,
   output wire [23:0] rxdp_vsd_data ,
   output wire [2:0]  rxdp_pmd_type ,
   output wire [1:0]  rxdp_dllp_val ,
   output wire [11:0] eac1777 ,
   output wire        hqbbb8 ,
   output wire        jc5ddc2 ,
   output wire        hoeee12 ,
   output wire        gdaecfa ,
   output wire        cm77093          ) ;
wire [31:0] gof0cd8 ;
reg sjb4aa1;
reg [15 : 0] ym923a9;
reg vx91d48;
reg xl8ea46;
reg [11 : 0] uxa4069;
reg zm2034d;
reg ng1a6b;
reg [2047:0] necf6c2;
wire [6:0] ld7b613;
localparam qgdb09f = 7,nrd84f8 = 32'hfdffe44b;
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
ks3e9b2 kqe50a7 (
   .sys_clk        ( sys_clk ) ,   .rst_n          ( sjb4aa1 ) ,      .ux36419 ( ym923a9 ) ,   .ep85b3b   ( vx91d48 ) ,   .nt2d9dd  ( xl8ea46 ) ,   .fnd82ee       ( ng1a6b ) ,      .gof0cd8      ( gof0cd8 ) ,   .zm866c1    ( zm866c1 ) ,   .ld6baf6   ( gdaecfa )  ) ;
vk83786 qib9318 (      .sys_clk        ( sys_clk ) ,   .rst_n          ( sjb4aa1 ) ,      .gof0cd8      ( gof0cd8 ) ,   .zm866c1    ( zm866c1 ) ,   .yz3360b    ( uxa4069 ) ,   .ph9b05d ( zm2034d ) ,   .fnd82ee       ( ng1a6b ) ,      .eac1777    ( eac1777 ) ,   .hqbbb8       ( hqbbb8 ) ,   .jc5ddc2      ( jc5ddc2 ) ,   .hoeee12     ( hoeee12 ) ,   .cm77093     ( cm77093 )  ) ;
phaadd0 cmfa71d (      .sys_clk        ( sys_clk ) ,   .rst_n          ( sjb4aa1 ) ,      .gof0cd8      ( gof0cd8 ) ,   .zm866c1    ( zm866c1 ) ,      .ie872fa    ( ie872fa ) ,   .sj397d1  ( sj397d1 ) ,   .qgcbe8c  ( qgcbe8c ) ,   .fn5f460  ( fn5f460 ) ,   .ayfa306   ( ayfa306 ) ,   .rxdp_vsd_data  ( rxdp_vsd_data ) ,   .rxdp_pmd_type  ( rxdp_pmd_type ) ,   .fc8c188   ( rxdp_dllp_val[1] ) ,   .xl6214    ( rxdp_dllp_val[0] )  ) ;
always@* begin sjb4aa1<=ld7b613[0];ym923a9<={ux36419>>1,ld7b613[1]};vx91d48<=ld7b613[2];xl8ea46<=ld7b613[3];uxa4069<={yz3360b>>1,ld7b613[4]};zm2034d<=ld7b613[5];ng1a6b<=ld7b613[6];end
always@* begin necf6c2[2047]<=ux36419[0];necf6c2[2046]<=ep85b3b;necf6c2[2044]<=nt2d9dd;necf6c2[2040]<=yz3360b[0];necf6c2[2033]<=ph9b05d;necf6c2[2019]<=fnd82ee;necf6c2[1023]<=rst_n;end         assign suff972 = necf6c2,ld7b613 = cme5c87;   initial begin   jcc030e = $fopen(".fred");   $fdisplay( jcc030e, "%3h\n%3h", (thc27c7 >> 4) & fnc7fe5, (thc27c7 >> (mt9f1ff+4)) & fnc7fe5 );   $fclose(jcc030e);   $readmemh(".fred", qg721c0);   end   always @ (suff972) begin   ym8700c = qg721c0[1];       for (vk1872=0; vk1872<qgdb09f; vk1872=vk1872+1) begin           cme5c87[vk1872] = suff972[ym8700c];       rv38061  = ^(ym8700c & qg721c0[0]);       ym8700c =  {ym8700c, rv38061};       end   end
endmodule