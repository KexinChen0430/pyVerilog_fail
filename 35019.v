module ri20e84 (
   sys_clk ,
   rst_n ,
   xwd08ab ,
   nt8455a ,
   db22ad6 ,
   sw156b7 ,
   cbab5b9 ,
   `ifdef ECRC
      cba14f3 ,
   `endif
   kf9ae61 ,
   vvd730d ,
   ukb986e ,
   mrcc371 ,
   xjcd80b
   ) ;
input                  sys_clk ;
input                  rst_n ;
input [15:0]           xwd08ab ;
input                  nt8455a ;
input                  db22ad6 ;
input                  sw156b7 ;
input                  cbab5b9 ;
`ifdef ECRC
input               cba14f3 ;
`endif
output [15:0]          kf9ae61 ;
output                 vvd730d ;
output                 ukb986e ;
output                 mrcc371 ;
output                 xjcd80b ;
wire [31:0]          nr61d36;
wire [15:0]          dz4f136 ;
`ifdef ECRC
reg [15:0]           icf501b ;
reg                  lsa80d8 ;
reg                  ld406c3 ;
reg                  nt361e ;
reg                  fc1b0f7 ;
reg                  dzd87ba ;
reg                  qtc3dd7 ;
reg                  zm1eebc ;
reg                  kdf75e3 ;
reg                  hdbaf1d ;
reg                  jpd78ee ;
reg                  gqbc777 ;
reg [31:0]           fa570e1 ;
reg                  enable_crc ;
`endif
reg [15:0]           kf9ae61 ;
reg                  vvd730d ;
reg                  ukb986e ;
reg                  mrcc371 ;
reg                  xjcd80b ;
`ifdef ECRC
reg vve32f4 ;
`else
`endif
reg [15 : 0] fp197a6;
reg eacbd37;
reg mr5e9b8;
reg jcf4dc5;
reg wya6e2b;
reg [31 : 0] yxe250b;
reg [15 : 0] jeb8acf;
reg [2047:0] necf6c2;
wire [6:0] ld7b613;
`ifdef ECRC
`endif
`ifdef ECRC
`endif
`ifdef ECRC
`else
`endif
localparam qgdb09f = 7,nrd84f8 = 32'hfdffca8b;
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
`ifdef ECRC
`endif
`ifdef ECRC
`endif
`ifdef ECRC
`else
`endif
`ifdef ECRC
`endif
`ifdef ECRC
`endif
`ifdef ECRC
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n) begin      icf501b    <= 16'd0 ;      lsa80d8      <= 1'b0 ;      ld406c3     <= 1'b0 ;      nt361e    <= 1'b0 ;      fc1b0f7 <= 1'b0 ;      dzd87ba      <= 1'b0 ;      qtc3dd7     <= 1'b0 ;      zm1eebc    <= 1'b0 ;      kdf75e3 <= 1'b0 ;
      hdbaf1d     <= 1'b0 ;      jpd78ee    <= 1'b0 ;      gqbc777 <= 1'b0 ;      fa570e1         <= 32'h0000 ;   end   else begin      icf501b    <= fp197a6 ;      lsa80d8      <= eacbd37 ;      ld406c3     <= mr5e9b8 ;      nt361e    <= jcf4dc5 ;      fc1b0f7 <= wya6e2b ;
      dzd87ba      <= lsa80d8 ;      qtc3dd7     <= ld406c3 ;      zm1eebc    <= nt361e ;      kdf75e3 <= fc1b0f7 ;      hdbaf1d     <= qtc3dd7 ;      jpd78ee    <= zm1eebc ;      gqbc777 <= kdf75e3 ;      fa570e1         <= yxe250b ;   end
end
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n)      enable_crc <= 1'b0 ;   else if (eacbd37)      enable_crc <= 1'b1 ;   else if (ld406c3)      enable_crc <= 1'b0 ;   else      enable_crc <= enable_crc ;
end
assign dz4f136 =  lsa80d8 ? {icf501b[15:9], 1'b1, icf501b[7:0]} :                  dzd87ba ? {icf501b[15],1'b1, icf501b[13:0]} : icf501b ;
hqb7379 gqb9bcb(   .sys_clk    (sys_clk),   .rst_n      (rst_n),   .data_in    (jeb8acf),   .enable_crc (enable_crc),   .nr61d36    (nr61d36)   );
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n)      kf9ae61 <= 16'h00 ;   else if (qtc3dd7)      kf9ae61 <= yxe250b[31:16] ;   else if (hdbaf1d)      kf9ae61 <= fa570e1[15:0] ;   else      kf9ae61 <= icf501b ;
end
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n)      vve32f4 <= 1'b0 ;   else if (lsa80d8)      vve32f4 <= fp197a6[15] & cba14f3 ;
end
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n) begin      vvd730d       <= 1'b0 ;      ukb986e      <= 1'b0 ;      mrcc371     <= 1'b0 ;      xjcd80b  <= 1'b0 ;   end   else begin      vvd730d       <= lsa80d8 ;      ukb986e      <= (vve32f4) ? hdbaf1d     :  ld406c3 ;      mrcc371     <= (vve32f4) ? jpd78ee    :  nt361e ;      xjcd80b  <= (vve32f4) ? gqbc777 :  fc1b0f7;   end
end
`else
always @(*) begin      kf9ae61     <= fp197a6 ;      vvd730d       <= eacbd37 ;      ukb986e      <= mr5e9b8;      mrcc371     <= jcf4dc5;      xjcd80b  <= wya6e2b;
end
`endif
always@* begin fp197a6<={xwd08ab>>1,ld7b613[0]};eacbd37<=ld7b613[1];mr5e9b8<=ld7b613[2];jcf4dc5<=ld7b613[3];wya6e2b<=ld7b613[4];yxe250b<={nr61d36>>1,ld7b613[5]};jeb8acf<={dz4f136>>1,ld7b613[6]};end
always@* begin necf6c2[2047]<=nt8455a;necf6c2[2046]<=db22ad6;necf6c2[2044]<=sw156b7;necf6c2[2040]<=cbab5b9;necf6c2[2032]<=nr61d36[0];necf6c2[2017]<=dz4f136[0];necf6c2[1023]<=xwd08ab[0];end         assign suff972 = necf6c2,ld7b613 = cme5c87;   initial begin   jcc030e = $fopen(".fred");   $fdisplay( jcc030e, "%3h\n%3h", (thc27c7 >> 4) & fnc7fe5, (thc27c7 >> (mt9f1ff+4)) & fnc7fe5 );   $fclose(jcc030e);   $readmemh(".fred", qg721c0);   end   always @ (suff972) begin   ym8700c = qg721c0[1];       for (vk1872=0; vk1872<qgdb09f; vk1872=vk1872+1) begin           cme5c87[vk1872] = suff972[ym8700c];       rv38061  = ^(ym8700c & qg721c0[0]);       ym8700c =  {ym8700c, rv38061};       end   end
endmodule