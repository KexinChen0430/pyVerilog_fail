module tx_port_monitor_128 #(
	parameter C_DATA_WIDTH = 9'd128,
	parameter C_FIFO_DEPTH = 512,
	// Local parameters
	parameter C_FIFO_DEPTH_THRESH = (C_FIFO_DEPTH - 4),
	parameter C_FIFO_DEPTH_WIDTH = clog2((2**clog2(C_FIFO_DEPTH))+1),
	parameter C_VALID_HIST = 1
)
(
	input RST,
	input CLK,
	input [C_DATA_WIDTH:0] EVT_DATA,			// Event data from tx_port_channel_gate
	input EVT_DATA_EMPTY,						// Event data FIFO is empty
	output EVT_DATA_RD_EN,						// Event data FIFO read enable
	output [C_DATA_WIDTH-1:0] WR_DATA,			// Output data
	output WR_EN,								// Write enable for output data
	input [C_FIFO_DEPTH_WIDTH-1:0] WR_COUNT,	// Output FIFO count
	output TXN,									// Transaction parameters are valid
	input ACK,									// Transaction parameter read, continue
	output LAST,								// Channel last write
	output [31:0] LEN,							// Channel write length (in 32 bit words)
	output [30:0] OFF,							// Channel write offset
	output [31:0] WORDS_RECVD,					// Count of data words received in transaction
	output DONE,								// Transaction is closed
	input TX_ERR								// Transaction encountered an error
);
`include "functions.vh"
(* syn_encoding = "user" *)
(* fsm_encoding = "user" *)
reg 	[5:0]				rState=`S_TXPORTMON128_NEXT, _rState=`S_TXPORTMON128_NEXT;
reg 						rRead=0, _rRead=0;
reg 	[C_VALID_HIST-1:0]	rDataValid={C_VALID_HIST{1'd0}}, _rDataValid={C_VALID_HIST{1'd0}};
reg 						rEvent=0, _rEvent=0;
reg 	[63:0]				rReadData=64'd0, _rReadData=64'd0;
reg 	[31:0]				rWordsRecvd=0, _rWordsRecvd=0;
reg 	[31:0]				rWordsRecvdAdv=0, _rWordsRecvdAdv=0;
reg 						rAlmostAllRecvd=0, _rAlmostAllRecvd=0;
reg 						rAlmostFull=0, _rAlmostFull=0;
reg 						rLenEQ0Hi=0, _rLenEQ0Hi=0;
reg 						rLenEQ0Lo=0, _rLenEQ0Lo=0;
reg 						rLenLE4Lo=0, _rLenLE4Lo=0;
reg							rTxErr=0, _rTxErr=0;
wire wEventData = (rDataValid[0] & EVT_DATA[C_DATA_WIDTH]);
wire wPayloadData = (rDataValid[0] & !EVT_DATA[C_DATA_WIDTH] & rState[3]); // S_TXPORTMON128_READ
wire wAllWordsRecvd = ((rAlmostAllRecvd | (rLenEQ0Hi & rLenLE4Lo)) & wPayloadData);
assign EVT_DATA_RD_EN = rRead;
assign WR_DATA = EVT_DATA[C_DATA_WIDTH-1:0];
assign WR_EN = wPayloadData; // S_TXPORTMON128_READ
assign TXN = rState[2]; // S_TXPORTMON128_TXN
assign LAST = rReadData[0];
assign OFF = rReadData[31:1];
assign LEN = rReadData[63:32];
assign WORDS_RECVD = rWordsRecvd;
assign DONE = !rState[3]; // !S_TXPORTMON128_READ
// Buffer the input signals that come from outside the tx_port.
always @ (posedge CLK) begin
	rTxErr <= #1 (RST ? 1'd0 : _rTxErr);
end
always @ (*) begin
	_rTxErr = TX_ERR;
end
// Transaction monitoring FSM.
always @ (posedge CLK) begin
	rState <= #1 (RST ? `S_TXPORTMON128_NEXT : _rState);
