module aaa91a(
            sys_clk,
            rst_n,
            sj23425,
            ec1a12c,
            tud0960,
            hd84b02,
            wy24981,
            zz13124,
            aa98926,
            kf2ead
            );
input          sys_clk;
input          rst_n;
input          sj23425;
input   [31:0] tud0960;
input   [31:0] hd84b02;
input          ec1a12c;
output  [15:0] kf2ead;
output         wy24981;
output         zz13124;
output         aa98926;
reg     [15:0] kf2ead;
reg            wy24981;
reg            zz13124;
reg            aa98926;
reg     [31:0] osdbb9d;
reg     [15:0] ribab0;
reg     [15:0] rie9b6;
reg     [1:0]  ayeac13;
reg     [31:0] qv36cc7;
wire    [31:0] blddce9;
wire    [15:0] ohbb773;
wire    [15:0] jr13231;
reg do9918e;
reg rtc8c73;
reg [31 : 0] os4639f;
reg [31 : 0] mg31cf9;
reg [31 : 0] ana1624;
reg [15 : 0] lq73e4f;
reg [15 : 0] kf9f27a;
reg [1 : 0] rtf93d4;
reg [31 : 0] rg57e59;
reg [31 : 0] vkb125;
reg [15 : 0] anb42c4;
reg [15 : 0] ead4d7c;
reg [2047:0] necf6c2;
wire [11:0] ld7b613;
localparam qgdb09f = 12,nrd84f8 = 32'hfdffea0b;
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
always @ (posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      wy24981      <= 1'b0;      zz13124  <= 1'b0;      aa98926 <= 1'b0;      ayeac13       <= 2'b00;   end   else begin            zz13124  <= do9918e;      aa98926 <= (rtf93d4 == 2'b10) ? 1'b1 : 1'b0;      if(do9918e)         wy24981      <= 1'b1;      else if(rtf93d4 == 2'b11)         wy24981      <= 1'b0;      if(wy24981)         ayeac13    <= rtf93d4 + 1'b1;   end
end
assign  blddce9   =  rg57e59;
assign  ohbb773   =  16'h32B9;
always @ (posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      rie9b6      <= 16'h0000;      qv36cc7  <= 32'd0;      kf2ead         <= 16'h0000;   end   else begin            rie9b6 <= lq73e4f;      if(do9918e)         qv36cc7  <= (rtc8c73) ? mg31cf9 : os4639f;      if(do9918e)         kf2ead  <= (rtc8c73) ? mg31cf9[31:16] : os4639f[31:16];      else if(rtf93d4 == 2'b00)         kf2ead  <= rg57e59[15:0];      else         kf2ead  <= ead4d7c;
   end
end
assign   jr13231 = {~kf9f27a[ 8], ~kf9f27a[ 9], ~kf9f27a[10], ~kf9f27a[11],                     ~kf9f27a[12], ~kf9f27a[13], ~kf9f27a[14], ~kf9f27a[15],                     ~kf9f27a[ 0], ~kf9f27a[ 1], ~kf9f27a[ 2], ~kf9f27a[ 3],                     ~kf9f27a[ 4], ~kf9f27a[ 5], ~kf9f27a[ 6], ~kf9f27a[ 7] };
always @(*) begin    osdbb9d = { vkb125[24], vkb125[25], vkb125[26], vkb125[27], vkb125[28], vkb125[29], vkb125[30], vkb125[31],           vkb125[16], vkb125[17], vkb125[18], vkb125[19], vkb125[20], vkb125[21], vkb125[22], vkb125[23],           vkb125[ 8], vkb125[ 9], vkb125[10], vkb125[11], vkb125[12], vkb125[13], vkb125[14], vkb125[15],           vkb125[ 0], vkb125[ 1], vkb125[ 2], vkb125[ 3], vkb125[ 4], vkb125[ 5], vkb125[ 6], vkb125[ 7]};    ribab0[0] = ana1624[31] ^ ana1624[29] ^ ana1624[28] ^ ana1624[26] ^ ana1624[23] ^ ana1624[21] ^ ana1624[20] ^                ana1624[15] ^ ana1624[13] ^ ana1624[12] ^ ana1624[8] ^ ana1624[4] ^ ana1624[0] ^ anb42c4[0];
    ribab0[1] = ana1624[31] ^ ana1624[30] ^ ana1624[28] ^ ana1624[27] ^ ana1624[26] ^ ana1624[24] ^ ana1624[23] ^                ana1624[22] ^ ana1624[20] ^ ana1624[16] ^ ana1624[15] ^ ana1624[14] ^ ana1624[12] ^ ana1624[9] ^                ana1624[8] ^ ana1624[5] ^ ana1624[4] ^ ana1624[1] ^ ana1624[0] ^ anb42c4[1];
    ribab0[2] = ana1624[31] ^ ana1624[29] ^ ana1624[28] ^ ana1624[27] ^ ana1624[25] ^ ana1624[24] ^ ana1624[23] ^                ana1624[21] ^ ana1624[17] ^ ana1624[16] ^ ana1624[15] ^ ana1624[13] ^ ana1624[10] ^ ana1624[9] ^                ana1624[6] ^ ana1624[5] ^ ana1624[2] ^ ana1624[1] ^ anb42c4[2];
    ribab0[3] = ana1624[31] ^ ana1624[30] ^ ana1624[25] ^ ana1624[24] ^ ana1624[23] ^ ana1624[22] ^ ana1624[21] ^                ana1624[20] ^ ana1624[18] ^ ana1624[17] ^ ana1624[16] ^ ana1624[15] ^ ana1624[14] ^ ana1624[13] ^                ana1624[12] ^ ana1624[11] ^ ana1624[10] ^ ana1624[8] ^ ana1624[7] ^ ana1624[6] ^ ana1624[4] ^                ana1624[3] ^ ana1624[2] ^ ana1624[0] ^ anb42c4[3];
    ribab0[4] = ana1624[31] ^ ana1624[26] ^ ana1624[25] ^ ana1624[24] ^ ana1624[23] ^ ana1624[22] ^ ana1624[21] ^                ana1624[19] ^ ana1624[18] ^ ana1624[17] ^ ana1624[16] ^ ana1624[15] ^ ana1624[14] ^ ana1624[13] ^                ana1624[12] ^ ana1624[11] ^ ana1624[9] ^ ana1624[8] ^ ana1624[7] ^ ana1624[5] ^ ana1624[4] ^                ana1624[3] ^ ana1624[1] ^ anb42c4[4];    ribab0[5] = ana1624[27] ^ ana1624[26] ^ ana1624[25] ^ ana1624[24] ^ ana1624[23] ^ ana1624[22] ^ ana1624[20] ^                ana1624[19] ^ ana1624[18] ^ ana1624[17] ^ ana1624[16] ^ ana1624[15] ^ ana1624[14] ^ ana1624[13] ^                ana1624[12] ^ ana1624[10] ^ ana1624[9] ^ ana1624[8] ^ ana1624[6] ^ ana1624[5] ^ ana1624[4] ^                ana1624[2] ^ anb42c4[5];
    ribab0[6] = ana1624[28] ^ ana1624[27] ^ ana1624[26] ^ ana1624[25] ^ ana1624[24] ^ ana1624[23] ^ ana1624[21] ^                ana1624[20] ^ ana1624[19] ^ ana1624[18] ^ ana1624[17] ^ ana1624[16] ^ ana1624[15] ^ ana1624[14] ^                ana1624[13] ^ ana1624[11] ^ ana1624[10] ^ ana1624[9] ^ ana1624[7] ^ ana1624[6] ^ ana1624[5] ^                ana1624[3]  ^ anb42c4[6];
    ribab0[7] = ana1624[29] ^ ana1624[28] ^ ana1624[27] ^ ana1624[26] ^ ana1624[25] ^ ana1624[24] ^ ana1624[22] ^                ana1624[21] ^ ana1624[20] ^ ana1624[19] ^ ana1624[18] ^ ana1624[17] ^ ana1624[16] ^ ana1624[15] ^                ana1624[14] ^ ana1624[12] ^ ana1624[11] ^ ana1624[10] ^ ana1624[8] ^ ana1624[7] ^ ana1624[6] ^                ana1624[4]  ^ anb42c4[7];    ribab0[8] = ana1624[30] ^ ana1624[29] ^ ana1624[28] ^ ana1624[27] ^ ana1624[26] ^ ana1624[25] ^ ana1624[23] ^                ana1624[22] ^ ana1624[21] ^ ana1624[20] ^ ana1624[19] ^ ana1624[18] ^ ana1624[17] ^ ana1624[16] ^                ana1624[15] ^ ana1624[13] ^ ana1624[12] ^ ana1624[11] ^ ana1624[9] ^ ana1624[8] ^ ana1624[7] ^                ana1624[5]  ^ anb42c4[8];
    ribab0[9] = ana1624[31] ^ ana1624[30] ^ ana1624[29] ^ ana1624[28] ^ ana1624[27] ^ ana1624[26] ^ ana1624[24] ^                ana1624[23] ^ ana1624[22] ^ ana1624[21] ^ ana1624[20] ^ ana1624[19] ^ ana1624[18] ^ ana1624[17] ^                ana1624[16] ^ ana1624[14] ^ ana1624[13] ^ ana1624[12] ^ ana1624[10] ^ ana1624[9] ^ ana1624[8] ^                ana1624[6]  ^ anb42c4[9];
    ribab0[10] = ana1624[31] ^ ana1624[30] ^ ana1624[29] ^ ana1624[28] ^ ana1624[27] ^ ana1624[25] ^ ana1624[24] ^                 ana1624[23] ^ ana1624[22] ^ ana1624[21] ^ ana1624[20] ^ ana1624[19] ^ ana1624[18] ^ ana1624[17] ^                 ana1624[15] ^ ana1624[14] ^ ana1624[13] ^ ana1624[11] ^ ana1624[10] ^ ana1624[9] ^ ana1624[7] ^ anb42c4[10];
    ribab0[11] = ana1624[31] ^ ana1624[30] ^ ana1624[29] ^ ana1624[28] ^ ana1624[26] ^ ana1624[25] ^ ana1624[24] ^                 ana1624[23] ^ ana1624[22] ^ ana1624[21] ^ ana1624[20] ^ ana1624[19] ^ ana1624[18] ^ ana1624[16] ^                 ana1624[15] ^ ana1624[14] ^ ana1624[12] ^ ana1624[11] ^ ana1624[10] ^ ana1624[8] ^ anb42c4[11];
    ribab0[12] = ana1624[30] ^ ana1624[28] ^ ana1624[27] ^ ana1624[25] ^ ana1624[24] ^ ana1624[22] ^ ana1624[19] ^                 ana1624[17] ^ ana1624[16] ^ ana1624[11] ^ ana1624[9] ^ ana1624[8] ^ ana1624[4] ^ ana1624[0] ^ anb42c4[12];
    ribab0[13] = ana1624[31] ^ ana1624[29] ^ ana1624[28] ^ ana1624[26] ^ ana1624[25] ^ ana1624[23] ^ ana1624[20] ^                 ana1624[18] ^ ana1624[17] ^ ana1624[12] ^ ana1624[10] ^ ana1624[9] ^ ana1624[5] ^ ana1624[1] ^ anb42c4[13];
    ribab0[14] = ana1624[30] ^ ana1624[29] ^ ana1624[27] ^ ana1624[26] ^ ana1624[24] ^ ana1624[21] ^ ana1624[19] ^                 ana1624[18] ^ ana1624[13] ^ ana1624[11] ^ ana1624[10] ^ ana1624[6] ^ ana1624[2] ^ anb42c4[14];
    ribab0[15] = ana1624[31] ^ ana1624[30] ^ ana1624[28] ^ ana1624[27] ^ ana1624[25] ^ ana1624[22] ^ ana1624[20] ^                 ana1624[19] ^ ana1624[14] ^ ana1624[12] ^ ana1624[11] ^ ana1624[7] ^ ana1624[3] ^ anb42c4[15];
end
always@* begin do9918e<=ld7b613[0];rtc8c73<=ld7b613[1];os4639f<={tud0960>>1,ld7b613[2]};mg31cf9<={hd84b02>>1,ld7b613[3]};ana1624<={osdbb9d>>1,ld7b613[4]};lq73e4f<={ribab0>>1,ld7b613[5]};kf9f27a<={rie9b6>>1,ld7b613[6]};rtf93d4<={ayeac13>>1,ld7b613[7]};rg57e59<={qv36cc7>>1,ld7b613[8]};vkb125<={blddce9>>1,ld7b613[9]};anb42c4<={ohbb773>>1,ld7b613[10]};ead4d7c<={jr13231>>1,ld7b613[11]};end
always@* begin necf6c2[2047]<=ec1a12c;necf6c2[2046]<=tud0960[0];necf6c2[2044]<=hd84b02[0];necf6c2[2040]<=osdbb9d[0];necf6c2[2032]<=ribab0[0];necf6c2[2016]<=rie9b6[0];necf6c2[1984]<=ayeac13[0];necf6c2[1921]<=qv36cc7[0];necf6c2[1795]<=blddce9[0];necf6c2[1542]<=ohbb773[0];necf6c2[1036]<=jr13231[0];necf6c2[1023]<=sj23425;end         assign suff972 = necf6c2,ld7b613 = cme5c87;   initial begin   jcc030e = $fopen(".fred");   $fdisplay( jcc030e, "%3h\n%3h", (thc27c7 >> 4) & fnc7fe5, (thc27c7 >> (mt9f1ff+4)) & fnc7fe5 );   $fclose(jcc030e);   $readmemh(".fred", qg721c0);   end   always @ (suff972) begin   ym8700c = qg721c0[1];       for (vk1872=0; vk1872<qgdb09f; vk1872=vk1872+1) begin           cme5c87[vk1872] = suff972[ym8700c];       rv38061  = ^(ym8700c & qg721c0[0]);       ym8700c =  {ym8700c, rv38061};       end   end
endmodule