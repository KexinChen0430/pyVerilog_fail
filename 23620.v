module SRAM (
             wr_en,     // write enable
             clk_wr,    // clock coming from write side of FIFO -- write signals
             wr_ptr,    // write pointer
             data_in,   // data to be written into the SRAM
             rd_en,     // read enable
             clk_rd,    // clock coming from read side of FIFO  -- read signals
             rd_ptr,    // read pointer
             data_out   // data to be read from the SRAM
            );
   // I/O %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   input  [`DATA_WIDTH_M1:0] data_in;
   input                     clk_wr,
                             clk_rd,
                             wr_en,
                             rd_en;
   input [`ADDR_WIDTH_M1:0]  wr_ptr,
                             rd_ptr;
   output [`DATA_WIDTH_M1:0] data_out;
   // Internal Registers %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   reg [`DATA_WIDTH_M1:0]    mem_array [0:128]; // Internal Memory
   reg [`DATA_WIDTH_M1:0]    data_out;          // data output
   wire [`DATA_WIDTH_M1:0]   data_in;           // data in
   // Main %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   always @(posedge clk_wr) begin
      if (wr_en) mem_array[wr_ptr]   <= #1 data_in;
   end
   always @(posedge clk_rd) begin
      if (rd_en)	data_out	<=	#1 mem_array[rd_ptr];
   end
endmodule