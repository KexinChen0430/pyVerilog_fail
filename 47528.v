module is done this way to aggregate external accesses.
    // So 'assign sim_rd_ready =   read_in_progress;' should be sufficient, but if that will chnage - below is
    // full vesion that does not depend on the assumption.
    assign sim_rd_ready =   read_in_progress &&
           !rcount[7] && (!(&rcount[6:0]) || !was_data_fifo_write);
    always @ (posedge  aclk) begin
        if (start_read_burst_w) begin
            if (arsize_out != 2'h3) begin
                $display ("%m: at time %t ERROR: arsize_out=%h, currently only 'h3 (8 bytes) is valid",$time,arsize_out);
                $stop;
            end
        end
        if (arvalid && arready) begin
            if (((arlock ^ VALID_ARLOCK) & VALID_ARLOCK_MASK) != 0) begin
                $display ("%m: at time %t ERROR: arlock = %h, valid %h with mask %h",$time, arlock, VALID_ARLOCK, VALID_ARLOCK_MASK);
                $stop;
            end
            if (((arcache ^ VALID_ARCACHE) & VALID_ARCACHE_MASK) != 0) begin
                $display ("%m: at time %t ERROR: arcache = %h, valid %h with mask %h",$time, arcache, VALID_ARCACHE, VALID_ARCACHE_MASK);
                $stop;
            end
            if (((arprot ^ VALID_ARPROT) & VALID_ARPROT_MASK) != 0) begin
                $display ("%m: at time %t ERROR: arprot = %h, valid %h with mask %h",$time, arprot, VALID_ARPROT, VALID_ARPROT_MASK);
                $stop;
            end
        end
    end
    always @ (posedge aclk or posedge rst) begin
        if (rst)                     fifo_with_requested <= 0;
        else if (start_read_burst_w) fifo_with_requested <= next_with_requested;
        else                         fifo_with_requested <= fifo_with_requested - {7'h0,fifo_data_rd};
        if (rst)  was_data_fifo_read <= 0;
        else      was_data_fifo_read <= rvalid && rready;
        if (rst)  was_addr_fifo_write <= 0;
        else      was_addr_fifo_write <= arvalid && arready;
        if (rst)  was_data_fifo_write <= 0;
        else      was_data_fifo_write <= sim_rd_valid && sim_rd_ready;
        if   (rst)                   rburst[1:0] <= 0;
        else if (start_read_burst_w) rburst[1:0] <= arburst_out[1:0];
        if   (rst)                   rlen[3:0] <= 0;
        else if (start_read_burst_w) rlen[3:0] <=   arlen_out[3:0];
        if   (rst) read_in_progress <= 0;
        else       read_in_progress <= read_in_progress_w;
        if   (rst) read_left <= 0;
        else if (start_read_burst_w)           read_left <= arlen_out[3:0]; // precedence over inc
        else if (sim_rd_valid && sim_rd_ready) read_left <= read_left-1; //SuppressThisWarning ISExst Result of 32-bit expression is truncated to fit in 4-bit target.
        if   (rst)                             read_address <= 32'bx;
        else if (start_read_burst_w)           read_address <= araddr_out; // precedence over inc
        else if (sim_rd_valid && sim_rd_ready) read_address <= {read_address[31:12],next_rd_address[11:3],read_address[2:0]};
    end
fifo_same_clock_fill   #( .DATA_WIDTH(50),.DATA_DEPTH(2)) // read - 4, write - 32?
    raddr_i (
        .rst          (rst),
        .clk          (aclk),
        .sync_rst     (1'b0),
        .we           (arvalid && arready),
        .re           (start_read_burst_w),
        .data_in      ({arid[5:0],     arburst[1:0],    arsize[1:0],    arlen[3:0],    araddr[31:0],     rd_qos_in[3:0]}),
        .data_out     ({arid_out[5:0], arburst_out[1:0],arsize_out[1:0],arlen_out[3:0],araddr_out[31:0], rd_qos_out[3:0]}),
        .nempty       (ar_nempty),
        .half_full    (), //aw_half_full),
        .under        (), //waddr_under),  // output reg
        .over         (), //waddr_over),   // output reg
        .wcount       (), //waddr_wcount), // output[3:0] reg
        .rcount       (), //waddr_rcount), // output[3:0] reg
        .wnum_in_fifo (racount),           // output[3:0]
        .rnum_in_fifo ()                   // output[3:0]
    );
fifo_same_clock_fill   #( .DATA_WIDTH(73),.DATA_DEPTH(7)) // read - 4, write - 32?
    rdata_i (
        .rst          (rst),
        .clk          (aclk),
        .sync_rst     (1'b0),
        .we           (sim_rd_valid && sim_rd_ready),
        .re           (rvalid && rready),
        .data_in      ({last_read, arid_out[5:0],  sim_rd_resp[1:0],  sim_rd_data[63:0]}),
        .data_out     ({rlast,     rid[5:0],       rresp[1:0],        rdata[63:0]}),
        .nempty       (r_nempty), //r_nempty),
        .half_full    (), //aw_half_full),
        .under        (), //waddr_under),
        .over         (), //waddr_over),
        .wcount       (), //waddr_wcount),
        .rcount       (), //waddr_rcount),
        .wnum_in_fifo (),
        .rnum_in_fifo (rcount)
    );
endmodule