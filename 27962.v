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
              input  wire [31:0]          r_endadr_a,
              input  wire [31:0]          r_endadr_b,
              input  wire [31:0]          r_endadr_c,
              input  wire [31:0]          r_endadr_d,
              input  wire [31:0]          r_endadr_e,
              input  wire [31:0]          r_endadr_f,
              input  wire [31:0]          r_endadr_g,
              input  wire [31:0]          r_endadr_h,
              output reg  [31:0]          r_block_a,
              output reg  [31:0]          r_block_b,
              output reg  [31:0]          r_block_c,
              output reg  [31:0]          r_block_d,
              output reg  [31:0]          r_block_e,
              output reg  [31:0]          r_block_f,
              output reg  [31:0]          r_block_g,
              output reg  [31:0]          r_block_h,
              output reg                  readend_a,
              output reg                  readend_b,
              output reg                  readend_c,
              output reg                  readend_d,
              output reg                  readend_e,
              output reg                  readend_f,
              output reg                  readend_g,
              output reg                  readend_h);
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
  wire [31:0] way0_radr = mux32(radr_a, (radr_a + (`SORT_ELM>>1)), phase_lsb);
  wire [31:0] way1_radr = mux32(radr_b, (radr_b + (`SORT_ELM>>1)), phase_lsb);
  wire [31:0] way2_radr = mux32(radr_c, (radr_c + (`SORT_ELM>>1)), phase_lsb);
  wire [31:0] way3_radr = mux32(radr_d, (radr_d + (`SORT_ELM>>1)), phase_lsb);
  wire [31:0] way4_radr = mux32(radr_e, (radr_e + (`SORT_ELM>>1)), phase_lsb);
  wire [31:0] way5_radr = mux32(radr_f, (radr_f + (`SORT_ELM>>1)), phase_lsb);
  wire [31:0] way6_radr = mux32(radr_g, (radr_g + (`SORT_ELM>>1)), phase_lsb);
  wire [31:0] way7_radr = mux32(radr_h, (radr_h + (`SORT_ELM>>1)), phase_lsb);
  reg reduce_flag_a, reduce_flag_b, reduce_flag_c, reduce_flag_d, reduce_flag_e, reduce_flag_f, reduce_flag_g, reduce_flag_h;
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
      {readend_a,readend_b,readend_c,readend_d,readend_e,readend_f,readend_g,readend_h} <= 0;
      {reduce_flag_a,reduce_flag_b,reduce_flag_c,reduce_flag_d,reduce_flag_e,reduce_flag_f,reduce_flag_g,reduce_flag_h} <= 0;
    end else begin
      readend_a <= (r_endadr_a == way0_radr);
      readend_b <= (r_endadr_b == way1_radr);
      readend_c <= (r_endadr_c == way2_radr);
      readend_d <= (r_endadr_d == way3_radr);
      readend_e <= (r_endadr_e == way4_radr);
      readend_f <= (r_endadr_f == way5_radr);
      readend_g <= (r_endadr_g == way6_radr);
      readend_h <= (r_endadr_h == way7_radr);
      if (r_endadr_a-((`D_RS)<<2) <= way0_radr) reduce_flag_a <= 1;
      if (r_endadr_b-((`D_RS)<<2) <= way1_radr) reduce_flag_b <= 1;
      if (r_endadr_c-((`D_RS)<<2) <= way2_radr) reduce_flag_c <= 1;
      if (r_endadr_d-((`D_RS)<<2) <= way3_radr) reduce_flag_d <= 1;
      if (r_endadr_e-((`D_RS)<<2) <= way4_radr) reduce_flag_e <= 1;
      if (r_endadr_f-((`D_RS)<<2) <= way5_radr) reduce_flag_f <= 1;
      if (r_endadr_g-((`D_RS)<<2) <= way6_radr) reduce_flag_g <= 1;
      if (r_endadr_h-((`D_RS)<<2) <= way7_radr) reduce_flag_h <= 1;
      if (mgdrive) begin
        case (req)
          8'h01: if (reduce_flag_a) r_block_a <= mux32((r_block_a>>1), 1, (r_block_a==1));
          8'h02: if (reduce_flag_b) r_block_b <= mux32((r_block_b>>1), 1, (r_block_b==1));
          8'h04: if (reduce_flag_c) r_block_c <= mux32((r_block_c>>1), 1, (r_block_c==1));
          8'h08: if (reduce_flag_d) r_block_d <= mux32((r_block_d>>1), 1, (r_block_d==1));
          8'h10: if (reduce_flag_e) r_block_e <= mux32((r_block_e>>1), 1, (r_block_e==1));
          8'h20: if (reduce_flag_f) r_block_f <= mux32((r_block_f>>1), 1, (r_block_f==1));
          8'h40: if (reduce_flag_g) r_block_g <= mux32((r_block_g>>1), 1, (r_block_g==1));
          8'h80: if (reduce_flag_h) r_block_h <= mux32((r_block_h>>1), 1, (r_block_h==1));
        endcase
      end
    end
  end
endmodule