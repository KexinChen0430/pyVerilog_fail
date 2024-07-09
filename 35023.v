module enf2ed0
   (
    sys_clk,
    rst_n,
    jc7993b,
    czcc9db,
    gb65b08,
    bn276ee,
    kded92d,
    `ifdef ECRC
      cba14f3,
    `endif
    cb267ed,
    ir33f6c
    );
input                       sys_clk;
input                       rst_n;
input                       jc7993b;
input  [2:0]                czcc9db;
input  [`NUM_VC-1:0]        gb65b08;
input                       bn276ee;
input                       kded92d;
`ifdef ECRC
input                    cba14f3;
`endif
output                      cb267ed;
output [`NUM_VC-1:0]        ir33f6c;
wire   [7:0]                rva53a7;
wire                        cm5c637;
wire   [7:0]                jpe31b9;
wire                        rtddd89;
wire   [7:0]                tueec4e;
reg    [7:0]                bab35c;
reg    [7:0]                bl64edd;
reg    [1:0]                bye4ed7;
reg                         qg59ae3;
reg                         ym3b776;
integer                     rgdaeb1,zxd758b;
`define   EVCC   `NUM_VC-1
parameter dbbac5e= 2'd0;
parameter czd62f6 = 2'd1;
parameter hq3abca = 2'd2;
parameter hb5fbeb  = `LPEVCC;
`ifdef ECRC
`endif
`ifdef ECRC
`endif
reg zm1be16;
reg [2 : 0] jcdf0b3;
reg [`NUM_VC - 1 : 0] ym5efc;
reg rtc2cd4;
reg qv26bac;
reg [7 : 0] tw35d65;
reg anaeb2b;
reg [7 : 0] al7595d;
reg coacaed;
reg [7 : 0] mr65768;
reg [1 : 0] mg2bb45;
reg lq79496;
reg jr166a6;
reg [2047:0] necf6c2;
wire [12:0] ld7b613;
`ifdef ECRC
`endif
`define   EVCC   `NUM_VC-1
`ifdef ECRC
`endif
`ifdef ECRC
`endif
localparam qgdb09f = 13,nrd84f8 = 32'hfdfff10b;
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
`define   EVCC   `NUM_VC-1
`ifdef ECRC
`endif
`ifdef ECRC
`endif
`ifdef ECRC
`endif
`define   EVCC   `NUM_VC-1
always @(ym5efc) begin      if (hb5fbeb == 3'b000) begin      for (rgdaeb1 = 7; rgdaeb1 >= 0; rgdaeb1=rgdaeb1-1) begin         if (rgdaeb1 <= `EVCC) begin            bab35c[rgdaeb1] = ym5efc[rgdaeb1];         end         else begin            bab35c[rgdaeb1] = 1'b0;         end      end   end      else if (`EVCC == hb5fbeb) begin      bab35c   = 0;   end      else begin      for (rgdaeb1 = 7; rgdaeb1 >= 0; rgdaeb1=rgdaeb1-1) begin         if (rgdaeb1 <= `EVCC && rgdaeb1 > (hb5fbeb)) begin            bab35c[rgdaeb1] = ym5efc[rgdaeb1];         end         else begin            bab35c[rgdaeb1] = 1'b0;         end      end   end
end
always @(ym5efc) begin      if (hb5fbeb == `EVCC) begin      for (zxd758b = 7; zxd758b >= 0; zxd758b = zxd758b -1) begin         if (zxd758b <= hb5fbeb) begin            bl64edd[zxd758b] = ym5efc[zxd758b];         end         else begin            bl64edd[zxd758b] = 1'b0;         end      end   end      else if (hb5fbeb == 3'b000) begin      bl64edd   = 0;   end      else begin      for (zxd758b = 7; zxd758b >= 0; zxd758b = zxd758b -1) begin         if (zxd758b <= hb5fbeb) begin            bl64edd[zxd758b] = ym5efc[zxd758b];         end         else begin            bl64edd[zxd758b] = 1'b0;         end      end   end
end
generate   if (hb5fbeb != `EVCC) begin      an95059 jpf625c      (              .sys_clk        (sys_clk),       .rst_n          (rst_n),       .bab35c      (bab35c),       .qg59ae3     (lq79496),       .bn276ee   (rtc2cd4),
`ifdef ECRC
         .cba14f3     (cba14f3),
`endif
              .cm5c637   (cm5c637),       .jpe31b9   (jpe31b9)       );   end   else begin      assign cm5c637 = 0;      assign jpe31b9 = 0;   end
endgenerate
generate   if (hb5fbeb != 0) begin      kf9f3cc tw1bb02         (                    .sys_clk       (sys_clk),          .rst_n         (rst_n),          .jc7993b  (zm1be16),          .czcc9db  (jcdf0b3),          .bl64edd     (bl64edd),          .bn276ee  (rtc2cd4),
`ifdef ECRC
            .cba14f3    (cba14f3),
`endif
          .ym3b776    (jr166a6),                    .rtddd89  (rtddd89),          .tueec4e  (tueec4e)          );   end   else begin      assign rtddd89 = 0;      assign tueec4e = 0;   end
endgenerate
assign rva53a7  = al7595d | mr65768;
assign cb267ed  = anaeb2b | coacaed;
assign ir33f6c      = tw35d65[`NUM_VC-1:0];
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      bye4ed7  <= dbbac5e;      qg59ae3 <= 1'b0;      ym3b776 <= 1'b0;   end   else begin      case(mg2bb45)         dbbac5e: begin            case ({|bab35c,|bl64edd})               2'b10,2'b11: begin                  qg59ae3 <= 1'b1;                  ym3b776 <= 1'b0;                  bye4ed7  <= hq3abca;               end               2'b01: begin                  qg59ae3 <= 1'b0;                  ym3b776 <= 1'b1;                  bye4ed7  <= czd62f6;               end               default: begin                  qg59ae3 <= 1'b0;                  ym3b776 <= 1'b0;                  bye4ed7  <= dbbac5e;               end            endcase         end         czd62f6: begin            if (qv26bac) begin               case ({|bab35c,|bl64edd})                  2'b10,2'b11: begin                     qg59ae3 <= 1'b1;                     ym3b776 <= 1'b0;                     bye4ed7  <= dbbac5e;                  end                  2'b01: begin                     qg59ae3 <= 1'b0;                     ym3b776 <= 1'b1;                     bye4ed7  <= czd62f6;                  end                  default: begin                     qg59ae3 <= 1'b0;                     ym3b776 <= 1'b1;                     bye4ed7  <= dbbac5e;                  end               endcase            end            else begin                  bye4ed7  <= czd62f6;            end         end         hq3abca: begin            if (qv26bac) begin               case ({|bab35c,|bl64edd})                  2'b10,2'b11: begin                     qg59ae3 <= 1'b1;                     ym3b776 <= 1'b0;                     bye4ed7  <= dbbac5e;                  end                  2'b01: begin                     qg59ae3 <= 1'b1;                     ym3b776 <= 1'b0;                     bye4ed7  <= dbbac5e;                  end                  default: begin                     qg59ae3 <= 1'b1;                     ym3b776 <= 1'b0;                     bye4ed7  <= dbbac5e;                  end               endcase            end            else begin                  bye4ed7  <= hq3abca;            end         end         default: begin            bye4ed7  <= dbbac5e;         end      endcase   end
end
always@* begin zm1be16<=ld7b613[0];jcdf0b3<={czcc9db>>1,ld7b613[1]};ym5efc<={gb65b08>>1,ld7b613[2]};rtc2cd4<=ld7b613[3];qv26bac<=ld7b613[4];tw35d65<={rva53a7>>1,ld7b613[5]};anaeb2b<=ld7b613[6];al7595d<={jpe31b9>>1,ld7b613[7]};coacaed<=ld7b613[8];mr65768<={tueec4e>>1,ld7b613[9]};mg2bb45<={bye4ed7>>1,ld7b613[10]};lq79496<=ld7b613[11];jr166a6<=ld7b613[12];end
always@* begin necf6c2[2047]<=czcc9db[0];necf6c2[2046]<=gb65b08[0];necf6c2[2044]<=bn276ee;necf6c2[2040]<=kded92d;necf6c2[2032]<=rva53a7[0];necf6c2[2016]<=cm5c637;necf6c2[1985]<=jpe31b9[0];necf6c2[1923]<=rtddd89;necf6c2[1799]<=tueec4e[0];necf6c2[1551]<=bye4ed7[0];necf6c2[1054]<=qg59ae3;necf6c2[1023]<=jc7993b;necf6c2[60]<=ym3b776;end         assign suff972 = necf6c2,ld7b613 = cme5c87;   initial begin   jcc030e = $fopen(".fred");   $fdisplay( jcc030e, "%3h\n%3h", (thc27c7 >> 4) & fnc7fe5, (thc27c7 >> (mt9f1ff+4)) & fnc7fe5 );   $fclose(jcc030e);   $readmemh(".fred", qg721c0);   end   always @ (suff972) begin   ym8700c = qg721c0[1];       for (vk1872=0; vk1872<qgdb09f; vk1872=vk1872+1) begin           cme5c87[vk1872] = suff972[ym8700c];       rv38061  = ^(ym8700c & qg721c0[0]);       ym8700c =  {ym8700c, rv38061};       end   end
endmodule