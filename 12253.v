module header
	// Internal signals
	// Generated Signal List
		wire		clk_a; // __W_PORT_SIGNAL_MAP_REQ
		wire		res_a_n; // __W_PORT_SIGNAL_MAP_REQ
		wire		tie0_1;
		wire		u11_sync_generic_i_int_upd_w_p;
		wire		u12_sync_generic_i_int_upd_w_arm_p;
		wire		u3_sync_generic_i_trans_start_p;
		wire		u4_sync_rst_i_int_rst_n;
		wire		upd_w; // __W_PORT_SIGNAL_MAP_REQ
		wire		upd_w_en; // __W_PORT_SIGNAL_MAP_REQ
	// End of Generated Signal List
	// %COMPILER_OPTS%
	// Generated Signal Assignments
		assign	clk_a	=	clk_a_i;  // __I_I_BIT_PORT
		assign	res_a_n	=	res_a_n_i;  // __I_I_BIT_PORT
		assign	tie0_1	= `tie0_1_c;
		assign	upd_w	=	upd_w_i;  // __I_I_BIT_PORT
		assign	upd_w_en	=	upd_w_en_i;  // __I_I_BIT_PORT
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
        reg  [31:0] REG_0C;
        reg  [31:0] REG_10;
        reg  [31:0] REG_14;
        reg  [31:0] REG_18;
        reg  [31:0] REG_1C;
        reg  [31:0] REG_20;
        wire [3:0] sha_w_test_shdw;
        reg  [31:0] REG_28;
        reg  int_upd_w;
        reg  int_upd_w_en;
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
        wire [0:0] fwd_decode_vec;
        wire fwd_rd_done_p;
        wire fwd_wr_done_p;
        reg  [31:0] mux_rd_data;
        reg  mux_rd_err;
        /*
          local wire and output assignments
        */
        assign dgatel_par_o[3:0]     = cond_slice(P__DGATEL, REG_00[3:0]);
        assign dgates_par_o[4:0]     = cond_slice(P__DGATES, REG_00[8:4]);
        assign dummy_fe_par_o[2:0]   = cond_slice(P__DUMMY_FE, REG_00[11:9]);
        assign sha_w_test_shdw[3:0]                  = cond_slice(P__SHA_W_TEST, REG_20[23:20]);
        assign w_test_par_o[3:0]     = cond_slice(P__W_TEST, REG_20[19:16]);
        assign sha_w_test_trg_p_o    = int_upd_w;
        assign usr_w_test_par_o[3:0] = wr_data_i[3:0];
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
        wr_p = ~rd_wr_i & u3_sync_generic_i_trans_start_p;
        // read done pulse
        assign rd_done_p = rd_p;
        assign fwd_rd_done_p = 0;
        assign fwd_wr_done_p = usr_w_test_trans_done_p_i;
        assign rd_p = rd_wr_i & ((ts_del_p & ~fwd_txn) | (fwd_rd_done_p & fwd_txn)); // read txn start pulse
        assign wr_done_p = ~rd_wr_i & ((ts_del_p & ~fwd_txn) | (fwd_wr_done_p & fwd_txn)); // write done pulse
        always @(posedge clk_a_i or negedge u4_sync_rst_i_int_rst_n) begin
            if (~u4_sync_rst_i_int_rst_n) begin
                int_trans_done <= 0;
                ts_del_p       <= 0;
            end
            else begin
                ts_del_p <= u3_sync_generic_i_trans_start_p;
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
        always @(posedge clk_a_i or negedge u4_sync_rst_i_int_rst_n) begin
            if (~u4_sync_rst_i_int_rst_n) begin
                REG_00[11:9]  <= 'h0;
                REG_00[3:0]   <= 'h4;
                REG_00[8:4]   <= 'hc;
                REG_20[19:16] <= 'h0;
                REG_20[23:20] <= 'h0;
            end
            else begin
                if (wr_p)
                    case (iaddr)
                        `REG_00_OFFS: begin
                            REG_00[11:9] <= wr_data_i[11:9];
                            REG_00[3:0]  <= wr_data_i[3:0];
                            REG_00[8:4]  <= wr_data_i[8:4];
                        end
                        `REG_20_OFFS: begin
                            REG_20[19:16] <= wr_data_i[19:16];
                            REG_20[23:20] <= wr_data_i[23:20];
                        end
                        default: ;
                    endcase
            end
        end
        /*
          txn forwarding process
        */
        // decode addresses of USR registers and read/write
        assign fwd_decode_vec = {(iaddr == `REG_20_OFFS) & ~rd_wr_i};
        always @(posedge clk_a_i or negedge u4_sync_rst_i_int_rst_n) begin
            if (~u4_sync_rst_i_int_rst_n) begin
                fwd_txn                           <= 0;
                usr_w_test_wr_p_o <= 0;
            end
            else begin
                usr_w_test_wr_p_o <= 0;
                if (u3_sync_generic_i_trans_start_p) begin
                    fwd_txn                           <= |fwd_decode_vec; // set flag for forwarded txn
                    usr_w_test_wr_p_o <= fwd_decode_vec[0] & ~rd_wr_i;
                end
                else if (trans_done_p)
                    fwd_txn <= 0; // reset flag for forwarded transaction
                end
            end
        /*
          shadowing for update signal 'upd_w'
        */
        // generate internal update signal
        always @(posedge clk_a_i or negedge u4_sync_rst_i_int_rst_n) begin
            if (~u4_sync_rst_i_int_rst_n) begin
                int_upd_w <= 1;
                int_upd_w_en <= 0;
            end
            else begin
                int_upd_w <= (u11_sync_generic_i_int_upd_w_p & int_upd_w_en) | upd_w_force_i;
                if (u12_sync_generic_i_int_upd_w_arm_p)
                    int_upd_w_en <= 1; // arm enable signal
                else if(u11_sync_generic_i_int_upd_w_p)
                    int_upd_w_en <= 0; // reset enable signal after update-event
            end
        end
        // shadow process
        always @(posedge clk_a_i or negedge u4_sync_rst_i_int_rst_n) begin
            if (~u4_sync_rst_i_int_rst_n) begin
                sha_w_test_par_o <= 'h0;
            end
            else begin
                if (int_upd_w) begin
                    sha_w_test_par_o <= sha_w_test_shdw;
                end
            end
        end
        /*
          read logic and mux process
        */
        assign rd_data_o = mux_rd_data;
        assign rd_err_o = mux_rd_err | addr_overshoot;
        always @( REG_00 or iaddr or r_test_par_i) begin
            mux_rd_err  <= 0;
            mux_rd_data <= 0;
            case (iaddr)
                `REG_00_OFFS : begin
                    mux_rd_data[3:0] <= cond_slice(P__DGATEL, REG_00[3:0]);
                    mux_rd_data[8:4] <= cond_slice(P__DGATES, REG_00[8:4]);
                    mux_rd_data[11:9] <= cond_slice(P__DUMMY_FE, REG_00[11:9]);
                end
                `REG_28_OFFS : begin
                    mux_rd_data[2:0] <= r_test_par_i;
                end
                default: begin
                    mux_rd_err <= 1; // no decode
                end
            endcase
        end
        // generate read-notify trigger (combinatorial)
        always @(*) begin
            r_test_trg_p_o = 0;
            case (iaddr)
                `REG_28_OFFS: begin
                    r_test_trg_p_o = rd_p;
                end
                default: begin
                    r_test_trg_p_o = 0;
                end
            endcase
        end
        /*
          checking code
        */
        `ifdef ASSERT_ON
        // msd parse off
        property p_pos_pulse_check (sig); // check for positive pulse
             @(posedge clk_a_i) disable iff (~u4_sync_rst_i_int_rst_n)
             sig |=> ~sig;
        endproperty
        assert_usr_w_test_trans_done_p_i_is_a_pulse: assert property(p_pos_pulse_check(usr_w_test_trans_done_p_i));
        // all acks for forwarded txns
        wire [0:0] fwd_done_vec;
        assign fwd_done_vec = {usr_w_test_trans_done_p_i};
        assert_fwd_done_onehot: assert property
        (
           @(posedge clk_a_i) disable iff (~u4_sync_rst_i_int_rst_n)
           fwd_done_vec != 0 |-> onehot(fwd_done_vec)
        );
        assert_fwd_done_only_when_fwd_txn: assert property
        (
           @(posedge clk_a_i) disable iff (~u4_sync_rst_i_int_rst_n)
           fwd_done_vec != 0 |-> fwd_txn
        );
        function onehot (input [0:0] vec);
          integer i,j;
          begin
             j = 0;
             for (i=0; i<1; i=i+1) j = j + vec[i] ? 1 : 0;
             onehot = (j==1) ? 1 : 0;
          end
        endfunction
        // msd parse on
        `endif
	// Generated Instances and Port Mappings
		// Generated Instance Port Map for u11_sync_generic_i
		sync_generic	#(
			.act(1),
			.kind(3),
			.rstact(0),
			.rstval(0),
			.sync(1)
		) u11_sync_generic_i (	// Synchronizer for update-signal upd_w
			.clk_r(clk_a),
			.clk_s(tie0_1),
			.rcv_o(u11_sync_generic_i_int_upd_w_p),
			.rst_r(res_a_n),
			.rst_s(tie0_1),
			.snd_i(upd_w)
		);
		// End of Generated Instance Port Map for u11_sync_generic_i
		// Generated Instance Port Map for u12_sync_generic_i
		sync_generic	#(
			.act(1),
			.kind(3),
			.rstact(0),
			.rstval(0),
			.sync(1)
		) u12_sync_generic_i (	// Synchronizer for update-enable signal upd_w_en
			.clk_r(clk_a),
			.clk_s(tie0_1),
			.rcv_o(u12_sync_generic_i_int_upd_w_arm_p),
			.rst_r(res_a_n),
			.rst_s(tie0_1),
			.snd_i(upd_w_en)
		);
		// End of Generated Instance Port Map for u12_sync_generic_i
		// Generated Instance Port Map for u3_sync_generic_i
		sync_generic	#(
			.act(1),
			.kind(2),
			.rstact(0),
			.rstval(0),
			.sync(sync)
		) u3_sync_generic_i (	// Synchronizer for trans_start signal
			.clk_r(clk_a),
			.clk_s(tie0_1),
			.rcv_o(u3_sync_generic_i_trans_start_p),
			.rst_r(res_a_n),
			.rst_s(tie0_1),
			.snd_i(trans_start_0_i)	// __I_USE_PORT trans_start_0_i for signal trans_start_0
		);
		// End of Generated Instance Port Map for u3_sync_generic_i
		// Generated Instance Port Map for u4_sync_rst_i
		sync_rst	#(
			.act(0),
			.sync(0)
		) u4_sync_rst_i (	// Reset synchronizer (in bypass-mode)
			.clk_r(clk_a),
			.rst_i(res_a_n),
			.rst_o(u4_sync_rst_i_int_rst_n),
			.test_i(tie0_1)
		);
		// End of Generated Instance Port Map for u4_sync_rst_i
endmodule