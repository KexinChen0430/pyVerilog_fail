module header
	// Internal signals
	// Generated Signal List
		wire		clk_f20; // __W_PORT_SIGNAL_MAP_REQ
		wire		res_f20_n; // __W_PORT_SIGNAL_MAP_REQ
		wire		tie0_1;
		wire		u10_sync_generic_i_int_upd_r_arm_p;
		wire		u5_sync_generic_i_trans_start_p;
		wire		u6_sync_rst_i_int_rst_n;
		wire		u7_sync_generic_i_int_upd_rw_p;
		wire		u8_sync_generic_i_int_upd_rw_arm_p;
		wire		u9_sync_generic_i_int_upd_r_p;
		wire		upd_r; // __W_PORT_SIGNAL_MAP_REQ
		wire		upd_r_en; // __W_PORT_SIGNAL_MAP_REQ
		wire		upd_rw; // __W_PORT_SIGNAL_MAP_REQ
		wire		upd_rw_en; // __W_PORT_SIGNAL_MAP_REQ
	// End of Generated Signal List
	// %COMPILER_OPTS%
	// Generated Signal Assignments
		assign	clk_f20	=	clk_f20_i;  // __I_I_BIT_PORT
		assign	res_f20_n	=	res_f20_n_i;  // __I_I_BIT_PORT
		assign	tie0_1	= `tie0_1_c;
		assign	upd_r	=	upd_r_i;  // __I_I_BIT_PORT
		assign	upd_r_en	=	upd_r_en_i;  // __I_I_BIT_PORT
		assign	upd_rw	=	upd_rw_i;  // __I_I_BIT_PORT
		assign	upd_rw_en	=	upd_rw_en_i;  // __I_I_BIT_PORT
         /* ------------------------------------------------------------
          Generator information:
          used package Micronas::Reg is version 1.88
          this package RegViews.pm is version 1.93
          use with RTL libraries (this release or higher):
          ip_ocp/0002/ip_ocp_016_21Jan2009
          ip_sync/0001/ip_sync_006_23jan2008
        ------------------------------------------------------------ */
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
        wire [3:0] mvstop_shdw;
        reg  [31:0] REG_10;
        reg  [31:0] REG_14;
        wire [31:0] sha_rw2_shdw;
        reg  [31:0] REG_18;
        reg  [31:0] REG_1C;
        reg  int_REG_1C_trg_p;
        reg  [31:0] REG_20;
        reg  [31:0] REG_28;
        reg  int_upd_rw;
        reg  int_upd_rw_en;
        reg  int_upd_r;
        reg  int_upd_r_en;
        wire wr_p;
        wire wr_done_p;
        wire rd_p;
        wire rd_done_p;
        wire [3:0] iaddr;
        wire addr_overshoot;
        wire trans_done_p;
        reg  ts_del_p;
        reg  int_trans_done;
        reg  fwd_txn;
        wire [2:0] fwd_decode_vec;
        wire fwd_rd_done_p;
        wire fwd_wr_done_p;
        reg  [31:0] mux_rd_data;
        reg  mux_rd_err;
        /*
          local wire and output assignments
        */
        assign cvbsdetect_par_o[2:0]  = cond_slice(P__CVBSDETECT, REG_04[2:0]);
        assign mvstart_par_o[3:0]     = cond_slice(P__MVSTART, REG_0C[3:0]);
        assign mvstop_shdw[3:0]                       = cond_slice(P__MVSTOP, REG_0C[7:4]);
        assign sha_rw2_shdw[31:0]                     = cond_slice(P__SHA_RW2, REG_14);
        assign wd_16_test_par_o[15:0] = cond_slice(P__WD_16_TEST, REG_18[15:0]);
        assign wd_16_test2_par_o[7:0] = cond_slice(P__WD_16_TEST2, REG_1C[7:0]);
        assign wd_16_test2_trg_p_o    = int_REG_1C_trg_p;
        assign sha_r_test_trg_p_o     = int_upd_r;
        assign usr_rw_test_par_o[3:0] = wr_data_i[14:11];
        // clip address to decoded range
        assign iaddr = addr_i[5:2];
        assign addr_overshoot = |addr_i[13:6];
        /*
          generate transaction-handling signals
        */
        assign trans_done_p = rd_done_p | wr_done_p;
        // write txn start pulse
        assign
        // synopsys translate_off
        #0.1
        // synopsys translate_on
        wr_p = ~rd_wr_i & u5_sync_generic_i_trans_start_p;
        // read done pulse
        assign rd_done_p = rd_p;
        assign fwd_rd_done_p = usr_r_test_trans_done_p_i | usr_rw_test_trans_done_p_i | usr_ali_trans_done_p_i;
        assign fwd_wr_done_p = usr_rw_test_trans_done_p_i;
        assign rd_p = rd_wr_i & ((ts_del_p & ~fwd_txn) | (fwd_rd_done_p & fwd_txn)); // read txn start pulse
        assign wr_done_p = ~rd_wr_i & ((ts_del_p & ~fwd_txn) | (fwd_wr_done_p & fwd_txn)); // write done pulse
        always @(posedge clk_f20_i or negedge u6_sync_rst_i_int_rst_n) begin
            if (~u6_sync_rst_i_int_rst_n) begin
                int_trans_done <= 0;
                ts_del_p       <= 0;
            end
            else begin
                ts_del_p <= u5_sync_generic_i_trans_start_p;
                if (trans_done_p)
                    int_trans_done <= ~int_trans_done;
            end
        end
        assign trans_done_o = int_trans_done;
        /*
          helper function for conditional FFs
        */
        // msd parse off
        function [31:0] cond_slice(input integer enable, input [31:0] vec);
            begin
                cond_slice = (enable < 0) ? vec : enable;
            end
        endfunction
        // msd parse on
        /*
          write process
        */
        always @(posedge clk_f20_i or negedge u6_sync_rst_i_int_rst_n) begin
            if (~u6_sync_rst_i_int_rst_n) begin
                REG_0C[3:0]  <= 'h7;
                REG_0C[7:4]  <= 'hc;
                REG_14       <= 'h0;
                REG_18[15:0] <= 'ha;
                REG_1C[7:0]  <= 'hff;
            end
            else begin
                if (wr_p)
                    case (iaddr)
                        `REG_0C_OFFS: begin
                            REG_0C[3:0] <= wr_data_i[3:0];
                            REG_0C[7:4] <= wr_data_i[7:4];
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
                        default: ;
                    endcase
            end
        end
        /*
          write trigger process
        */
        always @(posedge clk_f20_i or negedge u6_sync_rst_i_int_rst_n) begin
            if (~u6_sync_rst_i_int_rst_n) begin
                int_REG_1C_trg_p <= 0;
            end
            else begin
                int_REG_1C_trg_p <= 0;
                case (iaddr)
                    `REG_1C_OFFS: int_REG_1C_trg_p <= wr_p;
                    default: ;
                endcase
            end
        end
        /*
          write process for status registers
        */
        always @(posedge clk_f20_i or negedge u6_sync_rst_i_int_rst_n) begin
            if (~u6_sync_rst_i_int_rst_n) begin
                REG_04[2:0]                        <= 'h0;
                cvbsdetect_trg_p_o <= 0;
            end
            else begin
                if (cvbsdetect_set_p_i[0])
                    REG_04[0] <= 1;
                else if (wr_p && iaddr == `REG_04_OFFS) begin
                    REG_04[0] <= REG_04[0] & ~wr_data_i[0];
                end
                if (wr_p && iaddr == `REG_04_OFFS) begin // write trigger for address REG_04_OFFS
                    cvbsdetect_trg_p_o <= 1;
                end
                else begin
                    cvbsdetect_trg_p_o <= 0;
                end
                if (cvbsdetect_set_p_i[1])
                    REG_04[1] <= 1;
                else if (wr_p && iaddr == `REG_04_OFFS) begin
                    REG_04[1] <= REG_04[1] & ~wr_data_i[1];
                end
                if (cvbsdetect_set_p_i[2])
                    REG_04[2] <= 1;
                else if (wr_p && iaddr == `REG_04_OFFS) begin
                    REG_04[2] <= REG_04[2] & ~wr_data_i[2];
                end
            end
        end
        /*
          txn forwarding process
        */
        // decode addresses of USR registers and read/write
        assign fwd_decode_vec = {(iaddr == `REG_08_OFFS) & rd_wr_i, (iaddr == `REG_0C_OFFS) & rd_wr_i, (iaddr == `REG_10_OFFS)};
        always @(posedge clk_f20_i or negedge u6_sync_rst_i_int_rst_n) begin
            if (~u6_sync_rst_i_int_rst_n) begin
                fwd_txn                            <= 0;
                usr_r_test_rd_p_o  <= 0;
                usr_ali_rd_p_o     <= 0;
                usr_rw_test_rd_p_o <= 0;
                usr_rw_test_wr_p_o <= 0;
            end
            else begin
                usr_r_test_rd_p_o  <= 0;
                usr_ali_rd_p_o     <= 0;
                usr_rw_test_rd_p_o <= 0;
                usr_rw_test_wr_p_o <= 0;
                if (u5_sync_generic_i_trans_start_p) begin
                    fwd_txn                            <= |fwd_decode_vec; // set flag for forwarded txn
                    usr_r_test_rd_p_o  <= fwd_decode_vec[2] & rd_wr_i;
                    usr_ali_rd_p_o     <= fwd_decode_vec[1] & rd_wr_i;
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
        always @(posedge clk_f20_i or negedge u6_sync_rst_i_int_rst_n) begin
            if (~u6_sync_rst_i_int_rst_n) begin
                int_upd_rw <= 1;
                int_upd_rw_en <= 0;
            end
            else begin
                int_upd_rw <= (u7_sync_generic_i_int_upd_rw_p & int_upd_rw_en) | upd_rw_force_i;
                if (u8_sync_generic_i_int_upd_rw_arm_p)
                    int_upd_rw_en <= 1; // arm enable signal
                else if(u7_sync_generic_i_int_upd_rw_p)
                    int_upd_rw_en <= 0; // reset enable signal after update-event
            end
        end
        // shadow process
        always @(posedge clk_f20_i or negedge u6_sync_rst_i_int_rst_n) begin
            if (~u6_sync_rst_i_int_rst_n) begin
                mvstop_par_o  <= 'hc;
                sha_rw2_par_o <= 'h0;
            end
            else begin
                if (int_upd_rw) begin
                    mvstop_par_o  <= mvstop_shdw;
                    sha_rw2_par_o <= sha_rw2_shdw;
                end
            end
        end
        /*
          shadowing for update signal 'upd_r'
        */
        // generate internal update signal
        always @(posedge clk_f20_i or negedge u6_sync_rst_i_int_rst_n) begin
            if (~u6_sync_rst_i_int_rst_n) begin
                int_upd_r <= 1;
                int_upd_r_en <= 0;
            end
            else begin
                int_upd_r <= (u9_sync_generic_i_int_upd_r_p & int_upd_r_en) | upd_r_force_i;
                if (u10_sync_generic_i_int_upd_r_arm_p)
                    int_upd_r_en <= 1; // arm enable signal
                else if(u9_sync_generic_i_int_upd_r_p)
                    int_upd_r_en <= 0; // reset enable signal after update-event
            end
        end
        // shadow process
        always @(posedge clk_f20_i or negedge u6_sync_rst_i_int_rst_n) begin
            if (~u6_sync_rst_i_int_rst_n) begin
                sha_r_test_shdw <= 'h0;
            end
            else begin
                if (int_upd_r) begin
                    sha_r_test_shdw <= sha_r_test_par_i;
                end
            end
        end
        /*
          read logic and mux process
        */
        assign rd_data_o = mux_rd_data;
        assign rd_err_o = mux_rd_err | addr_overshoot;
        always @( REG_04 or REG_0C or REG_18 or iaddr or mvstop_shdw or sha_r_test_shdw or sha_rw2_shdw or usr_ali_par_i or usr_r_test_par_i or usr_rw_test_in_par_i or ycdetect_par_i) begin
            mux_rd_err  <= 0;
            mux_rd_data <= 0;
            case (iaddr)
                `REG_04_OFFS : begin
                    mux_rd_data[2:0] <= cond_slice(P__CVBSDETECT, REG_04[2:0]);
                end
                `REG_08_OFFS : begin
                    mux_rd_data[10:3] <= sha_r_test_shdw;
                    mux_rd_data[2] <= usr_r_test_par_i;
                    mux_rd_data[1] <= ycdetect_par_i;
                end
                `REG_0C_OFFS : begin
                    mux_rd_data[3:0] <= cond_slice(P__MVSTART, REG_0C[3:0]);
                    mux_rd_data[7:4] <= mvstop_shdw;
                    mux_rd_data[9:8] <= usr_ali_par_i;
                end
                `REG_10_OFFS : begin
                    mux_rd_data[14:11] <= usr_rw_test_in_par_i;
                end
                `REG_14_OFFS : begin
                    mux_rd_data <= sha_rw2_shdw;
                end
                `REG_18_OFFS : begin
                    mux_rd_data[15:0] <= cond_slice(P__WD_16_TEST, REG_18[15:0]);
                end
                default: begin
                    mux_rd_err <= 1; // no decode
                end
            endcase
        end
        /*
          checking code
        */
        `ifdef ASSERT_ON
        // msd parse off
        property p_pos_pulse_check (sig); // check for positive pulse
             @(posedge clk_f20_i) disable iff (~u6_sync_rst_i_int_rst_n)
             sig |=> ~sig;
        endproperty
        assert_cvbsdetect_set_p_i0_is_a_pulse: assert property(p_pos_pulse_check(cvbsdetect_set_p_i[0]));
        assert_cvbsdetect_set_p_i1_is_a_pulse: assert property(p_pos_pulse_check(cvbsdetect_set_p_i[1]));
        assert_cvbsdetect_set_p_i2_is_a_pulse: assert property(p_pos_pulse_check(cvbsdetect_set_p_i[2]));
        assert_usr_r_test_trans_done_p_i_is_a_pulse: assert property(p_pos_pulse_check(usr_r_test_trans_done_p_i));
        assert_usr_ali_trans_done_p_i_is_a_pulse: assert property(p_pos_pulse_check(usr_ali_trans_done_p_i));
        assert_usr_rw_test_trans_done_p_i_is_a_pulse: assert property(p_pos_pulse_check(usr_rw_test_trans_done_p_i));
        // all acks for forwarded txns
        wire [2:0] fwd_done_vec;
        assign fwd_done_vec = {usr_r_test_trans_done_p_i, usr_rw_test_trans_done_p_i, usr_ali_trans_done_p_i};
        assert_fwd_done_onehot: assert property
        (
           @(posedge clk_f20_i) disable iff (~u6_sync_rst_i_int_rst_n)
           fwd_done_vec != 0 |-> onehot(fwd_done_vec)
        );
        assert_fwd_done_only_when_fwd_txn: assert property
        (
           @(posedge clk_f20_i) disable iff (~u6_sync_rst_i_int_rst_n)
           fwd_done_vec != 0 |-> fwd_txn
        );
        function onehot (input [2:0] vec);
          integer i,j;
          begin
             j = 0;
             for (i=0; i<3; i=i+1) j = j + vec[i] ? 1 : 0;
             onehot = (j==1) ? 1 : 0;
          end
        endfunction
        // msd parse on
        `endif
	// Generated Instances and Port Mappings
		// Generated Instance Port Map for u10_sync_generic_i
		sync_generic	#(
			.act(1),
			.kind(3),
			.rstact(0),
			.rstval(0),
			.sync(1)
		) u10_sync_generic_i (	// Synchronizer for update-enable signal upd_r_en
			.clk_r(clk_f20),
			.clk_s(tie0_1),
			.rcv_o(u10_sync_generic_i_int_upd_r_arm_p),
			.rst_r(res_f20_n),
			.rst_s(tie0_1),
			.snd_i(upd_r_en)
		);
		// End of Generated Instance Port Map for u10_sync_generic_i
		// Generated Instance Port Map for u5_sync_generic_i
		sync_generic	#(
			.act(1),
			.kind(2),
			.rstact(0),
			.rstval(0),
			.sync(sync)
		) u5_sync_generic_i (	// Synchronizer for trans_start signal
			.clk_r(clk_f20),
			.clk_s(tie0_1),
			.rcv_o(u5_sync_generic_i_trans_start_p),
			.rst_r(res_f20_n),
			.rst_s(tie0_1),
			.snd_i(trans_start_1_i)	// __I_USE_PORT trans_start_1_i for signal trans_start_1
		);
		// End of Generated Instance Port Map for u5_sync_generic_i
		// Generated Instance Port Map for u6_sync_rst_i
		sync_rst	#(
			.act(0),
			.sync(0)
		) u6_sync_rst_i (	// Reset synchronizer (in bypass-mode)
			.clk_r(clk_f20),
			.rst_i(res_f20_n),
			.rst_o(u6_sync_rst_i_int_rst_n),
			.test_i(tie0_1)
		);
		// End of Generated Instance Port Map for u6_sync_rst_i
		// Generated Instance Port Map for u7_sync_generic_i
		sync_generic	#(
			.act(1),
			.kind(3),
			.rstact(0),
			.rstval(0),
			.sync(1)
		) u7_sync_generic_i (	// Synchronizer for update-signal upd_rw
			.clk_r(clk_f20),
			.clk_s(tie0_1),
			.rcv_o(u7_sync_generic_i_int_upd_rw_p),
			.rst_r(res_f20_n),
			.rst_s(tie0_1),
			.snd_i(upd_rw)
		);
		// End of Generated Instance Port Map for u7_sync_generic_i
		// Generated Instance Port Map for u8_sync_generic_i
		sync_generic	#(
			.act(1),
			.kind(3),
			.rstact(0),
			.rstval(0),
			.sync(1)
		) u8_sync_generic_i (	// Synchronizer for update-enable signal upd_rw_en
			.clk_r(clk_f20),
			.clk_s(tie0_1),
			.rcv_o(u8_sync_generic_i_int_upd_rw_arm_p),
			.rst_r(res_f20_n),
			.rst_s(tie0_1),
			.snd_i(upd_rw_en)
		);
		// End of Generated Instance Port Map for u8_sync_generic_i
		// Generated Instance Port Map for u9_sync_generic_i
		sync_generic	#(
			.act(1),
			.kind(3),
			.rstact(0),
			.rstval(0),
			.sync(1)
		) u9_sync_generic_i (	// Synchronizer for update-signal upd_r
			.clk_r(clk_f20),
			.clk_s(tie0_1),
			.rcv_o(u9_sync_generic_i_int_upd_r_p),
			.rst_r(res_f20_n),
			.rst_s(tie0_1),
			.snd_i(upd_r)
		);
		// End of Generated Instance Port Map for u9_sync_generic_i
endmodule