module baudgen(wren, rden, reset, din, clk, sclr, baud, dout);
//input wren, rden, reset, clk, sclr;
//input [7:0] din;
//output baud;
//output [7:0] dout;
baudgen #(.PERIOD(PERIOD)) baud1(
	.wren		(wr_baud),
	.rden		(rd_baud),
	.reset	(reset),
	.din		(din),
	.clk		(clk),
	.stop		(stop),
	.baud		(baud),
	.dout		(dout_baud)
);
//fifo ipcore
//input clk;
//input srst;
//input [8 : 0] din;
//input wr_en;
//input rd_en;
//output [8 : 0] dout;
//output full;
//output empty;
fifo_rx fifo1(
  .clk 		(clk),
  .srst		(hold),
  .din		(frame_error),
  .wr_en		(wr_fifo),
  .rd_en		(rd_fifo),
  .dout		(dout_fifo),
  .full		(full),
  .empty		(empty)
);
// input flip flops
always @(posedge clk) begin
	//first flip flop
	in_one <= rxin;
	//second flip flop
	in_two <= in_one;
end
// shift register
always @(posedge clk or posedge reset) begin
	if(reset) begin
		shift <= 10'b1111111111;
		load = 0;
	end
	else begin
		if(ld_shift) begin
			shift <= {in_two, shift[9:1]};
			load = 1;
		end
		else
			load = 0;
	end
end
// loaded flag
always @(negedge clk or posedge reset) begin
	if(reset) begin
		loaded = 0;
	end
	else begin
		if(load)
			loaded = 1;
		if(clr_load)
			loaded = 0;
	end
end
// frame check
always @(posedge clk or posedge reset) begin
	if(reset) begin
		frame_error <= 8'b00000000;
		frame_ready <= 0;
	end
	else begin
		if(rd_shift)begin
			frame_error[7:0] <= shift[8:1];
			if(`START | ~`STOP)
				`ERROR <= 1;
			else
				`ERROR <= 0;
			frame_ready <= 1;
		end
		else
			frame_ready <= 0;
	end
end
//address write
always @* begin
	wr_baud = 0;
	wr_control = 0;
	case(addr)
		`period: begin
			if(wren)
				wr_baud = 1;
			end
		`control: begin
			if(wren)
				wr_control = 1;
			end
	endcase
end
//address read
always @* begin
	rd_baud = 0;
	rd_fifo = 0;
	dout = 9'b000000000;
	case(addr)
		`period: begin
			if(rden)
				rd_baud = 1;
				dout = dout_baud;
			end
		`rx_reg: begin
			if(rden)
				rd_fifo = 1;
				dout = dout_fifo;
			end
		`control: begin
			if(rden)
				dout = control;
			end
	endcase
end
// control register
always @(posedge clk or posedge reset) begin
	if(reset)
		control[7:0] <= 8'b00000000;
	else begin
		`DATARDY <= ~empty;
		if(wr_control)
			control[0] <= din[0];
		if(frame_ready & full)
			`OVERRUN <= 1;
		if(~`RXEN) begin
			`DATARDY <= 0;
			`OVERRUN <= 0;
		end
	end
end
// bittimer
always @(posedge baud or posedge reset) begin
	if(reset)
		bittimer <= 4'b0000;
	else begin
		if(bittime)
			bittimer <= bittimer + 1;
	end
end
// bitcounter
always @(posedge clk or posedge reset) begin
	if(reset)begin
		bitcounter <= 4'b0000;
		end
	else begin
	if(count)
		bitcounter <= bitcounter + 1;
	if(finish)
		bitcounter <= 4'b0000;
	end
end
// set state during startup.
always @(posedge clk or posedge reset) begin
		if (reset)
			pstate <= `HOLD;
		else begin
			pstate <= nstate;
			if(`OVERRUN)
				pstate <= `RX_NOT_READY;
		end
end
//fsm
always @* begin
	hold = 0;
	ld_shift = 0; clr_load = 0;
	stop = 0; count = 0; finish = 0;
	bittime = 0; rd_shift = 0;  wr_fifo = 0;
	nstate = pstate;
	case (pstate)
		`HOLD:  begin
			hold = 1;
			stop = 1;
			if(`RXEN == 1)
				nstate = `WAIT;
		end
		`WAIT: begin
			stop = 1;
			if(~rxin) begin
				stop = 0;
				nstate = `SHIFT1;
			end
		end
		`SHIFT1: begin
			if(bitcounter == 4'b1010) begin
				nstate = `LD_FIFO;
				finish = 1;
				rd_shift = 1;
			end
			else begin
				if(baud)
					nstate = `SHIFT2;
					bittime = 1;
			end
		end
		`SHIFT2: begin
			bittime = 1;
			if(bittimer == 4'b1000 & ~loaded)
				ld_shift = 1;
			if(~baud & (bittimer == 4'b0000)) begin
				count = 1;
				clr_load = 1;
				nstate = `SHIFT1;
			end
		end
		`LD_FIFO: begin
			wr_fifo = 1;
			nstate = `WAIT;
		end
		`RX_NOT_READY: begin
			if(~`OVERRUN)
				nstate = `HOLD;
		end
	endcase
end
endmodule