module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					s2f_width_check ( .error(1'b1) );
		end
	endgenerate
	soc_system_hps_0_fpga_interfaces fpga_interfaces (
		.h2f_rst_n                (h2f_rst_n),                //        h2f_reset.reset_n
		.f2h_sdram0_ADDRESS       (f2h_sdram0_ADDRESS),       //  f2h_sdram0_data.address
		.f2h_sdram0_BURSTCOUNT    (f2h_sdram0_BURSTCOUNT),    //                 .burstcount
		.f2h_sdram0_WAITREQUEST   (f2h_sdram0_WAITREQUEST),   //                 .waitrequest
		.f2h_sdram0_READDATA      (f2h_sdram0_READDATA),      //                 .readdata
		.f2h_sdram0_READDATAVALID (f2h_sdram0_READDATAVALID), //                 .readdatavalid
		.f2h_sdram0_READ          (f2h_sdram0_READ),          //                 .read
		.f2h_sdram0_clk           (f2h_sdram0_clk),           // f2h_sdram0_clock.clk
		.f2h_sdram1_ADDRESS       (f2h_sdram1_ADDRESS),       //  f2h_sdram1_data.address
		.f2h_sdram1_BURSTCOUNT    (f2h_sdram1_BURSTCOUNT),    //                 .burstcount
		.f2h_sdram1_WAITREQUEST   (f2h_sdram1_WAITREQUEST),   //                 .waitrequest
		.f2h_sdram1_READDATA      (f2h_sdram1_READDATA),      //                 .readdata
		.f2h_sdram1_READDATAVALID (f2h_sdram1_READDATAVALID), //                 .readdatavalid
		.f2h_sdram1_READ          (f2h_sdram1_READ),          //                 .read
		.f2h_sdram1_clk           (f2h_sdram1_clk),           // f2h_sdram1_clock.clk
		.f2h_sdram2_ADDRESS       (f2h_sdram2_ADDRESS),       //  f2h_sdram2_data.address
		.f2h_sdram2_BURSTCOUNT    (f2h_sdram2_BURSTCOUNT),    //                 .burstcount
		.f2h_sdram2_WAITREQUEST   (f2h_sdram2_WAITREQUEST),   //                 .waitrequest
		.f2h_sdram2_READDATA      (f2h_sdram2_READDATA),      //                 .readdata
		.f2h_sdram2_READDATAVALID (f2h_sdram2_READDATAVALID), //                 .readdatavalid
		.f2h_sdram2_READ          (f2h_sdram2_READ),          //                 .read
		.f2h_sdram2_clk           (f2h_sdram2_clk),           // f2h_sdram2_clock.clk
		.f2h_sdram3_ADDRESS       (f2h_sdram3_ADDRESS),       //  f2h_sdram3_data.address
		.f2h_sdram3_BURSTCOUNT    (f2h_sdram3_BURSTCOUNT),    //                 .burstcount
		.f2h_sdram3_WAITREQUEST   (f2h_sdram3_WAITREQUEST),   //                 .waitrequest
		.f2h_sdram3_WRITEDATA     (f2h_sdram3_WRITEDATA),     //                 .writedata
		.f2h_sdram3_BYTEENABLE    (f2h_sdram3_BYTEENABLE),    //                 .byteenable
		.f2h_sdram3_WRITE         (f2h_sdram3_WRITE),         //                 .write
		.f2h_sdram3_clk           (f2h_sdram3_clk),           // f2h_sdram3_clock.clk
		.f2h_sdram4_ADDRESS       (f2h_sdram4_ADDRESS),       //  f2h_sdram4_data.address
		.f2h_sdram4_BURSTCOUNT    (f2h_sdram4_BURSTCOUNT),    //                 .burstcount
		.f2h_sdram4_WAITREQUEST   (f2h_sdram4_WAITREQUEST),   //                 .waitrequest
		.f2h_sdram4_WRITEDATA     (f2h_sdram4_WRITEDATA),     //                 .writedata
		.f2h_sdram4_BYTEENABLE    (f2h_sdram4_BYTEENABLE),    //                 .byteenable
		.f2h_sdram4_WRITE         (f2h_sdram4_WRITE),         //                 .write
		.f2h_sdram4_clk           (f2h_sdram4_clk),           // f2h_sdram4_clock.clk
		.i2c1_scl                 (i2c1_scl),                 //      i2c1_scl_in.clk
		.i2c1_out_clk             (i2c1_out_clk),             //         i2c1_clk.clk
		.i2c1_out_data            (i2c1_out_data),            //             i2c1.out_data
		.i2c1_sda                 (i2c1_sda)                  //                 .sda
	);
	soc_system_hps_0_hps_io hps_io (
		.mem_a       (mem_a),       // memory.mem_a
		.mem_ba      (mem_ba),      //       .mem_ba
		.mem_ck      (mem_ck),      //       .mem_ck
		.mem_ck_n    (mem_ck_n),    //       .mem_ck_n
		.mem_cke     (mem_cke),     //       .mem_cke
		.mem_cs_n    (mem_cs_n),    //       .mem_cs_n
		.mem_ras_n   (mem_ras_n),   //       .mem_ras_n
		.mem_cas_n   (mem_cas_n),   //       .mem_cas_n
		.mem_we_n    (mem_we_n),    //       .mem_we_n
		.mem_reset_n (mem_reset_n), //       .mem_reset_n
		.mem_dq      (mem_dq),      //       .mem_dq
		.mem_dqs     (mem_dqs),     //       .mem_dqs
		.mem_dqs_n   (mem_dqs_n),   //       .mem_dqs_n
		.mem_odt     (mem_odt),     //       .mem_odt
		.mem_dm      (mem_dm),      //       .mem_dm
		.oct_rzqin   (oct_rzqin)    //       .oct_rzqin
	);
endmodule