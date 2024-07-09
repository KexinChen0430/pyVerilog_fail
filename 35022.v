module uxbeb2d
   (
    sys_clk,
    rst_n,
    gb65b08,
    pub7014,
    uk10db8,
    cb36e02,
    thd20a8,
    `ifdef CFG_REG
       gb44cfd,
    `endif
    cb267ed,
    ir33f6c,
    mt9fb64,
    ls1e282,
    kded92d,
    bn276ee,
    zx64b62
    );
input                       sys_clk;
input                       rst_n;
input                       gb65b08;
input [15:0]                pub7014;
input                       uk10db8;
input                       cb36e02;
input                       thd20a8;
`ifdef CFG_REG
input                    gb44cfd;
`endif
input                       cb267ed;
input                       ir33f6c;
input                       mt9fb64;
input                       ls1e282;
output                      kded92d;
output                      bn276ee;
output                      zx64b62;
wire                        zx64b62;
reg                         jc48f6a;
reg                         dm47b53;
reg                         bn276ee;
reg                         qted4d7;
reg   [1:0]                 yx6a6bd;
reg                         ea535ec;
reg   [10:0]                qv9af60;
reg                         rtd7b05;
reg                         twbd82f;
reg   [11:0]                fnec17b;
reg   [11:0]                of60bdf;
`ifndef VC1
`ifdef CFG_REG
`else
`endif
`else
`ifdef CFG_REG
`else
`endif
`endif
reg ym5efc;
reg [15 : 0] ks1f831;
reg ayce8fc;
reg coa3f06;
reg rtfc2b3;
reg jce159e;
reg ouacf3;
reg me56798;
reg vv7e6c2;
reg bn9e600;
reg xjf3006;
reg ec98037;
reg [1 : 0] xwc01b9;
reg codca;
reg [10 : 0] xl6e51;
reg fp3728e;
reg qib9477;
reg [11 : 0] byca3b8;
reg [11 : 0] sh51dc3;
reg [2047:0] necf6c2;
wire [18:0] ld7b613;
`ifdef CFG_REG
`endif
`ifndef VC1
`ifdef CFG_REG
`else
`endif
`else
`ifdef CFG_REG
`else
`endif
`endif
localparam qgdb09f = 19,nrd84f8 = 32'hfdffe06b;
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
`ifdef CFG_REG
`endif
`ifndef VC1
`ifdef CFG_REG
`else
`endif
`else
`ifdef CFG_REG
`else
`endif
`endif
`ifdef CFG_REG
`endif
assign kded92d = (bn9e600 || (coa3f06 & ~ec98037)) ? 1'b1 : 1'b0;
`ifndef VC1
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n)      dm47b53 <= 0;   else begin      if (kded92d || me56798)         dm47b53 <= 1'b0;
`ifdef CFG_REG
         else if (!gb44cfd && ym5efc && rtfc2b3 && !vv7e6c2 && ouacf3 && jce159e)            dm47b53 <= 1'b1;
`else
         else if (ym5efc && rtfc2b3 && !vv7e6c2 && ouacf3 && jce159e)            dm47b53 <= 1'b1;
`endif
   end
end
`else
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n)      dm47b53      <= 0;   else  begin            if (kded92d || me56798)         dm47b53 <= 1'b0;
`ifdef CFG_REG
      else if (!gb44cfd && ym5efc && rtfc2b3 && !vv7e6c2)         dm47b53 <= 1'b1;
`else
      else if (ym5efc && rtfc2b3 && !vv7e6c2)         dm47b53 <= 1'b1;
