module nf2_dma
  #(parameter NUM_CPU_QUEUES = 4,
    parameter PKT_LEN_CNT_WIDTH = 11,
    parameter DMA_DATA_WIDTH = 32,
    parameter DMA_CTRL_WIDTH=DMA_DATA_WIDTH/8,
    parameter USER_DATA_PATH_WIDTH=64,
    parameter CPCI_NF2_DATA_WIDTH = 32
    )
    (
     input [NUM_CPU_QUEUES-1:0] cpu_q_dma_pkt_avail,
     output cpu_q_dma_rd_0,
     input [DMA_DATA_WIDTH-1:0] cpu_q_dma_rd_data_0,
     input [DMA_CTRL_WIDTH-1:0] cpu_q_dma_rd_ctrl_0,
     output cpu_q_dma_rd_1,
     input [DMA_DATA_WIDTH-1:0] cpu_q_dma_rd_data_1,
     input [DMA_CTRL_WIDTH-1:0] cpu_q_dma_rd_ctrl_1,
     output cpu_q_dma_rd_2,
     input [DMA_DATA_WIDTH-1:0] cpu_q_dma_rd_data_2,
     input [DMA_CTRL_WIDTH-1:0] cpu_q_dma_rd_ctrl_2,
     output cpu_q_dma_rd_3,
     input [DMA_DATA_WIDTH-1:0] cpu_q_dma_rd_data_3,
     input [DMA_CTRL_WIDTH-1:0] cpu_q_dma_rd_ctrl_3,
     // signals to/from CPU tx queues
     input [NUM_CPU_QUEUES-1:0] cpu_q_dma_nearly_full,
     // signals to/from CPU tx queue 0
     output cpu_q_dma_wr_0,
     output [DMA_DATA_WIDTH-1:0] cpu_q_dma_wr_data_0,
     output [DMA_CTRL_WIDTH-1:0] cpu_q_dma_wr_ctrl_0,
     // signals to/from CPU tx queue 1
     output cpu_q_dma_wr_1,
     output [DMA_DATA_WIDTH-1:0] cpu_q_dma_wr_data_1,
     output [DMA_CTRL_WIDTH-1:0] cpu_q_dma_wr_ctrl_1,
     // signals to/from CPU tx queue 2
     output cpu_q_dma_wr_2,
     output [DMA_DATA_WIDTH-1:0] cpu_q_dma_wr_data_2,
     output [DMA_CTRL_WIDTH-1:0] cpu_q_dma_wr_ctrl_2,
     // signals to/from CPU tx queue 3
     output cpu_q_dma_wr_3,
     output [DMA_DATA_WIDTH-1:0] cpu_q_dma_wr_data_3,
     output [DMA_CTRL_WIDTH-1:0] cpu_q_dma_wr_ctrl_3,
     input [1:0] dma_op_code_req,
     input [3:0] dma_op_queue_id,
     output [1:0] dma_op_code_ack,
     // DMA TX data and flow control
     input dma_vld_c2n,
     input [DMA_DATA_WIDTH-1:0] dma_data_c2n,
     output dma_dest_q_nearly_full_n2c,
     // DMA RX data and flow control
     output dma_vld_n2c,
     output [DMA_DATA_WIDTH-1:0] dma_data_n2c,
     input dma_dest_q_nearly_full_c2n,
     // enable to drive tri-state bus
     output dma_data_tri_en,
     input dma_reg_req,
     input [`DMA_REG_ADDR_WIDTH -1:0] dma_reg_addr,
     input [CPCI_NF2_DATA_WIDTH -1:0] dma_reg_wr_data,
     input dma_reg_rd_wr_L,
     output reg [CPCI_NF2_DATA_WIDTH -1:0] dma_reg_rd_data,
     output reg dma_reg_ack,
     input  reset,
     input  clk,
     input  cpci_clk
     );
   // synchronization for reset
   reg cpci_reset, cpci_sync_reset;
   always @(posedge cpci_clk) begin
      cpci_sync_reset <= reset;
      cpci_reset <= cpci_sync_reset;
   end
   //wires from nf2_dma_bus_fsm
   wire [DMA_DATA_WIDTH +3:0] txfifo_wr_data;
   //wires from nf2_dma_sync
   wire [NUM_CPU_QUEUES-1:0] cpci_cpu_q_dma_pkt_avail;
   wire [NUM_CPU_QUEUES-1:0] cpci_cpu_q_dma_nearly_full;
   wire [DMA_DATA_WIDTH +2:0] cpci_rxfifo_rd_data;
   wire [DMA_DATA_WIDTH +3:0] sys_txfifo_rd_data;
   //wires from nf2_dma_que_intfc
   wire [DMA_DATA_WIDTH +2:0] rxfifo_wr_data;
   // register block
   initial
   begin
      dma_reg_rd_data = 'h0;
      dma_reg_ack = 'h0;
   end
   // Instantiations
   nf2_dma_bus_fsm
     #(.DMA_DATA_WIDTH(DMA_DATA_WIDTH),
       .NUM_CPU_QUEUES(NUM_CPU_QUEUES),
       .PKT_LEN_CNT_WIDTH(PKT_LEN_CNT_WIDTH)) nf2_dma_bus_fsm
       (
	// -- signals to cpci pins
	//inputs:
	.dma_op_code_req ( dma_op_code_req ),//[1:0]
	.dma_op_queue_id ( dma_op_queue_id ),//[3:0]
	.dma_op_code_ack ( dma_op_code_ack ),//[1:0]
	.dma_vld_c2n ( dma_vld_c2n ),
	.dma_data_c2n ( dma_data_c2n ),//[DMA_DATA_WIDTH-1:0]
	//outputs:
	.dma_dest_q_nearly_full_n2c ( dma_dest_q_nearly_full_n2c ),
	.dma_vld_n2c ( dma_vld_n2c ),
	.dma_data_n2c ( dma_data_n2c ),//[DMA_DATA_WIDTH-1:0]
	//inputs:
	.dma_dest_q_nearly_full_c2n ( dma_dest_q_nearly_full_c2n ),
	//outputs:
	.dma_data_tri_en ( dma_data_tri_en ),
	// -- signals from/to NetFPGA core logic
	// through async fifo
	//inputs:
	.cpu_q_dma_pkt_avail ( cpci_cpu_q_dma_pkt_avail ),//[NUM_CPU_QUEUES-1:0]
	.cpu_q_dma_nearly_full ( cpci_cpu_q_dma_nearly_full ),//[NUM_CPU_QUEUES-1:0]
	// -- signals to cpu queues
	//inputs:
	.txfifo_full ( cpci_txfifo_full ),
	.txfifo_nearly_full ( cpci_txfifo_nearly_full ),
	//outputs:
	.txfifo_wr ( txfifo_wr ),
	.txfifo_wr_data ( txfifo_wr_data ), //[DMA_DATA_WIDTH +3:0]
	//inputs:
	.rxfifo_empty ( cpci_rxfifo_empty ),
	.rxfifo_rd_data ( cpci_rxfifo_rd_data ), //[DMA_DATA_WIDTH +2:0]
	//outputs:
	.rxfifo_rd_inc ( rxfifo_rd_inc ),
	// --- enable_dma
	//inputs:
	.enable_dma (1'b 1),
	// -- misc
	.cpci_clk ( cpci_clk ),
	.cpci_reset ( cpci_reset )
	);
   // synthesis attribute keep_hierarchy of nf2_dma_bus_fsm is false;
   nf2_dma_sync
     #(.DMA_DATA_WIDTH (DMA_DATA_WIDTH),
       .NUM_CPU_QUEUES (NUM_CPU_QUEUES)) nf2_dma_sync
       (
	// -- signals from/to bus FSM
	//outputs:
	.cpci_cpu_q_dma_pkt_avail ( cpci_cpu_q_dma_pkt_avail ),//[NUM_CPU_QUEUES-1:0]
	.cpci_cpu_q_dma_nearly_full ( cpci_cpu_q_dma_nearly_full ),//[NUM_CPU_QUEUES-1:0]
	.cpci_txfifo_full ( cpci_txfifo_full ),
	.cpci_txfifo_nearly_full ( cpci_txfifo_nearly_full ),
	//inputs:
	.cpci_txfifo_wr ( txfifo_wr ),
	.cpci_txfifo_wr_data ( txfifo_wr_data ), //[DMA_DATA_WIDTH +3:0]
	//outputs:
	.cpci_rxfifo_empty ( cpci_rxfifo_empty ),
	.cpci_rxfifo_rd_data ( cpci_rxfifo_rd_data ), //[DMA_DATA_WIDTH +2:0]
	//inputs:
	.cpci_rxfifo_rd_inc ( rxfifo_rd_inc ),
	// --- signals from/to NetFPGA core logic
	//inputs:
	.sys_cpu_q_dma_pkt_avail ( cpu_q_dma_pkt_avail ),//[NUM_CPU_QUEUES-1:0]
	.sys_cpu_q_dma_nearly_full ( cpu_q_dma_nearly_full ),//[NUM_CPU_QUEUES-1:0]
	//outputs:
	.sys_txfifo_empty ( sys_txfifo_empty ),
	.sys_txfifo_rd_data ( sys_txfifo_rd_data ),//[DMA_DATA_WIDTH +3:0]
	//inputs:
	.sys_txfifo_rd_inc ( txfifo_rd_inc ),
	//outputs:
	.sys_rxfifo_full ( sys_rxfifo_full ),
	.sys_rxfifo_nearly_full ( sys_rxfifo_nearly_full ),
	//inputs:
	.sys_rxfifo_wr ( rxfifo_wr ),
	.sys_rxfifo_wr_data ( rxfifo_wr_data ),//[DMA_DATA_WIDTH +2:0]
	//clks and resets
	.cpci_clk ( cpci_clk ),
	.cpci_reset ( cpci_reset ),
	.sys_clk ( clk ),
	.sys_reset ( reset )
	);
   nf2_dma_que_intfc
  #(.NUM_CPU_QUEUES(NUM_CPU_QUEUES),
    .DMA_DATA_WIDTH(DMA_DATA_WIDTH),
    .DMA_CTRL_WIDTH(DMA_CTRL_WIDTH),
    .USER_DATA_PATH_WIDTH(USER_DATA_PATH_WIDTH),
    .CPCI_NF2_DATA_WIDTH(CPCI_NF2_DATA_WIDTH)
    ) nf2_dma_que_intfc
   (
    //output:
    .cpu_q_dma_rd_0 ( cpu_q_dma_rd_0 ),
    //input:
    .cpu_q_dma_rd_data_0 ( cpu_q_dma_rd_data_0 ), //[DMA_DATA_WIDTH-1:0]
    .cpu_q_dma_rd_ctrl_0 ( cpu_q_dma_rd_ctrl_0 ),//[DMA_CTRL_WIDTH-1:0]
    //output:
    .cpu_q_dma_rd_1 ( cpu_q_dma_rd_1 ),
    //input:
    .cpu_q_dma_rd_data_1 ( cpu_q_dma_rd_data_1 ), //[DMA_DATA_WIDTH-1:0]
    .cpu_q_dma_rd_ctrl_1 ( cpu_q_dma_rd_ctrl_1 ),//[DMA_CTRL_WIDTH-1:0]
    //output:
    .cpu_q_dma_rd_2 ( cpu_q_dma_rd_2 ),
    //input:
    .cpu_q_dma_rd_data_2 ( cpu_q_dma_rd_data_2 ), //[DMA_DATA_WIDTH-1:0]
    .cpu_q_dma_rd_ctrl_2 ( cpu_q_dma_rd_ctrl_2 ),//[DMA_CTRL_WIDTH-1:0]
    //output:
    .cpu_q_dma_rd_3 ( cpu_q_dma_rd_3 ),
    //input:
    .cpu_q_dma_rd_data_3 ( cpu_q_dma_rd_data_3 ), //[DMA_DATA_WIDTH-1:0]
    .cpu_q_dma_rd_ctrl_3 ( cpu_q_dma_rd_ctrl_3 ),//[DMA_CTRL_WIDTH-1:0]
    // signals to/from CPU tx queues
    //input:
    .cpu_q_dma_nearly_full ( cpu_q_dma_nearly_full ),//[NUM_CPU_QUEUES-1:0]
    // signals to/from CPU tx queue 0
    //output:
    .cpu_q_dma_wr_0 ( cpu_q_dma_wr_0 ),
    .cpu_q_dma_wr_data_0 ( cpu_q_dma_wr_data_0 ), //[DMA_DATA_WIDTH-1:0]
    .cpu_q_dma_wr_ctrl_0 ( cpu_q_dma_wr_ctrl_0 ),//[DMA_CTRL_WIDTH-1:0]
    // signals to/from CPU tx queue 1
    //output:
    .cpu_q_dma_wr_1 ( cpu_q_dma_wr_1 ),
    .cpu_q_dma_wr_data_1 ( cpu_q_dma_wr_data_1 ), //[DMA_DATA_WIDTH-1:0]
    .cpu_q_dma_wr_ctrl_1 ( cpu_q_dma_wr_ctrl_1 ), //[DMA_CTRL_WIDTH-1:0]
    // signals to/from CPU tx queue 2
    //output
    .cpu_q_dma_wr_2 ( cpu_q_dma_wr_2 ),
    .cpu_q_dma_wr_data_2 ( cpu_q_dma_wr_data_2 ), //[DMA_DATA_WIDTH-1:0]
    .cpu_q_dma_wr_ctrl_2 ( cpu_q_dma_wr_ctrl_2 ),//[DMA_CTRL_WIDTH-1:0]
    // signals to/from CPU tx queue 3
    //output:
    .cpu_q_dma_wr_3 ( cpu_q_dma_wr_3 ),
    .cpu_q_dma_wr_data_3 ( cpu_q_dma_wr_data_3 ), //[DMA_DATA_WIDTH-1:0]
    .cpu_q_dma_wr_ctrl_3 ( cpu_q_dma_wr_ctrl_3 ),//[DMA_CTRL_WIDTH-1:0]
    //input:
    .txfifo_empty ( sys_txfifo_empty ),
    .txfifo_rd_data ( sys_txfifo_rd_data ),//[DMA_DATA_WIDTH +3:0]
    //output:
    .txfifo_rd_inc ( txfifo_rd_inc ),
    //input:
    .rxfifo_full ( sys_rxfifo_full ),
    .rxfifo_nearly_full ( sys_rxfifo_nearly_full ),
    //output:
    .rxfifo_wr ( rxfifo_wr ),
    .rxfifo_wr_data ( rxfifo_wr_data ),//[DMA_DATA_WIDTH +2:0]
    //input:
    .enable_dma ( 1'b 1 ),
    .reset ( reset ),
    .clk ( clk )
    );
endmodule