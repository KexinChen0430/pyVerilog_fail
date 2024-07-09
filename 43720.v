module READMG(input  wire                 CLK,
              input  wire                 RST,
              input  wire                 mgdrive,
              input  wire [`SORT_WAY-1:0] req,
              input  wire                 phase_lsb,
              input  wire [31:0]          radr_a,
              input  wire [31:0]          radr_b,
              input  wire [31:0]          radr_c,
              input  wire [31:0]          radr_d,
              input  wire [31:0]          radr_e,
              input  wire [31:0]          radr_f,
              input  wire [31:0]          radr_g,
              input  wire [31:0]          radr_h,
              input  wire [31:0]          radr_i,
              input  wire [31:0]          radr_j,
              input  wire [31:0]          radr_k,
              input  wire [31:0]          radr_l,
              input  wire [31:0]          radr_m,
              input  wire [31:0]          radr_n,
              input  wire [31:0]          radr_o,
              input  wire [31:0]          radr_p,
              input  wire [31:0]          r_endadr_a,
              input  wire [31:0]          r_endadr_b,
              input  wire [31:0]          r_endadr_c,
              input  wire [31:0]          r_endadr_d,
              input  wire [31:0]          r_endadr_e,
              input  wire [31:0]          r_endadr_f,
              input  wire [31:0]          r_endadr_g,
              input  wire [31:0]          r_endadr_h,
              input  wire [31:0]          r_endadr_i,
              input  wire [31:0]          r_endadr_j,
              input  wire [31:0]          r_endadr_k,
              input  wire [31:0]          r_endadr_l,
              input  wire [31:0]          r_endadr_m,
              input  wire [31:0]          r_endadr_n,
              input  wire [31:0]          r_endadr_o,
              input  wire [31:0]          r_endadr_p,
              output reg  [31:0]          r_block_a,
              output reg  [31:0]          r_block_b,
              output reg  [31:0]          r_block_c,
              output reg  [31:0]          r_block_d,
              output reg  [31:0]          r_block_e,
              output reg  [31:0]          r_block_f,
              output reg  [31:0]          r_block_g,
              output reg  [31:0]          r_block_h,
              output reg  [31:0]          r_block_i,
              output reg  [31:0]          r_block_j,
              output reg  [31:0]          r_block_k,
              output reg  [31:0]          r_block_l,
              output reg  [31:0]          r_block_m,
              output reg  [31:0]          r_block_n,
              output reg  [31:0]          r_block_o,
              output reg  [31:0]          r_block_p,
              output reg                  readend_a,
              output reg                  readend_b,
              output reg                  readend_c,
              output reg                  readend_d,
              output reg                  readend_e,
              output reg                  readend_f,
              output reg                  readend_g,
              output reg                  readend_h,
              output reg                  readend_i,
              output reg                  readend_j,
              output reg                  readend_k,
              output reg                  readend_l,
              output reg                  readend_m,
              output reg                  readend_n,
              output reg                  readend_o,
              output reg                  readend_p);
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
  wire [31:0] way00_radr = mux32(radr_a, (radr_a + (`SORT_ELM>>1)), phase_lsb);
  wire [31:0] way01_radr = mux32(radr_b, (radr_b + (`SORT_ELM>>1)), phase_lsb);
  wire [31:0] way02_radr = mux32(radr_c, (radr_c + (`SORT_ELM>>1)), phase_lsb);
  wire [31:0] way03_radr = mux32(radr_d, (radr_d + (`SORT_ELM>>1)), phase_lsb);
  wire [31:0] way04_radr = mux32(radr_e, (radr_e + (`SORT_ELM>>1)), phase_lsb);
  wire [31:0] way05_radr = mux32(radr_f, (radr_f + (`SORT_ELM>>1)), phase_lsb);
  wire [31:0] way06_radr = mux32(radr_g, (radr_g + (`SORT_ELM>>1)), phase_lsb);
  wire [31:0] way07_radr = mux32(radr_h, (radr_h + (`SORT_ELM>>1)), phase_lsb);
  wire [31:0] way08_radr = mux32(radr_i, (radr_i + (`SORT_ELM>>1)), phase_lsb);
  wire [31:0] way09_radr = mux32(radr_j, (radr_j + (`SORT_ELM>>1)), phase_lsb);
  wire [31:0] way10_radr = mux32(radr_k, (radr_k + (`SORT_ELM>>1)), phase_lsb);
  wire [31:0] way11_radr = mux32(radr_l, (radr_l + (`SORT_ELM>>1)), phase_lsb);
  wire [31:0] way12_radr = mux32(radr_m, (radr_m + (`SORT_ELM>>1)), phase_lsb);
  wire [31:0] way13_radr = mux32(radr_n, (radr_n + (`SORT_ELM>>1)), phase_lsb);
  wire [31:0] way14_radr = mux32(radr_o, (radr_o + (`SORT_ELM>>1)), phase_lsb);
  wire [31:0] way15_radr = mux32(radr_p, (radr_p + (`SORT_ELM>>1)), phase_lsb);
  reg reduce_flag_a, reduce_flag_b, reduce_flag_c, reduce_flag_d, reduce_flag_e, reduce_flag_f, reduce_flag_g, reduce_flag_h, reduce_flag_i, reduce_flag_j, reduce_flag_k, reduce_flag_l, reduce_flag_m, reduce_flag_n, reduce_flag_o, reduce_flag_p;
  always @(posedge CLK) begin
    if (RST) begin
      r_block_a <= `DRAM_RBLOCKS;
      r_block_b <= `DRAM_RBLOCKS;
      r_block_c <= `DRAM_RBLOCKS;
      r_block_d <= `DRAM_RBLOCKS;
      r_block_e <= `DRAM_RBLOCKS;
      r_block_f <= `DRAM_RBLOCKS;
      r_block_g <= `DRAM_RBLOCKS;
      r_block_h <= `DRAM_RBLOCKS;
      r_block_i <= `DRAM_RBLOCKS;
      r_block_j <= `DRAM_RBLOCKS;
      r_block_k <= `DRAM_RBLOCKS;
      r_block_l <= `DRAM_RBLOCKS;
      r_block_m <= `DRAM_RBLOCKS;
      r_block_n <= `DRAM_RBLOCKS;
      r_block_o <= `DRAM_RBLOCKS;
      r_block_p <= `DRAM_RBLOCKS;
      {readend_a,readend_b,readend_c,readend_d,readend_e,readend_f,readend_g,readend_h,readend_i,readend_j,readend_k,readend_l,readend_m,readend_n,readend_o,readend_p} <= 0;
      {reduce_flag_a,reduce_flag_b,reduce_flag_c,reduce_flag_d,reduce_flag_e,reduce_flag_f,reduce_flag_g,reduce_flag_h,reduce_flag_i,reduce_flag_j,reduce_flag_k,reduce_flag_l,reduce_flag_m,reduce_flag_n,reduce_flag_o,reduce_flag_p} <= 0;
    end else begin
      readend_a <= (r_endadr_a == way00_radr);
      readend_b <= (r_endadr_b == way01_radr);
      readend_c <= (r_endadr_c == way02_radr);
      readend_d <= (r_endadr_d == way03_radr);
      readend_e <= (r_endadr_e == way04_radr);
      readend_f <= (r_endadr_f == way05_radr);
      readend_g <= (r_endadr_g == way06_radr);
      readend_h <= (r_endadr_h == way07_radr);
      readend_i <= (r_endadr_i == way08_radr);
      readend_j <= (r_endadr_j == way09_radr);
      readend_k <= (r_endadr_k == way10_radr);
      readend_l <= (r_endadr_l == way11_radr);
      readend_m <= (r_endadr_m == way12_radr);
      readend_n <= (r_endadr_n == way13_radr);
      readend_o <= (r_endadr_o == way14_radr);
      readend_p <= (r_endadr_p == way15_radr);
      if (r_endadr_a-((`D_RS)<<2) <= way00_radr) reduce_flag_a <= 1;
      if (r_endadr_b-((`D_RS)<<2) <= way01_radr) reduce_flag_b <= 1;
      if (r_endadr_c-((`D_RS)<<2) <= way02_radr) reduce_flag_c <= 1;
      if (r_endadr_d-((`D_RS)<<2) <= way03_radr) reduce_flag_d <= 1;
      if (r_endadr_e-((`D_RS)<<2) <= way04_radr) reduce_flag_e <= 1;
      if (r_endadr_f-((`D_RS)<<2) <= way05_radr) reduce_flag_f <= 1;
      if (r_endadr_g-((`D_RS)<<2) <= way06_radr) reduce_flag_g <= 1;
      if (r_endadr_h-((`D_RS)<<2) <= way07_radr) reduce_flag_h <= 1;
      if (r_endadr_i-((`D_RS)<<2) <= way08_radr) reduce_flag_i <= 1;
      if (r_endadr_j-((`D_RS)<<2) <= way09_radr) reduce_flag_j <= 1;
      if (r_endadr_k-((`D_RS)<<2) <= way10_radr) reduce_flag_k <= 1;
      if (r_endadr_l-((`D_RS)<<2) <= way11_radr) reduce_flag_l <= 1;
      if (r_endadr_m-((`D_RS)<<2) <= way12_radr) reduce_flag_m <= 1;
      if (r_endadr_n-((`D_RS)<<2) <= way13_radr) reduce_flag_n <= 1;
      if (r_endadr_o-((`D_RS)<<2) <= way14_radr) reduce_flag_o <= 1;
      if (r_endadr_p-((`D_RS)<<2) <= way15_radr) reduce_flag_p <= 1;
      if (mgdrive) begin
        case (req)
          16'h0001: if (reduce_flag_a) r_block_a <= mux32((r_block_a>>1), 1, (r_block_a==1));
          16'h0002: if (reduce_flag_b) r_block_b <= mux32((r_block_b>>1), 1, (r_block_b==1));
          16'h0004: if (reduce_flag_c) r_block_c <= mux32((r_block_c>>1), 1, (r_block_c==1));
          16'h0008: if (reduce_flag_d) r_block_d <= mux32((r_block_d>>1), 1, (r_block_d==1));
          16'h0010: if (reduce_flag_e) r_block_e <= mux32((r_block_e>>1), 1, (r_block_e==1));
          16'h0020: if (reduce_flag_f) r_block_f <= mux32((r_block_f>>1), 1, (r_block_f==1));
          16'h0040: if (reduce_flag_g) r_block_g <= mux32((r_block_g>>1), 1, (r_block_g==1));
          16'h0080: if (reduce_flag_h) r_block_h <= mux32((r_block_h>>1), 1, (r_block_h==1));
          16'h0100: if (reduce_flag_i) r_block_i <= mux32((r_block_i>>1), 1, (r_block_i==1));
          16'h0200: if (reduce_flag_j) r_block_j <= mux32((r_block_j>>1), 1, (r_block_j==1));
          16'h0400: if (reduce_flag_k) r_block_k <= mux32((r_block_k>>1), 1, (r_block_k==1));
          16'h0800: if (reduce_flag_l) r_block_l <= mux32((r_block_l>>1), 1, (r_block_l==1));
          16'h1000: if (reduce_flag_m) r_block_m <= mux32((r_block_m>>1), 1, (r_block_m==1));
          16'h2000: if (reduce_flag_n) r_block_n <= mux32((r_block_n>>1), 1, (r_block_n==1));
          16'h4000: if (reduce_flag_o) r_block_o <= mux32((r_block_o>>1), 1, (r_block_o==1));
          16'h8000: if (reduce_flag_p) r_block_p <= mux32((r_block_p>>1), 1, (r_block_p==1));
        endcase
      end
    end
  end
endmodule