module outputs)
wire [15:0]             SP_out;                 // From alu of alu.v
wire [7:0]              alu_control;            // From decoder of decoder.v
wire [3:0]              condition;              // From decoder of decoder.v
wire [`CONTROL_BIT_MAX:0] control_state;            // From control of control.v
wire [15:0]             data_out;               // From mem of mem.v
wire                    en_mem;                 // From decoder of decoder.v
wire [3:0]              flags_out;              // From alu of alu.v
wire [15:0]             immediate;              // From decoder of decoder.v
wire                    mem_byte;               // From decoder of decoder.v
wire [15:0]             mem_data;               // From alu of alu.v
wire                    mem_displacement;       // From decoder of decoder.v
wire                    mem_wait;               // From mem of mem.v
wire                    next_word;              // From decoder of decoder.v
wire [15:0]             alu_output;                    // From alu of alu.v
wire [15:0]             pc_out;                 // From pc_unit of pc_unit.v
wire [2:0]              rD_sel;                 // From decoder of decoder.v
wire [2:0]              rS_sel;                 // From decoder of decoder.v
wire                    should_branch;          // From alu of alu.v
wire                    alu_wr_en;                  // From alu of alu.v
wire                    en_immediate;
wire [15:0]             rD_data;
wire [15:0]             rS_data;
wire [15:0]             pc_in;
wire [15:0]             dec_immediate;
wire en_alu, en_pc, en_decoder, en_register;
wire [15:0]             addr;
wire [15:0]             mem_addr_out;
wire [15:0]             rS_data_in, rD_data_in;
wire [15:0]             data_in;
wire mem_enable, write_enable, byte_enable, byte_select;
wire mmio_enable;
wire reg_write_enable, rS_wr_en;
wire en;
wire rst;
wire [15:0] lr_in, lr_out;
wire lr_wr_en, alu_lr_wr_en;
wire lr_is_input, dec_lr_is_input;
wire [15:0] mmio_data_out;
wire mmio_serviced_read;
wire mmio_mem_wait;
wire mem_mem_wait;
wire [15:0] data_in2;
wire [15:0] addr2;
wire [15:0] data_out2;
wire write_enable2;
wire dma_status;
wire [1:0]              pc_op;
reg [3:0]              flags_in;
reg [15:0]             instruction;
reg [15:0] 	       mem_out_reg;
// End of automatics
alu alu(
        // Outputs
        .should_branch                  (should_branch),
        .out                            (alu_output[15:0]),
        .mem_data                       (mem_data[15:0]),
        .write                          (alu_wr_en),
        .flags_out                      (flags_out[3:0]),
        .SP_out                         (SP_out[15:0]),
        // Inputs
        .clk                            (clk),
        .en                             (en_alu),
        .alu_control                    (alu_control[7:0]),
        .en_imm                         (en_immediate),
        .rD_data                        (rD_data[15:0]),
        .rS_data                        (rS_data[15:0]),
        .immediate                      (immediate[15:0]),
        .condition                      (condition[3:0]),
        .flags_in                       (flags_in[3:0]),
        .mem_displacement               (mem_displacement),
        .lr_wr_en                       (alu_lr_wr_en));
control control(
                // Outputs
                .control_o              (control_state[`CONTROL_BIT_MAX:0]),
		.pc_op			(pc_op[1:0]),
                // Inputs
                .clk                    (clk),
                .en                     (en),
                .rst                    (rst),
                .en_mem                 (en_mem),
                .mem_wait               (mem_wait),
                .should_branch          (should_branch),
		.imm			(instruction[15]));
decoder decoder(
                // Outputs
                .alu_control            (alu_control[7:0]),
                .rD_sel                 (rD_sel[2:0]),
                .rS_sel                 (rS_sel[2:0]),
                .immediate              (dec_immediate[15:0]),
                .en_immediate           (en_immediate),
                .next_word              (next_word),
                .en_mem                 (en_mem),
                .mem_displacement       (mem_displacement),
                .mem_byte               (mem_byte),
                .condition              (condition[3:0]),
                .lr_is_input            (dec_lr_is_input),
                // Inputs
                .clk                    (clk),
                .en                     (en_decoder),
                .instruction            (instruction[15:0]));
pc_unit pc_unit(
                // Outputs
                .pc_out                 (pc_out[15:0]),
                // Inputs
                .clk                    (clk),
                .en                     (en_pc),
                .rst                    (rst),
                .pc_in                  (pc_in[15:0]),
                .pc_op                  (pc_op[1:0]));
register_unit reg_unit(
                       // Outputs
                       .rD_data_out     (rD_data[15:0]),
                       .rS_data_out     (rS_data[15:0]),
                       // Inputs
                       .clk             (clk),
                       .en              (en_register),
                       .rst             (rst),
                       .wr_en           (reg_write_enable),
                       .rS_wr_en        (rS_wr_en),
                       .rD_sel          (rD_sel[2:0]),
                       .rS_sel          (rS_sel[2:0]),
                       .rD_data_in      (rD_data_in[15:0]),
                       .rS_data_in      (rS_data_in[15:0]));
