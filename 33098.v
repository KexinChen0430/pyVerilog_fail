module will work in master or slave mode for receiving or transmitting data.
// Eg opMode = 0 (slave), opMode = 1 (master) - eg default to fail-safe (zero) - if need default to master, need to initialise this with the CRs.
reg tog_a = 1'b0, tog_b = 1'b0, toggle = 1'b0;
reg [CNT_WIDTH-1:0] ctr = {CNT_WIDTH{1'b0}};
reg synch = 1'b0;
(* IOB = "true", ASYNC_REG = "TRUE" *) reg syncIn_a = 1'b0;
(* ASYNC_REG = "TRUE" *) reg syncIn_b = 1'b0;
reg synch_en_a = 1'b0, synch_en_b = 1'b0;
always @(posedge clk) begin
	synch_en_a <= synch_en;
	synch_en_b <= synch_en_a;
	syncIn_a <= syncIn;
	syncIn_b <= syncIn_a;
	tog_a <= toggle_en;
	tog_b <= tog_a;
	toggle <= tog_a & ~tog_b;
	if (toggle) begin
		ctr <= (ctr == cnt_m) ? {CNT_WIDTH{1'b0}} : ctr + 1'b1;
		if (synch_en_b) begin
			if (ctr == cnt_m) synch <= 1'b1;
			else if (ctr == cnt_n) synch <= 1'b0;
			else synch <= synch;
		end else synch <= 1'b0;
	end else begin
		ctr <= ctr;
		synch <= synch;
	end
	synchroStatusInt <= synch;
	synchroStatusExt <= syncIn_b;
	syncOut <= ~synch; // NB: auxOuts on FONT5A boards use inverting buffers
end
//NB: for synchronising FB on/off between boards, can set ctr_m (and ctr_n) to zero, and wire synch_en to FB on/off.
// Can then XOR FBon/off signal with the input synchroStatusExt to write the new FB status to the readbacks.
//NB: time offset between trigRdy going high and the FB state toggling!!! Could just use the syncroStatusExt directly to deduce FB state!!
// Alternativelym just use the counter based signal to ensure the boards are synchronous!
//assign syncInOut = (opMode) ? synch : 1'bz;
endmodule