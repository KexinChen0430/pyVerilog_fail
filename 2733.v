module processor_test (input wire clk,
				  input wire pc_reset,
				  input wire pc_enable
			     );
// Step 1
wire [31:0] pc_in;
wire [31:0] pc_out;
// Step 2
wire [31:0] pc_plus_four;
wire [31:0] add0_in1;
assign add0_in1 = 32'd4;
// Step 3
wire [31:0] alu_data_output;
wire [31:0] readData2;
wire [31:0] mem_data_out;
wire [31:0] instr;
// Step 4
wire reg_dst, jump, branch, mem_to_reg, ctrl_mem_read_wire, ctrl_mem_write_wire, alu_src, reg_write;
wire [1:0] alu_op;
pc pc0(
	.in (pc_in), //32 bits
	.clk,
	.rst (pc_reset),
	.en (pc_enable),
	.out (pc_out) //32 bits
	);
Adder_32b pc_adder(
	.clk,
	.input0 (pc_out),
	.input1 (add0_in1),
	.out (pc_plus_four)
	);
Memory mem0(
	.inst_addr (pc_out), //32 bits
	.instr,		//32 bits
	.data_addr (alu_data_output),	//32 bits
	.data_in (readData2), //32 bits
	.mem_read (ctrl_mem_read_wire),
	.mem_write (ctrl_mem_write_wire),
	.data_out (mem_data_out) //32 bits
	);
/*
Control ctrl0(
	.clk,
	.opcode (instr[31:26]), //6 bits
	.reg_dst,
	.jump,
	.branch,
	.ctrl_mem_read(ctrl_mem_read_wire),
	.mem_to_reg,
	.ctrl_mem_write(ctrl_mem_write_wire),
	.alu_src,
	.reg_write,
	.alu_op //2 bits
	);
	*/
endmodule