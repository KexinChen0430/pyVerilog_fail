module bw_r_irf (/*AUTOARG*/
   // Outputs
   so, irf_byp_rs1_data_d_l, irf_byp_rs2_data_d_l,
   irf_byp_rs3_data_d_l, irf_byp_rs3h_data_d_l,
   // Inputs
   rclk, reset_l, si, se, sehold, rst_tri_en, ifu_exu_tid_s2,
   ifu_exu_rs1_s, ifu_exu_rs2_s, ifu_exu_rs3_s, ifu_exu_ren1_s,
   ifu_exu_ren2_s, ifu_exu_ren3_s, ecl_irf_wen_w, ecl_irf_wen_w2,
   ecl_irf_rd_m, ecl_irf_rd_g, byp_irf_rd_data_w, byp_irf_rd_data_w2,
   ecl_irf_tid_m, ecl_irf_tid_g, rml_irf_old_lo_cwp_e,
   rml_irf_new_lo_cwp_e, rml_irf_old_e_cwp_e, rml_irf_new_e_cwp_e,
   rml_irf_swap_even_e, rml_irf_swap_odd_e, rml_irf_swap_local_e,
   rml_irf_kill_restore_w, rml_irf_cwpswap_tid_e, rml_irf_old_agp,
   rml_irf_new_agp, rml_irf_swap_global, rml_irf_global_tid
   ) ;
   input rclk;
   input reset_l;
   input si;
   input se;
   input sehold;
   input rst_tri_en;
   input [1:0]  ifu_exu_tid_s2;  // s stage thread
   input [4:0]  ifu_exu_rs1_s;  // source addresses
   input [4:0]  ifu_exu_rs2_s;
   input [4:0]  ifu_exu_rs3_s;
   input ifu_exu_ren1_s;        // read enables for all 3 ports
   input ifu_exu_ren2_s;
   input ifu_exu_ren3_s;
   input ecl_irf_wen_w;        // write enables for both write ports
   input ecl_irf_wen_w2;
   input [4:0]  ecl_irf_rd_m;   // w destination
   input [4:0]  ecl_irf_rd_g;  // w2 destination
   input [71:0] byp_irf_rd_data_w;// write data from w1
   input [71:0] byp_irf_rd_data_w2;     // write data from w2
   input [1:0]  ecl_irf_tid_m;  // w stage thread
   input [1:0]  ecl_irf_tid_g; // w2 thread
   input [2:0]  rml_irf_old_lo_cwp_e;  // current window pointer for locals and odds
   input [2:0]  rml_irf_new_lo_cwp_e;  // target window pointer for locals and odds
   input [2:1]  rml_irf_old_e_cwp_e;  // current window pointer for evens
   input [2:1]  rml_irf_new_e_cwp_e;  // target window pointer for evens
   input        rml_irf_swap_even_e;
   input        rml_irf_swap_odd_e;
   input        rml_irf_swap_local_e;
   input        rml_irf_kill_restore_w;
   input [1:0]  rml_irf_cwpswap_tid_e;
   input [1:0]  rml_irf_old_agp; // alternate global pointer
   input [1:0]  rml_irf_new_agp; // alternate global pointer
   input        rml_irf_swap_global;
   input [1:0]  rml_irf_global_tid;
   output       so;
   output [71:0] irf_byp_rs1_data_d_l;
   output [71:0] irf_byp_rs2_data_d_l;
   output [71:0] irf_byp_rs3_data_d_l;
   output [31:0] irf_byp_rs3h_data_d_l;
   reg [71:0] irf_byp_rs1_data_d;
   reg [71:0] irf_byp_rs2_data_d;
   reg [71:0] irf_byp_rs3_data_d;
   reg [71:0] irf_byp_rs3h_data_d;
   reg [71:0]    active_window [127:0];// 32x4 72 bit registers
   reg [71:0]    locals[255:0];      // 4x8x8 registers
   reg [71:0]    evens[127:0];      // 4x4x8 registers
   reg [71:0]    odds[127:0];      // 4x4x8 registers
   reg [71:0]    globals[127:0];      // 4x4x8 registers
   // registers for manipulating windows
   reg [6:0] active_pointer;
   reg [7:0] regfile_pointer;
   reg [5:0] i;
   wire [1:0]  ecl_irf_tid_w;  // w stage thread
   wire [1:0]  ecl_irf_tid_w2; // w2 thread
   wire [4:0]  ecl_irf_rd_w;   // w destination
   wire [4:0]  ecl_irf_rd_w2;  // w2 destination
   wire [1:0]  ifu_exu_thr_d;  // d stage thread
   wire ifu_exu_ren1_d;        // read enables for all 3 ports
   wire ifu_exu_ren2_d;
   wire ifu_exu_ren3_d;
   wire [4:0]  ifu_exu_rs1_d;  // source addresses
   wire [4:0]  ifu_exu_rs2_d;
   wire [4:0]  ifu_exu_rs3_d;
   wire [6:0]    thr_rs1;       // these 5 are a combination of the thr and reg
   wire [6:0]    thr_rs2;       // so that comparison can be done more easily
   wire [6:0]    thr_rs3;
   wire [6:0]    thr_rs3h;
   wire [6:0]    thr_rd_w;
   wire [6:0]    thr_rd_w2;
   reg [1:0] cwpswap_tid_m;
   reg [1:0] cwpswap_tid_w;
   reg [2:0] old_lo_cwp_m;
   reg [2:0] new_lo_cwp_m;
   reg [2:0] new_lo_cwp_w;
   reg [1:0] old_e_cwp_m;
   reg [1:0] new_e_cwp_m;
   reg [1:0] new_e_cwp_w;
   reg       swap_local_m;
   reg       swap_local_w;
   reg       swap_even_m;
   reg       swap_even_w;
   reg       swap_odd_m;
   reg       swap_odd_w;
   reg       kill_restore_d1;
   reg        swap_global_d1;
   reg        swap_global_d2;
   reg [1:0]  global_tid_d1;
   reg [1:0]  global_tid_d2;
   reg [1:0] old_agp_d1,
             new_agp_d1,
             new_agp_d2;
   reg [71:0] active_win_thr_rd_w_neg;
   reg        active_win_thr_rd_w_neg_wr_en;
   reg [6:0]  thr_rd_w_neg;
   reg [71:0] active_win_thr_rd_w2_neg;
   reg        active_win_thr_rd_w2_neg_wr_en;
   reg [6:0]  thr_rd_w2_neg;
   reg        rst_tri_en_neg;
   wire          se;
   wire          clk;
   assign        clk = rclk & reset_l;
   wire          ren1_s;
   wire          ren2_s;
   wire          ren3_s;
   wire [4:0]    rs1_s;
   wire [4:0]    rs2_s;
   wire [4:0]    rs3_s;
   wire [1:0]    tid_s;
   wire [1:0]    tid_g;
   wire [1:0]    tid_m;
   wire [4:0]    rd_m;
   wire [4:0]    rd_g;
   wire          kill_restore_w;
   wire          swap_global_d1_vld;
   wire          swap_local_m_vld;
   wire          swap_even_m_vld;
   wire          swap_odd_m_vld;
   assign {ren1_s,ren2_s,ren3_s,rs1_s[4:0],rs2_s[4:0],rs3_s[4:0],tid_s[1:0],tid_g[1:0],tid_m[1:0],
           rd_m[4:0], rd_g[4:0]} = (sehold)?
          {ifu_exu_ren1_d,ifu_exu_ren2_d,ifu_exu_ren3_d,ifu_exu_rs1_d[4:0],ifu_exu_rs2_d[4:0],
           ifu_exu_rs3_d[4:0],ifu_exu_thr_d[1:0],ecl_irf_tid_w2[1:0],ecl_irf_tid_w[1:0],
           ecl_irf_rd_w[4:0],ecl_irf_rd_w2[4:0]}:
          {ifu_exu_ren1_s,ifu_exu_ren2_s,ifu_exu_ren3_s,ifu_exu_rs1_s[4:0],ifu_exu_rs2_s[4:0],
           ifu_exu_rs3_s[4:0],ifu_exu_tid_s2[1:0],ecl_irf_tid_g[1:0],ecl_irf_tid_m[1:0],
           ecl_irf_rd_m[4:0],ecl_irf_rd_g[4:0]};
   // Pipeline flops for irf control signals
   dff_s dff_ren1_s2d(.din(ren1_s), .clk(clk), .q(ifu_exu_ren1_d), .se(se),
                    .si(), .so());
   dff_s dff_ren2_s2d(.din(ren2_s), .clk(clk), .q(ifu_exu_ren2_d), .se(se),
                    .si(), .so());
   dff_s dff_ren3_s2d(.din(ren3_s), .clk(clk), .q(ifu_exu_ren3_d), .se(se),
                    .si(), .so());
   dff_s #5 dff_rs1_s2d(.din(rs1_s[4:0]), .clk(clk), .q(ifu_exu_rs1_d[4:0]), .se(se),
                      .si(),.so());
   dff_s #5 dff_rs2_s2d(.din(rs2_s[4:0]), .clk(clk), .q(ifu_exu_rs2_d[4:0]), .se(se),
                      .si(),.so());
   dff_s #5 dff_rs3_s2d(.din(rs3_s[4:0]), .clk(clk), .q(ifu_exu_rs3_d[4:0]), .se(se),
                      .si(),.so());
   dff_s #2 dff_thr_s2d(.din(tid_s[1:0]), .clk(clk), .q(ifu_exu_thr_d[1:0]), .se(se),
                      .si(),.so());
   dff_s #2 dff_thr_g2w2(.din(tid_g[1:0]), .clk(clk), .q(ecl_irf_tid_w2[1:0]), .se(se),
                      .si(),.so());
   dff_s #2 dff_thr_m2w(.din(tid_m[1:0]), .clk(clk), .q(ecl_irf_tid_w[1:0]), .se(se),
                      .si(),.so());
   dff_s #5 dff_rd_m2w(.din(rd_m[4:0]), .clk(clk), .q(ecl_irf_rd_w[4:0]), .se(se),
                      .si(),.so());
   dff_s #5 dff_rd_g2w2(.din(rd_g[4:0]), .clk(clk), .q(ecl_irf_rd_w2[4:0]), .se(se),
                      .si(),.so());
   // Concatenate the thread and rs1/rd bits together
   assign        thr_rs1[6:0] = {ifu_exu_thr_d, ifu_exu_rs1_d};
   assign        thr_rs2[6:0] = {ifu_exu_thr_d, ifu_exu_rs2_d};
   assign        thr_rs3[6:0] = {ifu_exu_thr_d, ifu_exu_rs3_d[4:0]};
   assign        thr_rs3h[6:0] = {ifu_exu_thr_d[1:0], ifu_exu_rs3_d[4:1], 1'b1};
   assign        thr_rd_w[6:0] = {ecl_irf_tid_w, ecl_irf_rd_w};
   assign        thr_rd_w2[6:0] = {ecl_irf_tid_w2, ecl_irf_rd_w2};
   // Active low outputs
   assign        irf_byp_rs1_data_d_l[71:0] = ~irf_byp_rs1_data_d[71:0];
   assign        irf_byp_rs2_data_d_l[71:0] = ~irf_byp_rs2_data_d[71:0];
   assign        irf_byp_rs3_data_d_l[71:0] = ~irf_byp_rs3_data_d[71:0];
   assign        irf_byp_rs3h_data_d_l[31:0] = ~irf_byp_rs3h_data_d[31:0];
   // Read port 1
   always @ ( clk ) begin
      if (clk) irf_byp_rs1_data_d <= {72{1'bx}};
      else begin
         if (ifu_exu_ren1_d) begin // read enable must be high
            if (thr_rs1[4:0] == 5'b0) irf_byp_rs1_data_d <= {72{1'b0}};
            else begin
               if ((ecl_irf_wen_w && (thr_rs1 == thr_rd_w)) || // check r/w conflict
                   (ecl_irf_wen_w2 && (thr_rs1 == thr_rd_w2))) begin
                  irf_byp_rs1_data_d <= {72{1'bx}};  // rw conflict gives x
               end
               else begin
                  irf_byp_rs1_data_d <= active_window[thr_rs1[6:0]];
               end
            end
         end
         // output disabled
         else begin
            irf_byp_rs1_data_d <= {72{1'bx}};
         end
      end
   end
   // Read port 2
   always @ ( clk ) begin
      if (clk) irf_byp_rs2_data_d <= {72{1'bx}};
      else begin
         if (ifu_exu_ren2_d) begin
            if (thr_rs2[4:0] == 5'b0) irf_byp_rs2_data_d <= {72{1'b0}};
            else if ((ecl_irf_wen_w && (thr_rs2 == thr_rd_w)) ||
                     (ecl_irf_wen_w2 && (thr_rs2 == thr_rd_w2)))
              irf_byp_rs2_data_d <= {72{1'bx}};
            else begin
               irf_byp_rs2_data_d <= active_window[thr_rs2];
            end
         end
         // output disabled
         else irf_byp_rs2_data_d <= {72{1'bx}};
      end
   end
   // Read port 3
   always @ ( clk ) begin
      if (clk) irf_byp_rs3_data_d <= {72{1'bx}};
      else begin
         if (ifu_exu_ren3_d) begin
            if (thr_rs3[4:0] == 5'b0) irf_byp_rs3_data_d[71:0] <= {72{1'b0}};
            else if ((ecl_irf_wen_w && (thr_rs3 == thr_rd_w)) ||
                     (ecl_irf_wen_w2 && (thr_rs3 == thr_rd_w2)))
              begin
                 irf_byp_rs3_data_d[71:0] <= {72{1'bx}};
              end
            else begin
               irf_byp_rs3_data_d[71:0] <= active_window[thr_rs3];
            end
         end
         // output disabled
         else begin
            irf_byp_rs3_data_d[71:0] <= {72{1'bx}};
         end
      end
   end
   // Read port 3h
   always @ ( clk ) begin
      if (clk) irf_byp_rs3h_data_d[71:0] <= {72{1'bx}};
      else begin
         if (ifu_exu_ren3_d) begin
            if (thr_rs3h[4:0] == 5'b0) irf_byp_rs3h_data_d[71:0] <= 72'b0;
            else if ((ecl_irf_wen_w && (thr_rs3h == thr_rd_w)) ||
                     (ecl_irf_wen_w2 && (thr_rs3h == thr_rd_w2)))
              begin
                 irf_byp_rs3h_data_d[71:0] <= {72{1'bx}};
              end
            else begin
               irf_byp_rs3h_data_d[71:0] <= active_window[thr_rs3h];
            end
         end
         // output disabled
         else begin
            irf_byp_rs3h_data_d[71:0] <= {72{1'bx}};
         end
      end
   end
   // This is a latch that works if both wen is high and clk is low
   always @(negedge clk) begin
      rst_tri_en_neg <= rst_tri_en;
      // write conflict results in X written to destination
      if (ecl_irf_wen_w & ecl_irf_wen_w2 & (thr_rd_w[6:0] == thr_rd_w2[6:0])) begin
         active_win_thr_rd_w_neg <= {72{1'bx}};
         thr_rd_w_neg <= thr_rd_w;
         active_win_thr_rd_w_neg_wr_en <= 1'b1;
         active_win_thr_rd_w2_neg_wr_en <= 1'b0;
      end
      else begin
         // W1 write port
         if (ecl_irf_wen_w & (thr_rd_w[4:0] != 5'b0)) begin
            active_win_thr_rd_w_neg <= byp_irf_rd_data_w;
            thr_rd_w_neg <= thr_rd_w;
            active_win_thr_rd_w_neg_wr_en <= 1'b1;
         end
         else
           active_win_thr_rd_w_neg_wr_en <= 1'b0;
         // W2 write port
         if (ecl_irf_wen_w2 & (thr_rd_w2[4:0] != 5'b0)) begin
            active_win_thr_rd_w2_neg <= byp_irf_rd_data_w2;
            thr_rd_w2_neg <= thr_rd_w2;
            active_win_thr_rd_w2_neg_wr_en <= 1'b1;
         end
         else
           active_win_thr_rd_w2_neg_wr_en <= 1'b0;
      end
   end
/* MOVED TO CMP ENVIRONMENT
   initial begin
      // Hardcode R0 to zero
      active_window[{2'b00, 5'b00000}] = 72'b0;
      active_window[{2'b01, 5'b00000}] = 72'b0;
      active_window[{2'b10, 5'b00000}] = 72'b0;
      active_window[{2'b11, 5'b00000}] = 72'b0;
   end
*/
   // Window management logic
   // Pipeline flops for control signals
   // cwp swap signals
   assign kill_restore_w = (sehold)? kill_restore_d1: rml_irf_kill_restore_w;
   assign swap_local_m_vld = swap_local_m & ~rst_tri_en;
   assign swap_odd_m_vld = swap_odd_m & ~rst_tri_en;
   assign swap_even_m_vld = swap_even_m & ~rst_tri_en;
   assign swap_global_d1_vld = swap_global_d1 & ~rst_tri_en;
   always @ (posedge clk) begin
      cwpswap_tid_m[1:0] <= (sehold)? cwpswap_tid_m[1:0]: rml_irf_cwpswap_tid_e[1:0];
      cwpswap_tid_w[1:0] <= cwpswap_tid_m[1:0];
      old_lo_cwp_m[2:0] <= (sehold)? old_lo_cwp_m[2:0]: rml_irf_old_lo_cwp_e[2:0];
      new_lo_cwp_m[2:0] <= (sehold)? new_lo_cwp_m[2:0]: rml_irf_new_lo_cwp_e[2:0];
      new_lo_cwp_w[2:0] <= new_lo_cwp_m[2:0];
      old_e_cwp_m[1:0] <= (sehold)? old_e_cwp_m[1:0]: rml_irf_old_e_cwp_e[2:1];
      new_e_cwp_m[1:0] <= (sehold)? new_e_cwp_m[1:0]: rml_irf_new_e_cwp_e[2:1];
      new_e_cwp_w[1:0] <= new_e_cwp_m[1:0];
      swap_local_m <= (sehold)? swap_local_m & rst_tri_en: rml_irf_swap_local_e;
      swap_local_w <= swap_local_m_vld;
      swap_odd_m <= (sehold)? swap_odd_m & rst_tri_en: rml_irf_swap_odd_e;
      swap_odd_w <= swap_odd_m_vld;
      swap_even_m <= (sehold)? swap_even_m & rst_tri_en: rml_irf_swap_even_e;
      swap_even_w <= swap_even_m_vld;
      kill_restore_d1 <= kill_restore_w;
   end
   // global swap signals
   always @ (posedge clk) begin
      swap_global_d1 <= (sehold)? swap_global_d1 & rst_tri_en: rml_irf_swap_global;
      swap_global_d2 <= swap_global_d1_vld;
      global_tid_d1[1:0] <= (sehold)? global_tid_d1[1:0]: rml_irf_global_tid[1:0];
      global_tid_d2[1:0] <= global_tid_d1[1:0];
      old_agp_d1[1:0] <= (sehold)? old_agp_d1[1:0]: rml_irf_old_agp[1:0];
      new_agp_d1[1:0] <= (sehold)? new_agp_d1[1:0]: rml_irf_new_agp[1:0];
      new_agp_d2[1:0] <= new_agp_d1[1:0];
   end
   // Globals
   // rml inputs are latched on rising edge
   // 1st cycle used for decode
   // 2nd cycle stores active window in phase 1
   // 3rd cycle loads new globals in phase 1
   always @ (posedge clk) begin
      if (active_win_thr_rd_w_neg_wr_en & (~rst_tri_en | ~rst_tri_en_neg)) begin
         active_window[thr_rd_w_neg] = active_win_thr_rd_w_neg;
      end
      if (active_win_thr_rd_w2_neg_wr_en & (~rst_tri_en | ~rst_tri_en_neg)) begin
         active_window[thr_rd_w2_neg] = active_win_thr_rd_w2_neg;
      end
      // save active globals in phase 1
      if (swap_global_d1_vld) begin
         for (i = 6'd0; i < 6'd8; i = i + 1) begin
            active_pointer[6:0] = {global_tid_d1[1:0], i[4:0]};
            regfile_pointer[7:0] = {1'b0, global_tid_d1[1:0], old_agp_d1[1:0], i[2:0]};
            // prevent back to back swaps on same thread
            if (swap_global_d2 & (global_tid_d1[1:0] == global_tid_d2[1:0])) begin
               globals[regfile_pointer[6:0]] = {72{1'bx}};
            end
            else globals[regfile_pointer[6:0]] = active_window[active_pointer[6:0]];
         end
      end
    // load in new active globals in phase 2
      if (swap_global_d2) begin
         for (i = 6'd0; i < 6'd8; i = i + 1) begin
            active_pointer[6:0] = {global_tid_d2[1:0], i[4:0]};
            regfile_pointer[7:0] = {1'b0, global_tid_d2[1:0], new_agp_d2[1:0], i[2:0]};
            if (swap_global_d1_vld & (global_tid_d1[1:0] == global_tid_d2[1:0])) begin
               active_window[active_pointer] = {72{1'bx}};
               globals[regfile_pointer[6:0]] = {72{1'bx}};
            end
            else active_window[active_pointer] = globals[regfile_pointer[6:0]];
         end
      end
   // locals, ins and outs
   // E - set up inputs to flop
   // M - Decode
   // W (phase 1) - Save
   // W (phase 2) - write is allowed for save because restore will get killed
   // W2 (phase 1) - Restore
   // W2 (phase 2) - write is allowed
   // actions that occur in phase one are modelled as occurring on the
   // rising edge
   // swaps to the same thread in consecutive cycles not allowed
       if (swap_local_m_vld) begin
          // save the locals (16-23 in active window)
          for (i = 6'd16; i < 6'd24; i = i + 1) begin
             active_pointer[6:0] = {cwpswap_tid_m[1:0], i[4:0]};
             regfile_pointer[7:0] = {cwpswap_tid_m[1:0], old_lo_cwp_m[2:0], i[2:0]};
             if (swap_local_w & ~kill_restore_w & (cwpswap_tid_m[1:0] == cwpswap_tid_w[1:0]))
               locals[regfile_pointer[7:0]] = {72{1'bx}};
             else
               locals[regfile_pointer[7:0]] = active_window[active_pointer];
          end
       end
       if (swap_even_m_vld) begin
          // save the ins in even window (24-31 in active window)
          for (i = 6'd24; i < 6'd32; i = i + 1) begin
             active_pointer[6:0] = {cwpswap_tid_m[1:0], i[4:0]};
             regfile_pointer[7:0] = {1'b0, cwpswap_tid_m[1:0], old_e_cwp_m[1:0], i[2:0]};
             if (swap_even_w & ~kill_restore_w & (cwpswap_tid_m[1:0] == cwpswap_tid_w[1:0]))
               evens[regfile_pointer[6:0]] = {72{1'bx}};
             else
               evens[regfile_pointer[6:0]] = active_window[active_pointer];
          end
       end
       if (swap_odd_m_vld) begin
          // save the ins in odd window (8-15 in active window)
          for (i = 6'd8; i < 6'd16; i = i + 1) begin
             active_pointer[6:0] = {cwpswap_tid_m[1:0], i[4:0]};
             regfile_pointer[7:0] = {1'b0, cwpswap_tid_m[1:0], old_lo_cwp_m[2:1], i[2:0]};
             if (swap_odd_w & ~kill_restore_w & (cwpswap_tid_m[1:0] == cwpswap_tid_w[1:0]))
               odds[regfile_pointer[6:0]] = {72{1'bx}};
             else
               odds[regfile_pointer[6:0]] = active_window[active_pointer];
          end
       end
       if(~kill_restore_w) begin
          if (swap_local_w) begin
            // restore the locals (16-23 in active window)
            for (i = 6'd16; i < 6'd24; i = i + 1) begin
               active_pointer[6:0] = {cwpswap_tid_w[1:0], i[4:0]};
               regfile_pointer[7:0] = {cwpswap_tid_w[1:0], new_lo_cwp_w[2:0], i[2:0]};
               if (swap_local_m_vld & (cwpswap_tid_m[1:0] == cwpswap_tid_w[1:0])) begin
                 active_window[active_pointer] = {72{1'bx}};
                 locals[regfile_pointer[7:0]] = {72{1'bx}};
               end
               else
                 active_window[active_pointer] = locals[regfile_pointer[7:0]];
            end
         end
         if (swap_even_w) begin
            // restore the ins in even window (24-32 in active window)
            for (i = 6'd24; i < 6'd32; i = i + 1) begin
               active_pointer[6:0] = {cwpswap_tid_w[1:0], i[4:0]};
               regfile_pointer[7:0] = {1'b0, cwpswap_tid_w[1:0], new_e_cwp_w[1:0], i[2:0]};
               if (swap_even_m_vld & (cwpswap_tid_m[1:0] == cwpswap_tid_w[1:0])) begin
                 active_window[active_pointer] = {72{1'bx}};
                 evens[regfile_pointer[6:0]] = {72{1'bx}};
	       end
               else
                 active_window[active_pointer] = evens[regfile_pointer[6:0]];
            end
         end
         if (swap_odd_w) begin
            // restore the ins in odd window (8-16 in active window)
            for (i = 6'd8; i < 6'd16; i = i + 1) begin
               active_pointer[6:0] = {cwpswap_tid_w[1:0], i[4:0]};
               regfile_pointer[7:0] = {1'b0, cwpswap_tid_w[1:0], new_lo_cwp_w[2:1], i[2:0]};
               if (swap_odd_m_vld & (cwpswap_tid_m[1:0] == cwpswap_tid_w[1:0])) begin
                 active_window[active_pointer] = {72{1'bx}};
                 odds[regfile_pointer[6:0]]  = {72{1'bx}};
	       end
               else
                 active_window[active_pointer] = odds[regfile_pointer[6:0]];
            end
         end
       end
    end // always @ (posedge clk)
endmodule