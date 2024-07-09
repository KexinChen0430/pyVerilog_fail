module wl12806
   (
    sys_clk,
    rst_n,
    gq31bc6,
    ym8de31,
    uv6f189,
    yk78c4c,
    shc6261,
    sw3130d,
    ng89868,
    ic4c343,
    ohd0c6,
    me68634,
    qgef2ad,
    ep18d09,
    uvc684c,
    zx55a12,
    gda1320,
    ea4c82f,
    rt64179,
    ba20bcf,
    ym5e7a,
    pu2f3d1,
    lq79e8a,
    rgcf453,
    qt7a29b,
    ead14dd,
    ux8a6e9,
    me5374d,
    db9ba68,
    rtdd347,
    zxe9a3f,
    ne4d1fe,
    ea68ff2,
    by47f90,
    je3fc82,
    xwfe412,
    kdf2093,
    gd9049d
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
localparam ui562ba           = 3'd0 ;
localparam ohb15d0  = 3'd1 ;
localparam ir8ae84 = 3'd2 ;
localparam rg57424  = 3'd3 ;
localparam rvba122   = 3'd4 ;
localparam ned0917       = 3'd5 ;
localparam lf848ba           = 3'd6 ;
localparam ou245d7           = 3'd7 ;
input                     sys_clk;
input                     rst_n;
input   [MSM_WIDTH:0]     gq31bc6;
input   [LANE_WIDTH-1:0]  ym8de31;
input                     uv6f189;
input                     yk78c4c;
input   [LANE_WIDTH-1:0]  shc6261;
input                     sw3130d;
input                     ng89868;
input                     ic4c343;
input   [LANE_WIDTH-1:0]  ea4c82f;
input   [LANE_WIDTH-1:0]  rt64179;
input   [LANE_WIDTH-1:0]  ohd0c6;
input   [LANE_WIDTH-1:0]  me68634;
input   [LANE_WIDTH-1:0]  qgef2ad;
input   [LANE_WIDTH-1:0]  ep18d09;
input   [LANE_WIDTH-1:0]  uvc684c;
input   [LANE_WIDTH-1:0]  zx55a12;
input   [LANE_WIDTH-1:0]  gda1320;
input   [LANE_WIDTH-1:0]  ba20bcf;
input   [LANE_WIDTH-1:0]  ym5e7a;
input   [LANE_WIDTH-1:0]  pu2f3d1;
input   [LANE_WIDTH-1:0]  lq79e8a;
output                    rgcf453;
output                    qt7a29b;
output                    ead14dd;
output  [LANE_WIDTH-1:0]  ux8a6e9;
output                    me5374d;
output  [LANE_WIDTH-1:0]  db9ba68;
output  [OS_WIDTH -1:0]   rtdd347;
output  [LANE_WIDTH-1:0]  zxe9a3f;
output  [LANE_WIDTH-1:0]  ne4d1fe;
output                    ea68ff2;
output                    by47f90;
output                    je3fc82;
output                    xwfe412;
output  [LANE_WIDTH-1:0]  kdf2093;
output  [CFGSM_WIDTH:0]   gd9049d;
wire [LANE_WIDTH-1:0]   ipd6214;
wire [LANE_WIDTH-1:0]   fc115ba;
wire [LANE_WIDTH-1:0]   xy14902;
wire [LANE_WIDTH-1:0]   lfba70b;
wire [LANE_WIDTH-1:0]   ie24094;
wire [LANE_WIDTH-1:0]   ngbf5b;
wire [LANE_WIDTH-1:0]   kdedf52;
wire [LANE_WIDTH-1:0]   an250b;
wire [LANE_WIDTH-1:0]   ic7d4a5;
wire [LANE_WIDTH-1:0]   dm52940;
wire [LANE_WIDTH-1:0]   lfa501e;
wire [LANE_WIDTH-1:0]   fn407bf;
reg                     ead14dd;
reg                     me5374d;
reg  [CFGSM_WIDTH:0]    gd9049d;
reg  [LANE_WIDTH-1:0]   db9ba68;
reg  [OS_WIDTH -1:0]    rtdd347;
reg  [LANE_WIDTH-1:0]   zxe9a3f;
reg  [LANE_WIDTH-1:0]   ne4d1fe;
reg                     ea68ff2;
reg                     by47f90;
reg                     je3fc82;
reg                     xwfe412;
reg  [LANE_WIDTH-1:0]   kdf2093;
reg                     ykce1d9;
`ifdef LW4
reg  [3:0]              uv70ec9;
reg  [3:0]              gq8764d;
`endif
`ifdef LW2
reg  [1:0]              uv70ec9;
reg  [1:0]              gq8764d;
`endif
`ifdef LW1
reg                     uv70ec9;
reg                     gq8764d;
`endif
reg  [LANE_WIDTH-1:0]   kq49b53;
reg  [LANE_WIDTH-1:0]   ux8a6e9;
reg                     rgcf453;
reg                     qt7a29b;
reg                     zm99660;
reg                     iccb303;
reg                     ui59819;
`ifdef LW4
`endif
`ifdef LW2
`endif
`ifdef LW1
`endif
`ifdef LW4
`endif
`ifdef LW2
`endif
`ifdef LW1
`endif
parameter shcc0c8= {(LANE_WIDTH){1'b1}};
parameter bn3225   = {(LANE_WIDTH){1'b0}};
`ifdef LW4
`else
`endif
`ifdef LW4
`endif
`ifdef LW2
`endif
`ifdef LW1
`endif
`ifdef LW4
`endif
`ifdef LW2
`endif
`ifdef LW1
`endif
reg [MSM_WIDTH : 0] en44bff;
reg [LANE_WIDTH - 1 : 0] ba2ffea;
reg ip7ff53;
reg osffa9c;
reg [LANE_WIDTH - 1 : 0] uiea704;
reg yk53820;
reg xy9c101;
reg sue080b;
reg [LANE_WIDTH - 1 : 0] lsb09a;
reg [LANE_WIDTH - 1 : 0] pfc269b;
reg [LANE_WIDTH - 1 : 0] gd2cdbf;
reg [LANE_WIDTH - 1 : 0] hd9bfa4;
reg [LANE_WIDTH - 1 : 0] dmfe93b;
reg [LANE_WIDTH - 1 : 0] pfe38b6;
reg [LANE_WIDTH - 1 : 0] aa3b4e6;
reg [LANE_WIDTH - 1 : 0] xje62aa;
reg [LANE_WIDTH - 1 : 0] oh8aab0;
reg [LANE_WIDTH - 1 : 0] fpaac27;
reg [LANE_WIDTH - 1 : 0] dbb09f8;
reg [LANE_WIDTH - 1 : 0] fp27e3f;
reg [LANE_WIDTH - 1 : 0] czf8ffb;
reg [LANE_WIDTH - 1 : 0] tw3feee;
reg [LANE_WIDTH - 1 : 0] pff3fb5;
reg [LANE_WIDTH - 1 : 0] xwee456;
reg [LANE_WIDTH - 1 : 0] ntb5d56;
reg [LANE_WIDTH - 1 : 0] zz91591;
reg [LANE_WIDTH - 1 : 0] ay56f67;
reg [LANE_WIDTH - 1 : 0] fp3d11;
reg [LANE_WIDTH - 1 : 0] ay5647c;
reg [LANE_WIDTH - 1 : 0] hof4473;
reg [LANE_WIDTH - 1 : 0] pu11cd2;
reg [LANE_WIDTH - 1 : 0] rg73497;
reg [LANE_WIDTH - 1 : 0] rtd25dc;
reg ohbb988;
reg [LANE_WIDTH - 1 : 0] hbe6224;
reg uk31126;
reg co88930;
reg al44981;
reg [2047:0] necf6c2;
wire [37:0] ld7b613;
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
`ifdef LW4
`endif
`ifdef LW2
`endif
`ifdef LW1
`endif
`ifdef LW4
`endif
`ifdef LW2
`endif
`ifdef LW1
`endif
`ifdef LW4
`endif
`ifdef LW2
`endif
`ifdef LW1
`endif
`ifdef LW4
`else
`endif
`ifdef LW4
`endif
`ifdef LW2
`endif
`ifdef LW1
`endif
`ifdef LW4
`endif
`ifdef LW2
`endif
`ifdef LW1
`endif
localparam qgdb09f = 38,nrd84f8 = 32'hfdffd48b;
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
`ifdef LW4
`endif
`ifdef LW2
`endif
`ifdef LW1
`endif
`ifdef LW4
`endif
`ifdef LW2
`endif
`ifdef LW1
`endif
`ifdef LW4
`endif
`ifdef LW2
`endif
`ifdef LW1
`endif
`ifdef LW4
`else
`endif
`ifdef LW4
`endif
`ifdef LW2
`endif
`ifdef LW1
`endif
`ifdef LW4
`endif
`ifdef LW2
`endif
`ifdef LW1
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
`ifdef LW4
`endif
`ifdef LW2
`endif
`ifdef LW1
`endif
assign ipd6214     = xje62aa & ba2ffea;
assign fc115ba  = gd2cdbf & ba2ffea;
assign xy14902 = dmfe93b & ba2ffea;
assign lfba70b  = pfe38b6 & ba2ffea;
assign ie24094   = hd9bfa4 & ba2ffea;
assign kdedf52  = aa3b4e6 & kdf2093;
assign ic7d4a5= czf8ffb & kdf2093;
assign dm52940       = fpaac27 & kdf2093;
assign an250b    = oh8aab0 & kdf2093;
assign lfa501e  = fp27e3f & kdf2093;
assign fn407bf      = dbb09f8 & kdf2093;
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      gq8764d <= 0;      uv70ec9  <= 0;   end   else if (gd9049d == ir8ae84 || gd9049d == rvba122) begin
`ifdef LW4
      gq8764d <= hbe6224[3] + hbe6224[2] + hbe6224[1] + hbe6224[0];
`endif
`ifdef LW2
      gq8764d <= hbe6224[1] + hbe6224[0];
`endif
`ifdef LW1
      gq8764d <= hbe6224[0];
`endif
`ifdef LW4
            case(hbe6224)         4'b0111, 4'b1011 : begin            uv70ec9 <= 4'b0011;         end         4'b1101, 4'b1110 : begin            uv70ec9 <= 4'b1100;         end         default: begin            uv70ec9 <= 4'b0000;         end      endcase
`endif
`ifdef LW2
                  uv70ec9 <= hbe6224;
`endif
`ifdef LW1
                  uv70ec9 <= hbe6224;
`endif
   end   else begin      gq8764d <= 0;      uv70ec9  <= 0;   end
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      gd9049d      <= ui562ba;      db9ba68     <= {(LANE_WIDTH){1'b0}};      rtdd347 <= OS_IDLE;      zxe9a3f   <= bn3225;      ne4d1fe   <= bn3225;      kdf2093      <= {(LANE_WIDTH){1'b0}};      me5374d  <= 1'b0;      ykce1d9   <= 1'b0;      je3fc82    <= 1'b0;      ea68ff2    <= 1'b0;      by47f90    <= 1'b0;      xwfe412     <= 1'b0;      ux8a6e9   <= {(LANE_WIDTH){1'b0}};      kq49b53   <= {(LANE_WIDTH){1'b0}};      ead14dd  <= 1'b0;      rgcf453   <= 0;      qt7a29b<= 0;      zm99660          <= 1'b0;      iccb303       <= 1'b0;      ui59819      <= 1'b0;   end   else begin      je3fc82    <= 1'b0;      ea68ff2    <= 1'b0;      by47f90    <= 1'b0;      xwfe412     <= 1'b0;      me5374d  <= 1'b0;      ead14dd  <= 1'b0;      qt7a29b<= 0;      zm99660          <= 1'b0;      iccb303       <= 1'b0;      ui59819      <= 1'b0;      case(gd9049d)                                    ui562ba: begin            rgcf453     <= 0;            if (en44bff == CONFIG) begin               gd9049d     <= ohb15d0;               db9ba68    <= ba2ffea;               rtdd347<= OS_T1;               zxe9a3f  <= shcc0c8;               ne4d1fe  <= bn3225;               me5374d <= 1'b1;               ux8a6e9  <= ~ba2ffea;            end            else begin               gd9049d     <= ui562ba;               ux8a6e9  <= 0;            end         end                  ohb15d0: begin                        kq49b53      <= 0;            ykce1d9      <= 1'b0;            if (osffa9c && ~me5374d) begin               gd9049d      <= ou245d7;               je3fc82    <= 1'b1;               db9ba68     <= {(LANE_WIDTH){1'b0}};            end            else if ((|uiea704 == 1'b1 || tw3feee == ba2ffea) && ~me5374d) begin               gd9049d      <= ou245d7;               ea68ff2    <= 1'b1;               db9ba68     <= {(LANE_WIDTH){1'b0}};            end            else if (|pff3fb5 == 1'b1 && ~me5374d) begin               gd9049d      <= ir8ae84;               db9ba68     <= ba2ffea;               rtdd347 <= OS_T1;               zxe9a3f   <= shcc0c8;               ne4d1fe   <= shcc0c8;               me5374d  <= 1'b1;            end            else if (yk53820 && ~me5374d) begin               gd9049d      <= ou245d7;               by47f90    <= 1'b1;               db9ba68     <= {(LANE_WIDTH){1'b0}};            end            else begin               gd9049d      <= ohb15d0;            end         end                  ir8ae84: begin                    if (|gd2cdbf && ~me5374d) begin       if (gd2cdbf == ba2ffea | sue080b) begin
`ifdef LW4
                     if(pff3fb5 == 4'b1111)                              kq49b53  <= 4'b1111;                     else if(pff3fb5[3] == 1'b1)                         kq49b53  <= 4'b1000;
`else
                  kq49b53  <= pff3fb5;
`endif
                  zm99660         <= 1'b1;               end            end            iccb303  <= uk31126;            ui59819 <= co88930;
`ifdef LW4
            case(gq8764d)               4'd4: begin                  zxe9a3f  <= {(LANE_WIDTH){1'b1}};                  ne4d1fe  <= {(LANE_WIDTH){1'b1}};                  kdf2093     <= {(LANE_WIDTH){1'b1}};                  ykce1d9  <= 1'b1;               end               4'd1,4'd2: begin                  zxe9a3f  <= hbe6224;                  ne4d1fe  <= hbe6224;                  kdf2093     <= hbe6224;                  ykce1d9  <= 1'b1;               end               4'd3: begin                  zxe9a3f  <= uv70ec9;                  ne4d1fe  <= uv70ec9;                  kdf2093     <= uv70ec9;                  ykce1d9  <= 1'b1;               end               default: begin                  ykce1d9  <= 1'b0;               end            endcase
