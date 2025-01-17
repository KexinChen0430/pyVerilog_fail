module test_axis_blender_2lvl(
);
	parameter integer C_CHN_WIDTH           =  8;
	parameter integer C_S0_CHN_NUM          =  1;
	parameter integer C_S1_CHN_NUM          =  3;
	parameter integer C_ALPHA_WIDTH         =  8;
	parameter integer C_S1_ENABLE           =  1;
	parameter integer C_IN_NEED_WIDTH       =  1;
	parameter integer C_OUT_NEED_WIDTH      =  0;	/// must be (C_IN_NEED_WIDTH - 1), min val is 0
	parameter integer C_M_WIDTH             = 24;	/// must be max(C_S0_CHN_NUM, C_S1_CHN_NUM) * C_CHN_WIDTH
	parameter integer C_TEST                =  0;
	reg clk;
	reg resetn;
	localparam integer C_MAX_STREAM_NUM =  2;
	localparam integer C_IMG_BITS       = 12;
	reg [C_MAX_STREAM_NUM-1:0]                     s_random ;
	reg [C_IMG_BITS-1:0]                 s_width;
	reg [C_IMG_BITS-1:0]                 s_height;
	reg                                  s_valid  [C_MAX_STREAM_NUM-1:0];
	wire [C_M_WIDTH + C_ALPHA_WIDTH-1:0] s_data   [C_MAX_STREAM_NUM-1:0];
	wire [C_IN_NEED_WIDTH:0]             s_user   [C_MAX_STREAM_NUM-1:0];
	wire                                 s_last   [C_MAX_STREAM_NUM-1:0];
	wire                                 s_ready  [C_MAX_STREAM_NUM-1:0];
	reg                                  s_enable [C_MAX_STREAM_NUM-1:0];
	reg                               m_random ;
	reg                               m_enprint;
	wire                                 sint_valid;
	wire [C_CHN_WIDTH*C_S0_CHN_NUM-1:0]  sint_data ;
	wire                                 sint_user ;
	wire                                 sint_last ;
	wire                                 sint_ready;
	wire                     m_valid  ;
	wire [C_M_WIDTH-1:0]     m_data   ;
	wire [C_OUT_NEED_WIDTH:0]m_user   ;
	wire                     m_last   ;
	reg                      m_ready  ;
axis_blender # (
	.C_CHN_WIDTH          (8  ),
	.C_S0_CHN_NUM         (1    ),
	.C_S1_CHN_NUM         (1    ),
	.C_ALPHA_WIDTH        (0   ),
	.C_S1_ENABLE          (0     ),
	.C_IN_NEED_WIDTH      (1 ),
	.C_OUT_NEED_WIDTH     (0 ),
	.C_M_WIDTH            (8       ),
	.C_TEST               (0          )
) blender1 (
	.clk(clk),
	.resetn(resetn),
	.s0_axis_tvalid(s_valid   [0]),
	.s0_axis_tdata (s_data    [0][7:0]),
	.s0_axis_tuser (s_user    [0][1:0]),
	.s0_axis_tlast (s_last    [0]),
	.s0_axis_tready(s_ready   [0]),
	//.s1_enable     (0),
	//.s1_axis_tvalid(0),
	//.s1_axis_tdata (0),
	//.s1_axis_tuser (0),
	//.s1_axis_tlast (0),
	//.s1_axis_tready(0),
	.m_axis_tvalid(sint_valid   ),
	.m_axis_tdata (sint_data    ),
	.m_axis_tuser (sint_user    ),
	.m_axis_tlast (sint_last    ),
	.m_axis_tready(sint_ready   )
);
axis_blender # (
	.C_CHN_WIDTH          (8  ),
	.C_S0_CHN_NUM         (1    ),
	.C_S1_CHN_NUM         (3    ),
	.C_ALPHA_WIDTH        (8   ),
	.C_S1_ENABLE          (1     ),
	.C_IN_NEED_WIDTH      (0 ),
	.C_OUT_NEED_WIDTH     (0),
	.C_M_WIDTH            (24       ),
	.C_TEST               (0          )
) blender2 (
	.clk(clk),
	.resetn(resetn),
	.s0_axis_tvalid(sint_valid   ),
	.s0_axis_tdata (sint_data    ),
	.s0_axis_tuser (sint_user    ),
	.s0_axis_tlast (sint_last    ),
	.s0_axis_tready(sint_ready   ),
	.s1_enable     (s_enable  [0]),
	.s1_axis_tvalid(s_valid   [1]),
	.s1_axis_tdata (s_data    [1]),
	.s1_axis_tuser (s_user    [1][0]),
	.s1_axis_tlast (s_last    [1]),
	.s1_axis_tready(s_ready   [1]),
	.m_axis_tvalid(m_valid   ),
	.m_axis_tdata (m_data    ),
	.m_axis_tuser (m_user    ),
	.m_axis_tlast (m_last    ),
	.m_axis_tready(m_ready   )
);
initial begin
	clk <= 1'b1;
	forever #1 clk <= ~clk;
