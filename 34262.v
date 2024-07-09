module
input in_rdma_pkt_almostfull
);
wire 	in_input_valid_q;
wire 	in_input_valid_empty;
reg	out_input_valid_rd;
wire [7:0] out_input_pkt_usedw;
assign out_input_pkt_almostfull = out_input_pkt_usedw[7];
reg 	out_input_pkt_rd;
wire [133:0]in_input_pkt_q;
wire 	in_ppc_valid_q;
wire 	in_ppc_valid_empty;
reg	out_ppc_valid_rd;
wire out_ppc_pkt_empty;
wire [7:0] out_ppc_pkt_usedw;
assign out_ppc_pkt_almostfull = out_ppc_pkt_usedw[7];
reg 	out_ppc_pkt_rd;
wire [133:0]in_ppc_pkt_q;
reg ppc_input;//1:input 0:ppc
reg [2:0] current_state;
parameter	idle_s	=	3'd0,
			send_ppc_s	=	3'd1,
			send_input_s	=	3'd2,
			discard_input_s=3'd3,
			discard_ppc_s=3'd4;
always@(posedge clk or negedge reset) begin
	if(!reset) begin
		out_rdma_pkt_wr<= 1'b0;
		out_rdma_pkt<= 134'b0;
		out_rdma_valid_wr<= 1'b0;
		out_rdma_valid<=1'b0;
		ppc_input<=1'b0;
		out_input_valid_rd<=1'b0;
		out_input_pkt_rd<=1'b0;
		out_ppc_valid_rd<=1'b0;
		out_ppc_pkt_rd<=1'b0;
		current_state<=idle_s;
	end
	else begin
		case(current_state)
		idle_s: begin
			out_rdma_pkt_wr<= 1'b0;
			out_rdma_valid_wr<= 1'b0;
			out_rdma_valid<=1'b0;
			if(in_rdma_pkt_almostfull==1'b0) begin
				case({in_input_valid_empty,in_ppc_valid_empty})
					2'b00: begin//both  PPC and INPUT have pkt
						if(ppc_input==1'b0) begin//get pkt from PPC Module
							out_input_valid_rd<=1'b0;
							out_input_pkt_rd<=1'b0;
							out_ppc_valid_rd<=1'b1;
							out_ppc_pkt_rd<=1'b1;
							current_state<=send_ppc_s;
						end
						else begin
							out_input_valid_rd<=1'b1;
							out_input_pkt_rd<=1'b1;
							out_ppc_valid_rd<=1'b0;
							out_ppc_pkt_rd<=1'b0;
							current_state<=send_input_s;
						end
					end
					2'b01: begin//only INPUT has pkt
						out_input_valid_rd<=1'b1;
						out_input_pkt_rd<=1'b1;
						out_ppc_valid_rd<=1'b0;
						out_ppc_pkt_rd<=1'b0;
						current_state<=send_input_s;
					end
					2'b10: begin//only ppc has pkt
						out_input_valid_rd<=1'b0;
						out_input_pkt_rd<=1'b0;
						out_ppc_valid_rd<=1'b1;
						out_ppc_pkt_rd<=1'b1;
						current_state<=send_ppc_s;
					end
					default: begin
						out_input_valid_rd<=1'b0;
						out_input_pkt_rd<=1'b0;
						out_ppc_valid_rd<=1'b0;
						out_ppc_pkt_rd<=1'b0;
						current_state<=idle_s;
					end
				endcase
			end
			else begin
				out_input_valid_rd<=1'b0;
				out_input_pkt_rd<=1'b0;
				out_ppc_valid_rd<=1'b0;
				out_ppc_pkt_rd<=1'b0;
				current_state<=idle_s;
			end
		end
	send_input_s:begin
		out_input_valid_rd<=1'b0;
		out_rdma_pkt_wr<=1'b1;
		out_rdma_pkt<=in_input_pkt_q;
		ppc_input<=1'b0;//get pkt from PPC��Module next time
		if(in_input_pkt_q[133:132]==2'b10) begin
			out_input_pkt_rd<=1'b0;
			out_rdma_valid_wr<=1'b1;
			out_rdma_valid<=1'b1;
			current_state<=idle_s;
		end
		else begin
			out_input_pkt_rd<=1'b1;
			out_rdma_valid_wr<=1'b0;
			current_state<=send_input_s;
		end
	end
	send_ppc_s:begin
		out_ppc_valid_rd<=1'b0;
		out_rdma_pkt_wr<=1'b1;
		out_rdma_pkt<=in_ppc_pkt_q;
		ppc_input<=1'b1;//get pkt from INPUT��Module next time
		if(in_ppc_pkt_q[133:132]==2'b10) begin
			out_ppc_pkt_rd<=1'b0;
			out_rdma_valid_wr<=1'b1;
			current_state<=idle_s;
		end
		else begin
			out_ppc_pkt_rd<=1'b1;
			out_rdma_valid_wr<=1'b0;
			current_state<=send_ppc_s;
		end
	end
	discard_input_s:begin
		out_input_valid_rd<=1'b0;
		if(in_ppc_pkt_q[133:132]==2'b10) begin
			out_input_pkt_rd<=1'b0;
			current_state<=idle_s;
		end
		else begin
			out_input_pkt_rd<=1'b1;
			current_state<=discard_input_s;
		end
	end
	discard_ppc_s:begin
		out_ppc_valid_rd<=1'b0;
		if(in_ppc_pkt_q[133:132]==2'b10) begin
			out_ppc_valid_rd<=1'b0;
			current_state<=idle_s;
		end
		else begin
			out_ppc_pkt_rd<=1'b1;
			current_state<=discard_ppc_s;
		end
	end
	default: begin
		out_rdma_pkt_wr<= 1'b0;
		out_rdma_valid_wr<= 1'b0;
		out_rdma_valid<=1'b0;
		out_input_valid_rd<=1'b0;
		out_input_pkt_rd<=1'b0;
		out_ppc_valid_rd<=1'b0;
		out_ppc_pkt_rd<=1'b0;
		current_state<=idle_s;
	end
endcase
end
end
fifo_64_1 FIFO_VALID_input  (
							.aclr(!reset),
							.data(in_input_valid),
							.clock(clk),
							.rdreq(out_input_valid_rd),
							.wrreq(in_input_valid_wr),
							.q(in_input_valid_q),
							.empty(in_input_valid_empty)
						);
fifo_256_134	FIFO_PKT_input (
								.aclr(!reset),
								.data(in_input_pkt),
								.clock(clk),
								.rdreq(out_input_pkt_rd),
								.wrreq(in_input_pkt_wr),
								.q(in_input_pkt_q),
								.usedw(out_input_pkt_usedw)
								);
fifo_64_1 FIFO_VALID_PPC  (
							.aclr(!reset),
							.data(in_ppc_valid),
							.clock(clk),
							.rdreq(out_ppc_valid_rd),
							.wrreq(in_ppc_valid_wr),
							.q(in_ppc_valid_q),
							.empty(in_ppc_valid_empty)
						);
fifo_256_134	FIFO_PKT_PPC (
								.aclr(!reset),
								.data(in_ppc_pkt),
								.clock(clk),
								.rdreq(out_ppc_pkt_rd),
								.wrreq(in_ppc_pkt_wr),
								.q(in_ppc_pkt_q),
								.usedw(out_ppc_pkt_usedw),
								.empty(out_ppc_pkt_empty)
								);
endmodule