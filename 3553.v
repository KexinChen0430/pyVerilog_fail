module
   has to process the two sound channels. Each channels needs at least
   162 clock ticks, so in total it needs just over 324 ticks.
   (162 is the number of stages of the filter)
   Using 50MHz and max_clk_count=28 gives 896 clock ticks, which is
   more than enough.
*/
parameter max_clk_count = 7'd111;
reg [15:0] fir_left_in, fir_right_in, left_mux, right_mux;
reg	fir_sample_in;
reg fir4_sample_in;
reg [2:0] state;
reg [6:0] cnt;
always @(*)
	case( state )
		3'd0: { left_mux, right_mux } <= { left_in, right_in};
		3'd3: { left_mux, right_mux } <= { left_other, right_other};
		default: { left_mux, right_mux } <= 32'd0;
	endcase
always @(posedge clk)
if( rst ) begin
	state <= 2'b0;
	fir_sample_in <= 1'b0;
	cnt	  <= 6'd0;
end else begin
	fir4_sample_in <= ( cnt==0 || cnt==28 || cnt==56 || cnt==84 );
	if( cnt==max_clk_count ) begin
		cnt	  <= 6'd0;
		state <= state+1'b1;
		fir_sample_in <= 1'b1;
		{fir_left_in,fir_right_in} <= { left_mux, right_mux };
	end
	else begin
		cnt <= cnt + 1'b1;
		fir_sample_in <= 1'b0;
	end
end
localparam fir8_w=16; // at least 16
localparam fir4_w=16; // at least 16
wire [fir8_w-1:0] fir8_out_l, fir8_out_r;
wire [fir4_w-1:0] fir4_out_l, fir4_out_r;
assign out_l = fir4_out_l[15:0];
assign out_r = fir4_out_r[15:0];
//assign out_l = fir8_out_l[15:0];
//assign out_r = fir8_out_r[15:0];
//wire fir8_sample;
jt51_fir8 #(.data_width(16), .output_width(fir8_w)) u_fir8 (
	.clk		( clk 			),
	.rst		( rst  			),
	.sample		( fir_sample_in ),
	.left_in	( fir_left_in 	),
	.right_in	( fir_right_in 	),
	.left_out	( fir8_out_l	),
	.right_out	( fir8_out_r	)
	// .sample_out	( fir8_sample	)
);
jt51_fir4 #(.data_width(16), .output_width(fir4_w)) u_fir4 (
	.clk		( clk 			),
	.rst		( rst  			),
	.sample		( fir4_sample_in),
	.left_in	( fir8_out_l[fir8_w-1:fir8_w-16]	),
	.right_in	( fir8_out_r[fir8_w-1:fir8_w-16]	),
	.left_out	( fir4_out_l	),
	.right_out	( fir4_out_r	),
	.sample_out	( sample_out	)
);
endmodule