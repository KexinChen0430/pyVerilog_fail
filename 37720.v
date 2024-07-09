module contains a set of muxes between the sequencer AFI signals and the controller AFI signals
		reg	[AFI_ADDRESS_WIDTH-1:0] afi_addr_r;
        reg	[AFI_BANK_WIDTH-1:0] afi_ba_r;
		reg	[AFI_CONTROL_WIDTH-1:0] afi_cas_n_r;
        reg	[AFI_CLK_EN_WIDTH-1:0] afi_cke_r;
        reg	[AFI_CHIP_SELECT_WIDTH-1:0] afi_cs_n_r;
        reg	[AFI_ODT_WIDTH-1:0] afi_odt_r;
		reg	[AFI_CONTROL_WIDTH-1:0] afi_ras_n_r;
		reg	[AFI_CONTROL_WIDTH-1:0] afi_we_n_r;
		reg	[AFI_CONTROL_WIDTH-1:0] afi_rst_n_r;
        reg	[AFI_ADDRESS_WIDTH-1:0] seq_mux_address_r;
        reg	[AFI_BANK_WIDTH-1:0] seq_mux_bank_r;
        reg	[AFI_CHIP_SELECT_WIDTH-1:0] seq_mux_cs_n_r;
        reg	[AFI_CLK_EN_WIDTH-1:0] seq_mux_cke_r;
        reg	[AFI_ODT_WIDTH-1:0] seq_mux_odt_r;
        reg	[AFI_CONTROL_WIDTH-1:0] seq_mux_ras_n_r;
        reg	[AFI_CONTROL_WIDTH-1:0] seq_mux_cas_n_r;
        reg	[AFI_CONTROL_WIDTH-1:0] seq_mux_we_n_r;
        reg	[AFI_CONTROL_WIDTH-1:0] seq_mux_reset_n_r;
	always @(posedge pll_addr_cmd_clk)
	begin
		afi_addr_r <= afi_addr;
        afi_ba_r <= afi_ba;
        afi_cs_n_r <= afi_cs_n;
        afi_cke_r <= afi_cke;
        afi_odt_r <= afi_odt;
		afi_ras_n_r <= afi_ras_n;
		afi_cas_n_r <= afi_cas_n;
		afi_we_n_r <= afi_we_n;
		afi_rst_n_r <= afi_rst_n;
		seq_mux_address_r <= seq_mux_address;
        seq_mux_bank_r <= seq_mux_bank;
        seq_mux_cs_n_r <= seq_mux_cs_n;
        seq_mux_cke_r <= seq_mux_cke;
        seq_mux_odt_r <= seq_mux_odt;
        seq_mux_ras_n_r <= seq_mux_ras_n;
        seq_mux_cas_n_r <= seq_mux_cas_n;
        seq_mux_we_n_r <= seq_mux_we_n;
        seq_mux_reset_n_r <= seq_mux_reset_n;
	end
	altera_mem_if_ddr3_phy_0001_afi_mux		uafi_mux(
		.mux_sel						(mux_sel),
		.afi_address					(afi_addr_r),
		.afi_bank                       (afi_ba_r),
		.afi_cs_n                       (afi_cs_n_r),
		.afi_cke                      	(afi_cke_r),
		.afi_odt                      	(afi_odt_r),
		.afi_ras_n						(afi_ras_n_r),
		.afi_cas_n						(afi_cas_n_r),
		.afi_we_n						(afi_we_n_r),
		.afi_rst_n						(afi_rst_n_r),
		.afi_dqs_burst					(afi_dqs_burst),
		.afi_wdata						(afi_wdata),
		.afi_wdata_valid				(afi_wdata_valid),
		.afi_dm							(afi_dm),
		.afi_rdata_en					(afi_rdata_en),
		.afi_rdata_en_full				(afi_rdata_en_full),
		.afi_rdata                  	(afi_rdata),
		.afi_rdata_valid            	(afi_rdata_valid),
		.seq_mux_address                (seq_mux_address_r),
		.seq_mux_bank                   (seq_mux_bank_r),
		.seq_mux_cs_n                   (seq_mux_cs_n_r),
		.seq_mux_cke                    (seq_mux_cke_r),
		.seq_mux_odt                    (seq_mux_odt_r),
		.seq_mux_ras_n                  (seq_mux_ras_n_r),
		.seq_mux_cas_n                  (seq_mux_cas_n_r),
		.seq_mux_we_n                   (seq_mux_we_n_r),
		.seq_mux_reset_n                (seq_mux_reset_n_r),
		.seq_mux_dqs_en					(seq_mux_dqs_en),
		.seq_mux_wdata                  (seq_mux_wdata),
		.seq_mux_wdata_valid            (seq_mux_wdata_valid),
		.seq_mux_dm                     (seq_mux_dm),
		.seq_mux_rdata_en               (seq_mux_rdata_en),
		.mux_seq_rdata                  (mux_seq_rdata),
		.mux_seq_read_fifo_q            (mux_seq_read_fifo_q),
		.mux_seq_rdata_valid            (mux_seq_rdata_valid),
		.mux_phy_address                (mux_phy_address),
		.mux_phy_bank                   (mux_phy_bank),
		.mux_phy_cs_n                   (mux_phy_cs_n),
		.mux_phy_cke                    (mux_phy_cke),
		.mux_phy_odt                    (mux_phy_odt),
		.mux_phy_ras_n                  (mux_phy_ras_n),
		.mux_phy_cas_n                  (mux_phy_cas_n),
		.mux_phy_we_n                   (mux_phy_we_n),
		.mux_phy_reset_n                (mux_phy_reset_n),
		.mux_phy_dqs_en					(mux_phy_dqs_en),
		.mux_phy_wdata                  (mux_phy_wdata),
		.mux_phy_wdata_valid            (mux_phy_wdata_valid),
		.mux_phy_dm                     (mux_phy_dm),
		.mux_phy_rdata_en               (mux_phy_rdata_en),
		.mux_phy_rdata_en_full          (mux_phy_rdata_en_full),
		.phy_mux_rdata                  (phy_mux_rdata),
		.phy_mux_read_fifo_q            (phy_mux_read_fifo_q),
		.phy_mux_rdata_valid            (phy_mux_rdata_valid)
	);
	defparam uafi_mux.AFI_ADDRESS_WIDTH                  = AFI_ADDRESS_WIDTH;
	defparam uafi_mux.AFI_BANK_WIDTH                     = AFI_BANK_WIDTH;
	defparam uafi_mux.AFI_CHIP_SELECT_WIDTH              = AFI_CHIP_SELECT_WIDTH;
	defparam uafi_mux.AFI_CLK_EN_WIDTH              	 = AFI_CLK_EN_WIDTH;
	defparam uafi_mux.AFI_ODT_WIDTH              		 = AFI_ODT_WIDTH;
	defparam uafi_mux.MEM_READ_DQS_WIDTH				 = MEM_READ_DQS_WIDTH;
	defparam uafi_mux.AFI_DQS_WIDTH              		 = AFI_DQS_WIDTH;
	defparam uafi_mux.AFI_DATA_MASK_WIDTH                = AFI_DATA_MASK_WIDTH;
	defparam uafi_mux.AFI_CONTROL_WIDTH                  = AFI_CONTROL_WIDTH;
	defparam uafi_mux.AFI_DATA_WIDTH                     = AFI_DATA_WIDTH;
