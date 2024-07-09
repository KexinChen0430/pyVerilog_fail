module iobdg_jbus_mondo_buf (/*AUTOARG*/
   // Outputs
   mondo_vld, mondo_data0, mondo_data1, mondo_target, mondo_source,
   // Inputs
   rst_l, clk, jbi_iob_vld, jbi_iob_data, rd_mondo_buf
   );
// Signal declarations
   // Global interface
   input                                 rst_l;
   input 				 clk;
   // JBI interface
   input 				 jbi_iob_vld;
   input [`JBI_IOB_MONDO_BUS_WIDTH-1:0]  jbi_iob_data;
   // Local interface
   output 				 mondo_vld;
   output [63:0] 			 mondo_data0;
   output [63:0] 			 mondo_data1;
   output [`JBI_IOB_MONDO_TRG_WIDTH-1:0] mondo_target;
   output [`JBI_IOB_MONDO_SRC_WIDTH-1:0] mondo_source;
   input 				 rd_mondo_buf;
   // Internal signals
   wire [`JBI_IOB_MONDO_BUS_CYCLE-1:0] 	 vldreg_next;
   wire [`JBI_IOB_MONDO_BUS_CYCLE-1:0] 	 vldreg;
   wire [`JBI_IOB_MONDO_BUS_WIDTH*`JBI_IOB_MONDO_BUS_CYCLE-1:0] datareg_next;
   wire [`JBI_IOB_MONDO_BUS_WIDTH*`JBI_IOB_MONDO_BUS_CYCLE-1:0] datareg;
   wire 				 shift_en;
// Code starts here
   /************************************************************
   assign 	 vldreg_next = {vldreg[`JBI_IOB_MONDO_BUS_CYCLE-2:0],jbi_iob_vld};
   dffrle_ns #(`JBI_IOB_MONDO_BUS_CYCLE) vldreg_ff (.din(vldreg_next),
						    .rst_l(rst_l),
						    .en(shift_en),
						    .clk(clk),
						    .q(vldreg));
   assign 	 datareg_next = {datareg[`JBI_IOB_MONDO_BUS_WIDTH*(`JBI_IOB_MONDO_BUS_CYCLE-1)-1:0],
				 jbi_iob_data};
   dffrle_ns #(`JBI_IOB_MONDO_BUS_WIDTH*`JBI_IOB_MONDO_BUS_CYCLE) datareg_ff (.din(datareg_next),
									      .en(shift_en),
									      .clk(clk),
									      .rst_l(rst_l),
									      .q(datareg));
   assign 	 shift_en = ~&vldreg | rd_mondo_buf;
   /************************************************************
   assign 	 mondo_vld = &vldreg;
   assign 	 mondo_target = datareg[`JBI_IOB_MONDO_TRG_HI+128:`JBI_IOB_MONDO_TRG_LO+128];
   assign 	 mondo_source = datareg[`JBI_IOB_MONDO_SRC_HI+128:`JBI_IOB_MONDO_SRC_LO+128];
   assign 	 mondo_data0 = datareg[127:64];
   assign 	 mondo_data1 = datareg[63:0];
endmodule