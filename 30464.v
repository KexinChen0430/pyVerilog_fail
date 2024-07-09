module port
		if(i == 0) begin
			tile_control #(
				.SIZE				(TILE_SIZE),
				.LOOP				(TILE_LOOP),
				.PRV_SIZE		(TILE_PRV_SIZE),
				.PRV_LOOP		(TILE_PRV_LOOP)
			)
			TILE_CONTROL(
				.clk_i				(clk_i),
				.rst_i				(1'd0),
				.data_available_i	(en_i),
				.ram_full_i     	(ram_full),
				.pipeline_lock_i	(pipeline_lock_o[i]),
				.en_o     			(en),
				.ram_wr_o    		(ram_wr),
				.idle_o    			(network_idle_o),
				.ram_rd_o    		(ram_rd),
				.proc_unit_rst_o  (proc_unit_rst),
				.sig_mux_sel_o		(sig_mux_sel)
			);
		end
		else begin
			tile_control #(
				.SIZE				(TILE_SIZE),
				.LOOP				(TILE_LOOP),
				.PRV_SIZE		(TILE_PRV_SIZE),
				.PRV_LOOP		(TILE_PRV_LOOP)
			)
			TILE_CONTROL(
				.clk_i				(clk_i),
				.rst_i				(1'b0),
				.data_available_i	(TILES[PREV_INDEX[`ID32(i)]].data_available),
				.ram_full_i     	(ram_full),
				.pipeline_lock_i	(pipeline_lock_o[i]),
				.en_o     			(en),
				.ram_wr_o    		(ram_wr),
				.ram_rd_o    		(ram_rd),
				.proc_unit_rst_o  (proc_unit_rst),
				.sig_mux_sel_o		(sig_mux_sel)
			);
		end
		tile_datapath #(
			.SIZE					(TILE_SIZE),
			.LOOP					(TILE_LOOP),
			.PRV_SIZE			(TILE_PRV_SIZE),
			.PRV_LOOP			(TILE_PRV_LOOP),
			.BIAS					(TILE_BIAS),
			.WEIGHT_WIDTH		(WEIGHT_WIDTH)
		)
		TILE_DATA(
			.clk_i   			(clk_i),
			.rst_i				(proc_unit_rst),
			.en_i  				(en),
			.weight_bus_i 		(weight_bus),
			.sig_mux_sel_i		(sig_mux_sel),
			.data_i  			(i == 0 ? data_i[`ID8(0)] : TILES[PREV_INDEX[`ID32(i)]].buffer_data), //simplifies to TILES[i-1].buffer_data
			.data_o  			(tile_data)
		);
		weight_RAM #(
			.SIZE					(TILE_SIZE_ARRAY[`ID32(i)]),
			.MAX_DEPTH			(MEM_MAX_DEPTH_ARRAY[`ID32(i)]),
			.DIVIDER				(MEM_DIVIDER_ARRAY[`ID32(i)]),
			.WEIGHT_WIDTH		(WEIGHT_WIDTH)
		)
		weight_RAM(
			.clk_i				(clk_i),
			.rd_i					(ram_rd),
			.wr_i					(weight_wr_i[i]),
			.data_i				(weight_data_i),
			.pipeline_lock_o	(pipeline_lock_o[i]),
			.data_o				(weight_bus)
		);
		if(i != NUM_TILES - 1'b1) begin //connect read signal differently for last layer
			parameterized_RAM #(
				.SIZE					(TILE_SIZE),
				.LOOP					(TILE_LOOP),
				.NXT_LOOP			(TILE_NXT_LOOP)
			)
			TILE_BUFFER(
				.clk_i					(clk_i),
				.rd_i    				(TILES[NEXT_INDEX[`ID32(i)]].ram_rd),
				.wr_i   					(ram_wr),
				.data_i	   			(tile_data),
				.data_o   				(buffer_data),
				.ram_full_o   			(ram_full),
				.data_available_o		(data_available)
			);
		end
		else begin
			parameterized_RAM_last #(
				.SIZE					(TILE_SIZE),
				.LOOP					(TILE_LOOP)
			)
			TILE_BUFFER(
				.clk_i				(clk_i),
				.rd_i    			(data_rd_i),
				.wr_i   				(ram_wr),
				.data_i   			(tile_data),
				.data_o   			(data_o),
				.ram_full_o   		(ram_full),
				.data_available_o	(proc_complete_o)
			);
			/*
			output_arbiter #(
				.SIZE					(TILE_SIZE),
				.LOOP					(TILE_LOOP)
			)
			outputBuffer(
				.clk					(clk_i),
				.read    			(data_rd_i),
				.write   			(transfer),
				.data_i   			(activatedData),
				.data_o   			(networkOut),
				.ramFull   			(ramFull),
				.dataAvailable		(proc_complete_o)
			);
			*/
		end
	end
endgenerate
assign data_rd_o = TILES[0].ram_rd;
endmodule