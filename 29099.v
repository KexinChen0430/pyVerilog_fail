module instantiations.
	L1_Cache_Controller controller
	(
		.clk			(clk),
		.rst			(rst),
		.cache_cs		(cs),
		.cache_we		(we),
		.cache_hit		(cache_hit),
		.cache_dirty	(cache_dirty),
		.sram_cs		(),
		.sram_we		(),
		.stall			(stall),
		.mem_cs			(CPU.ext_mem_cs),
		.mem_we 		(CPU.ext_mem_we),
		.mem_wb 		()
	);
	SRAM #(.addr_width(5), .data_width(24), .mem_size(32)) tag_mem
	(
		.clk	(clk),
		.addr_i	(cache_index),
		.cs		(controller.sram_cs),
		.we		(controller.sram_we),
		.data_i	(cache_tag_bus_i),
		.data_o	(cache_tag_bus_o)
	);
	SRAM #(.addr_width(5), .data_width(256), .mem_size(32)) data_mem
	(
		.clk	(clk),
		.addr_i	(cache_index),
		.cs		(controller.sram_cs),
		.we		(controller.sram_we),
		.data_i	(cache_data_i),
		.data_o	(cache_data_o)
	);
endmodule