module
   input          etx_ack;
   //regs
   reg            ready;
   reg 		  etx_write;
   reg [1:0] 	  etx_datamode;
   reg [3:0] 	  etx_ctrlmode;
   reg [31:0] 	  etx_dstaddr;
   reg [31:0] 	  etx_srcaddr;
   reg [31:0] 	  etx_data;
   //wires
   wire 	  rr_ready;
   wire 	  rq_ready;
   wire 	  wr_ready;
   wire           emrr_rd_en;
   wire 	  emwr_rd_en;
   //############
   //# Arbitrate & forward
   //############
   // priority-based ready signals
   assign     wr_ready = emwr_fifo_access & ~etx_wr_wait;                        //highest
   assign     rq_ready = emrq_fifo_access & ~etx_rd_wait & ~wr_ready;
   assign     rr_ready = emrr_fifo_access & ~etx_wr_wait & ~wr_ready & ~rq_ready;//lowest
   // FIFO read enables, when we're idle or done with the current datum
   assign     emrr_rd_en = rr_ready & (~ready | etx_ack);
   assign     emrq_rd_en = rq_ready & (~ready | etx_ack);
   assign     emwr_rd_en = wr_ready & (~ready | etx_ack);
   always @ (posedge tx_lclk_par)
      if( reset )
	begin
           ready             <= 1'b0;
	   etx_write         <= 1'b0;
	   etx_datamode[1:0] <= 2'b0;
	   etx_ctrlmode[3:0] <= 4'b0;
	   etx_dstaddr[31:0] <= 32'b0;
	   etx_data[31:0]    <= 32'b0;
	   etx_srcaddr[31:0] <= 32'b0;
	end
      else if (emrr_rd_en | emrq_rd_en | emwr_rd_en )
	begin
	   ready <= 1'b1;
	   etx_write  <= emrr_rd_en ? 1'b1 :
			 emrq_rd_en ? 1'b0 :
			              1'b1;
	   etx_datamode[1:0] <= emrr_rd_en ? emrr_fifo_datamode[1:0] :
				emrq_rd_en ? emrq_fifo_datamode[1:0] :
			        emwr_fifo_datamode[1:0];
	   etx_ctrlmode[3:0] <= emrr_rd_en ? emrr_fifo_ctrlmode[3:0] :
				emrq_rd_en ? emrq_fifo_ctrlmode[3:0] :
			        emwr_fifo_ctrlmode[3:0];
	   etx_dstaddr[31:0] <= emrr_rd_en ? emrr_fifo_dstaddr[31:0] :
				emrq_rd_en ? emrq_fifo_dstaddr[31:0] :
			        emwr_fifo_dstaddr[31:0];
	   etx_data[31:0] <= emrr_rd_en ? emrr_fifo_data[31:0] :
			     emrq_rd_en ? emrq_fifo_data[31:0] :
			     emwr_fifo_data[31:0];
	   etx_srcaddr[31:0] <= emrr_rd_en ? emrr_fifo_srcaddr[31:0] :
				emrq_rd_en ? emrq_fifo_srcaddr[31:0] :
				emwr_fifo_srcaddr[31:0];
	end
      else if (etx_ack)
	begin
	   ready <= 1'b0;
	end
   assign etx_access = ready;
endmodule