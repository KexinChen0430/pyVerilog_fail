module gq9284a
   (
    sys_clk,
    rst_n,
    czcc9db,
    ld4a3ee,
    uv51f77,
    oh8fbbc,
    `ifdef CFG_REG
       gb44cfd,
       zkeef21,
       qg7790b,
    `endif
    `ifdef ECRC
      cba14f3,
    `endif
    gb65b08,
    pub7014,
    uk10db8,
    ng86dc0,
    cb36e02,
    thd20a8,
    ba250d2,
    ls1e282,
    en5b0c9,
    cbab5b9,
    `ifdef CFG_REG
       enc3267,
    `endif
    ux28d2,
    fc14694,
    twb80a3,
    zkc051a,
    zx64b62,
    goefa4f,
    xwd08ab,
    nt8455a,
    db22ad6,
    sw156b7,
    by791cf,
    nrc8e7a,
    jc473d7,
    an39ebb
    );
`ifdef LW1
parameter LANE_WIDTH = 1 ;
`else
`ifdef LW2
parameter LANE_WIDTH = 2 ;
`else
`ifdef LW4
parameter LANE_WIDTH = 4 ;
`else
parameter LANE_WIDTH = 1 ;
`endif
`endif
`endif
parameter D_WIDTH = 16 ;
parameter K27_7 = 8'hFB ;
parameter K28_0 = 8'h1C ;
parameter K28_2 = 8'h5C ;
parameter K28_3 = 8'h7C ;
parameter K28_5 = 8'hBC ;
parameter K29_7 = 8'hFD ;
parameter K30_7 = 8'hFE ;
parameter K23_7 = 8'hF7 ;
parameter K28_1 = 8'h3C ;
parameter D5_2  = 8'h45 ;
parameter D10_2 = 8'h4A ;
parameter D21_5 = 8'hB5 ;
parameter D26_5 = 8'hBA ;
parameter COM = K28_5 ;
parameter STP = K27_7 ;
parameter SDP = K28_2 ;
parameter END = K29_7 ;
parameter EDB = K30_7 ;
parameter SKP = K28_0 ;
parameter IDL = K28_3 ;
parameter PAD = K23_7 ;
parameter FTS = K28_1 ;
parameter OS_WIDTH      = 4 ;
parameter OS_T1_LIP_LAP = 4'd0 ;
parameter OS_T2_LIP_LAP = 4'd1 ;
parameter OS_COMPLI     = 4'd2 ;
parameter OS_T1         = 4'd3 ;
parameter OS_T2         = 4'd4 ;
parameter OS_IDLE       = 4'd5 ;
parameter OS_EIDLE      = 4'd6 ;
parameter OS_NFTS       = 4'd7 ;
parameter OS_BEACON     = 4'd8 ;
parameter DSM_WIDTH    = 2 ;
parameter PSM_WIDTH    = 2 ;
parameter RSM_WIDTH    = 2 ;
parameter L0SM_WIDTH   = 2 ;
parameter L0sTSM_WIDTH = 2 ;
parameter L0sRSM_WIDTH = 2 ;
parameter L1SM_WIDTH   = 1 ;
parameter L2SM_WIDTH   = 1 ;
parameter DISM_WIDTH   = 2 ;
parameter LBSM_WIDTH   = 2 ;
parameter HRSM_WIDTH   = 1 ;
parameter CFGSM_WIDTH  = 2 ;
parameter MSM_WIDTH    = 3 ;
parameter DETECT    = 4'd0 ;
parameter POLLING   = 4'd1 ;
parameter CONFIG    = 4'd2 ;
parameter L0        = 4'd3 ;
parameter L0s       = 4'd4 ;
parameter L1        = 4'd5 ;
parameter L2        = 4'd6 ;
parameter RECOVERY  = 4'd7 ;
parameter LOOPBACK  = 4'd8 ;
parameter HOTRST    = 4'd9 ;
parameter DISABLED  = 4'd10 ;
`ifdef VC1
parameter FADDR = 3 ;
`else
`ifdef VC2
parameter FADDR = 3 ;
`else
`ifdef VC3
parameter FADDR = 5 ;
`else
`ifdef VC4
parameter FADDR = 5 ;
`else
parameter FADDR = 6 ;
`endif
`endif
`endif
`endif
input                       sys_clk;
input                       rst_n;
input  [2:0]                czcc9db;
input                       ld4a3ee;
input                       uv51f77;
input                       oh8fbbc;
`ifdef CFG_REG
input                    gb44cfd;
input                    zkeef21;
input [15:0]             qg7790b;
`endif
`ifdef ECRC
input                    cba14f3;
`endif
input [`NUM_VC-1:0]         gb65b08;
input [(`NUM_VC*16)-1:0]    pub7014;
input [`NUM_VC-1:0]         uk10db8;
input [`NUM_VC-1:0]         ng86dc0;
input [`NUM_VC-1:0]         cb36e02;
input                       thd20a8;
input [FADDR:0]             ba250d2;
input [`NUM_VC -1:0]        ls1e282 ;
output                      en5b0c9;
output                      cbab5b9;
`ifdef CFG_REG
output                   enc3267;
`endif
output                      ux28d2;
output                      fc14694;
output                      twb80a3;
output                      zkc051a;
output[`NUM_VC-1:0]         zx64b62;
output                      goefa4f;
output [15:0]               xwd08ab;
output                      nt8455a;
output                      db22ad6;
output                      sw156b7;
output                      an39ebb;
output                      by791cf;
output                      nrc8e7a;
output                      jc473d7;
parameter nt16cf3 = 2'd0;
parameter mgb679f  = 2'd1;
parameter ukb3cf9    = 2'd2;
parameter fp9e7c8    = 2'd3;
wire   [`NUM_VC-1:0]        bn276ee;
wire   [`NUM_VC-1:0]        ir33f6c;
wire   [`NUM_VC-1:0]        kded92d;
wire                        cb267ed;
`ifndef VC1
wire                        kq46d37;
`endif
wire                        ep369b8;
wire                        gdb4dc4;
wire                        yma6e25;
reg    [`NUM_VC-1:0]        hd37129;
reg    [`NUM_VC-1:0]        hqb894f;
reg                         goefa4f;
reg    [15:0]               xwd08ab;
reg                         nt8455a;
reg                         db22ad6;
reg                         sw156b7;
reg                         jc7993b;
`ifdef CFG_REG
reg                         cmcb9fd;
reg                         enc3267;
reg    [1:0]                she7f40;
reg                         je3fa05;
reg    [3:0]                yxfd02a;
wire                        ofe8154;
wire                        jp40aa5;
wire                        ym552f;
wire                        ls2a978;
`endif
reg   [FADDR+2:0]           nta5e1c;
reg                         mt9fb64;
reg   [1:0]                 ay78732;
reg                         en5b0c9;
reg                         cbab5b9;
reg                         jpe6426;
reg                         nt32136;
reg                         ux28d2;
reg                         fc14694;
reg                         twb80a3;
reg                         zkc051a;
reg                         an39ebb;
reg                         by791cf;
reg                         nrc8e7a;
reg                         jc473d7;
reg                         nrec46f;
`ifndef VC1
`ifdef ECRC
`endif
`else
`endif
`ifdef CFG_REG
`endif
`ifdef EN_VC0
`endif
`ifdef EN_VC1
`endif
`ifdef EN_VC2
`endif
`ifdef EN_VC3
`endif
`ifdef EN_VC4
`endif
`ifdef EN_VC5
`endif
`ifdef EN_VC6
`endif
`ifdef EN_VC7
`endif
`ifdef CFG_REG
`else
`endif
`ifdef CFG_REG
`ifdef CFG_REG
parameter  yk6237f  = 2'd0;
parameter  ba11bf8    = 2'd1;
parameter  qi8dfc2   = 2'd2;
parameter  ip6fe11   = 2'd3;
`endif
`ifdef ECRC
`else
`endif
`endif
`ifdef CFG_REG
`endif
`ifdef CFG_REG
`endif
`ifdef ECRC
`else
`endif
reg [2 : 0] jcdf0b3;
reg alf846d;
reg fnc236c;
reg tw11b67;
reg [`NUM_VC - 1 : 0] ym5efc;
reg [(`NUM_VC * 16) - 1 : 0] ks1f831;
reg [`NUM_VC - 1 : 0] ayce8fc;
reg [`NUM_VC - 1 : 0] hb747e0;
reg [`NUM_VC - 1 : 0] coa3f06;
reg rtfc2b3;
reg [FADDR : 0] gdbe052;
reg [`NUM_VC - 1 : 0] vv7e6c2;
reg [`NUM_VC - 1 : 0] rtc2cd4;
reg [`NUM_VC - 1 : 0] ouacf3;
reg [`NUM_VC - 1 : 0] qv26bac;
reg jce159e;
reg tj197f1;
reg mecbf8f;
reg zx5fc78;
reg [`NUM_VC - 1 : 0] jcfe3c7;
reg [`NUM_VC - 1 : 0] byf1e3b;
reg zm1be16;
reg [FADDR + 2 : 0] jpc76e9;
reg me56798;
reg [1 : 0] qgdba79;
reg rtdd3c9;
reg zxe9e4f;
reg pf4f27e;
reg [2047:0] necf6c2;
wire [27:0] ld7b613;
`ifdef LW1
`else
`ifdef LW2
`else
`ifdef LW4
`else
`endif
`endif
`endif
`ifdef VC1
`else
`ifdef VC2
`else
`ifdef VC3
`else
`ifdef VC4
`else
`endif
`endif
`endif
`endif
`ifdef CFG_REG
`endif
`ifdef ECRC
`endif
`ifdef CFG_REG
`endif
`ifndef VC1
`endif
`ifdef CFG_REG
`endif
`ifndef VC1
`ifdef ECRC
`endif
`else
`endif
`ifdef CFG_REG
`endif
`ifdef EN_VC0
`endif
`ifdef EN_VC1
`endif
`ifdef EN_VC2
`endif
`ifdef EN_VC3
`endif
`ifdef EN_VC4
`endif
`ifdef EN_VC5
`endif
`ifdef EN_VC6
`endif
`ifdef EN_VC7
`endif
`ifdef CFG_REG
`else
`endif
`ifdef CFG_REG
`ifdef CFG_REG
`endif
`ifdef ECRC
`else
`endif
`endif
`ifdef CFG_REG
`endif
`ifdef CFG_REG
`endif
`ifdef ECRC
`else
`endif
localparam qgdb09f = 28,nrd84f8 = 32'hfdfff02b;
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
`ifdef LW1
`else
`ifdef LW2
`else
`ifdef LW4
`else
`endif
`endif
`endif
`ifdef VC1
`else
`ifdef VC2
`else
`ifdef VC3
`else
`ifdef VC4
`else
`endif
`endif
`endif
`endif
`ifdef CFG_REG
`endif
`ifdef ECRC
`endif
`ifdef CFG_REG
`endif
`ifndef VC1
`endif
`ifdef CFG_REG
`endif
`ifndef VC1
`ifdef ECRC
`endif
`else
`endif
`ifdef CFG_REG
`endif
`ifdef EN_VC0
`endif
`ifdef EN_VC1
`endif
`ifdef EN_VC2
`endif
`ifdef EN_VC3
`endif
`ifdef EN_VC4
`endif
`ifdef EN_VC5
`endif
`ifdef EN_VC6
`endif
`ifdef EN_VC7
`endif
`ifdef CFG_REG
`else
`endif
`ifdef CFG_REG
`ifdef CFG_REG
`endif
`ifdef ECRC
`else
`endif
`endif
`ifdef CFG_REG
`endif
`ifdef CFG_REG
`endif
`ifdef ECRC
`else
`endif
`ifdef LW1
`else
`ifdef LW2
`else
`ifdef LW4
`else
`endif
`endif
`endif
`ifdef VC1
`else
`ifdef VC2
`else
`ifdef VC3
`else
`ifdef VC4
`else
`endif
`endif
`endif
`endif
`ifdef CFG_REG
`endif
`ifdef ECRC
`endif
`ifdef CFG_REG
`endif
`ifndef VC1
`endif
`ifdef CFG_REG
`endif
`ifndef VC1
assign kq46d37 = ((|hb747e0) | (|coa3f06));
enf2ed0 dm57e90   (        .sys_clk         (sys_clk),    .rst_n           (rst_n),    .jc7993b    (zm1be16),    .czcc9db    (jcdf0b3),    .gb65b08          (ym5efc),    .bn276ee    (|rtc2cd4),
`ifdef ECRC
      .cba14f3      (cba14f3),
`endif
    .kded92d (|qv26bac),
        .cb267ed (cb267ed),    .ir33f6c     (ir33f6c)    );
`else
assign cb267ed = 1'b1;
assign ir33f6c     = 'd1;
`endif
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n)  begin      hd37129 <= 0;      hqb894f <= 0;   end   else if (jce159e) begin      hd37129 <= ouacf3;      hqb894f <= jcfe3c7;   end
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n)  begin      xwd08ab <= 0;      nt8455a   <= 0;      db22ad6  <= 0;      sw156b7 <= 0;   end
`ifdef CFG_REG
   else if (cmcb9fd) begin      xwd08ab <= qg7790b;      nt8455a   <= je3fa05;      db22ad6  <= an39ebb;      sw156b7 <= 1'b0;   end
`endif
   else begin      case(1'b1)
`ifdef EN_VC0
            byf1e3b[0]: begin               xwd08ab <= ks1f831[15:0];               nt8455a   <= ayce8fc[0];               db22ad6  <= (coa3f06[0] & hb747e0[0]) ? 1'b0 : hb747e0[0];               sw156b7 <= coa3f06[0];            end
`endif
`ifdef EN_VC1
            byf1e3b[1]: begin               xwd08ab <= ks1f831[2*16-1:16];               nt8455a   <= ayce8fc[1];               db22ad6  <= (coa3f06[1] & hb747e0[1]) ? 1'b0 : hb747e0[1];               sw156b7 <= coa3f06[1];            end
`endif
`ifdef EN_VC2
            byf1e3b[2]: begin               xwd08ab <= ks1f831[3*16-1:2*16];               nt8455a   <= ayce8fc[2];               db22ad6  <= (coa3f06[2] & hb747e0[2]) ? 1'b0 : hb747e0[2];               sw156b7 <= coa3f06[2];            end
`endif
`ifdef EN_VC3
            byf1e3b[3]: begin               xwd08ab <= ks1f831[4*16-1:3*16];               nt8455a   <= ayce8fc[3];               db22ad6  <= (coa3f06[3] & hb747e0[3]) ? 1'b0 : hb747e0[3];               sw156b7 <= coa3f06[3];            end
`endif
`ifdef EN_VC4
            byf1e3b[4]: begin               xwd08ab <= ks1f831[5*16-1:4*16];               nt8455a   <= ayce8fc[4];               db22ad6  <= (coa3f06[4] & hb747e0[4]) ? 1'b0 : hb747e0[4];               sw156b7 <= coa3f06[4];            end
`endif
`ifdef EN_VC5
            byf1e3b[5]: begin               xwd08ab <= ks1f831[6*16-1:5*16];               nt8455a   <= ayce8fc[5];               db22ad6  <= (coa3f06[5] & hb747e0[5]) ? 1'b0 : hb747e0[5];               sw156b7 <= coa3f06[5];            end
`endif
`ifdef EN_VC6
            byf1e3b[6]: begin               xwd08ab <= ks1f831[7*16-1:6*16];               nt8455a   <= ayce8fc[6];               db22ad6  <= (coa3f06[6] & hb747e0[6]) ? 1'b0 : hb747e0[6];               sw156b7 <= coa3f06[6];            end
`endif
`ifdef EN_VC7
            byf1e3b[7]: begin               xwd08ab <= ks1f831[8*16-1:7*16];               nt8455a   <= ayce8fc[7];               db22ad6  <= (coa3f06[7] & hb747e0[7]) ? 1'b0 : hb747e0[7];               sw156b7 <= coa3f06[7];            end
`endif
         default :  begin            nt8455a   <= 1'b0;            db22ad6  <= 1'b0;            sw156b7 <= 1'b0;         end      endcase   end
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n)  begin      goefa4f <= 0;   end   else if (zm1be16 == 1'b0) begin
`ifdef CFG_REG
      goefa4f <= (|ym5efc | gb44cfd);
`else
      goefa4f <= |ym5efc;
`endif
   end
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n)  begin      jc7993b <= 0;   end   else if (|ayce8fc) begin      jc7993b <= 1'b1;   end   else if (|rtc2cd4) begin      jc7993b <= 1'b0;   end
end
`ifdef CFG_REG
assign yma6e25 = (qg7790b[1:0] != 2'b00) ? 1'b1 : 1'b0;
assign ep369b8   = (qg7790b[14:13] != 2'b01) ? 1'b1 : 1'b0;
assign gdb4dc4   = (qg7790b[14:13] == 2'b11) ? 1'b1 : 1'b0;
`ifdef CFG_REG
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      she7f40        <= yk6237f;      cmcb9fd  <= 1'b0;      enc3267     <= 1'b0;      je3fa05     <= 1'b0;      an39ebb    <= 1'b0;      by791cf  <= 1'b0;      nrc8e7a <= 1'b0;      jc473d7   <= 1'b0;      nrec46f       <= 1'b0;   end   else begin      cmcb9fd  <= 1'b0;      enc3267     <= 1'b0;      je3fa05     <= 1'b0;      an39ebb    <= 1'b0;      by791cf  <= 1'b0;      nrc8e7a <= 1'b0;      jc473d7   <= 1'b0;      nrec46f       <= 1'b0;      case(she7f40)         yk6237f: begin            if (gb44cfd && rtfc2b3 && !zkeef21 && |zx64b62 == 1'b0 && me56798 == 1'b0) begin               enc3267  <= 1'b1;               she7f40     <= ba11bf8;               nrec46f    <= 1'b1;              end            else begin               she7f40     <= yk6237f;            end         end         ba11bf8: begin            cmcb9fd  <= 1'b1;            enc3267     <= 1'b1;            je3fa05     <= 1'b1;            she7f40        <= qi8dfc2;         end         qi8dfc2: begin            if (jp40aa5 == 1'b1) begin               an39ebb    <= 1'b1;               cmcb9fd  <= 1'b1;               she7f40        <= ip6fe11;               nrc8e7a <= !alf846d;                  jc473d7   <= alf846d;                end            else begin               cmcb9fd  <= 1'b1;               enc3267     <= 1'b1;               she7f40        <= qi8dfc2;            end                                                if((yxfd02a == 4'd4) && alf846d && fnc236c) begin                by791cf  <= zx5fc78;              end         end         ip6fe11: begin            if (ym552f == 1'b1) begin               she7f40        <= yk6237f;            end            else begin               she7f40        <= ip6fe11;            end         end         default: begin            she7f40     <= yk6237f;         end      endcase   end
end
assign ls2a978 = (she7f40  != yk6237f) ? 1'b1 : 1'b0;
`endif
assign ofe8154 = qg7790b[14];
assign jp40aa5 = (yxfd02a == 4'd1 && she7f40 == qi8dfc2) ? 1'b1 : 1'b0;
assign ym552f  = (yxfd02a == 4'd1 && she7f40 == ip6fe11) ? 1'b1 : 1'b0;
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      yxfd02a <= 0;   end   else if (je3fa05) begin            case({alf846d, fnc236c})         2'b00,         2'b01 : begin                         yxfd02a <= (ofe8154 == 1'b0) ? 4'd4 : 4'd6;         end         2'b10 : begin                                     if(tw11b67)                if(mecbf8f)                  yxfd02a <= 4'd8;               else                  yxfd02a <= 4'd6;            else                 yxfd02a <= 4'd6;         end         2'b11 : begin                         yxfd02a <= 4'd6;         end      endcase   end      else if (an39ebb) begin
`ifdef ECRC
      yxfd02a <= (cba14f3) ? 4'd4 : 4'd2;
`else
      yxfd02a <= 4'd2;
`endif
   end   else if (yxfd02a != 0) begin      yxfd02a <= yxfd02a - 1;   end
end
`endif
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      twb80a3       <= 1'b0;      zkc051a       <= 1'b0;      ux28d2     <= 1'b0;      fc14694     <= 1'b0;   end
`ifdef CFG_REG
   else begin      twb80a3       <= 1'b0;      zkc051a       <= 1'b0;      ux28d2     <= 1'b0;      fc14694     <= 1'b0;      if(pf4f27e) begin         if(alf846d) begin             twb80a3     <= 1'b1;            if(!fnc236c && tw11b67)                zkc051a     <= 1'b1;         end      end      else if (!alf846d && je3fa05) begin             ux28d2     <= 1'b1;            fc14694     <= qg7790b[14];      end   end
`endif
end
uxbeb2d an1d1bd [`NUM_VC-1:0]   (        .sys_clk            (sys_clk),    .rst_n              (rst_n),    .gb65b08             (ym5efc),    .pub7014            (ks1f831),    .uk10db8              (ayce8fc),    .cb36e02            (coa3f06),    .thd20a8           (rtfc2b3),
`ifdef CFG_REG
       .gb44cfd    (gb44cfd | ls2a978),
`endif
    .cb267ed    (jce159e),    .ir33f6c        (ouacf3),    .mt9fb64       (me56798),    .ls1e282         (vv7e6c2),        .kded92d    (kded92d),    .bn276ee       (bn276ee),    .zx64b62             (zx64b62)    );
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n)  begin      ay78732         <= nt16cf3;      nta5e1c        <= 0;      mt9fb64     <= 0;      en5b0c9 <= 0;   end   else begin      en5b0c9 <= 1'b0;      case(qgdba79)         nt16cf3: begin            if (|zx64b62 && |qv26bac) begin               ay78732         <= mgb679f;
`ifdef ECRC
               nta5e1c        <= (cba14f3) ? {gdbe052,2'b00} + 3'd4 :  {gdbe052,2'b00} + 2'd2;
`else
               nta5e1c        <= {gdbe052,2'b00} + 2'd2;
`endif
               mt9fb64     <= 1'b1;               en5b0c9 <= 1'b1;            end            else if (|zx64b62 == 1'b0 && |ym5efc == 1'b0 && gdbe052 != 0) begin               ay78732         <= mgb679f;               nta5e1c        <= {gdbe052,2'b00};               mt9fb64     <= 1'b1;               en5b0c9 <= 1'b1;            end            else begin               ay78732         <= nt16cf3;               mt9fb64     <= 1'b0;            end         end         mgb679f: begin            if (jpc76e9 == 0) begin               ay78732         <= ukb3cf9;               mt9fb64     <= 1'b0;            end            else begin               ay78732         <= mgb679f;               nta5e1c        <= jpc76e9 - 1'd1;               mt9fb64     <= 1'b1;            end         end                  ukb3cf9: begin            ay78732         <= fp9e7c8;         end         fp9e7c8: begin            ay78732         <= nt16cf3;         end         default: begin            ay78732         <= nt16cf3;         end      endcase   end
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n)  begin      jpe6426 <= 0;      nt32136 <= 0;      cbab5b9  <= 0;   end   else begin      jpe6426 <= (rtfc2b3 == 1'b0 && |zx64b62 == 1'b0) ? 1'b1 : 1'b0;      nt32136 <= rtdd3c9;      cbab5b9  <= rtdd3c9 & ~zxe9e4f & (|zx64b62 == 1'b0);   end
end
always@* begin jcdf0b3<={czcc9db>>1,ld7b613[0]};alf846d<=ld7b613[1];fnc236c<=ld7b613[2];tw11b67<=ld7b613[3];ym5efc<={gb65b08>>1,ld7b613[4]};ks1f831<={pub7014>>1,ld7b613[5]};ayce8fc<={uk10db8>>1,ld7b613[6]};hb747e0<={ng86dc0>>1,ld7b613[7]};coa3f06<={cb36e02>>1,ld7b613[8]};rtfc2b3<=ld7b613[9];gdbe052<={ba250d2>>1,ld7b613[10]};vv7e6c2<={ls1e282>>1,ld7b613[11]};rtc2cd4<={bn276ee>>1,ld7b613[12]};ouacf3<={ir33f6c>>1,ld7b613[13]};qv26bac<={kded92d>>1,ld7b613[14]};jce159e<=ld7b613[15];tj197f1<=ld7b613[16];mecbf8f<=ld7b613[17];zx5fc78<=ld7b613[18];jcfe3c7<={hd37129>>1,ld7b613[19]};byf1e3b<={hqb894f>>1,ld7b613[20]};zm1be16<=ld7b613[21];jpc76e9<={nta5e1c>>1,ld7b613[22]};me56798<=ld7b613[23];qgdba79<={ay78732>>1,ld7b613[24]};rtdd3c9<=ld7b613[25];zxe9e4f<=ld7b613[26];pf4f27e<=ld7b613[27];end
always@* begin necf6c2[2047]<=ld4a3ee;necf6c2[2046]<=uv51f77;necf6c2[2044]<=oh8fbbc;necf6c2[2041]<=gb65b08[0];necf6c2[2035]<=pub7014[0];necf6c2[2022]<=uk10db8[0];necf6c2[1996]<=ng86dc0[0];necf6c2[1945]<=cb36e02[0];necf6c2[1843]<=thd20a8;necf6c2[1746]<=yma6e25;necf6c2[1685]<=jc7993b;necf6c2[1645]<=kded92d[0];necf6c2[1638]<=ba250d2[0];necf6c2[1445]<=hd37129[0];necf6c2[1369]<=nrec46f;necf6c2[1322]<=nta5e1c[0];necf6c2[1242]<=cb267ed;necf6c2[1229]<=ls1e282[0];necf6c2[1195]<=ay78732[0];necf6c2[1023]<=czcc9db[0];necf6c2[873]<=gdb4dc4;necf6c2[842]<=hqb894f[0];necf6c2[822]<=ir33f6c[0];necf6c2[684]<=nt32136;necf6c2[597]<=mt9fb64;necf6c2[436]<=ep369b8;necf6c2[411]<=bn276ee[0];necf6c2[342]<=jpe6426;end         assign suff972 = necf6c2,ld7b613 = cme5c87;   initial begin   jcc030e = $fopen(".fred");   $fdisplay( jcc030e, "%3h\n%3h", (thc27c7 >> 4) & fnc7fe5, (thc27c7 >> (mt9f1ff+4)) & fnc7fe5 );   $fclose(jcc030e);   $readmemh(".fred", qg721c0);   end   always @ (suff972) begin   ym8700c = qg721c0[1];       for (vk1872=0; vk1872<qgdb09f; vk1872=vk1872+1) begin           cme5c87[vk1872] = suff972[ym8700c];       rv38061  = ^(ym8700c & qg721c0[0]);       ym8700c =  {ym8700c, rv38061};       end   end
endmodule