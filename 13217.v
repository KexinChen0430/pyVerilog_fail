module rank12d_oserdese1_vlog (D1, D2, D3, D4, D5, D6, d2rnk2,
		SHIFTIN1, SHIFTIN2,
		C, CLKDIV, SR, OCE,
		data1, data2, SHIFTOUT1, SHIFTOUT2,
		DATA_RATE_OQ, DATA_WIDTH,
		SERDES_MODE, load,
		IOCLK_GLITCH,
		INIT_OQ, SRVAL_OQ);
input		D1, D2, D3, D4, D5, D6;
input		d2rnk2;
input		SHIFTIN1, SHIFTIN2;
input		C, CLKDIV, SR, OCE;
input		INIT_OQ, SRVAL_OQ;
output		data1, data2;
output		SHIFTOUT1, SHIFTOUT2;
output		load;
output		IOCLK_GLITCH;
// Programmable Points
input		DATA_RATE_OQ;
input	[3:0]	DATA_WIDTH;
input		SERDES_MODE;
wire		DDR_CLK_EDGE, SERDES;
wire	[3:0]	SRTYPE;
wire	[4:0]	SELFHEAL;
wire	[3:0]	INIT_ORANK2_PARTIAL;
wire 	[5:0]	INIT_ORANK1;
assign DDR_CLK_EDGE = 1'b1;
assign SERDES = 1'b1;
assign SRTYPE = 4'b1111;
assign SELFHEAL = 5'b00000;
assign INIT_ORANK2_PARTIAL = 4'b0000;
assign INIT_ORANK1 = 6'b000000;
reg		d1r, d2r, d3r, d4r, d5r, d6r;
reg		d3rnk2, d4rnk2, d5rnk2, d6rnk2;
reg		data1, data2, data3, data4, data5, data6;
reg		ddr_data, odata_edge, sdata_edge;
reg		c23, c45, c67;
reg	[1:0]	sel;
wire		C2p, C3;
wire		loadint;
wire	[3:0]	seloq;
wire		oqsr, oqrev;
wire	[2:0]	sel1_4;
wire	[3:0]	sel5_6;
wire	[4:0]	plgcnt;
assign C2p = (C & DDR_CLK_EDGE) | (!C & !DDR_CLK_EDGE);
assign C3 = !C2p;
assign plgcnt = {DATA_RATE_OQ,DATA_WIDTH};
assign sel1_4 = {SERDES,loadint,DATA_RATE_OQ};
assign sel5_6 = {SERDES,SERDES_MODE,loadint,DATA_RATE_OQ};
assign load = loadint;
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
			assign d6rnk2 = INIT_ORANK2_PARTIAL[3];
			assign d5rnk2 = INIT_ORANK2_PARTIAL[2];
			assign d4rnk2 = INIT_ORANK2_PARTIAL[1];
			assign d3rnk2 = INIT_ORANK2_PARTIAL[0];
			assign d6r = INIT_ORANK1[5];
			assign d5r = INIT_ORANK1[4];
			assign d4r = INIT_ORANK1[3];
			assign d3r = INIT_ORANK1[2];
			assign d2r = INIT_ORANK1[1];
			assign d1r = INIT_ORANK1[0];
		end
	else
		begin
			deassign d6rnk2;
			deassign d5rnk2;
			deassign d4rnk2;
			deassign d3rnk2;
			deassign d6r;
			deassign d5r;
			deassign d4r;
			deassign d3r;
			deassign d2r;
			deassign d1r;
		end
end
// Assign shiftout1 and shiftout2
assign SHIFTOUT1 = d3rnk2 & SERDES_MODE;
assign SHIFTOUT2 = d4rnk2 & SERDES_MODE;
// last 4 flops which only have reset and init
// asynchronous operation
always @ (posedge C or posedge SR)
begin
	begin
	if (SR & !SRTYPE[2])
		begin
			d3rnk2 <= # FFD 1'b0;
			d4rnk2 <= # FFD 1'b0;
			d5rnk2 <= # FFD 1'b0;
			d6rnk2 <= # FFD 1'b0;
		end
	else if (!SRTYPE[2])
		begin
			d3rnk2 <= # FFD data3;
			d4rnk2 <= # FFD data4;
			d5rnk2 <= # FFD data5;
			d6rnk2 <= # FFD data6;
		end
	end
end
// synchronous operation
always @ (posedge C)
begin
	begin
	if (SR & SRTYPE[2])
		begin
			d3rnk2 <= # FFD 1'b0;
			d4rnk2 <= # FFD 1'b0;
			d5rnk2 <= # FFD 1'b0;
			d6rnk2 <= # FFD 1'b0;
		end
	else if (SRTYPE[2])
		begin
			d3rnk2 <= # FFD data3;
			d4rnk2 <= # FFD data4;
			d5rnk2 <= # FFD data5;
			d6rnk2 <= # FFD data6;
		end
	end
end
// First rank of flops for input data
// asynchronous operation
always @ (posedge CLKDIV or posedge SR)
begin
	begin
	if (SR & !SRTYPE[3])
		begin
			d1r <= # FFCD 1'b0;
			d2r <= # FFCD 1'b0;
			d3r <= # FFCD 1'b0;
			d4r <= # FFCD 1'b0;
			d5r <= # FFCD 1'b0;
			d6r <= # FFCD 1'b0;
		end
	else if (!SRTYPE[3])
		begin
			d1r <= # FFCD D1;
			d2r <= # FFCD D2;
			d3r <= # FFCD D3;
			d4r <= # FFCD D4;
			d5r <= # FFCD D5;
			d6r <= # FFCD D6;
		end
	end
