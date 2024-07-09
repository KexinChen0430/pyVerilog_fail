module. Includes TLB RAM inside.
zap_tlb #(
        .LPAGE_TLB_ENTRIES      (LPAGE_TLB_ENTRIES),
        .SPAGE_TLB_ENTRIES      (SPAGE_TLB_ENTRIES),
        .SECTION_TLB_ENTRIES    (SECTION_TLB_ENTRIES),
        .FPAGE_TLB_ENTRIES      (FPAGE_TLB_ENTRIES)
)
u_zap_tlb (
        .i_clk          (i_clk),
        .i_reset        (i_reset),
        .i_address      (i_address),
        .i_address_nxt  (i_address_nxt),
        .i_rd           (i_rd),
        .i_wr           (i_wr),
        .i_cpsr         (i_cpsr),
        .i_sr           (i_sr),
        .i_dac_reg      (i_dac_reg),
        .i_baddr        (i_baddr),
        .i_mmu_en       (i_mmu_en),
        .i_inv          (i_tlb_inv),
        .o_phy_addr     (tlb_phy_addr),
        .o_fsr          (tlb_fsr),
        .o_far          (tlb_far),
        .o_fault        (tlb_fault),
        .o_cacheable    (tlb_cacheable),
        .o_busy         (tlb_busy),
        .o_wb_stb_nxt   (wb_stb[2]),
        .o_wb_cyc_nxt   (wb_cyc[2]),
        .o_wb_adr_nxt   (wb_adr[2]),
        .o_wb_wen_nxt   (wb_wen[2]),
        .o_wb_sel_nxt   (wb_sel[2]),
        .o_wb_dat_nxt   (wb_dat[2]),
        .i_wb_dat       (i_wb_dat),
        .i_wb_ack       (wb_ack[2])
);
// Sequential Block
always @ ( posedge i_clk )
begin
        if ( i_reset )
        begin
                state_ff <= S0;
                o_wb_stb <= 1'd0;
                o_wb_cyc <= 1'd0;
                o_wb_adr <= 32'd0;
                o_wb_cti <= CTI_CLASSIC;
                o_wb_sel <= 4'd0;
                o_wb_dat <= 32'd0;
                o_wb_wen <= 1'd0;
        end
        else
        begin
                state_ff <= state_nxt;
                o_wb_stb <= o_wb_stb_nxt;
                o_wb_cyc <= o_wb_cyc_nxt;
                o_wb_adr <= o_wb_adr_nxt;
                o_wb_cti <= o_wb_cti_nxt;
                o_wb_sel <= o_wb_sel_nxt;
                o_wb_dat <= o_wb_dat_nxt;
                o_wb_wen <= o_wb_wen_nxt;
        end
end
// Next state logic.
always @*
begin
        state_nxt = state_ff;
        // Change state only if strobe is inactive or strobe has just completed.
        if ( !o_wb_stb || (o_wb_stb && i_wb_ack) )
        begin
                casez({wb_cyc[2],wb_cyc[1],wb_cyc[0]})
                3'b1?? : state_nxt = S2; // TLB.
                3'b01? : state_nxt = S1; // Tag.
                3'b001 : state_nxt = S0; // Cache.
                default: state_nxt = state_ff;
                endcase
        end
end
// Route ACKs to respective masters.
always @*
begin
        wb_ack = 0;
        case(state_ff)
        S0: wb_ack[0] = i_wb_ack;
        S1: wb_ack[1] = i_wb_ack;
        S2: wb_ack[2] = i_wb_ack;
        endcase
end
// Combo signals for external MUXing.
always @*
begin
        o_wb_stb_nxt = wb_stb[state_nxt];
        o_wb_cyc_nxt = wb_cyc[state_nxt];
        o_wb_adr_nxt = wb_adr[state_nxt];
        o_wb_dat_nxt = wb_dat[state_nxt];
        o_wb_cti_nxt = wb_cti[state_nxt];
        o_wb_sel_nxt = wb_sel[state_nxt];
        o_wb_wen_nxt = wb_wen[state_nxt];
end
endmodule