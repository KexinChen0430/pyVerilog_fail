module tile_datapath #(
parameter SIZE = 16'd256,			//# of processing units in this tile
parameter LOOP = 16'd4,				//nodes calculated per processing unit
parameter PRV_SIZE = 16'd10,		//# of processing units in previous tile
parameter PRV_LOOP = 16'd10,		//nodes per processing unit in previous tile
parameter BIAS = 16'd0,				//per-layer biasing
parameter WEIGHT_WIDTH = 3
)(
input clk_i,
input rst_i,
input en_i,
input [7:0] data_i,
input [$clog2(SIZE) - 1'b1:0] sig_mux_sel_i,
input [SIZE*WEIGHT_WIDTH - 1:0] weight_bus_i,
output wire [7:0] data_o
);
wire  [9:0] 				mux_o;
wire 	[SIZE*10 - 1:0] 	proc_unit_o;
genvar i;
generate
	for(i = 0; i < SIZE; i = i + 1) begin: PU
		processing_unit #(
			.PRV_SIZE		(PRV_SIZE),
			.PRV_LOOP		(PRV_LOOP),
			.BIAS				(BIAS),
			.WEIGHT_WIDTH	(WEIGHT_WIDTH))
		PU(
			.clk_i			(clk_i),
			.rst_i			(rst_i),
			.en_i				(en_i),
			.weight_i		(weight_bus_i[`IDX(i, WEIGHT_WIDTH)]),
			.data_i			(data_i),
			.proc_unit_o	(proc_unit_o[`ID10(i)])
		);
	end
endgenerate
sig_mux #(
	.SIZE(SIZE),
	.WIDTH(10)
)
sig_mux(
	.sel(sig_mux_sel_i),
	.mux_i(proc_unit_o),
	.mux_o(mux_o)
);
sig_368p sig_368p(
	.sig_i(mux_o),
	.sig_o(data_o)
);
endmodule