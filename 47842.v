module main;
   reg [31:0] rval;
// generate clocks & reset
   WB_TEST_MASTER WB();
   RAM_TEST_MASTER
     #(.RAM_ASYNC_CLOCK(67))
   RAM1 (
	 .wb_clk_i(WB.wb_clk),
	 .wb_rst_n_i(WB.wb_rst));
   wb_slave_test_rams
     dut (
	  .rst_n_i  (WB.wb_rst),
	  .wb_clk_i (WB.wb_clk),
	  .wb_addr_i(WB.wb_addr[10:0]),
	  .wb_data_i(WB.wb_data_o),
	  .wb_data_o(WB.wb_data_i),
	  .wb_cyc_i (WB.wb_cyc),
	  .wb_sel_i (WB.wb_bwsel),
	  .wb_stb_i (WB.wb_stb),
	  .wb_we_i  (WB.wb_we),
	  .wb_ack_o (WB.wb_ack),
	  .clk1_i   (RAM1.ram_clk),
	  .rams_mem1k_addr_i (RAM1.ram_addr[7:0]),
	  .rams_mem1k_data_o (RAM1.ram_data_i),
	  .rams_mem1k_rd_i   (RAM1.ram_rd),
	  .rams_mem1k_data_i (RAM1.ram_data_o),
	  .rams_mem1k_wr_i   (RAM1.ram_wr),
	  .rams_mem1k_bwsel_i(RAM1.ram_bwsel),
	  .rams_mem2k_addr_i (10'b0),
	  .rams_mem2k_data_o (),
	  .rams_mem2k_rd_i   (1'b0)
	  );
   integer     i;
   integer fail = 0;
   initial begin
      wait(RAM1.ready && WB.ready);
      $display("Test simple bus reads/writes...");
      WB.verbose(1);
      WB.write32(`BASE_RAMS_MEM1K, 32'hdeadbeef);
      WB.write32(`BASE_RAMS_MEM1K + 4, 32'hcafecafe);
      WB.write32(`BASE_RAMS_MEM1K + 'h200, 32'hfacedead);
      WB.read32(`BASE_RAMS_MEM1K, rval);  if(rval != 'hdeadbeef) fail = 1;
      WB.read32(`BASE_RAMS_MEM1K + 4, rval);if(rval != 'hcafecafe) fail = 1;
      WB.read32(`BASE_RAMS_MEM1K + 'h200, rval);if(rval != 'hfacedead) fail = 1;
      $display("Test mirrored bus reads/writes...");
      WB.write32(`BASE_RAMS_MEM1K + 16, 32'h55555555);
      WB.read32(`BASE_RAMS_MEM1K + 16, rval);if(rval != 'h55555555) fail = 1;
      WB.write32(`BASE_RAMS_MEM1K + 4*`SIZE_RAMS_MEM1K + 16, 32'haaaaaaaa);
      WB.read32(`BASE_RAMS_MEM1K + 16, rval);if(rval != 'haaaaaaaa) fail = 1;
      $display("Byte-access test...");
      WB.verbose(0);
/*      for(i=0;i<32;i=i+1) WB.write8(`BASE_RAMS_MEM1K + i, i + 1);
      for(i=0;i<32;i=i+1) begin
	WB.read8(`BASE_RAMS_MEM1K + i, rval);
	 if(rval != i+1)
	   fail = 1;
      end
 */
/*
      $display("mem1k: Bus write/mem read test...");
      for(i=0;i<256;i=i+1) WB.write32(`BASE_RAMS_MEM1K + i*4, i+1);
      for(i=0;i<256;i=i+1) begin
 //	 RAM1.read32(i*4, rval);
	 if(rval != i+1) fail =1;
      end
*/
      $display("mem1k: Mem write/bus read test...");
      for(i=0;i<256;i=i+1)
	RAM1.write32(i*4, 257-i);
      for(i=0;i<2;i=i+1) begin
	 WB.read32(`BASE_RAMS_MEM1K+i*4, rval);
	 $display(rval);
	 if(rval != 257-i)
	    fail =1;
      end
      if(fail)
	$display("TESTS FAILED");
      else
	$display("TESTS PASSED");
      end
/*
      $display("mem2k: Bus write/mem read test...");
      for(i=0;i<512;i=i+1) wb_write(`BASE_RAMS_MEM2K + i*4, 113*i+41);
      @(posedge clk); // sync back to wb clock
      for(i=0;i<512;i=i+1) begin
	 ram2_read(i*4, rval);
	 if(rval != 113*i+41)
	    fail =1;
      end
   end
 -----/\----- EXCLUDED -----/\----- */
endmodule