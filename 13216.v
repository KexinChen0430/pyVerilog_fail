module plg_oserdese1_vlog (c23, c45, c67, sel,
			clk, clkdiv, rst,
		load, IOCLK_GLITCH);
input		 c23, c45, c67;
input	[1:0]	sel;
input		clk, clkdiv, rst;
output		load;
output		IOCLK_GLITCH;
wire		SRTYPE;
wire	[3:0]	INIT_LOADCNT;
wire	[4:0]	SELFHEAL;
assign SRTYPE = 1'b1;
assign INIT_LOADCNT = 4'b0000;
assign SELFHEAL = 5'b00000;
reg		q0, q1, q2, q3;
reg		qhr, qlr;
reg		load, mux;
wire		cntrrst;
assign cntrrst = IOCLK_GLITCH | rst;
// Parameters for gate delays
parameter ffdcnt = 1;
parameter mxdcnt = 1;
parameter FFRST = 145; // clock to out delay for flop in PLSG
tri0 GSR = glbl.GSR;
always @(GSR)
begin
	if (GSR)
		begin
			assign q3 = INIT_LOADCNT[3];
			assign q2 = INIT_LOADCNT[2];
			assign q1 = INIT_LOADCNT[1];
			assign q0 = INIT_LOADCNT[0];
		end
	else
		begin
			deassign q3;
			deassign q2;
			deassign q1;
			deassign q0;
		end
end
// flops for counter
// asynchronous reset
always @ (posedge qhr or posedge clk)
begin
	if (qhr & !SRTYPE)
		begin
			q0 <= # ffdcnt 1'b0;
			q1 <= # ffdcnt 1'b0;
			q2 <= # ffdcnt 1'b0;
			q3 <= # ffdcnt 1'b0;
		end
	else if (!SRTYPE)
		begin
			q3 <= # ffdcnt q2;
			q2 <= # ffdcnt (!(!q0 & !q2) & q1);
			q1 <= # ffdcnt q0;
			q0 <= # ffdcnt mux;
		end
end
// synchronous reset
always @ (posedge clk)
begin
	if (qhr & SRTYPE)
		begin
			q0 <= # ffdcnt 1'b0;
			q1 <= # ffdcnt 1'b0;
			q2 <= # ffdcnt 1'b0;
			q3 <= # ffdcnt 1'b0;
		end
	else if (SRTYPE)
		begin
			q3 <= # ffdcnt q2;
			q2 <= # ffdcnt (!(!q0 & !q2) & q1);
			q1 <= # ffdcnt q0;
			q0 <= # ffdcnt mux;
		end
end
// mux settings for counter
always @ (sel or c23 or c45 or c67 or q0 or q1 or q2 or q3)
	begin
		case (sel)
		2'b00: mux <= # mxdcnt (!q0 & !(c23 & q1));
		2'b01: mux <= # mxdcnt (!q1 & !(c45 & q2));
		2'b10: mux <= # mxdcnt (!q2 & !(c67 & q3));
		2'b11: mux <= # mxdcnt !q3;
		default: mux <= # mxdcnt 1'b0;
		endcase
	end
// mux decoding for load signal
always @ (sel or c23 or c45 or c67 or q0 or q1 or q2 or q3)
	begin
		case (sel)
		2'b00: load <= # mxdcnt q0;
		2'b01: load <= # mxdcnt q0 & q1;
		2'b10: load <= # mxdcnt q0 & q2;
		2'b11: load <= # mxdcnt q0 & q3;
		default: load <= # mxdcnt 1'b0;
		endcase
	end
// flops to reset counter
// Low speed flop
// asynchronous reset
always @ (posedge cntrrst or posedge clkdiv)
	begin
	if (cntrrst & !SRTYPE)
		begin
			qlr <= # FFRST 1'b1;
		end
	else if (!SRTYPE)
		begin
			qlr <= # FFRST 1'b0;
		end
	end
// synchronous reset
always @ (posedge clkdiv)
	begin
	if (cntrrst & SRTYPE)
		begin
			qlr <= # FFRST 1'b1;
		end
	else if (SRTYPE)
		begin
			qlr <= # FFRST 1'b0;
		end
	end
// High speed flop
// asynchronous reset
always @ (posedge cntrrst or posedge clk)
	begin
	if (cntrrst & !SRTYPE)
		begin
			qhr <= # ffdcnt 1'b1;
		end
	else if (!SRTYPE)
		begin
			qhr <= # ffdcnt qlr;
		end
	end
// synchronous reset
always @ (posedge clk)
	begin
	if (cntrrst & SRTYPE)
		begin
			qhr <= # ffdcnt 1'b1;
		end
	else if (SRTYPE)
		begin
			qhr <= # ffdcnt qlr;
		end
	end
selfheal_oserdese1_vlog fixcntr (.dq3(q3), .dq2(q2), .dq1(q1), .dq0(q0),
		.CLKDIV(clkdiv), .srint(qlr), .rst(rst),
		.SHO(IOCLK_GLITCH));
endmodule