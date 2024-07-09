module bscntrl_iserdese1_vlog (c23, c45, c67, sel, DATA_RATE,
		bitslip,
		clk, clkdiv, r,
		clkdiv_int,muxc
	);
// programmable points
input		c23, c45, c67, DATA_RATE;
input	[1:0]	sel;
// regular inputs
input		clk, r, clkdiv;
input		bitslip;
// Programmable Test Attributes
wire		SRTYPE;
assign SRTYPE = 1'b0;
// outputs
output		clkdiv_int, muxc;
reg		clkdiv_int;
reg		q1, q2, q3;
reg		mux;
reg		qhc1, qhc2, qlc1, qlc2;
reg		qr1, qr2;
reg		mux1, muxc;
//  Delay parameter assignment
localparam ffbsc = 300;
localparam mxbsc = 60;
// Initialization of flops through GSR
`ifdef SW_NO_ISERDES_TEST
`else
tri0 GSR = glbl.GSR;
always @(GSR)
begin
	if (GSR)
		begin
			assign q3 = 1'b0;
			assign q2 = 1'b0;
			assign q1 = 1'b0;
			assign clkdiv_int = 1'b0;
		end
	else
		begin
			deassign q3;
			deassign q2;
			deassign q1;
			deassign clkdiv_int;
		end
end
`endif
// Divide by 2 - 8 counter
// Asynchronous Operation
always @ (posedge qr2 or posedge clk)
begin
	if (qr2 & SRTYPE)
		begin
			clkdiv_int <= # ffbsc 1'b0;
			q1 <= # ffbsc 1'b0;
			q2 <= # ffbsc 1'b0;
			q3 <= # ffbsc 1'b0;
		end
	else if (qhc1 & SRTYPE)
		begin
			clkdiv_int <= # ffbsc clkdiv_int;
			q1 <= # ffbsc q1;
			q2 <= # ffbsc q2;
			q3 <= # ffbsc q3;
		end
	else if (SRTYPE)
		begin
			q3 <= # ffbsc q2;
			q2 <= # ffbsc (!(!clkdiv_int & !q2) & q1);
			q1 <= # ffbsc clkdiv_int;
			clkdiv_int <= # ffbsc mux;
		end
end
// Synchronous Operation
always @ (posedge clk)
begin
	if (qr2 & !SRTYPE)
		begin
			clkdiv_int <= # ffbsc 1'b0;
			q1 <= # ffbsc 1'b0;
			q2 <= # ffbsc 1'b0;
			q3 <= # ffbsc 1'b0;
		end
	else if (qhc1 & !SRTYPE)
		begin
			clkdiv_int <= # ffbsc clkdiv_int;
			q1 <= # ffbsc q1;
			q2 <= # ffbsc q2;
			q3 <= # ffbsc q3;
		end
	else if (!SRTYPE)
		begin
			q3 <= # ffbsc q2;
			q2 <= # ffbsc (!(!clkdiv_int & !q2) & q1);
			q1 <= # ffbsc clkdiv_int;
			clkdiv_int <= # ffbsc mux;
		end
end
// 4:1 selector mux and divider selections
always @ (sel or c23 or c45 or c67 or clkdiv_int or q1 or q2 or q3)
	begin
		case (sel)
		2'b00: mux <= # mxbsc !(clkdiv_int |  (c23 & q1));
		2'b01: mux <= # mxbsc !(q1 | (c45 & q2));
		2'b10: mux <= # mxbsc !(q2 | (c67 & q3));
		2'b11: mux <= # mxbsc !q3;
		default: mux <= # mxbsc !(clkdiv_int |  (c23 & q1));
		endcase
	end
// Bitslip control logic
// Low speed control flop
// Asynchronous Operation
always @ (posedge qr1 or posedge clkdiv)
begin
	begin
	if (qr1 & SRTYPE)
		begin
			qlc1 <= # ffbsc 1'b0;
			qlc2 <= # ffbsc 1'b0;
		end
	else if (!bitslip & SRTYPE)
		begin
			qlc1 <= # ffbsc qlc1;
			qlc2 <= # ffbsc 1'b0;
		end
	else if (SRTYPE)
		begin
			qlc1 <= # ffbsc !qlc1;
			qlc2 <= # ffbsc (bitslip & mux1);
		end
	end
end
// Synchronous Operation
always @ (posedge clkdiv)
begin
	begin
	if (qr1 & !SRTYPE)
		begin
			qlc1 <= # ffbsc 1'b0;
			qlc2 <= # ffbsc 1'b0;
		end
	else if (!bitslip & !SRTYPE)
		begin
			qlc1 <= # ffbsc qlc1;
			qlc2 <= # ffbsc 1'b0;
		end
	else if (!SRTYPE)
		begin
			qlc1 <= # ffbsc !qlc1;
			qlc2 <= # ffbsc (bitslip & mux1);
		end
	end
end
// Mux to select between sdr "1" and ddr "0"
always @ (qlc1 or DATA_RATE)
	begin
		case (DATA_RATE)
		1'b0: mux1 <= # mxbsc qlc1;
		1'b1: mux1 <= # mxbsc 1'b1;
		endcase
	end
// High speed control flop
// Asynchronous Operation
always @ (posedge qr2 or posedge clk)
begin
	begin
	if (qr2 & SRTYPE)
		begin
			qhc1 <= # ffbsc 1'b0;
			qhc2 <= # ffbsc 1'b0;
		end
	else if (SRTYPE)
		begin
			qhc1 <= # ffbsc (qlc2 & !qhc2);
			qhc2 <= # ffbsc qlc2;
		end
	end
end
// Synchronous Operation
always @ (posedge clk)
begin
	begin
	if (qr2 & !SRTYPE)
		begin
			qhc1 <= # ffbsc 1'b0;
			qhc2 <= # ffbsc 1'b0;
		end
	else if (!SRTYPE)
		begin
			qhc1 <= # ffbsc (qlc2 & !qhc2);
			qhc2 <= # ffbsc qlc2;
		end
	end
end
// Mux that drives control line of mux in front
//	of 2nd rank of flops
always @ (mux1 or DATA_RATE)
begin
	case (DATA_RATE)
	1'b0 : muxc <= # mxbsc mux1;
	1'b1 : muxc <= # mxbsc 1'b0;
	endcase
end
// Asynchronous set flops
// Low speed reset flop
// Asynchronous Operation
always @ (posedge r or posedge clkdiv)
	begin
	if (r & SRTYPE)
		begin
			qr1 <= # ffbsc 1'b1;
		end
	else if (SRTYPE)
		begin
			qr1 <= # ffbsc 1'b0;
		end
	end
// Synchronous Operation
always @ (posedge clkdiv)
	begin
	if (r & !SRTYPE)
		begin
			qr1 <= # ffbsc 1'b1;
		end
	else if (!SRTYPE)
		begin
			qr1 <= # ffbsc 1'b0;
		end
	end
// High speed reset flop
// Asynchronous Operation
always @ (posedge r or posedge clk)
	begin
	if (r & SRTYPE)
		begin
			qr2 <= # ffbsc 1'b1;
		end
	else if (SRTYPE)
		begin
			qr2 <= # ffbsc qr1;
		end
	end
// Synchronous Operation
always @ (posedge clk)
	begin
	if (r & !SRTYPE)
		begin
			qr2 <= # ffbsc 1'b1;
		end
	else if (!SRTYPE)
		begin
			qr2 <= # ffbsc qr1;
		end
	end
endmodule