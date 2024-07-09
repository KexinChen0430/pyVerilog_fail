module ctrl_unit #(parameter word_sz=8, op_sz=4, state_sz=4, src_sz=2,
			dst_sz=2, sel1_sz=3, sel2_sz=2)
	(	output reg load_r0, load_r1, load_r2, load_r3, load_pc,
				inc_pc,
		output [sel1_sz-1:0] bus1_sel_mux,
		output [sel2_sz-1:0] bus2_sel_mux,
		output reg load_ir, load_add_r, load_reg_y, load_reg_z,
		output reg write, io_write,
		input [word_sz-1:0] instr,
		input zero,
		input clk, rst);
	localparam S_idle = 0;
	localparam S_fet1 = 1;
	localparam S_fet2 = 2;
	localparam S_dec = 3;
	localparam S_ex1 = 4;
	localparam S_rd1 = 5;
	localparam S_rd2 = 6;
	localparam S_wr1 = 7;
	localparam S_wr2 = 8;
	localparam S_br1 = 9;
	localparam S_br2 = 10;
	localparam S_halt = 11;
	localparam R0 = 0;
	localparam R1 = 1;
	localparam R2 = 2;
	localparam R3 = 3;
	wire [op_sz-1:0] opcode = instr[word_sz-1:word_sz-op_sz];
	wire [src_sz-1:0] src = instr[src_sz + dst_sz - 1: dst_sz];
	wire [dst_sz-1:0] dst = instr[dst_sz-1:0];
	reg [state_sz-1:0] state, next_state;
	reg sel_r0, sel_r1, sel_r2, sel_r3, sel_pc;
	reg sel_alu, sel_mem, bus1_sel, sel_io;
	reg err_flag;
	assign bus1_sel_mux = sel_r0 ? 0 :
				sel_r1 ? 1 :
				sel_r2 ? 2 :
				sel_r3 ? 3 :
				sel_pc ? 4 : 3'bx;
	assign bus2_sel_mux = sel_alu ? 0 :
				bus1_sel ? 1 :
				sel_mem ? 2 :
				sel_io ? 3: 2'bx;
	always @(posedge clk or negedge rst) begin : state_transitions
		if (~rst)
			state <= S_idle;
		else
			state <= next_state;
	end
	always @(state or opcode or src or dst or zero)
		begin : output_and_next_state
		sel_r0 = 0; sel_r1 = 0; sel_r2 = 0; sel_r3 = 0; sel_pc = 0;
		load_r0 = 0; load_r1 = 0; load_r2 = 0; load_r3 = 0; load_pc = 0;
		load_ir = 0; load_add_r = 0; load_reg_y = 0; load_reg_z = 0;
		inc_pc = 0;
		bus1_sel = 0;
		sel_alu = 0;
		sel_mem = 0;
		sel_io = 0;
		write = 0;
		err_flag = 0;
		next_state = state;
		case (state)
			S_idle: next_state = S_fet1;
			S_fet1: begin
				next_state = S_fet2;
				sel_pc = 1;
				bus1_sel = 1;
				load_add_r = 1;
			end
			S_fet2: begin
				next_state = S_dec;
				sel_mem = 1;
				load_ir = 1;
				inc_pc = 1;
			end
			S_dec: case (opcode)
				op.NOP: next_state = S_fet1;
				op.ADD, op.SUB, op.AND: begin
					next_state = S_ex1;
					bus1_sel = 1;
					load_reg_y = 1;
					case (src)
						R0: sel_r0 = 1;
						R1: sel_r1 = 1;
						R2: sel_r2 = 1;
						R3: sel_r3 = 1;
						default err_flag = 1;
					endcase
					end /* op.ADD, op.SUB, op.AND */
				op.NOT: begin
					next_state = S_fet1;
					load_reg_z = 1;
					bus1_sel = 1;
					sel_alu = 1;
					case (src)
						R0: sel_r0 = 1;
						R1: sel_r1 = 1;
						R2: sel_r2 = 1;
						R3: sel_r3 = 1;
						default err_flag = 1;
					endcase
					case (dst)
						R0: load_r0 = 1;
						R1: load_r1 = 1;
						R2: load_r2 = 1;
						R3: load_r3 = 1;
						default err_flag = 1;
					endcase
				end /* op.NOT */
				op.RD: begin
					next_state = S_rd1;
					sel_pc = 1;
					bus1_sel = 1;
					load_add_r = 1;
				end
				op.WR: begin
					next_state = S_wr1;
					sel_pc = 1;
					bus1_sel = 1;
					load_add_r = 1;
				end
				op.BR: begin
					next_state = S_br1;
					sel_pc = 1;
					bus1_sel = 1;
					load_add_r = 1;
				end
				op.BRZ: if (zero) begin
					next_state = S_br1;
					sel_pc = 1;
					bus1_sel = 1;
					load_add_r = 1;
				end else begin
					next_state = S_fet1;
					inc_pc = 1;
				end
				default: next_state = S_halt;
			endcase /* opcode */
			S_ex1: begin
				next_state = S_fet1;
				load_reg_z = 1;
				sel_alu = 1;
				case (dst)
					R0: begin sel_r0 = 1; load_r0 = 1; end
					R1: begin sel_r1 = 1; load_r1 = 1; end
					R2: begin sel_r2 = 1; load_r2 = 1; end
					R3: begin sel_r3 = 1; load_r3 = 1; end
					default: err_flag = 1;
				endcase
			end
			S_rd1: begin
				next_state = S_rd2;
				/* ADDED */
				casex (src)
					op.IO: sel_io = 1;
					op.MEM: sel_mem = 1;
				endcase
				load_add_r = 1;
				inc_pc = 1;
			end
			S_wr1: begin
				next_state = S_wr2;
				/* ADDED */
				casex (src)
					op.IO: sel_io = 1;
					op.MEM: sel_mem = 1;
				endcase
				load_add_r = 1;
				inc_pc = 1;
			end
			S_rd2: begin
				next_state = S_fet1;
				/* ADDED */
				casex (src)
					op.IO: sel_io = 1;
					op.MEM: sel_mem = 1;
				endcase
				case (dst)
					R0: load_r0 = 1;
					R1: load_r1 = 1;
					R2: load_r2 = 1;
					R3: load_r3 = 1;
					default: err_flag = 1;
				endcase
			end
			S_wr2: begin
				next_state = S_fet1;
				/* ADDED */
				casex (src)
					op.IO: io_write = 1;
					op.MEM: write = 1;
				endcase
				case (src)
					R0: sel_r0 = 1;
					R1: sel_r1 = 1;
					R2: sel_r2 = 1;
					R3: sel_r3 = 1;
					default: err_flag = 1;
				endcase
			end
			S_br1: begin
				next_state = S_br2;
				sel_mem = 1;
				load_add_r = 1;
			end
			S_br2: begin
				next_state = S_fet1;
				sel_mem = 1;
				load_pc = 1;
			end
			S_halt: next_state = S_halt;
			default: next_state = S_idle;
		endcase /* state */
	end /* always @(state or opcode or src or dst or zero)  */
endmodule