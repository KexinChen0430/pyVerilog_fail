module tout_oserdese1_vlog (data1, data2,
		CLK, BUFO, SR, TCE,
		DATA_RATE_TQ, TRISTATE_WIDTH,
		INIT_TQ, SRVAL_TQ,
		TQ, DDR3_MODE);
input		data1, data2;
input		CLK, BUFO, SR, TCE;
input	[1:0]	DATA_RATE_TQ, TRISTATE_WIDTH;
input		INIT_TQ, SRVAL_TQ;
input		DDR3_MODE;
output		TQ;
wire		DDR_CLK_EDGE;
wire	[1:0]	SRTYPE;
assign SRTYPE = 2'b11;
assign DDR_CLK_EDGE = 1'b1;
reg		TQ;
reg		t1r, t2r, t3r, t4r;
reg		qt1, qt2, qt2n;
reg		sdata_edge, odata_edge, ddr_data;
wire		C;
wire		C2p, C3;
wire		load;
wire	[5:0]	tqsel;
wire		tqsr, tqrev;
wire	[4:0]	sel;
assign C = (BUFO & DDR3_MODE) | (CLK & !DDR3_MODE);
assign C2p = (C & DDR_CLK_EDGE) | (!C & !DDR_CLK_EDGE);
assign C3 = !C2p;
assign tqsr =  (!SRTYPE[0] & SR & !SRVAL_TQ) | (!SRTYPE[0] & SRVAL_TQ);
assign tqrev = (!SRTYPE[0] & SR &  SRVAL_TQ) | (!SRTYPE[0] & !SRVAL_TQ);
assign tqsel = {TCE,DATA_RATE_TQ,TRISTATE_WIDTH,tqsr};
// Parameters for gate delays
parameter ffd = 1;
parameter mxd = 1;
// Initialization of Flops
tri0 GSR = glbl.GSR;
always @(GSR)
begin
	if (GSR)
		begin
			assign TQ = INIT_TQ;
			assign qt1 = INIT_TQ;
			assign qt2 = INIT_TQ;
			assign qt2n = INIT_TQ;
		end
	else
		begin
			deassign TQ;
			deassign qt1;
			deassign qt2;
			deassign qt2n;
		end
end
// 3 flops to create DDR operations of 4 latches
// Representation of top latch
// asynchronous operation
always @ (posedge C or posedge SR)
begin
	begin
	if (SR & !SRVAL_TQ & !SRTYPE[0])
		begin
			qt1 <= # ffd 1'b0;
		end
	else if (SR & SRVAL_TQ & !SRTYPE[0])
		begin
			qt1 <= # ffd 1'b1;
		end
	else if (!TCE & !SRTYPE[0])
		begin
			qt1 <= # ffd TQ;
		end
	else if (!SRTYPE[0])
		begin
			qt1 <= # ffd data1;
		end
	end
end
// synchronous operation
always @ (posedge C)
begin
	begin
	if (SR & !SRVAL_TQ & SRTYPE[0])
		begin
			qt1 <= # ffd 1'b0;
		end
	else if (SR & SRVAL_TQ & SRTYPE[0])
		begin
			qt1 <= # ffd 1'b1;
		end
	else if (!TCE & SRTYPE[0])
		begin
			qt1 <= # ffd TQ;
		end
	else if (SRTYPE[0])
		begin
			qt1 <= # ffd data1;
		end
	end
end
// Representation of 2nd latch
// asynchronous operation
always @ (posedge C2p or posedge SR)
begin
	begin
	if (SR & !SRVAL_TQ & !SRTYPE[0])
		begin
			qt2 <= # ffd 1'b0;
		end
	else if (SR & SRVAL_TQ & !SRTYPE[0])
		begin
			qt2 <= # ffd 1'b1;
		end
	else if (!TCE & !SRTYPE[0])
		begin
			qt2 <= # ffd TQ;
		end
	else if (!SRTYPE[0])
		begin
			qt2 <= # ffd data2;
		end
	end
end
// synchronous operation
always @ (posedge C2p)
begin
	begin
	if (SR & !SRVAL_TQ & SRTYPE[0])
		begin
			qt2 <= # ffd 1'b0;
		end
	else if (SR & SRVAL_TQ & SRTYPE[0])
		begin
			qt2 <= # ffd 1'b1;
		end
	else if (!TCE & SRTYPE[0])
		begin
			qt2 <= # ffd TQ;
		end
	else if (SRTYPE[0])
		begin
			qt2 <= # ffd data2;
		end
	end
end
// Representation of 3rd flop ( latch and output latch)
// asynchronous operation
always @ (posedge C3 or posedge SR)
begin
	begin
	if (SR & !SRVAL_TQ & !SRTYPE[0])
		begin
			qt2n <= # ffd 1'b0;
		end
	else if (SR & SRVAL_TQ & !SRTYPE[0])
		begin
			qt2n <= # ffd 1'b1;
		end
	else if (!TCE & !SRTYPE[0])
		begin
			qt2n <= # ffd TQ;
		end
	else if (!SRTYPE[0])
		begin
			qt2n <= # ffd qt2;
		end
	end
end
// synchronous operation
always @ (posedge C3)
begin
	begin
	if (SR & !SRVAL_TQ & SRTYPE[0])
		begin
			qt2n <= # ffd 1'b0;
		end
	else if (SR & SRVAL_TQ & SRTYPE[0])
		begin
			qt2n <= # ffd 1'b1;
		end
	else if (!TCE & SRTYPE[0])
		begin
			qt2n <= # ffd TQ;
		end
	else if (SRTYPE[0])
		begin
			qt2n <= # ffd qt2;
		end
	end
end
// Logic to generate same edge data from qt1, qt3;
always @ (C or C3 or qt1 or qt2n)
	begin
		sdata_edge <= # mxd (qt1 & C) | (qt2n & C3);
	end
// Mux to create opposite edge DDR function
always @ (C or qt1 or qt2)
	begin
		case (C)
		1'b0: odata_edge <= # mxd qt2;
		1'b1: odata_edge <= # mxd qt1;
		default: odata_edge <= 1'b0;
		endcase
	end
// Logic to same edge and opposite data into just ddr data
always @ (ddr_data or sdata_edge or odata_edge or DDR_CLK_EDGE)
	begin
		ddr_data <= # mxd (odata_edge & !DDR_CLK_EDGE) | (sdata_edge & DDR_CLK_EDGE);
	end
// Output mux to generate TQ
// Note that the TQ mux can also support T2 combinatorial or
//  registered outputs.
always @ (tqsel or data1 or ddr_data or qt1 or TQ)
	begin
		casex (tqsel)
                6'bX01XX1: TQ <= # mxd 1'b0;
                6'bX10XX1: TQ <= # mxd 1'b0;
                6'bX01XX1: TQ <= # mxd 1'b0;
                6'bX10XX1: TQ <= # mxd 1'b0;
                6'bX0000X: TQ <= # mxd data1;
        //      6'b001000: TQ <= # mxd TQ;
        //      6'b010010: TQ <= # mxd TQ;
        //      6'b010100: TQ <= # mxd TQ;
                6'bX01000: TQ <= # mxd qt1;
                6'bX10010: TQ <= # mxd ddr_data;
                6'bX10100: TQ <= # mxd ddr_data;
		default: TQ <= # mxd ddr_data;
		endcase
	end
endmodule