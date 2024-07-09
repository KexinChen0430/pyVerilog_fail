module fnc2d94 (
   input wire        rv16ca6 ,
   input wire        qgffeda ,
   input wire        rst_n ,
   input wire        hd94dca ,
   input wire [21:0] data_in ,
   output reg [10:0] dmd02c2        );
reg [1:0]         swb958f;
reg [1:0]         rgcac78;
reg               kq563c2;
wire [10:0]       mtb1e10;
wire [10:0]       wl8f085;
reg               cm7842d  ;
reg               vvc2168  ;
reg               qi10b47  ;
integer           ir85a38 ;
integer           tj2d1c5 ;
reg [10:0] ui68e2f[0:3] ;
reg [10:0] zk47178[0:3] ;
reg zz38bc3;
reg [21 : 0] uvf7ec2;
reg [1 : 0] xy2f0fb;
reg ww787da;
reg [10 : 0] yxc3ed0;
reg [10 : 0] ks1f684;
reg psfb420;
reg xwda103;
reg psd081a;
reg [2047:0] necf6c2;
wire [8:0] ld7b613;
localparam qgdb09f = 9,nrd84f8 = 32'hfdffd42b;
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
always @(posedge qgffeda, negedge rst_n) begin   if (!rst_n) begin      cm7842d <= 1'b0;      vvc2168 <= 1'b0;   end   else begin      cm7842d <= zz38bc3;      vvc2168 <= psfb420;   end
end
always @(posedge rv16ca6, negedge rst_n) begin   if (!rst_n) begin      qi10b47 <= 1'b0;   end   else begin      qi10b47 <= zz38bc3;   end
end
always @(posedge rv16ca6, negedge rst_n) begin   if (!rst_n)      swb958f <= 2'b00;   else if (psd081a)      swb958f <= swb958f + 2'd1;
end
always @(posedge qgffeda, negedge rst_n) begin   if (!rst_n)      kq563c2 <= 1'b0;   else if (!xwda103)      kq563c2 <= 1'b0;   else      kq563c2 <= ~ww787da;
end
always @(posedge qgffeda, negedge rst_n) begin   if (!rst_n)      rgcac78 <= 2'b10;   else if (ww787da && xwda103)      rgcac78 <= xy2f0fb + 2'd1;
end
always @(posedge qgffeda, negedge rst_n) begin   if (!rst_n) begin      dmd02c2[9:0] <= 10'd0;      dmd02c2[10]  <= 1'b1;   end   else begin      dmd02c2[9:0] <= ww787da ? yxc3ed0[9:0] : ks1f684[9:0];      dmd02c2[10]  <= xwda103 ? (ww787da ? yxc3ed0[10] : ks1f684[10]) : 1'b1 ;   end
end
always @(posedge rv16ca6, negedge rst_n) begin   if (!rst_n)      for (ir85a38=0;ir85a38<=3;ir85a38=ir85a38+1)         ui68e2f[ir85a38] <= 11'd0;   else      ui68e2f[swb958f] <= uvf7ec2[10:0] ;
end
assign mtb1e10 = ui68e2f[xy2f0fb] ;
always @(posedge rv16ca6, negedge rst_n) begin   if (!rst_n)      for (tj2d1c5=0;tj2d1c5<=3;tj2d1c5=tj2d1c5+1)         zk47178[tj2d1c5] <= 11'd0;   else      zk47178[swb958f] <= uvf7ec2[21:11] ;
end
assign wl8f085 = zk47178[xy2f0fb] ;
always@* begin zz38bc3<=ld7b613[0];uvf7ec2<={data_in>>1,ld7b613[1]};xy2f0fb<={rgcac78>>1,ld7b613[2]};ww787da<=ld7b613[3];yxc3ed0<={mtb1e10>>1,ld7b613[4]};ks1f684<={wl8f085>>1,ld7b613[5]};psfb420<=ld7b613[6];xwda103<=ld7b613[7];psd081a<=ld7b613[8];end
always@* begin necf6c2[2047]<=data_in[0];necf6c2[2046]<=rgcac78[0];necf6c2[2044]<=kq563c2;necf6c2[2041]<=mtb1e10[0];necf6c2[2035]<=wl8f085[0];necf6c2[2022]<=cm7842d;necf6c2[1996]<=vvc2168;necf6c2[1945]<=qi10b47;necf6c2[1023]<=hd94dca;end         assign suff972 = necf6c2,ld7b613 = cme5c87;   initial begin   jcc030e = $fopen(".fred");   $fdisplay( jcc030e, "%3h\n%3h", (thc27c7 >> 4) & fnc7fe5, (thc27c7 >> (mt9f1ff+4)) & fnc7fe5 );   $fclose(jcc030e);   $readmemh(".fred", qg721c0);   end   always @ (suff972) begin   ym8700c = qg721c0[1];       for (vk1872=0; vk1872<qgdb09f; vk1872=vk1872+1) begin           cme5c87[vk1872] = suff972[ym8700c];       rv38061  = ^(ym8700c & qg721c0[0]);       ym8700c =  {ym8700c, rv38061};       end   end
endmodule