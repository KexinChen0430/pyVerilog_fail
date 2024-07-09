module phaadd0 (
   input wire         sys_clk ,
   input wire         rst_n ,
   input wire [31:0]  gof0cd8 ,
   input wire         zm866c1 ,
   output reg [22:0]  ie872fa ,
   output reg [1:0]   sj397d1 ,
   output reg         qgcbe8c ,
   output reg         fn5f460 ,
   output reg         ayfa306 ,
   output reg [23:0]  rxdp_vsd_data ,
   output reg         fc8c188,
   output reg [2:0]   rxdp_pmd_type ,
   output reg         xl6214         ) ;
reg                    gq310a7 ;
reg                    uk88538 ;
reg                    jc429c0 ;
reg                    vk14e02 ;
reg                    vka7012 ;
reg [31 : 0] oh26901;
reg co3480d;
reg ir24b2;
reg sj12595;
reg wy92cac;
reg hq96561;
reg [2047:0] necf6c2;
wire [5:0] ld7b613;
localparam qgdb09f = 6,nrd84f8 = 32'hfdffe0cb;
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
always @* begin   if (co3480d) begin      casex (oh26901[31:24])                  8'b0010_0000 ,         8'b0010_0001 ,         8'b0010_0011 ,         8'b0010_0100 : begin            gq310a7       = 1'b1 ;            uk88538  = 1'b0 ;            jc429c0  = 1'b0 ;            vk14e02    = 1'b0 ;            vka7012      = 1'b0 ;         end                  8'b0011_0000 : begin            gq310a7       = 1'b0 ;            uk88538  = 1'b0 ;            jc429c0  = 1'b0 ;            vk14e02    = 1'b0 ;            vka7012      = 1'b1 ;         end                  8'b0100_0xxx ,         8'b0101_0xxx ,         8'b0110_0xxx : begin            gq310a7       = 1'b0 ;            uk88538  = 1'b1 ;            jc429c0  = 1'b0 ;            vk14e02    = 1'b0 ;            vka7012      = 1'b0 ;         end                  8'b1100_0xxx ,         8'b1101_0xxx ,         8'b1110_0xxx : begin            gq310a7       = 1'b0 ;            uk88538  = 1'b0 ;            jc429c0  = 1'b1 ;            vk14e02    = 1'b0 ;            vka7012      = 1'b0 ;         end                  8'b1000_0xxx ,         8'b1001_0xxx ,         8'b1010_0xxx : begin            gq310a7       = 1'b0 ;            uk88538  = 1'b0 ;            jc429c0  = 1'b0 ;            vk14e02    = 1'b1 ;            vka7012      = 1'b0 ;         end         default      : begin            gq310a7       = 1'b0 ;            uk88538  = 1'b0 ;            jc429c0  = 1'b0 ;            vk14e02    = 1'b0 ;            vka7012      = 1'b0 ;         end     endcase   end   else begin      gq310a7       = 1'b0 ;      uk88538  = 1'b0 ;      jc429c0  = 1'b0 ;      vk14e02    = 1'b0 ;      vka7012      = 1'b0 ;   end
end
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n)      ie872fa <= 23'h0_0000 ;   else      ie872fa <=  {oh26901[26:24], oh26901[21:14], oh26901[11:0]} ;
end
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n)      sj397d1 <= 2'b00 ;   else      sj397d1 <=  oh26901[29:28] ;
end
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n)      rxdp_pmd_type <= 3'b000 ;   else      rxdp_pmd_type <= oh26901[26:24] ;
end
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n)      rxdp_vsd_data <= 23'b000 ;   else      rxdp_vsd_data <= oh26901[23:0] ;
end
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n)      qgcbe8c  <= 1'b0 ;   else if (ir24b2)      qgcbe8c  <= 1'b1 ;   else      qgcbe8c  <= 1'b0 ;
end
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n)      fn5f460  <= 1'b0 ;   else if (sj12595)      fn5f460  <= 1'b1 ;   else      fn5f460  <= 1'b0 ;
end
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n)      ayfa306  <= 1'b0 ;   else if (wy92cac)      ayfa306  <= 1'b1 ;   else      ayfa306  <= 1'b0 ;
end
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n)      xl6214  <= 1'b0 ;   else if (gq310a7)      xl6214  <= 1'b1 ;   else      xl6214  <= 1'b0 ;
end
always @(posedge sys_clk, negedge rst_n) begin   if (!rst_n)      fc8c188  <= 1'b0 ;   else if (hq96561)      fc8c188  <= 1'b1 ;   else      fc8c188  <= 1'b0 ;
end
always@* begin oh26901<={gof0cd8>>1,ld7b613[0]};co3480d<=ld7b613[1];ir24b2<=ld7b613[2];sj12595<=ld7b613[3];wy92cac<=ld7b613[4];hq96561<=ld7b613[5];end
always@* begin necf6c2[2047]<=zm866c1;necf6c2[2046]<=uk88538;necf6c2[2044]<=jc429c0;necf6c2[2040]<=vk14e02;necf6c2[2033]<=vka7012;necf6c2[1023]<=gof0cd8[0];end         assign suff972 = necf6c2,ld7b613 = cme5c87;   initial begin   jcc030e = $fopen(".fred");   $fdisplay( jcc030e, "%3h\n%3h", (thc27c7 >> 4) & fnc7fe5, (thc27c7 >> (mt9f1ff+4)) & fnc7fe5 );   $fclose(jcc030e);   $readmemh(".fred", qg721c0);   end   always @ (suff972) begin   ym8700c = qg721c0[1];       for (vk1872=0; vk1872<qgdb09f; vk1872=vk1872+1) begin           cme5c87[vk1872] = suff972[ym8700c];       rv38061  = ^(ym8700c & qg721c0[0]);       ym8700c =  {ym8700c, rv38061};       end   end
endmodule