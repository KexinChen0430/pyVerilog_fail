module READMG(input  wire                 CLK,
              input  wire                 RST,
              input  wire                 mgdrive,
              input  wire [`SORT_WAY-1:0] req,
              input  wire                 phase_lsb,
              input  wire [31:0]          radr_a,
              input  wire [31:0]          radr_b,
              input  wire [31:0]          radr_c,
              input  wire [31:0]          radr_d,
              input  wire [31:0]          r_endadr_a,
              input  wire [31:0]          r_endadr_b,
              input  wire [31:0]          r_endadr_c,
              input  wire [31:0]          r_endadr_d,
              output reg  [31:0]          r_block_a,
              output reg  [31:0]          r_block_b,
              output reg  [31:0]          r_block_c,
              output reg  [31:0]          r_block_d,
              output reg                  readend_a,
              output reg                  readend_b,
              output reg                  readend_c,
              output reg                  readend_d);
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
  reg reduce_flag_a, reduce_flag_b, reduce_flag_c, reduce_flag_d;
  always @(posedge CLK) begin
    if (RST) begin
      r_block_a <= `DRAM_RBLOCKS;
      r_block_b <= `DRAM_RBLOCKS;
      r_block_c <= `DRAM_RBLOCKS;
      r_block_d <= `DRAM_RBLOCKS;
      {readend_a,readend_b,readend_c,readend_d} <= 0;
      {reduce_flag_a,reduce_flag_b,reduce_flag_c,reduce_flag_d} <= 0;
    end else begin
      readend_a <= (r_endadr_a == way0_radr);
      readend_b <= (r_endadr_b == way1_radr);
      readend_c <= (r_endadr_c == way2_radr);
      readend_d <= (r_endadr_d == way3_radr);
      if (r_endadr_a-((`D_RS)<<2) <= way0_radr) reduce_flag_a <= 1;
      if (r_endadr_b-((`D_RS)<<2) <= way1_radr) reduce_flag_b <= 1;
      if (r_endadr_c-((`D_RS)<<2) <= way2_radr) reduce_flag_c <= 1;
      if (r_endadr_d-((`D_RS)<<2) <= way3_radr) reduce_flag_d <= 1;
      if (mgdrive) begin
        case (req)
          4'h1: if (reduce_flag_a) r_block_a <= mux32((r_block_a>>1), 1, (r_block_a==1));
          4'h2: if (reduce_flag_b) r_block_b <= mux32((r_block_b>>1), 1, (r_block_b==1));
          4'h4: if (reduce_flag_c) r_block_c <= mux32((r_block_c>>1), 1, (r_block_c==1));
          4'h8: if (reduce_flag_d) r_block_d <= mux32((r_block_d>>1), 1, (r_block_d==1));
        endcase
      end
    end
  end
endmodule