module input addr is 23bit
    assign byte_en = (|fetch_write) ? 4'b1111 : byte_en_buf;
    assign o_p_waitrequest = (state != IDLE);
    assign o_m_byte_en = 4'b1111;
    assign hit_num = (hit[0]) ? 0 :
                     (hit[1]) ? 1 :
                     (hit[2]) ? 2 :
                     (hit[3]) ? 3 :
                     (hit[4]) ? 4 :
                     (hit[5]) ? 5 :
                     (hit[6]) ? 6 : 7;
    assign invalid_num = (!valid[0]) ? 0 :
                         (!valid[1]) ? 1 :
                         (!valid[2]) ? 2 :
                         (!valid[3]) ? 3 :
                         (!valid[4]) ? 4 :
                         (!valid[5]) ? 5 :
                         (!valid[6]) ? 6 : 7;
    assign word_en = (|fetch_write) ? 4'b1111 :
                     (write_addr_buf[1:0] == 2'b00) ? 4'b0001 :
                     (write_addr_buf[1:0] == 2'b01) ? 4'b0010 :
                     (write_addr_buf[1:0] == 2'b10) ? 4'b0100 : 4'b1000;
    assign replace = (r_cm_data[6]) ? ((r_cm_data[4]) ? ((r_cm_data[0]) ? 7 : 6) : ((r_cm_data[1]) ? 5 : 4)) :
                                      ((r_cm_data[5]) ? ((r_cm_data[2]) ? 3 : 2) : ((r_cm_data[3]) ? 1 : 0));
    always @(posedge clk) begin
        if(hit) begin
            case(hit_num)
                0: w_cm_data <= {3'b011, r_cm_data[4], 1'b1, r_cm_data[2:0]};
                1: w_cm_data <= {3'b011, r_cm_data[4], 1'b0, r_cm_data[2:0]};
                2: w_cm_data <= {3'b010, r_cm_data[4:3], 1'b1, r_cm_data[1:0]};
                3: w_cm_data <= {3'b010, r_cm_data[4:3], 1'b0, r_cm_data[1:0]};
                4: w_cm_data <= {2'b00, r_cm_data[5], 1'b1, r_cm_data[3:2], 1'b1, r_cm_data[0]};
                5: w_cm_data <= {2'b00, r_cm_data[5], 1'b1, r_cm_data[3:2], 1'b0, r_cm_data[0]};
                6: w_cm_data <= {2'b00, r_cm_data[5], 1'b0, r_cm_data[3:1], 1'b1};
                7: w_cm_data <= {2'b00, r_cm_data[5], 1'b0, r_cm_data[3:1], 1'b0};
            endcase
        end else if(!(&valid)) begin
            case(invalid_num)
                0: w_cm_data <= {3'b011, r_cm_data[4], 1'b1, r_cm_data[2:0]};
                1: w_cm_data <= {3'b011, r_cm_data[4], 1'b0, r_cm_data[2:0]};
                2: w_cm_data <= {3'b010, r_cm_data[4:3], 1'b1, r_cm_data[1:0]};
                3: w_cm_data <= {3'b010, r_cm_data[4:3], 1'b0, r_cm_data[1:0]};
                4: w_cm_data <= {2'b00, r_cm_data[5], 1'b1, r_cm_data[3:2], 1'b1, r_cm_data[0]};
                5: w_cm_data <= {2'b00, r_cm_data[5], 1'b1, r_cm_data[3:2], 1'b0, r_cm_data[0]};
                6: w_cm_data <= {2'b00, r_cm_data[5], 1'b0, r_cm_data[3:1], 1'b1};
                7: w_cm_data <= {2'b00, r_cm_data[5], 1'b0, r_cm_data[3:1], 1'b0};
            endcase
        end else begin
            case(replace)
                0: w_cm_data <= {3'b011, r_cm_data[4], 1'b1, r_cm_data[2:0]};
                1: w_cm_data <= {3'b011, r_cm_data[4], 1'b0, r_cm_data[2:0]};
                2: w_cm_data <= {3'b010, r_cm_data[4:3], 1'b1, r_cm_data[1:0]};
                3: w_cm_data <= {3'b010, r_cm_data[4:3], 1'b0, r_cm_data[1:0]};
                4: w_cm_data <= {2'b00, r_cm_data[5], 1'b1, r_cm_data[3:2], 1'b1, r_cm_data[0]};
                5: w_cm_data <= {2'b00, r_cm_data[5], 1'b1, r_cm_data[3:2], 1'b0, r_cm_data[0]};
                6: w_cm_data <= {2'b00, r_cm_data[5], 1'b0, r_cm_data[3:1], 1'b1};
                7: w_cm_data <= {2'b00, r_cm_data[5], 1'b0, r_cm_data[3:1], 1'b0};
            endcase
        end
    end
    always @(posedge clk) begin
        if(rst) begin
            o_p_readdata_valid <= 0;
            {o_m_read, o_m_write} <= 0;
            o_m_addr <= 0;
            write_addr_buf <= 0;
            byte_en_buf <= 0;
            writedata_buf <= 0;
            {write_buf, read_buf} <= 0;
            write_set <= 0;
            fetch_write <= 0;
            w_cm <= 0;
            {cnt_r, cnt_w} <= 0;
            {cnt_hit_r, cnt_hit_w} <= 0;
            {cnt_wb_r, cnt_wb_w} <= 0;
            state <= IDLE;
        end
        else begin
            case (state)
                IDLE: begin
                    write_set <= 0;
                    o_p_readdata_valid <= 0;
                    writedata_buf <= {i_p_writedata, i_p_writedata, i_p_writedata, i_p_writedata};
                    write_addr_buf <= i_p_addr;
                    byte_en_buf <= i_p_byte_en;
                    write_buf <= i_p_write;
                    read_buf <= i_p_read;
                    if(i_p_read) begin
                        state <= COMP;
                        cnt_r <= cnt_r + 1;
                    end else if(i_p_write) begin
                        state <= COMP;
                        cnt_w <= cnt_w + 1;
                    end
                end
                COMP: begin
                    if((|hit) && write_buf) begin
                        state <= HIT;
                        w_cm <= 1;
                        write_set <= hit;
                        cnt_hit_w <= cnt_hit_w + 1;
                    end else if((|hit) && read_buf) begin
                        state <= IDLE;
                        w_cm <= 1;
                        o_p_readdata_valid <= 1;
                        cnt_hit_r <= cnt_hit_r + 1;
                        case(write_addr_buf[1:0])
                            2'b00: begin
                                o_p_readdata <= (hit[0]) ? readdata0[31:0] :
                                                (hit[1]) ? readdata1[31:0] :
                                                (hit[2]) ? readdata2[31:0] :
                                                (hit[3]) ? readdata3[31:0] :
                                                (hit[4]) ? readdata4[31:0] :
                                                (hit[5]) ? readdata5[31:0] :
                                                (hit[6]) ? readdata6[31:0] : readdata7[31:0];
                            end
                            2'b01: begin
                                o_p_readdata <= (hit[0]) ? readdata0[63:32] :
                                                (hit[1]) ? readdata1[63:32] :
                                                (hit[2]) ? readdata2[63:32] :
                                                (hit[3]) ? readdata3[63:32] :
                                                (hit[4]) ? readdata4[63:32] :
                                                (hit[5]) ? readdata5[63:32] :
                                                (hit[6]) ? readdata6[63:32] : readdata7[63:32];
                            end
                            2'b10: begin
                                o_p_readdata <= (hit[0]) ? readdata0[95:64] :
                                                (hit[1]) ? readdata1[95:64] :
                                                (hit[2]) ? readdata2[95:64] :
                                                (hit[3]) ? readdata3[95:64] :
                                                (hit[4]) ? readdata4[95:64] :
                                                (hit[5]) ? readdata5[95:64] :
                                                (hit[6]) ? readdata6[95:64] : readdata7[95:64];
                            end
                            2'b11: begin
                                o_p_readdata <= (hit[0]) ? readdata0[127:96] :
                                                (hit[1]) ? readdata1[127:96] :
                                                (hit[2]) ? readdata2[127:96] :
                                                (hit[3]) ? readdata3[127:96] :
                                                (hit[4]) ? readdata4[127:96] :
                                                (hit[5]) ? readdata5[127:96] :
                                                (hit[6]) ? readdata6[127:96] : readdata7[127:96];
                            end
                        endcase
                    end else if(!(&valid)) begin
                        state <= FETCH1;
                        w_cm <= 1;
                        o_m_addr <= {write_addr_buf[24:2], 3'b000};
                        o_m_read <= 1;
                        case(invalid_num)
                            0: fetch_write <= 8'b00000001;
                            1: fetch_write <= 8'b00000010;
                            2: fetch_write <= 8'b00000100;
                            3: fetch_write <= 8'b00001000;
                            4: fetch_write <= 8'b00010000;
                            5: fetch_write <= 8'b00100000;
                            6: fetch_write <= 8'b01000000;
                            7: fetch_write <= 8'b10000000;
                        endcase
                    end else if(miss[replace]) begin
                        state <= FETCH1;
                        w_cm <= 1;
                        o_m_addr <= {write_addr_buf[24:2], 3'b000};
                        o_m_read <= 1;
                        case(replace)
                            0: fetch_write <= 8'b00000001;
                            1: fetch_write <= 8'b00000010;
                            2: fetch_write <= 8'b00000100;
                            3: fetch_write <= 8'b00001000;
                            4: fetch_write <= 8'b00010000;
                            5: fetch_write <= 8'b00100000;
                            6: fetch_write <= 8'b01000000;
                            7: fetch_write <= 8'b10000000;
                        endcase
                    end else begin
                        state <= WB1;
                        w_cm <= 1;
                        case(replace)
                            0: fetch_write <= 8'b00000001;
                            1: fetch_write <= 8'b00000010;
                            2: fetch_write <= 8'b00000100;
                            3: fetch_write <= 8'b00001000;
                            4: fetch_write <= 8'b00010000;
                            5: fetch_write <= 8'b00100000;
                            6: fetch_write <= 8'b01000000;
                            7: fetch_write <= 8'b10000000;
                        endcase
                        if(read_buf) cnt_wb_r <= cnt_wb_r + 1;
                        else if(write_buf) cnt_wb_w <= cnt_wb_w + 1;
                    end
                end
                HIT: begin
                    w_cm <= 0;
                    write_set <= 0;
                    state <= IDLE;
                end
                FETCH1: begin
                    w_cm <= 0;
                    if(!i_m_waitrequest) begin
                        o_m_read <= 0;
                        state <= FETCH2;
                    end
                end
                FETCH2: begin
                    if(i_m_readdata_valid) begin
                        fetch_write <= 0;            //add 3/9
                        if(write_buf) begin
                            state <= FETCH3;
                            write_set <= fetch_write;
		                end else if(read_buf) begin
                            state <= IDLE;
		                    o_p_readdata_valid <= 1;
		                    case(write_addr_buf[1:0])
		                        2'b00: o_p_readdata <= i_m_readdata[ 31: 0];
		                        2'b01: o_p_readdata <= i_m_readdata[ 63:32];
		                        2'b10: o_p_readdata <= i_m_readdata[ 95:64];
		                        2'b11: o_p_readdata <= i_m_readdata[127:96];
		                    endcase
		                end
                    end
                end
                FETCH3: begin
                    state <= IDLE;
                    write_set <= 0;
                end
                WB1: begin
                    w_cm <= 0;
                    o_m_addr <= (fetch_write[0]) ? {wb_addr0, 3'b000} :
                                (fetch_write[1]) ? {wb_addr1, 3'b000} :
                                (fetch_write[2]) ? {wb_addr2, 3'b000} :
                                (fetch_write[3]) ? {wb_addr3, 3'b000} :
                                (fetch_write[4]) ? {wb_addr4, 3'b000} :
                                (fetch_write[5]) ? {wb_addr5, 3'b000} :
                                (fetch_write[6]) ? {wb_addr6, 3'b000} : {wb_addr7, 3'b000};
                    o_m_writedata <= (fetch_write[0]) ? readdata0 :
                                     (fetch_write[1]) ? readdata1 :
                                     (fetch_write[2]) ? readdata2 :
                                     (fetch_write[3]) ? readdata3 :
                                     (fetch_write[4]) ? readdata4 :
                                     (fetch_write[5]) ? readdata5 :
                                     (fetch_write[6]) ? readdata6 : readdata7;
                    o_m_write <= 1;
                    state <= WB2;
                end
                WB2: begin
                    if(!i_m_waitrequest) begin
                        o_m_write <= 0;
                        o_m_addr <= {write_addr_buf[24:2], 3'b000};
                        o_m_read <= 1;
                        state <= FETCH1;
                    end
                end
            endcase // case (state)
        end
    end
endmodule