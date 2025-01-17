module is version 1.20
        */
        /*
          local definitions
        */
        `define REG_00_OFFS 0 // reg_0x0
        `define REG_04_OFFS 1 // reg_0x4
        `define REG_08_OFFS 2 // reg_0x8
        `define REG_0C_OFFS 3 // reg_0xC
        `define REG_10_OFFS 4 // reg_0x10
        `define REG_14_OFFS 5 // reg_0x14
        `define REG_18_OFFS 6 // reg_0x18
        `define REG_1C_OFFS 7 // reg_0x1C
        `define REG_20_OFFS 8 // reg_0x20
        `define REG_28_OFFS 10 // reg_0x28
        /*
          local wire or register declarations
        */
        reg  [31:0] REG_00;
        reg  [31:0] REG_04;
        reg  [31:0] REG_08;
        reg  [7:0] sha_r_test_shdw;
        reg  [31:0] REG_0C;
        wire [5:0] mvstop_shdw;
        reg  [31:0] REG_10;
        reg  [31:0] REG_14;
        wire [31:0] sha_rw2_shdw;
        reg  [31:0] REG_18;
        reg  [31:0] REG_1C;
        reg  [31:0] REG_20;
        reg  [31:0] REG_28;
        reg  int_upd_rw;
        reg  int_upd_r;
        wire wr_p;
        wire rd_p;
        reg  int_trans_done;
        wire [3:0] iaddr;
        wire addr_overshoot;
        wire trans_done_p;
        reg  rd_done_p;
        reg  wr_done_p;
        reg  fwd_txn;
        wire [1:0] fwd_decode_vec;
        wire [1:0] fwd_done_vec;
        reg  [31:0] mux_rd_data;
        reg  mux_rd_err;
        reg  [31:0] mux_rd_data_0_0;
        reg  mux_rd_err_0_0;
        reg  [31:0] mux_rd_data_0_1;
        reg  mux_rd_err_0_1;
        /*
          local wire and output assignments
        */
        assign Cvbsdetect_par_o  = REG_04[0];
        assign mvstop_shdw                    = REG_0C[10:5];
        assign mvstart_par_o     = REG_0C[4:0];
        assign sha_rw2_shdw                   = REG_14;
        assign wd_16_test_par_o  = REG_18[15:0];
        assign wd_16_test2_par_o = REG_1C[7:0];
        assign usr_rw_test_par_o = wr_data_i[14:11];
        // clip address to decoded range
        assign iaddr = addr_i[5:2];
        assign addr_overshoot = |addr_i[13:6];
        /*
          clock enable signals
        */
        assign u9_ccgc_iwr_clk_en = wr_p; // write-clock enable
        assign u10_ccgc_ishdw_clk_en = int_upd_rw | int_upd_r; // shadow-clock enable
        assign u11_ccgc_ird_clk_en = rd_p; // read-clock enable
        // write txn start pulse
        assign wr_p = ~rd_wr_i & u7_sync_generic_i_trans_start_p;
        // read txn start pulse
        assign rd_p = rd_wr_i & u7_sync_generic_i_trans_start_p;
        /*
          generate txn done signals
        */
        assign fwd_done_vec = {usr_r_test_trans_done_p_i, usr_rw_test_trans_done_p_i}; // ack for forwarded txns
        assign trans_done_p = ((wr_done_p | rd_done_p) & ~fwd_txn) | ((fwd_done_vec != 0) & fwd_txn);
        always @(posedge clk_f20 or negedge u8_sync_rst_i_int_rst_n) begin
            if (~u8_sync_rst_i_int_rst_n) begin
                int_trans_done <= 0;
                wr_done_p <= 0;
                rd_done_p <= 0;
            end
            else begin
                wr_done_p <= wr_p;
                rd_done_p <= rd_p;
                if (trans_done_p)
                    int_trans_done <= ~int_trans_done;
            end
        end
        assign trans_done_o = int_trans_done;
        /*
          write process
        */
        always @(posedge u9_ccgc_iwr_clk or negedge u8_sync_rst_i_int_rst_n) begin
            if (~u8_sync_rst_i_int_rst_n) begin
                REG_0C[10:5] <= 'hc;
                REG_0C[4:0]  <= 'h7;
                REG_14       <= 'h0;
                REG_18[15:0] <= 'ha;
                REG_1C[7:0]  <= 'hff;
            end
            else begin
                case (iaddr)
                    `REG_0C_OFFS: begin
                        REG_0C[10:5] <= wr_data_i[10:5];
                        REG_0C[4:0]  <= wr_data_i[4:0];
                    end
                    `REG_14_OFFS: begin
                        REG_14 <= wr_data_i;
                    end
                    `REG_18_OFFS: begin
                        REG_18[15:0] <= wr_data_i[15:0];
                    end
                    `REG_1C_OFFS: begin
                        REG_1C[7:0] <= wr_data_i[7:0];
                    end
                endcase
            end
        end
        /*
          write process for status registers
        */
        always @(posedge clk_f20 or negedge u8_sync_rst_i_int_rst_n) begin
            if (~u8_sync_rst_i_int_rst_n) begin
                REG_04[0] <= 'h0;
            end
            else begin
                if (Cvbsdetect_set_p_i)
                    REG_04[0] <= 1;
                else if (wr_p && iaddr == `REG_04_OFFS)
                    REG_04[0] <= REG_04[0] & ~wr_data_i[0];
            end
        end
        /*
          txn forwarding process
        */
        // decode addresses of USR registers and read/write
        assign fwd_decode_vec = {(iaddr == `REG_08_OFFS) & rd_wr_i, (iaddr == `REG_10_OFFS)};
        always @(posedge clk_f20 or negedge u8_sync_rst_i_int_rst_n) begin
            if (~u8_sync_rst_i_int_rst_n) begin
                fwd_txn                            <= 0;
                usr_r_test_rd_p_o  <= 0;
                usr_rw_test_rd_p_o <= 0;
                usr_rw_test_wr_p_o <= 0;
            end
            else begin
                usr_r_test_rd_p_o  <= 0;
                usr_rw_test_rd_p_o <= 0;
                usr_rw_test_wr_p_o <= 0;
                if (u7_sync_generic_i_trans_start_p) begin
                    fwd_txn                            <= |fwd_decode_vec; // set flag for forwarded txn
                    usr_r_test_rd_p_o  <= fwd_decode_vec[1] & rd_wr_i;
                    usr_rw_test_rd_p_o <= fwd_decode_vec[0] & rd_wr_i;
                    usr_rw_test_wr_p_o <= fwd_decode_vec[0] & ~rd_wr_i;
                end
                else if (trans_done_p)
                    fwd_txn <= 0; // reset flag for forwarded transaction
                end
            end
        /*
          shadowing for update signal 'upd_rw'
        */
        // generate internal update signal
        always @(posedge clk_f20 or negedge u8_sync_rst_i_int_rst_n) begin
            if (~u8_sync_rst_i_int_rst_n)
                int_upd_rw <= 1;
            else
                int_upd_rw <= (int_upd_rw_p & upd_rw_en_i) | upd_rw_force_i;
        end
        // shadow process
        always @(posedge u10_ccgc_ishdw_clk) begin
            if (int_upd_rw) begin
                mvstop_par_o  <= mvstop_shdw;
                sha_rw2_par_o <= sha_rw2_shdw;
            end
        end
        /*
          shadowing for update signal 'upd_r'
        */
        // generate internal update signal
        always @(posedge clk_f20 or negedge u8_sync_rst_i_int_rst_n) begin
            if (~u8_sync_rst_i_int_rst_n)
                int_upd_r <= 1;
            else
                int_upd_r <= (int_upd_r_p & upd_r_en_i) | upd_r_force_i;
        end
        // shadow process
        always @(posedge u10_ccgc_ishdw_clk) begin
            if (int_upd_r) begin
                sha_r_test_shdw <= sha_r_test_par_i;
            end
        end
        /*
          read logic and mux process
        */
        assign rd_data_o = mux_rd_data;
        assign rd_err_o = mux_rd_err | addr_overshoot;
        always @(iaddr or mux_rd_data_0_0 or mux_rd_err_0_0 or mux_rd_data_0_1 or mux_rd_err_0_1) begin // stage 1
            case (iaddr[3:2])
                0: begin
                    mux_rd_data <= mux_rd_data_0_0;
                    mux_rd_err  <= mux_rd_err_0_0;
                end
                1: begin
                    mux_rd_data <= mux_rd_data_0_1;
                    mux_rd_err  <= mux_rd_err_0_1;
                end
                default: begin
                    mux_rd_data <= 0;
                    mux_rd_err <= 1;
                end
            endcase
        end
        always @(posedge u11_ccgc_ird_clk or negedge u8_sync_rst_i_int_rst_n) begin // stage 0
            if (~u8_sync_rst_i_int_rst_n) begin
                mux_rd_data_0_0 <= 0;
                mux_rd_err_0_0 <= 0;
            end
            else begin
                mux_rd_err_0_0 <= 0;
                case (iaddr[1:0])
                    1: begin
                        mux_rd_data_0_0[0] <= REG_04[0];
                    end
                    2: begin
                        mux_rd_data_0_0[1] <= ycdetect_par_i;
                        mux_rd_data_0_0[2] <= usr_r_test_par_i;
                        mux_rd_data_0_0[10:3] <= sha_r_test_shdw;
                    end
                    3: begin
                        mux_rd_data_0_0[4:0] <= REG_0C[4:0];
                        mux_rd_data_0_0[10:5] <= mvstop_shdw;
                    end
                    default: begin
                        mux_rd_data_0_0 <= 0;
                        mux_rd_err_0_0 <= 1;
                    end
                endcase
            end
        end
        always @(posedge u11_ccgc_ird_clk or negedge u8_sync_rst_i_int_rst_n) begin // stage 0
            if (~u8_sync_rst_i_int_rst_n) begin
                mux_rd_data_0_1 <= 0;
                mux_rd_err_0_1 <= 0;
            end
            else begin
                mux_rd_err_0_1 <= 0;
                case (iaddr[1:0])
                    0: begin
                        mux_rd_data_0_1[14:11] <= usr_rw_test_par_i;
                    end
                    1: begin
                        mux_rd_data_0_1 <= sha_rw2_shdw;
                    end
                    2: begin
                        mux_rd_data_0_1[15:0] <= REG_18[15:0];
                    end
                    default: begin
                        mux_rd_data_0_1 <= 0;
                        mux_rd_err_0_1 <= 1;
                    end
                endcase
            end
        end
        /*
          checking code
        */
        `ifdef ASSERT_ON
        property p_pos_pulse_check (sig); // check for positive pulse
             @(posedge clk_f20) disable iff (~u8_sync_rst_i_int_rst_n)
             sig |=> ~sig;
        endproperty
        assert property(p_pos_pulse_check(Cvbsdetect_set_p_i));
        assert property(p_pos_pulse_check(usr_r_test_trans_done_p_i));
        assert property(p_pos_pulse_check(usr_rw_test_trans_done_p_i));
        p_fwd_done_expected: assert property
        (
           @(posedge clk_f20) disable iff (~u8_sync_rst_i_int_rst_n)
           usr_r_test_trans_done_p_i || usr_rw_test_trans_done_p_i |-> fwd_txn
        );
        p_fwd_done_onehot: assert property
        (
           @(posedge clk_f20) disable iff (~u8_sync_rst_i_int_rst_n)
           usr_r_test_trans_done_p_i || usr_rw_test_trans_done_p_i |-> onehot(fwd_done_vec)
        );
        p_fwd_done_only_when_fwd_txn: assert property
        (
           @(posedge clk_f20) disable iff (~u8_sync_rst_i_int_rst_n)
           fwd_done_vec != 0 |-> fwd_txn
        );
        function onehot (input [1:0] vec); // not built-in to SV yet
          integer i,j;
          begin
             j = 0;
        	 for (i=0; i<2; i=i+1) j = j + vec[i] ? 1 : 0;
        	 onehot = (j==1) ? 1 : 0;
          end
        endfunction
        `endif
	// Generated Instances
	// wiring ...
	// Generated Instances and Port Mappings
		// Generated Instance Port Map for u10_ccgc_i
		ccgc	#(
			.cgtransp(cgtransp) // __W_ILLEGAL_PARAM
		) u10_ccgc_i (	// Clock-gating cell for shadow-clock
			.clk_i(clk_f20),
			.clk_o(u10_ccgc_ishdw_clk),
			.enable_i(u10_ccgc_ishdw_clk_en),
			.test_i(test_i)
		);
		// End of Generated Instance Port Map for u10_ccgc_i
		// Generated Instance Port Map for u11_ccgc_i
		ccgc	#(
			.cgtransp(cgtransp) // __W_ILLEGAL_PARAM
		) u11_ccgc_i (	// Clock-gating cell for read-clock
			.clk_i(clk_f20),
			.clk_o(u11_ccgc_ird_clk),
			.enable_i(u11_ccgc_ird_clk_en),
			.test_i(test_i)
		);
		// End of Generated Instance Port Map for u11_ccgc_i
		// Generated Instance Port Map for u12_sync_generic_i
		sync_generic	#(
			.act(1),
			.kind(3),
			.rstact(0),
			.rstval(0),
			.sync(1)
		) u12_sync_generic_i (	// Synchronizer for update-signal upd_rw
			.clk_r(clk_f20),
			.clk_s(tie0_1),
			.rcv_o(int_upd_rw_p),
			.rst_r(res_f20_n_i),
			.rst_s(tie0_1),
			.snd_i(upd_rw_i)
		);
		// End of Generated Instance Port Map for u12_sync_generic_i
		// Generated Instance Port Map for u13_sync_generic_i
		sync_generic	#(
			.act(1),
			.kind(3),
			.rstact(0),
			.rstval(0),
			.sync(1)
		) u13_sync_generic_i (	// Synchronizer for update-signal upd_r
			.clk_r(clk_f20),
			.clk_s(tie0_1),
			.rcv_o(int_upd_r_p),
			.rst_r(res_f20_n_i),
			.rst_s(tie0_1),
			.snd_i(upd_r_i)
		);
		// End of Generated Instance Port Map for u13_sync_generic_i
		// Generated Instance Port Map for u7_sync_generic_i
		sync_generic	#(
			.act(1),
			.kind(2),
			.rstact(0),
			.rstval(0),
			.sync(0)
		) u7_sync_generic_i (	// Synchronizer for trans_done signal
			.clk_r(clk_f20),
			.clk_s(tie0_1),
			.rcv_o(u7_sync_generic_i_trans_start_p),
			.rst_r(res_f20_n_i),
			.rst_s(tie0_1),
			.snd_i(trans_start)
		);
		// End of Generated Instance Port Map for u7_sync_generic_i
		// Generated Instance Port Map for u8_sync_rst_i
		sync_rst	#(
			.act(0),
			.sync(0)
		) u8_sync_rst_i (	// Reset synchronizer
			.clk_r(clk_f20),
			.rst_i(res_f20_n_i),
			.rst_o(u8_sync_rst_i_int_rst_n)
		);
		// End of Generated Instance Port Map for u8_sync_rst_i
		// Generated Instance Port Map for u9_ccgc_i
		ccgc	#(
			.cgtransp(cgtransp) // __W_ILLEGAL_PARAM
		) u9_ccgc_i (	// Clock-gating cell for write-clock
			.clk_i(clk_f20),
			.clk_o(u9_ccgc_iwr_clk),
			.enable_i(u9_ccgc_iwr_clk_en),
			.test_i(test_i)
		);
		// End of Generated Instance Port Map for u9_ccgc_i
endmodule