module baudgen(wren, rden, reset, din, clk, sclr, baud, dout);
input wren, rden, reset, clk, sclr;
input [7:0] din;
output baud;
output [7:0] dout;
*/
reg [7:0] control, dout;
reg [9:0] shift_out;
reg wr_baud, rd_baud, wr_fifo, rd_fifo, wr_control, txout;
reg ld_shift, stop, count, finish, rd_shift, bittime;
reg [3:0] bittimer, bitcounter;
reg [1:0] nstate, pstate;
parameter PERIOD = 8'h1A;
wire [7:0] to_shift, dout_baud;
wire [9:0] shift;
wire baud, full, empty;
`define period 	3'b000
`define TXreg 		3'b001
`define control 	3'b011
`define WAIT		2'b00
`define SHIFT1		2'b01
`define SHIFT2 	2'b10
`define TXFULL		control[0]
`define TXDONE		control[1]
`define OUT			shift_out[0]
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
fifo fifo1(
  .clk 		(clk),
  .rst		(reset),
  .din		(din),
  .wr_en		(wr_fifo),
  .rd_en		(rd_fifo),
  .dout		(to_shift),
  .full		(full),
  .empty		(empty)
);
// assign shift_in
assign shift = ({1'b1, to_shift, 1'b0});
txout = shift_out[0];
// shift register
always @(posedge clk or posedge reset) begin
	if(reset)
		shift_out <= 10'b1111111111;
	else begin
		if (rd_shift)begin
			shift_out <= {1'b1, shift_out[9:1]};
		end
		if (ld_shift)
			shift_out <= shift;
	end
end
// control register
always @(posedge clk or posedge reset) begin
	if(reset) begin
		control[7:0] = 8'b00000001;
	end
	else begin
		`TXFULL = full;
		if(finish)
			`TXDONE = 1;
		if(wr_control)
			`TXDONE = 0;
	end
end
// address mux logic
always @* begin
	wr_baud = 0;
	wr_fifo = 0; wr_control = 0;
	case(addr)
		`period: begin
			if(wren)
				wr_baud = 1;
			end
		`TXreg: begin
			if(wren)
				wr_fifo = 1;
			end
		`control: begin
			if(wren)
				wr_control = 1;
			end
	endcase
end
// out mux
always @* begin
	rd_baud = 0;
	dout = 8'b00000000;
	case(addr)
		`period: begin
			if(rden)
				rd_baud = 1;
				dout = dout_baud;
			end
		`control: begin
			if(rden)
				dout = control;
			end
	endcase
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
    	  pstate <= `WAIT;
	  else
		  pstate <= nstate;
end
// fsm
always @* begin
	rd_fifo = 0; ld_shift = 0;
	stop = 0; count = 0; finish = 0;
	bittime = 0; rd_shift = 0;
	nstate = pstate;
	case (pstate)
	  `WAIT:  begin
			stop = 1;
			if(~empty) begin
				stop = 0;
				rd_fifo = 1;
				ld_shift = 1;
				nstate = `SHIFT1;
				end
			end
	  `SHIFT1: begin
			if(bitcounter == 4'b1010) begin
				nstate = `WAIT;
				finish = 1;
				end
			else begin
				if(baud)
					nstate = `SHIFT2;
					bittime = 1;
				end
			end
	  `SHIFT2: begin
			bittime = 1;
			if(~baud & (bittimer == 4'b0000)) begin
				count = 1;
				rd_shift = 1;
				nstate = `SHIFT1;
				end
			end
	endcase
end
endmodule