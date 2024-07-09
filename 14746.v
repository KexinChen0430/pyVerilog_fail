module again,
            // but invert the output, and wire in the sneak output from the DQS pin :
            if (MEM_IF_MEMTYPE == "DDR3" || (MEM_IF_MEMTYPE == "DDR2" && (MEM_IF_DQSN_EN == 1)) )
            begin : dqsn_op_gen
                ddr3_s4_amphy_phy_alt_mem_phy_dqs_op # (
                                    .DLL_DELAY_BUFFER_MODE                   (DLL_DELAY_BUFFER_MODE),
                    .INVERT_OP_FOR_DQSN                      (1),
                    .MEM_IF_MEMTYPE                          (MEM_IF_MEMTYPE),
                    .LEVELLING                               (LEVELLING),
                    .MEM_IF_DQSN_EN                          (MEM_IF_DQSN_EN),
                    .MEM_IF_OCT_EN                           (MEM_IF_OCT_EN),
                    .DWIDTH_RATIO                            (DWIDTH_RATIO),
                    .ENABLE_DDR3_SEQUENCER                   (ENABLE_DDR3_SEQUENCER),
                    .MEM_IF_STR_T9_DESKEW_EN                 (MEM_IF_STR_T9_DESKEW_EN),
                    .MEM_IF_STR_T10_DESKEW_EN                (MEM_IF_STR_T10_DESKEW_EN),
                    .MEM_IF_OCT_T9_DESKEW_EN                 (MEM_IF_OCT_T9_DESKEW_EN),
                    .MEM_IF_OCT_T10_DESKEW_EN                (MEM_IF_OCT_T10_DESKEW_EN),
                    .MEM_IF_SHIFT_SERIES_TERMINATION_CONTROL (MEM_IF_SHIFT_SERIES_TERMINATION_CONTROL),
                    .OPA_USES_DELAYED_CLK                    (OPA_USES_DELAYED_CLK)
                ) dqsn_op (
                    .phy_clk_1x                 (phy_clk_1x),
                    .write_clk_2x               (write_clk_2x),
                    .mem_clk_2x                 (mem_clk_2x),
                    .sc_clk                     (sc_clk[dqs_grp_num]),
                    .scan_enable                (),
                    .scan_update                (),
                    .scan_din                   (),
                    .scan_dout                  (),
                    .wdp_dqs3_1x                (wdp_dqs3_1x[dqs_grp_num]),
                    .wdp_dqs2_1x                (wdp_dqs2_1x[dqs_grp_num]),
                    .wdp_dqs1_1x                (wdp_dqs1_1x[dqs_grp_num]),
                    .wdp_dqs0_1x                (wdp_dqs0_1x[dqs_grp_num]),
                    .wdp_dqs_oe_h_1x            (wdp_dqs_oe_h_1x[dqs_grp_num]),
                    .wdp_dqs_oe_l_1x            (wdp_dqs_oe_l_1x[dqs_grp_num]),
                    .wdp_oct_h_1x               (wdp_oct_h_1x[dqs_grp_num]),
                    .wdp_oct_l_1x               (wdp_oct_l_1x[dqs_grp_num]),
                    .dqs_sneak_in               (dqs_sneak),
                    .dqs_sneak_out              (),
                    .dqs_pad                    (mem_dqsn[dqs_grp_num]),
                    .dedicated_dll_delay_ctrl   (dedicated_dll_delay_ctrl),
                    .enaoutputcycledelaysetting (enaoutputcycledelaysetting[0]),
                    .enaoutputphasetransferreg  (enaoutputphasetransferreg[0]),
                    .dqsoutputphaseinvert       (dqsoutputphaseinvert[0]),
                    .dqsoutputphasesetting      (dqsoutputphasesetting[0]),
                    .enaoctcycledelaysetting    (enaoctcycledelaysetting[0]),
                    .enaoctphasetransferreg     (enaoctphasetransferreg[0]),
                    .octdelaysetting1           (octdelaysetting1[0]),
                    .octdelaysetting2           (octdelaysetting2[0]),
                    .seriesterminationcontrol   (seriesterminationcontrol),
                    .parallelterminationcontrol (parallelterminationcontrol)
                );
            end
        end // Not QDRII
        // Create any necessary slaves :
        // In lieu of the old "_l" and "_h" system, we now generate indices 0,1,2.. to support wide QDRII groups :
        for (num_clkdivs=0; num_clkdivs < NUM_CLKDIVS_PER_GRP; num_clkdivs = num_clkdivs + 1)
        begin : dqs_config_gen
            stratixiii_dqs_config dqs_config(
                .datain                       (scan_din[dqs_grp_num]),
                .clk                          (sc_clk[dqs_grp_num]),
                .ena                          (scan_enable_dqs_config[dqs_grp_num]),
                .update                       (scan_update[dqs_grp_num]),
                // synopsys translate_off
                .devclrn(), .devpor(),
                .dqsbusoutfinedelaysetting(),
                .dqsenablefinedelaysetting(),
                // synopsys translate_on
                .dqsbusoutdelaysetting        (dqsbusoutdelaysetting[num_clkdivs]),
                .dqsinputphasesetting         (dqsinputphasesetting [num_clkdivs]),
                .dqsenablectrlphasesetting    (dqsenablectrlphasesetting[num_clkdivs]),
                .dqsoutputphasesetting        (dqsoutputphasesetting[num_clkdivs]),
                .dqoutputphasesetting         (dqoutputphasesetting[num_clkdivs]),
                .resyncinputphasesetting      (resyncinputphasesetting[num_clkdivs]),
                .dividerphasesetting          (dividerphasesetting[num_clkdivs][dqs_grp_num]),
                .enaoctcycledelaysetting      (enaoctcycledelaysetting[num_clkdivs]),
                .enainputcycledelaysetting    (enainputcycledelaysetting[num_clkdivs]),
                .enaoutputcycledelaysetting   (enaoutputcycledelaysetting[num_clkdivs]),
                .dqsenabledelaysetting        (dqsenabledelaysetting[num_clkdivs]),
                .octdelaysetting1             (octdelaysetting1[num_clkdivs]),
                .octdelaysetting2             (octdelaysetting2[num_clkdivs]),
                .enadataoutbypass             (enadataoutbypass[num_clkdivs]),
                .enadqsenablephasetransferreg (enadqsenablephasetransferreg[num_clkdivs]),
                .enaoctphasetransferreg       (enaoctphasetransferreg[num_clkdivs]),
                .enaoutputphasetransferreg    (enaoutputphasetransferreg[num_clkdivs]),
                .enainputphasetransferreg     (enainputphasetransferreg[num_clkdivs]),
                .resyncinputphaseinvert       (resyncinputphaseinvert[num_clkdivs]),
                .dqsenablectrlphaseinvert     (dqsenablectrlphaseinvert[num_clkdivs]),
                .dqoutputphaseinvert          (dqoutputphaseinvert[num_clkdivs]),
                .dqsoutputphaseinvert         (dqsoutputphaseinvert[num_clkdivs]),
                .dataout                      (scan_dout_dqs_config[dqs_grp_num*NUM_CLKDIVS_PER_GRP + num_clkdivs])
            );
        end
    end // DQS group
