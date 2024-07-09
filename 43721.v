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
  reg  OB_doten_a, OB_doten_b;
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
  reg [31:0]          elem_way_a, elem_way_b;       // sorted elements in a phase
  reg [31:0]          elem_plast_a, elem_plast_b;       // sorted elements in a phase
  reg                 elem_en_a, elem_en_b;
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
  wire [`MERGW-1:0] d00_a, d01_a, d02_a, d03_a, d04_a, d05_a, d06_a, d07_a, d08_a, d09_a, d10_a, d11_a, d12_a, d13_a, d14_a, d15_a;
  wire [1:0] ib00_req_a, ib01_req_a, ib02_req_a, ib03_req_a, ib04_req_a, ib05_req_a, ib06_req_a, ib07_req_a, ib08_req_a, ib09_req_a, ib10_req_a, ib11_req_a, ib12_req_a, ib13_req_a, ib14_req_a, ib15_req_a;
  wire [`MERGW-1:0] d00_b, d01_b, d02_b, d03_b, d04_b, d05_b, d06_b, d07_b, d08_b, d09_b, d10_b, d11_b, d12_b, d13_b, d14_b, d15_b;
  wire [1:0] ib00_req_b, ib01_req_b, ib02_req_b, ib03_req_b, ib04_req_b, ib05_req_b, ib06_req_b, ib07_req_b, ib08_req_b, ib09_req_b, ib10_req_b, ib11_req_b, ib12_req_b, ib13_req_b, ib14_req_b, ib15_req_b;
  (* mark_debug = "true" *) wire       rsltbuf_enq;
  (* mark_debug = "true" *) wire       rsltbuf_deq;
                            wire       rsltbuf_emp;
                            wire       rsltbuf_ful;
  (* mark_debug = "true" *) wire [4:0] rsltbuf_cnt;
  wire F01_emp_a, F01_emp_b;
  wire F01_deq_a = mux1((~|{F01_emp_a,OB_full_a}), (~|{F01_emp_a,rsltbuf_ful}), last_phase);
  wire F01_deq_b = (~|{F01_emp_b,OB_full_b});
  wire [`MERGW-1:0] F01_dot_a, F01_dot_b;
  wire [`MERGW*`SORT_WAY-1:0] s_din_a = {d00_a, d01_a, d02_a, d03_a, d04_a, d05_a, d06_a, d07_a, d08_a, d09_a, d10_a, d11_a, d12_a, d13_a, d14_a, d15_a};
  wire [`MERGW*`SORT_WAY-1:0] s_din_b = {d00_b, d01_b, d02_b, d03_b, d04_b, d05_b, d06_b, d07_b, d08_b, d09_b, d10_b, d11_b, d12_b, d13_b, d14_b, d15_b};
  wire [`SORT_WAY-1:0] enq_a, enq_b;
  wire [`SORT_WAY-1:0] s_ful_a, s_ful_b;
  wire [`SRTP_WAY+`DRAMW-1:0] dc_din   = {req_tb,req_ta,d_dout};
  wire                        dc_dinen = d_douten;
  wire [`DRAMW-1:0]           dc_dout;  // for data
  wire [`SRTP_WAY:0]          dc_cout;  // for control
  wire                        dc_req;
  DECOMPRESSOR #(`IB_SIZE, `DRAM_RBLOCKS)
  decompressor(CLK, RSTa, dc_din, dc_dinen, dc_dout, dc_cout, dc_req);
  wire [`DRAMW-1:0] stnet_dout;
  wire              stnet_douten;
  SORTINGNETWORK sortingnetwork(CLK, RSTa, rx_data_valid, rx_data, stnet_dout, stnet_douten);
  always @(posedge CLK) begin
    if      (RSTa)    req_pzero <= 1;
    else if (doen_tc) req_pzero <= {req_pzero[`SRTP_WAY-2:0],req_pzero[`SRTP_WAY-1]};
  end
  assign im_req_a = mux_sortway(req_tab, req_pzero[`SORT_WAY-1:0], phase_zero);
  assign im_req_b = mux_sortway(req_tbb, req_pzero[`SRTP_WAY-1:`SORT_WAY], phase_zero);
  wire im00_enq_a = doen_tc & im_req_a[0];
  wire im01_enq_a = doen_tc & im_req_a[1];
  wire im02_enq_a = doen_tc & im_req_a[2];
  wire im03_enq_a = doen_tc & im_req_a[3];
  wire im04_enq_a = doen_td & im_req_a[4];
  wire im05_enq_a = doen_td & im_req_a[5];
  wire im06_enq_a = doen_td & im_req_a[6];
  wire im07_enq_a = doen_td & im_req_a[7];
  wire im08_enq_a = doen_te & im_req_a[8];
  wire im09_enq_a = doen_te & im_req_a[9];
  wire im10_enq_a = doen_te & im_req_a[10];
  wire im11_enq_a = doen_te & im_req_a[11];
  wire im12_enq_a = doen_tf & im_req_a[12];
  wire im13_enq_a = doen_tf & im_req_a[13];
  wire im14_enq_a = doen_tf & im_req_a[14];
  wire im15_enq_a = doen_tf & im_req_a[15];
  wire im00_enq_b = doen_tc & im_req_b[0];
  wire im01_enq_b = doen_tc & im_req_b[1];
  wire im02_enq_b = doen_tc & im_req_b[2];
  wire im03_enq_b = doen_tc & im_req_b[3];
  wire im04_enq_b = doen_td & im_req_b[4];
  wire im05_enq_b = doen_td & im_req_b[5];
  wire im06_enq_b = doen_td & im_req_b[6];
  wire im07_enq_b = doen_td & im_req_b[7];
  wire im08_enq_b = doen_te & im_req_b[8];
  wire im09_enq_b = doen_te & im_req_b[9];
  wire im10_enq_b = doen_te & im_req_b[10];
  wire im11_enq_b = doen_te & im_req_b[11];
  wire im12_enq_b = doen_tf & im_req_b[12];
  wire im13_enq_b = doen_tf & im_req_b[13];
  wire im14_enq_b = doen_tf & im_req_b[14];
  wire im15_enq_b = doen_tf & im_req_b[15];
  INMOD2 im00_a(CLK, RSTa, dout_tc, im00_enq_a, s_ful_a[0],  rxw[0],  d00_a, enq_a[0],  ib00_req_a);
  INMOD2 im01_a(CLK, RSTa, dout_tc, im01_enq_a, s_ful_a[1],  rxw[1],  d01_a, enq_a[1],  ib01_req_a);
  INMOD2 im02_a(CLK, RSTa, dout_tc, im02_enq_a, s_ful_a[2],  rxw[2],  d02_a, enq_a[2],  ib02_req_a);
  INMOD2 im03_a(CLK, RSTa, dout_tc, im03_enq_a, s_ful_a[3],  rxw[3],  d03_a, enq_a[3],  ib03_req_a);
  INMOD2 im04_a(CLK, RSTa, dout_td, im04_enq_a, s_ful_a[4],  rxw[4],  d04_a, enq_a[4],  ib04_req_a);
  INMOD2 im05_a(CLK, RSTa, dout_td, im05_enq_a, s_ful_a[5],  rxw[5],  d05_a, enq_a[5],  ib05_req_a);
  INMOD2 im06_a(CLK, RSTa, dout_td, im06_enq_a, s_ful_a[6],  rxw[6],  d06_a, enq_a[6],  ib06_req_a);
  INMOD2 im07_a(CLK, RSTa, dout_td, im07_enq_a, s_ful_a[7],  rxw[7],  d07_a, enq_a[7],  ib07_req_a);
  INMOD2 im08_a(CLK, RSTa, dout_te, im08_enq_a, s_ful_a[8],  rxw[8],  d08_a, enq_a[8],  ib08_req_a);
  INMOD2 im09_a(CLK, RSTa, dout_te, im09_enq_a, s_ful_a[9],  rxw[9],  d09_a, enq_a[9],  ib09_req_a);
  INMOD2 im10_a(CLK, RSTa, dout_te, im10_enq_a, s_ful_a[10], rxw[10], d10_a, enq_a[10], ib10_req_a);
  INMOD2 im11_a(CLK, RSTa, dout_te, im11_enq_a, s_ful_a[11], rxw[11], d11_a, enq_a[11], ib11_req_a);
  INMOD2 im12_a(CLK, RSTa, dout_tf, im12_enq_a, s_ful_a[12], rxw[12], d12_a, enq_a[12], ib12_req_a);
  INMOD2 im13_a(CLK, RSTa, dout_tf, im13_enq_a, s_ful_a[13], rxw[13], d13_a, enq_a[13], ib13_req_a);
  INMOD2 im14_a(CLK, RSTa, dout_tf, im14_enq_a, s_ful_a[14], rxw[14], d14_a, enq_a[14], ib14_req_a);
  INMOD2 im15_a(CLK, RSTa, dout_tf, im15_enq_a, s_ful_a[15], rxw[15], d15_a, enq_a[15], ib15_req_a);
  INMOD2 im00_b(CLK, RSTb, dout_tc, im00_enq_b, s_ful_b[0],  rxw[16], d00_b, enq_b[0],  ib00_req_b);
  INMOD2 im01_b(CLK, RSTb, dout_tc, im01_enq_b, s_ful_b[1],  rxw[17], d01_b, enq_b[1],  ib01_req_b);
  INMOD2 im02_b(CLK, RSTb, dout_tc, im02_enq_b, s_ful_b[2],  rxw[18], d02_b, enq_b[2],  ib02_req_b);
  INMOD2 im03_b(CLK, RSTb, dout_tc, im03_enq_b, s_ful_b[3],  rxw[19], d03_b, enq_b[3],  ib03_req_b);
  INMOD2 im04_b(CLK, RSTb, dout_td, im04_enq_b, s_ful_b[4],  rxw[20], d04_b, enq_b[4],  ib04_req_b);
  INMOD2 im05_b(CLK, RSTb, dout_td, im05_enq_b, s_ful_b[5],  rxw[21], d05_b, enq_b[5],  ib05_req_b);
  INMOD2 im06_b(CLK, RSTb, dout_td, im06_enq_b, s_ful_b[6],  rxw[22], d06_b, enq_b[6],  ib06_req_b);
  INMOD2 im07_b(CLK, RSTb, dout_td, im07_enq_b, s_ful_b[7],  rxw[23], d07_b, enq_b[7],  ib07_req_b);
  INMOD2 im08_b(CLK, RSTb, dout_te, im08_enq_b, s_ful_b[8],  rxw[24], d08_b, enq_b[8],  ib08_req_b);
  INMOD2 im09_b(CLK, RSTb, dout_te, im09_enq_b, s_ful_b[9],  rxw[25], d09_b, enq_b[9],  ib09_req_b);
  INMOD2 im10_b(CLK, RSTb, dout_te, im10_enq_b, s_ful_b[10], rxw[26], d10_b, enq_b[10], ib10_req_b);
  INMOD2 im11_b(CLK, RSTb, dout_te, im11_enq_b, s_ful_b[11], rxw[27], d11_b, enq_b[11], ib11_req_b);
  INMOD2 im12_b(CLK, RSTb, dout_tf, im12_enq_b, s_ful_b[12], rxw[28], d12_b, enq_b[12], ib12_req_b);
  INMOD2 im13_b(CLK, RSTb, dout_tf, im13_enq_b, s_ful_b[13], rxw[29], d13_b, enq_b[13], ib13_req_b);
  INMOD2 im14_b(CLK, RSTb, dout_tf, im14_enq_b, s_ful_b[14], rxw[30], d14_b, enq_b[14], ib14_req_b);
  INMOD2 im15_b(CLK, RSTb, dout_tf, im15_enq_b, s_ful_b[15], rxw[31], d15_b, enq_b[15], ib15_req_b);
  assign rx_wait = |rxw;
  STREE stree_a(CLK, RSTa, irst_a, frst_a, phase_a, s_din_a, enq_a, s_ful_a, F01_deq_a, F01_dot_a, F01_emp_a);
  STREE stree_b(CLK, RSTb, irst_b, frst_b, phase_b, s_din_b, enq_b, s_ful_b, F01_deq_b, F01_dot_b, F01_emp_b);
  reg [31:0] w_addr; //
  reg [31:0] w_addr_pzero; //
  reg [31:0] w_addr_a, w_addr_b;
  reg [3:0]  state;  // state
  reg [31:0] radr_a, radr_b, radr_c, radr_d, radr_e, radr_f, radr_g, radr_h, radr_i, radr_j, radr_k, radr_l, radr_m, radr_n, radr_o, radr_p;
  reg [31:0] radr_a_a, radr_b_a, radr_c_a, radr_d_a, radr_e_a, radr_f_a, radr_g_a, radr_h_a, radr_i_a, radr_j_a, radr_k_a, radr_l_a, radr_m_a, radr_n_a, radr_o_a, radr_p_a;
  reg [31:0] radr_a_b, radr_b_b, radr_c_b, radr_d_b, radr_e_b, radr_f_b, radr_g_b, radr_h_b, radr_i_b, radr_j_b, radr_k_b, radr_l_b, radr_m_b, radr_n_b, radr_o_b, radr_p_b;
  reg [27:0] cnt_a, cnt_b, cnt_c, cnt_d, cnt_e, cnt_f, cnt_g, cnt_h, cnt_i, cnt_j, cnt_k, cnt_l, cnt_m, cnt_n, cnt_o, cnt_p;
  reg [27:0] cnt_a_a, cnt_b_a, cnt_c_a, cnt_d_a, cnt_e_a, cnt_f_a, cnt_g_a, cnt_h_a, cnt_i_a, cnt_j_a, cnt_k_a, cnt_l_a, cnt_m_a, cnt_n_a, cnt_o_a, cnt_p_a;
  reg [27:0] cnt_a_b, cnt_b_b, cnt_c_b, cnt_d_b, cnt_e_b, cnt_f_b, cnt_g_b, cnt_h_b, cnt_i_b, cnt_j_b, cnt_k_b, cnt_l_b, cnt_m_b, cnt_n_b, cnt_o_b, cnt_p_b;
  reg        c_a, c_b, c_c, c_d, c_e, c_f, c_g, c_h, c_i, c_j, c_k, c_l, c_m, c_n, c_o, c_p;   // counter is full ?
  reg        c_a_a, c_b_a, c_c_a, c_d_a, c_e_a, c_f_a, c_g_a, c_h_a, c_i_a, c_j_a, c_k_a, c_l_a, c_m_a, c_n_a, c_o_a, c_p_a;
  reg        c_a_b, c_b_b, c_c_b, c_d_b, c_e_b, c_f_b, c_g_b, c_h_b, c_i_b, c_j_b, c_k_b, c_l_b, c_m_b, c_n_b, c_o_b, c_p_b;
  // input
  wire mgdrive   = (state==3 && d_req!=0);
  wire mgdrive_a = (state==6 && d_req!=0 && (|req_ta));
  wire mgdrive_b = (state==6 && d_req!=0 && (|req_tb));
  wire [`SORT_WAY-1:0] im_enq_a = {im15_enq_a,im14_enq_a,im13_enq_a,im12_enq_a,im11_enq_a,im10_enq_a,im09_enq_a,im08_enq_a,im07_enq_a,im06_enq_a,im05_enq_a,im04_enq_a,im03_enq_a,im02_enq_a,im01_enq_a,im00_enq_a};
  wire [`SORT_WAY-1:0] im_enq_b = {im15_enq_b,im14_enq_b,im13_enq_b,im12_enq_b,im11_enq_b,im10_enq_b,im09_enq_b,im08_enq_b,im07_enq_b,im06_enq_b,im05_enq_b,im04_enq_b,im03_enq_b,im02_enq_b,im01_enq_b,im00_enq_b};
  wire [`SORT_WAY-1:0] im_emp_a = {ib15_req_a[1],ib14_req_a[1],ib13_req_a[1],ib12_req_a[1],ib11_req_a[1],ib10_req_a[1],ib09_req_a[1],ib08_req_a[1],ib07_req_a[1],ib06_req_a[1],ib05_req_a[1],ib04_req_a[1],ib03_req_a[1],ib02_req_a[1],ib01_req_a[1],ib00_req_a[1]};
  wire [`SORT_WAY-1:0] im_emp_b = {ib15_req_b[1],ib14_req_b[1],ib13_req_b[1],ib12_req_b[1],ib11_req_b[1],ib10_req_b[1],ib09_req_b[1],ib08_req_b[1],ib07_req_b[1],ib06_req_b[1],ib05_req_b[1],ib04_req_b[1],ib03_req_b[1],ib02_req_b[1],ib01_req_b[1],ib00_req_b[1]};
  // output
  wire reqcnt_a, reqcnt_b, reqcnt_c, reqcnt_d, reqcnt_e, reqcnt_f, reqcnt_g, reqcnt_h, reqcnt_i, reqcnt_j, reqcnt_k, reqcnt_l, reqcnt_m, reqcnt_n, reqcnt_o, reqcnt_p;
  wire reqcnt_a_a, reqcnt_b_a, reqcnt_c_a, reqcnt_d_a, reqcnt_e_a, reqcnt_f_a, reqcnt_g_a, reqcnt_h_a, reqcnt_i_a, reqcnt_j_a, reqcnt_k_a, reqcnt_l_a, reqcnt_m_a, reqcnt_n_a, reqcnt_o_a, reqcnt_p_a;
  wire reqcnt_a_b, reqcnt_b_b, reqcnt_c_b, reqcnt_d_b, reqcnt_e_b, reqcnt_f_b, reqcnt_g_b, reqcnt_h_b, reqcnt_i_b, reqcnt_j_b, reqcnt_k_b, reqcnt_l_b, reqcnt_m_b, reqcnt_n_b, reqcnt_o_b, reqcnt_p_b;
  REQCNTMG reqcntmg(CLK, RSTa, mgdrive, req_ta, im_enq_a, im_emp_a, reqcnt_a, reqcnt_b, reqcnt_c, reqcnt_d, reqcnt_e, reqcnt_f, reqcnt_g, reqcnt_h, reqcnt_i, reqcnt_j, reqcnt_k, reqcnt_l, reqcnt_m, reqcnt_n, reqcnt_o, reqcnt_p);
  REQCNTMG reqcntmg_a(CLK, RSTa, mgdrive_a, req_ta, im_enq_a, im_emp_a, reqcnt_a_a, reqcnt_b_a, reqcnt_c_a, reqcnt_d_a, reqcnt_e_a, reqcnt_f_a, reqcnt_g_a, reqcnt_h_a, reqcnt_i_a, reqcnt_j_a, reqcnt_k_a, reqcnt_l_a, reqcnt_m_a, reqcnt_n_a, reqcnt_o_a, reqcnt_p_a);
  REQCNTMG reqcntmg_b(CLK, RSTb, mgdrive_b, req_tb, im_enq_b, im_emp_b, reqcnt_a_b, reqcnt_b_b, reqcnt_c_b, reqcnt_d_b, reqcnt_e_b, reqcnt_f_b, reqcnt_g_b, reqcnt_h_b, reqcnt_i_b, reqcnt_j_b, reqcnt_k_b, reqcnt_l_b, reqcnt_m_b, reqcnt_n_b, reqcnt_o_b, reqcnt_p_b);
  // output
  wire [31:0] w_block_a;
  wire [31:0] w_block_b;
  wire [31:0] r_endadr_a_a, r_endadr_b_a, r_endadr_c_a, r_endadr_d_a, r_endadr_e_a, r_endadr_f_a, r_endadr_g_a, r_endadr_h_a, r_endadr_i_a, r_endadr_j_a, r_endadr_k_a, r_endadr_l_a, r_endadr_m_a, r_endadr_n_a, r_endadr_o_a, r_endadr_p_a;
  wire [31:0] r_endadr_a_b, r_endadr_b_b, r_endadr_c_b, r_endadr_d_b, r_endadr_e_b, r_endadr_f_b, r_endadr_g_b, r_endadr_h_b, r_endadr_i_b, r_endadr_j_b, r_endadr_k_b, r_endadr_l_b, r_endadr_m_b, r_endadr_n_b, r_endadr_o_b, r_endadr_p_b;
  WRITEMG #((`SORT_ELM>>(`P_LOG+`WAY_LOG)))
  writemg_a(CLK, RSTa, pchange_a, plast_a, (state==7 && d_req!=0), elem_a, elem_way_a, elem_plast_a, w_addr_a,
            w_block_a, r_endadr_a_a, r_endadr_b_a, r_endadr_c_a, r_endadr_d_a, r_endadr_e_a, r_endadr_f_a, r_endadr_g_a, r_endadr_h_a, r_endadr_i_a, r_endadr_j_a, r_endadr_k_a, r_endadr_l_a, r_endadr_m_a, r_endadr_n_a, r_endadr_o_a, r_endadr_p_a);
  WRITEMG #((`SORT_ELM>>(`P_LOG+`WAY_LOG)))
  writemg_b(CLK, RSTb, pchange_b, plast_b, (state==8 && d_req!=0), elem_b, elem_way_b, elem_plast_b, w_addr_b,
            w_block_b, r_endadr_a_b, r_endadr_b_b, r_endadr_c_b, r_endadr_d_b, r_endadr_e_b, r_endadr_f_b, r_endadr_g_b, r_endadr_h_b, r_endadr_i_b, r_endadr_j_b, r_endadr_k_b, r_endadr_l_b, r_endadr_m_b, r_endadr_n_b, r_endadr_o_b, r_endadr_p_b);
  // output
  wire [31:0] r_block_a, r_block_b, r_block_c, r_block_d, r_block_e, r_block_f, r_block_g, r_block_h, r_block_i, r_block_j, r_block_k, r_block_l, r_block_m, r_block_n, r_block_o, r_block_p;
  wire [31:0] r_block_a_a, r_block_b_a, r_block_c_a, r_block_d_a, r_block_e_a, r_block_f_a, r_block_g_a, r_block_h_a, r_block_i_a, r_block_j_a, r_block_k_a, r_block_l_a, r_block_m_a, r_block_n_a, r_block_o_a, r_block_p_a;
  wire [31:0] r_block_a_b, r_block_b_b, r_block_c_b, r_block_d_b, r_block_e_b, r_block_f_b, r_block_g_b, r_block_h_b, r_block_i_b, r_block_j_b, r_block_k_b, r_block_l_b, r_block_m_b, r_block_n_b, r_block_o_b, r_block_p_b;
  wire        readend_a, readend_b, readend_c, readend_d, readend_e, readend_f, readend_g, readend_h, readend_i, readend_j, readend_k, readend_l, readend_m, readend_n, readend_o, readend_p;
  wire        readend_a_a, readend_b_a, readend_c_a, readend_d_a, readend_e_a, readend_f_a, readend_g_a, readend_h_a, readend_i_a, readend_j_a, readend_k_a, readend_l_a, readend_m_a, readend_n_a, readend_o_a, readend_p_a;
  wire        readend_a_b, readend_b_b, readend_c_b, readend_d_b, readend_e_b, readend_f_b, readend_g_b, readend_h_b, readend_i_b, readend_j_b, readend_k_b, readend_l_b, readend_m_b, readend_n_b, readend_o_b, readend_p_b;
  READMG readmg(CLK, !last_phase, (state==3 && d_req!=0), req_ta, phase_a[0],
                radr_a, radr_b, radr_c, radr_d, radr_e, radr_f, radr_g, radr_h, radr_i, radr_j, radr_k, radr_l, radr_m, radr_n, radr_o, radr_p,
                r_endadr_b_a, r_endadr_d_a, r_endadr_f_a, r_endadr_h_a, r_endadr_j_a, r_endadr_l_a, r_endadr_n_a, r_endadr_p_a, r_endadr_b_b, r_endadr_d_b, r_endadr_f_b, r_endadr_h_b, r_endadr_j_b, r_endadr_l_b, r_endadr_n_b, r_endadr_p_b,
                r_block_a, r_block_b, r_block_c, r_block_d, r_block_e, r_block_f, r_block_g, r_block_h, r_block_i, r_block_j, r_block_k, r_block_l, r_block_m, r_block_n, r_block_o, r_block_p,
                readend_a, readend_b, readend_c, readend_d, readend_e, readend_f, readend_g, readend_h, readend_i, readend_j, readend_k, readend_l, readend_m, readend_n, readend_o, readend_p);
  READMG readmg_a(CLK, (RSTa || pchange_a), (state==6 && d_req!=0 && (|req_ta)), req_ta, phase_a[0],
                  radr_a_a, radr_b_a, radr_c_a, radr_d_a, radr_e_a, radr_f_a, radr_g_a, radr_h_a, radr_i_a, radr_j_a, radr_k_a, radr_l_a, radr_m_a, radr_n_a, radr_o_a, radr_p_a,
                  r_endadr_a_a, r_endadr_b_a, r_endadr_c_a, r_endadr_d_a, r_endadr_e_a, r_endadr_f_a, r_endadr_g_a, r_endadr_h_a, r_endadr_i_a, r_endadr_j_a, r_endadr_k_a, r_endadr_l_a, r_endadr_m_a, r_endadr_n_a, r_endadr_o_a, r_endadr_p_a,
                  r_block_a_a, r_block_b_a, r_block_c_a, r_block_d_a, r_block_e_a, r_block_f_a, r_block_g_a, r_block_h_a, r_block_i_a, r_block_j_a, r_block_k_a, r_block_l_a, r_block_m_a, r_block_n_a, r_block_o_a, r_block_p_a,
                  readend_a_a, readend_b_a, readend_c_a, readend_d_a, readend_e_a, readend_f_a, readend_g_a, readend_h_a, readend_i_a, readend_j_a, readend_k_a, readend_l_a, readend_m_a, readend_n_a, readend_o_a, readend_p_a);
  READMG readmg_b(CLK, (RSTb || pchange_b), (state==6 && d_req!=0 && (|req_tb)), req_tb, phase_b[0],
                  radr_a_b, radr_b_b, radr_c_b, radr_d_b, radr_e_b, radr_f_b, radr_g_b, radr_h_b, radr_i_b, radr_j_b, radr_k_b, radr_l_b, radr_m_b, radr_n_b, radr_o_b, radr_p_b,
                  r_endadr_a_b, r_endadr_b_b, r_endadr_c_b, r_endadr_d_b, r_endadr_e_b, r_endadr_f_b, r_endadr_g_b, r_endadr_h_b, r_endadr_i_b, r_endadr_j_b, r_endadr_k_b, r_endadr_l_b, r_endadr_m_b, r_endadr_n_b, r_endadr_o_b, r_endadr_p_b,
                  r_block_a_b, r_block_b_b, r_block_c_b, r_block_d_b, r_block_e_b, r_block_f_b, r_block_g_b, r_block_h_b, r_block_i_b, r_block_j_b, r_block_k_b, r_block_l_b, r_block_m_b, r_block_n_b, r_block_o_b, r_block_p_b,
                  readend_a_b, readend_b_b, readend_c_b, readend_d_b, readend_e_b, readend_f_b, readend_g_b, readend_h_b, readend_i_b, readend_j_b, readend_k_b, readend_l_b, readend_m_b, readend_n_b, readend_o_b, readend_p_b);
  reg OB_stopreq_a, OB_stopreq_b;
  always @(posedge CLK) OB_stopreq_a <= (d_busy || OB_doten_a || elem_en_a || (elem_way_a==(`SORT_ELM>>(`P_LOG+`WAY_LOG))));
  always @(posedge CLK) OB_stopreq_b <= (d_busy || OB_doten_b || elem_en_b || (elem_way_b==(`SORT_ELM>>(`P_LOG+`WAY_LOG))));
  always @(posedge CLK) OB_doten_a <= OB_deq_a;
  always @(posedge CLK) OB_doten_b <= OB_deq_b;
  OTMOD ob_a(CLK, RSTa, OB_stopreq_a, w_block_a, phase_zero, (!last_phase && F01_deq_a), F01_dot_a, OB_deq_a, OB_dot_a, OB_full_a, OB_req_a);
  OTMOD ob_b(CLK, RSTb, OB_stopreq_b, w_block_b, phase_zero, F01_deq_b, F01_dot_b, OB_deq_b, OB_dot_b, OB_full_b, OB_req_b);
  assign rsltbuf_enq = last_phase && F01_deq_a;
  assign rsltbuf_deq = chnl_tx_data_ren && chnl_tx_data_valid;
  SRL_FIFO #(4, `MERGW) rsltbuf(CLK, RSTa, rsltbuf_enq, rsltbuf_deq, F01_dot_a,
                                rslt, rsltbuf_emp, rsltbuf_ful, rsltbuf_cnt);
  assign rslt_ready = !rsltbuf_emp;
  /***** dram READ/WRITE controller                                                         *****/
  wire reqhalt_a_a = mux1((readend_a_a || (phase_a==`LAST_PHASE)), c_a_a, (phase_a==1));
  wire reqhalt_b_a = mux1((readend_b_a || (phase_a==`LAST_PHASE)), c_b_a, (phase_a==1));
  wire reqhalt_c_a = mux1((readend_c_a || (phase_a==`LAST_PHASE)), c_c_a, (phase_a==1));
  wire reqhalt_d_a = mux1((readend_d_a || (phase_a==`LAST_PHASE)), c_d_a, (phase_a==1));
  wire reqhalt_e_a = mux1((readend_e_a || (phase_a==`LAST_PHASE)), c_e_a, (phase_a==1));
  wire reqhalt_f_a = mux1((readend_f_a || (phase_a==`LAST_PHASE)), c_f_a, (phase_a==1));
  wire reqhalt_g_a = mux1((readend_g_a || (phase_a==`LAST_PHASE)), c_g_a, (phase_a==1));
  wire reqhalt_h_a = mux1((readend_h_a || (phase_a==`LAST_PHASE)), c_h_a, (phase_a==1));
  wire reqhalt_i_a = mux1((readend_i_a || (phase_a==`LAST_PHASE)), c_i_a, (phase_a==1));
  wire reqhalt_j_a = mux1((readend_j_a || (phase_a==`LAST_PHASE)), c_j_a, (phase_a==1));
  wire reqhalt_k_a = mux1((readend_k_a || (phase_a==`LAST_PHASE)), c_k_a, (phase_a==1));
  wire reqhalt_l_a = mux1((readend_l_a || (phase_a==`LAST_PHASE)), c_l_a, (phase_a==1));
  wire reqhalt_m_a = mux1((readend_m_a || (phase_a==`LAST_PHASE)), c_m_a, (phase_a==1));
  wire reqhalt_n_a = mux1((readend_n_a || (phase_a==`LAST_PHASE)), c_n_a, (phase_a==1));
  wire reqhalt_o_a = mux1((readend_o_a || (phase_a==`LAST_PHASE)), c_o_a, (phase_a==1));
  wire reqhalt_p_a = mux1((readend_p_a || (phase_a==`LAST_PHASE)), c_p_a, (phase_a==1));
  wire reqhalt_a_b = mux1((readend_a_b || (phase_b==`LAST_PHASE)), c_a_b, (phase_b==1));
  wire reqhalt_b_b = mux1((readend_b_b || (phase_b==`LAST_PHASE)), c_b_b, (phase_b==1));
  wire reqhalt_c_b = mux1((readend_c_b || (phase_b==`LAST_PHASE)), c_c_b, (phase_b==1));
  wire reqhalt_d_b = mux1((readend_d_b || (phase_b==`LAST_PHASE)), c_d_b, (phase_b==1));
  wire reqhalt_e_b = mux1((readend_e_b || (phase_b==`LAST_PHASE)), c_e_b, (phase_b==1));
  wire reqhalt_f_b = mux1((readend_f_b || (phase_b==`LAST_PHASE)), c_f_b, (phase_b==1));
  wire reqhalt_g_b = mux1((readend_g_b || (phase_b==`LAST_PHASE)), c_g_b, (phase_b==1));
  wire reqhalt_h_b = mux1((readend_h_b || (phase_b==`LAST_PHASE)), c_h_b, (phase_b==1));
  wire reqhalt_i_b = mux1((readend_i_b || (phase_b==`LAST_PHASE)), c_i_b, (phase_b==1));
  wire reqhalt_j_b = mux1((readend_j_b || (phase_b==`LAST_PHASE)), c_j_b, (phase_b==1));
  wire reqhalt_k_b = mux1((readend_k_b || (phase_b==`LAST_PHASE)), c_k_b, (phase_b==1));
  wire reqhalt_l_b = mux1((readend_l_b || (phase_b==`LAST_PHASE)), c_l_b, (phase_b==1));
  wire reqhalt_m_b = mux1((readend_m_b || (phase_b==`LAST_PHASE)), c_m_b, (phase_b==1));
  wire reqhalt_n_b = mux1((readend_n_b || (phase_b==`LAST_PHASE)), c_n_b, (phase_b==1));
  wire reqhalt_o_b = mux1((readend_o_b || (phase_b==`LAST_PHASE)), c_o_b, (phase_b==1));
  wire reqhalt_p_b = mux1((readend_p_b || (phase_b==`LAST_PHASE)), c_p_b, (phase_b==1));
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
      radr_i <= ((`SELM_PER_WAY>>3)*8);
      radr_j <= ((`SELM_PER_WAY>>3)*9);
      radr_k <= ((`SELM_PER_WAY>>3)*10);
      radr_l <= ((`SELM_PER_WAY>>3)*11);
      radr_m <= ((`SELM_PER_WAY>>3)*12);
      radr_n <= ((`SELM_PER_WAY>>3)*13);
      radr_o <= ((`SELM_PER_WAY>>3)*14);
      radr_p <= ((`SELM_PER_WAY>>3)*15);
      {cnt_a, cnt_b, cnt_c, cnt_d, cnt_e, cnt_f, cnt_g, cnt_h, cnt_i, cnt_j, cnt_k, cnt_l, cnt_m, cnt_n, cnt_o, cnt_p} <= 0;
      {c_a, c_b, c_c, c_d, c_e, c_f, c_g, c_h, c_i, c_j, c_k, c_l, c_m, c_n, c_o, c_p} <= 0;
      if ((RSTa || pchange_a) && !plast_a) begin
        req_a <= 0;
        w_addr_a <= mux32((`SORT_ELM>>1), 0, phase_a[0]);
        radr_a_a <= ((`SELM_PER_WAY>>(`P_LOG+3))*0);
        radr_b_a <= ((`SELM_PER_WAY>>(`P_LOG+3))*1);
        radr_c_a <= ((`SELM_PER_WAY>>(`P_LOG+3))*2);
        radr_d_a <= ((`SELM_PER_WAY>>(`P_LOG+3))*3);
        radr_e_a <= ((`SELM_PER_WAY>>(`P_LOG+3))*4);
        radr_f_a <= ((`SELM_PER_WAY>>(`P_LOG+3))*5);
        radr_g_a <= ((`SELM_PER_WAY>>(`P_LOG+3))*6);
        radr_h_a <= ((`SELM_PER_WAY>>(`P_LOG+3))*7);
        radr_i_a <= ((`SELM_PER_WAY>>(`P_LOG+3))*8);
        radr_j_a <= ((`SELM_PER_WAY>>(`P_LOG+3))*9);
        radr_k_a <= ((`SELM_PER_WAY>>(`P_LOG+3))*10);
        radr_l_a <= ((`SELM_PER_WAY>>(`P_LOG+3))*11);
        radr_m_a <= ((`SELM_PER_WAY>>(`P_LOG+3))*12);
        radr_n_a <= ((`SELM_PER_WAY>>(`P_LOG+3))*13);
        radr_o_a <= ((`SELM_PER_WAY>>(`P_LOG+3))*14);
        radr_p_a <= ((`SELM_PER_WAY>>(`P_LOG+3))*15);
        {cnt_a_a, cnt_b_a, cnt_c_a, cnt_d_a, cnt_e_a, cnt_f_a, cnt_g_a, cnt_h_a, cnt_i_a, cnt_j_a, cnt_k_a, cnt_l_a, cnt_m_a, cnt_n_a, cnt_o_a, cnt_p_a} <= 0;
        {c_a_a, c_b_a, c_c_a, c_d_a, c_e_a, c_f_a, c_g_a, c_h_a, c_i_a, c_j_a, c_k_a, c_l_a, c_m_a, c_n_a, c_o_a, c_p_a} <= 0;
        OB_granted_a <= 0;
      end
      if ((RSTa || pchange_b) && !plast_b) begin
        req_b <= 0;
        w_addr_b <= mux32(((`SORT_ELM>>2) | (`SORT_ELM>>1)), (`SORT_ELM>>2), phase_b[0]);
        radr_a_b <= ((`SELM_PER_WAY>>(`P_LOG+3))*0)  | (`SORT_ELM>>2);
        radr_b_b <= ((`SELM_PER_WAY>>(`P_LOG+3))*1)  | (`SORT_ELM>>2);
        radr_c_b <= ((`SELM_PER_WAY>>(`P_LOG+3))*2)  | (`SORT_ELM>>2);
        radr_d_b <= ((`SELM_PER_WAY>>(`P_LOG+3))*3)  | (`SORT_ELM>>2);
        radr_e_b <= ((`SELM_PER_WAY>>(`P_LOG+3))*4)  | (`SORT_ELM>>2);
        radr_f_b <= ((`SELM_PER_WAY>>(`P_LOG+3))*5)  | (`SORT_ELM>>2);
        radr_g_b <= ((`SELM_PER_WAY>>(`P_LOG+3))*6)  | (`SORT_ELM>>2);
        radr_h_b <= ((`SELM_PER_WAY>>(`P_LOG+3))*7)  | (`SORT_ELM>>2);
        radr_i_b <= ((`SELM_PER_WAY>>(`P_LOG+3))*8)  | (`SORT_ELM>>2);
        radr_j_b <= ((`SELM_PER_WAY>>(`P_LOG+3))*9)  | (`SORT_ELM>>2);
        radr_k_b <= ((`SELM_PER_WAY>>(`P_LOG+3))*10) | (`SORT_ELM>>2);
        radr_l_b <= ((`SELM_PER_WAY>>(`P_LOG+3))*11) | (`SORT_ELM>>2);
        radr_m_b <= ((`SELM_PER_WAY>>(`P_LOG+3))*12) | (`SORT_ELM>>2);
        radr_n_b <= ((`SELM_PER_WAY>>(`P_LOG+3))*13) | (`SORT_ELM>>2);
        radr_o_b <= ((`SELM_PER_WAY>>(`P_LOG+3))*14) | (`SORT_ELM>>2);
        radr_p_b <= ((`SELM_PER_WAY>>(`P_LOG+3))*15) | (`SORT_ELM>>2);
        {cnt_a_b, cnt_b_b, cnt_c_b, cnt_d_b, cnt_e_b, cnt_f_b, cnt_g_b, cnt_h_b, cnt_i_b, cnt_j_b, cnt_k_b, cnt_l_b, cnt_m_b, cnt_n_b, cnt_o_b, cnt_p_b} <= 0;
        {c_a_b, c_b_b, c_c_b, c_d_b, c_e_b, c_f_b, c_g_b, c_h_b, c_i_b, c_j_b, c_k_b, c_l_b, c_m_b, c_n_b, c_o_b, c_p_b} <= 0;
        OB_granted_b <= 0;
      end
    end else begin
      case (state)
        0: begin ///// Initialize memory, write data to DRAM
          if (!phase_zero) state <= 4;
          if (d_req != 0) d_req <= 0;
          else if (!d_busy) begin
            if (OB_req_a || OB_req_b) begin
              d_req        <= `DRAM_REQ_WRITE;   //
              d_blocks     <= `DRAM_WBLOCKS;     //
              d_initadr    <= w_addr_pzero;            //
              w_addr_pzero <= w_addr_pzero + (`D_WS);  // address for the next write
              if      (OB_req_a) begin OB_granted_a <= 1; OB_granted_b <= 0; end
              else if (OB_req_b) begin OB_granted_a <= 0; OB_granted_b <= 1; end
            end
          end
        end
        1: begin ///// request arbitration
          if (!d_busy && dc_req) begin
            if      (ib00_req_a[1] && !readend_a && ~reqcnt_a) begin req<=16'h0001; state<=3; end // first priority
            else if (ib01_req_a[1] && !readend_b && ~reqcnt_b) begin req<=16'h0002; state<=3; end //
            else if (ib02_req_a[1] && !readend_c && ~reqcnt_c) begin req<=16'h0004; state<=3; end //
            else if (ib03_req_a[1] && !readend_d && ~reqcnt_d) begin req<=16'h0008; state<=3; end //
            else if (ib04_req_a[1] && !readend_e && ~reqcnt_e) begin req<=16'h0010; state<=3; end //
            else if (ib05_req_a[1] && !readend_f && ~reqcnt_f) begin req<=16'h0020; state<=3; end //
            else if (ib06_req_a[1] && !readend_g && ~reqcnt_g) begin req<=16'h0040; state<=3; end //
            else if (ib07_req_a[1] && !readend_h && ~reqcnt_h) begin req<=16'h0080; state<=3; end //
            else if (ib08_req_a[1] && !readend_i && ~reqcnt_i) begin req<=16'h0100; state<=3; end //
            else if (ib09_req_a[1] && !readend_j && ~reqcnt_j) begin req<=16'h0200; state<=3; end //
            else if (ib10_req_a[1] && !readend_k && ~reqcnt_k) begin req<=16'h0400; state<=3; end //
            else if (ib11_req_a[1] && !readend_l && ~reqcnt_l) begin req<=16'h0800; state<=3; end //
            else if (ib12_req_a[1] && !readend_m && ~reqcnt_m) begin req<=16'h1000; state<=3; end //
            else if (ib13_req_a[1] && !readend_n && ~reqcnt_n) begin req<=16'h2000; state<=3; end //
            else if (ib14_req_a[1] && !readend_o && ~reqcnt_o) begin req<=16'h4000; state<=3; end //
            else if (ib15_req_a[1] && !readend_p && ~reqcnt_p) begin req<=16'h8000; state<=3; end //
            else                                                 state<=2;
          end
        end
        2: begin ///// request arbitration
          if (!d_busy && dc_req) begin
            if      (ib00_req_a[0] && !readend_a && ~reqcnt_a) begin req<=16'h0001; state<=3; end // second priority
            else if (ib01_req_a[0] && !readend_b && ~reqcnt_b) begin req<=16'h0002; state<=3; end //
            else if (ib02_req_a[0] && !readend_c && ~reqcnt_c) begin req<=16'h0004; state<=3; end //
            else if (ib03_req_a[0] && !readend_d && ~reqcnt_d) begin req<=16'h0008; state<=3; end //
            else if (ib04_req_a[0] && !readend_e && ~reqcnt_e) begin req<=16'h0010; state<=3; end //
            else if (ib05_req_a[0] && !readend_f && ~reqcnt_f) begin req<=16'h0020; state<=3; end //
            else if (ib06_req_a[0] && !readend_g && ~reqcnt_g) begin req<=16'h0040; state<=3; end //
            else if (ib07_req_a[0] && !readend_h && ~reqcnt_h) begin req<=16'h0080; state<=3; end //
            else if (ib08_req_a[0] && !readend_i && ~reqcnt_i) begin req<=16'h0100; state<=3; end //
            else if (ib09_req_a[0] && !readend_j && ~reqcnt_j) begin req<=16'h0200; state<=3; end //
            else if (ib10_req_a[0] && !readend_k && ~reqcnt_k) begin req<=16'h0400; state<=3; end //
            else if (ib11_req_a[0] && !readend_l && ~reqcnt_l) begin req<=16'h0800; state<=3; end //
            else if (ib12_req_a[0] && !readend_m && ~reqcnt_m) begin req<=16'h1000; state<=3; end //
            else if (ib13_req_a[0] && !readend_n && ~reqcnt_n) begin req<=16'h2000; state<=3; end //
            else if (ib14_req_a[0] && !readend_o && ~reqcnt_o) begin req<=16'h4000; state<=3; end //
            else if (ib15_req_a[0] && !readend_p && ~reqcnt_p) begin req<=16'h8000; state<=3; end //
          end
        end
        3: begin ///// READ data from DRAM
          if (d_req!=0) begin d_req<=0; state<=1; end
          else if (!d_busy) begin
            case (req)
              16'h0001: begin
                d_initadr <= mux32(radr_a, (radr_a | (`SORT_ELM>>1)), phase_a[0]);
                radr_a    <= radr_a+(r_block_a<<3);
                d_blocks  <= r_block_a;
              end
              16'h0002: begin
                d_initadr <= mux32(radr_b, (radr_b | (`SORT_ELM>>1)), phase_a[0]);
                radr_b    <= radr_b+(r_block_b<<3);
                d_blocks  <= r_block_b;
              end
              16'h0004: begin
                d_initadr <= mux32(radr_c, (radr_c | (`SORT_ELM>>1)), phase_a[0]);
                radr_c    <= radr_c+(r_block_c<<3);
                d_blocks  <= r_block_c;
              end
              16'h0008: begin
                d_initadr <= mux32(radr_d, (radr_d | (`SORT_ELM>>1)), phase_a[0]);
                radr_d    <= radr_d+(r_block_d<<3);
                d_blocks  <= r_block_d;
              end
              16'h0010: begin
                d_initadr <= mux32(radr_e, (radr_e | (`SORT_ELM>>1)), phase_a[0]);
                radr_e     <= radr_e+(r_block_e<<3);
                d_blocks  <= r_block_e;
              end
              16'h0020: begin
                d_initadr <= mux32(radr_f, (radr_f | (`SORT_ELM>>1)), phase_a[0]);
                radr_f    <= radr_f+(r_block_f<<3);
                d_blocks  <= r_block_f;
              end
              16'h0040: begin
                d_initadr <= mux32(radr_g, (radr_g | (`SORT_ELM>>1)), phase_a[0]);
                radr_g    <= radr_g+(r_block_g<<3);
                d_blocks  <= r_block_g;
              end
              16'h0080: begin
                d_initadr <= mux32(radr_h, (radr_h | (`SORT_ELM>>1)), phase_a[0]);
                radr_h    <= radr_h+(r_block_h<<3);
                d_blocks  <= r_block_h;
              end
              16'h0100: begin
                d_initadr <= mux32(radr_i, (radr_i | (`SORT_ELM>>1)), phase_a[0]);
                radr_i    <= radr_i+(r_block_i<<3);
                d_blocks  <= r_block_i;
              end
              16'h0200: begin
                d_initadr <= mux32(radr_j, (radr_j | (`SORT_ELM>>1)), phase_a[0]);
                radr_j    <= radr_j+(r_block_j<<3);
                d_blocks  <= r_block_j;
              end
              16'h0400: begin
                d_initadr <= mux32(radr_k, (radr_k | (`SORT_ELM>>1)), phase_a[0]);
                radr_k    <= radr_k+(r_block_k<<3);
                d_blocks  <= r_block_k;
              end
              16'h0800: begin
                d_initadr <= mux32(radr_l, (radr_l | (`SORT_ELM>>1)), phase_a[0]);
                radr_l    <= radr_l+(r_block_l<<3);
                d_blocks  <= r_block_l;
              end
              16'h1000: begin
                d_initadr <= mux32(radr_m, (radr_m | (`SORT_ELM>>1)), phase_a[0]);
                radr_m    <= radr_m+(r_block_m<<3);
                d_blocks  <= r_block_m;
              end
              16'h2000: begin
                d_initadr <= mux32(radr_n, (radr_n | (`SORT_ELM>>1)), phase_a[0]);
                radr_n    <= radr_n+(r_block_n<<3);
                d_blocks  <= r_block_n;
              end
              16'h4000: begin
                d_initadr <= mux32(radr_o, (radr_o | (`SORT_ELM>>1)), phase_a[0]);
                radr_o    <= radr_o+(r_block_o<<3);
                d_blocks  <= r_block_o;
              end
              16'h8000: begin
                d_initadr <= mux32(radr_p, (radr_p | (`SORT_ELM>>1)), phase_a[0]);
                radr_p    <= radr_p+(r_block_p<<3);
                d_blocks  <= r_block_p;
              end
            endcase
            d_req    <= `DRAM_REQ_READ;
            req_ta   <= req;
            req_tb   <= 0;
          end
        end
        4: begin
          if (!d_busy && dc_req) begin
            if      (ib00_req_a[1] && !reqhalt_a_a && ~reqcnt_a_a) begin req_a<=16'h0001; req_b<=0; state<=6; end // first priority
            else if (ib01_req_a[1] && !reqhalt_b_a && ~reqcnt_b_a) begin req_a<=16'h0002; req_b<=0; state<=6; end //
            else if (ib02_req_a[1] && !reqhalt_c_a && ~reqcnt_c_a) begin req_a<=16'h0004; req_b<=0; state<=6; end //
            else if (ib03_req_a[1] && !reqhalt_d_a && ~reqcnt_d_a) begin req_a<=16'h0008; req_b<=0; state<=6; end //
            else if (ib04_req_a[1] && !reqhalt_e_a && ~reqcnt_e_a) begin req_a<=16'h0010; req_b<=0; state<=6; end //
            else if (ib05_req_a[1] && !reqhalt_f_a && ~reqcnt_f_a) begin req_a<=16'h0020; req_b<=0; state<=6; end //
            else if (ib06_req_a[1] && !reqhalt_g_a && ~reqcnt_g_a) begin req_a<=16'h0040; req_b<=0; state<=6; end //
            else if (ib07_req_a[1] && !reqhalt_h_a && ~reqcnt_h_a) begin req_a<=16'h0080; req_b<=0; state<=6; end //
            else if (ib08_req_a[1] && !reqhalt_i_a && ~reqcnt_i_a) begin req_a<=16'h0100; req_b<=0; state<=6; end //
            else if (ib09_req_a[1] && !reqhalt_j_a && ~reqcnt_j_a) begin req_a<=16'h0200; req_b<=0; state<=6; end //
            else if (ib10_req_a[1] && !reqhalt_k_a && ~reqcnt_k_a) begin req_a<=16'h0400; req_b<=0; state<=6; end //
            else if (ib11_req_a[1] && !reqhalt_l_a && ~reqcnt_l_a) begin req_a<=16'h0800; req_b<=0; state<=6; end //
            else if (ib12_req_a[1] && !reqhalt_m_a && ~reqcnt_m_a) begin req_a<=16'h1000; req_b<=0; state<=6; end //
            else if (ib13_req_a[1] && !reqhalt_n_a && ~reqcnt_n_a) begin req_a<=16'h2000; req_b<=0; state<=6; end //
            else if (ib14_req_a[1] && !reqhalt_o_a && ~reqcnt_o_a) begin req_a<=16'h4000; req_b<=0; state<=6; end //
            else if (ib15_req_a[1] && !reqhalt_p_a && ~reqcnt_p_a) begin req_a<=16'h8000; req_b<=0; state<=6; end //
            else if (ib00_req_b[1] && !reqhalt_a_b && ~reqcnt_a_b) begin req_b<=16'h0001; req_a<=0; state<=6; end //
            else if (ib01_req_b[1] && !reqhalt_b_b && ~reqcnt_b_b) begin req_b<=16'h0002; req_a<=0; state<=6; end //
            else if (ib02_req_b[1] && !reqhalt_c_b && ~reqcnt_c_b) begin req_b<=16'h0004; req_a<=0; state<=6; end //
            else if (ib03_req_b[1] && !reqhalt_d_b && ~reqcnt_d_b) begin req_b<=16'h0008; req_a<=0; state<=6; end //
            else if (ib04_req_b[1] && !reqhalt_e_b && ~reqcnt_e_b) begin req_b<=16'h0010; req_a<=0; state<=6; end //
            else if (ib05_req_b[1] && !reqhalt_f_b && ~reqcnt_f_b) begin req_b<=16'h0020; req_a<=0; state<=6; end //
            else if (ib06_req_b[1] && !reqhalt_g_b && ~reqcnt_g_b) begin req_b<=16'h0040; req_a<=0; state<=6; end //
            else if (ib07_req_b[1] && !reqhalt_h_b && ~reqcnt_h_b) begin req_b<=16'h0080; req_a<=0; state<=6; end //
            else if (ib08_req_b[1] && !reqhalt_i_b && ~reqcnt_i_b) begin req_b<=16'h0100; req_a<=0; state<=6; end //
            else if (ib09_req_b[1] && !reqhalt_j_b && ~reqcnt_j_b) begin req_b<=16'h0200; req_a<=0; state<=6; end //
            else if (ib10_req_b[1] && !reqhalt_k_b && ~reqcnt_k_b) begin req_b<=16'h0400; req_a<=0; state<=6; end //
            else if (ib11_req_b[1] && !reqhalt_l_b && ~reqcnt_l_b) begin req_b<=16'h0800; req_a<=0; state<=6; end //
            else if (ib12_req_b[1] && !reqhalt_m_b && ~reqcnt_m_b) begin req_b<=16'h1000; req_a<=0; state<=6; end //
            else if (ib13_req_b[1] && !reqhalt_n_b && ~reqcnt_n_b) begin req_b<=16'h2000; req_a<=0; state<=6; end //
            else if (ib14_req_b[1] && !reqhalt_o_b && ~reqcnt_o_b) begin req_b<=16'h4000; req_a<=0; state<=6; end //
            else if (ib15_req_b[1] && !reqhalt_p_b && ~reqcnt_p_b) begin req_b<=16'h8000; req_a<=0; state<=6; end //
            else                                                               state<=5;
          end
        end
        5: begin
          case (plast_a)
            0: begin
              case (elem_a)
                (`SORT_ELM>>(`P_LOG+`WAY_LOG))*1: w_addr_a <= mux32(((`SELM_PER_WAY>>(`P_LOG+3))*1) | (`SORT_ELM>>1), ((`SELM_PER_WAY>>(`P_LOG+3))*1), phase_a[0]);
                (`SORT_ELM>>(`P_LOG+`WAY_LOG))*2: w_addr_a <= mux32(((`SELM_PER_WAY>>(`P_LOG+3))*2) | (`SORT_ELM>>1), ((`SELM_PER_WAY>>(`P_LOG+3))*2), phase_a[0]);
                (`SORT_ELM>>(`P_LOG+`WAY_LOG))*3: w_addr_a <= mux32(((`SELM_PER_WAY>>(`P_LOG+3))*3) | (`SORT_ELM>>1), ((`SELM_PER_WAY>>(`P_LOG+3))*3), phase_a[0]);
                (`SORT_ELM>>(`P_LOG+`WAY_LOG))*4: w_addr_a <= mux32(((`SELM_PER_WAY>>(`P_LOG+3))*4) | (`SORT_ELM>>1), ((`SELM_PER_WAY>>(`P_LOG+3))*4), phase_a[0]);
                (`SORT_ELM>>(`P_LOG+`WAY_LOG))*5: w_addr_a <= mux32(((`SELM_PER_WAY>>(`P_LOG+3))*5) | (`SORT_ELM>>1), ((`SELM_PER_WAY>>(`P_LOG+3))*5), phase_a[0]);
                (`SORT_ELM>>(`P_LOG+`WAY_LOG))*6: w_addr_a <= mux32(((`SELM_PER_WAY>>(`P_LOG+3))*6) | (`SORT_ELM>>1), ((`SELM_PER_WAY>>(`P_LOG+3))*6), phase_a[0]);
                (`SORT_ELM>>(`P_LOG+`WAY_LOG))*7: w_addr_a <= mux32(((`SELM_PER_WAY>>(`P_LOG+3))*7) | (`SORT_ELM>>1), ((`SELM_PER_WAY>>(`P_LOG+3))*7), phase_a[0]);
                (`SORT_ELM>>(`P_LOG+`WAY_LOG))*8: w_addr_a <= mux32(((`SELM_PER_WAY>>(`P_LOG+3))*8) | (`SORT_ELM>>1), ((`SELM_PER_WAY>>(`P_LOG+3))*8), phase_a[0]);
                (`SORT_ELM>>(`P_LOG+`WAY_LOG))*9: w_addr_a <= mux32(((`SELM_PER_WAY>>(`P_LOG+3))*9) | (`SORT_ELM>>1), ((`SELM_PER_WAY>>(`P_LOG+3))*9), phase_a[0]);
                (`SORT_ELM>>(`P_LOG+`WAY_LOG))*10: w_addr_a <= mux32(((`SELM_PER_WAY>>(`P_LOG+3))*10) | (`SORT_ELM>>1), ((`SELM_PER_WAY>>(`P_LOG+3))*10), phase_a[0]);
                (`SORT_ELM>>(`P_LOG+`WAY_LOG))*11: w_addr_a <= mux32(((`SELM_PER_WAY>>(`P_LOG+3))*11) | (`SORT_ELM>>1), ((`SELM_PER_WAY>>(`P_LOG+3))*11), phase_a[0]);
                (`SORT_ELM>>(`P_LOG+`WAY_LOG))*12: w_addr_a <= mux32(((`SELM_PER_WAY>>(`P_LOG+3))*12) | (`SORT_ELM>>1), ((`SELM_PER_WAY>>(`P_LOG+3))*12), phase_a[0]);
                (`SORT_ELM>>(`P_LOG+`WAY_LOG))*13: w_addr_a <= mux32(((`SELM_PER_WAY>>(`P_LOG+3))*13) | (`SORT_ELM>>1), ((`SELM_PER_WAY>>(`P_LOG+3))*13), phase_a[0]);
                (`SORT_ELM>>(`P_LOG+`WAY_LOG))*14: w_addr_a <= mux32(((`SELM_PER_WAY>>(`P_LOG+3))*14) | (`SORT_ELM>>1), ((`SELM_PER_WAY>>(`P_LOG+3))*14), phase_a[0]);
                (`SORT_ELM>>(`P_LOG+`WAY_LOG))*15: w_addr_a <= mux32(((`SELM_PER_WAY>>(`P_LOG+3))*15) | (`SORT_ELM>>1), ((`SELM_PER_WAY>>(`P_LOG+3))*15), phase_a[0]);
              endcase
            end
            1: begin
              case (elem_a)
                (`SORT_ELM>>(`P_LOG+`WAY_LOG))*2: w_addr_a <= mux32(((`SELM_PER_WAY>>3)*1) | (`SORT_ELM>>1), ((`SELM_PER_WAY>>3)*1), phase_a[0]);
                (`SORT_ELM>>(`P_LOG+`WAY_LOG))*4: w_addr_a <= mux32(((`SELM_PER_WAY>>3)*2) | (`SORT_ELM>>1), ((`SELM_PER_WAY>>3)*2), phase_a[0]);
                (`SORT_ELM>>(`P_LOG+`WAY_LOG))*6: w_addr_a <= mux32(((`SELM_PER_WAY>>3)*3) | (`SORT_ELM>>1), ((`SELM_PER_WAY>>3)*3), phase_a[0]);
                (`SORT_ELM>>(`P_LOG+`WAY_LOG))*8: w_addr_a <= mux32(((`SELM_PER_WAY>>3)*4) | (`SORT_ELM>>1), ((`SELM_PER_WAY>>3)*4), phase_a[0]);
                (`SORT_ELM>>(`P_LOG+`WAY_LOG))*10: w_addr_a <= mux32(((`SELM_PER_WAY>>3)*5) | (`SORT_ELM>>1), ((`SELM_PER_WAY>>3)*5), phase_a[0]);
                (`SORT_ELM>>(`P_LOG+`WAY_LOG))*12: w_addr_a <= mux32(((`SELM_PER_WAY>>3)*6) | (`SORT_ELM>>1), ((`SELM_PER_WAY>>3)*6), phase_a[0]);
                (`SORT_ELM>>(`P_LOG+`WAY_LOG))*14: w_addr_a <= mux32(((`SELM_PER_WAY>>3)*7) | (`SORT_ELM>>1), ((`SELM_PER_WAY>>3)*7), phase_a[0]);
              endcase
            end
          endcase
          case (plast_b)
            0: begin
              case (elem_b)
                (`SORT_ELM>>(`P_LOG+`WAY_LOG))*1: w_addr_b <= mux32((((`SELM_PER_WAY>>(`P_LOG+3))*1) | (`SORT_ELM>>2)) | (`SORT_ELM>>1), (((`SELM_PER_WAY>>(`P_LOG+3))*1) | (`SORT_ELM>>2)), phase_b[0]);
                (`SORT_ELM>>(`P_LOG+`WAY_LOG))*2: w_addr_b <= mux32((((`SELM_PER_WAY>>(`P_LOG+3))*2) | (`SORT_ELM>>2)) | (`SORT_ELM>>1), (((`SELM_PER_WAY>>(`P_LOG+3))*2) | (`SORT_ELM>>2)), phase_b[0]);
                (`SORT_ELM>>(`P_LOG+`WAY_LOG))*3: w_addr_b <= mux32((((`SELM_PER_WAY>>(`P_LOG+3))*3) | (`SORT_ELM>>2)) | (`SORT_ELM>>1), (((`SELM_PER_WAY>>(`P_LOG+3))*3) | (`SORT_ELM>>2)), phase_b[0]);
                (`SORT_ELM>>(`P_LOG+`WAY_LOG))*4: w_addr_b <= mux32((((`SELM_PER_WAY>>(`P_LOG+3))*4) | (`SORT_ELM>>2)) | (`SORT_ELM>>1), (((`SELM_PER_WAY>>(`P_LOG+3))*4) | (`SORT_ELM>>2)), phase_b[0]);
                (`SORT_ELM>>(`P_LOG+`WAY_LOG))*5: w_addr_b <= mux32((((`SELM_PER_WAY>>(`P_LOG+3))*5) | (`SORT_ELM>>2)) | (`SORT_ELM>>1), (((`SELM_PER_WAY>>(`P_LOG+3))*5) | (`SORT_ELM>>2)), phase_b[0]);
                (`SORT_ELM>>(`P_LOG+`WAY_LOG))*6: w_addr_b <= mux32((((`SELM_PER_WAY>>(`P_LOG+3))*6) | (`SORT_ELM>>2)) | (`SORT_ELM>>1), (((`SELM_PER_WAY>>(`P_LOG+3))*6) | (`SORT_ELM>>2)), phase_b[0]);
                (`SORT_ELM>>(`P_LOG+`WAY_LOG))*7: w_addr_b <= mux32((((`SELM_PER_WAY>>(`P_LOG+3))*7) | (`SORT_ELM>>2)) | (`SORT_ELM>>1), (((`SELM_PER_WAY>>(`P_LOG+3))*7) | (`SORT_ELM>>2)), phase_b[0]);
                (`SORT_ELM>>(`P_LOG+`WAY_LOG))*8: w_addr_b <= mux32((((`SELM_PER_WAY>>(`P_LOG+3))*8) | (`SORT_ELM>>2)) | (`SORT_ELM>>1), (((`SELM_PER_WAY>>(`P_LOG+3))*8) | (`SORT_ELM>>2)), phase_b[0]);
                (`SORT_ELM>>(`P_LOG+`WAY_LOG))*9: w_addr_b <= mux32((((`SELM_PER_WAY>>(`P_LOG+3))*9) | (`SORT_ELM>>2)) | (`SORT_ELM>>1), (((`SELM_PER_WAY>>(`P_LOG+3))*9) | (`SORT_ELM>>2)), phase_b[0]);
                (`SORT_ELM>>(`P_LOG+`WAY_LOG))*10: w_addr_b <= mux32((((`SELM_PER_WAY>>(`P_LOG+3))*10) | (`SORT_ELM>>2)) | (`SORT_ELM>>1), (((`SELM_PER_WAY>>(`P_LOG+3))*10) | (`SORT_ELM>>2)), phase_b[0]);
                (`SORT_ELM>>(`P_LOG+`WAY_LOG))*11: w_addr_b <= mux32((((`SELM_PER_WAY>>(`P_LOG+3))*11) | (`SORT_ELM>>2)) | (`SORT_ELM>>1), (((`SELM_PER_WAY>>(`P_LOG+3))*11) | (`SORT_ELM>>2)), phase_b[0]);
                (`SORT_ELM>>(`P_LOG+`WAY_LOG))*12: w_addr_b <= mux32((((`SELM_PER_WAY>>(`P_LOG+3))*12) | (`SORT_ELM>>2)) | (`SORT_ELM>>1), (((`SELM_PER_WAY>>(`P_LOG+3))*12) | (`SORT_ELM>>2)), phase_b[0]);
                (`SORT_ELM>>(`P_LOG+`WAY_LOG))*13: w_addr_b <= mux32((((`SELM_PER_WAY>>(`P_LOG+3))*13) | (`SORT_ELM>>2)) | (`SORT_ELM>>1), (((`SELM_PER_WAY>>(`P_LOG+3))*13) | (`SORT_ELM>>2)), phase_b[0]);
                (`SORT_ELM>>(`P_LOG+`WAY_LOG))*14: w_addr_b <= mux32((((`SELM_PER_WAY>>(`P_LOG+3))*14) | (`SORT_ELM>>2)) | (`SORT_ELM>>1), (((`SELM_PER_WAY>>(`P_LOG+3))*14) | (`SORT_ELM>>2)), phase_b[0]);
                (`SORT_ELM>>(`P_LOG+`WAY_LOG))*15: w_addr_b <= mux32((((`SELM_PER_WAY>>(`P_LOG+3))*15) | (`SORT_ELM>>2)) | (`SORT_ELM>>1), (((`SELM_PER_WAY>>(`P_LOG+3))*15) | (`SORT_ELM>>2)), phase_b[0]);
              endcase
            end
            1: begin
              case (elem_b)
                (`SORT_ELM>>(`P_LOG+`WAY_LOG))*2: w_addr_b <= mux32(((`SELM_PER_WAY>>3)*9) | (`SORT_ELM>>1), ((`SELM_PER_WAY>>3)*9), phase_b[0]);
                (`SORT_ELM>>(`P_LOG+`WAY_LOG))*4: w_addr_b <= mux32(((`SELM_PER_WAY>>3)*10) | (`SORT_ELM>>1), ((`SELM_PER_WAY>>3)*10), phase_b[0]);
                (`SORT_ELM>>(`P_LOG+`WAY_LOG))*6: w_addr_b <= mux32(((`SELM_PER_WAY>>3)*11) | (`SORT_ELM>>1), ((`SELM_PER_WAY>>3)*11), phase_b[0]);
                (`SORT_ELM>>(`P_LOG+`WAY_LOG))*8: w_addr_b <= mux32(((`SELM_PER_WAY>>3)*12) | (`SORT_ELM>>1), ((`SELM_PER_WAY>>3)*12), phase_b[0]);
                (`SORT_ELM>>(`P_LOG+`WAY_LOG))*10: w_addr_b <= mux32(((`SELM_PER_WAY>>3)*13) | (`SORT_ELM>>1), ((`SELM_PER_WAY>>3)*13), phase_b[0]);
                (`SORT_ELM>>(`P_LOG+`WAY_LOG))*12: w_addr_b <= mux32(((`SELM_PER_WAY>>3)*14) | (`SORT_ELM>>1), ((`SELM_PER_WAY>>3)*14), phase_b[0]);
                (`SORT_ELM>>(`P_LOG+`WAY_LOG))*14: w_addr_b <= mux32(((`SELM_PER_WAY>>3)*15) | (`SORT_ELM>>1), ((`SELM_PER_WAY>>3)*15), phase_b[0]);
              endcase
            end
          endcase
          if      (ib00_req_a[0] && !reqhalt_a_a && ~reqcnt_a_a) begin req_a<=16'h0001; req_b<=0; state<=6; end // first priority
          else if (ib01_req_a[0] && !reqhalt_b_a && ~reqcnt_b_a) begin req_a<=16'h0002; req_b<=0; state<=6; end //
          else if (ib02_req_a[0] && !reqhalt_c_a && ~reqcnt_c_a) begin req_a<=16'h0004; req_b<=0; state<=6; end //
          else if (ib03_req_a[0] && !reqhalt_d_a && ~reqcnt_d_a) begin req_a<=16'h0008; req_b<=0; state<=6; end //
          else if (ib04_req_a[0] && !reqhalt_e_a && ~reqcnt_e_a) begin req_a<=16'h0010; req_b<=0; state<=6; end //
          else if (ib05_req_a[0] && !reqhalt_f_a && ~reqcnt_f_a) begin req_a<=16'h0020; req_b<=0; state<=6; end //
          else if (ib06_req_a[0] && !reqhalt_g_a && ~reqcnt_g_a) begin req_a<=16'h0040; req_b<=0; state<=6; end //
          else if (ib07_req_a[0] && !reqhalt_h_a && ~reqcnt_h_a) begin req_a<=16'h0080; req_b<=0; state<=6; end //
          else if (ib08_req_a[0] && !reqhalt_i_a && ~reqcnt_i_a) begin req_a<=16'h0100; req_b<=0; state<=6; end //
          else if (ib09_req_a[0] && !reqhalt_j_a && ~reqcnt_j_a) begin req_a<=16'h0200; req_b<=0; state<=6; end //
          else if (ib10_req_a[0] && !reqhalt_k_a && ~reqcnt_k_a) begin req_a<=16'h0400; req_b<=0; state<=6; end //
          else if (ib11_req_a[0] && !reqhalt_l_a && ~reqcnt_l_a) begin req_a<=16'h0800; req_b<=0; state<=6; end //
          else if (ib12_req_a[0] && !reqhalt_m_a && ~reqcnt_m_a) begin req_a<=16'h1000; req_b<=0; state<=6; end //
          else if (ib13_req_a[0] && !reqhalt_n_a && ~reqcnt_n_a) begin req_a<=16'h2000; req_b<=0; state<=6; end //
          else if (ib14_req_a[0] && !reqhalt_o_a && ~reqcnt_o_a) begin req_a<=16'h4000; req_b<=0; state<=6; end //
          else if (ib15_req_a[0] && !reqhalt_p_a && ~reqcnt_p_a) begin req_a<=16'h8000; req_b<=0; state<=6; end //
          else if (ib00_req_b[0] && !reqhalt_a_b && ~reqcnt_a_b) begin req_b<=16'h0001; req_a<=0; state<=6; end //
          else if (ib01_req_b[0] && !reqhalt_b_b && ~reqcnt_b_b) begin req_b<=16'h0002; req_a<=0; state<=6; end //
          else if (ib02_req_b[0] && !reqhalt_c_b && ~reqcnt_c_b) begin req_b<=16'h0004; req_a<=0; state<=6; end //
          else if (ib03_req_b[0] && !reqhalt_d_b && ~reqcnt_d_b) begin req_b<=16'h0008; req_a<=0; state<=6; end //
          else if (ib04_req_b[0] && !reqhalt_e_b && ~reqcnt_e_b) begin req_b<=16'h0010; req_a<=0; state<=6; end //
          else if (ib05_req_b[0] && !reqhalt_f_b && ~reqcnt_f_b) begin req_b<=16'h0020; req_a<=0; state<=6; end //
          else if (ib06_req_b[0] && !reqhalt_g_b && ~reqcnt_g_b) begin req_b<=16'h0040; req_a<=0; state<=6; end //
          else if (ib07_req_b[0] && !reqhalt_h_b && ~reqcnt_h_b) begin req_b<=16'h0080; req_a<=0; state<=6; end //
          else if (ib08_req_b[0] && !reqhalt_i_b && ~reqcnt_i_b) begin req_b<=16'h0100; req_a<=0; state<=6; end //
          else if (ib09_req_b[0] && !reqhalt_j_b && ~reqcnt_j_b) begin req_b<=16'h0200; req_a<=0; state<=6; end //
          else if (ib10_req_b[0] && !reqhalt_k_b && ~reqcnt_k_b) begin req_b<=16'h0400; req_a<=0; state<=6; end //
          else if (ib11_req_b[0] && !reqhalt_l_b && ~reqcnt_l_b) begin req_b<=16'h0800; req_a<=0; state<=6; end //
          else if (ib12_req_b[0] && !reqhalt_m_b && ~reqcnt_m_b) begin req_b<=16'h1000; req_a<=0; state<=6; end //
          else if (ib13_req_b[0] && !reqhalt_n_b && ~reqcnt_n_b) begin req_b<=16'h2000; req_a<=0; state<=6; end //
          else if (ib14_req_b[0] && !reqhalt_o_b && ~reqcnt_o_b) begin req_b<=16'h4000; req_a<=0; state<=6; end //
          else if (ib15_req_b[0] && !reqhalt_p_b && ~reqcnt_p_b) begin req_b<=16'h8000; req_a<=0; state<=6; end //
          else if (OB_req_a) begin OB_granted_a <= 1; OB_granted_b <= 0;     state<=7; end
          else if (OB_req_b) begin OB_granted_a <= 0; OB_granted_b <= 1;     state<=8; end
          else if (last_phase)                                               state<=1;
        end
        6: begin
          if (d_req!=0) begin d_req<=0; state<=4; end
          else if (!d_busy) begin
            case ({req_b,req_a})
              32'h00000001: begin
                d_initadr <= mux32(radr_a_a, (radr_a_a | (`SORT_ELM>>1)), phase_a[0]);
                radr_a_a  <= mux32((radr_a_a+(r_block_a_a<<3)), radr_a_a+(`D_RS), (phase_a==1));
                cnt_a_a   <= cnt_a_a+1;
                c_a_a     <= (cnt_a_a>=`WAYP_CN_);
                d_blocks  <= mux32(r_block_a_a, `DRAM_RBLOCKS, (phase_a==1));
              end
              32'h00000002: begin
                d_initadr <= mux32(radr_b_a, (radr_b_a | (`SORT_ELM>>1)), phase_a[0]);
                radr_b_a  <= mux32((radr_b_a+(r_block_b_a<<3)), radr_b_a+(`D_RS), (phase_a==1));
                cnt_b_a   <= cnt_b_a+1;
                c_b_a     <= (cnt_b_a>=`WAYP_CN_);
                d_blocks  <= mux32(r_block_b_a, `DRAM_RBLOCKS, (phase_a==1));
              end
              32'h00000004: begin
                d_initadr <= mux32(radr_c_a, (radr_c_a | (`SORT_ELM>>1)), phase_a[0]);
                radr_c_a  <= mux32((radr_c_a+(r_block_c_a<<3)), radr_c_a+(`D_RS), (phase_a==1));
                cnt_c_a   <= cnt_c_a+1;
                c_c_a     <= (cnt_c_a>=`WAYP_CN_);
                d_blocks  <= mux32(r_block_c_a, `DRAM_RBLOCKS, (phase_a==1));
              end
              32'h00000008: begin
                d_initadr <= mux32(radr_d_a, (radr_d_a | (`SORT_ELM>>1)), phase_a[0]);
                radr_d_a  <= mux32((radr_d_a+(r_block_d_a<<3)), radr_d_a+(`D_RS), (phase_a==1));
                cnt_d_a   <= cnt_d_a+1;
                c_d_a     <= (cnt_d_a>=`WAYP_CN_);
                d_blocks  <= mux32(r_block_d_a, `DRAM_RBLOCKS, (phase_a==1));
              end
              32'h00000010: begin
                d_initadr <= mux32(radr_e_a, (radr_e_a | (`SORT_ELM>>1)), phase_a[0]);
                radr_e_a  <= mux32((radr_e_a+(r_block_e_a<<3)), radr_e_a+(`D_RS), (phase_a==1));
                cnt_e_a   <= cnt_e_a+1;
                c_e_a     <= (cnt_e_a>=`WAYP_CN_);
                d_blocks  <= mux32(r_block_e_a, `DRAM_RBLOCKS, (phase_a==1));
              end
              32'h00000020: begin
                d_initadr <= mux32(radr_f_a, (radr_f_a | (`SORT_ELM>>1)), phase_a[0]);
                radr_f_a  <= mux32((radr_f_a+(r_block_f_a<<3)), radr_f_a+(`D_RS), (phase_a==1));
                cnt_f_a   <= cnt_f_a+1;
                c_f_a     <= (cnt_f_a>=`WAYP_CN_);
                d_blocks  <= mux32(r_block_f_a, `DRAM_RBLOCKS, (phase_a==1));
              end
              32'h00000040: begin
                d_initadr <= mux32(radr_g_a, (radr_g_a | (`SORT_ELM>>1)), phase_a[0]);
                radr_g_a  <= mux32((radr_g_a+(r_block_g_a<<3)), radr_g_a+(`D_RS), (phase_a==1));
                cnt_g_a   <= cnt_g_a+1;
                c_g_a     <= (cnt_g_a>=`WAYP_CN_);
                d_blocks  <= mux32(r_block_g_a, `DRAM_RBLOCKS, (phase_a==1));
              end
              32'h00000080: begin
                d_initadr <= mux32(radr_h_a, (radr_h_a | (`SORT_ELM>>1)), phase_a[0]);
                radr_h_a  <= mux32((radr_h_a+(r_block_h_a<<3)), radr_h_a+(`D_RS), (phase_a==1));
                cnt_h_a   <= cnt_h_a+1;
                c_h_a     <= (cnt_h_a>=`WAYP_CN_);
                d_blocks  <= mux32(r_block_h_a, `DRAM_RBLOCKS, (phase_a==1));
              end
              32'h00000100: begin
                d_initadr <= mux32(radr_i_a, (radr_i_a | (`SORT_ELM>>1)), phase_a[0]);
                radr_i_a  <= mux32((radr_i_a+(r_block_i_a<<3)), radr_i_a+(`D_RS), (phase_a==1));
                cnt_i_a   <= cnt_i_a+1;
                c_i_a     <= (cnt_i_a>=`WAYP_CN_);
                d_blocks  <= mux32(r_block_i_a, `DRAM_RBLOCKS, (phase_a==1));
              end
              32'h00000200: begin
                d_initadr <= mux32(radr_j_a, (radr_j_a | (`SORT_ELM>>1)), phase_a[0]);
                radr_j_a  <= mux32((radr_j_a+(r_block_j_a<<3)), radr_j_a+(`D_RS), (phase_a==1));
                cnt_j_a   <= cnt_j_a+1;
                c_j_a     <= (cnt_j_a>=`WAYP_CN_);
                d_blocks  <= mux32(r_block_j_a, `DRAM_RBLOCKS, (phase_a==1));
              end
              32'h00000400: begin
                d_initadr <= mux32(radr_k_a, (radr_k_a | (`SORT_ELM>>1)), phase_a[0]);
                radr_k_a  <= mux32((radr_k_a+(r_block_k_a<<3)), radr_k_a+(`D_RS), (phase_a==1));
                cnt_k_a   <= cnt_k_a+1;
                c_k_a     <= (cnt_k_a>=`WAYP_CN_);
                d_blocks  <= mux32(r_block_k_a, `DRAM_RBLOCKS, (phase_a==1));
              end
              32'h00000800: begin
                d_initadr <= mux32(radr_l_a, (radr_l_a | (`SORT_ELM>>1)), phase_a[0]);
                radr_l_a  <= mux32((radr_l_a+(r_block_l_a<<3)), radr_l_a+(`D_RS), (phase_a==1));
                cnt_l_a   <= cnt_l_a+1;
                c_l_a     <= (cnt_l_a>=`WAYP_CN_);
                d_blocks  <= mux32(r_block_l_a, `DRAM_RBLOCKS, (phase_a==1));
              end
              32'h00001000: begin
                d_initadr <= mux32(radr_m_a, (radr_m_a | (`SORT_ELM>>1)), phase_a[0]);
                radr_m_a  <= mux32((radr_m_a+(r_block_m_a<<3)), radr_m_a+(`D_RS), (phase_a==1));
                cnt_m_a   <= cnt_m_a+1;
                c_m_a     <= (cnt_m_a>=`WAYP_CN_);
                d_blocks  <= mux32(r_block_m_a, `DRAM_RBLOCKS, (phase_a==1));
              end
              32'h00002000: begin
                d_initadr <= mux32(radr_n_a, (radr_n_a | (`SORT_ELM>>1)), phase_a[0]);
                radr_n_a  <= mux32((radr_n_a+(r_block_n_a<<3)), radr_n_a+(`D_RS), (phase_a==1));
                cnt_n_a   <= cnt_n_a+1;
                c_n_a     <= (cnt_n_a>=`WAYP_CN_);
                d_blocks  <= mux32(r_block_n_a, `DRAM_RBLOCKS, (phase_a==1));
              end
              32'h00004000: begin
                d_initadr <= mux32(radr_o_a, (radr_o_a | (`SORT_ELM>>1)), phase_a[0]);
                radr_o_a  <= mux32((radr_o_a+(r_block_o_a<<3)), radr_o_a+(`D_RS), (phase_a==1));
                cnt_o_a   <= cnt_o_a+1;
                c_o_a     <= (cnt_o_a>=`WAYP_CN_);
                d_blocks  <= mux32(r_block_o_a, `DRAM_RBLOCKS, (phase_a==1));
              end
              32'h00008000: begin
                d_initadr <= mux32(radr_p_a, (radr_p_a | (`SORT_ELM>>1)), phase_a[0]);
                radr_p_a  <= mux32((radr_p_a+(r_block_p_a<<3)), radr_p_a+(`D_RS), (phase_a==1));
                cnt_p_a   <= cnt_p_a+1;
                c_p_a     <= (cnt_p_a>=`WAYP_CN_);
                d_blocks  <= mux32(r_block_p_a, `DRAM_RBLOCKS, (phase_a==1));
              end
              32'h00010000: begin
                d_initadr <= mux32(radr_a_b, (radr_a_b | (`SORT_ELM>>1)), phase_b[0]);
                radr_a_b  <= mux32((radr_a_b+(r_block_a_b<<3)), radr_a_b+(`D_RS), (phase_b==1));
                cnt_a_b   <= cnt_a_b+1;
                c_a_b     <= (cnt_a_b>=`WAYP_CN_);
                d_blocks  <= mux32(r_block_a_b, `DRAM_RBLOCKS, (phase_b==1));
              end
              32'h00020000: begin
                d_initadr <= mux32(radr_b_b, (radr_b_b | (`SORT_ELM>>1)), phase_b[0]);
                radr_b_b  <= mux32((radr_b_b+(r_block_b_b<<3)), radr_b_b+(`D_RS), (phase_b==1));
                cnt_b_b   <= cnt_b_b+1;
                c_b_b     <= (cnt_b_b>=`WAYP_CN_);
                d_blocks  <= mux32(r_block_b_b, `DRAM_RBLOCKS, (phase_b==1));
              end
              32'h00040000: begin
                d_initadr <= mux32(radr_c_b, (radr_c_b | (`SORT_ELM>>1)), phase_b[0]);
                radr_c_b  <= mux32((radr_c_b+(r_block_c_b<<3)), radr_c_b+(`D_RS), (phase_b==1));
                cnt_c_b   <= cnt_c_b+1;
                c_c_b     <= (cnt_c_b>=`WAYP_CN_);
                d_blocks  <= mux32(r_block_c_b, `DRAM_RBLOCKS, (phase_b==1));
              end
              32'h00080000: begin
                d_initadr <= mux32(radr_d_b, (radr_d_b | (`SORT_ELM>>1)), phase_b[0]);
                radr_d_b  <= mux32((radr_d_b+(r_block_d_b<<3)), radr_d_b+(`D_RS), (phase_b==1));
                cnt_d_b   <= cnt_d_b+1;
                c_d_b     <= (cnt_d_b>=`WAYP_CN_);
                d_blocks  <= mux32(r_block_d_b, `DRAM_RBLOCKS, (phase_b==1));
              end
              32'h00100000: begin
                d_initadr <= mux32(radr_e_b, (radr_e_b | (`SORT_ELM>>1)), phase_b[0]);
                radr_e_b  <= mux32((radr_e_b+(r_block_e_b<<3)), radr_e_b+(`D_RS), (phase_b==1));
                cnt_e_b   <= cnt_e_b+1;
                c_e_b     <= (cnt_e_b>=`WAYP_CN_);
                d_blocks  <= mux32(r_block_e_b, `DRAM_RBLOCKS, (phase_b==1));
              end
              32'h00200000: begin
                d_initadr <= mux32(radr_f_b, (radr_f_b | (`SORT_ELM>>1)), phase_b[0]);
                radr_f_b  <= mux32((radr_f_b+(r_block_f_b<<3)), radr_f_b+(`D_RS), (phase_b==1));
                cnt_f_b   <= cnt_f_b+1;
                c_f_b     <= (cnt_f_b>=`WAYP_CN_);
                d_blocks  <= mux32(r_block_f_b, `DRAM_RBLOCKS, (phase_b==1));
              end
              32'h00400000: begin
                d_initadr <= mux32(radr_g_b, (radr_g_b | (`SORT_ELM>>1)), phase_b[0]);
                radr_g_b  <= mux32((radr_g_b+(r_block_g_b<<3)), radr_g_b+(`D_RS), (phase_b==1));
                cnt_g_b   <= cnt_g_b+1;
                c_g_b     <= (cnt_g_b>=`WAYP_CN_);
                d_blocks  <= mux32(r_block_g_b, `DRAM_RBLOCKS, (phase_b==1));
              end
              32'h00800000: begin
                d_initadr <= mux32(radr_h_b, (radr_h_b | (`SORT_ELM>>1)), phase_b[0]);
                radr_h_b  <= mux32((radr_h_b+(r_block_h_b<<3)), radr_h_b+(`D_RS), (phase_b==1));
                cnt_h_b   <= cnt_h_b+1;
                c_h_b     <= (cnt_h_b>=`WAYP_CN_);
                d_blocks  <= mux32(r_block_h_b, `DRAM_RBLOCKS, (phase_b==1));
              end
              32'h01000000: begin
                d_initadr <= mux32(radr_i_b, (radr_i_b | (`SORT_ELM>>1)), phase_b[0]);
                radr_i_b  <= mux32((radr_i_b+(r_block_i_b<<3)), radr_i_b+(`D_RS), (phase_b==1));
                cnt_i_b   <= cnt_i_b+1;
                c_i_b     <= (cnt_i_b>=`WAYP_CN_);
                d_blocks  <= mux32(r_block_i_b, `DRAM_RBLOCKS, (phase_b==1));
              end
              32'h02000000: begin
                d_initadr <= mux32(radr_j_b, (radr_j_b | (`SORT_ELM>>1)), phase_b[0]);
                radr_j_b  <= mux32((radr_j_b+(r_block_j_b<<3)), radr_j_b+(`D_RS), (phase_b==1));
                cnt_j_b   <= cnt_j_b+1;
                c_j_b     <= (cnt_j_b>=`WAYP_CN_);
                d_blocks  <= mux32(r_block_j_b, `DRAM_RBLOCKS, (phase_b==1));
              end
              32'h04000000: begin
                d_initadr <= mux32(radr_k_b, (radr_k_b | (`SORT_ELM>>1)), phase_b[0]);
                radr_k_b  <= mux32((radr_k_b+(r_block_k_b<<3)), radr_k_b+(`D_RS), (phase_b==1));
                cnt_k_b   <= cnt_k_b+1;
                c_k_b     <= (cnt_k_b>=`WAYP_CN_);
                d_blocks  <= mux32(r_block_k_b, `DRAM_RBLOCKS, (phase_b==1));
              end
              32'h08000000: begin
                d_initadr <= mux32(radr_l_b, (radr_l_b | (`SORT_ELM>>1)), phase_b[0]);
                radr_l_b  <= mux32((radr_l_b+(r_block_l_b<<3)), radr_l_b+(`D_RS), (phase_b==1));
                cnt_l_b   <= cnt_l_b+1;
                c_l_b     <= (cnt_l_b>=`WAYP_CN_);
                d_blocks  <= mux32(r_block_l_b, `DRAM_RBLOCKS, (phase_b==1));
              end
              32'h10000000: begin
                d_initadr <= mux32(radr_m_b, (radr_m_b | (`SORT_ELM>>1)), phase_b[0]);
                radr_m_b  <= mux32((radr_m_b+(r_block_m_b<<3)), radr_m_b+(`D_RS), (phase_b==1));
                cnt_m_b   <= cnt_m_b+1;
                c_m_b     <= (cnt_m_b>=`WAYP_CN_);
                d_blocks  <= mux32(r_block_m_b, `DRAM_RBLOCKS, (phase_b==1));
              end
              32'h20000000: begin
                d_initadr <= mux32(radr_n_b, (radr_n_b | (`SORT_ELM>>1)), phase_b[0]);
                radr_n_b  <= mux32((radr_n_b+(r_block_n_b<<3)), radr_n_b+(`D_RS), (phase_b==1));
                cnt_n_b   <= cnt_n_b+1;
                c_n_b     <= (cnt_n_b>=`WAYP_CN_);
                d_blocks  <= mux32(r_block_n_b, `DRAM_RBLOCKS, (phase_b==1));
              end
              32'h40000000: begin
                d_initadr <= mux32(radr_o_b, (radr_o_b | (`SORT_ELM>>1)), phase_b[0]);
                radr_o_b  <= mux32((radr_o_b+(r_block_o_b<<3)), radr_o_b+(`D_RS), (phase_b==1));
                cnt_o_b   <= cnt_o_b+1;
                c_o_b     <= (cnt_o_b>=`WAYP_CN_);
                d_blocks  <= mux32(r_block_o_b, `DRAM_RBLOCKS, (phase_b==1));
              end
              32'h80000000: begin
                d_initadr <= mux32(radr_p_b, (radr_p_b | (`SORT_ELM>>1)), phase_b[0]);
                radr_p_b  <= mux32((radr_p_b+(r_block_p_b<<3)), radr_p_b+(`D_RS), (phase_b==1));
                cnt_p_b   <= cnt_p_b+1;
                c_p_b     <= (cnt_p_b>=`WAYP_CN_);
                d_blocks  <= mux32(r_block_p_b, `DRAM_RBLOCKS, (phase_b==1));
              end
            endcase
            d_req  <= `DRAM_REQ_READ;
            req_ta <= req_a;
            req_tb <= req_b;
          end
        end
        7: begin ///// WRITE data to DRAM
          if (d_req!=0) begin d_req<=0; state<=4; end
          else if (!d_busy) begin
            d_req     <= `DRAM_REQ_WRITE;     //
            d_blocks  <= w_block_a;       //
            d_initadr <= w_addr_a;            //
            w_addr_a  <= w_addr_a + (w_block_a<<3);  // address for the next write
          end
        end
        8: begin ///// WRITE data to DRAM
          if (d_req!=0) begin d_req<=0; state<=4; end
          else if (!d_busy) begin
            d_req     <= `DRAM_REQ_WRITE;     //
            d_blocks  <= w_block_b;       //
            d_initadr <= w_addr_b;            //
            w_addr_b  <= w_addr_b + (w_block_b<<3);  // address for the next write
          end
        end
      endcase
    end
  end
  always @(posedge CLK) begin
    // Stage 0
    dout_ta <= mux512(dc_dout, stnet_dout, phase_zero);
    dout_tb <= mux512(dc_dout, stnet_dout, phase_zero);
    doen_ta <= mux1(dc_cout[0], stnet_douten, phase_zero);
    doen_tb <= mux1(dc_cout[0], stnet_douten, phase_zero);
    req_taa <= dc_cout[`SORT_WAY:1];
    req_tba <= dc_cout[`SORT_WAY*2:`SORT_WAY+1];
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
  reg c_valid_a;  // check whether the data is compressed or not
  always @(posedge CLK) c_valid_a <= (OB_dot_a[`DRAMW-1:`DRAMW-33] == {32'b0,1'b1});
  always @(posedge CLK) elem_en_a <= OB_doten_a;
  always @(posedge CLK) begin
    if (RSTa) begin
      elem_a <= 0;
    end else begin
      case ({elem_en_a, (elem_a==`SRTP_ELM)})
        2'b01: elem_a <= 0;
        2'b10: elem_a <= mux32(elem_a+16, elem_a+32, c_valid_a);
      endcase
    end
  end
  always @(posedge CLK) begin
    if (RSTa) begin
      elem_way_a <= 0;
    end else begin
      case ({elem_en_a, (elem_way_a==(`SORT_ELM>>(`P_LOG+`WAY_LOG)))})
        2'b01: elem_way_a <= 0;
        2'b10: elem_way_a <= mux32(elem_way_a+16, elem_way_a+32, c_valid_a);
      endcase
    end
  end
  always @(posedge CLK) begin
    if (RSTa) begin
      elem_plast_a <= 0;
    end else begin
      case ({elem_en_a, (elem_plast_a==(`SORT_ELM>>(`P_LOG+`WAY_LOG))*2)})
        2'b01: elem_plast_a <= 0;
        2'b10: elem_plast_a <= mux32(elem_plast_a+16, elem_plast_a+32, c_valid_a);
      endcase
    end
  end
  reg c_valid_b;  // check whether the data is compressed or not
  always @(posedge CLK) c_valid_b <= (OB_dot_b[`DRAMW-1:`DRAMW-33] == {32'b0,1'b1});
  always @(posedge CLK) elem_en_b <= OB_doten_b;
  always @(posedge CLK) begin
    if (RSTb) begin
      elem_b <= 0;
    end else begin
      case ({elem_en_b, (elem_b==`SRTP_ELM)})
        2'b01: elem_b <= 0;
        2'b10: elem_b <= mux32(elem_b+16, elem_b+32, c_valid_b);
      endcase
    end
  end
  always @(posedge CLK) begin
    if (RSTb) begin
      elem_way_b <= 0;
    end else begin
      case ({elem_en_b, (elem_way_b==(`SORT_ELM>>(`P_LOG+`WAY_LOG)))})
        2'b01: elem_way_b <= 0;
        2'b10: elem_way_b <= mux32(elem_way_b+16, elem_way_b+32, c_valid_b);
      endcase
    end
  end
  always @(posedge CLK) begin
    if (RSTb) begin
      elem_plast_b <= 0;
    end else begin
      case ({elem_en_b, (elem_plast_b==(`SORT_ELM>>(`P_LOG+`WAY_LOG))*2)})
        2'b01: elem_plast_b <= 0;
        2'b10: elem_plast_b <= mux32(elem_plast_b+16, elem_plast_b+32, c_valid_b);
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