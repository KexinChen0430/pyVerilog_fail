module header
	// Internal signals
	// Generated Signal List
		wire		REG_0_wr_ts;
		wire		REG_0_wr_ts_p;
		wire		REG_2_wr_ts;
		wire		REG_2_wr_ts_p;
		wire		REG_3_wr_ts;
		wire		REG_3_wr_ts_p;
		wire		clk; // __W_PORT_SIGNAL_MAP_REQ
		wire		clk_f20; // __W_PORT_SIGNAL_MAP_REQ
		wire		hsync_p; // __W_PORT_SIGNAL_MAP_REQ
		wire		int_hsync_p_clk_f20_p;
		wire		int_hsync_p_clk_p;
		wire		res_f20_n; // __W_PORT_SIGNAL_MAP_REQ
		wire		res_n; // __W_PORT_SIGNAL_MAP_REQ
		wire		tie0_1;
		wire		y_test_set_p; // __W_PORT_SIGNAL_MAP_REQ
		wire		y_test_set_p_sync;
	// End of Generated Signal List
	// %COMPILER_OPTS%
	// Generated Signal Assignments
		assign	clk	=	clk_i;  // __I_I_BIT_PORT
		assign	clk_f20	=	clk_f20_i;  // __I_I_BIT_PORT
		assign	hsync_p	=	hsync_p_i;  // __I_I_BIT_PORT
		assign	res_f20_n	=	res_f20_n_i;  // __I_I_BIT_PORT
		assign	res_n	=	res_n_i;  // __I_I_BIT_PORT
		assign	tie0_1	= `tie0_1_c;
		assign	y_test_set_p	=	y_test_set_p_i;  // __I_I_BIT_PORT
        /*
          checking code
        */
        `ifdef ASSERT_ON
        // msd parse off
        parameter P_WAIT_IS_DRIVEN = 256;
        property is_driven(clk, rst_n, sig);
          @(posedge clk) $rose(rst_n) |=> ##P_WAIT_IS_DRIVEN !$isunknown(sig);
        endproperty
        assert_urac_wren_driven: assert property(is_driven(clk_i, res_n_i, urac_wren_i)) else $error("ERROR: input port urac_wren is undriven after reset");
        assert_urac_rden_driven: assert property(is_driven(clk_i, res_n_i, urac_rden_i)) else $error("ERROR: input port urac_rden is undriven after reset");
        // msd parse on
        `endif
         /* ------------------------------------------------------------
          Generator information:
          used package Micronas::Reg is version 1.90
          package RegViewURAC is version 1.3
          use with RTL libraries (this release or higher):
          ip_sync/0001/ip_sync_006_23jan2008
        ------------------------------------------------------------ */
        /*
          local definitions
        */
        localparam REG_0_OFFS = 0; // FE_YCDET_CTRL
        localparam REG_1_OFFS = 1; // FE_YCDET_STAT
        localparam REG_2_OFFS = 2; // FE_YCDET_CTRL2
        localparam REG_3_OFFS = 3; // FE_MVDET
        localparam REG_4_OFFS = 4; // FE_NATIVE
        localparam REG_5_OFFS = 5; // FE_NT
        /*
          local wire or register declarations
        */
        reg  [7:0] REG_0;
        reg  REG_0_wr_ts_s;
        wire [3:0] dgatel_shdw;
        wire [3:0] dgates_shdw;
        reg  [7:0] REG_1;
        reg  [0:0] cvbsdetect_shdw;
        reg  [7:0] REG_2;
        reg  REG_2_wr_ts_s;
        wire [4:0] mvstart_shdw;
        reg  [7:0] REG_3;
        reg  REG_3_wr_ts_s;
        wire [2:0] mvstop_shdw;
        wire [4:0] prova_shdw;
        reg  [7:0] REG_4;
        reg  [1:0] r_native_shdw;
        reg  [7:0] REG_5;
        wire [2:0] iaddr;
        wire [7:0] wdata;
        reg  [7:0] mux_rd_data;
        /*
          local wire and output assignments
        */
        assign dgatel_shdw[3:0]                     = REG_0[3:0];
        assign dgates_shdw[3:0]                     = REG_0[7:4];
        assign REG_0_wr_ts                          = REG_0_wr_ts_s;
        assign y_test_par_o         = REG_1[2];
        assign mvstart_shdw[4:0]                    = REG_2[4:0];
        assign REG_2_wr_ts                          = REG_2_wr_ts_s;
        assign prova_shdw[4:0]                      = REG_3[4:0];
        assign mvstop_shdw[2:0]                     = REG_3[7:5];
        assign REG_3_wr_ts                          = REG_3_wr_ts_s;
        assign rw_native_par_o[1:0] = REG_4[1:0];
        assign ycdetect2_par_o      = REG_5[1];
        /*
          inputs
        */
        assign iaddr = urac_addr_i[2:0];
        assign wdata = urac_data_i;
        /*
          read data output assignment
        */
        always @(posedge clk_i or negedge res_n_i) begin
           if (~res_n_i)
             urac_dout_o <= 0;
           else
             if (urac_rden_i)
               urac_dout_o <= mux_rd_data;
        end
        /*
          write process
        */
        always @(posedge clk_i or negedge res_n_i) begin
            if (~res_n_i) begin
                REG_0[3:0] <= 'h4;
                REG_0[7:4] <= 'hf;
                REG_2[4:0] <= 'h7;
                REG_3[4:0] <= 'h4;
                REG_3[7:5] <= 'h0;
                REG_4[1:0] <= 'h0;
                REG_5[1]   <= 'h0;
            end
            else begin
                if (urac_wren_i)
                    case (iaddr)
                        REG_0_OFFS: begin
                            REG_0[3:0] <= wdata[3:0];
                            REG_0[7:4] <= wdata[7:4];
                        end
                        REG_2_OFFS: begin
                            REG_2[4:0] <= wdata[4:0];
                        end
                        REG_3_OFFS: begin
                            REG_3[4:0] <= wdata[4:0];
                            REG_3[7:5] <= wdata[7:5];
                        end
                        REG_4_OFFS: begin
                            REG_4[1:0] <= wdata[1:0];
                        end
                        REG_5_OFFS: begin
                            REG_5[1] <= wdata[1];
                        end
                        default: ;
                    endcase
            end
        end
        /*
          write process for status registers
        */
        always @(posedge clk_i or negedge res_n_i) begin
            if (~res_n_i) begin
                REG_1[2] <= 'h0;
            end
            else begin
                if (y_test_set_p_sync)
                    REG_1[2] <= 1;
                else if (urac_wren_i && iaddr == REG_1_OFFS) begin
                    REG_1[2] <= REG_1[2] & ~wdata[2];
                end
            end
        end
        /*
          shadowing (into clock domain clk)
        */
        always @(posedge clk_i or negedge res_n_i) begin
            if (~res_n_i) begin
                r_native_shdw <= 'h0;
            end
            else begin
                if (int_hsync_p_clk_p) begin
                    r_native_shdw <= r_native_par_i;
                end
            end
        end
        /*
          shadowing (into clock domain clk_f20)
        */
        always @(posedge clk_f20_i or negedge res_f20_n_i) begin
            if (~res_f20_n_i) begin
                dgatel_par_o <= 'h4;
                dgates_par_o <= 'hf;
                mvstart_par_o <= 'h7;
                mvstop_par_o <= 'h0;
                prova_par_o <= 'h4;
                cvbsdetect_shdw <= 'h0;
            end
            else begin
                if (REG_0_wr_ts_p) begin
                    dgatel_par_o <= dgatel_shdw;
                    dgates_par_o <= dgates_shdw;
                end
                if (REG_2_wr_ts_p) begin
                    mvstart_par_o <= mvstart_shdw;
                end
                if (REG_3_wr_ts_p) begin
                    mvstop_par_o <= mvstop_shdw;
                    prova_par_o <= prova_shdw;
                end
                if (int_hsync_p_clk_f20_p) begin
                    cvbsdetect_shdw <= cvbsdetect_par_i;
                end
            end
        end
        /*
          toggle-signals for automatic takeover (read and write)
        */
        always @(posedge clk_i or negedge res_n_i) begin
            if (~res_n_i) begin
                REG_0_wr_ts_s <= 0;
                REG_2_wr_ts_s <= 0;
                REG_3_wr_ts_s <= 0;
            end
            else begin
                if (iaddr == REG_0_OFFS && urac_wren_i)
                    REG_0_wr_ts_s <= ~REG_0_wr_ts_s;
                if (iaddr == REG_2_OFFS && urac_wren_i)
                    REG_2_wr_ts_s <= ~REG_2_wr_ts_s;
                if (iaddr == REG_3_OFFS && urac_wren_i)
                    REG_3_wr_ts_s <= ~REG_3_wr_ts_s;
            end
        end
        /*
          read logic and mux process
        */
        always @(*) begin
            mux_rd_data <= 0;
            case (iaddr)
                REG_0_OFFS : begin
                    mux_rd_data[3:0] <= dgatel_shdw;
                    mux_rd_data[7:4] <= dgates_shdw;
                end
                REG_1_OFFS : begin
                    mux_rd_data[0] <= cvbsdetect_shdw;
                    mux_rd_data[2] <= REG_1[2];
                    mux_rd_data[1] <= ycdetect_par_i;
                end
                REG_2_OFFS : begin
                    mux_rd_data[4:0] <= mvstart_shdw;
                end
                REG_3_OFFS : begin
                    mux_rd_data[7:5] <= mvstop_shdw;
                    mux_rd_data[4:0] <= prova_shdw;
                end
                REG_4_OFFS : begin
                    mux_rd_data[3:2] <= r_native_shdw;
                    mux_rd_data[1:0] <= REG_4[1:0];
                end
                REG_5_OFFS : begin
                    mux_rd_data[0] <= cvbsdetect2_par_i;
                end
                default: ;
            endcase
        end
        /*
          checking code
        */
        `ifdef ASSERT_ON
        // msd parse off
        property p_pos_pulse_check (clock, reset, sig); // check for positive pulse
             @(posedge clock) disable iff (~reset)
             sig |=> ~sig;
        endproperty
        assert_y_test_set_p_i_is_a_pulse: assert property(p_pos_pulse_check(clk_f20_i, res_f20_n_i, y_test_set_p_i));
        // msd parse on
        `endif
	// Generated Instances and Port Mappings
		// Generated Instance Port Map for u0_sync_generic_i
		sync_generic	#(
			.act(1),
			.kind(0),
			.rstact(0),
			.rstval(0),
			.sync(1)
		) u0_sync_generic_i (	// Synchronizer for set-signal y_test_set_p
			.clk_r(clk),
			.clk_s(clk_f20),
			.rcv_o(y_test_set_p_sync),
			.rst_r(res_n),
			.rst_s(res_f20_n),
			.snd_i(y_test_set_p)
		);
		// End of Generated Instance Port Map for u0_sync_generic_i
		// Generated Instance Port Map for u1_sync_generic_i
		sync_generic	#(
			.act(1),
			.kind(2),
			.rstact(0),
			.rstval(0),
			.sync(1)
		) u1_sync_generic_i (	// Synchronizer for internal takeover-signal REG_3_wr_ts
			.clk_r(clk_f20),
			.clk_s(tie0_1),
			.rcv_o(REG_3_wr_ts_p),
			.rst_r(res_f20_n),
			.rst_s(tie0_1),
			.snd_i(REG_3_wr_ts)
		);
		// End of Generated Instance Port Map for u1_sync_generic_i
		// Generated Instance Port Map for u2_sync_generic_i
		sync_generic	#(
			.act(1),
			.kind(2),
			.rstact(0),
			.rstval(0),
			.sync(1)
		) u2_sync_generic_i (	// Synchronizer for internal takeover-signal REG_0_wr_ts
			.clk_r(clk_f20),
			.clk_s(tie0_1),
			.rcv_o(REG_0_wr_ts_p),
			.rst_r(res_f20_n),
			.rst_s(tie0_1),
			.snd_i(REG_0_wr_ts)
		);
		// End of Generated Instance Port Map for u2_sync_generic_i
		// Generated Instance Port Map for u3_sync_generic_i
		sync_generic	#(
			.act(1),
			.kind(2),
			.rstact(0),
			.rstval(0),
			.sync(1)
		) u3_sync_generic_i (	// Synchronizer for internal takeover-signal REG_2_wr_ts
			.clk_r(clk_f20),
			.clk_s(tie0_1),
			.rcv_o(REG_2_wr_ts_p),
			.rst_r(res_f20_n),
			.rst_s(tie0_1),
			.snd_i(REG_2_wr_ts)
		);
		// End of Generated Instance Port Map for u3_sync_generic_i
		// Generated Instance Port Map for u4_sync_generic_i
		sync_generic	#(
			.act(1),
			.kind(3),
			.rstact(0),
			.rstval(0),
			.sync(0)
		) u4_sync_generic_i (	// Synchronizer for external takeover-signal hsync_p
			.clk_r(clk),
			.clk_s(tie0_1),
			.rcv_o(int_hsync_p_clk_p),
			.rst_r(res_n),
			.rst_s(tie0_1),
			.snd_i(hsync_p)
		);
		// End of Generated Instance Port Map for u4_sync_generic_i
		// Generated Instance Port Map for u5_sync_generic_i
		sync_generic	#(
			.act(1),
			.kind(3),
			.rstact(0),
			.rstval(0),
			.sync(1)
		) u5_sync_generic_i (	// Synchronizer for external takeover-signal hsync_p
			.clk_r(clk_f20),
			.clk_s(tie0_1),
			.rcv_o(int_hsync_p_clk_f20_p),
			.rst_r(res_f20_n),
			.rst_s(tie0_1),
			.snd_i(hsync_p)
		);
		// End of Generated Instance Port Map for u5_sync_generic_i
endmodule