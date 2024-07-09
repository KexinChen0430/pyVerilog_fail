module will only write to 64 bit registers.
   ucb_bus_in #(IOB_UCB_WIDTH,64) ucb_bus_in (.rst_l(rst_l),
					      .clk(clk),
					      .vld(iob_ucb_vld),
					      .data(iob_ucb_data),
					      .stall(ucb_iob_stall),
					      .indata_buf_vld(indata_buf_vld),
					      .indata_buf(indata_buf),
					      .stall_a1(ucb_iob_stall_a1));
   /************************************************************
   assign 	 read_pending = (indata_buf[`UCB_PKT_HI:`UCB_PKT_LO] ==
				 `UCB_READ_REQ) &
			        indata_buf_vld;
   // Assertion: rd_req_vld and ack_buf_rd must be
   //            mutually exclusive
   assign 	 read_outstanding_next = rd_req_vld ? 1'b1 :
	                                 ack_buf_rd ? 1'b0 :
	                                              read_outstanding;
   dffrl_ns #(1) read_outstanding_ff (.din(read_outstanding_next),
				      .clk(clk),
				      .rst_l(rst_l),
				      .q(read_outstanding));
   assign 	 ucb_iob_stall_a1 = read_pending & read_outstanding;
   assign 	 write_pending = (indata_buf[`UCB_PKT_HI:`UCB_PKT_LO] ==
				  `UCB_WRITE_REQ) &
        	                 indata_buf_vld;
   // 3'b011 is the encoding for double word.  All writes have to be
   // 64 bits except writes going to PCI.  PCI will instantiate a
   // customized version of UCB.
   assign 	 illegal_write_size = (indata_buf[`UCB_SIZE_HI:`UCB_SIZE_LO] !=
				       3'b011);
   /************************************************************
   assign 	 rd_req_vld = read_pending & ~read_outstanding;
   assign 	 wr_req_vld = write_pending & ~illegal_write_size;
   assign 	 thr_id_in = indata_buf[`UCB_THR_HI:`UCB_THR_LO];
   assign 	 buf_id_in = indata_buf[`UCB_BUF_HI:`UCB_BUF_LO];
   assign 	 size_in = indata_buf[`UCB_SIZE_HI:`UCB_SIZE_LO];
   assign 	 addr_in = indata_buf[`UCB_ADDR_HI:`UCB_ADDR_LO];
   assign 	 data_in = indata_buf[`UCB_DATA_HI:`UCB_DATA_LO];
   /************************************************************
   assign 	 ack_buf_wr = rd_ack_vld | rd_nack_vld;
   assign 	 ack_buf_vld_next = ack_buf_wr ? 1'b1 :
		                    ack_buf_rd ? 1'b0 :
		                                 ack_buf_vld;
   dffrl_ns #(1) ack_buf_vld_ff (.din(ack_buf_vld_next),
				 .clk(clk),
				 .rst_l(rst_l),
				 .q(ack_buf_vld));
   dffe_ns #(1) ack_buf_is_nack_ff (.din(rd_nack_vld),
				    .en(ack_buf_wr),
				    .clk(clk),
				    .q(ack_buf_is_nack));
   dffe_ns #(1) ack_buf_is_data128_ff (.din(data128),
				       .en(ack_buf_wr),
				       .clk(clk),
				       .q(ack_buf_is_data128));
   assign 	 ack_typ_out = rd_ack_vld ? `UCB_READ_ACK:
	                                    `UCB_READ_NACK;
   assign 	 ack_buf_in = {data_out,
			       buf_id_out,
			       thr_id_out,
			       ack_typ_out};
   dffe_ns #(REG_WIDTH+`UCB_BUF_HI-`UCB_PKT_LO+1) ack_buf_ff (.din(ack_buf_in),
							      .en(ack_buf_wr),
							      .clk(clk),
							      .q(ack_buf));
   assign        ack_buf_vec = ack_buf_is_nack    ? {{REG_WIDTH/UCB_IOB_WIDTH{1'b0}},
                                                     {64/UCB_IOB_WIDTH{1'b1}}} :
                               ack_buf_is_data128 ? {(REG_WIDTH+64)/UCB_IOB_WIDTH{1'b1}} :
                                                    {(64+64)/UCB_IOB_WIDTH{1'b1}};
   /************************************************************
   // Assertion: int_buf_wr shoudn't be asserted if int_buf_busy
   assign 	 int_buf_wr = int_vld;
   assign 	 int_buf_vld_next = int_buf_wr ? 1'b1 :
		                    int_buf_rd ? 1'b0 :
		                                 int_buf_vld;
   dffrl_ns #(1) int_buf_vld_ff (.din(int_buf_vld_next),
				 .clk(clk),
				 .rst_l(rst_l),
				 .q(int_buf_vld));
   assign 	 int_buf_in = {int_vec,
			       int_stat,
			       dev_id,
			       int_thr_id,
			       int_typ};
   dffe_ns #(`UCB_INT_VEC_HI-`UCB_PKT_LO+1) int_buf_ff (.din(int_buf_in),
							.en(int_buf_wr),
							.clk(clk),
							.q(int_buf));
   assign 	 int_buf_vec = {{REG_WIDTH/UCB_IOB_WIDTH{1'b0}},
                                {64/UCB_IOB_WIDTH{1'b1}}};
   assign 	 int_busy = int_buf_vld;
   /************************************************************
   dffrle_ns #(1) int_last_rd_ff (.din(int_buf_rd),
				  .en(ack_buf_rd|int_buf_rd),
				  .rst_l(rst_l),
				  .clk(clk),
				  .q(int_last_rd));
   assign 	 ack_buf_rd = ~outdata_buf_busy & ack_buf_vld &
		              (~int_buf_vld | int_last_rd);
   assign 	 int_buf_rd = ~outdata_buf_busy & int_buf_vld &
		              (~ack_buf_vld | ~int_last_rd);
   assign 	 outdata_buf_wr = ack_buf_rd | int_buf_rd;
   assign 	 outdata_buf_in = ack_buf_rd ? {ack_buf[REG_WIDTH+`UCB_BUF_HI:`UCB_BUF_HI+1],
						{(`UCB_RSV_HI-`UCB_RSV_LO+1){1'b0}},
						{(`UCB_ADDR_HI-`UCB_ADDR_LO+1){1'b0}},
						{(`UCB_SIZE_HI-`UCB_SIZE_LO+1){1'b0}},
						ack_buf[`UCB_BUF_HI:`UCB_BUF_LO],
						ack_buf[`UCB_THR_HI:`UCB_THR_LO],
						ack_buf[`UCB_PKT_HI:`UCB_PKT_LO]}:
		                               {{REG_WIDTH{1'b0}},
						{(`UCB_INT_RSV_HI-`UCB_INT_RSV_LO+1){1'b0}},
						int_buf[`UCB_INT_VEC_HI:`UCB_INT_VEC_LO],
						int_buf[`UCB_INT_STAT_HI:`UCB_INT_STAT_LO],
						int_buf[`UCB_INT_DEV_HI:`UCB_INT_DEV_LO],
						int_buf[`UCB_THR_HI:`UCB_THR_LO],
						int_buf[`UCB_PKT_HI:`UCB_PKT_LO]};
   assign 	 outdata_vec_in = ack_buf_rd ? ack_buf_vec :
	                                       int_buf_vec;
   ucb_bus_out #(UCB_IOB_WIDTH, REG_WIDTH) ucb_bus_out (.rst_l(rst_l),
							.clk(clk),
							.outdata_buf_wr(outdata_buf_wr),
							.outdata_buf_in(outdata_buf_in),
							.outdata_vec_in(outdata_vec_in),
							.outdata_buf_busy(outdata_buf_busy),
							.vld(ucb_iob_vld),
							.data(ucb_iob_data),
							.stall(iob_ucb_stall));
endmodule