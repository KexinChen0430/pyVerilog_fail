module decision
   #(
      parameter DATA_WIDTH = 64,
      parameter DATA_WIDTH_TCAM = 1,
      parameter CTRL_WIDTH = DATA_WIDTH/8,
      parameter UDP_REG_SRC_WIDTH = 2
   )
   (
   // Interfaz con los sub-modulos TCAM y con Input Arbiter
      input  [DATA_WIDTH-1:0]      in_data,
      input  [CTRL_WIDTH-1:0]       in_ctrl,
      input                                      in_wr,
      output                                    in_rdy,
      input  			                  in_data_usr,
     // input				  in_ctrl_rtcam_usr,
      input				        in_wr_usr,
      output				        in_rdy_usr,
      input  			                in_data_bl,
     // input				  in_ctrl_rtcam_bl,
      input				        in_wr_bl,
      output				        in_rdy_bl,
   // Interfaz con OUTPUT PORT LOOKUP
      output [DATA_WIDTH-1:0]   out_data,
      output [CTRL_WIDTH-1:0]    out_ctrl,
      output                                  out_wr,
      input                                    out_rdy,
      input                               reg_req_in,
      input                               reg_ack_in,
      input                               reg_rd_wr_L_in,
      input  [`UDP_REG_ADDR_WIDTH-1:0]    reg_addr_in,
      input  [`CPCI_NF2_DATA_WIDTH-1:0]   reg_data_in,
      input  [UDP_REG_SRC_WIDTH-1:0]      reg_src_in,
      output                              reg_req_out,
      output                              reg_ack_out,
      output                              reg_rd_wr_L_out,
      output  [`UDP_REG_ADDR_WIDTH-1:0]   reg_addr_out,
      output  [`CPCI_NF2_DATA_WIDTH-1:0]  reg_data_out,
      output  [UDP_REG_SRC_WIDTH-1:0]     reg_src_out,
      // misc
      input                                reset,
      input                                clk
   );
   // Define the log2 function
   `LOG2_FUNC
   wire [DATA_WIDTH-1:0]         in_fifo_data;
   wire [CTRL_WIDTH-1:0]         in_fifo_ctrl;
   wire                          in_fifo_nearly_full;
   wire                          in_fifo_empty;
   reg                           in_fifo_rd_en;
   reg                           out_wr_int;
   wire				 in_fifo_data_usr;
   wire				 in_fifo_rd_en_usr;
   wire				 in_fifo_nearly_full_usr;
   wire				 in_fifo_empty_usr;
   reg				 in_fifo_rd_en_usr;
   reg				 out_wr_int_usr;
   wire				 in_fifo_data_bl;
   wire				 in_fifo_rd_en_bl;
   wire				 in_fifo_nearly_full_bl;
   wire				 in_fifo_empty_bl;
   reg				 in_fifo_rd_en_bl;
   reg				 out_wr_int_bl;
   assign in_rdy     = !in_fifo_nearly_full;
   assign out_wr     = out_wr_int;
   assign out_data   = in_fifo_data;
   assign out_ctrl   = in_fifo_ctrl;
   assing in_rdy_usr = !in_fifo_nearly_full_usr;
   assing out_wr_usr = out_wr_int_usr;
   assign out_data_usr   = in_fifo_data_usr;
   assing in_rdy_bl  = !in_fifo_nearly_full_bl;
   assing out_wr_usr = out_wr_int_bl;
   assign out_data_usr   = in_fifo_data_bl;
// Buffer para los paquetes
   fallthrough_small_fifo #(
      .WIDTH(CTRL_WIDTH+DATA_WIDTH),
      .MAX_DEPTH_BITS(4)
   ) input_fifo (
      .din                      ({in_ctrl, in_data}),   // Data in
      .wr_en                  (in_wr),                // Write enable
      .rd_en                  (in_fifo_rd_en),        // Read the next word
      .dout                    ({in_fifo_ctrl, in_fifo_data}),
      .full                      (),
      .nearly_full           (in_fifo_nearly_full),
      .prog_full             (),
      .empty                 (in_fifo_empty),
      .reset                   (reset),
      .clk                      (clk)
   );
// Buffer para resultados TCAM_USR
  small_fifo #(
  	.WIDTH(DATA_WIDTH_TCAM),
  	.MAX_DEPTH_BITS(4)
   ) tcam_usr_input_fifo (
      	.din		        (in_data_rtcam_usr),		// Data in
        .wr_en		(in_wr_rtcam_usr),			// Write enable
        .rd_en		(in_fifo_rd_en_usr),       		// Read the next word
        .dout		        (in_fifo_data_usr),
        .full 		        (),
        .prog_full	        (),
        .nearly_full	        (in_fifo_nearly_full_usr),
        .empty 		(in_fifo_empty_usr),
        .reset 		(reset),
        .clk 		        (clk)
    );
// Buffer para resultados TCAM_BL
  small_fifo #(
  	.WIDTH(DATA_WIDTH_TCAM),
  	.MAX_DEPTH_BITS(4)
   ) tcam_bl_input_fifo (
      	.din		        (in_data_rtcam_bl),		// Data in
        .wr_en		(in_wr_rtcam_bl),			// Write enable
        .rd_en		(in_fifo_rd_en_bl),       		// Read the next word
        .dout		        (in_fifo_data_bl),
        .full 		        (),
        .prog_full	        (),
        .nearly_full	        (in_fifo_nearly_full_bl),
        .empty 		(in_fifo_empty_bl),
        .reset 		(reset),
        .clk 		        (clk)
    );
// Registros genericos
   generic_regs
   #(
      .UDP_REG_SRC_WIDTH        (UDP_REG_SRC_WIDTH),
      .TAG                                   (0),                 // Tag -- eg. MODULE_TAG
      .REG_ADDR_WIDTH             (1),                 // Width of block addresses
      .NUM_COUNTERS                (0),                 // Number of counters
      .NUM_SOFTWARE_REGS       (0),                 // Number of sw regs
      .NUM_HARDWARE_REGS      (0)                  // Number of hw regs
   ) module_regs (
      .reg_req_in       (reg_req_in),
      .reg_ack_in       (reg_ack_in),
      .reg_rd_wr_L_in   (reg_rd_wr_L_in),
      .reg_addr_in      (reg_addr_in),
      .reg_data_in      (reg_data_in),
      .reg_src_in       (reg_src_in),
      .reg_req_out      (reg_req_out),
      .reg_ack_out      (reg_ack_out),
      .reg_rd_wr_L_out  (reg_rd_wr_L_out),
      .reg_addr_out     (reg_addr_out),
      .reg_data_out     (reg_data_out),
      .reg_src_out      (reg_src_out),
      .counter_updates  (),
      .counter_decrement(),
      .software_regs    (),
      .hardware_regs    (),
      .clk              (clk),
      .reset            (reset)
    );
   always @(*) begin
      // Default values
      out_wr_int = 0;
      in_fifo_rd_en = 0;
      if (!in_fifo_empty && out_rdy) begin
         out_wr_int = 1;
         in_fifo_rd_en = 1;
      end
   end
endmodule