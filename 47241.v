module
	i2c_master_top #( .ARST_LVL(1'b0) ) i2c (
		.wb_clk_i(clock_48),
		.wb_rst_i(1'b0),
		.arst_i(global_reset_n),
		.wb_adr_i(wb_adr[2:0]),
		.wb_dat_i(wb_dat),
		.wb_dat_o(i2c_dout),
		.wb_we_i(wb_we[2]),
		.wb_stb_i(wb_stb[2]),
		.wb_cyc_i(wb_stb[2]),
		.wb_ack_o(i2c_ack),
		.wb_inta_o(i2c_interrupt),
		.scl_pad_i(I2C_SCL),
		.scl_pad_o(sclo),
		.scl_padoen_o(scloen),
		.sda_pad_i(I2C_SDA),
		.sda_pad_o(sdao),
		.sda_padoen_o(sdaoen)
	);
	// Dummy SYNC general
	video fake_video(
		// Clocking in
		.clk_i(clock_40),
		// Video out
		.hsync(HSYNC),
		.vsync(VSYNC),
		.de(VDE),
		.clk_o(VCLK),
		.r(R),
		.g(G),
		.b(B),
		// Video ram access
		.A_o(vram_A),
		.D_i(vram_D),
		// Offset for scrolling
		.video_offset_i(video_offset)
	);
	// Dummy I2S audio driver
	reg [7:0] audio_sync[0:4];
	always @(negedge clock_audio)
	begin
		audio_sync[4] <= audio_sync[3];
		audio_sync[3] <= audio_sync[2];
		audio_sync[2] <= audio_sync[1];
		audio_sync[1] <= audio_sync[0];
		audio_sync[0] <= audio_signal;
	end
	i2s_audio audio(
		.clk_i(clock_audio),
		.left_i({audio_sync[4],8'd0}),
		.right_i({audio_sync[4],8'd0}),
		.i2s_o(I2S),
		.lrclk_o(LRCLK),
		.sclk_o(ASCLK)
	);
	// uP to WB Master I/F for SDCard controller
	wire [31:0] sdc_adr, sdc_dati, sdc_dato;
	wire [3:0] sdc_sel;
	wire sdc_we, sdc_stb, sdc_cyc, sdc_ack;
	up2wb sdc_if (
		// Master Signals
		.clk_i(clock_48),
		.reset_i(~global_reset_n),
		// uP Interface
		.A_i(io_a),
		.D_i(io_data),
		.D_o(sdc_dout),
		.wr_i(~io_nwr[4'ha]),
		.rd_i(~io_nrd[4'ha]),
		// WB Interface
		.adr_o(sdc_adr),
		.dat_o(sdc_dato),
		.dat_i(sdc_dati),
		.we_o(sdc_we),
		.sel_o(sdc_sel),
		.stb_o(sdc_stb),
		.cyc_o(sdc_cyc),
		.ack_i(sdc_ack)
	);
	wire [31:0] sd_ma, sd_mdi,sd_mdo;
	wire sd_sel, sd_we, sd_cyc, sd_stb, sd_ack;
	// SDCard Controller
	sdc_controller sdmmc (
           // WISHBONE common
           .wb_clk_i(clock_48),
           .wb_rst_i(~global_reset_n),
           // WISHBONE slave
           .wb_dat_i(sdc_dato),
           .wb_dat_o(sdc_dati),
           .wb_adr_i(sdc_adr[7:0]),
           .wb_sel_i(sdc_sel),
           .wb_we_i(sdc_we),
           .wb_cyc_i(sdc_cyc),
           .wb_stb_i(sdc_stb),
           .wb_ack_o(sdc_ack),
           // WISHBONE master
           .m_wb_dat_o(sd_mdo),
           .m_wb_dat_i(sd_mdi),
           .m_wb_adr_o(sd_ma),
           .m_wb_sel_o(sd_sel),
           .m_wb_we_o(sd_we),
           .m_wb_cyc_o(sd_cyc),
           .m_wb_stb_o(sd_stb),
           .m_wb_ack_i(sd_ack),
           .m_wb_cti_o(),
           .m_wb_bte_o(),
           //SD BUS
           .sd_cmd_dat_i(mmccmd_i),
           .sd_cmd_out_o(mmccmd_o),
           .sd_cmd_oe_o(mmccmd_oe),
           .sd_dat_dat_i(mmcdata_i),
           .sd_dat_out_o(mmcdata_o),
           .sd_dat_oe_o(mmcdata_oe),
           .sd_clk_o_pad(mmcclk_o),
           .sd_clk_i_pad(clock_48),
			  // Interrupts
           .int_cmd(),
           .int_data()
       );
	reg sd_last_stb = 1'b0;
	always @(posedge clock_48) sd_last_stb <= sd_stb;
	wire stb_rise = ({sd_last_stb, sd_stb} == 2'b01);
	reg [1:0] ack_counter;
	always @(posedge clock_48)
	begin
		if( ~sd_stb ) ack_counter = 2'd0;
		else ack_counter = (ack_counter == 2'd2) ? 2'd0 : ack_counter + 1'b1;
	end
	// Ack only every third cycle for read to allow data through the blockram registers
	assign sd_ack = (sd_we) ? sd_stb : (ack_counter == 2'd2);
	wire [15:0] SD_A;
	wire [7:0] SD_D, SD_Q;
	wire SD_WE;
	// Buffers data to/from SD card
	sdcard_buffer sd_buffer (
		.aclr_a(~global_reset_n),
		.aclr_b(~global_reset_n),
		.address_a(sd_ma[9:2]),		// Word aligned
		.address_b(SD_A[9:0]),
		.clock_a(clock_48),
		.clock_b(clock_48),
		.data_a({sd_mdo[7:0], sd_mdo[15:8], sd_mdo[23:16],sd_mdo[31:24]}),	// Quartus mangles byte order 32-8 conversion
		.data_b(SD_D),
		.wren_a(sd_we & stb_rise),	// One write cycle
		.wren_b(SD_WE),
		.q_a({sd_mdi[7:0],sd_mdi[15:8],sd_mdi[23:16],sd_mdi[31:24]}),			// Quartus mangles byte order 32-8 conversion
		.q_b(SD_Q)
	);
	// Buffer In/Out Data for SD Card
	blockram_spool brs (
		// System signals
		.clk_i(clock_48),
		.areset_i(~global_reset_n),
		// Blockram Interface
		.address_o(SD_A[9:0]),		// Only 1024 bytes in buffer
		.data_o(SD_D),
		.q_i(SD_Q),
		.wren_o(SD_WE),
		// CPC Interface
		.A_i(io_a),
		.D_i(io_data),
		.D_o(brs_dout),
		.rd_i(~io_nrd[4'hb]),
		.wr_i(~io_nwr[4'hb])
		);
	// End of SDCard controller
	// USB ULPI
	usb_ulpi usb (
		// Bus Interface
		.clk_i(io_clk),
		.reset_i(~global_reset_n),
		.A(io_a),
		.D_i(io_data),
		.D_o(usb_dout),
		.wr_i( ~io_nwr[6] ),
		.rd_i( ~io_nrd[6] ),
		// Phy Interface
		.usb_clkin(usb_clkin),
		.usb_dir(usb_dir),
		.usb_nxt(usb_nxt),
		.usb_stp(usb_stp),
		.usb_reset(usb_reset),
		.usb_data_i(usb_data_i),
		.usb_data_o(usb_data_o),
		.usb_data_oe(usb_data_oe)
	);
	// ===============================================================================
	// ======== This is the real CPC Core ============================================
	// ===============================================================================
	cpc_core core (
		.clk_16(clock_16),
		.clk_4(clock_4),
		.clk_1(clock_1),
		.nreset_i(~cpcctl_dout[0]),
		// Video memory access here
		.video_clk_i(clock_40),
		.video_A_o(vram_A),
		.video_D_o(vram_D),
		.video_offset_o(video_offset),
		.keyboard_i(keyboard_data),
		.audio_o(audio_signal),
		// Shared ROM
		.romram_addr_o(romram_addr),
		.romram_data_i(romram_data2cpc),
		.romram_data_o(romram_data2mem),
		.romram_enable_o(romram_enable),
		.romram_rd_o(romram_rd),
		.romram_wr_o(romram_wr),
		.romram_valid_i(hyper_valid),
		.romflags_i(rom_flags),
		// FDC Interface
		.fdc_motor(fdc_motor),
		.fdc_activity(fdc_activity),
		.S_clk_i(clock_48),
		.S_A_i(io_a),
		.S_D_i(support_dout),
		.S_D_o(fdc_dout),
		.S_rd_i(~io_nrd[4]),
		.S_wr_i(~io_nwr[4]),
		.S_enable_i(~(io_nrd[4] & io_nwr[4])),
		.S_fdc_int_o(fdc_interrupt)
		);
	// ===============================================================================
endmodule