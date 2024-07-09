module mig_7series_v2_0_qdr_rld_if_post_fifo #
  (
   parameter TCQ   = 100,             // clk->out delay (sim only)
   parameter DEPTH = 4,               // # of entries
   parameter WIDTH = 32               // data bus width
   )
  (
   input              clk,            // clock
   input              rst,            // synchronous reset
   input              empty_in,
   input              rd_en_in,
   input [WIDTH-1:0]  d_in,           // write data from controller
   output             empty_out,
   output [WIDTH-1:0] d_out           // write data to OUT_FIFO
   );
  // # of bits used to represent read/write pointers
  localparam PTR_BITS
             = (DEPTH == 2) ? 1 :
               (((DEPTH == 3) || (DEPTH == 4)) ? 2 : 'bx);
  integer i;
  reg [WIDTH-1:0]    mem[0:DEPTH-1];
  reg                my_empty;
  reg                my_full;
  reg [PTR_BITS-1:0] rd_ptr /* synthesis syn_maxfan = 10 */;
  reg [PTR_BITS-1:0] wr_ptr /* synthesis syn_maxfan = 10 */;
  task updt_ptrs;
    input rd;
    input wr;
    reg [1:0] next_rd_ptr;
    reg [1:0] next_wr_ptr;
    begin
      next_rd_ptr = (rd_ptr + 1'b1)%DEPTH;
      next_wr_ptr = (wr_ptr + 1'b1)%DEPTH;
      casez ({rd, wr, my_empty, my_full})
        4'b00zz: ; // No access, do nothing
        4'b0100: begin
          // Write when neither empty, nor full; check for full
          wr_ptr <= #TCQ next_wr_ptr;
          my_full <= #TCQ (next_wr_ptr == rd_ptr);
          //mem[wr_ptr] <= #TCQ d_in;
        end
        4'b0110: begin
          // Write when empty; no need to check for full
          wr_ptr <= #TCQ next_wr_ptr;
          my_empty <= #TCQ 1'b0;
          //mem[wr_ptr] <= #TCQ d_in;
        end
        4'b1000: begin
          // Read when neither empty, nor full; check for empty
          rd_ptr <= #TCQ next_rd_ptr;
          my_empty <= #TCQ (next_rd_ptr == wr_ptr);
        end
        4'b1001: begin
          // Read when full; no need to check for empty
          rd_ptr <= #TCQ next_rd_ptr;
          my_full <= #TCQ 1'b0;
        end
        4'b1100, 4'b1101, 4'b1110: begin
          // Read and write when empty, full, or neither empty/full; no need
          // to check for empty or full conditions
          rd_ptr <= #TCQ next_rd_ptr;
          wr_ptr <= #TCQ next_wr_ptr;
          //mem[wr_ptr] <= #TCQ d_in;
        end
        4'b0101, 4'b1010: ;
          // Read when empty, Write when full; Keep all pointers the same
          // and don't change any of the flags (i.e. ignore the read/write).
          // This might happen because a faulty DQS_FOUND calibration could
          // result in excessive skew between when the various IN_FIFO's
          // first become not empty. In this case, the data going to each
          // post-FIFO/IN_FIFO should be read out and discarded
        // synthesis translate_off
        default: begin
          // Covers any other cases, in particular for simulation if
          // any signals are X's
          $display("ERR %m @%t: Bad access: rd:%b,wr:%b,empty:%b,full:%b",
                   $time, rd, wr, my_empty, my_full);
          rd_ptr <= 2'bxx;
          wr_ptr <= 2'bxx;
        end
        // synthesis translate_on
      endcase
    end
  endtask
wire [WIDTH-1:0] mem_out;
  assign d_out = my_empty ? d_in : mem_out;//mem[rd_ptr];
  // The combined IN_FIFO + post FIFO is only "empty" when both are empty
  assign empty_out = empty_in & my_empty;
  always @(posedge clk)
    if (rst) begin
      my_empty <= 1'b1;
      my_full <= 1'b0;
      rd_ptr <= 'b0;
      wr_ptr <= 'b0;
    end else begin
      // Special mode: If IN_FIFO has data, and controller is reading at
      // the same time, then operate post-FIFO in "passthrough" mode (i.e.
      // don't update any of the read/write pointers, and route IN_FIFO
      // data to post-FIFO data)
      if (my_empty && !my_full && rd_en_in && !empty_in) ;
      else
        // Otherwise, we're writing to FIFO when IN_FIFO is not empty,
        // and reading from the FIFO based on the rd_en_in signal (read
        // enable from controller). The functino updt_ptrs should catch
        // an illegal conditions.
        updt_ptrs(rd_en_in, ~empty_in);
    end
wire wr_en;
assign wr_en = (!rd_en_in & !empty_in & !my_full)
             | (rd_en_in & !empty_in & !my_empty);
always @ (posedge clk)
begin
  if (wr_en)
    mem[wr_ptr] <= #TCQ d_in;
end
assign mem_out = mem [rd_ptr];
endmodule