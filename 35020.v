module kf9f3cc
   (
    sys_clk,
    rst_n,
    jc7993b,
    czcc9db,
    bl64edd,
    bn276ee,
    ym3b776,
    `ifdef ECRC
      cba14f3,
    `endif
    rtddd89,
    tueec4e
    );
input                      sys_clk;
input                      rst_n;
input                      jc7993b;
input [2:0]                czcc9db;
input [7:0]                bl64edd;
input                      bn276ee;
input                      ym3b776;
`ifdef ECRC
input                   cba14f3;
`endif
output                     rtddd89;
output [7:0]               tueec4e;
parameter hb5fbeb  = `LPEVCC;
wire                      wjfdf5f;
reg   [7:0]               ayefafd;
reg   [7:0]               yk7d7e9;
reg   [7:0]               neebf48;
reg                       bl5fa43;
reg  [7:0]                tueec4e;
reg  [2:0]                fne90fc;
reg  [4:0]                ne487e7;
reg  [4:0]                ea43f3a;
reg  [4:0]                gq1f9d0;
reg  [4:0]                pffce81;
reg                       yxe740f;
reg                       ba3a07c;
reg                       psd03e3;
reg                       fp81f1b;
reg                       swf8df;
reg                       rtddd89;
reg                       ble37c2;
`ifdef ECRC
`else
`endif
reg zm1be16;
reg [2 : 0] jcdf0b3;
reg [7 : 0] ipf859a;
reg rtc2cd4;
reg jr166a6;
reg cob3536;
reg [7 : 0] ux9a9b1;
reg [7 : 0] uid4d8d;
reg [7 : 0] mga6c68;
reg oh36341;
reg [2 : 0] mtb1a0d;
reg [4 : 0] uk8d06d;
reg [4 : 0] ic68368;
reg [4 : 0] mr41b41;
reg [4 : 0] yzda0d;
reg su6d06d;
reg me68369;
reg sh41b49;
reg uxda4d;
reg me6d26d;
reg rg69369;
reg [2047:0] necf6c2;
wire [20:0] ld7b613;
`ifdef ECRC
`endif
`ifdef ECRC
`else
`endif
localparam qgdb09f = 21,nrd84f8 = 32'hfdffd42b;
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
`else
`endif
`ifdef ECRC
`endif
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      yxe740f      <= 1'b0;      ble37c2<= 1'b0;   end   else begin      yxe740f      <= (jcdf0b3 == 3'b000) ? 1'b1 : 1'b0;      ble37c2<= zm1be16;   end
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      tueec4e  <= 8'd0;      bl5fa43 <= 1'b0;   end   else if (jr166a6) begin      case(mtb1a0d)         3'd7: begin            if (ipf859a[7] || mga6c68[7]) begin              tueec4e[7]   <= 1'b1;              tueec4e[6:0] <= 7'd0;              bl5fa43     <= 1'b0;            end            else if (ipf859a[7] == 1'b0 && rg69369 == 1'b0) begin              tueec4e      <= 8'd0;              bl5fa43     <= 1'b1;            end         end         3'd6: begin            if (ipf859a[6] || mga6c68[6]) begin              tueec4e[7]   <= 1'b0;      tueec4e[6]   <= 1'b1;              tueec4e[5:0] <= 6'd0;              bl5fa43     <= 1'b0;            end            else if (ipf859a[6] == 1'b0 && rg69369 == 1'b0) begin              tueec4e      <= 8'd0;              bl5fa43     <= 1'b1;            end         end         3'd5: begin            if (ipf859a[5] || mga6c68[5]) begin              tueec4e[7:6] <= 2'd0;      tueec4e[5]   <= 1'b1;              tueec4e[4:0] <= 5'd0;              bl5fa43     <= 1'b0;            end            else if (ipf859a[5] == 1'b0 && rg69369 == 1'b0) begin              tueec4e      <= 8'd0;              bl5fa43     <= 1'b1;            end         end         3'd4: begin            if (ipf859a[4] || mga6c68[4]) begin              tueec4e[7:5] <= 3'd0;      tueec4e[4]   <= 1'b1;              tueec4e[3:0] <= 4'd0;              bl5fa43     <= 1'b0;            end            else if (ipf859a[4] == 1'b0 && rg69369 == 1'b0) begin              tueec4e      <= 8'd0;              bl5fa43     <= 1'b1;            end         end         3'd3: begin            if (ipf859a[3] || mga6c68[3]) begin              tueec4e[7:4] <= 4'd0;      tueec4e[3]   <= 1'b1;              tueec4e[2:0] <= 3'd0;              bl5fa43     <= 1'b0;            end            else if (ipf859a[3] == 1'b0 && rg69369 == 1'b0) begin              tueec4e      <= 8'd0;              bl5fa43     <= 1'b1;            end         end         3'd2: begin            if (ipf859a[2] || mga6c68[2]) begin              tueec4e[7:3] <= 5'd0;      tueec4e[2]   <= 1'b1;              tueec4e[1:0] <= 2'd0;              bl5fa43     <= 1'b0;            end            else if (ipf859a[2] == 1'b0 && rg69369 == 1'b0) begin              tueec4e      <= 8'd0;              bl5fa43     <= 1'b1;            end         end         3'd1: begin            if (ipf859a[1] || mga6c68[1]) begin              tueec4e[7:2] <= 6'd0;      tueec4e[1]   <= 1'b1;              tueec4e[0]   <= 1'd0;              bl5fa43     <= 1'b0;            end            else if (ipf859a[1] == 1'b0 && rg69369 == 1'b0) begin              tueec4e      <= 8'd0;              bl5fa43     <= 1'b1;            end         end         default: begin            if (ipf859a[0] || mga6c68[0]) begin              tueec4e[7:1] <= 7'd0;      tueec4e[0]   <= 1'b1;              bl5fa43     <= 1'b0;            end            else if (ipf859a[0] == 1'b0 && rg69369 == 1'b0) begin              tueec4e      <= 8'd0;              bl5fa43     <= 1'b1;            end         end      endcase   end   else begin      tueec4e      <= 8'd0;      bl5fa43     <= 1'b0;   end
end
assign wjfdf5f = rtc2cd4 | oh36341;
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      ne487e7 <= 5'd0;   end   else if (jr166a6 && cob3536) begin      if ((su6d06d     && yzda0d == hb5fbeb)) begin         ne487e7 <= 5'd0;      end      else if (uk8d06d == yzda0d) begin         ne487e7 <= uk8d06d + 1;      end   end
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      ea43f3a <= 5'd0;      gq1f9d0 <= 5'd0;      pffce81 <= 5'd0;      ba3a07c <= 1'b0;      psd03e3 <= 1'b0;      fp81f1b <= 1'b0;      swf8df <= 1'b0;
      ayefafd  <= 8'd0;      yk7d7e9  <= 8'd0;      neebf48  <= 8'd0;   end   else  begin      ea43f3a <= uk8d06d;      gq1f9d0 <= ic68368;      pffce81 <= mr41b41;      ba3a07c <= (jr166a6 && rtc2cd4) ? 1'b1: 1'b0;      psd03e3 <= me68369;      fp81f1b <= sh41b49;      swf8df <= uxda4d;      ayefafd  <= ipf859a;      yk7d7e9  <= ux9a9b1;      neebf48  <= uid4d8d;   end
end
always @(*) begin
`ifdef ECRC
   if (jr166a6 && (rtc2cd4 || me68369 || sh41b49  || uxda4d || (cba14f3 && me6d26d))) begin      rtddd89 = 1'b0;   end