// The address and command datapath is responsible for adding any flop stages/extra logic that may be required between the AFI
// interface and the output DDIOs.
    altera_mem_if_ddr3_phy_0001_addr_cmd_datapath	uaddr_cmd_datapath(
		.clk		(pll_addr_cmd_clk),
		.reset_n	    		(reset_n_afi_clk[1]),
		.afi_address	    	(mux_phy_address),
        .afi_bank               (mux_phy_bank),
        .afi_cs_n               (mux_phy_cs_n),
        .afi_cke                (mux_phy_cke),
        .afi_odt                (mux_phy_odt),
        .afi_ras_n              (mux_phy_ras_n),
        .afi_cas_n              (mux_phy_cas_n),
        .afi_we_n               (mux_phy_we_n),
        .afi_rst_n            	(mux_phy_reset_n),
		.phy_ddio_address		(phy_ddio_address),
		.phy_ddio_bank 		   	(phy_ddio_bank),
		.phy_ddio_cs_n    		(phy_ddio_cs_n),
		.phy_ddio_cke    		(phy_ddio_cke),
		.phy_ddio_we_n    		(phy_ddio_we_n),
		.phy_ddio_ras_n   		(phy_ddio_ras_n),
		.phy_ddio_cas_n   		(phy_ddio_cas_n),
		.phy_ddio_reset_n   	(phy_ddio_reset_n),
	.phy_ddio_odt    			(phy_ddio_odt)
    );
        defparam uaddr_cmd_datapath.MEM_ADDRESS_WIDTH                  = MEM_ADDRESS_WIDTH;
        defparam uaddr_cmd_datapath.MEM_BANK_WIDTH                     = MEM_BANK_WIDTH;
        defparam uaddr_cmd_datapath.MEM_CHIP_SELECT_WIDTH              = MEM_CHIP_SELECT_WIDTH;
        defparam uaddr_cmd_datapath.MEM_CLK_EN_WIDTH              	   = MEM_CLK_EN_WIDTH;
        defparam uaddr_cmd_datapath.MEM_ODT_WIDTH              		   = MEM_ODT_WIDTH;
        defparam uaddr_cmd_datapath.MEM_DM_WIDTH                       = MEM_DM_WIDTH;
        defparam uaddr_cmd_datapath.MEM_CONTROL_WIDTH                  = MEM_CONTROL_WIDTH;
        defparam uaddr_cmd_datapath.MEM_DQ_WIDTH                       = MEM_DQ_WIDTH;
        defparam uaddr_cmd_datapath.MEM_READ_DQS_WIDTH                 = MEM_READ_DQS_WIDTH;
        defparam uaddr_cmd_datapath.MEM_WRITE_DQS_WIDTH                = MEM_WRITE_DQS_WIDTH;
        defparam uaddr_cmd_datapath.AFI_ADDRESS_WIDTH                  = AFI_ADDRESS_WIDTH;
        defparam uaddr_cmd_datapath.AFI_BANK_WIDTH                     = AFI_BANK_WIDTH;
        defparam uaddr_cmd_datapath.AFI_CHIP_SELECT_WIDTH              = AFI_CHIP_SELECT_WIDTH;
        defparam uaddr_cmd_datapath.AFI_CLK_EN_WIDTH              	   = AFI_CLK_EN_WIDTH;
        defparam uaddr_cmd_datapath.AFI_ODT_WIDTH              		   = AFI_ODT_WIDTH;
        defparam uaddr_cmd_datapath.AFI_DATA_MASK_WIDTH                = AFI_DATA_MASK_WIDTH;
        defparam uaddr_cmd_datapath.AFI_CONTROL_WIDTH                  = AFI_CONTROL_WIDTH;
        defparam uaddr_cmd_datapath.AFI_DATA_WIDTH                     = AFI_DATA_WIDTH;
        defparam uaddr_cmd_datapath.NUM_AC_FR_CYCLE_SHIFTS             = NUM_AC_FR_CYCLE_SHIFTS;
