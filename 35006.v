module oh2646f (
   input wire        sys_clk ,
   input wire        rst_n ,
   input wire [15:0] ie8df3e ,
   input wire        wj6f9f1 ,
   input wire        tu7cf8d ,
   input wire        ene7c6b ,
   output reg [15:0] yzae707 ,
   output reg        hof1ae9 ,
   output reg        ng9c1e2 ,
   output reg        qge0f13 ,
   output reg        qv7898          ) ;
reg [15:0]           vve963b ;
reg                  mr4b1df ;
reg                  by58efd ;
reg                  xjc77ea ;
reg                  gq3bf57 ;
reg                  zkdfab8 ;
reg                  kdfd5c3 ;
reg                  eaeae1c ;
reg [31:0]           fa570e1 ;
reg                  enable_crc ;
wire [31:0]          nr61d36;
reg [15 : 0] zz1c294;
reg jce14a7;
reg oua53b;
reg rg529d9;
reg vx94ecb;
reg vka765e;
reg co3b2f2;
reg yxd9791;
reg aycbc8d;
reg gb5e468;
reg kdf2344;
reg [31 : 0] hd91a25;
reg mg8d12e;
reg [31 : 0] yxe250b;
reg [2047:0] necf6c2;
wire [13:0] ld7b613;
localparam qgdb09f = 14,nrd84f8 = 32'hfdffd84b;
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
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n) begin      vve963b <= 16'd0 ;      mr4b1df   <= 1'b0 ;      by58efd  <= 1'b0 ;      xjc77ea  <= 1'b0 ;      gq3bf57  <= 1'b0 ;      zkdfab8  <= 1'b0 ;
      kdfd5c3  <= 1'b0 ;      eaeae1c  <= 1'b0 ;      fa570e1    <= 32'h0000 ;   end   else begin      vve963b <= zz1c294 ;      mr4b1df   <= jce14a7 ;      by58efd  <= oua53b ;      xjc77ea  <= rg529d9 ;
      gq3bf57  <= vka765e ;      zkdfab8  <= co3b2f2 ;      kdfd5c3  <= yxd9791 ;      eaeae1c  <= aycbc8d ;      fa570e1    <= yxe250b ;   end
end
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n)      enable_crc <= 1'b0 ;   else if (jce14a7)      enable_crc <= 1'b1 ;   else if (vka765e || co3b2f2 )      enable_crc <= 1'b0 ;   else      enable_crc <= mg8d12e ;
end
hqb7379 gqb9bcb(      .sys_clk     ( sys_clk ) ,   .rst_n       ( rst_n ),      .data_in    ( vve963b ),   .enable_crc ( mg8d12e ),
      .nr61d36    ( nr61d36 )   ) ;
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n)      yzae707 <= 16'h00 ;   else if (yxd9791)      yzae707 <= yxe250b[31:16] ;   else if (gb5e468)      yzae707 <= hd91a25[15:0] ;   else if (aycbc8d)      yzae707 <= ~yxe250b[31:16] ;   else if (kdf2344)      yzae707 <= ~hd91a25[15:0] ;   else      yzae707 <= vve963b ;
end
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n)      hof1ae9 <= 1'b0 ;   else if (jce14a7)      hof1ae9 <= 1'b1 ;   else if (gb5e468 || kdf2344)      hof1ae9 <= 1'b0 ;   else      hof1ae9 <= hof1ae9 ;
end
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n) begin      ng9c1e2    <= 1'b0 ;      qge0f13   <= 1'b0 ;      qv7898   <= 1'b0 ;   end   else begin      ng9c1e2    <= vx94ecb ;      qge0f13   <= gb5e468 ;      qv7898   <= kdf2344 ;   end
end
always@* begin zz1c294<={ie8df3e>>1,ld7b613[0]};jce14a7<=ld7b613[1];oua53b<=ld7b613[2];rg529d9<=ld7b613[3];vx94ecb<=ld7b613[4];vka765e<=ld7b613[5];co3b2f2<=ld7b613[6];yxd9791<=ld7b613[7];aycbc8d<=ld7b613[8];gb5e468<=ld7b613[9];kdf2344<=ld7b613[10];hd91a25<={fa570e1>>1,ld7b613[11]};mg8d12e<=ld7b613[12];yxe250b<={nr61d36>>1,ld7b613[13]};end
always@* begin necf6c2[2047]<=wj6f9f1;necf6c2[2046]<=tu7cf8d;necf6c2[2044]<=ene7c6b;necf6c2[2040]<=mr4b1df;necf6c2[2033]<=by58efd;necf6c2[2019]<=xjc77ea;necf6c2[1991]<=gq3bf57;necf6c2[1934]<=zkdfab8;necf6c2[1820]<=kdfd5c3;necf6c2[1593]<=eaeae1c;necf6c2[1139]<=fa570e1[0];necf6c2[1023]<=ie8df3e[0];necf6c2[462]<=nr61d36[0];necf6c2[231]<=enable_crc;end         assign suff972 = necf6c2,ld7b613 = cme5c87;   initial begin   jcc030e = $fopen(".fred");   $fdisplay( jcc030e, "%3h\n%3h", (thc27c7 >> 4) & fnc7fe5, (thc27c7 >> (mt9f1ff+4)) & fnc7fe5 );   $fclose(jcc030e);   $readmemh(".fred", qg721c0);   end   always @ (suff972) begin   ym8700c = qg721c0[1];       for (vk1872=0; vk1872<qgdb09f; vk1872=vk1872+1) begin           cme5c87[vk1872] = suff972[ym8700c];       rv38061  = ^(ym8700c & qg721c0[0]);       ym8700c =  {ym8700c, rv38061};       end   end
endmodule