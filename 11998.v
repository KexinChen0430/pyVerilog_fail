module interface
    assign d_out = d_out_3;
    assign empty = !full_3; // if the last stage is empty, the fifo is empty
    assign si = shift_in;
    assign so = shift_out;
    wire [ADDRSIZE:0] fifo_ram_count = wa_m - ra_m;
    assign mux_rm_2 = full_r2;          // mux control of SRAM data bypass if only one value in stage r2
    assign d_out_2 = mux_rm_2 ? d_out_r2 : d_out_m2;    // additional data mux for SRAM bypass
    // write port control of SRAM
    assign wen = si && !so && full_1    // enter new value into SRAM, because regs are filled
                || si && !m_empty;  // if a value is in the SRAM, then we have to shift through or shift in
    // read port control of SRAM
    assign ren = so && !m_empty;
    assign m_empty = (wa_m == ra_m);
    always @ (posedge clk or negedge res_n) begin
        if (!res_n) begin
            full_m1 <= 1'b0;
            full_m2 <= 1'b0;
        end else begin
            full_m1 <= ren; // no control of m1
            full_m2 <= full_m1
                    || full_m2 && !so && full_r2;       // no rescue possible
        end
    end
// pointer management
    always @(*) begin
        wa = wa_m + 1'b1; // wa_m is the address stored in mem addr register
        ra = ra_m + 1'b1;
    end
    always @ (posedge clk or negedge res_n) begin
        if (!res_n) begin
            wa_m <= {ADDRSIZE {1'b0}};
            ra_m <= {ADDRSIZE {1'b0}};
        end else begin
            if (wen) begin
                wa_m <= wa; // next mem write addr to mem addr register
            end
            if (ren) begin
                ra_m <= ra;
            end
        end
    end
//=====================================================================================================
//=====================================================================================================
openhmc_sync_fifo_reg_stage #(.DWIDTH(DATASIZE))
    sync_fifo_reg_stage_3_I (
        .clk(clk),
        .res_n(res_n),
        .d_in(d_in),
        .d_in_p(d_out_2),
        .p_full(full_2),
        .n_full(1'b1),
        .si(si),
        .so(so),
        .full(full_3),
        .d_out(d_out_3)
    );
openhmc_ram #(
    .DATASIZE(DATASIZE),    // Memory data word width
    .ADDRSIZE(ADDRSIZE),    // Number of memory address bits
    .PIPELINED(1)
    )
    ram(
        .clk(clk),
        .wen(wen),
        .wdata(d_in),
        .waddr(wa),
        .ren(ren),
        .raddr(ra),
        .rdata(d_out_m2)
        );
`ifdef CAG_ASSERTIONS
    if (DISABLE_SHIFT_OUT_ASSERT == 0)
        shift_out_and_empty:    assert property (@(posedge clk) disable iff(!res_n) (shift_out |-> !empty));
    if (DISABLE_XCHECK_ASSERT == 0)
    dout_known:                 assert property (@(posedge clk) disable iff(!res_n) (!empty |-> !$isunknown(d_out)));
    final
    begin
        if (DISABLE_EMPTY_ASSERT == 0)
        begin
            empty_not_set_assert:           assert (empty);
        end
    end
`endif // CAG_ASSERTIONS
endmodule