// The write datapath is responsible for adding any flop stages/extra logic that may be required between the AFI interface
// and the output DDIOs.
    altera_mem_if_ddr3_phy_0001_write_datapath	uwrite_datapath(
		.pll_afi_clk			(pll_afi_clk),
		.reset_n	    		(reset_n_afi_clk[2]),
		.force_oct_off			(force_oct_off),
		.phy_ddio_oct_ena		(phy_ddio_oct_ena),
		.afi_dqs_en				(mux_phy_dqs_en),
		.afi_wdata	    		(mux_phy_wdata),
		.afi_wdata_valid	    (mux_phy_wdata_valid),
		.afi_dm    				(mux_phy_dm),
		.phy_ddio_dq	    	(phy_ddio_dq),
		.phy_ddio_dqs_en		(phy_ddio_dqs_en),
		.phy_ddio_wrdata_en 	(phy_ddio_wrdata_en),
		.phy_ddio_wrdata_mask	(phy_ddio_wrdata_mask)
    );
        defparam uwrite_datapath.MEM_ADDRESS_WIDTH                  = MEM_ADDRESS_WIDTH;
        defparam uwrite_datapath.MEM_DM_WIDTH                       = MEM_DM_WIDTH;
        defparam uwrite_datapath.MEM_CONTROL_WIDTH                  = MEM_CONTROL_WIDTH;
        defparam uwrite_datapath.MEM_DQ_WIDTH                       = MEM_DQ_WIDTH;
        defparam uwrite_datapath.MEM_READ_DQS_WIDTH                 = MEM_READ_DQS_WIDTH;
        defparam uwrite_datapath.MEM_WRITE_DQS_WIDTH                = MEM_WRITE_DQS_WIDTH;
        defparam uwrite_datapath.AFI_ADDRESS_WIDTH                  = AFI_ADDRESS_WIDTH;
        defparam uwrite_datapath.AFI_DATA_MASK_WIDTH                = AFI_DATA_MASK_WIDTH;
        defparam uwrite_datapath.AFI_CONTROL_WIDTH                  = AFI_CONTROL_WIDTH;
        defparam uwrite_datapath.AFI_DATA_WIDTH                     = AFI_DATA_WIDTH;
        defparam uwrite_datapath.AFI_DQS_WIDTH                      = AFI_DQS_WIDTH;
		defparam uwrite_datapath.NUM_WRITE_PATH_FLOP_STAGES         = NUM_WRITE_PATH_FLOP_STAGES;
