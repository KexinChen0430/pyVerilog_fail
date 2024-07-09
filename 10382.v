module works only with 16/32/64 gtx input data width");
            $finish;
        end
endgenerate
`ifdef SIMULATION
// info msgs
always @ (posedge clk)
begin
    if (txcominit) begin
        HOST_OOB_TITLE = "Issued cominit";
        $display("[Host] OOB:         %s @%t",HOST_OOB_TITLE,$time);
    end
    if (txcomwake) begin
        HOST_OOB_TITLE = "Issued comwake";
        $display("[Host] OOB:         %s @%t",HOST_OOB_TITLE,$time);
    end
    if (state_wait_linkup) begin
        HOST_OOB_TITLE = "Link is up";
        $display("[Host] OOB:         %s @%t",HOST_OOB_TITLE,$time);
    end
    if (set_wait_synp) begin
        HOST_OOB_TITLE = "Started continious align sending";
        $display("[Host] OOB:         %s @%t",HOST_OOB_TITLE,$time);
    end
end
`endif
always @ (posedge clk)
    rxcom_timer <= rst | rxcominit_done & state_wait_cominit | rxcomwake_done & state_wait_comwake | rxcominitdet & state_wait_cominit | rxcomwakedet & state_wait_comwake ? 10'h0 : cominit_req_l & state_idle | rxcominitdet_l & state_wait_cominit | rxcomwakedet_l & state_wait_comwake ? rxcom_timer + CLK_TO_TIMER_CONTRIB[9:0] : 10'h0;
// set data outputs to gtx
assign  txdata_out    = txdata;
assign  txcharisk_out = txcharisk;
// rxelectidle timer logic
assign  eidle_timer_done = eidle_timer == 64;
always @ (posedge clk)
    eidle_timer <= rst | rxelecidle | ~state_wait_eidle ? 8'b0 : eidle_timer + CLK_TO_TIMER_CONTRIB[7:0];
always @ (posedge clk) begin
    if (rst || !detected_alignp)    detected_alignp_cntr <= NUM_CON_ALIGNS;
    else if (|detected_alignp_cntr) detected_alignp_cntr <= detected_alignp_cntr -1;
    detected_alignp_r <= detected_alignp_cntr == 0;
end
always @ (posedge clk)
    debug <= rst ? 12'h000 : {
                                state_idle,
                                state_wait_cominit,
                                state_wait_comwake,
                                state_recal_tx,
                                state_wait_eidle,
                                state_wait_rxrst,
                                state_wait_align,
                                state_wait_synp,
                                state_wait_linkup,
                                state_error,
                                oob_start,
                                oob_error} | debug;
endmodule