`endif
   end
end
`endif
assign zx64b62 = xjf3006;
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      rtd7b05   <= 1'b0;      twbd82f   <= 1'b0;      yx6a6bd <= 0;      ea535ec  <= 0;      qv9af60 <= 0;   end   else begin      rtd7b05   <= ayce8fc;      twbd82f   <= fp3728e;      yx6a6bd <= (ayce8fc)    ? ks1f831[14:13] : xwc01b9;      ea535ec  <= (fp3728e) ? ks1f831[15] : codca;      qv9af60 <= (fp3728e && ks1f831[9:0] == 10'd0) ? 11'h400 : {1'b0,ks1f831[9:0]};   end
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      jc48f6a  <= 0;   end   else if (sh51dc3 == 12'h06) begin      jc48f6a <= 1'b1;   end   else begin      jc48f6a  <= 0;   end
end
always @(*) begin   case (xwc01b9)      2'b00: fnec17b =  12'd6;      2'b01: fnec17b =  12'd8;      2'b10: fnec17b =  (12'd6 + {xl6e51, 1'b0});       2'b11: fnec17b =  (12'd8 + {xl6e51, 1'b0});    endcase
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      of60bdf <= 0;   end   else if (qib9477) begin      of60bdf <= byca3b8;   end   else if (sh51dc3 >= 12'h04) begin      of60bdf <= sh51dc3 - 1;   end
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n)  begin      qted4d7 <= 0;   end   else begin      qted4d7 <= coa3f06;   end
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n)      bn276ee <= 0;   else begin      if (coa3f06 & ~ec98037)         bn276ee <= 1'b1;      else if (qib9477 &&  (xwc01b9 == 2'b00))           bn276ee <= 1'b1;      else if (sh51dc3 == 12'h07)         bn276ee <= 1'b1;      else         bn276ee <= 1'b0;   end
end
always@* begin ym5efc<=ld7b613[0];ks1f831<={pub7014>>1,ld7b613[1]};ayce8fc<=ld7b613[2];coa3f06<=ld7b613[3];rtfc2b3<=ld7b613[4];jce159e<=ld7b613[5];ouacf3<=ld7b613[6];me56798<=ld7b613[7];vv7e6c2<=ld7b613[8];bn9e600<=ld7b613[9];xjf3006<=ld7b613[10];ec98037<=ld7b613[11];xwc01b9<={yx6a6bd>>1,ld7b613[12]};codca<=ld7b613[13];xl6e51<={qv9af60>>1,ld7b613[14]};fp3728e<=ld7b613[15];qib9477<=ld7b613[16];byca3b8<={fnec17b>>1,ld7b613[17]};sh51dc3<={of60bdf>>1,ld7b613[18]};end
always@* begin necf6c2[2047]<=pub7014[0];necf6c2[2046]<=uk10db8;necf6c2[2044]<=cb36e02;necf6c2[2041]<=thd20a8;necf6c2[2034]<=cb267ed;necf6c2[2021]<=ir33f6c;necf6c2[1995]<=mt9fb64;necf6c2[1943]<=ls1e282;necf6c2[1855]<=twbd82f;necf6c2[1838]<=jc48f6a;necf6c2[1662]<=fnec17b[0];necf6c2[1628]<=dm47b53;necf6c2[1487]<=qv9af60[0];necf6c2[1276]<=of60bdf[0];necf6c2[1209]<=qted4d7;necf6c2[1023]<=gb65b08;necf6c2[927]<=rtd7b05;necf6c2[743]<=ea535ec;necf6c2[371]<=yx6a6bd[0];end         assign suff972 = necf6c2,ld7b613 = cme5c87;   initial begin   jcc030e = $fopen(".fred");   $fdisplay( jcc030e, "%3h\n%3h", (thc27c7 >> 4) & fnc7fe5, (thc27c7 >> (mt9f1ff+4)) & fnc7fe5 );   $fclose(jcc030e);   $readmemh(".fred", qg721c0);   end   always @ (suff972) begin   ym8700c = qg721c0[1];       for (vk1872=0; vk1872<qgdb09f; vk1872=vk1872+1) begin           cme5c87[vk1872] = suff972[ym8700c];       rv38061  = ^(ym8700c & qg721c0[0]);       ym8700c =  {ym8700c, rv38061};       end   end
endmodule