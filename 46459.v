module fltcpu_mem(
                  // Clock and reset.
                  input wire           clk,
                  input wire           reset_n,
                  input wire           mem_cs,
                  input wire [3 : 0]   mem_we,
                  input wire [31 : 0]  mem_address,
                  input wire [31 : 0]  mem_wr_data,
                  output wire [31 : 0] mem_rd_data
                 );
  // Internal constant and parameter definitions.
  localparam MEM_BITS = 12:
  localparam MEM_SIZE = 2**MEM_BITS;
  // Registers including update variables and write enable.
  reg [7 : 0] mem_byte0 [0 : (MEM_SIZE - 1)];
  reg [7 : 0] mem_byte1 [0 : (MEM_SIZE - 1)];
  reg [7 : 0] mem_byte2 [0 : (MEM_SIZE - 1)];
  reg [7 : 0] mem_byte3 [0 : (MEM_SIZE - 1)];
  // Wires.
  wire [31 : 0] tmp_mem_rd_data;
  // Concurrent connectivity for ports etc.
  assign mem_rd_data = tmp_mem_rd_data;
  // reg_update
  // Update functionality for all registers in the core.
  // All registers are positive edge triggered with asynchronous
  // active low reset.
  always @ (posedge clk or negedge reset_n)
    begin
      if (!reset_n)
        begin
        end
      else
        begin
          if (mem_we[0])
            mem_byte0[mem_address[(MEM_BITS - 1) : 0]] <= mem_wr_data[07 : 00];
          if (mem_we[1])
            mem_byte1[mem_address[(MEM_BITS - 1) : 0]] <= mem_wr_data[15 : 08];
          if (mem_we[2])
            mem_byte2[mem_address[(MEM_BITS - 1) : 0]] <= mem_wr_data[23 : 16];
          if (mem_we[3])
            mem_byte3[mem_address[(MEM_BITS - 1) : 0]] <= mem_wr_data[31 : 24];
          tmp_mem_rd_data <= {mem_byte3[mem_address[(MEM_BITS - 1) : 0]],
                              mem_byte2[mem_address[(MEM_BITS - 1) : 0]],
                              mem_byte1[mem_address[(MEM_BITS - 1) : 0]],
                              mem_byte0[mem_address[(MEM_BITS - 1) : 0]]};
        end
    end // reg_update
endmodule