module input addr is 23bit
    assign byte_en = (|fetch_write) ? 4'b1111 : byte_en_buf;
    assign o_p_waitrequest = (state != IDLE);
    assign o_m_byte_en = 4'b1111;
    assign hit_num = (hit[0]) ? 0 : (hit[1]) ? 1 : (hit[2]) ? 2 : 3;
    assign word_en = (|fetch_write) ? 4'b1111 :
                     (write_addr_buf[1:0] == 2'b00) ? 4'b0001 :
                     (write_addr_buf[1:0] == 2'b01) ? 4'b0010 :
                     (write_addr_buf[1:0] == 2'b10) ? 4'b0100 : 4'b1000;
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
                      write_set <= hit;
                      cnt_hit_w <= cnt_hit_w + 1;
                      w_cm_data <= (r_cm_data[1:0] == hit_num) ? {r_cm_data[1:0], r_cm_data[7:2]} :
                                   (r_cm_data[3:2] == hit_num) ? {r_cm_data[3:2], r_cm_data[7:4], r_cm_data[1:0]} :
                                   (r_cm_data[5:4] == hit_num) ? {r_cm_data[5:4], r_cm_data[7:6], r_cm_data[3:0]} : r_cm_data;
                      w_cm <= 1;
                  end else if((|hit) && read_buf) begin
                      case(write_addr_buf[1:0])
                        2'b00: o_p_readdata <= (hit[0]) ? readdata0[31:0] : (hit[1]) ? readdata1[31:0] : (hit[2]) ? readdata2[31:0] : readdata3[31:0];
                        2'b01: o_p_readdata <= (hit[0]) ? readdata0[63:32] : (hit[1]) ? readdata1[63:32] : (hit[2]) ? readdata2[63:32] : readdata3[63:32];
                        2'b10: o_p_readdata <= (hit[0]) ? readdata0[95:64] : (hit[1]) ? readdata1[95:64] : (hit[2]) ? readdata2[95:64] : readdata3[95:64];
                        2'b11: o_p_readdata <= (hit[0]) ? readdata0[127:96] : (hit[1]) ? readdata1[127:96] : (hit[2]) ? readdata2[127:96] : readdata3[127:96];
                      endcase
                      o_p_readdata_valid <= 1;
                      w_cm_data <= (r_cm_data[1:0] == hit_num) ? {r_cm_data[1:0], r_cm_data[7:2]} :
                                   (r_cm_data[3:2] == hit_num) ? {r_cm_data[3:2], r_cm_data[7:4], r_cm_data[1:0]} :
                                   (r_cm_data[5:4] == hit_num) ? {r_cm_data[5:4], r_cm_data[7:6], r_cm_data[3:0]} : r_cm_data;
                      w_cm <= 1;
                      cnt_hit_r <= cnt_hit_r + 1;
                      state <= IDLE;
                  end else if(!(&valid) || miss[r_cm_data[1:0]]) begin
                      state <= FETCH1;
                      if(!valid[0]) begin
                          fetch_write <= 4'b0001;
                          w_cm_data <= 8'b11100100;
                          w_cm <= 1;
                      end else if(!valid[1]) begin
                          fetch_write <= 4'b0010;
                          w_cm_data <= (r_cm_data[1:0] == 2'b01) ? {r_cm_data[1:0], r_cm_data[7:2]} :
                                       (r_cm_data[3:2] == 2'b01) ? {r_cm_data[3:2], r_cm_data[7:4], r_cm_data[1:0]} :
                                       (r_cm_data[5:4] == 2'b01) ? {r_cm_data[5:4], r_cm_data[7:6], r_cm_data[3:0]} : r_cm_data;
                          w_cm <= 1;
                      end else if(!valid[2]) begin
                          fetch_write <= 4'b0100;
                          w_cm_data <= (r_cm_data[1:0] == 2'b10) ? {r_cm_data[1:0], r_cm_data[7:2]} :
                                       (r_cm_data[3:2] == 2'b10) ? {r_cm_data[3:2], r_cm_data[7:4], r_cm_data[1:0]} :
                                       (r_cm_data[5:4] == 2'b10) ? {r_cm_data[5:4], r_cm_data[7:6], r_cm_data[3:0]} : r_cm_data;
                          w_cm <= 1;
                      end else if(!valid[3]) begin
                          fetch_write <= 4'b1000;
                          w_cm_data <= (r_cm_data[1:0] == 2'b11) ? {r_cm_data[1:0], r_cm_data[7:2]} :
                                       (r_cm_data[3:2] == 2'b11) ? {r_cm_data[3:2], r_cm_data[7:4], r_cm_data[1:0]} :
                                       (r_cm_data[5:4] == 2'b11) ? {r_cm_data[5:4], r_cm_data[7:6], r_cm_data[3:0]} : r_cm_data;
                          w_cm <= 1;
                      end else if(miss[r_cm_data[1:0]]) begin
                          if(r_cm_data[1:0] == 2'b00) fetch_write <= 4'b0001;
                          else if(r_cm_data[1:0] == 2'b01) fetch_write <= 4'b0010;
                          else if(r_cm_data[1:0] == 2'b10) fetch_write <= 4'b0100;
                          else if(r_cm_data[1:0] == 2'b11) fetch_write <= 4'b1000;
                          w_cm_data <= {r_cm_data[1:0], r_cm_data[7:2]};
                          w_cm <= 1;
                      end
                      o_m_addr <= {write_addr_buf[24:2], 3'b000};
                      o_m_read <= 1;
                  end else begin
                      state <= WB1;
                      if(r_cm_data[1:0] == 2'b00) fetch_write <= 4'b0001;
                      else if(r_cm_data[1:0] == 2'b01) fetch_write <= 4'b0010;
                      else if(r_cm_data[1:0] == 2'b10) fetch_write <= 4'b0100;
                      else if(r_cm_data[1:0] == 2'b11) fetch_write <= 4'b1000;
                      w_cm_data <= {r_cm_data[1:0], r_cm_data[7:2]};
                      w_cm <= 1;
                      if(read_buf) cnt_wb_r <= cnt_wb_r + 1;
                      else if(write_buf) cnt_wb_w <= cnt_wb_w + 1;
                  end
              end
              HIT: begin
                  w_cm <= 0;
                  write_set <= 0;
                  state <= IDLE;
              end //1/13
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
                              (fetch_write[2]) ? {wb_addr2, 3'b000} : {wb_addr3, 3'b000};
                  o_m_writedata <= (fetch_write[0]) ? readdata0 :
                                   (fetch_write[1]) ? readdata1 :
                                   (fetch_write[2]) ? readdata2 : readdata3;
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