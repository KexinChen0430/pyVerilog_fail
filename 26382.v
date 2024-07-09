module CORE(input  wire              CLK,          // clock
            input  wire              RST_IN,       // reset
            input  wire              d_busy,       // DRAM busy
            output wire [`DRAMW-1:0] d_din,        // DRAM data in
            input  wire              d_w,          // DRAM write flag
            input  wire [`DRAMW-1:0] d_dout,       // DRAM data out
            input  wire              d_douten,     // DRAM data out enable
            output reg  [1:0]        d_req,        // DRAM REQ access request (read/write)
            output reg  [31:0]       d_initadr,    // DRAM REQ initial address for the access
            output reg  [31:0]       d_blocks,     // DRAM REQ the number of blocks per one access
            input  wire [`DRAMW-1:0] rx_data,
            input  wire              rx_data_valid,
            output wire              rx_wait,
            input  wire              chnl_tx_data_ren,
            input  wire              chnl_tx_data_valid,
            output wire [`MERGW-1:0] rslt,
            output wire              rslt_ready);
  function [1-1:0] mux1;
    input [1-1:0] a;
    input [1-1:0] b;
    input         sel;
    begin
      case (sel)
        1'b0: mux1 = a;
        1'b1: mux1 = b;
      endcase
    end
  endfunction
  function [`SORT_WAY-1:0] mux_sortway;
    input [`SORT_WAY-1:0] a;
    input [`SORT_WAY-1:0] b;
    input          sel;
    begin
      case (sel)
        1'b0: mux_sortway = a;
        1'b1: mux_sortway = b;
      endcase
    end
  endfunction
  function [32-1:0] mux32;
    input [32-1:0] a;
    input [32-1:0] b;
    input          sel;
    begin
      case (sel)
        1'b0: mux32 = a;
        1'b1: mux32 = b;
      endcase
    end
  endfunction
  function [512-1:0] mux512;
    input [512-1:0] a;
    input [512-1:0] b;
    input           sel;
    begin
      case (sel)
        1'b0: mux512 = a;
        1'b1: mux512 = b;
      endcase
    end
  endfunction
  wire [`DRAMW-1:0]   OB_dot;
  wire                OB_req;
  wire                OB_full;
  assign d_din = OB_dot;
  reg [`DRAMW-1:0]    dout_ta;
  reg [`DRAMW-1:0]    dout_tb;
  reg [`DRAMW-1:0]    dout_tc;
  reg [`DRAMW-1:0]    dout_td;
  reg [`DRAMW-1:0]    dout_te;
  reg [`DRAMW-1:0]    dout_tf;
  reg                 doen_ta;
  reg                 doen_tb; //
  reg                 doen_tc; //
  reg                 doen_td; //
  reg                 doen_te; //
  reg                 doen_tf; //
  reg [`SORT_WAY-1:0] req;     // use n-bit for n-way sorting, data read request from ways
  (* mark_debug = "true" *) reg [`SORT_WAY-1:0] req_t;   //
  reg [`SORT_WAY-1:0] req_ta;  //
  reg [`SORT_WAY-1:0] req_tb;  //
  reg [`SORT_WAY-1:0] req_pzero;
  wire [`SORT_WAY-1:0] im_req;
  wire [`SORT_WAY-1:0] rxw;
  reg [31:0]          elem;       // sorted elements in a phase
  (* mark_debug = "true" *) reg [`PHASE_W]      phase;      //
  reg                 pchange;    // phase_change to reset some registers
  reg                 iter_done;  //
  reg [31:0]          ecnt;       // sorted elements in an iteration
  reg                 irst;       // INBUF reset
  reg                 frst;       // sort-tree FIFO reset
  reg                 phase_zero;
  reg                 last_phase;
  reg RST;
  always @(posedge CLK) RST <= RST_IN;
  wire [`MERGW-1:0] d00, d01, d02, d03, d04, d05, d06, d07;
  wire [1:0] ib00_req, ib01_req, ib02_req, ib03_req, ib04_req, ib05_req, ib06_req, ib07_req;
  // wire [`MERGW-1:0] d00, d01, d02, d03, d04, d05, d06, d07, d08, d09, d10, d11, d12, d13, d14, d15;
  // wire [1:0] ib00_req, ib01_req, ib02_req, ib03_req, ib04_req, ib05_req, ib06_req, ib07_req, ib08_req, ib09_req, ib10_req, ib11_req, ib12_req, ib13_req, ib14_req, ib15_req;
  (* mark_debug = "true" *) wire       rsltbuf_enq;
  (* mark_debug = "true" *) wire       rsltbuf_deq;
                            wire       rsltbuf_emp;
                            wire       rsltbuf_ful;
  (* mark_debug = "true" *) wire [4:0] rsltbuf_cnt;
  wire F01_emp;
  wire F01_deq = mux1((~|{F01_emp,OB_full}), (~|{F01_emp,rsltbuf_ful}), last_phase);
  (* mark_debug = "true" *) wire [`MERGW-1:0] F01_dot;
  wire [`MERGW*`SORT_WAY-1:0] s_din = {d00, d01, d02, d03, d04, d05, d06, d07};
  // wire [`MERGW*`SORT_WAY-1:0] s_din = {d00, d01, d02, d03, d04, d05, d06, d07, d08, d09, d10, d11, d12, d13, d14, d15};
  wire [`SORT_WAY-1:0] enq;
  wire [`SORT_WAY-1:0] s_ful;
  wire [`DRAMW-1:0] stnet_dout;
  wire              stnet_douten;
  SORTINGNETWORK sortingnetwork(CLK, RST, rx_data_valid, rx_data, stnet_dout, stnet_douten);
  always @(posedge CLK) begin
    if      (RST)     req_pzero <= 1;
    else if (doen_tc) req_pzero <= {req_pzero[`SORT_WAY-2:0],req_pzero[`SORT_WAY-1]};
  end
  assign im_req = mux_sortway(req_tb, req_pzero, phase_zero);
  INMOD2 im00(CLK, RST, dout_tc, doen_tc & im_req[0],  s_ful[0],  rxw[0],  d00, enq[0],  ib00_req);
  INMOD2 im01(CLK, RST, dout_tc, doen_tc & im_req[1],  s_ful[1],  rxw[1],  d01, enq[1],  ib01_req);
  INMOD2 im02(CLK, RST, dout_td, doen_td & im_req[2],  s_ful[2],  rxw[2],  d02, enq[2],  ib02_req);
  INMOD2 im03(CLK, RST, dout_td, doen_td & im_req[3],  s_ful[3],  rxw[3],  d03, enq[3],  ib03_req);
  INMOD2 im04(CLK, RST, dout_te, doen_te & im_req[4],  s_ful[4],  rxw[4],  d04, enq[4],  ib04_req);
  INMOD2 im05(CLK, RST, dout_te, doen_te & im_req[5],  s_ful[5],  rxw[5],  d05, enq[5],  ib05_req);
  INMOD2 im06(CLK, RST, dout_tf, doen_tf & im_req[6],  s_ful[6],  rxw[6],  d06, enq[6],  ib06_req);
  INMOD2 im07(CLK, RST, dout_tf, doen_tf & im_req[7],  s_ful[7],  rxw[7],  d07, enq[7],  ib07_req);
  // INMOD2 im00(CLK, RST, dout_tc, doen_tc & im_req[0],  s_ful[0],  rxw[0],  d00, enq[0],  ib00_req);
  // INMOD2 im01(CLK, RST, dout_tc, doen_tc & im_req[1],  s_ful[1],  rxw[1],  d01, enq[1],  ib01_req);
  // INMOD2 im02(CLK, RST, dout_tc, doen_tc & im_req[2],  s_ful[2],  rxw[2],  d02, enq[2],  ib02_req);
  // INMOD2 im03(CLK, RST, dout_tc, doen_tc & im_req[3],  s_ful[3],  rxw[3],  d03, enq[3],  ib03_req);
  // INMOD2 im04(CLK, RST, dout_td, doen_td & im_req[4],  s_ful[4],  rxw[4],  d04, enq[4],  ib04_req);
  // INMOD2 im05(CLK, RST, dout_td, doen_td & im_req[5],  s_ful[5],  rxw[5],  d05, enq[5],  ib05_req);
  // INMOD2 im06(CLK, RST, dout_td, doen_td & im_req[6],  s_ful[6],  rxw[6],  d06, enq[6],  ib06_req);
  // INMOD2 im07(CLK, RST, dout_td, doen_td & im_req[7],  s_ful[7],  rxw[7],  d07, enq[7],  ib07_req);
  // INMOD2 im08(CLK, RST, dout_te, doen_te & im_req[8],  s_ful[8],  rxw[8],  d08, enq[8],  ib08_req);
  // INMOD2 im09(CLK, RST, dout_te, doen_te & im_req[9],  s_ful[9],  rxw[9],  d09, enq[9],  ib09_req);
  // INMOD2 im10(CLK, RST, dout_te, doen_te & im_req[10], s_ful[10], rxw[10], d10, enq[10], ib10_req);
  // INMOD2 im11(CLK, RST, dout_te, doen_te & im_req[11], s_ful[11], rxw[11], d11, enq[11], ib11_req);
  // INMOD2 im12(CLK, RST, dout_tf, doen_tf & im_req[12], s_ful[12], rxw[12], d12, enq[12], ib12_req);
  // INMOD2 im13(CLK, RST, dout_tf, doen_tf & im_req[13], s_ful[13], rxw[13], d13, enq[13], ib13_req);
  // INMOD2 im14(CLK, RST, dout_tf, doen_tf & im_req[14], s_ful[14], rxw[14], d14, enq[14], ib14_req);
  // INMOD2 im15(CLK, RST, dout_tf, doen_tf & im_req[15], s_ful[15], rxw[15], d15, enq[15], ib15_req);
  assign rx_wait = |rxw;
  STREE stree(CLK, RST, irst, frst, phase, s_din, enq, s_ful, F01_deq, F01_dot, F01_emp);
  wire OB_deq = d_w;
  OTMOD ob(CLK, RST, (!last_phase && F01_deq), F01_dot, OB_deq, OB_dot, OB_full, OB_req);
  assign rsltbuf_enq = last_phase && F01_deq;
  assign rsltbuf_deq = chnl_tx_data_ren && chnl_tx_data_valid;
  SRL_FIFO #(4, `MERGW) rsltbuf(CLK, RST, rsltbuf_enq, rsltbuf_deq, F01_dot,
                                rslt, rsltbuf_emp, rsltbuf_ful, rsltbuf_cnt);
  assign rslt_ready = !rsltbuf_emp;
  /***** dram READ/WRITE controller                                                         *****/
  reg [31:0] w_addr; //
  reg [2:0]  state;  // state
  reg [31:0] radr_a, radr_b, radr_c, radr_d, radr_e, radr_f, radr_g, radr_h;
  reg [27:0] cnt_a, cnt_b, cnt_c, cnt_d, cnt_e, cnt_f, cnt_g, cnt_h;
  reg        c_a, c_b, c_c, c_d, c_e, c_f, c_g, c_h; // counter is full ?
  // reg [31:0] radr_a, radr_b, radr_c, radr_d, radr_e, radr_f, radr_g, radr_h, radr_i, radr_j, radr_k, radr_l, radr_m, radr_n, radr_o, radr_p;
  // (* mark_debug = "true" *) reg [27:0] cnt_a, cnt_b, cnt_c, cnt_d, cnt_e, cnt_f, cnt_g, cnt_h, cnt_i, cnt_j, cnt_k, cnt_l, cnt_m, cnt_n, cnt_o, cnt_p;
  // reg        c_a, c_b, c_c, c_d, c_e, c_f, c_g, c_h, c_i, c_j, c_k, c_l, c_m, c_n, c_o, c_p;   // counter is full ?
  always @(posedge CLK) begin
    if (RST || pchange) begin
      if (RST) state <= 0;
      if (RST) {d_req, d_initadr, d_blocks} <= 0;
      req <= 0;
      w_addr <= mux32((`SORT_ELM>>1), 0, phase[0]);
      radr_a <= ((`SELM_PER_WAY>>3)*0);
      radr_b <= ((`SELM_PER_WAY>>3)*1);
      radr_c <= ((`SELM_PER_WAY>>3)*2);
      radr_d <= ((`SELM_PER_WAY>>3)*3);
      radr_e <= ((`SELM_PER_WAY>>3)*4);
      radr_f <= ((`SELM_PER_WAY>>3)*5);
      radr_g <= ((`SELM_PER_WAY>>3)*6);
      radr_h <= ((`SELM_PER_WAY>>3)*7);
      {cnt_a, cnt_b, cnt_c, cnt_d, cnt_e, cnt_f, cnt_g, cnt_h} <= 0;
      {c_a, c_b, c_c, c_d, c_e, c_f, c_g, c_h} <= 0;
      // w_addr <= mux32((`SORT_ELM>>1), 0, phase[0]);
      // radr_a <= ((`SELM_PER_WAY>>3)*0);
      // radr_b <= ((`SELM_PER_WAY>>3)*1);
      // radr_c <= ((`SELM_PER_WAY>>3)*2);
      // radr_d <= ((`SELM_PER_WAY>>3)*3);
      // radr_e <= ((`SELM_PER_WAY>>3)*4);
      // radr_f <= ((`SELM_PER_WAY>>3)*5);
      // radr_g <= ((`SELM_PER_WAY>>3)*6);
      // radr_h <= ((`SELM_PER_WAY>>3)*7);
      // radr_i <= ((`SELM_PER_WAY>>3)*8);
      // radr_j <= ((`SELM_PER_WAY>>3)*9);
      // radr_k <= ((`SELM_PER_WAY>>3)*10);
      // radr_l <= ((`SELM_PER_WAY>>3)*11);
      // radr_m <= ((`SELM_PER_WAY>>3)*12);
      // radr_n <= ((`SELM_PER_WAY>>3)*13);
      // radr_o <= ((`SELM_PER_WAY>>3)*14);
      // radr_p <= ((`SELM_PER_WAY>>3)*15);
      // {cnt_a, cnt_b, cnt_c, cnt_d, cnt_e, cnt_f, cnt_g, cnt_h, cnt_i, cnt_j, cnt_k, cnt_l, cnt_m, cnt_n, cnt_o, cnt_p} <= 0;
      // {c_a, c_b, c_c, c_d, c_e, c_f, c_g, c_h, c_i, c_j, c_k, c_l, c_m, c_n, c_o, c_p} <= 0;
    end else begin
      case (state)
        0: begin ///// Initialize memory, write data to DRAM
          state <= !(phase_zero);
          if (d_req != 0) d_req <= 0;
          else if (!d_busy) begin
            if (OB_req) begin
              d_req     <= `DRAM_REQ_WRITE;   //
              d_blocks  <= `DRAM_WBLOCKS;     //
              d_initadr <= w_addr;            //
              w_addr    <= w_addr + (`D_WS);  // address for the next write
            end
          end
        end
        1: begin ///// request arbitration
          if (!d_busy) begin
            if      (ib00_req[1] && !c_a) begin req<=8'h01; state<=3; end // first priority
            else if (ib01_req[1] && !c_b) begin req<=8'h02; state<=3; end //
            else if (ib02_req[1] && !c_c) begin req<=8'h04; state<=3; end //
            else if (ib03_req[1] && !c_d) begin req<=8'h08; state<=3; end //
            else if (ib04_req[1] && !c_e) begin req<=8'h10; state<=3; end //
            else if (ib05_req[1] && !c_f) begin req<=8'h20; state<=3; end //
            else if (ib06_req[1] && !c_g) begin req<=8'h40; state<=3; end //
            else if (ib07_req[1] && !c_h) begin req<=8'h80; state<=3; end //
            else                                            state<=2;
            // if      (ib00_req[1] && !c_a) begin req<=16'h0001; state<=3; end // first priority
            // else if (ib01_req[1] && !c_b) begin req<=16'h0002; state<=3; end //
            // else if (ib02_req[1] && !c_c) begin req<=16'h0004; state<=3; end //
            // else if (ib03_req[1] && !c_d) begin req<=16'h0008; state<=3; end //
            // else if (ib04_req[1] && !c_e) begin req<=16'h0010; state<=3; end //
            // else if (ib05_req[1] && !c_f) begin req<=16'h0020; state<=3; end //
            // else if (ib06_req[1] && !c_g) begin req<=16'h0040; state<=3; end //
            // else if (ib07_req[1] && !c_h) begin req<=16'h0080; state<=3; end //
            // else if (ib08_req[1] && !c_i) begin req<=16'h0100; state<=3; end //
            // else if (ib09_req[1] && !c_j) begin req<=16'h0200; state<=3; end //
            // else if (ib10_req[1] && !c_k) begin req<=16'h0400; state<=3; end //
            // else if (ib11_req[1] && !c_l) begin req<=16'h0800; state<=3; end //
            // else if (ib12_req[1] && !c_m) begin req<=16'h1000; state<=3; end //
            // else if (ib13_req[1] && !c_n) begin req<=16'h2000; state<=3; end //
            // else if (ib14_req[1] && !c_o) begin req<=16'h4000; state<=3; end //
            // else if (ib15_req[1] && !c_p) begin req<=16'h8000; state<=3; end //
            // else                                               state<=2;
          end
        end
        2: begin ///// request arbitration
          if (!d_busy) begin
            if      (ib00_req[0] && !c_a) begin req<=8'h01; state<=3; end // second priority
            else if (ib01_req[0] && !c_b) begin req<=8'h02; state<=3; end //
            else if (ib02_req[0] && !c_c) begin req<=8'h04; state<=3; end //
            else if (ib03_req[0] && !c_d) begin req<=8'h08; state<=3; end //
            else if (ib04_req[0] && !c_e) begin req<=8'h10; state<=3; end //
            else if (ib05_req[0] && !c_f) begin req<=8'h20; state<=3; end //
            else if (ib06_req[0] && !c_g) begin req<=8'h40; state<=3; end //
            else if (ib07_req[0] && !c_h) begin req<=8'h80; state<=3; end //
            else if (OB_req)              begin             state<=4; end // WRITE
            // if      (ib00_req[0] && !c_a) begin req<=16'h0001; state<=3; end // second priority
            // else if (ib01_req[0] && !c_b) begin req<=16'h0002; state<=3; end //
            // else if (ib02_req[0] && !c_c) begin req<=16'h0004; state<=3; end //
            // else if (ib03_req[0] && !c_d) begin req<=16'h0008; state<=3; end //
            // else if (ib04_req[0] && !c_e) begin req<=16'h0010; state<=3; end //
            // else if (ib05_req[0] && !c_f) begin req<=16'h0020; state<=3; end //
            // else if (ib06_req[0] && !c_g) begin req<=16'h0040; state<=3; end //
            // else if (ib07_req[0] && !c_h) begin req<=16'h0080; state<=3; end //
            // else if (ib08_req[0] && !c_i) begin req<=16'h0100; state<=3; end //
            // else if (ib09_req[0] && !c_j) begin req<=16'h0200; state<=3; end //
            // else if (ib10_req[0] && !c_k) begin req<=16'h0400; state<=3; end //
            // else if (ib11_req[0] && !c_l) begin req<=16'h0800; state<=3; end //
            // else if (ib12_req[0] && !c_m) begin req<=16'h1000; state<=3; end //
            // else if (ib13_req[0] && !c_n) begin req<=16'h2000; state<=3; end //
            // else if (ib14_req[0] && !c_o) begin req<=16'h4000; state<=3; end //
            // else if (ib15_req[0] && !c_p) begin req<=16'h8000; state<=3; end //
            // else if (OB_req)              begin                state<=4; end // WRITE
          end
        end
        3: begin ///// READ data from DRAM
          if (d_req!=0) begin d_req<=0; state<=1; end
          else if (!d_busy) begin
            case (req)
              8'h01: begin
                d_initadr <= mux32(radr_a, (radr_a | (`SORT_ELM>>1)), phase[0]);
                radr_a    <= radr_a+(`D_RS);
                cnt_a     <= cnt_a+1;
                c_a       <= (cnt_a>=`WAY_CN_);
              end
              8'h02: begin
                d_initadr <= mux32(radr_b, (radr_b | (`SORT_ELM>>1)), phase[0]);
                radr_b    <= radr_b+(`D_RS);
                cnt_b     <= cnt_b+1;
                c_b       <= (cnt_b>=`WAY_CN_);
              end
              8'h04: begin
                d_initadr <= mux32(radr_c, (radr_c | (`SORT_ELM>>1)), phase[0]);
                radr_c    <= radr_c+(`D_RS);
                cnt_c     <= cnt_c+1;
                c_c       <= (cnt_c>=`WAY_CN_);
              end
              8'h08: begin
                d_initadr <= mux32(radr_d, (radr_d | (`SORT_ELM>>1)), phase[0]);
                radr_d    <= radr_d+(`D_RS);
                cnt_d     <= cnt_d+1;
                c_d       <= (cnt_d>=`WAY_CN_);
              end
              8'h10: begin
                d_initadr <= mux32(radr_e, (radr_e | (`SORT_ELM>>1)), phase[0]);
                radr_e    <= radr_e+(`D_RS);
                cnt_e     <= cnt_e+1;
                c_e       <= (cnt_e>=`WAY_CN_);
              end
              8'h20: begin
                d_initadr <= mux32(radr_f, (radr_f | (`SORT_ELM>>1)), phase[0]);
                radr_f    <= radr_f+(`D_RS);
                cnt_f     <= cnt_f+1;
                c_f       <= (cnt_f>=`WAY_CN_);
              end
              8'h40: begin
                d_initadr <= mux32(radr_g, (radr_g | (`SORT_ELM>>1)), phase[0]);
                radr_g    <= radr_g+(`D_RS);
                cnt_g     <= cnt_g+1;
                c_g       <= (cnt_g>=`WAY_CN_);
              end
              8'h80: begin
                d_initadr <= mux32(radr_h, (radr_h | (`SORT_ELM>>1)), phase[0]);
                radr_h    <= radr_h+(`D_RS);
                cnt_h     <= cnt_h+1;
                c_h       <= (cnt_h>=`WAY_CN_);
              end
            endcase
            // case (req)
            //   16'h0001: begin
            //     d_initadr <= mux32(radr_a, (radr_a | (`SORT_ELM>>1)), phase[0]);
            //     radr_a    <= radr_a+(`D_RS);
            //     cnt_a     <= cnt_a+1;
            //     c_a       <= (cnt_a>=`WAY_CN_);
            //   end
            //   16'h0002: begin
            //     d_initadr <= mux32(radr_b, (radr_b | (`SORT_ELM>>1)), phase[0]);
            //     radr_b    <= radr_b+(`D_RS);
            //     cnt_b     <= cnt_b+1;
            //     c_b       <= (cnt_b>=`WAY_CN_);
            //   end
            //   16'h0004: begin
            //     d_initadr <= mux32(radr_c, (radr_c | (`SORT_ELM>>1)), phase[0]);
            //     radr_c    <= radr_c+(`D_RS);
            //     cnt_c     <= cnt_c+1;
            //     c_c       <= (cnt_c>=`WAY_CN_);
            //   end
            //   16'h0008: begin
            //     d_initadr <= mux32(radr_d, (radr_d | (`SORT_ELM>>1)), phase[0]);
            //     radr_d    <= radr_d+(`D_RS);
            //     cnt_d     <= cnt_d+1;
            //     c_d       <= (cnt_d>=`WAY_CN_);
            //   end
            //   16'h0010: begin
            //     d_initadr <= mux32(radr_e, (radr_e | (`SORT_ELM>>1)), phase[0]);
            //     radr_e    <= radr_e+(`D_RS);
            //     cnt_e     <= cnt_e+1;
            //     c_e       <= (cnt_e>=`WAY_CN_);
            //   end
            //   16'h0020: begin
            //     d_initadr <= mux32(radr_f, (radr_f | (`SORT_ELM>>1)), phase[0]);
            //     radr_f    <= radr_f+(`D_RS);
            //     cnt_f     <= cnt_f+1;
            //     c_f       <= (cnt_f>=`WAY_CN_);
            //   end
            //   16'h0040: begin
            //     d_initadr <= mux32(radr_g, (radr_g | (`SORT_ELM>>1)), phase[0]);
            //     radr_g    <= radr_g+(`D_RS);
            //     cnt_g     <= cnt_g+1;
            //     c_g       <= (cnt_g>=`WAY_CN_);
            //   end
            //   16'h0080: begin
            //     d_initadr <= mux32(radr_h, (radr_h | (`SORT_ELM>>1)), phase[0]);
            //     radr_h    <= radr_h+(`D_RS);
            //     cnt_h     <= cnt_h+1;
            //     c_h       <= (cnt_h>=`WAY_CN_);
            //   end
            //   16'h0100: begin
            //     d_initadr <= mux32(radr_i, (radr_i | (`SORT_ELM>>1)), phase[0]);
            //     radr_i    <= radr_i+(`D_RS);
            //     cnt_i     <= cnt_i+1;
            //     c_i       <= (cnt_i>=`WAY_CN_);
            //   end
            //   16'h0200: begin
            //     d_initadr <= mux32(radr_j, (radr_j | (`SORT_ELM>>1)), phase[0]);
            //     radr_j    <= radr_j+(`D_RS);
            //     cnt_j     <= cnt_j+1;
            //     c_j       <= (cnt_j>=`WAY_CN_);
            //   end
            //   16'h0400: begin
            //     d_initadr <= mux32(radr_k, (radr_k | (`SORT_ELM>>1)), phase[0]);
            //     radr_k    <= radr_k+(`D_RS);
            //     cnt_k     <= cnt_k+1;
            //     c_k       <= (cnt_k>=`WAY_CN_);
            //   end
            //   16'h0800: begin
            //     d_initadr <= mux32(radr_l, (radr_l | (`SORT_ELM>>1)), phase[0]);
            //     radr_l    <= radr_l+(`D_RS);
            //     cnt_l     <= cnt_l+1;
            //     c_l       <= (cnt_l>=`WAY_CN_);
            //   end
            //   16'h1000: begin
            //     d_initadr <= mux32(radr_m, (radr_m | (`SORT_ELM>>1)), phase[0]);
            //     radr_m    <= radr_m+(`D_RS);
            //     cnt_m     <= cnt_m+1;
            //     c_m       <= (cnt_m>=`WAY_CN_);
            //   end
            //   16'h2000: begin
            //     d_initadr <= mux32(radr_n, (radr_n | (`SORT_ELM>>1)), phase[0]);
            //     radr_n    <= radr_n+(`D_RS);
            //     cnt_n     <= cnt_n+1;
            //     c_n       <= (cnt_n>=`WAY_CN_);
            //   end
            //   16'h4000: begin
            //     d_initadr <= mux32(radr_o, (radr_o | (`SORT_ELM>>1)), phase[0]);
            //     radr_o    <= radr_o+(`D_RS);
            //     cnt_o     <= cnt_o+1;
            //     c_o       <= (cnt_o>=`WAY_CN_);
            //   end
            //   16'h8000: begin
            //     d_initadr <= mux32(radr_p, (radr_p | (`SORT_ELM>>1)), phase[0]);
            //     radr_p    <= radr_p+(`D_RS);
            //     cnt_p     <= cnt_p+1;
            //     c_p       <= (cnt_p>=`WAY_CN_);
            //   end
            // endcase
            d_req    <= `DRAM_REQ_READ;
            d_blocks <= `DRAM_RBLOCKS;
            req_t    <= req;
          end
        end
        4: begin ///// WRITE data to DRAM
          if (d_req!=0) begin d_req<=0; state<=1; end
          else if (!d_busy) begin
            d_req     <= `DRAM_REQ_WRITE;   //
            d_blocks  <= `DRAM_WBLOCKS;     //
            d_initadr <= w_addr;            //
            w_addr    <= w_addr + (`D_WS);  // address for the next write
          end
        end
      endcase
    end
  end
  always @(posedge CLK) begin
    // Stage 0
    dout_ta <= mux512(d_dout, stnet_dout, phase_zero);
    dout_tb <= mux512(d_dout, stnet_dout, phase_zero);
    doen_ta <= mux1(d_douten, stnet_douten, phase_zero);
    doen_tb <= mux1(d_douten, stnet_douten, phase_zero);
    req_ta  <= req_t;
    // Stage 1
    dout_tc <= dout_ta;
    dout_td <= dout_ta;
    dout_te <= dout_tb;
    dout_tf <= dout_tb;
    doen_tc <= doen_ta;
    doen_td <= doen_ta;
    doen_te <= doen_tb;
    doen_tf <= doen_tb;
    req_tb  <= req_ta;
  end
  // for phase
  // ###########################################################################
  always @(posedge CLK) begin
    if (RST) begin
      phase <= 0;
    end else begin
      if (elem==`SORT_ELM) phase <= phase + 1;
    end
  end
  // for elem
  // ###########################################################################
  always @(posedge CLK) begin
    if (RST) begin
      elem <= 0;
    end else begin
      case ({OB_deq, (elem==`SORT_ELM)})
        2'b01: elem <= 0;
        2'b10: elem <= elem + 16;
      endcase
    end
  end
  // for iter_done
  // ###########################################################################
  always @(posedge CLK) iter_done <= (ecnt==8);
  // for pchange
  // ###########################################################################
  always @(posedge CLK) pchange <= (elem==`SORT_ELM);
  // for irst
  // ###########################################################################
  always @(posedge CLK) irst <= (ecnt==8) || pchange;
  // for frst
  // ###########################################################################
  always @(posedge CLK) frst <= RST || (ecnt==8) || (elem==`SORT_ELM);
  // for ecnt
  // ###########################################################################
  always @(posedge CLK) begin
    if (RST || iter_done || pchange) begin
      ecnt <= ((`ELEMS_PER_UNIT<<`WAY_LOG) << (phase * `WAY_LOG));
    end else begin
      if (ecnt!=0 && F01_deq) ecnt <= ecnt - 4;
    end
  end
  // for phase zero
  // ###########################################################################
  always @(posedge CLK) phase_zero <= (phase == 0);
  // for last phase
  // ###########################################################################
  always @(posedge CLK) last_phase <= (phase == `LAST_PHASE);
  // for debug
  // ###########################################################################
  // (* mark_debug = "true" *) reg [31:0] dcnt;
  // always @(posedge CLK) begin
  //   if (RST) begin
  //     dcnt <= 0;
  //   end else begin
  //     case ({F01_deq, (dcnt==`SORT_ELM)})
  //       2'b01: dcnt <= 0;
  //       2'b10: dcnt <= dcnt + 4;
  //     endcase
  //   end
  // end
endmodule