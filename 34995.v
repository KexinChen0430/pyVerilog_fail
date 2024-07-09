module vk83786 (
   input wire         sys_clk ,
   input wire         rst_n ,
   input wire [31:0]  gof0cd8 ,
   input wire         zm866c1 ,
   input wire [11:0]  yz3360b ,
   input wire         ph9b05d ,
   input              fnd82ee ,
   output wire [11:0] eac1777 ,
   output reg         hqbbb8 ,
   output reg         jc5ddc2 ,
   output reg         hoeee12 ,
   output reg         cm77093          ) ;
reg [11:0]            twb8499 ;
reg                   blc24ca ;
reg                   oh12657 ;
reg                   ri932bc ;
reg [11:0]            pu995e2 ;
wire                  hocaf13 ;
wire                  jc5789a ;
wire [11:0]           gqbc4d3 ;
wire [11:0]           ale2698 ;
wire                  tj134c4 ;
wire                  gd9a626 ;
wire                  kdd3134 ;
wire                  ks989a4 ;
parameter osc4d20    = 12'hFFF ;
reg [31 : 0] oh26901;
reg co3480d;
reg [11 : 0] uxa4069;
reg zm2034d;
reg ng1a6b;
reg gdd35b;
reg by69adc;
reg dm4d6e2;
reg [11 : 0] fn6b712;
reg kd5b896;
reg uvdc4b5;
reg [11 : 0] wje25ad;
reg [11 : 0] mt12d6c;
reg fc96b65;
reg dbb5b2b;
reg baad95f;
reg dm6cafa;
reg [2047:0] necf6c2;
wire [16:0] ld7b613;
localparam qgdb09f = 17,nrd84f8 = 32'hfdffe44b;
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
assign hocaf13 = (oh26901[31:24] == 8'h00)  ;
assign jc5789a = (oh26901[31:24] == 8'h10) ;
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n) begin       twb8499  <= 12'h000 ;       blc24ca   <= 1'b0 ;   end   else if (kd5b896 || uvdc4b5) begin       twb8499  <= oh26901[11:0] ;       blc24ca   <= co3480d ;   end   else  begin       twb8499  <= twb8499 ;       blc24ca   <= 1'b0 ;   end
end
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n) begin      oh12657   <= 1'b0 ;      ri932bc   <= 1'b0 ;   end   else  begin      oh12657   <= kd5b896 ;      ri932bc   <= uvdc4b5 ;   end
end
assign gqbc4d3 = ~twb8499 ;
assign tj134c4 = ((uxa4069 + wje25ad) <= 12'd2048) ;
assign ale2698 = ((~fn6b712) + 12'h001) ;
assign gd9a626 = ((twb8499 + mt12d6c) < 12'd2048) ;
assign kdd3134 = (twb8499 == fn6b712) ;
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n)      cm77093 <= 1'b0 ;   else if (gdd35b && (!fc96b65 || (fc96b65 && !dbb5b2b)))      cm77093 <= 1'b1 ;   else      cm77093 <= 1'b0 ;
end
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n) begin      hoeee12 <= 1'b0 ;      pu995e2   <= osc4d20 ;   end   else if (ng1a6b) begin      hoeee12 <= 1'b0 ;      pu995e2   <= osc4d20 ;   end   else if (gdd35b && fc96b65 && dbb5b2b & !baad95f) begin            if (by69adc || dm4d6e2) begin         hoeee12 <= 1'b1 ;         pu995e2   <= twb8499 ;      end      else begin         hoeee12 <= 1'b0 ;         pu995e2   <= fn6b712 ;      end   end   else begin      hoeee12 <= 1'b0 ;      pu995e2   <= fn6b712 ;   end
end
assign eac1777 = fn6b712 ;
assign ks989a4 =  ~(uxa4069 == (twb8499 + 1));
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n)      jc5ddc2 <= 1'b0 ;   else if (gdd35b && fc96b65 && dbb5b2b && dm4d6e2 && dm6cafa)      jc5ddc2 <= 1'b1 ;   else if (zm2034d)      jc5ddc2 <= 1'b0 ;   else      jc5ddc2 <= jc5ddc2 ;
end
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n)      hqbbb8 <= 1'b0 ;   else if (gdd35b && fc96b65 && dbb5b2b && by69adc)      hqbbb8 <= 1'b1 ;   else      hqbbb8 <= 1'b0 ;
end
always@* begin oh26901<={gof0cd8>>1,ld7b613[0]};co3480d<=ld7b613[1];uxa4069<={yz3360b>>1,ld7b613[2]};zm2034d<=ld7b613[3];ng1a6b<=ld7b613[4];gdd35b<=ld7b613[5];by69adc<=ld7b613[6];dm4d6e2<=ld7b613[7];fn6b712<={pu995e2>>1,ld7b613[8]};kd5b896<=ld7b613[9];uvdc4b5<=ld7b613[10];wje25ad<={gqbc4d3>>1,ld7b613[11]};mt12d6c<={ale2698>>1,ld7b613[12]};fc96b65<=ld7b613[13];dbb5b2b<=ld7b613[14];baad95f<=ld7b613[15];dm6cafa<=ld7b613[16];end
always@* begin necf6c2[2047]<=zm866c1;necf6c2[2046]<=yz3360b[0];necf6c2[2044]<=ph9b05d;necf6c2[2040]<=fnd82ee;necf6c2[2033]<=blc24ca;necf6c2[2019]<=oh12657;necf6c2[1991]<=ri932bc;necf6c2[1934]<=pu995e2[0];necf6c2[1898]<=kdd3134;necf6c2[1821]<=hocaf13;necf6c2[1749]<=ks989a4;necf6c2[1595]<=jc5789a;necf6c2[1142]<=gqbc4d3[0];necf6c2[1023]<=gof0cd8[0];necf6c2[949]<=gd9a626;necf6c2[474]<=tj134c4;necf6c2[237]<=ale2698[0];end         assign suff972 = necf6c2,ld7b613 = cme5c87;   initial begin   jcc030e = $fopen(".fred");   $fdisplay( jcc030e, "%3h\n%3h", (thc27c7 >> 4) & fnc7fe5, (thc27c7 >> (mt9f1ff+4)) & fnc7fe5 );   $fclose(jcc030e);   $readmemh(".fred", qg721c0);   end   always @ (suff972) begin   ym8700c = qg721c0[1];       for (vk1872=0; vk1872<qgdb09f; vk1872=vk1872+1) begin           cme5c87[vk1872] = suff972[ym8700c];       rv38061  = ^(ym8700c & qg721c0[0]);       ym8700c =  {ym8700c, rv38061};       end   end
endmodule