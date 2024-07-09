module can receive pkt
                    exe_dfifo_rd <= 1'b1;
                    rule_fifo_rd <= 1'b1;
                    exe_state <= METADATA_S;
                end
                else begin
                    exe_dfifo_rd <= 1'b0;
                    rule_fifo_rd <= 1'b0;
                    exe_state <= IDLE_S;
                end
            end
            METADATA_S: begin
                rule_fifo_rd <= 1'b0;
                case(rule_fifo_rdata[31:28])
                    4'd1: begin//1 trans to CPU with thread id assignd by user
                        exe2disp_data_wr <= 1'b1;
                        exe2disp_data[133:56] <= exe_dfifo_rdata[133:56];
                        exe2disp_data[55:47] <= {1'b0,rule_fifo_rdata[7:0]};
                        exe2disp_data[46:0] <= exe_dfifo_rdata[46:0];
                        exe_state <= TRANS_S;
                    end
                    4'd2: begin//2 trans to CPU with polling thread id
                        exe2disp_data_wr <= 1'b1;
                        exe2disp_data[133:56] <= exe_dfifo_rdata[133:56];
                        exe2disp_data[55:47] <= {3'b0,polling_cpuid};
                        exe2disp_data[46:0] <= exe_dfifo_rdata[46:0];
                        if((polling_cpuid+6'b1) < sys_max_cpuid) begin
                        //if use sys_max_cpuid -1,maybe underflow
                            polling_cpuid <= polling_cpuid + 6'd1;
                        end
                        else begin
                            polling_cpuid <= 6'b0;
                        end
                        exe_state <= TRANS_S;
                    end
                    4'd3: begin//3 trans to port
                        exe2disp_data_wr <= 1'b1;
                        //modify by lxj 20161011 start
                        exe2disp_data[133:113] <= exe_dfifo_rdata[133:113];
                        exe2disp_data[109:74] <= exe_dfifo_rdata[109:74];
                        if(rule_fifo_rdata[7:4] == 4'b0) begin//slot0
                            exe2disp_data[112:110] <= 3'b0;
                            exe2disp_data[73:64] <= {6'b0,rule_fifo_rdata[3:0]};
                        end
                        else begin//slot1
                            exe2disp_data[112:110] <= 3'b1;
                            exe2disp_data[73:64] <= {6'b0,rule_fifo_rdata[7:4]};
                        end
                        //modify by lxj 20161011 end
                        //exe2disp_data[73:64] <= {2'b0,rule_fifo_rdata[7:0]};
                        exe2disp_data[63:0] <= exe_dfifo_rdata[63:0];
                        exe_state <= TRANS_S;
                    end
                    default: begin//discard
                        exe2disp_data_wr <= 1'b0;
                        exe_state <= DISCARD_S;
                    end
                endcase
            end
            TRANS_S: begin
                exe2disp_data_wr <= 1'b1;
                exe2disp_data <= exe_dfifo_rdata;
                if(exe_dfifo_rdata[133:132] == 2'b10) begin//end of pkt
                    exe_dfifo_rd <= 1'b0;
                    exe2disp_valid_wr <= 1'b1;
                    exe_state <= IDLE_S;
                end
                else begin
                    exe_dfifo_rd <= 1'b1;
                    exe2disp_valid_wr <= 1'b0;
                    exe_state <= TRANS_S;
                end
            end
            DISCARD_S: begin
                rule_fifo_rd <= 1'b0;
                exe2disp_data_wr <= 1'b0;
                if(exe_dfifo_rdata[133:132] == 2'b10) begin//end of pkt
                    exe_dfifo_rd <= 1'b0;
                    exe_state <= IDLE_S;
                end
                else begin
                    exe_dfifo_rd <= 1'b1;
                    exe_state <= DISCARD_S;
                end
            end
            default: begin
                exe_dfifo_rd <= 1'b0;
                rule_fifo_rd <= 1'b0;
                exe2disp_data_wr <= 1'b0;
                exe2disp_valid_wr <= 1'b0;
                polling_cpuid <= 6'b0;
                exe_state <= IDLE_S;
            end
        endcase
    end
end
always @(posedge clk or negedge rst_n) begin
    if(rst_n == 1'b0) begin
        rule_fifo_rd_dly <= 1'b0;
    end
    else begin
        rule_fifo_rd_dly <= rule_fifo_rd;
    end
end
//                  Other IP Instance
//likely fifo/ram/async block....
//should be instantiated below here
fifo_256_134 exe_dfifo(
    .aclr(~rst_n),
    .clock(clk),
    .wrreq(parser2exe_data_wr),
    .data(parser2exe_data),
    .rdreq(exe_dfifo_rd),
    .q(exe_dfifo_rdata),
    .usedw(exe_dfifo_usedw)
);
rulefifo_64_32 rule_fifo(
    .aclr(~rst_n),
    .clock(clk),
    .wrreq(lookup2exe_rule_wr),
    .data(lookup2exe_rule),
    .rdreq(rule_fifo_rd_dly),
    .q(rule_fifo_rdata),
    .empty(rule_fifo_empty)
);
endmodule