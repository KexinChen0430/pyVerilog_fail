module \$macc (A, B, Y);
parameter A_WIDTH = 0;
parameter B_WIDTH = 0;
parameter Y_WIDTH = 0;
parameter CONFIG = 4'b0000;
parameter CONFIG_WIDTH = 4;
input [A_WIDTH-1:0] A;
input [B_WIDTH-1:0] B;
output reg [Y_WIDTH-1:0] Y;
// Xilinx XSIM does not like $clog2() below..
function integer my_clog2;
	input integer v;
	begin
		if (v > 0)
			v = v - 1;
		my_clog2 = 0;
		while (v) begin
			v = v >> 1;
			my_clog2 = my_clog2 + 1;
		end
	end
endfunction
localparam integer num_bits = CONFIG[3:0] > 0 ? CONFIG[3:0] : 1;
localparam integer num_ports = (CONFIG_WIDTH-4) / (2 + 2*num_bits);
localparam integer num_abits = my_clog2(A_WIDTH) > 0 ? my_clog2(A_WIDTH) : 1;
function [2*num_ports*num_abits-1:0] get_port_offsets;
	input [CONFIG_WIDTH-1:0] cfg;
	integer i, cursor;
	begin
		cursor = 0;
		get_port_offsets = 0;
		for (i = 0; i < num_ports; i = i+1) begin
			get_port_offsets[(2*i + 0)*num_abits +: num_abits] = cursor;
			cursor = cursor + cfg[4 + i*(2 + 2*num_bits) + 2 +: num_bits];
			get_port_offsets[(2*i + 1)*num_abits +: num_abits] = cursor;
			cursor = cursor + cfg[4 + i*(2 + 2*num_bits) + 2 + num_bits +: num_bits];
		end
	end
endfunction
localparam [2*num_ports*num_abits-1:0] port_offsets = get_port_offsets(CONFIG);
`define PORT_IS_SIGNED   (0 + CONFIG[4 + i*(2 + 2*num_bits)])
`define PORT_DO_SUBTRACT (0 + CONFIG[4 + i*(2 + 2*num_bits) + 1])
`define PORT_SIZE_A      (0 + CONFIG[4 + i*(2 + 2*num_bits) + 2 +: num_bits])
`define PORT_SIZE_B      (0 + CONFIG[4 + i*(2 + 2*num_bits) + 2 + num_bits +: num_bits])
`define PORT_OFFSET_A    (0 + port_offsets[2*i*num_abits +: num_abits])
`define PORT_OFFSET_B    (0 + port_offsets[2*i*num_abits + num_abits +: num_abits])
integer i, j;
reg [Y_WIDTH-1:0] tmp_a, tmp_b;
always @* begin
	Y = 0;
	for (i = 0; i < num_ports; i = i+1)
	begin
		tmp_a = 0;
		tmp_b = 0;
		for (j = 0; j < `PORT_SIZE_A; j = j+1)
			tmp_a[j] = A[`PORT_OFFSET_A + j];
		if (`PORT_IS_SIGNED && `PORT_SIZE_A > 0)
			for (j = `PORT_SIZE_A; j < Y_WIDTH; j = j+1)
				tmp_a[j] = tmp_a[`PORT_SIZE_A-1];
		for (j = 0; j < `PORT_SIZE_B; j = j+1)
			tmp_b[j] = A[`PORT_OFFSET_B + j];
		if (`PORT_IS_SIGNED && `PORT_SIZE_B > 0)
			for (j = `PORT_SIZE_B; j < Y_WIDTH; j = j+1)
				tmp_b[j] = tmp_b[`PORT_SIZE_B-1];
		if (`PORT_SIZE_B > 0)
			tmp_a = tmp_a * tmp_b;
		if (`PORT_DO_SUBTRACT)
			Y = Y - tmp_a;
		else
			Y = Y + tmp_a;
	end
	for (i = 0; i < B_WIDTH; i = i+1) begin
		Y = Y + B[i];
	end
end
`undef PORT_IS_SIGNED
`undef PORT_DO_SUBTRACT
`undef PORT_SIZE_A
`undef PORT_SIZE_B
`undef PORT_OFFSET_A
`undef PORT_OFFSET_B
endmodule