end
initial begin
	resetn <= 1'b0;
	repeat (5) #2 resetn <= 1'b0;
	forever #2 resetn <= 1'b1;
end
initial begin
	s_enable[0]  <= 1;
	s_enable[1]  <= 1;
	s_random  <= 2'b11;
	m_random  <= 1'b1;
	m_enprint <= 1'b1;
	s_width       <=  3;
	s_height <=  5;
end
generate
	genvar i;
	genvar j;
	for (i = 0; i < 2; i = i + 1) begin: single_input
		reg [C_IMG_BITS-1:0]     s_ridx;
		reg [C_IMG_BITS-1:0]     s_cidx;
		reg en_input;
		always @ (posedge clk) begin
			if (resetn == 1'b0) en_input <= 1'b0;
			else		en_input <= (s_random[i] ? {$random}%2 : 1);
		end
		always @ (posedge clk) begin
			if (resetn == 1'b0)
				s_valid[i] <= 1'b0;
			else if (~s_valid[i]) begin
				if (en_input)
					s_valid[i] <= 1'b1;
			end
			else begin
				if (s_ready[i])
					s_valid[i] <= en_input;
			end
		end
		assign s_data[i] = (s_ridx * 16 + s_cidx) + (255 << 16);
		assign s_user[i] = (s_ridx == 0 && s_cidx == 0);
		assign s_last[i] = (s_cidx == s_width - 1);
		always @ (posedge clk) begin
			if (resetn == 1'b0) begin
				s_ridx <= 0;
				s_cidx <= 0;
			end
			else if (s_valid[i] && s_ready[i]) begin
				if (s_cidx != s_width - 1) begin
					s_cidx <= s_cidx + 1;
					s_ridx <= s_ridx;
				end
				else if (s_ridx != s_height - 1) begin
					s_cidx <= 0;
					s_ridx <= s_ridx + 1;
				end
				else begin
					s_cidx <= 0;
					s_ridx <= 0;
				end
			end
		end
	end
endgenerate
generate
		reg [C_IMG_BITS-1:0]     m_ridx;
		reg [C_IMG_BITS-1:0]     m_cidx;
		reg en_output;
		always @ (posedge clk) begin
			if (resetn == 1'b0) en_output <= 1'b0;
			else		en_output <= (m_random ? {$random}%2 : 1);
		end
		always @(posedge clk) begin
			if (resetn == 1'b0)
				m_ready <= 1'b0;
			else if (~m_ready)
				m_ready <= en_output;
			else begin
				if (m_valid)
					m_ready <= en_output;
			end
		end
		always @(posedge clk) begin
			if (resetn == 1'b0) begin
				m_ridx = 0;
				m_cidx = 0;
			end
			else if (m_ready && m_valid) begin
				if (m_user[0]) begin
					m_ridx = 0;
					m_cidx = 0;
				end
				else if (m_last) begin
					m_cidx = 0;
					m_ridx = m_ridx + 1;
				end
				else begin
					m_cidx = m_cidx + 1;
					m_ridx = m_ridx;
				end
			end
		end
		always @ (posedge clk) begin
			if (resetn == 1'b0) begin
			end
			else if (m_ready && m_valid && m_enprint) begin
				if (m_user[0])
					$write("out new frame: \n");
				$write("%h ", m_data);
				if (m_last)
					$write("\n");
			end
		end
endgenerate
endmodule