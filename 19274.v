module)
//                   dc_tdo_stb,
                   dcc_en,  // enable dcc (sync to beginning of a new frame)
                   hfc_sel, // hight frequency components select [2:0] (includes components with both numbers >=hfc_sel
                            // hfc_sel == 3'h7 - now high frequency output - just 3 words - brightness and 2 color diffs
                   color_first, // first MCU in a frame
                   coring_num, // coring table pair number (0..7)
                   dcc_vld, // single cycle when dcc_data is valid
                   dcc_data,  // [15:0] dc component data out (for reading by software)
                   n000,      // input [7:0] number of zero pixels (255 if 256) - to be multiplexed with dcc
                   n255);     // input [7:0] number of 0xff pixels (255 if 256) - to be multiplexed with dcc
    input         clk;
    input         en;
    input         sclk;
    input         twqe;
    input         twce;
    input [ 8:0]   ta;
    input [15:0]   tdi;
    input         ctypei;
    input [ 8:0]   dci; // now normal signed number
    input         first_stb; //this is first stb pulse in a frame
    input         stb;
    input [ 2:0]  tsi;
    input         pre_start;
    input         first_in; // first block in (valid @ start)
    output        first_out; // valid @ ds
    input [12:0]   di;
    output[12:0]   do;
    output         dv;
    output         ds;
    output [15:0] dc_tdo;
    input         dcc_en;
    input [2:0]   hfc_sel;
    input         color_first;
    input  [2:0]  coring_num; // Coring table number (0..7)
    output         dcc_vld;
    output[15:0]   dcc_data;
    input  [7:0]  n000;
    input  [7:0]  n255;
    wire   [3:0] tdco; // coring table output
    reg    [3:0] tbac; // coring memory table number (LSB - color)
    reg           coring_range; // input <16, use coring LUT
    wire   [15:0]   tdo;
    reg   [ 9:0]   tba;   // table output (use) address
    wire   [15:0]   zigzag_q;
    reg            wpage,
                  rpage;
    wire    [5:0]   zwa;
    reg    [5:0]   zra;
    reg    [12:0]  qdo;
    reg    [12:0]  qdo0;
    reg            zwe;
    reg    [12:0]   d1;
    reg    [12:0]   d2,d3; // registered data in, converted to sign+ absolute value
    wire [27:0]   qmul;
    wire            start_a;
    reg  [15:0]   tdor;
    reg   [20:0]   qmulr; // added 7 bits to total8 fractional for biasing/zero bin
    wire            start_out;
    wire            start_z;
    reg            ds;
    reg            dv;
    reg   [ 8:0]   dc1;   // registered DC average - with restored sign
// for fifo for ctype, dc
    wire         ctype;
    wire   [8:0]   dc;
    wire         next_dv;
    reg  [ 5:0]   start;
    wire [15:0]   dcc_data;
    wire          dcc_stb;
    reg           dcc_vld;
    reg           dcc_run;
    reg           dcc_first;
    reg           dcc_Y;
    reg  [1:0]    ctype_prev;
    reg [12:0]    dcc_acc;
    reg [12:0]    hfc_acc;
    wire          hfc_en;
    reg           hfc_copy; // copy hfc_acc to dcc_acc
    wire [10:0]   d2_dct; // 11 bits enough, convetred to positive (before - 0 was in the middle - pixel value 128) - dcc only
    reg           sel_satnum; // select saturation numbers - dcc only
    reg           twqe_d; //twqe delayed (write MSW)
    reg           twce_d; //twce delayed (write MSW)
    reg    [15:0] dc_tdo;
    reg    [15:0] pre_dc_tdo;
    wire          copy_dc_tdo;
    wire          first_in; // first block in (valid @ pre_start)
    reg           first_interm, first_out; // valid @ ds
    wire   [2:0]  ts;
    wire   [2:0]  coring_sel;
    reg    [2:0]  block_mem_ra;
    reg    [2:0]  block_mem_wa;
    reg    [2:0]  block_mem_wa_save;
    reg   [15:0]  block_mem[0:7];
    wire  [15:0]  block_mem_o=block_mem[block_mem_ra[2:0]];
    assign      dc[8:0]=          block_mem_o[8:0];
    assign      ctype=            block_mem_o[9];
    assign      ts[2:0]=          block_mem_o[12:10];
    assign      coring_sel[2:0]=  block_mem_o[15:13];
    assign start_a=start[5];
    assign start_z=start[4];
    assign dcc_stb=start[2];
    always @ (posedge clk) begin
      if (stb) block_mem[block_mem_wa[2:0]] <= {coring_num[2:0],tsi[2:0], ctypei, dci[8:0]};
      if      (!en) block_mem_wa[2:0] <= 3'h0;
      else if (stb) block_mem_wa[2:0] <= block_mem_wa[2:0] +1;
      if (stb && first_stb)  block_mem_wa_save[2:0] <= block_mem_wa[2:0];
      if      (!en)   block_mem_ra[2:0] <= 3'h0;
      else if (pre_start) block_mem_ra[2:0] <= first_in?block_mem_wa_save[2:0]:(block_mem_ra[2:0] +1);
    end
    assign        d2_dct[10:0]={!d2[11] ^ ctype_prev[0], d2[9:0]};
    assign        dcc_data[15:0]=sel_satnum?
                    {n255[7:0],n000[7:0]}:
                    {dcc_first || (!dcc_Y && dcc_acc[12]) ,(!dcc_Y && dcc_acc[12]), (!dcc_Y && dcc_acc[12]), dcc_acc[12:0]};
    assign         do[12:0]=zigzag_q[12:0];