endgenerate
// Scan data out muxing - this is provided purely for HCx :
generate
    if (MEM_IF_DM_PINS_EN)
    begin : hcx_scan_dout_mux
	always @*
	begin
	    casez({|scan_enable_dqs_config, |scan_enable_dqs, |scan_enable_dq, |scan_enable_dm})
	    4'b1000 : scan_dout = {{ (MEM_IF_DWIDTH - (NUM_CLKDIVS_PER_GRP * MEM_IF_DQS_WIDTH) ){1'b0}}, scan_dout_dqs_config};
	    4'b0100 : scan_dout = {{ (MEM_IF_DWIDTH - MEM_IF_DQS_WIDTH){1'b0}}, scan_dout_dqs};
	    4'b0010 : scan_dout = scan_dout_dq;
	    default : scan_dout = {{(MEM_IF_DWIDTH - MEM_IF_DM_WIDTH){1'b0}}, scan_dout_dm};
	    endcase
	end
    end
    else
    begin : hcx_scan_dout_mux_no_dm
	always @*
	begin
	    casez({|scan_enable_dqs_config, |scan_enable_dqs, |scan_enable_dq})
	    3'b100  : scan_dout = {{ (MEM_IF_DWIDTH - (NUM_CLKDIVS_PER_GRP * MEM_IF_DQS_WIDTH) ){1'b0}}, scan_dout_dqs_config};
	    3'b010  : scan_dout = {{ (MEM_IF_DWIDTH - MEM_IF_DQS_WIDTH){1'b0}}, scan_dout_dqs};
	    default : scan_dout = scan_dout_dq;
	    endcase
	end
    end
endgenerate
endmodule