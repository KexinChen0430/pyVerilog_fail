module top ();
   wire clk;
   wire reset_n;
   wire stall;
   wire [`ADDR_WIDTH-1:0] PC_value;
   wire                   ifu_rd_req;
   wire [`ADDR_WIDTH-1:0] ifu_rd_addr;
   wire [`DATA_WIDTH-1:0] ifu_rd_data;
   wire                   exec_rd_req;
   wire [`ADDR_WIDTH-1:0] exec_rd_addr;
   wire [`DATA_WIDTH-1:0] exec_rd_data;
   wire                   exec_wr_req;
   wire [`ADDR_WIDTH-1:0] exec_wr_addr;
   wire [`DATA_WIDTH-1:0] exec_wr_data;
   wire [`ADDR_WIDTH-1:0] base_addr;
   pdp_mem_opcode_s pdp_mem_opcode;
   pdp_op7_opcode_s pdp_op7_opcode;
   clkgen_driver #(
      .CLOCK_PERIOD(10),
      .RESET_DURATION(500)) clkgen_driver (
      .clk     (clk),
      .reset_n (reset_n));
 // memory_pdp      memory_pdp (.*);  //for determinsitic
 instr_decode    instr_decode(.*);
 test_instr_decode test_instr_decode(.*);
endmodule