// The read datapath is responsible for read data resynchronization from the memory clock domain to the AFI clock domain.
// It contains 1 FIFO per DQS group for read valid prediction and 1 FIFO per DQS group for read data synchronization.
	altera_mem_if_ddr3_phy_0001_read_datapath	uread_datapath(
		.reset_n_afi_clk				(reset_n_afi_clk[3]),
        .reset_n_resync_clk         	(reset_n_resync_clk),
		.seq_read_fifo_reset			(seq_read_fifo_reset),
		.pll_afi_clk					(pll_afi_clk),
		.pll_dqs_ena_clk				(pll_dqs_ena_clk),
		.read_capture_clk				(read_capture_clk),
		.ddio_phy_dq					(ddio_phy_dq),
		.seq_read_latency_counter		(seq_read_latency_counter),
		.seq_read_increment_vfifo_fr	(seq_read_increment_vfifo_fr),
		.seq_read_increment_vfifo_hr	(seq_read_increment_vfifo_hr),
		.seq_read_increment_vfifo_qr	(seq_read_increment_vfifo_qr),
		.force_oct_off					(force_oct_off),
		.dqs_enable_ctrl				(dqs_enable_ctrl),
		.afi_rdata_en					(mux_phy_rdata_en),
		.afi_rdata_en_full				(mux_phy_rdata_en_full),
		.afi_rdata						(phy_mux_rdata),
        .phy_mux_read_fifo_q            (phy_mux_read_fifo_q),
		.afi_rdata_valid				(phy_mux_rdata_valid),
		.seq_calib_init					(seq_calib_init_reg),
		.dqs_edge_detect				(dqs_edge_detect)
	);
	defparam uread_datapath.DEVICE_FAMILY                      	= DEVICE_FAMILY;
	defparam uread_datapath.MEM_ADDRESS_WIDTH                  	= MEM_ADDRESS_WIDTH;
	defparam uread_datapath.MEM_DM_WIDTH                       	= MEM_DM_WIDTH;
	defparam uread_datapath.MEM_CONTROL_WIDTH                  	= MEM_CONTROL_WIDTH;
	defparam uread_datapath.MEM_DQ_WIDTH                       	= MEM_DQ_WIDTH;
	defparam uread_datapath.MEM_READ_DQS_WIDTH                 	= MEM_READ_DQS_WIDTH;
	defparam uread_datapath.MEM_WRITE_DQS_WIDTH                	= MEM_WRITE_DQS_WIDTH;
	defparam uread_datapath.AFI_ADDRESS_WIDTH                  	= AFI_ADDRESS_WIDTH;
	defparam uread_datapath.AFI_DATA_MASK_WIDTH                	= AFI_DATA_MASK_WIDTH;
	defparam uread_datapath.AFI_CONTROL_WIDTH                  	= AFI_CONTROL_WIDTH;
	defparam uread_datapath.AFI_DATA_WIDTH                     	= AFI_DATA_WIDTH;
	defparam uread_datapath.AFI_DQS_WIDTH                     	= AFI_DQS_WIDTH;
	defparam uread_datapath.MAX_LATENCY_COUNT_WIDTH            	= MAX_LATENCY_COUNT_WIDTH;
	defparam uread_datapath.MAX_READ_LATENCY					= MAX_READ_LATENCY;
	defparam uread_datapath.READ_FIFO_READ_MEM_DEPTH			= READ_FIFO_READ_MEM_DEPTH;
	defparam uread_datapath.READ_FIFO_READ_ADDR_WIDTH			= READ_FIFO_READ_ADDR_WIDTH;
	defparam uread_datapath.READ_FIFO_WRITE_MEM_DEPTH			= READ_FIFO_WRITE_MEM_DEPTH;
	defparam uread_datapath.READ_FIFO_WRITE_ADDR_WIDTH			= READ_FIFO_WRITE_ADDR_WIDTH;
	defparam uread_datapath.READ_VALID_FIFO_SIZE                = READ_VALID_FIFO_SIZE;
	defparam uread_datapath.READ_VALID_FIFO_READ_MEM_DEPTH		= READ_VALID_FIFO_READ_MEM_DEPTH;
	defparam uread_datapath.READ_VALID_FIFO_READ_ADDR_WIDTH		= READ_VALID_FIFO_READ_ADDR_WIDTH;
	defparam uread_datapath.READ_VALID_FIFO_WRITE_MEM_DEPTH		= READ_VALID_FIFO_WRITE_MEM_DEPTH;
	defparam uread_datapath.READ_VALID_FIFO_WRITE_ADDR_WIDTH	= READ_VALID_FIFO_WRITE_ADDR_WIDTH;
	defparam uread_datapath.READ_VALID_FIFO_PER_DQS_WIDTH		= READ_VALID_FIFO_PER_DQS_WIDTH;
	defparam uread_datapath.NUM_SUBGROUP_PER_READ_DQS			= NUM_SUBGROUP_PER_READ_DQS;
	defparam uread_datapath.MEM_T_RL					        = MEM_T_RL;
	defparam uread_datapath.CALIB_REG_WIDTH				        = CALIB_REG_WIDTH;
	defparam uread_datapath.QVLD_EXTRA_FLOP_STAGES				= QVLD_EXTRA_FLOP_STAGES;
	defparam uread_datapath.QVLD_WR_ADDRESS_OFFSET				= QVLD_WR_ADDRESS_OFFSET;
	defparam uread_datapath.FAST_SIM_MODEL				= FAST_SIM_MODEL;
