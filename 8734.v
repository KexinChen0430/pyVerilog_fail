module TestRam(input wire clk,
	input wire req_rdwr,
	// Write enable
	input wire we,
	// Address
	input wire [`TR_ADDR_MSB_POS:0] addr,
	// Data in
	input wire [`TR_DATA_MSB_POS:0] data_in,
	// Data out
	output wire [`TR_DATA_MSB_POS:0] data_out,
	// data_ready goes high when data is ready
	output reg data_ready);
	`include "src/inc/generic_params.v"
	reg __can_rdwr;
	//reg [1:0] __can_rdwr;
	// "pt" is short for "passthrough"
	wire __pt_we;
	wire [`TR_ADDR_MSB_POS:0] __pt_addr;
	wire [`TR_DATA_MSB_POS:0] __pt_data_in, __pt_data_out;
	// Inputs to internal_test_ram
	assign __pt_we = we;
	assign __pt_addr = addr;
	assign __pt_data_in = data_in;
	// Outputs from internal_test_ram
	assign data_out = __pt_data_out;
	_InternalTestRam internal_test_ram(.clk(clk), .we(__pt_we),
		.addr(__pt_addr), .data_in(__pt_data_in),
		.data_out(__pt_data_out));
	initial data_ready = __false;
	initial __can_rdwr = __false;
	always @ (posedge clk)
	begin
		//__can_rdwr <= !__can_rdwr;
		if (!req_rdwr)
		begin
			data_ready <= __false;
			__can_rdwr <= __false;
		end
		else // if (req_rdwr)
		begin
			__can_rdwr <= !__can_rdwr;
			data_ready <= __can_rdwr;
		end
	end
endmodule