`endif
`ifdef LW2
            case(gq8764d)               2'd2: begin                  zxe9a3f  <= {(LANE_WIDTH){1'b1}};                  ne4d1fe  <= {(LANE_WIDTH){1'b1}};                  kdf2093     <= {(LANE_WIDTH){1'b1}};                  ykce1d9  <= 1'b1;               end               2'd1: begin                  zxe9a3f  <= hbe6224;                  ne4d1fe  <= hbe6224;                  kdf2093     <= hbe6224;                  ykce1d9  <= 1'b1;               end               default: begin                  ykce1d9  <= 1'b0;               end            endcase
`endif
`ifdef LW1
            case(gq8764d)               1'b1: begin                  zxe9a3f  <= {(LANE_WIDTH){1'b1}};                  ne4d1fe  <= {(LANE_WIDTH){1'b1}};                  kdf2093     <= {(LANE_WIDTH){1'b1}};                  ykce1d9  <= 1'b1;               end               default: begin                  ykce1d9  <= 1'b0;               end            endcase
`endif
            if ((ohbb988 && al44981) && ~me5374d) begin               gd9049d      <= rg57424;               me5374d  <= 1'b1;            end                        else if ((xy9c101 || pfc269b == ba2ffea) && ~me5374d || (!ohbb988 && al44981)) begin               gd9049d      <= ou245d7;               by47f90    <= 1'b1;               db9ba68     <= {(LANE_WIDTH){1'b0}};            end            else begin               gd9049d      <= ir8ae84;            end         end                           rg57424: begin                        kq49b53      <= 0;            ykce1d9      <= 1'b0;                        if ((pfc269b == ba2ffea || xy9c101) && ~me5374d) begin               gd9049d      <= ou245d7;               by47f90    <= 1'b1;               db9ba68     <= {(LANE_WIDTH){1'b0}};            end            else if (|zz91591 == 1'b1 && ~me5374d) begin               gd9049d      <= rvba122;               me5374d  <= 1'b1;            end            else begin               gd9049d      <= rg57424;            end         end                           rvba122: begin                    if (|pfe38b6 && ~me5374d) begin       if (pfe38b6 == ba2ffea | sue080b) begin                  kq49b53  <= ntb5d56;                  zm99660         <= 1'b1;               end            end            iccb303  <= uk31126;            ui59819 <= co88930;
`ifdef LW4
            case(gq8764d)               4'd4: begin                  zxe9a3f  <= {(LANE_WIDTH){1'b1}};                  ne4d1fe  <= {(LANE_WIDTH){1'b1}};                  ykce1d9  <= 1'b1;               end               4'd1,4'd2: begin                  zxe9a3f  <= hbe6224;                  ne4d1fe  <= hbe6224;                  ykce1d9  <= 1'b1;               end               4'd3: begin                  zxe9a3f  <= uv70ec9;                  ne4d1fe  <= uv70ec9;                  ykce1d9  <= 1'b1;               end               default: begin                  ykce1d9  <= 1'b0;               end            endcase
`endif
`ifdef LW2
            case(gq8764d)               2'd2: begin                  zxe9a3f  <= {(LANE_WIDTH){1'b1}};                  ne4d1fe  <= {(LANE_WIDTH){1'b1}};                  ykce1d9  <= 1'b1;               end               2'd1: begin                  zxe9a3f  <= hbe6224;                  ne4d1fe  <= hbe6224;                  ykce1d9  <= 1'b1;               end               default: begin                  ykce1d9  <= 1'b0;               end            endcase
`endif
`ifdef LW1
            case(gq8764d)               1'b1: begin                  zxe9a3f  <= {(LANE_WIDTH){1'b1}};                  ne4d1fe  <= {(LANE_WIDTH){1'b1}};                  ykce1d9  <= 1'b1;               end               default: begin                  ykce1d9  <= 1'b0;               end            endcase
`endif
                        if (ntb5d56 == kdf2093 && (ohbb988 && al44981) && ~me5374d) begin               gd9049d      <= ned0917;               db9ba68     <= kdf2093;               rtdd347 <= OS_T2;               me5374d  <= 1'b1;               ux8a6e9   <= ~kdf2093;               rgcf453   <= 1'b1;            end                        else if (|xwee456 && (ohbb988 && al44981) && ~me5374d) begin               gd9049d      <= rg57424;               db9ba68     <= ba2ffea;               rtdd347 <= OS_T1;               me5374d  <= 1'b1;               kdf2093      <= ne4d1fe;            end                        else if (pfc269b == ba2ffea && ~me5374d || (!ohbb988 && al44981)) begin               gd9049d      <= ou245d7;               by47f90    <= 1'b1;               db9ba68     <= {(LANE_WIDTH){1'b0}};            end            else begin               gd9049d      <= rvba122;            end         end                  ned0917: begin            qt7a29b <= ((ay5647c == kdf2093) || ip7ff53) ? 1'b1: 1'b0;            if (fp3d11 == kdf2093  && rtd25dc == kdf2093 && hof4473 == kdf2093 && ~me5374d) begin               gd9049d      <= lf848ba;               db9ba68     <= kdf2093;               rtdd347 <= OS_IDLE;               me5374d  <= 1'b1;               ead14dd  <= 1'b1;            end            else if (xy9c101 && ~me5374d) begin               gd9049d      <= ou245d7;               by47f90    <= 1'b1;               db9ba68     <= {(LANE_WIDTH){1'b0}};               ead14dd  <= 1'b1;            end            else begin               gd9049d      <= ned0917;            end         end                  lf848ba: begin            if (pu11cd2 == kdf2093  && rg73497 == kdf2093 && ~me5374d) begin               gd9049d      <= ou245d7;               xwfe412     <= 1'b1;               db9ba68     <= {(LANE_WIDTH){1'b0}};            end            else if (xy9c101 && ~me5374d) begin               gd9049d      <= ou245d7;               by47f90    <= 1'b1;               db9ba68     <= {(LANE_WIDTH){1'b0}};            end            else begin               gd9049d      <= lf848ba;            end         end                  ou245d7: begin            rgcf453   <= 1'b0;            if (en44bff != CONFIG) begin               gd9049d   <= ui562ba;            end            else begin               gd9049d   <= ou245d7;            end         end         default: begin            gd9049d   <= ui562ba;         end      endcase   end
end
always@* begin en44bff<={gq31bc6>>1,ld7b613[0]};ba2ffea<={ym8de31>>1,ld7b613[1]};ip7ff53<=ld7b613[2];osffa9c<=ld7b613[3];uiea704<={shc6261>>1,ld7b613[4]};yk53820<=ld7b613[5];xy9c101<=ld7b613[6];sue080b<=ld7b613[7];lsb09a<={ohd0c6>>1,ld7b613[8]};pfc269b<={me68634>>1,ld7b613[9]};gd2cdbf<={qgef2ad>>1,ld7b613[10]};hd9bfa4<={ep18d09>>1,ld7b613[11]};dmfe93b<={uvc684c>>1,ld7b613[12]};pfe38b6<={zx55a12>>1,ld7b613[13]};aa3b4e6<={gda1320>>1,ld7b613[14]};xje62aa<={ea4c82f>>1,ld7b613[15]};oh8aab0<={rt64179>>1,ld7b613[16]};fpaac27<={ba20bcf>>1,ld7b613[17]};dbb09f8<={ym5e7a>>1,ld7b613[18]};fp27e3f<={pu2f3d1>>1,ld7b613[19]};czf8ffb<={lq79e8a>>1,ld7b613[20]};tw3feee<={ipd6214>>1,ld7b613[21]};pff3fb5<={fc115ba>>1,ld7b613[22]};xwee456<={xy14902>>1,ld7b613[23]};ntb5d56<={lfba70b>>1,ld7b613[24]};zz91591<={ie24094>>1,ld7b613[25]};ay56f67<={ngbf5b>>1,ld7b613[26]};fp3d11<={kdedf52>>1,ld7b613[27]};ay5647c<={an250b>>1,ld7b613[28]};hof4473<={ic7d4a5>>1,ld7b613[29]};pu11cd2<={dm52940>>1,ld7b613[30]};rg73497<={lfa501e>>1,ld7b613[31]};rtd25dc<={fn407bf>>1,ld7b613[32]};ohbb988<=ld7b613[33];hbe6224<={kq49b53>>1,ld7b613[34]};uk31126<=ld7b613[35];co88930<=ld7b613[36];al44981<=ld7b613[37];end
always@* begin necf6c2[2047]<=ym8de31[0];necf6c2[2046]<=uv6f189;necf6c2[2044]<=yk78c4c;necf6c2[2040]<=shc6261[0];necf6c2[2032]<=sw3130d;necf6c2[2017]<=ng89868;necf6c2[1987]<=ic4c343;necf6c2[1927]<=ohd0c6[0];necf6c2[1865]<=rt64179[0];necf6c2[1859]<=ykce1d9;necf6c2[1806]<=me68634[0];necf6c2[1682]<=ba20bcf[0];necf6c2[1671]<=kq49b53[0];necf6c2[1565]<=qgef2ad[0];necf6c2[1488]<=lfa501e[0];necf6c2[1326]<=ngbf5b[0];necf6c2[1317]<=ym5e7a[0];necf6c2[1295]<=zm99660;necf6c2[1210]<=an250b[0];necf6c2[1189]<=xy14902[0];necf6c2[1172]<=lq79e8a[0];necf6c2[1087]<=ui59819;necf6c2[1082]<=ep18d09[0];necf6c2[1023]<=gq31bc6[0];necf6c2[932]<=ea4c82f[0];necf6c2[929]<=fn407bf[0];necf6c2[744]<=dm52940[0];necf6c2[663]<=ie24094[0];necf6c2[605]<=kdedf52[0];necf6c2[594]<=fc115ba[0];necf6c2[586]<=pu2f3d1[0];necf6c2[543]<=iccb303;necf6c2[466]<=gda1320[0];necf6c2[372]<=ic7d4a5[0];necf6c2[331]<=lfba70b[0];necf6c2[297]<=ipd6214[0];necf6c2[233]<=zx55a12[0];necf6c2[116]<=uvc684c[0];end         assign suff972 = necf6c2,ld7b613 = cme5c87;   initial begin   jcc030e = $fopen(".fred");   $fdisplay( jcc030e, "%3h\n%3h", (thc27c7 >> 4) & fnc7fe5, (thc27c7 >> (mt9f1ff+4)) & fnc7fe5 );   $fclose(jcc030e);   $readmemh(".fred", qg721c0);   end   always @ (suff972) begin   ym8700c = qg721c0[1];       for (vk1872=0; vk1872<qgdb09f; vk1872=vk1872+1) begin           cme5c87[vk1872] = suff972[ym8700c];       rv38061  = ^(ym8700c & qg721c0[0]);       ym8700c =  {ym8700c, rv38061};       end   end
endmodule