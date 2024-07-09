module.
    input                               clk_i,    // The mandatory clock, as this is synchronous logic.
    input                               rst_i    // The mandatory reset, as this is synchronous logic.
);
// WARNING: EVERYTHING ON AND ABOVE THIS LINE MAY BE OVERWRITTEN BY KACTUS2!!!
    // The current state.
    reg [2:0] state;
    // The available states.
    parameter [2:0]
        S_CMD               = 3'd0, // Waiting command from the master
        S_WRITE_INIT        = 3'd1, // Initiating a write to slave.
        S_WAIT_WRITE_ACK    = 3'd2, // Waiting ack for write from slave.
        S_READ_INIT         = 3'd3, // Initiating a read to slave.
        S_WAIT_READ_ACK     = 3'd4, // Waiting ack for write from slave.
        S_DEASSERT     = 3'd5;
    always @(posedge clk_i or posedge rst_i) begin
        if(rst_i == 1'b1) begin
            // Initally waiting for start signal.
            state <= S_CMD;
            // Everything else is zero.
            wb_dat_o <= 0;
            wb_cyc_o <= 0;
            wb_stb_o <= 0;
            wb_we_o <= 0;
            wb_adr_o <=  0;
            mem_data_out <= 0;
            mem_slave_rdy <= 0;
        end
        else begin
        case(state)
            S_CMD: begin
                // Wait for the master.
                if (mem_master_rdy == 1'b1) begin
                    // Branch based on if it is read or write.
                    if (mem_we_in == 1'b1) begin
                        state <=  S_WRITE_INIT;
                    end
                    else begin
                        state <=  S_READ_INIT;
                    end
                end
            end
            S_WRITE_INIT: begin
                // Assert signals indicating we are ready to transfer.
                wb_cyc_o <= 1;
                wb_stb_o <= 1;
                // We are writing to slave.
                wb_we_o <= 1;
                // Take data directly from the master.
                wb_dat_o <= mem_data_in;
                wb_adr_o <= mem_address_in;
                // Next we shall wait for acknowledgement.
                state <= S_WAIT_WRITE_ACK;
            end
            S_WAIT_WRITE_ACK: begin
                if (wb_err_i == 1'b1 || wb_ack_i == 1'b1) begin
                    // Deassert initiator signals.
                    wb_cyc_o <= 0;
                    wb_stb_o <= 0;
                    wb_we_o <= 0;
                    // Pass the result to the master.
                    mem_slave_rdy <= 1;
                    // Look for the next operation.
                    state <=  S_DEASSERT;
                end
            end
            S_READ_INIT: begin
                // Assert signals indicating we are ready to transfer.
                wb_cyc_o <= 1;
                wb_stb_o <= 1;
                // We are reading from slave.
                wb_we_o <= 0;
                // Take address directly from the master.
                wb_adr_o <= mem_address_in;
                // Next we shall wait for acknowledgement.
                state <= S_WAIT_READ_ACK;
            end
            S_WAIT_READ_ACK: begin
                if (wb_err_i == 1'b1 || wb_ack_i == 1'b1) begin
                    // Deassert initiator signals.
                    wb_cyc_o <= 0;
                    wb_stb_o <= 0;
                    wb_we_o <= 0;
                    // Pass the result to the master.
                    mem_slave_rdy <= 1;
                    if (wb_err_i == 1'b1) begin
                        mem_data_out <= 0;
                    end
                    else begin
                        mem_data_out <= wb_dat_i;
                    end
                    // Look for the next operation.
                    state <=  S_DEASSERT;
                end
            end
            S_DEASSERT: begin
                state <= S_CMD;
                mem_slave_rdy <= 0;
            end
            default: begin
                $display("ERROR: Unkown state: %d", state);
            end
        endcase
        end
    end
endmodule