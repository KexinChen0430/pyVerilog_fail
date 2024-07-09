module pll_top  ( input     ref_clk
                , input     rst
                , output    out_clk
                , output    locked
                , input     pcie_ready
                , output    pcie_ready_sync
                , input     xwopen
                , output    xwopen_sync
                );
    wire pll_core_locked;
    reg     [5:0]   lock_reg, lock_next;
    assign locked = (lock_reg == '1);
    reg [1:0] p_reg, x_reg;
    assign pcie_ready_sync = p_reg[1];
    assign xwopen_sync = x_reg[1];
    // make absolutely sure that the pll_locked signal is stable before taking the ckt out of reset
    always_comb begin
        lock_next = lock_reg;
        if (pll_core_locked) begin
            // when pll_core_locked, count upwards w/saturation
            if (~locked) begin
                lock_next = lock_reg + 1'b1;
            end
        end else begin
            // otherwise, restart count
            lock_next = '0;
        end
    end
    always_ff @(posedge out_clk or posedge rst) begin
        if (rst) begin
            lock_reg    <= '0;
            p_reg       <= '0;
            x_reg       <= '0;
        end else begin
            lock_reg    <= lock_next;
            p_reg       <= {p_reg[0],pcie_ready};
            x_reg       <= {x_reg[0],xwopen};
        end
    end
    pll_core ipll   ( .refclk   (ref_clk)
                    , .rst      (rst)
                    , .outclk_0 (out_clk)
                    , .locked   (pll_core_locked)
                    );
endmodule