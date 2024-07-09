module tb ();
reg tb_clk  = 1'b0;
reg tb_rstn = 1'b0;
//Generate stimulus
always @ (posedge clk) begin
end
//Check process
always @ (posedge clk) begin
    if (~tb_rstn) begin
        check_fifo_flush <= 1'b1;
    end
    else begin
        check_fifo_flush <= 1'b0;
        check_fifo_read  <= 1'b0;
        if (us_rdy && us_ack) begin
            if (check_fifo_empty) begin
                $display("ERROR: DUT output rdy but no data in check fifo");
                $finish();
            end
            else begin
                check_fifo_mem_funct  = check_fifo_rdata[`CHECK_FIFO_MEM_FUNCT_RANGE];
                check_fifo_mem_data   = check_fifo_rdata[`CHECK_FIFO_MEM_DATA_RANGE ];
                check_fifo_mem_result = check_fifo_rdata[`CHECK_FIFO_RESULT_RANGE   ];
                check_fifo_wb_rsd     = check_fifo_rdata[`CHECK_FIFO_WB_RSD_RANGE   ];
                check_fifo_trans_cnt  = check_fifo_rdata[`CHECK_FIFO_TRANS_CNT_RANGE];
                if (check_fifo_mem_funct != dut_mem_funct) begin
                    $display("ERROR: dut_mem_funct mismatch for trans : %0d",
                        check_fifo_trans_cnt);
                    check_fifo_mismatch |= 1;
                end
                if (check_fifo_mem_data != dut_mem_data) begin
                    $display("ERROR: dut_mem_data mismatch for trans : %0d",
                        check_fifo_trans_cnt);
                    check_fifo_mismatch |= 1;
                end
                if (check_fifo_mem_result != dut_mem_result) begin
                    $display("ERROR: dut_mem_result mismatch for trans : %0d",
                        check_fifo_trans_cnt);
                    check_fifo_mismatch |= 1;
                end
                if (check_fifo_wb_rsd != dut_wb_rsd) begin
                    $display("ERROR: dut_wb_rsd mismatch for trans : %0d",
                        check_fifo_trans_cnt);
                    check_fifo_mismatch |= 1;
                end
                if (check_fifo_mismatch) begin
                    $display("Test ending due to mismatches");
                    $finish();
                end
                else begin
                    $display("Match for trans : %0d", check_fifo_trans_cnt);
                    check_fifo_read <= 1'b1;
                end
            end
        end
    end
end
endmodule