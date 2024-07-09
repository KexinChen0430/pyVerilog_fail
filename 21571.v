module. This can happen");
               $display("if two modules have aliased register addresses.");
               $stop;
            end
            // synthesis translate_on
            /********************************************************************
             */
            reg_ack_out        <= reg_rd_req_good_d1 || reg_wr_req_good_d1 || reg_ack_in_d1;
            reg_data_out       <= reg_rd_req_good_d1 ? reg_file_out : reg_data_in_d1;
            reg_addr_out       <= reg_addr_in_d1;
            reg_req_out        <= reg_req_in_d1;
            reg_rd_wr_L_out    <= reg_rd_wr_L_in_d1;
            reg_src_out        <= reg_src_in_d1;
            /*******************************************************************
             */
            for (i = REG_START_ADDR; i < REG_END_ADDR; i = i + 1) begin
               // if we just update the register corresponding to this delta then
               // clear it.
               if ((i==reg_cnt_d1)           // this delta was committed to reg_file
                   && !reg_wr_req_good_d1    // we didn't write in this cycle
                   && !(reg_rd_req_good_d1 && RESET_ON_READ) // we didn't read and reset
                   ) begin
                  deltas[i] <= decrement[i] ? -update[i] : update[i];
               end
               else begin
                  deltas[i] <= decrement[i] ? deltas[i] - update[i] : deltas[i] + update[i];
               end
            end // for (i = REG_START_ADDR; i < REG_END_ADDR; i = i + 1)
         end // else: !if(state == RESET)
      end // else: !if(reset)
   end // always @ (posedge clk)
endmodule