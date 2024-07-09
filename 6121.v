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
        reg  [31:0] REG_0C;
        reg  [31:0] REG_10;
        reg  [31:0] REG_14;
        reg  [31:0] REG_18;
        reg  [31:0] REG_1C;
        reg  [31:0] REG_20;
        wire [3:0] sha_w_test_shdw;
        reg  [31:0] REG_28;
        reg  int_upd_w;
        wire wr_p;
        wire rd_p;
        reg  int_trans_done;
        wire [3:0] iaddr;
        wire addr_overshoot;
        wire trans_done_p;
        reg  rd_done_p;
        reg  wr_done_p;
        reg  fwd_txn;
        wire [0:0] fwd_decode_vec;
        wire [0:0] fwd_done_vec;
        reg  [31:0] mux_rd_data;
        reg  mux_rd_err;
        /*
          local wire and output assignments
        */
        assign dummy_fe_par_o   = REG_00[11:9];
        assign dgatel_par_o     = REG_00[3:0];
        assign dgates_par_o     = REG_00[8:4];
        assign w_test_par_o     = REG_20[19:16];
        assign sha_w_test_shdw               = REG_20[23:20];
        assign usr_w_test_par_o = wr_data_i[3:0];
        // clip address to decoded range
        assign iaddr = addr_i[5:2];
        assign addr_overshoot = |addr_i[13:6];
        // write txn start pulse
        assign wr_p = ~rd_wr_i & u2_sync_generic_i_trans_start_p;
        // read txn start pulse
        assign rd_p = rd_wr_i & u2_sync_generic_i_trans_start_p;
        /*
          generate txn done signals
        */
        assign fwd_done_vec = {usr_w_test_trans_done_p_i}; // ack for forwarded txns
        assign trans_done_p = ((wr_done_p | rd_done_p) & ~fwd_txn) | ((fwd_done_vec != 0) & fwd_txn);
        always @(posedge clk_a or negedge u3_sync_rst_i_int_rst_n) begin
            if (~u3_sync_rst_i_int_rst_n) begin
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
        always @(posedge clk_a or negedge u3_sync_rst_i_int_rst_n) begin
            if (~u3_sync_rst_i_int_rst_n) begin
                REG_00[11:9]  <= 'h0;
                REG_00[3:0]   <= 'h4;
                REG_00[8:4]   <= 'hf;
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
                    endcase
            end
        end
        /*
          txn forwarding process
        */
        // decode addresses of USR registers and read/write
        assign fwd_decode_vec = {(iaddr == `REG_20_OFFS) & ~rd_wr_i};
        always @(posedge clk_a or negedge u3_sync_rst_i_int_rst_n) begin
            if (~u3_sync_rst_i_int_rst_n) begin
                fwd_txn                           <= 0;
                usr_w_test_wr_p_o <= 0;
            end
            else begin
                usr_w_test_wr_p_o <= 0;
                if (u2_sync_generic_i_trans_start_p) begin
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
        always @(posedge clk_a or negedge u3_sync_rst_i_int_rst_n) begin
            if (~u3_sync_rst_i_int_rst_n)
                int_upd_w <= 1;
            else
                int_upd_w <= (int_upd_w_p & upd_w_en_i) | upd_w_force_i;
        end
        // shadow process
        always @(posedge clk_a) begin
            if (int_upd_w) begin
                sha_w_test_par_o <= sha_w_test_shdw;
            end
        end
        /*
          read logic and mux process
        */
        assign rd_data_o = mux_rd_data;
        assign rd_err_o = mux_rd_err | addr_overshoot;
        always @(REG_00 or iaddr or r_test_par_i) begin
            mux_rd_err  <= 0;
            mux_rd_data <= 0;
            case (iaddr)
                `REG_00_OFFS : begin
                    mux_rd_data[3:0] <= REG_00[3:0];
                    mux_rd_data[8:4] <= REG_00[8:4];
                    mux_rd_data[11:9] <= REG_00[11:9];
                end
                `REG_28_OFFS : begin
                    mux_rd_data[2:0] <= r_test_par_i;
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
        property p_pos_pulse_check (sig); // check for positive pulse
             @(posedge clk_a) disable iff (~u3_sync_rst_i_int_rst_n)
             sig |=> ~sig;
        endproperty
        assert property(p_pos_pulse_check(usr_w_test_trans_done_p_i));
        p_fwd_done_expected: assert property
        (
           @(posedge clk_a) disable iff (~u3_sync_rst_i_int_rst_n)
           usr_w_test_trans_done_p_i |-> fwd_txn
        );
        p_fwd_done_onehot: assert property
        (
           @(posedge clk_a) disable iff (~u3_sync_rst_i_int_rst_n)
           usr_w_test_trans_done_p_i |-> onehot(fwd_done_vec)
        );
        p_fwd_done_only_when_fwd_txn: assert property
        (
           @(posedge clk_a) disable iff (~u3_sync_rst_i_int_rst_n)
           fwd_done_vec != 0 |-> fwd_txn
        );
        function onehot (input [0:0] vec); // not built-in to SV yet
          integer i,j;
          begin
             j = 0;
        	 for (i=0; i<1; i=i+1) j = j + vec[i] ? 1 : 0;
        	 onehot = (j==1) ? 1 : 0;
          end
        endfunction
        `endif
	// Generated Instances
	// wiring ...
	// Generated Instances and Port Mappings
		// Generated Instance Port Map for u2_sync_generic_i
		sync_generic	#(
			.act(1),
			.kind(2),
			.rstact(0),
			.rstval(0),
			.sync(1)
		) u2_sync_generic_i (	// Synchronizer for trans_done signal
			.clk_r(clk_a),
			.clk_s(tie0_1),
			.rcv_o(u2_sync_generic_i_trans_start_p),
			.rst_r(res_a_n_i),
			.rst_s(tie0_1),
			.snd_i(trans_start)
		);
		// End of Generated Instance Port Map for u2_sync_generic_i
		// Generated Instance Port Map for u3_sync_rst_i
		sync_rst	#(
			.act(0),
			.sync(1)
		) u3_sync_rst_i (	// Reset synchronizer
			.clk_r(clk_a),
			.rst_i(res_a_n_i),
			.rst_o(u3_sync_rst_i_int_rst_n)
		);
		// End of Generated Instance Port Map for u3_sync_rst_i
		// Generated Instance Port Map for u8_sync_generic_i
		sync_generic	#(
			.act(1),
			.kind(3),
			.rstact(0),
			.rstval(0),
			.sync(1)
		) u8_sync_generic_i (	// Synchronizer for update-signal upd_w
			.clk_r(clk_a),
			.clk_s(tie0_1),
			.rcv_o(int_upd_w_p),
			.rst_r(res_a_n_i),
			.rst_s(tie0_1),
			.snd_i(upd_w_i)
		);
		// End of Generated Instance Port Map for u8_sync_generic_i
endmodule