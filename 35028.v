module uvf7987 (
                f_clk ,
                s_clk ,
                rst_n ,
                in_fclk,
                out_sclk
               );
parameter WIDTH = 1 ;
input              f_clk ;
input              s_clk ;
input              rst_n ;
input  [WIDTH-1:0] in_fclk ;
output [WIDTH-1:0] out_sclk ;
reg [WIDTH-1:0]   fac0db7 ;
reg [WIDTH-1:0]   oh36dde ;
reg [WIDTH-1:0]   vkb77a0 ;
reg [WIDTH-1:0]   ayde81c ;
reg [WIDTH-1:0]   hda070a ;
wire [WIDTH-1:0]  lf1c2be ;
wire [WIDTH-1:0]  out_sclk ;
integer ir85a38 ;
reg [WIDTH - 1 : 0] enf761c;
reg [WIDTH - 1 : 0] ldd872d;
reg [WIDTH - 1 : 0] tj1cb7c;
reg [WIDTH - 1 : 0] fp2df30;
reg [WIDTH - 1 : 0] by7cc35;
reg [WIDTH - 1 : 0] xy30d5e;
reg [WIDTH - 1 : 0] pu3579a;
reg [2047:0] necf6c2;
wire [6:0] ld7b613;
localparam qgdb09f = 7,nrd84f8 = 32'hfdfff02b;
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
always @(posedge f_clk or negedge rst_n) begin   if (!rst_n)      fac0db7 <= {WIDTH{1'b0}};   else      for (ir85a38 = 0; ir85a38 <= WIDTH-1; ir85a38 = ir85a38+1) begin         fac0db7[ir85a38] <= (pu3579a[ir85a38]== 1'b1) ? ldd872d[ir85a38] : enf761c[ir85a38];      end
end
always @(posedge s_clk or negedge rst_n) begin   if (!rst_n)      ayde81c <= {WIDTH{1'b0}};   else      ayde81c <= ldd872d;
end
always @(posedge s_clk or negedge rst_n) begin   if (!rst_n)      hda070a <= {WIDTH{1'b0}};   else      hda070a <= by7cc35;
end
assign out_sclk  = xy30d5e ;
always @(posedge f_clk or negedge rst_n) begin   if (!rst_n)      oh36dde <= {WIDTH{1'b0}};   else      oh36dde <= xy30d5e;
end
always @(posedge f_clk or negedge rst_n) begin   if (!rst_n)      vkb77a0 <= {WIDTH{1'b0}};   else      vkb77a0 <= tj1cb7c;
end
assign lf1c2be  = ldd872d ^ fp2df30;
always@* begin enf761c<={in_fclk>>1,ld7b613[0]};ldd872d<={fac0db7>>1,ld7b613[1]};tj1cb7c<={oh36dde>>1,ld7b613[2]};fp2df30<={vkb77a0>>1,ld7b613[3]};by7cc35<={ayde81c>>1,ld7b613[4]};xy30d5e<={hda070a>>1,ld7b613[5]};pu3579a<={lf1c2be>>1,ld7b613[6]};end
always@* begin necf6c2[2047]<=fac0db7[0];necf6c2[2046]<=oh36dde[0];necf6c2[2044]<=vkb77a0[0];necf6c2[2041]<=ayde81c[0];necf6c2[2035]<=hda070a[0];necf6c2[2022]<=lf1c2be[0];necf6c2[1023]<=in_fclk[0];end         assign suff972 = necf6c2,ld7b613 = cme5c87;   initial begin   jcc030e = $fopen(".fred");   $fdisplay( jcc030e, "%3h\n%3h", (thc27c7 >> 4) & fnc7fe5, (thc27c7 >> (mt9f1ff+4)) & fnc7fe5 );   $fclose(jcc030e);   $readmemh(".fred", qg721c0);   end   always @ (suff972) begin   ym8700c = qg721c0[1];       for (vk1872=0; vk1872<qgdb09f; vk1872=vk1872+1) begin           cme5c87[vk1872] = suff972[ym8700c];       rv38061  = ^(ym8700c & qg721c0[0]);       ym8700c =  {ym8700c, rv38061};       end   end
endmodule