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
  wire [`DRAMW-1:0]   OB_dot_a, OB_dot_b;
  wire                OB_req_a, OB_req_b;
  wire                OB_full_a, OB_full_b;
  reg  OB_granted_a, OB_granted_b;
  wire OB_deq_a = d_w && OB_granted_a;
  wire OB_deq_b = d_w && OB_granted_b;
  assign d_din = mux512(OB_dot_b, OB_dot_a, OB_granted_a);
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
  reg [`SORT_WAY-1:0] req_a, req_b;
  reg [`SORT_WAY-1:0] req_ta;
  reg [`SORT_WAY-1:0] req_tb;
  reg [`SORT_WAY-1:0] req_taa;  //
  reg [`SORT_WAY-1:0] req_tab;  //
  reg [`SORT_WAY-1:0] req_tba;  //
  reg [`SORT_WAY-1:0] req_tbb;  //
  reg [`SRTP_WAY-1:0] req_pzero;
  wire [`SORT_WAY-1:0] im_req_a;
  wire [`SORT_WAY-1:0] im_req_b;
  wire [`SRTP_WAY-1:0] rxw;
  reg [31:0]          elem_a, elem_b;       // sorted elements in a phase
  reg [`PHASE_W]      phase_a, phase_b;      //
  reg                 pchange_a, pchange_b;    // phase_change to reset some registers
  reg                 iter_done_a, iter_done_b;  //
  reg [31:0]          ecnt_a, ecnt_b;       // sorted elements in an iteration
  reg                 irst_a, irst_b;       // INBUF reset
  reg                 frst_a, frst_b;       // sort-tree FIFO reset
  reg                 plast_a, plast_b;
  reg                 phase_zero;
  reg                 last_phase;
  reg RSTa, RSTb;
  always @(posedge CLK) RSTa <= RST_IN;
  always @(posedge CLK) RSTb <= RST_IN;
  wire [`MERGW-1:0] d00_a, d01_a, d02_a, d03_a, d04_a, d05_a, d06_a, d07_a;
  wire [1:0] ib00_req_a, ib01_req_a, ib02_req_a, ib03_req_a, ib04_req_a, ib05_req_a, ib06_req_a, ib07_req_a;
  wire [`MERGW-1:0] d00_b, d01_b, d02_b, d03_b, d04_b, d05_b, d06_b, d07_b;
  wire [1:0] ib00_req_b, ib01_req_b, ib02_req_b, ib03_req_b, ib04_req_b, ib05_req_b, ib06_req_b, ib07_req_b;
  (* mark_debug = "true" *) wire       rsltbuf_enq;
  (* mark_debug = "true" *) wire       rsltbuf_deq;
                            wire       rsltbuf_emp;
                            wire       rsltbuf_ful;
  (* mark_debug = "true" *) wire [4:0] rsltbuf_cnt;
  wire F01_emp_a, F01_emp_b;
  wire F01_deq_a = mux1((~|{F01_emp_a,OB_full_a}), (~|{F01_emp_a,rsltbuf_ful}), last_phase);
  wire F01_deq_b = (~|{F01_emp_b,OB_full_b});
  wire [`MERGW-1:0] F01_dot_a, F01_dot_b;
  wire [`MERGW*`SORT_WAY-1:0] s_din_a = {d00_a, d01_a, d02_a, d03_a, d04_a, d05_a, d06_a, d07_a};
  wire [`MERGW*`SORT_WAY-1:0] s_din_b = {d00_b, d01_b, d02_b, d03_b, d04_b, d05_b, d06_b, d07_b};
  wire [`SORT_WAY-1:0] enq_a, enq_b;
  wire [`SORT_WAY-1:0] s_ful_a, s_ful_b;
  wire [`DRAMW-1:0] stnet_dout;
  wire              stnet_douten;
  SORTINGNETWORK sortingnetwork(CLK, RSTa, rx_data_valid, rx_data, stnet_dout, stnet_douten);
  always @(posedge CLK) begin
    if      (RSTa)    req_pzero <= 1;
    else if (doen_tc) req_pzero <= {req_pzero[`SRTP_WAY-2:0],req_pzero[`SRTP_WAY-1]};
  end
  assign im_req_a = mux_sortway(req_tab, req_pzero[`SORT_WAY-1:0], phase_zero);
  assign im_req_b = mux_sortway(req_tbb, req_pzero[`SRTP_WAY-1:`SORT_WAY], phase_zero);
  INMOD2 im00_a(CLK, RSTa, dout_tc, doen_tc & im_req_a[0],  s_ful_a[0],  rxw[0],  d00_a, enq_a[0],  ib00_req_a);
  INMOD2 im01_a(CLK, RSTa, dout_tc, doen_tc & im_req_a[1],  s_ful_a[1],  rxw[1],  d01_a, enq_a[1],  ib01_req_a);
  INMOD2 im02_a(CLK, RSTa, dout_td, doen_td & im_req_a[2],  s_ful_a[2],  rxw[2],  d02_a, enq_a[2],  ib02_req_a);
  INMOD2 im03_a(CLK, RSTa, dout_td, doen_td & im_req_a[3],  s_ful_a[3],  rxw[3],  d03_a, enq_a[3],  ib03_req_a);
  INMOD2 im04_a(CLK, RSTa, dout_te, doen_te & im_req_a[4],  s_ful_a[4],  rxw[4],  d04_a, enq_a[4],  ib04_req_a);
  INMOD2 im05_a(CLK, RSTa, dout_te, doen_te & im_req_a[5],  s_ful_a[5],  rxw[5],  d05_a, enq_a[5],  ib05_req_a);
  INMOD2 im06_a(CLK, RSTa, dout_tf, doen_tf & im_req_a[6],  s_ful_a[6],  rxw[6],  d06_a, enq_a[6],  ib06_req_a);
  INMOD2 im07_a(CLK, RSTa, dout_tf, doen_tf & im_req_a[7],  s_ful_a[7],  rxw[7],  d07_a, enq_a[7],  ib07_req_a);
  INMOD2 im00_b(CLK, RSTb, dout_tc, doen_tc & im_req_b[0],  s_ful_b[0],  rxw[8],  d00_b, enq_b[0],  ib00_req_b);
  INMOD2 im01_b(CLK, RSTb, dout_tc, doen_tc & im_req_b[1],  s_ful_b[1],  rxw[9],  d01_b, enq_b[1],  ib01_req_b);
  INMOD2 im02_b(CLK, RSTb, dout_td, doen_td & im_req_b[2],  s_ful_b[2],  rxw[10], d02_b, enq_b[2],  ib02_req_b);
  INMOD2 im03_b(CLK, RSTb, dout_td, doen_td & im_req_b[3],  s_ful_b[3],  rxw[11], d03_b, enq_b[3],  ib03_req_b);
  INMOD2 im04_b(CLK, RSTb, dout_te, doen_te & im_req_b[4],  s_ful_b[4],  rxw[12], d04_b, enq_b[4],  ib04_req_b);
  INMOD2 im05_b(CLK, RSTb, dout_te, doen_te & im_req_b[5],  s_ful_b[5],  rxw[13], d05_b, enq_b[5],  ib05_req_b);
  INMOD2 im06_b(CLK, RSTb, dout_tf, doen_tf & im_req_b[6],  s_ful_b[6],  rxw[14], d06_b, enq_b[6],  ib06_req_b);
  INMOD2 im07_b(CLK, RSTb, dout_tf, doen_tf & im_req_b[7],  s_ful_b[7],  rxw[15], d07_b, enq_b[7],  ib07_req_b);
  assign rx_wait = |rxw;
  STREE stree_a(CLK, RSTa, irst_a, frst_a, phase_a, s_din_a, enq_a, s_ful_a, F01_deq_a, F01_dot_a, F01_emp_a);
  STREE stree_b(CLK, RSTb, irst_b, frst_b, phase_b, s_din_b, enq_b, s_ful_b, F01_deq_b, F01_dot_b, F01_emp_b);
  OTMOD ob_a(CLK, RSTa, (!last_phase && F01_deq_a), F01_dot_a, OB_deq_a, OB_dot_a, OB_full_a, OB_req_a);
  OTMOD ob_b(CLK, RSTb, F01_deq_b, F01_dot_b, OB_deq_b, OB_dot_b, OB_full_b, OB_req_b);
  assign rsltbuf_enq = last_phase && F01_deq_a;
  assign rsltbuf_deq = chnl_tx_data_ren && chnl_tx_data_valid;
  SRL_FIFO #(4, `MERGW) rsltbuf(CLK, RSTa, rsltbuf_enq, rsltbuf_deq, F01_dot_a,
                                rslt, rsltbuf_emp, rsltbuf_ful, rsltbuf_cnt);
  assign rslt_ready = !rsltbuf_emp;
  /***** dram READ/WRITE controller                                                         *****/
  reg [31:0] w_addr; //
  reg [31:0] w_addr_pzero; //
  reg [31:0] w_addr_a, w_addr_b;
  reg [3:0]  state;  // state
  reg [31:0] radr_a, radr_b, radr_c, radr_d, radr_e, radr_f, radr_g, radr_h;
  reg [31:0] radr_a_a, radr_b_a, radr_c_a, radr_d_a, radr_e_a, radr_f_a, radr_g_a, radr_h_a;
  reg [31:0] radr_a_b, radr_b_b, radr_c_b, radr_d_b, radr_e_b, radr_f_b, radr_g_b, radr_h_b;
  reg [27:0] cnt_a, cnt_b, cnt_c, cnt_d, cnt_e, cnt_f, cnt_g, cnt_h;
  reg [27:0] cnt_a_a, cnt_b_a, cnt_c_a, cnt_d_a, cnt_e_a, cnt_f_a, cnt_g_a, cnt_h_a;
  reg [27:0] cnt_a_b, cnt_b_b, cnt_c_b, cnt_d_b, cnt_e_b, cnt_f_b, cnt_g_b, cnt_h_b;
  reg        c_a, c_b, c_c, c_d, c_e, c_f, c_g, c_h; // counter is full ?
  reg        c_a_a, c_b_a, c_c_a, c_d_a, c_e_a, c_f_a, c_g_a, c_h_a;
  reg        c_a_b, c_b_b, c_c_b, c_d_b, c_e_b, c_f_b, c_g_b, c_h_b;
  always @(posedge CLK) begin
    if (RSTa || pchange_a || pchange_b) begin
      if (RSTa) state <= 0;
      if (RSTa) {d_req, d_initadr, d_blocks} <= 0;
      if (RSTa) w_addr_pzero <= (`SORT_ELM>>1);
      req <= 0;
      w_addr <= mux32((`SORT_ELM>>1), 0, phase_a[0]);
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
      if ((RSTa || pchange_a) && !plast_a) begin
        req_a <= 0;
        w_addr_a  <= mux32((`SORT_ELM>>1), 0, phase_a[0]);
        radr_a_a  <= ((`SELM_PER_WAY>>(`P_LOG+3))*0);
        radr_b_a  <= ((`SELM_PER_WAY>>(`P_LOG+3))*1);
        radr_c_a  <= ((`SELM_PER_WAY>>(`P_LOG+3))*2);
        radr_d_a  <= ((`SELM_PER_WAY>>(`P_LOG+3))*3);
        radr_e_a  <= ((`SELM_PER_WAY>>(`P_LOG+3))*4);
        radr_f_a  <= ((`SELM_PER_WAY>>(`P_LOG+3))*5);
        radr_g_a  <= ((`SELM_PER_WAY>>(`P_LOG+3))*6);
        radr_h_a  <= ((`SELM_PER_WAY>>(`P_LOG+3))*7);
        {cnt_a_a, cnt_b_a, cnt_c_a, cnt_d_a, cnt_e_a, cnt_f_a, cnt_g_a, cnt_h_a} <= 0;
        {c_a_a, c_b_a, c_c_a, c_d_a, c_e_a, c_f_a, c_g_a, c_h_a} <= 0;
        OB_granted_a <= 0;
      end
      if ((RSTa || pchange_b) && !plast_b) begin
        req_b <= 0;
        w_addr_b  <= mux32(((`SORT_ELM>>2) | (`SORT_ELM>>1)), (`SORT_ELM>>2), phase_b[0]);
        radr_a_b  <= ((`SELM_PER_WAY>>(`P_LOG+3))*0) | (`SORT_ELM>>2);
        radr_b_b  <= ((`SELM_PER_WAY>>(`P_LOG+3))*1) | (`SORT_ELM>>2);
        radr_c_b  <= ((`SELM_PER_WAY>>(`P_LOG+3))*2) | (`SORT_ELM>>2);
        radr_d_b  <= ((`SELM_PER_WAY>>(`P_LOG+3))*3) | (`SORT_ELM>>2);
        radr_e_b  <= ((`SELM_PER_WAY>>(`P_LOG+3))*4) | (`SORT_ELM>>2);
        radr_f_b  <= ((`SELM_PER_WAY>>(`P_LOG+3))*5) | (`SORT_ELM>>2);
        radr_g_b  <= ((`SELM_PER_WAY>>(`P_LOG+3))*6) | (`SORT_ELM>>2);
        radr_h_b  <= ((`SELM_PER_WAY>>(`P_LOG+3))*7) | (`SORT_ELM>>2);
        {cnt_a_b, cnt_b_b, cnt_c_b, cnt_d_b, cnt_e_b, cnt_f_b, cnt_g_b, cnt_h_b} <= 0;
        {c_a_b, c_b_b, c_c_b, c_d_b, c_e_b, c_f_b, c_g_b, c_h_b} <= 0;
        OB_granted_b <= 0;
      end
    end else begin
      case (state)
        0: begin ///// Initialize memory, write data to DRAM
          if (!phase_zero) state <= 4;
          if (d_req != 0) d_req <= 0;
          else if (!d_busy) begin
            if (OB_req_a || OB_req_b) begin
              d_req     <= `DRAM_REQ_WRITE;   //
              d_blocks  <= `DRAM_WBLOCKS;     //
              d_initadr    <= w_addr_pzero;            //
              w_addr_pzero <= w_addr_pzero + (`D_WS);  // address for the next write
              if      (OB_req_a) begin OB_granted_a <= 1; OB_granted_b <= 0; end
              else if (OB_req_b) begin OB_granted_a <= 0; OB_granted_b <= 1; end
            end
          end
        end
        1: begin ///// request arbitration
          if (!d_busy) begin
            if      (ib00_req_a[1] && !c_a) begin req<=8'h01; state<=3; end // first priority
            else if (ib01_req_a[1] && !c_b) begin req<=8'h02; state<=3; end //
            else if (ib02_req_a[1] && !c_c) begin req<=8'h04; state<=3; end //
            else if (ib03_req_a[1] && !c_d) begin req<=8'h08; state<=3; end //
            else if (ib04_req_a[1] && !c_e) begin req<=8'h10; state<=3; end //
            else if (ib05_req_a[1] && !c_f) begin req<=8'h20; state<=3; end //
            else if (ib06_req_a[1] && !c_g) begin req<=8'h40; state<=3; end //
            else if (ib07_req_a[1] && !c_h) begin req<=8'h80; state<=3; end //
            else                                              state<=2;
          end
        end
        2: begin ///// request arbitration
          if (!d_busy) begin
            if      (ib00_req_a[0] && !c_a) begin req<=8'h01; state<=3; end // second priority
            else if (ib01_req_a[0] && !c_b) begin req<=8'h02; state<=3; end //
            else if (ib02_req_a[0] && !c_c) begin req<=8'h04; state<=3; end //
            else if (ib03_req_a[0] && !c_d) begin req<=8'h08; state<=3; end //
            else if (ib04_req_a[0] && !c_e) begin req<=8'h10; state<=3; end //
            else if (ib05_req_a[0] && !c_f) begin req<=8'h20; state<=3; end //
            else if (ib06_req_a[0] && !c_g) begin req<=8'h40; state<=3; end //
            else if (ib07_req_a[0] && !c_h) begin req<=8'h80; state<=3; end //
          end
        end
        3: begin ///// READ data from DRAM
          if (d_req!=0) begin d_req<=0; state<=1; end
          else if (!d_busy) begin
            case (req)
              8'h01: begin
                d_initadr <= mux32(radr_a, (radr_a | (`SORT_ELM>>1)), phase_a[0]);
                radr_a    <= radr_a+(`D_RS);
                cnt_a     <= cnt_a+1;
                c_a       <= (cnt_a>=`WAY_CN_);
              end
              8'h02: begin
                d_initadr <= mux32(radr_b, (radr_b | (`SORT_ELM>>1)), phase_a[0]);
                radr_b    <= radr_b+(`D_RS);
                cnt_b     <= cnt_b+1;
                c_b       <= (cnt_b>=`WAY_CN_);
              end
              8'h04: begin
                d_initadr <= mux32(radr_c, (radr_c | (`SORT_ELM>>1)), phase_a[0]);
                radr_c    <= radr_c+(`D_RS);
                cnt_c     <= cnt_c+1;
                c_c       <= (cnt_c>=`WAY_CN_);
              end
              8'h08: begin
                d_initadr <= mux32(radr_d, (radr_d | (`SORT_ELM>>1)), phase_a[0]);
                radr_d    <= radr_d+(`D_RS);
                cnt_d     <= cnt_d+1;
                c_d       <= (cnt_d>=`WAY_CN_);
              end
              8'h10: begin
                d_initadr <= mux32(radr_e, (radr_e | (`SORT_ELM>>1)), phase_a[0]);
                radr_e    <= radr_e+(`D_RS);
                cnt_e     <= cnt_e+1;
                c_e       <= (cnt_e>=`WAY_CN_);
              end
              8'h20: begin
                d_initadr <= mux32(radr_f, (radr_f | (`SORT_ELM>>1)), phase_a[0]);
                radr_f    <= radr_f+(`D_RS);
                cnt_f     <= cnt_f+1;
                c_f       <= (cnt_f>=`WAY_CN_);
              end
              8'h40: begin
                d_initadr <= mux32(radr_g, (radr_g | (`SORT_ELM>>1)), phase_a[0]);
                radr_g    <= radr_g+(`D_RS);
                cnt_g     <= cnt_g+1;
                c_g       <= (cnt_g>=`WAY_CN_);
              end
              8'h80: begin
                d_initadr <= mux32(radr_h, (radr_h | (`SORT_ELM>>1)), phase_a[0]);
                radr_h    <= radr_h+(`D_RS);
                cnt_h     <= cnt_h+1;
                c_h       <= (cnt_h>=`WAY_CN_);
              end
            endcase
            d_req    <= `DRAM_REQ_READ;
            d_blocks <= `DRAM_RBLOCKS;
            req_ta   <= req;
            req_tb   <= 0;
          end
        end
        4: begin
          if (!d_busy) begin
            if      (ib00_req_a[1] && !c_a_a) begin req_a<=8'h01; req_b<=0; state<=6; end // first priority
            else if (ib01_req_a[1] && !c_b_a) begin req_a<=8'h02; req_b<=0; state<=6; end //
            else if (ib02_req_a[1] && !c_c_a) begin req_a<=8'h04; req_b<=0; state<=6; end //
            else if (ib03_req_a[1] && !c_d_a) begin req_a<=8'h08; req_b<=0; state<=6; end //
            else if (ib04_req_a[1] && !c_e_a) begin req_a<=8'h10; req_b<=0; state<=6; end // first priority
            else if (ib05_req_a[1] && !c_f_a) begin req_a<=8'h20; req_b<=0; state<=6; end //
            else if (ib06_req_a[1] && !c_g_a) begin req_a<=8'h40; req_b<=0; state<=6; end //
            else if (ib07_req_a[1] && !c_h_a) begin req_a<=8'h80; req_b<=0; state<=6; end //
            else if (ib00_req_b[1] && !c_a_b) begin req_b<=8'h01; req_a<=0; state<=6; end // first priority
            else if (ib01_req_b[1] && !c_b_b) begin req_b<=8'h02; req_a<=0; state<=6; end //
            else if (ib02_req_b[1] && !c_c_b) begin req_b<=8'h04; req_a<=0; state<=6; end //
            else if (ib03_req_b[1] && !c_d_b) begin req_b<=8'h08; req_a<=0; state<=6; end //
            else if (ib04_req_b[1] && !c_e_b) begin req_b<=8'h10; req_a<=0; state<=6; end // first priority
            else if (ib05_req_b[1] && !c_f_b) begin req_b<=8'h20; req_a<=0; state<=6; end //
            else if (ib06_req_b[1] && !c_g_b) begin req_b<=8'h40; req_a<=0; state<=6; end //
            else if (ib07_req_b[1] && !c_h_b) begin req_b<=8'h80; req_a<=0; state<=6; end //
            else                                                            state<=5;
          end
        end
        5: begin
          if (!d_busy) begin
            if      (ib00_req_a[0] && !c_a_a) begin req_a<=8'h01; req_b<=0; state<=6; end // first priority
            else if (ib01_req_a[0] && !c_b_a) begin req_a<=8'h02; req_b<=0; state<=6; end //
            else if (ib02_req_a[0] && !c_c_a) begin req_a<=8'h04; req_b<=0; state<=6; end //
            else if (ib03_req_a[0] && !c_d_a) begin req_a<=8'h08; req_b<=0; state<=6; end //
            else if (ib04_req_a[0] && !c_e_a) begin req_a<=8'h10; req_b<=0; state<=6; end // first priority
            else if (ib05_req_a[0] && !c_f_a) begin req_a<=8'h20; req_b<=0; state<=6; end //
            else if (ib06_req_a[0] && !c_g_a) begin req_a<=8'h40; req_b<=0; state<=6; end //
            else if (ib07_req_a[0] && !c_h_a) begin req_a<=8'h80; req_b<=0; state<=6; end //
            else if (ib00_req_b[0] && !c_a_b) begin req_b<=8'h01; req_a<=0; state<=6; end // first priority
            else if (ib01_req_b[0] && !c_b_b) begin req_b<=8'h02; req_a<=0; state<=6; end //
            else if (ib02_req_b[0] && !c_c_b) begin req_b<=8'h04; req_a<=0; state<=6; end //
            else if (ib03_req_b[0] && !c_d_b) begin req_b<=8'h08; req_a<=0; state<=6; end //
            else if (ib04_req_b[0] && !c_e_b) begin req_b<=8'h10; req_a<=0; state<=6; end // first priority
            else if (ib05_req_b[0] && !c_f_b) begin req_b<=8'h20; req_a<=0; state<=6; end //
            else if (ib06_req_b[0] && !c_g_b) begin req_b<=8'h40; req_a<=0; state<=6; end //
            else if (ib07_req_b[0] && !c_h_b) begin req_b<=8'h80; req_a<=0; state<=6; end //
            else if (OB_req_a) begin OB_granted_a <= 1; OB_granted_b <= 0;  state<=7; end
            else if (OB_req_b) begin OB_granted_a <= 0; OB_granted_b <= 1;  state<=8; end
            else if (last_phase)                                            state<=1;
          end
        end
        6: begin
          if (d_req!=0) begin d_req<=0; state<=4; end
          else if (!d_busy) begin
            case ({req_b,req_a})
              16'h0001: begin
                d_initadr <= mux32(radr_a_a, (radr_a_a | (`SORT_ELM>>1)), phase_a[0]);
                radr_a_a  <= radr_a_a+(`D_RS);
                cnt_a_a   <= cnt_a_a+1;
                c_a_a     <= (cnt_a_a>=`WAYP_CN_);
              end
              16'h0002: begin
                d_initadr <= mux32(radr_b_a, (radr_b_a | (`SORT_ELM>>1)), phase_a[0]);
                radr_b_a  <= radr_b_a+(`D_RS);
                cnt_b_a   <= cnt_b_a+1;
                c_b_a     <= (cnt_b_a>=`WAYP_CN_);
              end
              16'h0004: begin
                d_initadr <= mux32(radr_c_a, (radr_c_a | (`SORT_ELM>>1)), phase_a[0]);
                radr_c_a  <= radr_c_a+(`D_RS);
                cnt_c_a   <= cnt_c_a+1;
                c_c_a     <= (cnt_c_a>=`WAYP_CN_);
              end
              16'h0008: begin
                d_initadr <= mux32(radr_d_a, (radr_d_a | (`SORT_ELM>>1)), phase_a[0]);
                radr_d_a  <= radr_d_a+(`D_RS);
                cnt_d_a   <= cnt_d_a+1;
                c_d_a     <= (cnt_d_a>=`WAYP_CN_);
              end
              16'h0010: begin
                d_initadr <= mux32(radr_e_a, (radr_e_a | (`SORT_ELM>>1)), phase_a[0]);
                radr_e_a  <= radr_e_a+(`D_RS);
                cnt_e_a   <= cnt_e_a+1;
                c_e_a     <= (cnt_e_a>=`WAYP_CN_);
              end
              16'h0020: begin
                d_initadr <= mux32(radr_f_a, (radr_f_a | (`SORT_ELM>>1)), phase_a[0]);
                radr_f_a  <= radr_f_a+(`D_RS);
                cnt_f_a   <= cnt_f_a+1;
                c_f_a     <= (cnt_f_a>=`WAYP_CN_);
              end
              16'h0040: begin
                d_initadr <= mux32(radr_g_a, (radr_g_a | (`SORT_ELM>>1)), phase_a[0]);
                radr_g_a  <= radr_g_a+(`D_RS);
                cnt_g_a   <= cnt_g_a+1;
                c_g_a     <= (cnt_g_a>=`WAYP_CN_);
              end
              16'h0080: begin
                d_initadr <= mux32(radr_h_a, (radr_h_a | (`SORT_ELM>>1)), phase_a[0]);
                radr_h_a  <= radr_h_a+(`D_RS);
                cnt_h_a   <= cnt_h_a+1;
                c_h_a     <= (cnt_h_a>=`WAYP_CN_);
              end
              16'h0100: begin
                d_initadr <= mux32(radr_a_b, (radr_a_b | (`SORT_ELM>>1)), phase_b[0]);
                radr_a_b  <= radr_a_b+(`D_RS);
                cnt_a_b   <= cnt_a_b+1;
                c_a_b     <= (cnt_a_b>=`WAYP_CN_);
              end
              16'h0200: begin
                d_initadr <= mux32(radr_b_b, (radr_b_b | (`SORT_ELM>>1)), phase_b[0]);
                radr_b_b  <= radr_b_b+(`D_RS);
                cnt_b_b   <= cnt_b_b+1;
                c_b_b     <= (cnt_b_b>=`WAYP_CN_);
              end
              16'h0400: begin
                d_initadr <= mux32(radr_c_b, (radr_c_b | (`SORT_ELM>>1)), phase_b[0]);
                radr_c_b  <= radr_c_b+(`D_RS);
                cnt_c_b   <= cnt_c_b+1;
                c_c_b     <= (cnt_c_b>=`WAYP_CN_);
              end
              16'h0800: begin
                d_initadr <= mux32(radr_d_b, (radr_d_b | (`SORT_ELM>>1)), phase_b[0]);
                radr_d_b  <= radr_d_b+(`D_RS);
                cnt_d_b   <= cnt_d_b+1;
                c_d_b     <= (cnt_d_b>=`WAYP_CN_);
              end
              16'h1000: begin
                d_initadr <= mux32(radr_e_b, (radr_e_b | (`SORT_ELM>>1)), phase_b[0]);
                radr_e_b  <= radr_e_b+(`D_RS);
                cnt_e_b   <= cnt_e_b+1;
                c_e_b     <= (cnt_e_b>=`WAYP_CN_);
              end
              16'h2000: begin
                d_initadr <= mux32(radr_f_b, (radr_f_b | (`SORT_ELM>>1)), phase_b[0]);
                radr_f_b  <= radr_f_b+(`D_RS);
                cnt_f_b   <= cnt_f_b+1;
                c_f_b     <= (cnt_f_b>=`WAYP_CN_);
              end
              16'h4000: begin
                d_initadr <= mux32(radr_g_b, (radr_g_b | (`SORT_ELM>>1)), phase_b[0]);
                radr_g_b  <= radr_g_b+(`D_RS);
                cnt_g_b   <= cnt_g_b+1;
                c_g_b     <= (cnt_g_b>=`WAYP_CN_);
              end
              16'h8000: begin
                d_initadr <= mux32(radr_h_b, (radr_h_b | (`SORT_ELM>>1)), phase_b[0]);
                radr_h_b  <= radr_h_b+(`D_RS);
                cnt_h_b   <= cnt_h_b+1;
                c_h_b     <= (cnt_h_b>=`WAYP_CN_);
              end
            endcase
            d_req    <= `DRAM_REQ_READ;
            d_blocks <= `DRAM_RBLOCKS;
            req_ta   <= req_a;
            req_tb   <= req_b;
          end
        end
        7: begin ///// WRITE data to DRAM
          if (d_req!=0) begin d_req<=0; state<=4; end
          else if (!d_busy) begin
            d_req     <= `DRAM_REQ_WRITE;     //
            d_blocks  <= `DRAM_WBLOCKS;       //
            d_initadr <= w_addr_a;            //
            w_addr_a  <= w_addr_a + (`D_WS);  // address for the next write
          end
        end
        8: begin ///// WRITE data to DRAM
          if (d_req!=0) begin d_req<=0; state<=4; end
          else if (!d_busy) begin
            d_req     <= `DRAM_REQ_WRITE;     //
            d_blocks  <= `DRAM_WBLOCKS;       //
            d_initadr <= w_addr_b;            //
            w_addr_b  <= w_addr_b + (`D_WS);  // address for the next write
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
    req_taa <= req_ta;
    req_tba <= req_tb;
    // Stage 1
    dout_tc <= dout_ta;
    dout_td <= dout_ta;
    dout_te <= dout_tb;
    dout_tf <= dout_tb;
    doen_tc <= doen_ta;
    doen_td <= doen_ta;
    doen_te <= doen_tb;
    doen_tf <= doen_tb;
    req_tab <= req_taa;
    req_tbb <= req_tba;
  end
  // for phase
  // ###########################################################################
  always @(posedge CLK) begin
    if (RSTa) begin
      phase_a <= 0;
    end else begin
      if (elem_a==`SRTP_ELM) phase_a <= phase_a+1;
    end
  end
  always @(posedge CLK) begin
    if (RSTb) begin
      phase_b <= 0;
    end else begin
      if (elem_b==`SRTP_ELM) phase_b <= phase_b+1;
    end
  end
  // for plast
  // ###########################################################################
  always @(posedge CLK) begin
    if (RSTa) begin
      plast_a <= 0;
    end else begin
      if (phase_a==`LAST_PHASE-1) plast_a <= 1;
    end
  end
  always @(posedge CLK) begin
    if (RSTb) begin
      plast_b <= 0;
    end else begin
      if (phase_b==`LAST_PHASE-1) plast_b <= 1;
    end
  end
  // for elem
  // ###########################################################################
  always @(posedge CLK) begin
    if (RSTa) begin
      elem_a <= 0;
    end else begin
      case ({OB_deq_a, (elem_a==`SRTP_ELM)})
        2'b01: elem_a <= 0;
        2'b10: elem_a <= elem_a + 16;
      endcase
    end
  end
  always @(posedge CLK) begin
    if (RSTb) begin
      elem_b <= 0;
    end else begin
      case ({OB_deq_b, (elem_b==`SRTP_ELM)})
        2'b01: elem_b <= 0;
        2'b10: elem_b <= elem_b + 16;
      endcase
    end
  end
  // for iter_done
  // ###########################################################################
  always @(posedge CLK) iter_done_a <= (ecnt_a==8);
  always @(posedge CLK) iter_done_b <= (ecnt_b==8);
  // for pchange
  // ###########################################################################
  always @(posedge CLK) pchange_a <= (elem_a==`SRTP_ELM);
  always @(posedge CLK) pchange_b <= (elem_b==`SRTP_ELM);
  // for irst
  // ###########################################################################
  always @(posedge CLK) irst_a <= (ecnt_a==8) || pchange_a;
  always @(posedge CLK) irst_b <= (ecnt_b==8) || pchange_b;
  // for frst
  // ###########################################################################
  always @(posedge CLK) frst_a <= RSTa || (ecnt_a==8) || (elem_a==`SRTP_ELM);
  always @(posedge CLK) frst_b <= RSTb || (ecnt_b==8) || (elem_b==`SRTP_ELM);
  // for ecnt
  // ###########################################################################
  always @(posedge CLK) begin
    if (RSTa || iter_done_a || pchange_a) begin
      ecnt_a <= ((`ELEMS_PER_UNIT<<`WAY_LOG) << (phase_a * `WAY_LOG));
    end else begin
      if (ecnt_a!=0 && F01_deq_a) ecnt_a <= ecnt_a - 4;
    end
  end
  always @(posedge CLK) begin
    if (RSTb || iter_done_b || pchange_b) begin
      ecnt_b <= ((`ELEMS_PER_UNIT<<`WAY_LOG) << (phase_b * `WAY_LOG));
    end else begin
      if (ecnt_b!=0 && F01_deq_b) ecnt_b <= ecnt_b - 4;
    end
  end
  // for phase zero
  // ###########################################################################
  always @(posedge CLK) phase_zero <= ((phase_a == 0) || (phase_b == 0));
  // for last phase
  // ###########################################################################
  always @(posedge CLK) last_phase <= ((phase_a == `LAST_PHASE) && (phase_b == `LAST_PHASE));
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