//    assign         qmul[23:0]=tdor[11:0]*d3[11:0];
    assign        qmul[27:0]=tdor[15:0]*d3[11:0];
    assign         start_out =   zwe && (zwa[5:0]== 6'h3f);   //adjust?
    assign         copy_dc_tdo = zwe && (zwa[5:0]== 6'h37);   // not critical
    assign next_dv=en && (ds || (dv && (zra[5:0]!=6'h00)));
    always @ (posedge clk) begin
      d1[12:0]      <= di[12:0];
//inv_sign
//       dc1[8:0]   <= start[0]?{{2{~dc[7]}},dc[6:0]}:9'b0;   // sync to d1[8:0]ctype valid at start, not later
      dc1[8:0] <= start[0]?dc[8:0]:9'b0;   // sync to d1[8:0]ctype valid at start, not later
      d2[12:0] <= {dc1[8],dc1[8:0],3'b0} + d1[12:0];
      d3[12]      <= d2[12];
      d3[11:0]      <= d2[12]? -d2[11:0]:d2[11:0];
      if (start[0] || !en) tba[9:6] <= {ts[2:0],ctype};
      if (start[3] || !en) tbac[3:0] <= {coring_sel[2:0],ctype}; // table number to use
      if      (start[0])    tba[5:0] <= 6'b0;
      else if (tba[5:0]!=6'h3f) tba[5:0] <= tba[5:0]+1;
      tdor[15:0]  <= tdo[15:0]; // registered table data out
      if (start[3])  pre_dc_tdo[15:0] <= tdor[15:0]; //16-bit q. tables)
      if (copy_dc_tdo) dc_tdo[15:0]     <= pre_dc_tdo[15:0];
      qmulr[19:0] <= qmul[27:8]; // absolute value
      qmulr[20]   <= d3[12];     // sign
      qdo0[12]    <= qmulr[20];  // sign
// tdco[3:0] - same timing as qdo0;
// use lookup table from 8 bits of absolute value (4.4 - 4 fractional) to calculate 4 bit coring output that would replace output
// if input is less thahn 16. For larger values the true rounding will be used.
// Absolute values here have quantization coefficients already applied, so we can use the same coring table for all DCT coefficients.
// there are be 16 tables - 8 Y/C pairs to switch
      qdo0[11:0]  <= qmulr[19:8] + qmulr[7]; // true rounding of the absolute value
      coring_range<= !(|qmulr[19:12]) && !(&qmulr[11:7]) ; // valid with qdo0
//      qdo[11:0]   <= coring_range? {8'h0,tdco[3:0]}:qdo0[11:0];
      qdo[11:0]   <= coring_range? (qdo0[12]?-{8'h0,tdco[3:0]}:{8'h0,tdco[3:0]}):(qdo0[12]?-qdo0[11:0]:qdo0[11:0]);
      qdo[12]     <= qdo0[12] && (!coring_range || (tdco[3:0]!=4'h0));
      if (start_out) rpage <= wpage;
      if (start_out) zra[5:0] <= 6'b0;
      else    if (zra[5:0]!=6'h3f)   zra[5:0] <=zra[5:0]+1; // conserving energy
      ds            <= start_out;
      dv    <= next_dv;
      if (start_a)   first_interm <= first_in;
      if (start_out) first_out    <=first_interm;
// zwe???
      zwe <= en && (start_a || (zwe && (zwa[5:0]!=6'h3f)));
      if          (!en) wpage <= 1'b0;
      else if (start_a) wpage <= ~wpage;
    end
    always @ (posedge clk) begin
     sel_satnum <= dcc_run && (start[0]? (ctype_prev[1:0]==2'b10): sel_satnum);
     hfc_copy <= dcc_run && (hfc_sel[2:0]!=3'h7) && (tba[5:0]==6'h1f) && ctype_prev[0] && ctype_prev[1];
     start[5:0] <= {start[4:0], pre_start}; // needed?
     if    (!dcc_en) dcc_run <= 1'b0;
     else if (start[0]) dcc_run <= 1'b1;
     if (!dcc_en)    ctype_prev[1:0] <= 2'b11;
     else if (start[0]) ctype_prev[1:0] <= {ctype_prev[0],ctype && dcc_run};
     if (dcc_stb || hfc_copy) dcc_acc[12:0] <= hfc_copy?
                                               hfc_acc[12:0]:
                                               {(d2_dct[10]&&ctype_prev[0]),(d2_dct[10]&&ctype_prev[0]),d2_dct[10:0]}+((ctype_prev[0] || ctype_prev[1])?13'h0:dcc_acc[12:0]);
     if (!dcc_run || hfc_copy) hfc_acc <=13'b0;
     else if (hfc_en) hfc_acc <= hfc_acc + {2'b0, d3[10:0]};
     if (dcc_stb) dcc_first <= color_first && dcc_run && dcc_stb && ctype && !ctype_prev[0];
     if (dcc_stb) dcc_Y <= dcc_run && dcc_stb && ctype && !ctype_prev[0];
     dcc_vld <= (dcc_run && dcc_stb && (ctype || ctype_prev[0] || sel_satnum)) || hfc_copy;
    end
    SRL16 i_hfc_en (.Q(hfc_en), .A0(1'b1), .A1(1'b0), .A2(1'b0), .A3(1'b0), .CLK(clk),
                    .D(((tba[2:0]>hfc_sel[2:0]) || (tba[5:3]>hfc_sel[2:0])) && dcc_run && !ctype_prev[0])); // dly=1+1
    zigzag i_zigzag(   .clk(clk),
                     .start(start_z),
                      .q(zwa[5:0]));
   always @ (negedge sclk) twqe_d <= twqe;
   always @ (negedge sclk) twce_d <= twce;
   RAMB16_S18_S18 i_quant_table (
      .DOA(tdo[15:0]),       // Port A 16-bit Data Output
      .DOPA(),     // Port A 2-bit Parity Output
      .ADDRA({tba[9:6],tba[2:0],tba[5:3]}),   // Port A 10-bit Address Input
      .CLKA(clk),     // Port A Clock
      .DIA(16'b0),       // Port A 16-bit Data Input
      .DIPA(2'b0),     // Port A 2-bit parity Input
      .ENA(1'b1),       // Port A RAM Enable Input
      .SSRA(1'b0),     // Port A Synchronous Set/Reset Input
      .WEA(1'b0),       // Port A Write Enable Input
      .DOB(), // Port B 16-bit Data Output
      .DOPB(),     // Port B 2-bit Parity Output
      .ADDRB({ta[8:0],twqe_d}),   // Port B 10-bit Address Input
      .CLKB(!sclk),     // Port B Clock
      .DIB(tdi[15:0]),       // Port B 16-bit Data Input
      .DIPB(2'b0),     // Port-B 2-bit parity Input
      .ENB(1'b1),       // PortB RAM Enable Input
      .SSRB(1'b0),     // Port B Synchronous Set/Reset Input
      .WEB(twqe || twqe_d)   // Port B Write Enable Input
   );
   RAMB16_S4_S18 i_coring_table (
      .DOA(tdco[3:0]),          // Port A 4-bit Data Output
      .ADDRA({tbac[3:0],qmulr[11:4]}),  // Port A 12-bit Address Input
      .CLKA(clk),               // Port A Clock
      .DIA(4'b0),               // Port A 4-bit Data Input
      .ENA(1'b1),               // Port A RAM Enable Input
      .SSRA(1'b0),              // Port A Synchronous Set/Reset Input
      .WEA(1'b0),               // Port A Write Enable Input
      .DOB(),                   // Port B 16-bit Data Output
      .DOPB(),                  // Port B 2-bit Parity Output
      .ADDRB({ta[8:0],twce_d}), // Port B 10-bit Address Input
      .CLKB(!sclk),             // Port B Clock
      .DIB(tdi[15:0]),          // Port B 16-bit Data Input
      .DIPB(2'b0),              // Port-B 2-bit parity Input
      .ENB(1'b1),               // PortB RAM Enable Input
      .SSRB(1'b0),              // Port B Synchronous Set/Reset Input
      .WEB(twce || twce_d)      // Port B Write Enable Input
   );
   RAMB16_S18_S18 i_zigzagbuf (
      .DOA(),      // Port A 16-bit Data Output
      .DOPA(),    // Port A 2-bit Parity Output
      .ADDRA({3'b0,wpage,zwa[5:0]}),  // Port A 10-bit Address Input
      .CLKA(clk),    // Port A Clock
      .DIA({3'b0,qdo[12:0]}),      // Port A 16-bit Data Input
      .DIPA(2'b0),    // Port A 2-bit parity Input
      .ENA(1'b1),      // Port A RAM Enable Input
      .SSRA(1'b0),    // Port A Synchronous Set/Reset Input
      .WEA(zwe),      // Port A Write Enable Input
      .DOB(zigzag_q[15:0]),      // Port B 16-bit Data Output
      .DOPB(),    // Port B 2-bit Parity Output
      .ADDRB({3'b0,rpage,zra[5:0]}),  // Port B 10-bit Address Input
      .CLKB(clk),    // Port B Clock
      .DIB(16'b0),      // Port B 16-bit Data Input
      .DIPB(2'b0),    // Port-B 2-bit parity Input
      .ENB(next_dv),      // PortB RAM Enable Input
      .SSRB(1'b0),    // Port B Synchronous Set/Reset Input
      .WEB(1'b0)       // Port B Write Enable Input
   );
endmodule