mem mem(
        // Outputs
        .data_out                       (data_out[15:0]),
        .mem_wait                       (mem_mem_wait),
        // Inputs
        .clk                            (clk),
        .rst                            (rst),
        .en                             (mem_enable),
        .write_enable                   (write_enable),
        .byte_select                    (byte_select),
        .byte_enable                    (byte_enable),
        .addr                           (addr[15:0]),
        .data_in                        (data_in[15:0]),
        .write_enable2                  (write_enable2),
        .data_in2                       (data_in2[15:0]),
        .addr2                          (addr2[15:0]),
        .data_out2                      (data_out2[15:0]));
//leds leds(
    //.clk                                (clk),
    //.en                                 (en),
    //.rst                                (rst),
    //.wr_en                              (write_enable),
    //.data                               (data_in[15:0]),
    //.addr                               (addr[15:0]),
    //.led_out                            (LED));
mmio mmio(
          // Outputs
          .data_out                     (mmio_data_out[15:0]),
          .led_out                      (LED),
          .serviced_read                (mmio_serviced_read),
          .tx                           (tx),
          .snd_out                      (snd_out),
          .snd_signals                  (snd_signals),
          .mem_wait                     (mmio_mem_wait),
          // Inputs
          .clk                          (clk),
          .rst                          (rst),
          .en                           (mmio_enable),
          .write_enable                 (write_enable),
          .byte_select                  (byte_select),
          .byte_enable                  (byte_enable),
          .addr                         (addr[15:0]),
          .data_in                      (data_in[15:0]),
          .rx                           (rx),
          .switches                     (switches),
          .dma_status                   (dma_status));
dma_controller dma(
                   // Outputs
                   .ram_addr            (addr2[15:0]),
                   .ram_data_out        (data_in2[15:0]),
                   .ram_we              (write_enable2),
                   .dma_status          (dma_status),
                   // Inputs
                   .clk                 (clk),
                   .rst                 (rst),
                   .en                  (en),
                   .addr                (addr[15:0]),
                   .data_in             (data_in[15:0]),
                   .write_enable        (write_enable),
                   .ram_data_in         (data_out2[15:0]),
                   .dram_data_out       (dram_data_out[31:0]),
                   .dram_addr           (dram_addr[23:0]),
                   .dram_req_read       (dram_req_read),
                   .dram_req_write      (dram_req_write),
                   .dram_data_in        (dram_data_in[31:0]),
                   .dram_data_valid     (dram_data_valid),
                   .dram_write_complete (dram_write_complete)
               );
lr lr(
      // Outputs
      .lr_out                           (lr_out[15:0]),
      // Inputs
      .clk                              (clk),
      .rst                              (rst),
      .wr_en                            (lr_wr_en),
      .lr_in                            (lr_in[15:0]));
    assign en_alu = control_state[`BIT_ALU];
    assign en_decoder = control_state[`BIT_DECODE];
    assign en_pc = control_state[`BIT_FETCH] | control_state[`BIT_REG_READ] | control_state[`BIT_REG_WR];
    assign en_register = control_state[`BIT_REG_READ] | control_state[`BIT_REG_WR];
    assign mem_enable = 1;
    assign mmio_enable = control_state[`BIT_MEM];
    assign write_enable = control_state[`BIT_MEM] &&
        ({1'b0,instruction[14:8]} == `OPC_ST ||
         {1'b0,instruction[14:8]} == `OPC_PUSH ||
         {1'b0,instruction[14:8]} == `OPC_PUSHLR);
    assign reg_write_enable = control_state[`BIT_REG_WR] ? alu_wr_en : 0;
    assign immediate = lr_is_input ? lr_out : (next_word ? data_out : dec_immediate);
    assign rD_data_in = en_mem ? mem_out_reg : alu_output;
    assign pc_in = alu_output;
	assign mem_addr_out = control_state[`BIT_MEM]? alu_output : pc_out;
	assign byte_select = mem_addr_out[0];
    assign byte_enable = control_state[`BIT_MEM]? mem_byte : 0;
    assign addr = {1'b0,mem_addr_out[15:1]};
    assign rS_data_in = SP_out;
    assign rS_wr_en = (instruction[14:8] == `OPC_PUSH ||
					   instruction[14:8] == `OPC_POP ||
					   instruction[14:8] == `OPC_PUSHLR)
						&& control_state[`BIT_REG_WR]? 1 : 0;
    assign data_in = mem_data;
    assign en = rst_n; //! rst
    assign rst = ~rst_n;
    assign lr_in = pc_out;
    assign lr_wr_en = control_state[`BIT_REG_WR] ? alu_lr_wr_en : 0;
    assign lr_is_input = dec_lr_is_input && control_state[`BIT_ALU];
    assign mem_wait = mem_mem_wait | mmio_mem_wait;
    always @(posedge clk) begin
		if (rst_n == 0)
		  flags_in <= 0;
	else begin
	   if(control_state[`BIT_FETCH])
		 instruction <= data_out;
	   if(control_state[`BIT_DECODE])
	     flags_in <= flags_out;
	end
    end
    always @(posedge clk) begin
	mem_out_reg <= mmio_serviced_read ? mmio_data_out : data_out;
    end
endmodule