end
// synchronous operation
always @ (posedge CLKDIV)
begin
	begin
	if (SR & SRTYPE[3])
		begin
			d1r <= # FFCD 1'b0;
			d2r <= # FFCD 1'b0;
			d3r <= # FFCD 1'b0;
			d4r <= # FFCD 1'b0;
			d5r <= # FFCD 1'b0;
			d6r <= # FFCD 1'b0;
		end
	else if (SRTYPE[3])
		begin
			d1r <= # FFCD D1;
			d2r <= # FFCD D2;
			d3r <= # FFCD D3;
			d4r <= # FFCD D4;
			d5r <= # FFCD D5;
			d6r <= # FFCD D6;
		end
	end
end
// Muxs for 2nd rank of flops
always @ (sel1_4 or d1r or d2rnk2 or d3rnk2)
	begin
		casex (sel1_4)
		3'b100: data1 <= # MXR1 d3rnk2;
		3'b110: data1 <= # MXR1 d1r;
		3'b101: data1 <= # MXR1 d2rnk2;
		3'b111: data1 <= # MXR1 d1r;
		default: data1 <= # MXR1 d3rnk2;
		endcase
	end
always @ (sel1_4 or d2r or d3rnk2 or d4rnk2)
	begin
		casex (sel1_4)
		3'b100: data2 <= # MXR1 d4rnk2;
		3'b110: data2 <= # MXR1 d2r;
		3'b101: data2 <= # MXR1 d3rnk2;
		3'b111: data2 <= # MXR1 d2r;
		default:  data2 <= # MXR1 d4rnk2;
		endcase
	end
//Note: To stop data rate of 00 from being illegal, register data is fed to mux
always @ (sel1_4 or d3r or d4rnk2 or d5rnk2)
	begin
		casex (sel1_4)
		3'b100: data3 <= # MXR1 d5rnk2;
		3'b110: data3 <= # MXR1 d3r;
		3'b101: data3 <= # MXR1 d4rnk2;
		3'b111: data3 <= # MXR1 d3r;
		default: data3 <= # MXR1 d5rnk2;
		endcase
	end
always @ (sel1_4 or d4r or d5rnk2 or d6rnk2)
	begin
		casex (sel1_4)
		3'b100: data4 <= # MXR1 d6rnk2;
		3'b110: data4 <= # MXR1 d4r;
		3'b101: data4 <= # MXR1 d5rnk2;
		3'b111: data4 <= # MXR1 d4r;
		default:  data4 <= # MXR1 d6rnk2;
		endcase
	end
always @ (sel5_6 or d5r or d6rnk2 or SHIFTIN1)
	begin
		casex (sel5_6)
		4'b1000: data5 <= # MXR1 SHIFTIN1;
		4'b1010: data5 <= # MXR1 d5r;
		4'b1001: data5 <= # MXR1 d6rnk2;
		4'b1011: data5 <= # MXR1 d5r;
		4'b1100: data5 <= # MXR1 1'b0;
		4'b1110: data5 <= # MXR1 d5r;
		4'b1101: data5 <= # MXR1 d6rnk2;
		4'b1111: data5 <= # MXR1 d5r;
		default: data5 <= # MXR1 SHIFTIN1;
		endcase
	end
always @ (sel5_6 or D6 or d6r or SHIFTIN1 or SHIFTIN2)
	begin
		casex (sel5_6)
		4'b1000: data6 <= # MXR1 SHIFTIN2;
		4'b1010: data6 <= # MXR1 d6r;
		4'b1001: data6 <= # MXR1 SHIFTIN1;
		4'b1011: data6 <= # MXR1 d6r;
		4'b1100: data6 <= # MXR1 1'b0;
		4'b1110: data6 <= # MXR1 d6r;
		4'b1101: data6 <= # MXR1 1'b0;
		4'b1111: data6 <= # MXR1 d6r;
		default: data6 <= # MXR1 SHIFTIN2;
		endcase
	end
// instantiate programmable load generator
plg_oserdese1_vlog ldgen (.c23(c23), .c45(c45), .c67(c67), .sel(sel),
			.clk(C), .clkdiv(CLKDIV), .rst(SR),
		.load(loadint), .IOCLK_GLITCH(IOCLK_GLITCH));
// Set value of counter in programmable load generator
always @ (plgcnt or c23 or c45 or c67 or sel)
begin
	casex (plgcnt)
	5'b00100: begin c23=1'b0; c45=1'b0; c67=1'b0; sel=2'b00; end
	5'b00110: begin c23=1'b1; c45=1'b0; c67=1'b0; sel=2'b00; end
	5'b01000: begin c23=1'b0; c45=1'b0; c67=1'b0; sel=2'b01; end
	5'b01010: begin c23=1'b0; c45=1'b1; c67=1'b0; sel=2'b01; end
	5'b10010: begin c23=1'b0; c45=1'b0; c67=1'b0; sel=2'b00; end
	5'b10011: begin c23=1'b1; c45=1'b0; c67=1'b0; sel=2'b00; end
	5'b10100: begin c23=1'b0; c45=1'b0; c67=1'b0; sel=2'b01; end
	5'b10101: begin c23=1'b0; c45=1'b1; c67=1'b0; sel=2'b01; end
	5'b10110: begin c23=1'b0; c45=1'b0; c67=1'b0; sel=2'b10; end
	5'b10111: begin c23=1'b0; c45=1'b0; c67=1'b1; sel=2'b10; end
	5'b11000: begin c23=1'b0; c45=1'b0; c67=1'b0; sel=2'b11; end
	default: $display("DATA_WIDTH %b and DATA_RATE_OQ %b at %t is an illegal value", DATA_WIDTH, DATA_RATE_OQ, $time);
	endcase
end
endmodule