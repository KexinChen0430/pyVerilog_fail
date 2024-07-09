module gen_pext_8 ( clk, reset, d, q );
	// synthesis attribute keep_hierarchy gen_pext_8 "true";
	input clk;
	input reset;
	input d;
	output q;
	reg q;
	reg c_q;
	reg c_zerocnt;
	reg c_gemaxcnt;
	reg [2:0] r_cnt;
	reg [2:0] c_cnt;
	reg [2:0] c_ifcnt0;
	reg [2:0] c_inccnt;
	// synopsys translate_off
`ifdef RANDOM_INIT
	initial begin
	$random_init("q", "r_cnt");
	end
`endif
`ifdef CHK_RESET_EOS
	assert_quiescent_state #(0,1,0,
	"***ERROR ASSERT: reset still asserted at end of simulation")
	a0(.clk(clk),.reset_n(1'b1), .state_expr(reset),
	.check_value(1'b0), .sample_event(1'b0));
`endif
	// synopsys translate_on
	always @(posedge clk) begin
	if (reset) begin
	q <= 1'h0;
	r_cnt <= 3'b0;
	end
	else begin
	q <= c_q;
	r_cnt <= c_cnt;
	end
	end
	always @ (d or q or r_cnt) begin
	c_zerocnt = ~(|r_cnt);
	c_q = c_zerocnt ? d : q;
	c_ifcnt0 = c_q ? 3'h1 : 3'h0;
	c_inccnt = {r_cnt + 3'h1};
	c_gemaxcnt = (r_cnt >= 3'd 7);
	c_cnt = c_zerocnt ? c_ifcnt0 :
	(c_gemaxcnt ? 3'h0 : c_inccnt);
	end
endmodule