module ice_iserdese1_vlog (ce1, ce2, NUM_CE,
		clkdiv, r,
		ice
		);
// regular inputs
input		ce1, ce2;
input		clkdiv, r;
// programmable points
input		NUM_CE;
// programmable test points
// Synchronus RST
wire		SRTYPE;
assign SRTYPE = 1'b0;
// output
output		ice;
reg		ce1r, ce2r, ice;
wire	[1:0]	cesel;
assign cesel = {NUM_CE,clkdiv};
// Delay parameters
localparam ffice = 300;
localparam mxice = 60;
// Initialization of flops through GSR
tri0 GSR = glbl.GSR;
always @(GSR)
begin
	if (GSR)
		begin
			assign ce1r = 1'b0;
			assign ce2r = 1'b0;
		end
	else
		begin
			deassign ce1r;
			deassign ce2r;
		end
end
// Asynchronous Operation
always @ (posedge clkdiv or posedge r)
	begin
	if (r & SRTYPE)
		begin
			ce1r <= # ffice 1'b0;
			ce2r <= # ffice 1'b0;
		end
	else if (SRTYPE)
		begin
			ce1r <= # ffice ce1;
			ce2r <= # ffice ce2;
		end
	end
// Synchronous Operation
always @ (posedge clkdiv)
	begin
	if (r & !SRTYPE)
		begin
			ce1r <= # ffice 1'b0;
			ce2r <= # ffice 1'b0;
		end
	else if (!SRTYPE)
		begin
			ce1r <= # ffice ce1;
			ce2r <= # ffice ce2;
		end
	end
// Output mux
always @ (cesel or ce1 or ce1r or ce2r)
	begin
		case (cesel)
		2'b00: ice <= # mxice ce1;
		2'b01: ice <= # mxice ce1;
		2'b10: ice <= # mxice ce2r;
		2'b11: ice <= # mxice ce1r;
		default: ice <= # mxice ce1;
		endcase
	end
endmodule