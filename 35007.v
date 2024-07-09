module hqb7379(
   input wire         sys_clk ,
   input wire         rst_n ,
   input wire [15:0]  data_in ,
   input wire         enable_crc ,
   output wire [31:0] nr61d36         ) ;
reg  [31:0]            rie9b6 ;
reg  [31:0]            nr74db2 ;
reg  [15:0]            coa6d97 ;
reg  [31:0]            mt36cb9 ;
reg  [15:0]            qib65cc ;
reg                    nr5a55e ;
wire [7:0]             bab2e61 ;
wire [7:0]             gq9730a ;
wire [7:0]             ecb9850 ;
wire [7:0]             ofcc281 ;
wire                   zxf6f6d ;
reg [15 : 0] uvf7ec2;
reg mg8d12e;
reg [31 : 0] nr50339;
reg [15 : 0] ph819cf;
reg [31 : 0] xlce7f;
reg [15 : 0] kq673ff;
reg pu93831;
reg [7 : 0] ux39ff8;
reg [7 : 0] lqcffc5;
reg [7 : 0] qt7fe2a;
reg [7 : 0] ayff154;
reg tj8b638;
reg [2047:0] necf6c2;
wire [11:0] ld7b613;
localparam qgdb09f = 12,nrd84f8 = 32'hfdfff02b;
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
always @* begin   coa6d97 = uvf7ec2;   qib65cc = {          ph819cf[8], ph819cf[9], ph819cf[10], ph819cf[11], ph819cf[12], ph819cf[13], ph819cf[14], ph819cf[15],          ph819cf[0], ph819cf[1], ph819cf[2], ph819cf[3], ph819cf[4], ph819cf[5], ph819cf[6], ph819cf[7]         } ;   mt36cb9 = rie9b6 ;   nr74db2[0] = kq673ff[12] ^ kq673ff[10] ^ kq673ff[9] ^ kq673ff[6] ^ kq673ff[0] ^ xlce7f[16] ^ xlce7f[22] ^                xlce7f[25] ^ xlce7f[26] ^ xlce7f[28];   nr74db2[1] = kq673ff[13] ^ kq673ff[12] ^ kq673ff[11] ^ kq673ff[9] ^ kq673ff[7] ^ kq673ff[6] ^ kq673ff[1] ^                kq673ff[0] ^ xlce7f[16] ^ xlce7f[17] ^ xlce7f[22] ^ xlce7f[23] ^ xlce7f[25] ^ xlce7f[27] ^                xlce7f[28] ^ xlce7f[29];   nr74db2[2] = kq673ff[14] ^ kq673ff[13] ^ kq673ff[9] ^ kq673ff[8] ^ kq673ff[7] ^ kq673ff[6] ^ kq673ff[2] ^                kq673ff[1] ^ kq673ff[0] ^ xlce7f[16] ^ xlce7f[17] ^ xlce7f[18] ^ xlce7f[22] ^ xlce7f[23] ^                xlce7f[24] ^ xlce7f[25] ^ xlce7f[29] ^ xlce7f[30];   nr74db2[3] = kq673ff[15] ^ kq673ff[14] ^ kq673ff[10] ^ kq673ff[9] ^ kq673ff[8] ^ kq673ff[7] ^ kq673ff[3] ^                kq673ff[2] ^ kq673ff[1] ^ xlce7f[17] ^ xlce7f[18] ^ xlce7f[19] ^ xlce7f[23] ^ xlce7f[24] ^                xlce7f[25] ^ xlce7f[26] ^ xlce7f[30] ^ xlce7f[31];   nr74db2[4] = kq673ff[15] ^ kq673ff[12] ^ kq673ff[11] ^ kq673ff[8] ^ kq673ff[6] ^ kq673ff[4] ^ kq673ff[3] ^                kq673ff[2] ^ kq673ff[0] ^ xlce7f[16] ^ xlce7f[18] ^ xlce7f[19] ^ xlce7f[20] ^ xlce7f[22] ^                xlce7f[24] ^ xlce7f[27] ^ xlce7f[28] ^ xlce7f[31];   nr74db2[5] = kq673ff[13] ^ kq673ff[10] ^ kq673ff[7] ^ kq673ff[6] ^ kq673ff[5] ^ kq673ff[4] ^ kq673ff[3] ^                kq673ff[1] ^ kq673ff[0] ^ xlce7f[16] ^ xlce7f[17] ^ xlce7f[19] ^ xlce7f[20] ^ xlce7f[21] ^                xlce7f[22] ^ xlce7f[23] ^ xlce7f[26] ^ xlce7f[29];   nr74db2[6] = kq673ff[14] ^ kq673ff[11] ^ kq673ff[8] ^ kq673ff[7] ^ kq673ff[6] ^ kq673ff[5] ^ kq673ff[4] ^                kq673ff[2] ^ kq673ff[1] ^ xlce7f[17] ^ xlce7f[18] ^ xlce7f[20] ^ xlce7f[21] ^ xlce7f[22] ^                xlce7f[23] ^ xlce7f[24] ^ xlce7f[27] ^ xlce7f[30];   nr74db2[7] = kq673ff[15] ^ kq673ff[10] ^ kq673ff[8] ^ kq673ff[7] ^ kq673ff[5] ^ kq673ff[3] ^ kq673ff[2] ^                kq673ff[0] ^ xlce7f[16] ^ xlce7f[18] ^ xlce7f[19] ^ xlce7f[21] ^ xlce7f[23] ^ xlce7f[24] ^                xlce7f[26] ^ xlce7f[31];   nr74db2[8] = kq673ff[12] ^ kq673ff[11] ^ kq673ff[10] ^ kq673ff[8] ^ kq673ff[4] ^ kq673ff[3] ^ kq673ff[1] ^                kq673ff[0] ^ xlce7f[16] ^ xlce7f[17] ^ xlce7f[19] ^ xlce7f[20] ^ xlce7f[24] ^ xlce7f[26] ^                xlce7f[27] ^ xlce7f[28];   nr74db2[9] = kq673ff[13] ^ kq673ff[12] ^ kq673ff[11] ^ kq673ff[9] ^ kq673ff[5] ^ kq673ff[4] ^ kq673ff[2] ^                kq673ff[1] ^ xlce7f[17] ^ xlce7f[18] ^ xlce7f[20] ^ xlce7f[21] ^ xlce7f[25] ^ xlce7f[27] ^                xlce7f[28] ^ xlce7f[29];   nr74db2[10] = kq673ff[14] ^ kq673ff[13] ^ kq673ff[9] ^ kq673ff[5] ^ kq673ff[3] ^ kq673ff[2] ^ kq673ff[0] ^                 xlce7f[16] ^ xlce7f[18] ^ xlce7f[19] ^ xlce7f[21] ^ xlce7f[25] ^ xlce7f[29] ^ xlce7f[30];   nr74db2[11] = kq673ff[15] ^ kq673ff[14] ^ kq673ff[12] ^ kq673ff[9] ^ kq673ff[4] ^ kq673ff[3] ^ kq673ff[1] ^                 kq673ff[0] ^ xlce7f[16] ^ xlce7f[17] ^ xlce7f[19] ^ xlce7f[20] ^ xlce7f[25] ^ xlce7f[28] ^                 xlce7f[30] ^ xlce7f[31];   nr74db2[12] = kq673ff[15] ^ kq673ff[13] ^ kq673ff[12] ^ kq673ff[9] ^ kq673ff[6] ^ kq673ff[5] ^ kq673ff[4] ^                 kq673ff[2] ^ kq673ff[1] ^ kq673ff[0] ^ xlce7f[16] ^ xlce7f[17] ^ xlce7f[18] ^ xlce7f[20] ^                 xlce7f[21] ^ xlce7f[22] ^ xlce7f[25] ^ xlce7f[28] ^ xlce7f[29] ^ xlce7f[31];   nr74db2[13] = kq673ff[14] ^ kq673ff[13] ^ kq673ff[10] ^ kq673ff[7] ^ kq673ff[6] ^ kq673ff[5] ^ kq673ff[3] ^                 kq673ff[2] ^ kq673ff[1] ^ xlce7f[17] ^ xlce7f[18] ^ xlce7f[19] ^ xlce7f[21] ^ xlce7f[22] ^                 xlce7f[23] ^ xlce7f[26] ^ xlce7f[29] ^ xlce7f[30];   nr74db2[14] = kq673ff[15] ^ kq673ff[14] ^ kq673ff[11] ^ kq673ff[8] ^ kq673ff[7] ^ kq673ff[6] ^ kq673ff[4] ^                 kq673ff[3] ^ kq673ff[2] ^ xlce7f[18] ^ xlce7f[19] ^ xlce7f[20] ^ xlce7f[22] ^ xlce7f[23] ^                 xlce7f[24] ^ xlce7f[27] ^ xlce7f[30] ^ xlce7f[31];   nr74db2[15] = kq673ff[15] ^ kq673ff[12] ^ kq673ff[9] ^ kq673ff[8] ^ kq673ff[7] ^ kq673ff[5] ^ kq673ff[4] ^                 kq673ff[3] ^ xlce7f[19] ^ xlce7f[20] ^ xlce7f[21] ^ xlce7f[23] ^ xlce7f[24] ^ xlce7f[25] ^                 xlce7f[28] ^ xlce7f[31];   nr74db2[16] = kq673ff[13] ^ kq673ff[12] ^ kq673ff[8] ^ kq673ff[5] ^ kq673ff[4] ^ kq673ff[0] ^ xlce7f[0] ^                 xlce7f[16] ^ xlce7f[20] ^ xlce7f[21] ^ xlce7f[24] ^ xlce7f[28] ^ xlce7f[29];   nr74db2[17] = kq673ff[14] ^ kq673ff[13] ^ kq673ff[9] ^ kq673ff[6] ^ kq673ff[5] ^ kq673ff[1] ^ xlce7f[1] ^                xlce7f[17] ^ xlce7f[21] ^ xlce7f[22] ^ xlce7f[25] ^ xlce7f[29] ^ xlce7f[30];   nr74db2[18] = kq673ff[15] ^ kq673ff[14] ^ kq673ff[10] ^ kq673ff[7] ^ kq673ff[6] ^ kq673ff[2] ^ xlce7f[2] ^                 xlce7f[18] ^ xlce7f[22] ^ xlce7f[23] ^ xlce7f[26] ^ xlce7f[30] ^ xlce7f[31];   nr74db2[19] = kq673ff[15] ^ kq673ff[11] ^ kq673ff[8] ^ kq673ff[7] ^ kq673ff[3] ^ xlce7f[3] ^ xlce7f[19] ^                 xlce7f[23] ^ xlce7f[24] ^ xlce7f[27] ^ xlce7f[31];   nr74db2[20] = kq673ff[12] ^ kq673ff[9] ^ kq673ff[8] ^ kq673ff[4] ^ xlce7f[4] ^ xlce7f[20] ^ xlce7f[24] ^                 xlce7f[25] ^ xlce7f[28];   nr74db2[21] = kq673ff[13] ^ kq673ff[10] ^ kq673ff[9] ^ kq673ff[5] ^ xlce7f[5] ^ xlce7f[21] ^ xlce7f[25] ^                 xlce7f[26] ^ xlce7f[29];   nr74db2[22] = kq673ff[14] ^ kq673ff[12] ^ kq673ff[11] ^ kq673ff[9] ^ kq673ff[0] ^ xlce7f[6] ^ xlce7f[16] ^                 xlce7f[25] ^ xlce7f[27] ^ xlce7f[28] ^ xlce7f[30];   nr74db2[23] = kq673ff[15] ^ kq673ff[13] ^ kq673ff[9] ^ kq673ff[6] ^ kq673ff[1] ^ kq673ff[0] ^ xlce7f[7] ^                 xlce7f[16] ^ xlce7f[17] ^ xlce7f[22] ^ xlce7f[25] ^ xlce7f[29] ^ xlce7f[31];   nr74db2[24] = kq673ff[14] ^ kq673ff[10] ^ kq673ff[7] ^ kq673ff[2] ^ kq673ff[1] ^ xlce7f[8] ^ xlce7f[17] ^                 xlce7f[18] ^ xlce7f[23] ^ xlce7f[26] ^ xlce7f[30];   nr74db2[25] = kq673ff[15] ^ kq673ff[11] ^ kq673ff[8] ^ kq673ff[3] ^ kq673ff[2] ^ xlce7f[9] ^ xlce7f[18] ^                 xlce7f[19] ^ xlce7f[24] ^ xlce7f[27] ^ xlce7f[31];   nr74db2[26] = kq673ff[10] ^ kq673ff[6] ^ kq673ff[4] ^ kq673ff[3] ^ kq673ff[0] ^ xlce7f[10] ^ xlce7f[16] ^                 xlce7f[19] ^ xlce7f[20] ^ xlce7f[22] ^ xlce7f[26];   nr74db2[27] = kq673ff[11] ^ kq673ff[7] ^ kq673ff[5] ^ kq673ff[4] ^ kq673ff[1] ^ xlce7f[11] ^ xlce7f[17] ^                 xlce7f[20] ^ xlce7f[21] ^ xlce7f[23] ^ xlce7f[27];   nr74db2[28] = kq673ff[12] ^ kq673ff[8] ^ kq673ff[6] ^ kq673ff[5] ^ kq673ff[2] ^ xlce7f[12] ^ xlce7f[18] ^                 xlce7f[21] ^ xlce7f[22] ^ xlce7f[24] ^ xlce7f[28];   nr74db2[29] = kq673ff[13] ^ kq673ff[9] ^ kq673ff[7] ^ kq673ff[6] ^ kq673ff[3] ^ xlce7f[13] ^ xlce7f[19] ^                 xlce7f[22] ^ xlce7f[23] ^ xlce7f[25] ^ xlce7f[29];   nr74db2[30] = kq673ff[14] ^ kq673ff[10] ^ kq673ff[8] ^ kq673ff[7] ^ kq673ff[4] ^ xlce7f[14] ^ xlce7f[20] ^                 xlce7f[23] ^ xlce7f[24] ^ xlce7f[26] ^ xlce7f[30];   nr74db2[31] = kq673ff[15] ^ kq673ff[11] ^ kq673ff[9] ^ kq673ff[8] ^ kq673ff[5] ^ xlce7f[15] ^ xlce7f[21] ^                 xlce7f[24] ^ xlce7f[25] ^ xlce7f[27] ^ xlce7f[31];
end
always @( posedge sys_clk, negedge rst_n ) begin   if (!rst_n)      nr5a55e  <= 1'b0 ;   else      nr5a55e  <= mg8d12e ;
end
assign zxf6f6d = ~mg8d12e & pu93831 ;
always @( posedge sys_clk, negedge rst_n ) begin   if (!rst_n)      rie9b6 <= 32'hFFFF_FFFF ;   else if (tj8b638)      rie9b6 <= 32'hFFFF_FFFF ;   else if (mg8d12e)      rie9b6 <= nr50339 ;   else      rie9b6 <= rie9b6 ;
end
assign bab2e61 = { ~rie9b6[24], ~rie9b6[25], ~rie9b6[26], ~rie9b6[27],                      ~rie9b6[28], ~rie9b6[29], ~rie9b6[30], ~rie9b6[31] } ;
assign gq9730a = { ~rie9b6[16], ~rie9b6[17], ~rie9b6[18], ~rie9b6[19],                      ~rie9b6[20], ~rie9b6[21], ~rie9b6[22], ~rie9b6[23] } ;
assign ecb9850 = { ~rie9b6[8], ~rie9b6[9], ~rie9b6[10], ~rie9b6[11],                      ~rie9b6[12], ~rie9b6[13], ~rie9b6[14], ~rie9b6[15] } ;
assign ofcc281 = { ~rie9b6[0], ~rie9b6[1], ~rie9b6[2], ~rie9b6[3],                      ~rie9b6[4], ~rie9b6[5], ~rie9b6[6], ~rie9b6[7] } ;
assign nr61d36 = {ux39ff8, lqcffc5, qt7fe2a, ayff154} ;
always@* begin uvf7ec2<={data_in>>1,ld7b613[0]};mg8d12e<=ld7b613[1];nr50339<={nr74db2>>1,ld7b613[2]};ph819cf<={coa6d97>>1,ld7b613[3]};xlce7f<={mt36cb9>>1,ld7b613[4]};kq673ff<={qib65cc>>1,ld7b613[5]};pu93831<=ld7b613[6];ux39ff8<={bab2e61>>1,ld7b613[7]};lqcffc5<={gq9730a>>1,ld7b613[8]};qt7fe2a<={ecb9850>>1,ld7b613[9]};ayff154<={ofcc281>>1,ld7b613[10]};tj8b638<=ld7b613[11];end
always@* begin necf6c2[2047]<=enable_crc;necf6c2[2046]<=nr74db2[0];necf6c2[2044]<=coa6d97[0];necf6c2[2041]<=mt36cb9[0];necf6c2[2035]<=qib65cc[0];necf6c2[2022]<=nr5a55e;necf6c2[1996]<=bab2e61[0];necf6c2[1945]<=gq9730a[0];necf6c2[1843]<=ecb9850[0];necf6c2[1638]<=ofcc281[0];necf6c2[1229]<=zxf6f6d;necf6c2[1023]<=data_in[0];end         assign suff972 = necf6c2,ld7b613 = cme5c87;   initial begin   jcc030e = $fopen(".fred");   $fdisplay( jcc030e, "%3h\n%3h", (thc27c7 >> 4) & fnc7fe5, (thc27c7 >> (mt9f1ff+4)) & fnc7fe5 );   $fclose(jcc030e);   $readmemh(".fred", qg721c0);   end   always @ (suff972) begin   ym8700c = qg721c0[1];       for (vk1872=0; vk1872<qgdb09f; vk1872=vk1872+1) begin           cme5c87[vk1872] = suff972[ym8700c];       rv38061  = ^(ym8700c & qg721c0[0]);       ym8700c =  {ym8700c, rv38061};       end   end
endmodule