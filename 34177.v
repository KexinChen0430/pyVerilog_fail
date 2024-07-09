module socram(input clk,
              input             rst,
              output reg [31:0] data_a,
              input [31:0]      addr_a,
              output reg [31:0] data_b,
              output reg        strobe_b,
              input [31:0]      addr_b,
              input [31:0]      data_b_in,
              input [31:0]      data_b_we);
   parameter RAM_DEPTH = `C2_RAM_DEPTH;
   parameter INIT_FILE = `STR(`INIT_FILE_PATH);
   reg [31:0]                   mem [0:RAM_DEPTH-1];
   initial begin
      if (INIT_FILE != "")
         $readmemh(INIT_FILE, mem);
   end
   always @(posedge clk)
     begin
        if (data_b_we & (addr_b[31:16] == 0)) begin
           mem[addr_b] <= data_b_in;
        end
        data_a <= mem[addr_a];
        data_b <= mem[addr_b];
        strobe_b <= (addr_b[31:16] == 0);
     end
endmodule