// The I/O block is responsible for instantiating all the built-in I/O logic in the FPGA
	altera_mem_if_ddr3_phy_0001_new_io_pads uio_pads (
		.reset_n_addr_cmd_clk	(reset_n_addr_cmd_clk),
		.reset_n_afi_clk		(reset_n_afi_clk[1]),
        .oct_ctl_rs_value       (oct_ctl_rs_value),
        .oct_ctl_rt_value       (oct_ctl_rt_value),
		// Address and Command
		.phy_ddio_addr_cmd_clk	(pll_addr_cmd_clk),
		.phy_ddio_address 		(phy_ddio_address),
		.phy_ddio_bank   	 	(phy_ddio_bank),
		.phy_ddio_cs_n    		(phy_ddio_cs_n),
		.phy_ddio_cke    		(phy_ddio_cke),
		.phy_ddio_odt    		(phy_ddio_odt),
		.phy_ddio_we_n    		(phy_ddio_we_n),
		.phy_ddio_ras_n   		(phy_ddio_ras_n),
		.phy_ddio_cas_n   		(phy_ddio_cas_n),
		.phy_ddio_reset_n   	(phy_ddio_reset_n),
		.phy_mem_address    	(mem_a),
		.phy_mem_bank	    	(mem_ba),
		.phy_mem_cs_n	    	(mem_cs_n),
		.phy_mem_cke	    	(mem_cke),
		.phy_mem_odt	    	(mem_odt),
		.phy_mem_we_n	    	(mem_we_n),
		.phy_mem_ras_n	    	(mem_ras_n),
		.phy_mem_cas_n	    	(mem_cas_n),
		.phy_mem_reset_n	    (mem_reset_n),
		// Write
		.pll_afi_clk	    	(pll_afi_clk),
		.pll_mem_clk	    	(pll_mem_clk),
		.pll_write_clk	    	(pll_write_clk),
		.pll_dqs_ena_clk		(pll_dqs_ena_clk),
		.phy_ddio_dq	    	(phy_ddio_dq),
		.phy_ddio_dqs_en		(phy_ddio_dqs_en),
		.phy_ddio_oct_ena		(phy_ddio_oct_ena),
		.dqs_enable_ctrl		(dqs_enable_ctrl),
        .phy_ddio_wrdata_en 	(phy_ddio_wrdata_en),
        .phy_ddio_wrdata_mask   (phy_ddio_wrdata_mask),
        .phy_mem_dq             (mem_dq),
        .phy_mem_dm             (mem_dm),
        .phy_mem_ck             (mem_ck),
        .phy_mem_ck_n           (mem_ck_n),
		.mem_dqs				(mem_dqs),
		.mem_dqs_n				(mem_dqs_n),
		// Read
		.dll_phy_delayctrl		(dll_phy_delayctrl),
		.ddio_phy_dq			(ddio_phy_dq),
        .read_capture_clk       (read_capture_clk)
        ,
		.scc_clk				(pll_config_clk),
        .scc_data               (scc_data),
        .scc_dqs_ena            (scc_dqs_ena),
        .scc_dqs_io_ena         (scc_dqs_io_ena),
        .scc_dq_ena             (scc_dq_ena),
        .scc_dm_ena             (scc_dm_ena),
        .scc_upd                (scc_upd),
        .capture_strobe_tracking(capture_strobe_tracking)
    );
        defparam uio_pads.DEVICE_FAMILY                      = DEVICE_FAMILY;
		defparam uio_pads.OCT_SERIES_TERM_CONTROL_WIDTH		 = OCT_SERIES_TERM_CONTROL_WIDTH;
		defparam uio_pads.OCT_PARALLEL_TERM_CONTROL_WIDTH	 = OCT_PARALLEL_TERM_CONTROL_WIDTH;
        defparam uio_pads.MEM_ADDRESS_WIDTH                  = MEM_ADDRESS_WIDTH;
        defparam uio_pads.MEM_BANK_WIDTH                     = MEM_BANK_WIDTH;
        defparam uio_pads.MEM_CHIP_SELECT_WIDTH              = MEM_CHIP_SELECT_WIDTH;
        defparam uio_pads.MEM_CLK_EN_WIDTH              	 = MEM_CLK_EN_WIDTH;
        defparam uio_pads.MEM_CK_WIDTH              	 	 = MEM_CK_WIDTH;
        defparam uio_pads.MEM_ODT_WIDTH              		 = MEM_ODT_WIDTH;
        defparam uio_pads.MEM_DQS_WIDTH             	 	 = MEM_DQS_WIDTH;
        defparam uio_pads.MEM_DM_WIDTH                       = MEM_DM_WIDTH;
        defparam uio_pads.MEM_CONTROL_WIDTH                  = MEM_CONTROL_WIDTH;
        defparam uio_pads.MEM_DQ_WIDTH                       = MEM_DQ_WIDTH;
        defparam uio_pads.MEM_READ_DQS_WIDTH                 = MEM_READ_DQS_WIDTH;
        defparam uio_pads.MEM_WRITE_DQS_WIDTH                = MEM_WRITE_DQS_WIDTH;
        defparam uio_pads.AFI_ADDRESS_WIDTH                  = AFI_ADDRESS_WIDTH;
        defparam uio_pads.AFI_BANK_WIDTH                     = AFI_BANK_WIDTH;
        defparam uio_pads.AFI_CHIP_SELECT_WIDTH              = AFI_CHIP_SELECT_WIDTH;
        defparam uio_pads.AFI_CLK_EN_WIDTH              	 = AFI_CLK_EN_WIDTH;
        defparam uio_pads.AFI_ODT_WIDTH              		 = AFI_ODT_WIDTH;
        defparam uio_pads.AFI_DATA_MASK_WIDTH                = AFI_DATA_MASK_WIDTH;
        defparam uio_pads.AFI_CONTROL_WIDTH                  = AFI_CONTROL_WIDTH;
        defparam uio_pads.AFI_DATA_WIDTH                     = AFI_DATA_WIDTH;
        defparam uio_pads.AFI_DQS_WIDTH                      = AFI_DQS_WIDTH;
        defparam uio_pads.DLL_DELAY_CTRL_WIDTH               = DLL_DELAY_CTRL_WIDTH;
		defparam uio_pads.DQS_ENABLE_CTRL_WIDTH = READ_VALID_FIFO_WIDTH;
		defparam uio_pads.ALTDQDQS_INPUT_FREQ = ALTDQDQS_INPUT_FREQ;
		defparam uio_pads.ALTDQDQS_DELAY_CHAIN_BUFFER_MODE = ALTDQDQS_DELAY_CHAIN_BUFFER_MODE;
		defparam uio_pads.ALTDQDQS_DQS_PHASE_SETTING = ALTDQDQS_DQS_PHASE_SETTING;
		defparam uio_pads.ALTDQDQS_DQS_PHASE_SHIFT = ALTDQDQS_DQS_PHASE_SHIFT;
		defparam uio_pads.ALTDQDQS_DELAYED_CLOCK_PHASE_SETTING = ALTDQDQS_DELAYED_CLOCK_PHASE_SETTING;
	defparam uio_pads.FAST_SIM_MODEL		     = FAST_SIM_MODEL;
assign csr_soft_reset_req = 1'b0;
// Calculate the ceiling of log_2 of the input value
function integer ceil_log2;
	input integer value;
	begin
		value = value - 1;
		for (ceil_log2 = 0; value > 0; ceil_log2 = ceil_log2 + 1)
			value = value >> 1;
	end
endfunction
endmodule