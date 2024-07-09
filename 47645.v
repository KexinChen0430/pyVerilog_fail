module mlite_cpu (clk, reset_in, intr_in, mem_address, mem_data_w, mem_data_r,
                  mem_byte_sel, mem_write, mem_pause,opcode_instruction,address_next_out, protocol,processor_reset_seq);
   input         clk;
   input         reset_in;
   input         intr_in;
   input  [31:0] mem_data_r;
   input         mem_pause;
   output [31:0] mem_address;
   output [31:0] mem_data_w;
   output [ 3:0] mem_byte_sel;
   output        mem_write;
	output [31:0] opcode_instruction;
	output [31:0] address_next_out;
	input         protocol;
	output 		  processor_reset_seq;
   wire   [31:0] mem_address;
   wire   [31:0] mem_data_w;
   wire   [ 3:0] mem_byte_sel;
   wire          mem_write;
   //When using a two stage pipeline "sigD <= sig".
   //When using a three stage pipeline "sigD <= sig when rising_edge(clk)",
   //  so sigD is delayed by one clock cycle.
   wire   [31:0] opcode;
   wire   [ 5:0] rs_index;
   wire   [ 5:0] rt_index;
   wire   [ 5:0] rd_index;
   wire   [ 5:0] rd_indexD;
   wire   [31:0] reg_source;
   wire   [31:0] reg_target;
   wire   [31:0] reg_dest;
   wire   [31:0] reg_destD;
   wire   [31:0] a_bus;
   wire   [31:0] a_busD;
   wire   [31:0] b_bus;
   wire   [31:0] b_busD;
   wire   [31:0] c_bus;
   wire   [31:0] c_alu;
   wire   [31:0] c_shift;
   wire   [31:0] c_mult;
   wire   [31:0] c_memory;
   wire   [15:0] imm;
   wire   [31:0] pc;
   wire   [31:0] pc_plus4;
   wire   [ 3:0] alu_func;
   wire   [ 3:0] alu_funcD;
   wire   [ 1:0] shift_func;
   wire   [ 1:0] shift_funcD;
   wire   [ 3:0] mult_func;
   wire   [ 3:0] mult_funcD;
   wire   [ 2:0] branch_func;
   wire          take_branch;
   wire   [ 1:0] a_source;
   wire   [ 1:0] b_source;
   wire   [ 2:0] c_source;
   wire   [ 1:0] pc_source;
   wire   [ 3:0] mem_source;
   wire          pause_mult;
   wire          pause_ctrl;
   wire          pause_pipeline;
   wire          pause_any;
   wire          pause_non_ctrl;
   wire          pause_bank;
   wire          nullify_op;
   wire          intr_enable;
   reg           intr_signal_s1;
   reg           intr_signal_s2;
// [BUG-040325] >>>
   wire          intr_signal = intr_signal_s1 | intr_signal_s2;
//   wire          intr_signal = intr_signal_s1;
// <<<
   reg    [ 3:0] reset_reg;
   wire          reset;
   assign pause_any = (mem_pause | pause_ctrl) | (pause_mult | pause_pipeline);
   assign pause_non_ctrl = (mem_pause | pause_mult) | pause_pipeline;
   assign pause_bank = (mem_pause | pause_ctrl | pause_mult) & ~pause_pipeline;
// [BUG-040325] >>>
//   assign nullify_op = (pc_source == `from_lbranch & ~take_branch)? 1'b1 : 1'b0;
   assign nullify_op = (pc_source == `from_lbranch & take_branch)? 1'b1 : 1'b0;
// <<<
   assign c_bus = c_alu | c_shift | c_mult ;
   assign reset = (reset_in | reset_reg != 4'b1111) ? 1'b1 : 1'b0 ;
   //synchronize reset
   always @(posedge clk or posedge reset_in)
   begin
      if (reset_in)
         reset_reg <= 4'b0000;
      else if (reset_reg != 4'b1111)
         reset_reg <= reset_reg + 1;
   end
   //synchronize interrupt pins
   always @(posedge clk or posedge reset_in)
   begin
      if (reset_in)
         intr_signal_s1 <= 1'b0 ;
      else begin
         //don't try to interrupt a multi-cycle instruction
         if (intr_in & intr_enable & (pc_source == `from_inc4) & ~pc[2] & ~pause_any)
            //the epc will be backed up one opcode (pc-4)
            intr_signal_s1 <= 1'b1 ;
         else
            intr_signal_s1 <= 1'b0 ;
      end
   end
// [BUG-040325] >>>
   always @(posedge clk or posedge reset_in)
   begin
      if (reset_in)
         intr_signal_s2 <= 1'b0 ;
      else begin
         intr_signal_s2 <= intr_signal_s1 ;
      end
   end
