module dout_oserdese1_vlog (data1, data2,
		CLK, BUFO, SR, OCE,
		OQ, d2rnk2,
		DATA_RATE_OQ,
		INIT_OQ, SRVAL_OQ,
		DDR3_MODE);
input		data1, data2;
input		CLK, SR, OCE;
input		BUFO;
input		INIT_OQ, SRVAL_OQ;
input		DDR3_MODE;
output		OQ;
output		d2rnk2;
// Programmable Points
input		DATA_RATE_OQ;
wire		DDR_CLK_EDGE;
wire	[3:0]	SRTYPE;
assign DDR_CLK_EDGE = 1'b1;
assign SRTYPE = 4'b1111;
reg		d1rnk2, d2rnk2, d2nrnk2;
reg		OQ;
reg		ddr_data, odata_edge, sdata_edge;
reg		c23, c45, c67;
wire		C;
wire		C2p, C3;
wire	[3:0]	seloq;
wire		oqsr, oqrev;
assign C = (BUFO & DDR3_MODE) | (CLK & !DDR3_MODE);
assign C2p = (C & DDR_CLK_EDGE) | (!C & !DDR_CLK_EDGE);
assign C3 = !C2p;
assign seloq = {OCE,DATA_RATE_OQ,oqsr,oqrev};
assign oqsr =  !SRTYPE[1] & SR & !SRVAL_OQ;
assign oqrev = !SRTYPE[1] & SR & SRVAL_OQ;
// Delay values
parameter     	FFD = 1; // clock to out delay for flip flops
//                            driven by clk
parameter	FFCD = 1; // clock to out delay for flip flops
//                               driven by clkdiv
parameter	MXD = 1; // 60 ps mux delay
parameter	MXR1 = 1;
// Initialization of flops with GSR for test model
tri0 GSR = glbl.GSR;
always @(GSR)
begin
	if (GSR)
		begin
			assign OQ = INIT_OQ;
			assign d1rnk2 = INIT_OQ;
			assign d2rnk2 = INIT_OQ;
			assign d2nrnk2 = INIT_OQ;
		end
	else
		begin
			deassign OQ;
			deassign d1rnk2;
			deassign d2rnk2;
			deassign d2nrnk2;
		end
end
// 3 flops to create DDR operations of 4 latches
// Representation of top latch
// asynchronous operation
always @ (posedge C or posedge SR)
begin
	begin
	if (SR & !SRVAL_OQ & !SRTYPE[1])
		begin
			d1rnk2 <= # FFD 1'b0;
		end
	else if (SR & SRVAL_OQ & !SRTYPE[1])
		begin
			d1rnk2 <= # FFD 1'b1;
		end
	else if (!OCE & !SRTYPE[1])
		begin
			d1rnk2 <= # FFD OQ;
		end
	else if (!SRTYPE[1])
		begin
			d1rnk2 <= # FFD data1;
		end
	end
end
// synchronous operation
always @ (posedge C)
begin
	begin
	if (SR & !SRVAL_OQ & SRTYPE[1])
		begin
			d1rnk2 <= # FFD 1'b0;
		end
	else if (SR & SRVAL_OQ & SRTYPE[1])
		begin
			d1rnk2 <= # FFD 1'b1;
		end
	else if (!OCE & SRTYPE[1])
		begin
			d1rnk2 <= # FFD OQ;
		end
	else if (SRTYPE[1])
		begin
			d1rnk2 <= # FFD data1;
		end
	end
end
// Representation of 2nd latch
// asynchronous operation
always @ (posedge C2p or posedge SR)
begin
	begin
	if (SR & !SRVAL_OQ & !SRTYPE[1])
		begin
			d2rnk2 <= # FFD 1'b0;
		end
	else if (SR & SRVAL_OQ & !SRTYPE[1])
		begin
			d2rnk2 <= # FFD 1'b1;
		end
	else if (!OCE & !SRTYPE[1])
		begin
			d2rnk2 <= # FFD OQ;
		end
	else if (!SRTYPE[1])
		begin
			d2rnk2 <= # FFD data2;
		end
	end
end
// synchronous operation
always @ (posedge C2p)
begin
	begin
	if (SR & !SRVAL_OQ & SRTYPE[1])
		begin
			d2rnk2 <= # FFD 1'b0;
		end
	else if (SR & SRVAL_OQ & SRTYPE[1])
		begin
			d2rnk2 <= # FFD 1'b1;
		end
	else if (!OCE & SRTYPE[1])
		begin
			d2rnk2 <= # FFD OQ;
		end
	else if (SRTYPE[1])
		begin
			d2rnk2 <= # FFD data2;
		end
	end
end
// Representation of 3rd flop ( latch and output latch)
// asynchronous operation
always @ (posedge C3 or posedge SR)
begin
	begin
	if (SR & !SRVAL_OQ & !SRTYPE[1])
		begin
			d2nrnk2 <= # FFD 1'b0;
		end
	else if (SR & SRVAL_OQ & !SRTYPE[1])
		begin
			d2nrnk2 <= # FFD 1'b1;
		end
	else if (!OCE & !SRTYPE[1])
		begin
			d2nrnk2 <= # FFD OQ;
		end
	else if (!SRTYPE[1])
		begin
			d2nrnk2 <= # FFD d2rnk2;
		end
	end
end
// synchronous operation
always @ (posedge C3)
begin
	begin
	if (SR & !SRVAL_OQ & SRTYPE[1])
		begin
			d2nrnk2 <= # FFD 1'b0;
		end
	else if (SR & SRVAL_OQ & SRTYPE[1])
		begin
			d2nrnk2 <= # FFD 1'b1;
		end
	else if (!OCE & SRTYPE[1])
		begin
			d2nrnk2 <= # FFD OQ;
		end
	else if (SRTYPE[1])
		begin
			d2nrnk2 <= # FFD d2rnk2;
		end
	end
end
// Logic to generate same edge data from d1rnk2 and d2nrnk2;
always @ (C or C3 or d1rnk2 or d2nrnk2)
	begin
		sdata_edge <= # MXD (d1rnk2 & C) | (d2nrnk2 & C3);
	end
// Mux to create opposite edge DDR data from d1rnk2 and d2rnk2
always @ (C or d1rnk2 or d2rnk2)
	begin
		case (C)
		1'b0: odata_edge <= # MXD d2rnk2;
		1'b1: odata_edge <= # MXD d1rnk2;
		default: odata_edge <= # MXD d1rnk2;
		endcase
	end
// Logic to same edge and opposite data into just ddr data
always @ (ddr_data or sdata_edge or odata_edge or DDR_CLK_EDGE)
	begin
		ddr_data <= # MXD (odata_edge & !DDR_CLK_EDGE) | (sdata_edge & DDR_CLK_EDGE);
	end
// Output mux to generate OQ
always @ (seloq or d1rnk2 or ddr_data or OQ)
	begin
		casex (seloq)
                4'bXX01: OQ <= # MXD 1'b1;
                4'bXX10: OQ <= # MXD 1'b0;
                4'bXX11: OQ <= # MXD 1'b0;
                4'bX000: OQ <= # MXD ddr_data;
                4'bX100: OQ <= # MXD d1rnk2;
                default: OQ <= # MXD ddr_data;
		endcase
	end
endmodule