module _InternalTestRam(input wire clk,
	// Write enable
	input wire we,
	// Address
	input wire [`TR_ADDR_MSB_POS:0] addr,
	// Data in
	input wire [`TR_DATA_MSB_POS:0] data_in,
	// Data out
	output reg [`TR_DATA_MSB_POS:0] data_out);
	`include "src/inc/cpu_debug_params.v"
	reg [`TR_DATA_MSB_POS:0] __mem[0:`_ARR_SIZE_THING(`_TR_ADDR_WIDTH)];
	initial $readmemh("readmemh_input.txt.ignore", __mem);
	always @ (posedge clk)
	begin
		//$display("In _InternalTestRam:  %h\t\t%h\t\t%h, %h",
		//	we,
		//	addr,
		//	data_in, data_out);
		$display("In _InternalTestRam:  %h\t\t%h, %h, %h\t\t%h",
			we,
			__mem[__debug_addr_0], __mem[__debug_addr_1],
			__mem[__debug_addr_2],
			data_out);
		if (we)
		begin
			__mem[addr] <= data_in;
		end
		data_out <= __mem[addr];
	end
endmodule