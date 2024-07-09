module an95059
   (
    sys_clk,
    rst_n,
    bab35c,
    qg59ae3,
    bn276ee,
    `ifdef ECRC
      cba14f3,
    `endif
    cm5c637,
    jpe31b9
    );
input                      sys_clk;
input                      rst_n;
input  [7:0]               bab35c;
input                      qg59ae3;
input                      bn276ee;
`ifdef ECRC
input                   cba14f3;
`endif
output                     cm5c637;
output [7:0]               jpe31b9;
reg   [7:0]               jpe31b9;
reg                       cm5c637;
reg                       ho479a7;
reg                       gd3cd3a;
reg                       fne69d5;
reg                       ie34eaf;
reg    [1:0]              pua7579;
parameter hq3abca = 2'd0;
parameter hod5e52  = 2'd1;
`ifdef ECRC
`else
`endif
reg [7 : 0] phaf292;
reg lq79496;
reg rtc2cd4;
reg jc52593;
reg co92c9a;
reg do964d1;
reg hqb268a;
reg [1 : 0] hq93453;
reg [2047:0] necf6c2;
wire [7:0] ld7b613;
`ifdef ECRC
`endif
`ifdef ECRC
`else
`endif
localparam qgdb09f = 8,nrd84f8 = 32'hfdffe0cb;
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
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      jpe31b9 <= 8'd0;      pua7579    <= hq3abca;   end   else begin      case(hq93453)         hq3abca:            if (lq79496) begin               casex(phaf292)                  8'b1xxx_xxxx: begin                     jpe31b9 <= 8'b1000_0000;                     pua7579    <= hod5e52;                  end                  8'bx1xx_xxxx: begin                     jpe31b9 <= 8'b0100_0000;                     pua7579    <= hod5e52;                  end                  8'bxx1x_xxxx: begin                     jpe31b9 <= 8'b0010_0000;                     pua7579    <= hod5e52;                  end                  8'bxxx1_xxxx: begin                     jpe31b9 <= 8'b0001_0000;                     pua7579    <= hod5e52;                  end                  8'bxxxx_1xxx: begin                     jpe31b9 <= 8'b0000_1000;                     pua7579    <= hod5e52;                  end                  8'bxxxx_x1xx: begin                     jpe31b9 <= 8'b0000_0100;                     pua7579    <= hod5e52;                  end                  8'bxxxx_xx1x: begin                     jpe31b9 <= 8'b0000_0010;                     pua7579    <= hod5e52;                  end                  8'bxxxx_xxx1: begin                     jpe31b9 <= 8'b0000_0001;                     pua7579    <= hod5e52;                  end                  default: begin                     jpe31b9 <= 8'b0000_0000;                     pua7579    <= hq3abca;                  end               endcase            end            else begin               jpe31b9 <= 8'd0;               pua7579    <= hq3abca;            end         hod5e52: begin            if (rtc2cd4) begin               pua7579    <= hq3abca;               jpe31b9 <= 8'd0;            end            else begin               pua7579    <= hod5e52;            end         end         default: begin            pua7579    <= hq3abca;         end      endcase   end
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      ho479a7 <= 1'b0;      gd3cd3a <= 1'b0;      fne69d5 <= 1'b0;      ie34eaf <= 1'b0;   end   else begin      ho479a7 <= rtc2cd4;      gd3cd3a <= jc52593;      fne69d5 <= co92c9a;      ie34eaf <= do964d1;   end
end
always @(*) begin
`ifdef ECRC
   if (lq79496 && (rtc2cd4 || jc52593 || co92c9a || do964d1 || (cba14f3 && hqb268a))) begin      cm5c637 = 1'b0;   end
`else
   if (lq79496 && (rtc2cd4 || jc52593 || co92c9a || do964d1)) begin      cm5c637 = 1'b0;   end
`endif
   else if (lq79496) begin      cm5c637 = 1'b1;   end   else begin      cm5c637 = 1'b0;   end
end
always@* begin phaf292<={bab35c>>1,ld7b613[0]};lq79496<=ld7b613[1];rtc2cd4<=ld7b613[2];jc52593<=ld7b613[3];co92c9a<=ld7b613[4];do964d1<=ld7b613[5];hqb268a<=ld7b613[6];hq93453<={pua7579>>1,ld7b613[7]};end
always@* begin necf6c2[2047]<=qg59ae3;necf6c2[2046]<=bn276ee;necf6c2[2044]<=ho479a7;necf6c2[2040]<=gd3cd3a;necf6c2[2033]<=fne69d5;necf6c2[2018]<=ie34eaf;necf6c2[1988]<=pua7579[0];necf6c2[1023]<=bab35c[0];end         assign suff972 = necf6c2,ld7b613 = cme5c87;   initial begin   jcc030e = $fopen(".fred");   $fdisplay( jcc030e, "%3h\n%3h", (thc27c7 >> 4) & fnc7fe5, (thc27c7 >> (mt9f1ff+4)) & fnc7fe5 );   $fclose(jcc030e);   $readmemh(".fred", qg721c0);   end   always @ (suff972) begin   ym8700c = qg721c0[1];       for (vk1872=0; vk1872<qgdb09f; vk1872=vk1872+1) begin           cme5c87[vk1872] = suff972[ym8700c];       rv38061  = ^(ym8700c & qg721c0[0]);       ym8700c =  {ym8700c, rv38061};       end   end
endmodule