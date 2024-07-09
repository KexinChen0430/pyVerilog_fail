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
                 output reg  [31:0] r_endadr_d);
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
  reg [31:0] adr_a, adr_b, adr_c, adr_d;
  reg        reduce_flag;
  always @(posedge CLK) begin
    if (RST || pchange) begin
      if (RST) {adr_a, adr_b, adr_c, adr_d} <= 0;
      w_block     <= `DRAM_WBLOCKS;
      reduce_flag <= 0;
      r_endadr_a  <= adr_a;
      r_endadr_b  <= adr_b;
      r_endadr_c  <= adr_c;
      r_endadr_d  <= adr_d;
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
          endcase
        end
      endcase
    end
  end
endmodule