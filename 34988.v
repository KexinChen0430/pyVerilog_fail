module zz13dc9
   (
    sys_clk,
    rst_n,
    fne316a,
    je204f6,
    vv4ff45,
    sh7fa2e,
    xwfe412,
    ea68ff2,
    je3fc82,
    by47f90,
    uk98798,
    wjc3cc1,
    aa24e7c,
    ldf94c3,
    oh39f06,
    pscf835,
    kqcb0e8,
    ukb310a,
    bn6a90,
    je35486,
    vxaa432,
    ho52196,
    oh90cb2,
    ri86594,
    hd1363a,
    ep1d47c,
    xl37682,
    jr94792,
    gqa3c97,
    ri1e4b9,
    gq31bc6,
    gq92e55,
    ie972a9,
    ukb9548
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
input                   sys_clk;
input                   rst_n;
input                   fne316a;
input                   je204f6;
input                   vv4ff45;
input                   sh7fa2e;
input                   xwfe412;
input                   ea68ff2;
input                   je3fc82;
input                   by47f90;
input                   uk98798;
input                   wjc3cc1;
input                   aa24e7c;
input                   ldf94c3;
input                   oh39f06;
input                   pscf835;
input                   kqcb0e8;
input                   ukb310a;
input                   bn6a90;
input                   je35486;
input                   vxaa432;
input                   ho52196;
input                   oh90cb2;
input                   ri86594;
input                   hd1363a;
input                   ep1d47c;
input                   xl37682;
output                  jr94792;
output                  gqa3c97;
output                  ri1e4b9;
output  [MSM_WIDTH:0]   gq31bc6;
output                  gq92e55;
output                  ie972a9;
output                  ukb9548;
reg [MSM_WIDTH:0]       ep1242c;
reg                     ri1e4b9;
reg [MSM_WIDTH:0]       gq31bc6;
reg                     gq92e55;
reg                     ie972a9;
reg                     ukb9548;
reg                     jr94792;
reg                     gqa3c97;
reg                     yz2ce9a;
reg  [5*8:0] ea674d4;
reg ou3b01d;
reg kdd3503;
reg mt9a81c;
reg icd40e5;
reg bna0729;
reg fp394f;
reg rv1ca7e;
reg sue53f6;
reg kf29fb1;
reg zx4fd8c;
reg zx7ec66;
reg xjf6336;
reg gdb19b7;
reg zm8cdbd;
reg by66deb;
reg ep36f5b;
reg fcb7adc;
reg ngbd6e2;
reg dmeb712;
reg uv5b892;
reg wjdc495;
reg mre24ad;
reg kf1256c;
reg ks92b64;
reg qv95b21;
reg [MSM_WIDTH : 0] zk6c862;
reg pf64312;
reg [5 * 8 : 0] ks21897;
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
localparam qgdb09f = 28,nrd84f8 = 32'hfdffe0cb;
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
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      ep1242c  <= DETECT;      ri1e4b9 <= 1'b0;      jr94792<= 1'b0;      gqa3c97<= 1'b0;   end   else if (pf64312) begin      ep1242c  <= L0;      ri1e4b9 <= 1'b1;      jr94792<= 1'b0;      gqa3c97<= 1'b1;   end   else begin      case(zk6c862)          DETECT: begin            ri1e4b9   <= 1'b0;            gqa3c97  <= 1'b0;            if (kdd3503)               ep1242c <= POLLING;            else               ep1242c <= DETECT;         end         POLLING: begin            ri1e4b9 <= 1'b0;            gqa3c97<= 1'b0;            casex({mt9a81c, icd40e5})               2'b1x:   ep1242c <= CONFIG;               2'bx1:   ep1242c <= DETECT;               default: ep1242c <= POLLING;            endcase         end         CONFIG: begin            ri1e4b9 <= ri1e4b9;            jr94792<= |{fp394f, rv1ca7e, sue53f6};            gqa3c97<= 1'b1;            casex({bna0729, fp394f, rv1ca7e, sue53f6})               4'b1xxx: ep1242c <= L0;               4'bx1xx: ep1242c <= LOOPBACK;               4'bxx1x: ep1242c <= DISABLED;               4'bxxx1: ep1242c <= DETECT;               default: ep1242c <= CONFIG;    endcase         end         L0: begin            ri1e4b9   <= 1'b1;            gqa3c97  <= 1'b1;            jr94792  <= 1'b0;            casex({kf29fb1, zx4fd8c, zx7ec66, xjf6336})               4'b1xxx: ep1242c <= L1;               4'bx1xx: ep1242c <= L2;               4'bxx1x: ep1242c <= L0s;               4'bxxx1: ep1242c <= RECOVERY;               default: ep1242c <= L0;    endcase         end         L0s : begin            ri1e4b9   <= 1'b1;            gqa3c97  <= 1'b0;            casex({gdb19b7, zm8cdbd})               2'b1x:   ep1242c <= L0;               2'bx1:   ep1242c <= RECOVERY;               default: ep1242c <= L0s;            endcase         end         L1 : begin            ri1e4b9   <= 1'b1;            gqa3c97  <= 1'b0;            if (by66deb)               ep1242c <= RECOVERY;            else               ep1242c <= L1;         end         L2 : begin            ri1e4b9   <= 1'b1;            gqa3c97  <= 1'b0;            if (ep36f5b)               ep1242c <= DETECT;            else               ep1242c <= L2;         end         RECOVERY: begin            ri1e4b9 <= 1'b1;            gqa3c97<= 1'b1;            casex({fcb7adc, ngbd6e2, dmeb712, uv5b892, wjdc495, mre24ad})               6'b1xxxxx: ep1242c <= L0;               6'bx1xxxx: ep1242c <= LOOPBACK;               6'bxx1xxx: ep1242c <= HOTRST;               6'bxxx1xx: ep1242c <= DISABLED;               6'bxxxx1x: ep1242c <= DETECT;               6'bxxxxx1: ep1242c <= CONFIG;               default:   ep1242c <= RECOVERY;            endcase         end         LOOPBACK: begin            ri1e4b9   <= 1'b0;            gqa3c97  <= 1'b0;    if (kf1256c)               ep1242c <= DETECT;            else               ep1242c <= LOOPBACK;         end         HOTRST :  begin            ri1e4b9   <= 1'b0;            gqa3c97  <= 1'b0;    if (ks92b64)               ep1242c <= DETECT;            else               ep1242c <= HOTRST;         end         DISABLED :  begin            ri1e4b9   <= 1'b0;            gqa3c97  <= 1'b0;    if (qv95b21)               ep1242c <= DETECT;            else               ep1242c <= DISABLED;         end         default : begin            gqa3c97<= 1'b0;            ri1e4b9 <= 1'b0;            ep1242c  <= {(MSM_WIDTH){1'bx}};         end      endcase   end
end
always @(posedge sys_clk or negedge rst_n) begin   if (!rst_n) begin      yz2ce9a <= 1'b0;      gq31bc6      <= DETECT;      gq92e55        <= 1'b0;      ie972a9        <= 1'b1;      ukb9548     <= 1'b0;   end   else begin      yz2ce9a <= ou3b01d;      gq31bc6      <= zk6c862;            gq92e55        <= (gq31bc6 == POLLING) ? 1'b1 : 1'b0;      ie972a9        <= (gq31bc6 == DETECT) ? 1'b1 : 1'b0;      ukb9548     <= (gq31bc6 == L0 || gq31bc6 == L0s) ? 1'b1 : 1'b0;   end
end
always @ (zk6c862)
begin   case(zk6c862)         DETECT:   ea674d4 = "DET";         POLLING:  ea674d4 = "POL";         CONFIG:   ea674d4 = "CFG";         L0:       ea674d4 = "L0";         L0s:      ea674d4 = "L0S";         L1 :      ea674d4 = "L1";         L2 :      ea674d4 = "L2";         RECOVERY: ea674d4 = "RCVRY";         LOOPBACK: ea674d4 = "LBK";         HOTRST :  ea674d4 = "HRST";         DISABLED: ea674d4 = "DIS";      default:      ea674d4 = "ERROR";   endcase
end
always@* begin ou3b01d<=ld7b613[0];kdd3503<=ld7b613[1];mt9a81c<=ld7b613[2];icd40e5<=ld7b613[3];bna0729<=ld7b613[4];fp394f<=ld7b613[5];rv1ca7e<=ld7b613[6];sue53f6<=ld7b613[7];kf29fb1<=ld7b613[8];zx4fd8c<=ld7b613[9];zx7ec66<=ld7b613[10];xjf6336<=ld7b613[11];gdb19b7<=ld7b613[12];zm8cdbd<=ld7b613[13];by66deb<=ld7b613[14];ep36f5b<=ld7b613[15];fcb7adc<=ld7b613[16];ngbd6e2<=ld7b613[17];dmeb712<=ld7b613[18];uv5b892<=ld7b613[19];wjdc495<=ld7b613[20];mre24ad<=ld7b613[21];kf1256c<=ld7b613[22];ks92b64<=ld7b613[23];qv95b21<=ld7b613[24];zk6c862<={ep1242c>>1,ld7b613[25]};pf64312<=ld7b613[26];ks21897<={ea674d4>>1,ld7b613[27]};end
always@* begin necf6c2[2047]<=je204f6;necf6c2[2046]<=vv4ff45;necf6c2[2044]<=sh7fa2e;necf6c2[2040]<=xwfe412;necf6c2[2033]<=ea68ff2;necf6c2[2024]<=ri86594;necf6c2[2018]<=je3fc82;necf6c2[2001]<=hd1363a;necf6c2[1988]<=by47f90;necf6c2[1954]<=ep1d47c;necf6c2[1929]<=uk98798;necf6c2[1860]<=xl37682;necf6c2[1811]<=wjc3cc1;necf6c2[1789]<=vxaa432;necf6c2[1673]<=ep1242c[0];necf6c2[1574]<=aa24e7c;necf6c2[1530]<=ho52196;necf6c2[1299]<=yz2ce9a;necf6c2[1247]<=ukb310a;necf6c2[1101]<=ldf94c3;necf6c2[1023]<=fne316a;necf6c2[1012]<=oh90cb2;necf6c2[894]<=je35486;necf6c2[623]<=kqcb0e8;necf6c2[551]<=ea674d4[0];necf6c2[447]<=bn6a90;necf6c2[311]<=pscf835;necf6c2[155]<=oh39f06;end         assign suff972 = necf6c2,ld7b613 = cme5c87;   initial begin   jcc030e = $fopen(".fred");   $fdisplay( jcc030e, "%3h\n%3h", (thc27c7 >> 4) & fnc7fe5, (thc27c7 >> (mt9f1ff+4)) & fnc7fe5 );   $fclose(jcc030e);   $readmemh(".fred", qg721c0);   end   always @ (suff972) begin   ym8700c = qg721c0[1];       for (vk1872=0; vk1872<qgdb09f; vk1872=vk1872+1) begin           cme5c87[vk1872] = suff972[ym8700c];       rv38061  = ^(ym8700c & qg721c0[0]);       ym8700c =  {ym8700c, rv38061};       end   end
endmodule