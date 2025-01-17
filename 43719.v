module WRITEMG #(parameter          SORTELM_WAY = (`SORT_ELM>>`WAY_LOG))
                (input  wire        CLK,
                 input  wire        RST,
                 input  wire        pchange,
                 input  wire        p_last,
                 input  wire        mgdrive,
                 input  wire [31:0] elem,
                 input  wire [31:0] elem_way,
                 input  wire [31:0] elem_plast,
                 input  wire [31:0] w_addr,
                 output reg  [31:0] w_block,
                 output reg  [31:0] r_endadr_a,
                 output reg  [31:0] r_endadr_b,
                 output reg  [31:0] r_endadr_c,
                 output reg  [31:0] r_endadr_d,
                 output reg  [31:0] r_endadr_e,
                 output reg  [31:0] r_endadr_f,
                 output reg  [31:0] r_endadr_g,
                 output reg  [31:0] r_endadr_h,
                 output reg  [31:0] r_endadr_i,
                 output reg  [31:0] r_endadr_j,
                 output reg  [31:0] r_endadr_k,
                 output reg  [31:0] r_endadr_l,
                 output reg  [31:0] r_endadr_m,
                 output reg  [31:0] r_endadr_n,
                 output reg  [31:0] r_endadr_o,
                 output reg  [31:0] r_endadr_p);
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
  reg [31:0] adr_a, adr_b, adr_c, adr_d, adr_e, adr_f, adr_g, adr_h, adr_i, adr_j, adr_k, adr_l, adr_m, adr_n, adr_o, adr_p;
  reg        reduce_flag;
  always @(posedge CLK) begin
    if (RST || pchange) begin
      if (RST) {adr_a, adr_b, adr_c, adr_d, adr_e, adr_f, adr_g, adr_h, adr_i, adr_j, adr_k, adr_l, adr_m, adr_n, adr_o, adr_p} <= 0;
      w_block     <= `DRAM_WBLOCKS;
      reduce_flag <= 0;
      r_endadr_a  <= adr_a;
      r_endadr_b  <= adr_b;
      r_endadr_c  <= adr_c;
      r_endadr_d  <= adr_d;
      r_endadr_e  <= adr_e;
      r_endadr_f  <= adr_f;
      r_endadr_g  <= adr_g;
      r_endadr_h  <= adr_h;
      r_endadr_i  <= adr_i;
      r_endadr_j  <= adr_j;
      r_endadr_k  <= adr_k;
      r_endadr_l  <= adr_l;
      r_endadr_m  <= adr_m;
      r_endadr_n  <= adr_n;
      r_endadr_o  <= adr_o;
      r_endadr_p  <= adr_p;
    end else begin
      case (p_last)
        1'b0: begin
          if (elem_way >= SORTELM_WAY-(`DRAM_WBLOCKS<<7)) reduce_flag <= 1;
          if (mgdrive && reduce_flag)                     w_block     <= mux32((w_block>>1), 1, (w_block==1));
          case (elem)
            SORTELM_WAY*1: begin
              w_block <= `DRAM_WBLOCKS; reduce_flag <= 0; if (reduce_flag) begin adr_a <= w_addr; end
            end
            SORTELM_WAY*2: begin
              w_block <= `DRAM_WBLOCKS; reduce_flag <= 0; if (reduce_flag) begin adr_b <= w_addr; end
            end
            SORTELM_WAY*3: begin
              w_block <= `DRAM_WBLOCKS; reduce_flag <= 0; if (reduce_flag) begin adr_c <= w_addr; end
            end
            SORTELM_WAY*4: begin
              w_block <= `DRAM_WBLOCKS; reduce_flag <= 0; if (reduce_flag) begin adr_d <= w_addr; end
            end
            SORTELM_WAY*5: begin
              w_block <= `DRAM_WBLOCKS; reduce_flag <= 0; if (reduce_flag) begin adr_e <= w_addr; end
            end
            SORTELM_WAY*6: begin
              w_block <= `DRAM_WBLOCKS; reduce_flag <= 0; if (reduce_flag) begin adr_f <= w_addr; end
            end
            SORTELM_WAY*7: begin
              w_block <= `DRAM_WBLOCKS; reduce_flag <= 0; if (reduce_flag) begin adr_g <= w_addr; end
            end
            SORTELM_WAY*8: begin
              w_block <= `DRAM_WBLOCKS; reduce_flag <= 0; if (reduce_flag) begin adr_h <= w_addr; end
            end
            SORTELM_WAY*9: begin
              w_block <= `DRAM_WBLOCKS; reduce_flag <= 0; if (reduce_flag) begin adr_i <= w_addr; end
            end
            SORTELM_WAY*10: begin
              w_block <= `DRAM_WBLOCKS; reduce_flag <= 0; if (reduce_flag) begin adr_j <= w_addr; end
            end
            SORTELM_WAY*11: begin
              w_block <= `DRAM_WBLOCKS; reduce_flag <= 0; if (reduce_flag) begin adr_k <= w_addr; end
            end
            SORTELM_WAY*12: begin
              w_block <= `DRAM_WBLOCKS; reduce_flag <= 0; if (reduce_flag) begin adr_l <= w_addr; end
            end
            SORTELM_WAY*13: begin
              w_block <= `DRAM_WBLOCKS; reduce_flag <= 0; if (reduce_flag) begin adr_m <= w_addr; end
            end
            SORTELM_WAY*14: begin
              w_block <= `DRAM_WBLOCKS; reduce_flag <= 0; if (reduce_flag) begin adr_n <= w_addr; end
            end
            SORTELM_WAY*15: begin
              w_block <= `DRAM_WBLOCKS; reduce_flag <= 0; if (reduce_flag) begin adr_o <= w_addr; end
            end
            SORTELM_WAY*16: begin
              w_block <= `DRAM_WBLOCKS; reduce_flag <= 0; if (reduce_flag) begin adr_p <= w_addr; end
            end
          endcase
        end
        1'b1: begin
          if (elem_plast >= (SORTELM_WAY*2)-(`DRAM_WBLOCKS<<7)) reduce_flag <= 1;
          if (mgdrive && reduce_flag)                           w_block     <= mux32((w_block>>1), 1, (w_block==1));
          case (elem)
            SORTELM_WAY*2: begin
              w_block <= `DRAM_WBLOCKS; reduce_flag <= 0; if (reduce_flag) begin adr_b <= w_addr; end
            end
            SORTELM_WAY*4: begin
              w_block <= `DRAM_WBLOCKS; reduce_flag <= 0; if (reduce_flag) begin adr_d <= w_addr; end
            end
            SORTELM_WAY*6: begin
              w_block <= `DRAM_WBLOCKS; reduce_flag <= 0; if (reduce_flag) begin adr_f <= w_addr; end
            end
            SORTELM_WAY*8: begin
              w_block <= `DRAM_WBLOCKS; reduce_flag <= 0; if (reduce_flag) begin adr_h <= w_addr; end
            end
            SORTELM_WAY*10: begin
              w_block <= `DRAM_WBLOCKS; reduce_flag <= 0; if (reduce_flag) begin adr_j <= w_addr; end
            end
            SORTELM_WAY*12: begin
              w_block <= `DRAM_WBLOCKS; reduce_flag <= 0; if (reduce_flag) begin adr_l <= w_addr; end
            end
            SORTELM_WAY*14: begin
              w_block <= `DRAM_WBLOCKS; reduce_flag <= 0; if (reduce_flag) begin adr_n <= w_addr; end
            end
            SORTELM_WAY*16: begin
              w_block <= `DRAM_WBLOCKS; reduce_flag <= 0; if (reduce_flag) begin adr_p <= w_addr; end
            end
          endcase
        end
      endcase
    end
  end
endmodule