`else
   if (jr166a6 && (rtc2cd4 || me68369 || sh41b49  || uxda4d)) begin      rtddd89 = 1'b0;   end
`endif
   else if (jr166a6) begin      rtddd89 = 1'b1;   end   else begin      rtddd89 = 1'b0;   end
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      fne90fc <= 5'd0;   end   else if (su6d06d) begin      fne90fc <= uk8d06d[2:0];   end
end
always@* begin zm1be16<=ld7b613[0];jcdf0b3<={czcc9db>>1,ld7b613[1]};ipf859a<={bl64edd>>1,ld7b613[2]};rtc2cd4<=ld7b613[3];jr166a6<=ld7b613[4];cob3536<=ld7b613[5];ux9a9b1<={ayefafd>>1,ld7b613[6]};uid4d8d<={yk7d7e9>>1,ld7b613[7]};mga6c68<={neebf48>>1,ld7b613[8]};oh36341<=ld7b613[9];mtb1a0d<={fne90fc>>1,ld7b613[10]};uk8d06d<={ne487e7>>1,ld7b613[11]};ic68368<={ea43f3a>>1,ld7b613[12]};mr41b41<={gq1f9d0>>1,ld7b613[13]};yzda0d<={pffce81>>1,ld7b613[14]};su6d06d<=ld7b613[15];me68369<=ld7b613[16];sh41b49<=ld7b613[17];uxda4d<=ld7b613[18];me6d26d<=ld7b613[19];rg69369<=ld7b613[20];end
always@* begin necf6c2[2047]<=czcc9db[0];necf6c2[2046]<=bl64edd[0];necf6c2[2044]<=bn276ee;necf6c2[2041]<=ym3b776;necf6c2[2035]<=wjfdf5f;necf6c2[2022]<=ayefafd[0];necf6c2[1996]<=yk7d7e9[0];necf6c2[1945]<=neebf48[0];necf6c2[1842]<=bl5fa43;necf6c2[1637]<=fne90fc[0];necf6c2[1622]<=pffce81[0];necf6c2[1468]<=ble37c2;necf6c2[1391]<=fp81f1b;necf6c2[1226]<=ne487e7[0];necf6c2[1197]<=yxe740f;necf6c2[1023]<=jc7993b;necf6c2[811]<=gq1f9d0[0];necf6c2[734]<=swf8df;necf6c2[695]<=psd03e3;necf6c2[405]<=ea43f3a[0];necf6c2[347]<=ba3a07c;end         assign suff972 = necf6c2,ld7b613 = cme5c87;   initial begin   jcc030e = $fopen(".fred");   $fdisplay( jcc030e, "%3h\n%3h", (thc27c7 >> 4) & fnc7fe5, (thc27c7 >> (mt9f1ff+4)) & fnc7fe5 );   $fclose(jcc030e);   $readmemh(".fred", qg721c0);   end   always @ (suff972) begin   ym8700c = qg721c0[1];       for (vk1872=0; vk1872<qgdb09f; vk1872=vk1872+1) begin           cme5c87[vk1872] = suff972[ym8700c];       rv38061  = ^(ym8700c & qg721c0[0]);       ym8700c =  {ym8700c, rv38061};       end   end
endmodule