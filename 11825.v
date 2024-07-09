module tb_top;
   reg clk, rst;
   wire [31:0] addr;
   wire        write_en;
   wire [31:0] wdata;
   wire [31:0] rdata;
   initial begin
      clk <= 0;
      rst <= 1;
      #105
	rst <= 0;
      #1000
	$finish;
   end
   always begin
      #10 clk = ~clk;
   end
`ifndef NO_DEBUG
//   always @(posedge clk) begin
//      $display("time %t, %d %d", $time, rst, dut.top_main_inst.cur_st);
//   end
`endif
   top dut(.clk(clk), .rst(rst)
`ifndef NO_MEMORY
	   ,
	   .sram_addr(addr), .sram_wdata_en(write_en),
	   .sram_wdata(wdata), .sram_rdata(rdata)
`endif
	   );
`ifndef NO_MEMORY
   mem16k mem(.clk_i(clk), .rst_i(rst),
              .addr_i(addr[31:2]), .write_en_i(write_en),
              .wdata_i(wdata), .rdata_o(rdata));
`endif
endmodule