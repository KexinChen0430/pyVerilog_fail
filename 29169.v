module next_hop_ram(clk, addr, data_in, data_out, we, en, reset);
input clk;
input [12:2] addr;
input [31:0] data_in;
output [31:0] data_out;
input [3:0] we;
input en;
input reset;
wire [3:0] dip;
RAMB16_S9_altera	ram0 (
	.address ( addr[12:2] ),
	.clock ( clk ),
	.data ( data_in[7:0] ),
	.rden ( en ),
	.wren ( we[0] ),
	.q ( data_out[7:0] )
	);
defparam ram0.altsyncram_component.init_file = "nh_ram0.mif";
RAMB16_S9_altera	ram1 (
	.address ( addr[12:2] ),
	.clock ( clk ),
	.data ( data_in[15:8] ),
	.rden ( en ),
	.wren ( we[1] ),
	.q ( data_out[15:8] )
	);
defparam ram1.altsyncram_component.init_file = "nh_ram1.mif";
RAMB16_S9_altera	ram2 (
	.address ( addr[12:2] ),
	.clock ( clk ),
	.data ( data_in[23:16] ),
	.rden ( en ),
	.wren ( we[2] ),
	.q ( data_out[23:16] )
	);
defparam ram2.altsyncram_component.init_file = "nh_ram2.mif";
RAMB16_S9_altera	ram3 (
	.address ( addr[12:2] ),
	.clock ( clk ),
	.data ( data_in[31:24] ),
	.rden ( en ),
	.wren ( we[3] ),
	.q ( data_out[31:24] )
	);
defparam ram3.altsyncram_component.init_file = "nh_ram3.mif";
endmodule