// <<<
   wire [31:0] pc_cm;
	wire [31:0] pc_ipv4;
   wire [31:0]	pc_plus4_cm;
   wire [31:0]	pc_plus4_ipv4;
   wire [31:0]	address_next_out_cm;
   wire [31:0]	address_next_out_ipv4;
   pc_next u1_pc_next (
        .clk          (clk         ),
        .reset        (reset       ),
        .take_branch  (take_branch ),
        .pause_in     (pause_any   ),
        .pc_new       (c_bus[31:2] ),
        .opcode25_0   (opcode[25:0]),
        .pc_source    (pc_source   ),
        .pc_out       (pc_cm       ),
        .pc_out_plus4 (pc_plus4_cm ),
		  .pc_out_next32(address_next_out_cm)
   );
   pc_next_ipv4 u1_pc_next_ipv4 (
        .clk          (clk         ),
        .reset        (reset       ),
        .take_branch  (take_branch ),
        .pause_in     (pause_any   ),
        .pc_new       (c_bus[31:2] ),
        .opcode25_0   (opcode[25:0]),
        .pc_source    (pc_source   ),
        .pc_out       (pc_ipv4     ),
        .pc_out_plus4 (pc_plus4_ipv4   ),
		  .pc_out_next32(address_next_out_ipv4)
   );
	assign pc = (protocol) ? pc_cm : pc_ipv4;
	assign pc_plus4 = (protocol) ? pc_plus4_cm : pc_plus4_ipv4;
	assign address_next_out = (protocol) ? address_next_out_cm : address_next_out_ipv4;
   mem_ctrl u2_mem_ctrl(
        .clk          (clk           ),
        .reset        (reset         ),
        .pause_in     (pause_non_ctrl),
        .nullify_op   (nullify_op    ),
        .address_pc   (pc            ),
        .opcode_out   (opcode        ),
        .address_data (c_bus         ),
        .mem_source   (mem_source    ),
        .data_write   (reg_target    ),
        .data_read    (c_memory      ),
        .pause_out    (pause_ctrl    ),
        .mem_address  (mem_address   ),
        .mem_data_w   (mem_data_w    ),
        .mem_data_r   (mem_data_r    ),
        .mem_byte_sel (mem_byte_sel  ),
        .mem_write    (mem_write     ),
		  .address_next_out()
   );
   control u3_control(
        .opcode        (opcode     ),
        .intr_signal   (intr_signal),
        .rs_index      (rs_index   ),
        .rt_index      (rt_index   ),
        .rd_index      (rd_index   ),
        .imm_out       (imm        ),
        .alu_func      (alu_func   ),
        .shift_func    (shift_func ),
        .mult_func     (mult_func  ),
        .branch_func   (branch_func),
        .a_source_out  (a_source   ),
        .b_source_out  (b_source   ),
        .c_source_out  (c_source   ),
        .pc_source_out (pc_source  ),
        .mem_source_out(mem_source )
   );
   reg_bank u4_reg_bank(
        .clk           (clk        ),
        .reset         (reset      ),
        .pause         (pause_bank ),
        .rs_index      (rs_index   ),
        .rt_index      (rt_index   ),
        .rd_index      (rd_indexD  ),
        .reg_source_out(reg_source ),
        .reg_target_out(reg_target ),
        .reg_dest_new  (reg_destD  ),
        .intr_enable   (intr_enable)
   );
   bus_mux u5_bus_mux (
        .imm_in      (imm        ),
        .reg_source  (reg_source ),
        .a_mux       (a_source   ),
        .a_out       (a_bus      ),
        .reg_target  (reg_target ),
        .b_mux       (b_source   ),
        .b_out       (b_bus      ),
        .c_bus       (c_bus      ),
        .c_memory    (c_memory   ),
        .c_pc        (pc         ),
        .c_pc_plus4  (pc_plus4   ),
        .c_mux       (c_source   ),
        .reg_dest_out(reg_dest   ),
        .branch_func (branch_func),
        .take_branch (take_branch)
   );
   alu u6_alu(
        .a_in         (a_busD   ),
        .b_in         (b_busD   ),
        .alu_function (alu_funcD),
        .c_alu        (c_alu    )
   );
   shifter u7_shifter(
        .value        (b_busD     ),
        .shift_amount (a_busD[4:0]),
        .shift_func   (shift_funcD),
        .c_shift      (c_shift    )
   );
   mult u8_mult(
        .clk       (clk       ),
        .reset     (reset     ),
        .a         (a_busD    ),
        .b         (b_busD    ),
        .mult_func (mult_funcD),
        .c_mult    (c_mult    ),
        .pause_out (pause_mult)
   );
`ifdef mlite_cpu_pipeline2
      assign a_busD      = a_bus;
      assign b_busD      = b_bus;
      assign alu_funcD   = alu_func;
      assign shift_funcD = shift_func;
      assign mult_funcD  = mult_func;
      assign rd_indexD   = rd_index;
      assign reg_destD   = reg_dest;
      assign pause_pipeline = 1'b0;
`endif //pipeline2
`ifdef mlite_cpu_pipeline3
   //When operating in three stage pipeline mode, the following signals
   //are delayed by one clock cycle:  a_bus, b_bus, alu/shift/mult_func,
   //c_source, and rd_index.
   pipeline u9_pipeline(
        .clk           (clk           ),
        .reset         (reset         ),
        .a_bus         (a_bus         ),
        .a_busD        (a_busD        ),
        .b_bus         (b_bus         ),
        .b_busD        (b_busD        ),
        .alu_func      (alu_func      ),
        .alu_funcD     (alu_funcD     ),
        .shift_func    (shift_func    ),
        .shift_funcD   (shift_funcD   ),
        .mult_func     (mult_func     ),
        .mult_funcD    (mult_funcD    ),
        .reg_dest      (reg_dest      ),
        .reg_destD     (reg_destD     ),
        .rd_index      (rd_index      ),
        .rd_indexD     (rd_indexD     ),
        .rs_index      (rs_index      ),
        .rt_index      (rt_index      ),
        .pc_source     (pc_source     ),
        .mem_source    (mem_source    ),
        .a_source      (a_source      ),
        .b_source      (b_source      ),
        .c_source      (c_source      ),
        .c_bus         (c_bus         ),
        .pause_any     (pause_any     ),
        .pause_pipeline(pause_pipeline)
    );
`endif //pipeline3
assign opcode_instruction = opcode;
assign processor_reset_seq = reset;
endmodule