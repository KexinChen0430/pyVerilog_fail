module sw1acd7 (
   input wire        sys_clk ,
   input wire        rst_n ,
   input wire [15:0] kf9ae61 ,
   input wire        vvd730d ,
   input wire        ukb986e ,
   input wire        mrcc371 ,
   input wire [11:0] pu995e2 ,
   input wire        fnd82ee ,
   output wire       nr6e335 ,
   output reg [15:0] qgea597 ,
   output reg        tu52cb8 ,
   output reg        je965c3 ,
   output reg        dob2e1a ,
   output reg [11:0] yz3360b     ) ;
reg [15:0]            ui776dd ;
reg                   irbb6e9 ;
reg                   sudb74d ;
reg                   aydba68 ;
wire [11:0]           ale2698 ;
wire                  pfe9a0f ;
parameter lq4d07e   = 12'd0 ;
parameter os683f2  = 12'd2048 ;
reg [15 : 0] ip41f91;
reg qifc8d;
reg fn7e468;
reg wjf2347;
reg [11 : 0] fn6b712;
reg ng1a6b;
reg ea68f70;
reg by47b80;
reg lf3dc02;
reg [11 : 0] mt12d6c;
reg cz700ba;
reg [2047:0] necf6c2;
wire [10:0] ld7b613;
localparam qgdb09f = 11,nrd84f8 = 32'hfdffca4b;
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
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n) begin      irbb6e9  <= 1'b0 ;      sudb74d <= 1'b0 ;      ui776dd <= 16'd0 ;      tu52cb8         <= 1'b0 ;      je965c3        <= 1'b0 ;      dob2e1a       <= 1'b0 ;   end   else begin      irbb6e9  <= fn7e468 ;      sudb74d <= wjf2347 ;      ui776dd <= ip41f91 ;      tu52cb8         <= qifc8d ;      je965c3        <= ea68f70 ;      dob2e1a       <= by47b80 ;   end
end
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n)      aydba68  <= 1'b0 ;   else if (qifc8d)      aydba68  <= 1'b1 ;   else if (ea68f70)      aydba68  <= 1'd0 ;
end
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n)      qgea597  <= 16'd0 ;   else if (qifc8d)      qgea597  <= yz3360b ;   else if (lf3dc02)      qgea597  <= ui776dd ;   else      qgea597  <= 16'd0 ;
end
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n)      yz3360b <= lq4d07e ;   else if (ng1a6b)      yz3360b <= lq4d07e ;   else if (fn7e468)      yz3360b <= yz3360b + 12'h001 ;   else      yz3360b <= yz3360b ;
end
assign ale2698 = ((~fn6b712) + 12'h001) ;
assign pfe9a0f = ((yz3360b + mt12d6c) >= os683f2 ) ;
assign nr6e335 = cz700ba  ;
always@* begin ip41f91<={kf9ae61>>1,ld7b613[0]};qifc8d<=ld7b613[1];fn7e468<=ld7b613[2];wjf2347<=ld7b613[3];fn6b712<={pu995e2>>1,ld7b613[4]};ng1a6b<=ld7b613[5];ea68f70<=ld7b613[6];by47b80<=ld7b613[7];lf3dc02<=ld7b613[8];mt12d6c<={ale2698>>1,ld7b613[9]};cz700ba<=ld7b613[10];end
always@* begin necf6c2[2047]<=vvd730d;necf6c2[2046]<=ukb986e;necf6c2[2044]<=mrcc371;necf6c2[2040]<=pu995e2[0];necf6c2[2033]<=fnd82ee;necf6c2[2019]<=irbb6e9;necf6c2[1991]<=sudb74d;necf6c2[1935]<=aydba68;necf6c2[1823]<=ale2698[0];necf6c2[1598]<=pfe9a0f;necf6c2[1023]<=kf9ae61[0];end         assign suff972 = necf6c2,ld7b613 = cme5c87;   initial begin   jcc030e = $fopen(".fred");   $fdisplay( jcc030e, "%3h\n%3h", (thc27c7 >> 4) & fnc7fe5, (thc27c7 >> (mt9f1ff+4)) & fnc7fe5 );   $fclose(jcc030e);   $readmemh(".fred", qg721c0);   end   always @ (suff972) begin   ym8700c = qg721c0[1];       for (vk1872=0; vk1872<qgdb09f; vk1872=vk1872+1) begin           cme5c87[vk1872] = suff972[ym8700c];       rv38061  = ^(ym8700c & qg721c0[0]);       ym8700c =  {ym8700c, rv38061};       end   end
endmodule