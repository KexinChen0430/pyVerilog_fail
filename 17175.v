module data_mem (data_out,data_in,mem_ctrl_addr,clk,dm_ctrl_sig);
// load instr - take data out
// store - put data into the memory
	// ===============================================================
	// Output signals...
	// Data output read from the data memory
	output [0:127] data_out;
	// ===============================================================
	// Input signals
	// Data input stored into the data memory
	input [0:127] data_in;
	/**
	 */
	input [0:31] mem_ctrl_addr;
	// Clock signal
	input clk;
	// Control signals for the data memory
	input [0:1] dm_ctrl_sig;
	// ===============================================================
	// Declare "wire" signals:
	//wire FSM_OUTPUT;
	// ===============================================================
	// Definitions for the constants the instruction memory
	// parameter PARAM_NAME = VALUE;
	// ===============================================================
	// Declare "reg" signals:
	reg [0:127] data_out;					// Output signals
	/**
	 */
	reg [127:0] data_mem [255:0];			// Store the data here
	// Store instruction address in the instruction memory
	// ===============================================================
	initial
	begin
		/**
		 */
		$readmemh("rf1.fill",data_mem);
	end
	// A change in the instruction address activates this...
	always @(posedge clk)
	begin
		/**
		 */
		case(dm_ctrl_sig)
			`memwld:
				begin
					// Read the data from the memory
					data_out<=data_mem[mem_ctrl_addr];
				end
			`memwst:
				begin
					// Write the data to the memory
					data_mem[mem_ctrl_addr]<=data_in;
$display("Value written to data mem",data_mem[mem_ctrl_addr],"#");
				end
			`memnop:
				begin
					data_out<=128'd0;
				end
			default:
				begin
					data_out<=128'd0;
				end
		endcase
	end
endmodule