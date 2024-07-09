module
assign cfg2lookup_cs_n = (addr_latch[31:20] == 12'd0) ? localbus_cs_n : 1'b1;
assign cfg2lookup_rd_wr = localbus_rd_wr;
assign cfg2lookup_data = localbus_data;
assign cfg2lookup_ale = (cfg2lookup_data[31:20] == 12'd0) ? localbus_ale : 1'b0;
//  Ram Allocate
assign cfg2rule_rw = ~localbus_rd_wr;
assign cfg2rule_wdata = localbus_data;
localparam  IDLE_S = 2'd0,
            SEND_S = 2'd1,
            RELEASE_S = 2'd2;
always @(posedge clk or negedge rst_n) begin
    if(rst_n == 1'b0) begin
        cfg2rule_cs <= 1'b0;
        ram_state <= IDLE_S;
    end
    else begin
        case(ram_state)
            IDLE_S: begin
                cfg2rule_cs <= 1'b0;
                if(localbus_ale == 1'b1) begin
                    if(localbus_data[31:20] == 12'd1) begin//ram address space
                        cfg2rule_addr <= localbus_data[15:0];
                        ram_state <= SEND_S;
                    end
                    else begin
                        ram_state <= IDLE_S;
                    end
                end
                else begin
                    ram_state <= IDLE_S;
                end
            end
            SEND_S: begin//wait cfg data
                if(localbus_cs_n == 1'b0) begin
                    cfg2rule_cs <= 1'b1;
                    ram_state <= RELEASE_S;
                end
                else begin
                    cfg2rule_cs <= 1'b0;
                    ram_state <= SEND_S;
                end
            end
            RELEASE_S: begin//wait localbus cs&ack handshake over
                if(localbus_cs_n == 1'b0) begin
                    cfg2rule_cs <= 1'b1;
                    ram_state <= RELEASE_S;
                end
                else begin
                    cfg2rule_cs <= 1'b0;
                    ram_state <= IDLE_S;
                end
            end
            default: begin
                cfg2rule_cs <= 1'b0;
                ram_state <= IDLE_S;
            end
        endcase
    end
end
endmodule