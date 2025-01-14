module Cpu(input wire clk, input wire rst, input wire enable,
	input wire [`CPU_DATA_MSB_POS:0] data_in,
	// If we're requesting a read or write
	output reg req_rdwr,
	// If req_rdwr == 1, then are we requesting a read or a write?
	// Here would be a good place to use an enum if this project were
	// written in SystemVerilog.
	// Values used with this output reg are `ENUM__CPU_WH_RDWR__READ and
	// `ENUM__CPU_WH_RDWR__WRITE, which are defined "src/inc/cpu_enums.v"
	output reg which_rdwr,
	// Address we want to read from or write to
	//output reg [`CPU_FAR_ADDR_MSB_POS:0] addr,
	// Just try a 16-bit address space for now.  We will switch to a 24-bit
	// address space later.
	output reg [`CPU_ACTUAL_ADDR_MSB_POS:0] addr,
	output reg [`CPU_DATA_MSB_POS:0] data_out);
	// Parameters
	`include "src/inc/generic_params.v"
	`include "src/inc/cpu_state_params.v"
	`include "src/inc/cpu_opcode_params.v"
	// Buffer MSB positions
	parameter __state_msb_pos = `_ENUM_MP__CPU_STATE;
	// which_rdwr stuff
	parameter __wh_rdwr__read = `ENUM__CPU_WH_RDWR__READ;
	parameter __wh_rdwr__write = `ENUM__CPU_WH_RDWR__WRITE;
	`include "src/inc/cpu_reg_params.v"
	`include "src/inc/cpu_debug_params.v"
	// Internal buffers
	//reg [__buf_byte_msb_pos:0] __data_in_buf;
	reg [__buf_byte_msb_pos:0] __opcode;
	// State machine thing
	reg [__state_msb_pos:0] __state;
	reg [__state_msb_pos + 1:0] __state_enum_counter;
	// Use the X macro pretending we have enums here.
	`define X(enum_reg) enum_reg,
	reg [__state_msb_pos:0]
		`_LIST_OF_CPU_STATES
		// This is necessary because of how the X macro is set up (having a
		// comma at the end)
		__st__dummy;
	`undef X
	initial
	begin
		__state_enum_counter = 0;
		// Use the X macro pretending we have enums here.
		//`define X(enum_reg) set_state_enum_reg(enum_reg);
		`define X(enum_reg) \
		enum_reg = __state_enum_counter; \
		__state_enum_counter = __state_enum_counter + 1;
		`_LIST_OF_CPU_STATES
		`undef X
	end
	// Processor Registers
	// The accumulator
	reg [__reg_c_msb_pos:0] __reg_c;
	// __reg_x is NOT a regular expression!
	reg [__reg_index_big_msb_pos:0] __reg_x, __reg_y;
	// Stack Pointer (SP)
	reg [__reg_sp_msb_pos:0] __reg_sp;
	// Program Counter (PC)
	reg [__reg_pc_msb_pos:0] __reg_pc;
	// Tasks
	task prep_load;
		input [`CPU_ACTUAL_ADDR_MSB_POS:0] some_addr;
		begin
			req_rdwr <= __true;
			which_rdwr <= __wh_rdwr__read;
			addr <= some_addr;
		end
	endtask
	task prep_store;
		input [`CPU_ACTUAL_ADDR_MSB_POS:0] some_addr;
		input [`CPU_DATA_MSB_POS:0] some_data_out;
		begin
			req_rdwr <= __true;
			which_rdwr <= __wh_rdwr__write;
			addr <= some_addr;
			data_out <= some_data_out;
		end
	endtask
	// Completely unnecessary task
	task disab_req_rdwr;
		req_rdwr <= __false;
	endtask
	task debug_show_state;
		case (__state)
			`define X(enum_reg) \
			enum_reg: \
			begin \
				$display(`"enum_reg\n\n`"); \
			end
			`_LIST_OF_CPU_STATES
			`undef X
			default:
			begin
				$display("Final __state\n");
			end
		endcase
	endtask
	always @ (posedge clk)
	begin
		if (!rst)
		begin
			debug_show_state();
			if (enable)
			begin
				$display("CPU ENabled!");
			end
			else // if (!enable)
			begin
				$display("CPU DISabled!");
			end
		end
		// Reset signal
		if (rst)
		begin
			// Clear outputs
			//req_rdwr <= __false;
			disab_req_rdwr();
			//which_rdwr <= __wh_rdwr__read;
			addr <= `_CPU_ACTUAL_ADDR_WIDTH'h0000;
			data_out <= `_CPU_DATA_WIDTH'h00;
			// Clear internal buffers
			//__data_in_buf <= 0;
			__opcode <= 0;
			// Clear processor registers
			{__reg_c, __reg_x, __reg_y, __reg_sp, __reg_pc} <= 0;
			//__reg_c <= 0;
			//__reg_x <= 2;
			//__reg_y <= 5;
			//__reg_sp <= 16'h9001;
			//__reg_pc <= 16'h2329;
			// Initial state
			__state <= __st_emu__reset;
		end
		else if (enable)
		begin
			case (__state)
				__st_emu__reset:
				begin
					//__state <= __st_testing__test_load_0;
					__state <= __st_testing__test_store_0;
				end
				// Test an 8-bit load
				__st_testing__test_load_0:
				begin
					__state <= __state + 1;
					prep_load(__debug_addr_0);
				end
				// Test another 8-bit load
				__st_testing__test_load_1:
				begin
					__state <= __state + 1;
					$display("data_in:  %h\n\n", data_in);
					//__opcode <= data_in;
					__reg_c[__reg_b_msb_pos:__reg_b_lsb_pos] <= data_in;
					prep_load(__debug_addr_1);
				end
				__st_testing__test_load_2:
				begin
					__state <= __state + 1;
					$display("data_in:  %h\n\n", data_in);
					//__opcode <= data_in;
					__reg_c[__reg_a_msb_pos:__reg_a_lsb_pos] <= data_in;
					//disab_req_rdwr();
					prep_load(__debug_addr_2);
				end
				__st_testing__test_load_3:
				begin
					__state <= __st_testing__done;
					$display("data_in:  %h\n\n", data_in);
					//__opcode <= data_in;
					__reg_x[__reg_index_hi_msb_pos:__reg_index_hi_lsb_pos]
						<= data_in;
					disab_req_rdwr();
				end
				// Test an 8-bit store
				__st_testing__test_store_0:
				begin
					__state <= __state + 1;
					prep_store(__debug_addr_0, `_CPU_DATA_WIDTH'h45);
				end
				__st_testing__test_store_1:
				begin
					__state <= __state + 1;
					//__state <= __st_testing__test_load_0;
					prep_store(__debug_addr_1, `_CPU_DATA_WIDTH'h87);
				end
				__st_testing__test_store_2:
				begin
					__state <= __st_testing__test_load_0;
					prep_store(__debug_addr_2, `_CPU_DATA_WIDTH'haa);
				end
				default:
				begin
					$display("%h, %h\t\t%h, %h\t\t%h, %h, %h, %h, %h\n",
						data_in, data_out,
						__state, __opcode,
						__reg_c, __reg_x, __reg_y, __reg_sp, __reg_pc);
					$finish;
				end
			endcase
		end
	end
endmodule