end
always @ (*) begin
	_rState = rState;
	case (rState)
	`S_TXPORTMON128_NEXT: begin // Read, wait for start of transaction event
		if (rEvent)
			_rState = `S_TXPORTMON128_EVT_2;
	end
	`S_TXPORTMON128_EVT_2: begin // Read, wait for start of transaction event
		if (rEvent)
			_rState = `S_TXPORTMON128_TXN;
	end
	`S_TXPORTMON128_TXN: begin // Don't read, wait until transaction has been acknowledged
		if (ACK)
			_rState = ((rLenEQ0Hi && rLenEQ0Lo) ? `S_TXPORTMON128_END_0 : `S_TXPORTMON128_READ);
	end
	`S_TXPORTMON128_READ: begin // Continue reading, wait for end of transaction event or all expected data
		if (rEvent)
			_rState = `S_TXPORTMON128_END_1;
		else if (wAllWordsRecvd | rTxErr)
			_rState = `S_TXPORTMON128_END_0;
	end
	`S_TXPORTMON128_END_0: begin // Continue reading, wait for first end of transaction event
		if (rEvent)
			_rState = `S_TXPORTMON128_END_1;
	end
	`S_TXPORTMON128_END_1: begin // Continue reading, wait for second end of transaction event
		if (rEvent)
			_rState = `S_TXPORTMON128_NEXT;
	end
	default: begin
		_rState = `S_TXPORTMON128_NEXT;
	end
	endcase
end
// Manage reading from the FIFO and tracking amounts read.
always @ (posedge CLK) begin
	rRead <= #1 (RST ? 1'd0 : _rRead);
	rDataValid <= #1 (RST ? {C_VALID_HIST{1'd0}} : _rDataValid);
	rEvent <= #1 (RST ? 1'd0 : _rEvent);
	rReadData <= #1 _rReadData;
	rWordsRecvd <= #1 _rWordsRecvd;
	rWordsRecvdAdv <= #1 _rWordsRecvdAdv;
	rAlmostAllRecvd <= #1 _rAlmostAllRecvd;
	rAlmostFull <= #1 _rAlmostFull;
	rLenEQ0Hi <= #1 _rLenEQ0Hi;
	rLenEQ0Lo <= #1 _rLenEQ0Lo;
	rLenLE4Lo <= #1 _rLenLE4Lo;
end
always @ (*) begin
	// Don't get to the full point in the output FIFO
	_rAlmostFull = (WR_COUNT >= C_FIFO_DEPTH_THRESH);
	// Track read history so we know when data is valid
	_rDataValid = ((rDataValid<<1) | (rRead & !EVT_DATA_EMPTY));
	// Read until we get a (valid) event
	_rRead = (!rState[2] & !(rState[1] & rEvent) & !wEventData & !rAlmostFull); // !S_TXPORTMON128_TXN
	// Track detected events
	_rEvent = wEventData;
	// Save event data when valid
	if (wEventData)
		_rReadData = EVT_DATA[63:0];
	else
		_rReadData = rReadData;
	// If LEN == 0, we don't want to send any data to the output
	_rLenEQ0Hi = (LEN[31:16] == 16'd0);
	_rLenEQ0Lo = (LEN[15:0] == 16'd0);
	// If LEN <= 4, we want to trigger the almost all received flag
	_rLenLE4Lo = (LEN[15:0] <= 16'd4);
	// Count received non-event data
	_rWordsRecvd = (ACK ? 0 : rWordsRecvd + (wPayloadData<<2));
	_rWordsRecvdAdv = (ACK ? 2*(C_DATA_WIDTH/32) : rWordsRecvdAdv + (wPayloadData<<2));
	_rAlmostAllRecvd = ((rWordsRecvdAdv >= LEN) && wPayloadData);
end
endmodule