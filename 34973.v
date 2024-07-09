module fc3ffdb (
   input wire        qgffeda ,
   input wire        rst_n ,
   input wire [7:0]  data_in ,
   input wire        kqdb40b ,
   input wire        psda058 ,
   output reg [7:0]  dmd02c2 ,
   output reg        nt81613           );
reg [15:0]   bab09e;
reg          rg584f3;
reg [3:0]    zxc279b;
reg          zz13cdf ;
reg          hd9e6ff;
reg          thf37fe ;
reg [7:0]    bn9bff7;
reg          zkdffbf;
reg          icffdfb;
reg          psfefd8;
reg [7 : 0] uvf7ec2;
reg fpbf614;
reg vifb0a7;
reg vvd853b;
reg [3 : 0] fnc29df;
reg pu14efe;
reg zma77f2;
reg ie3bf92;
reg [7 : 0] psdfc90;
reg hofe483;
reg mrf241b;
reg uk920dd;
reg [2047:0] necf6c2;
wire [11:0] ld7b613;
localparam qgdb09f = 12,nrd84f8 = 32'hfdffca8b;
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
always @(posedge qgffeda, negedge rst_n) begin      if(!rst_n) begin      zz13cdf <= 1'b0 ;      hd9e6ff <= 1'b0 ;      thf37fe <= 1'b0 ;
      bn9bff7  <= 8'h0 ;      zkdffbf <= 1'b0 ;   end   else  begin      zz13cdf <= fpbf614 & (uvf7ec2[7:0] == 8'hbc);       hd9e6ff <= fpbf614 & (uvf7ec2[7:0] == 8'h1c);       thf37fe <= fpbf614 & (uvf7ec2[7:0] == 8'hf7);       bn9bff7  <= uvf7ec2 ;      zkdffbf <= fpbf614 ;   end
end
always @(posedge qgffeda, negedge rst_n) begin   if (!rst_n) begin      icffdfb <= 1'b0;      psfefd8 <= 1'b0;   end   else begin      icffdfb <= vifb0a7;      psfefd8 <= mrf241b;   end
end
always @(posedge qgffeda, negedge rst_n) begin   if(!rst_n)      rg584f3 <= 1'b0;   else if(pu14efe || (vvd853b && ie3bf92))      rg584f3 <= 1'b1;      else if ((fnc29df == 4'b1111) || hofe483)       rg584f3 <= 1'b0;   else      rg584f3 <= vvd853b;
end
always @(posedge qgffeda, negedge rst_n) begin   if(!rst_n)      zxc279b <= 4'b0000;   else if(pu14efe)      zxc279b <= 4'b0001;   else if (vvd853b)      zxc279b <= fnc29df + 4'b0001;   else      zxc279b <= 4'b0000;
end
always @(posedge qgffeda, negedge rst_n) begin   if(!rst_n) begin      dmd02c2  <= 8'd0;      nt81613 <= 1'd0;   end   else begin
      nt81613 <= hofe483;      if(vvd853b || hofe483 || uk920dd)          dmd02c2[7:0]  <= psdfc90[7:0];      else begin            dmd02c2[0] <= psdfc90[0] ^ bab09e[15];            dmd02c2[1] <= psdfc90[1] ^ bab09e[14];            dmd02c2[2] <= psdfc90[2] ^ bab09e[13];            dmd02c2[3] <= psdfc90[3] ^ bab09e[12];            dmd02c2[4] <= psdfc90[4] ^ bab09e[11];            dmd02c2[5] <= psdfc90[5] ^ bab09e[10];            dmd02c2[6] <= psdfc90[6] ^ bab09e[ 9];            dmd02c2[7] <= psdfc90[7] ^ bab09e[ 8];      end   end
end
always @(posedge qgffeda, negedge rst_n) begin   if(!rst_n)      bab09e <= 16'hffff;   else if(pu14efe)      bab09e <= 16'hffff;   else if(zma77f2)      bab09e <= bab09e;   else begin      bab09e[ 0] <= bab09e[ 8];      bab09e[ 1] <= bab09e[ 9];      bab09e[ 2] <= bab09e[10];      bab09e[ 3] <= bab09e[11] ^ bab09e[ 8];      bab09e[ 4] <= bab09e[12] ^ bab09e[ 9] ^ bab09e[ 8];      bab09e[ 5] <= bab09e[13] ^ bab09e[10] ^ bab09e[ 9] ^ bab09e[ 8];      bab09e[ 6] <= bab09e[14] ^ bab09e[11] ^ bab09e[10] ^ bab09e[ 9];      bab09e[ 7] <= bab09e[15] ^ bab09e[12] ^ bab09e[11] ^ bab09e[10];      bab09e[ 8] <= bab09e[ 0] ^ bab09e[13] ^ bab09e[12] ^ bab09e[11];      bab09e[ 9] <= bab09e[ 1] ^ bab09e[14] ^ bab09e[13] ^ bab09e[12];      bab09e[10] <= bab09e[ 2] ^ bab09e[15] ^ bab09e[14] ^ bab09e[13];      bab09e[11] <= bab09e[ 3]            ^ bab09e[15] ^ bab09e[14];      bab09e[12] <= bab09e[ 4]                       ^ bab09e[15];      bab09e[13] <= bab09e[ 5];      bab09e[14] <= bab09e[ 6];      bab09e[15] <= bab09e[ 7];   end
end
always@* begin uvf7ec2<={data_in>>1,ld7b613[0]};fpbf614<=ld7b613[1];vifb0a7<=ld7b613[2];vvd853b<=ld7b613[3];fnc29df<={zxc279b>>1,ld7b613[4]};pu14efe<=ld7b613[5];zma77f2<=ld7b613[6];ie3bf92<=ld7b613[7];psdfc90<={bn9bff7>>1,ld7b613[8]};hofe483<=ld7b613[9];mrf241b<=ld7b613[10];uk920dd<=ld7b613[11];end
always@* begin necf6c2[2047]<=kqdb40b;necf6c2[2046]<=psda058;necf6c2[2044]<=rg584f3;necf6c2[2040]<=zxc279b[0];necf6c2[2032]<=zz13cdf;necf6c2[2017]<=hd9e6ff;necf6c2[1987]<=thf37fe;necf6c2[1926]<=bn9bff7[0];necf6c2[1804]<=zkdffbf;necf6c2[1560]<=icffdfb;necf6c2[1072]<=psfefd8;necf6c2[1023]<=data_in[0];end         assign suff972 = necf6c2,ld7b613 = cme5c87;   initial begin   jcc030e = $fopen(".fred");   $fdisplay( jcc030e, "%3h\n%3h", (thc27c7 >> 4) & fnc7fe5, (thc27c7 >> (mt9f1ff+4)) & fnc7fe5 );   $fclose(jcc030e);   $readmemh(".fred", qg721c0);   end   always @ (suff972) begin   ym8700c = qg721c0[1];       for (vk1872=0; vk1872<qgdb09f; vk1872=vk1872+1) begin           cme5c87[vk1872] = suff972[ym8700c];       rv38061  = ^(ym8700c & qg721c0[0]);       ym8700c =  {ym8700c, rv38061};       end   end
endmodule