module tx_multiplexer_64
    #(
      parameter C_PCI_DATA_WIDTH = 128,
      parameter C_NUM_CHNL = 12,
      parameter C_TAG_WIDTH = 5,                             // Number of outstanding requests
      parameter C_VENDOR = "ALTERA"
      )
    (
     input                                     CLK,
     input                                     RST_IN,
     input [C_NUM_CHNL-1:0]                    WR_REQ, // Write request
     input [(C_NUM_CHNL*`SIG_ADDR_W)-1:0]      WR_ADDR, // Write address
     input [(C_NUM_CHNL*`SIG_LEN_W)-1:0]       WR_LEN, // Write data length
     input [(C_NUM_CHNL*C_PCI_DATA_WIDTH)-1:0] WR_DATA, // Write data
     output [C_NUM_CHNL-1:0]                   WR_DATA_REN, // Write data read enable
     output [C_NUM_CHNL-1:0]                   WR_ACK, // Write request has been accepted
     input [C_NUM_CHNL-1:0]                    RD_REQ, // Read request
     input [(C_NUM_CHNL*2)-1:0]                RD_SG_CHNL, // Read request channel for scatter gather lists
     input [(C_NUM_CHNL*`SIG_ADDR_W)-1:0]      RD_ADDR, // Read request address
     input [(C_NUM_CHNL*`SIG_LEN_W)-1:0]       RD_LEN, // Read request length
     output [C_NUM_CHNL-1:0]                   RD_ACK, // Read request has been accepted
     output [5:0]                              INT_TAG, // Internal tag to exchange with external
     output                                    INT_TAG_VALID, // High to signal tag exchange
     input [C_TAG_WIDTH-1:0]                   EXT_TAG, // External tag to provide in exchange for internal tag
     input                                     EXT_TAG_VALID, // High to signal external tag is valid
     output                                    TX_ENG_RD_REQ_SENT, // Read completion request issued
     input                                     RXBUF_SPACE_AVAIL,
     // Interface: TXR Engine
     output                                    TXR_DATA_VALID,
     output [C_PCI_DATA_WIDTH-1:0]             TXR_DATA,
     output                                    TXR_DATA_START_FLAG,
     output [clog2s(C_PCI_DATA_WIDTH/32)-1:0]  TXR_DATA_START_OFFSET,
     output                                    TXR_DATA_END_FLAG,
     output [clog2s(C_PCI_DATA_WIDTH/32)-1:0]  TXR_DATA_END_OFFSET,
     input                                     TXR_DATA_READY,
     output                                    TXR_META_VALID,
     output [`SIG_FBE_W-1:0]                   TXR_META_FDWBE,
     output [`SIG_LBE_W-1:0]                   TXR_META_LDWBE,
     output [`SIG_ADDR_W-1:0]                  TXR_META_ADDR,
     output [`SIG_LEN_W-1:0]                   TXR_META_LENGTH,
     output [`SIG_TAG_W-1:0]                   TXR_META_TAG,
     output [`SIG_TC_W-1:0]                    TXR_META_TC,
     output [`SIG_ATTR_W-1:0]                  TXR_META_ATTR,
     output [`SIG_TYPE_W-1:0]                  TXR_META_TYPE,
     output                                    TXR_META_EP,
     input                                     TXR_META_READY);
`include "functions.vh"
    localparam C_DATA_DELAY = 6'd6; // Delays read/write params to accommodate tx_port_buffer delay and tx_engine_formatter delay.
    (* syn_encoding = "user" *)
    (* fsm_encoding = "user" *)
    reg [3:0]                                  rMainState=`S_TXENGUPR64_MAIN_IDLE, _rMainState=`S_TXENGUPR64_MAIN_IDLE;
    reg                                        rCountIsWr=0, _rCountIsWr=0;
    reg [3:0]                                  rCountChnl=0, _rCountChnl=0;
    reg [C_TAG_WIDTH-1:0]                      rCountTag=0, _rCountTag=0;
    reg [9:0]                                  rCount=0, _rCount=0;
    reg                                        rCountDone=0, _rCountDone=0;
    reg                                        rCountValid=0,_rCountValid=0;
    reg                                        rCountStart=0, _rCountStart=0;
    reg                                        rCountOdd32=0, _rCountOdd32=0;
    reg [9:0]                                  rCountLen=0, _rCountLen=0;
    reg [C_NUM_CHNL-1:0]                       rWrDataRen=0, _rWrDataRen=0;
    reg                                        rTxEngRdReqAck, _rTxEngRdReqAck;
    wire                                       wRdReq;
    wire [3:0]                                 wRdReqChnl;
    wire                                       wWrReq;
    wire [3:0]                                 wWrReqChnl;
    wire                                       wRdAck;
    wire [3:0]                                 wCountChnl;
    wire [11:0]                                wCountChnlShiftDW = (wCountChnl*C_PCI_DATA_WIDTH); // Mult can exceed 9 bits, so make this a wire
    wire [63:0]                                wRdAddr;
    wire [9:0]                                 wRdLen;
    wire [1:0]                                 wRdSgChnl;
    wire [63:0]                                wWrAddr;
    wire [9:0]                                 wWrLen;
    wire [C_PCI_DATA_WIDTH-1:0]                wWrData;
    reg [3:0]                                  rRdChnl=0, _rRdChnl=0;
    reg [61:0]                                 rRdAddr=62'd0, _rRdAddr=62'd0;
    reg [9:0]                                  rRdLen=0, _rRdLen=0;
    reg [1:0]                                  rRdSgChnl=0, _rRdSgChnl=0;
    reg [3:0]                                  rWrChnl=0, _rWrChnl=0;
    reg [61:0]                                 rWrAddr=62'd0, _rWrAddr=62'd0;
    reg [9:0]                                  rWrLen=0, _rWrLen=0;
    reg [C_PCI_DATA_WIDTH-1:0]                 rWrData={C_PCI_DATA_WIDTH{1'd0}}, _rWrData={C_PCI_DATA_WIDTH{1'd0}};
    assign wRdAddr = RD_ADDR[wRdReqChnl * `SIG_ADDR_W +: `SIG_ADDR_W];
    assign wRdLen = RD_LEN[wRdReqChnl * `SIG_LEN_W +: `SIG_LEN_W];
    assign wRdSgChnl = RD_SG_CHNL[wRdReqChnl * 2 +: 2];
    assign wWrAddr = WR_ADDR[wWrReqChnl * `SIG_ADDR_W +: `SIG_ADDR_W];
    assign wWrLen = WR_LEN[wWrReqChnl * `SIG_LEN_W +: `SIG_LEN_W];
    assign wWrData = WR_DATA[wCountChnl * C_PCI_DATA_WIDTH +: C_PCI_DATA_WIDTH];
    (* syn_encoding = "user" *)
    (* fsm_encoding = "user" *)
    reg		[3:0]						rCapState=`S_TXENGUPR64_CAP_RD_WR, _rCapState=`S_TXENGUPR64_CAP_RD_WR;
    reg [C_NUM_CHNL-1:0]                rRdAck=0, _rRdAck=0;
    reg [C_NUM_CHNL-1:0]                rWrAck=0, _rWrAck=0;
    reg 								rIsWr=0, _rIsWr=0;
    reg [5:0]                           rCapChnl=0, _rCapChnl=0;
    reg [61:0]                          rCapAddr=62'd0, _rCapAddr=62'd0;
    reg 								rCapAddr64=0, _rCapAddr64=0;
    reg [9:0]                           rCapLen=0, _rCapLen=0;
    reg 								rCapIsWr=0, _rCapIsWr=0;
    reg 								rExtTagReq=0, _rExtTagReq=0;
    reg [C_TAG_WIDTH-1:0]               rExtTag=0, _rExtTag=0;
    reg [C_DATA_DELAY-1:0]              rWnR=0, _rWnR=0;
    reg [(C_DATA_DELAY*4)-1:0]          rChnl=0, _rChnl=0;
    reg [(C_DATA_DELAY*8)-1:0]          rTag=0, _rTag=0;
    reg [(C_DATA_DELAY*62)-1:0]         rAddr=0, _rAddr=0;
    reg [((C_DATA_DELAY+1)*10)-1:0]     rLen=0, _rLen=0;
    reg [C_DATA_DELAY-1:0]              rValid=0, _rValid=0;
    reg [C_DATA_DELAY-1:0]              rDone=0, _rDone=0;
    reg [C_DATA_DELAY-1:0]              rStart=0, _rStart=0;
    assign WR_DATA_REN = rWrDataRen;
    assign WR_ACK = rWrAck;
    assign RD_ACK = rRdAck;
    assign INT_TAG = {rRdSgChnl, rRdChnl};
    assign INT_TAG_VALID = rExtTagReq;
    assign TX_ENG_RD_REQ_SENT = rTxEngRdReqAck;
    assign wRdAck = (wRdReq & EXT_TAG_VALID & RXBUF_SPACE_AVAIL);
    // Search for the next request so that we can move onto it immediately after
    // the current channel has released its request.
    tx_engine_selector #(.C_NUM_CHNL(C_NUM_CHNL)) selRd (.RST(RST_IN), .CLK(CLK), .REQ_ALL(RD_REQ), .REQ(wRdReq), .CHNL(wRdReqChnl));
    tx_engine_selector #(.C_NUM_CHNL(C_NUM_CHNL)) selWr (.RST(RST_IN), .CLK(CLK), .REQ_ALL(WR_REQ), .REQ(wWrReq), .CHNL(wWrReqChnl));
    // Buffer shift-selected channel request signals and FIFO data.
    always @ (posedge CLK) begin
        rRdChnl <= #1 _rRdChnl;
        rRdAddr <= #1 _rRdAddr;
        rRdLen <= #1 _rRdLen;
        rRdSgChnl <= #1 _rRdSgChnl;
        rWrChnl <= #1 _rWrChnl;
        rWrAddr <= #1 _rWrAddr;
        rWrLen <= #1 _rWrLen;
        rWrData <= #1 _rWrData;
    end
    always @ (*) begin
        _rRdChnl = wRdReqChnl;
        _rRdAddr = wRdAddr[63:2];
        _rRdLen = wRdLen;
        _rRdSgChnl = wRdSgChnl;
        _rWrChnl = wWrReqChnl;
        _rWrAddr = wWrAddr[63:2];
        _rWrLen = wWrLen;
        _rWrData = wWrData;
    end
    // Accept requests when the selector indicates. Capture the buffered
    // request parameters for hand-off to the formatting pipeline. Then
    // acknowledge the receipt to the channel so it can deassert the
    // request, and let the selector choose another channel.
    always @ (posedge CLK) begin
        rCapState <= #1 (RST_IN ? `S_TXENGUPR64_CAP_RD_WR : _rCapState);
        rRdAck <= #1 (RST_IN ? {C_NUM_CHNL{1'd0}} : _rRdAck);
        rWrAck <= #1 (RST_IN ? {C_NUM_CHNL{1'd0}} : _rWrAck);
        rIsWr <= #1 _rIsWr;
        rCapChnl <= #1 _rCapChnl;
        rCapAddr <= #1 _rCapAddr;
        rCapAddr64 <= #1 _rCapAddr64;
        rCapLen <= #1 _rCapLen;
        rCapIsWr <= #1 _rCapIsWr;
        rExtTagReq <= #1 _rExtTagReq;
        rExtTag <= #1 _rExtTag;
        rTxEngRdReqAck <= #1 _rTxEngRdReqAck;
    end
    always @ (*) begin
        _rCapState = rCapState;
        _rRdAck = rRdAck;
        _rWrAck = rWrAck;
        _rIsWr = rIsWr;
        _rCapChnl = rCapChnl;
        _rCapAddr = rCapAddr;
        _rCapAddr64 = (rCapAddr[61:30] != 0);
        _rCapLen = rCapLen;
        _rCapIsWr = rCapIsWr;
        _rExtTagReq = rExtTagReq;
        _rExtTag = rExtTag;
        _rTxEngRdReqAck = rTxEngRdReqAck;
        case (rCapState)
	        `S_TXENGUPR64_CAP_RD_WR : begin
	            _rIsWr = !wRdReq;
	            _rRdAck = (wRdAck<<wRdReqChnl);
	            _rTxEngRdReqAck = wRdAck;
	            _rExtTagReq = wRdAck;
	            _rCapState = (wRdAck ? `S_TXENGUPR64_CAP_CAP : `S_TXENGUPR64_CAP_WR_RD);
	        end
	        `S_TXENGUPR64_CAP_WR_RD : begin
	            _rIsWr = wWrReq;
	            _rWrAck = (wWrReq<<wWrReqChnl);
	            _rCapState = (wWrReq ? `S_TXENGUPR64_CAP_CAP : `S_TXENGUPR64_CAP_RD_WR);
	        end
	        `S_TXENGUPR64_CAP_CAP : begin
	            _rTxEngRdReqAck = 0;
	            _rRdAck = 0;
	            _rWrAck = 0;
	            _rCapIsWr = rIsWr;
	            _rExtTagReq = 0;
	            _rExtTag = EXT_TAG;
	            if (rIsWr) begin
	                _rCapChnl = {2'd0, rWrChnl};
	                _rCapAddr = rWrAddr;
	                _rCapLen = rWrLen;
	            end
	            else begin
	                _rCapChnl = {rRdSgChnl, rRdChnl};
	                _rCapAddr = rRdAddr;
	                _rCapLen = rRdLen;
	            end
	            _rCapState = `S_TXENGUPR64_CAP_REL;
	        end
	        `S_TXENGUPR64_CAP_REL : begin
	            // Push into the formatting pipeline when ready
	            if (TXR_META_READY & rMainState[0]) // S_TXENGUPR64_MAIN_IDLE
	                _rCapState = (`S_TXENGUPR64_CAP_WR_RD>>(rCapIsWr)); // Changes to S_TXENGUPR64_CAP_RD_WR
	        end
	        default : begin
	            _rCapState = `S_TXENGUPR64_CAP_RD_WR;
	        end
        endcase
    end
    // Start the read/write when space is available in the output FIFO and when
    // request parameters have been captured (i.e. a pending request).
    always @ (posedge CLK) begin
        rMainState <= #1 (RST_IN ? `S_TXENGUPR64_MAIN_IDLE : _rMainState);
        rCountIsWr <= #1 _rCountIsWr;
        rCountLen <= #1 _rCountLen;
        rCount <= #1 _rCount;
        rCountDone <= #1 _rCountDone;
        rCountStart <= #1 _rCountStart;
        rCountChnl <= #1 _rCountChnl;
        rCountTag <= #1 _rCountTag;
        rCountOdd32 <= #1 _rCountOdd32;
        rWrDataRen <= #1 _rWrDataRen;
        rCountValid <= #1 RST_IN ? 0 : _rCountValid;
    end
    always @ (*) begin
        _rMainState = rMainState;
        _rCountIsWr = rCountIsWr;
        _rCount = rCount;
        _rCountLen = rCountLen;
        _rCountDone = rCountDone;
        _rCountStart = rCountStart;
        _rCountChnl = rCountChnl;
        _rCountTag = rCountTag;
        _rCountOdd32 = rCountOdd32;
        _rWrDataRen = rWrDataRen;
        _rCountStart = 0;
        _rCountValid = rCountValid;
        case (rMainState)
	        `S_TXENGUPR64_MAIN_IDLE : begin
                _rCountIsWr = rCapIsWr;
                _rCountLen = rCapLen;
	            _rCount = rCapLen;
	            _rCountDone = (rCapLen <= 2'd2);
	            _rCountChnl = rCapChnl[3:0];
	            _rCountTag = rExtTag;
	            _rCountOdd32 = (rCapLen[0] & ((rCapAddr[61:30] == 0)));
	            _rWrDataRen = ((TXR_META_READY & rCapState[3] & rCapIsWr)<<(rCapChnl[3:0])); // S_TXENGUPR64_CAP_REL
                _rCountStart = (TXR_META_READY & rCapState[3]);
                _rCountValid = TXR_META_READY & rCapState[3];
	            if (TXR_META_READY & rCapState[3]) // S_TXENGUPR64_CAP_REL
	                _rMainState = (`S_TXENGUPR64_MAIN_RD<<(rCapIsWr)); // Change to S_TXENGUPR64_MAIN_WR;
	        end
	        `S_TXENGUPR64_MAIN_RD : begin
	            _rMainState = `S_TXENGUPR64_MAIN_IDLE;
	        end
	        `S_TXENGUPR64_MAIN_WR : begin
	            _rCount = rCount - 2'd2;
	            _rCountDone = (rCount <= 3'd4);
	            if (rCountDone) begin
	                _rWrDataRen = 0;
                    _rCountValid = 0;
	                _rMainState = (rCountOdd32 ? `S_TXENGUPR64_MAIN_IDLE : `S_TXENGUPR64_MAIN_WAIT);
	            end
	        end
	        `S_TXENGUPR64_MAIN_WAIT : begin // Signals request FIFO ren
	            _rMainState = `S_TXENGUPR64_MAIN_IDLE;
	        end
	        default : begin
	            _rMainState = `S_TXENGUPR64_MAIN_IDLE;
	        end
        endcase
    end
    // Shift in the captured parameters and valid signal every cycle.
    // This pipeline will keep the formatter busy.
    assign wCountChnl = rChnl[(C_DATA_DELAY-2)*4 +:4];
    always @ (posedge CLK) begin
        rWnR <= #1 _rWnR;
        rChnl <= #1 _rChnl;
        rTag <= #1 _rTag;
        rAddr <= #1 _rAddr;
        rLen <= #1 _rLen;
        rValid <= #1 _rValid;
        rDone <= #1 _rDone;
        rStart <= #1 _rStart;
    end
    always @ (*) begin
        _rWnR = {rWnR[((C_DATA_DELAY-1)*1)-1:0], rCapIsWr};
        _rAddr = {rAddr[((C_DATA_DELAY-1)*62)-1:0], rCapAddr};
        _rLen = {rLen[((C_DATA_DELAY-1)*10)-1:0], rCountLen};
        _rChnl = {rChnl[((C_DATA_DELAY-1)*4)-1:0], rCountChnl};
        _rTag = {rTag[((C_DATA_DELAY-1)*8)-1:0], (8'd0 | rCountTag)};
        _rValid = {rValid[((C_DATA_DELAY-1)*1)-1:0], rCountValid & rCountIsWr}; // S_TXENGUPR64_MAIN_RD | S_TXENGUPR64_MAIN_WR
        _rDone = {rDone[((C_DATA_DELAY-1)*1)-1:0], rCountDone};
        _rStart = {rStart[((C_DATA_DELAY-1)*1)-1:0], rCountStart};
    end
    assign TXR_DATA = rWrData;
    assign TXR_DATA_VALID = rValid[(C_DATA_DELAY-1)*1 +:1];
    assign TXR_DATA_START_FLAG = rStart[(C_DATA_DELAY-1)*1 +:1];
    assign TXR_DATA_START_OFFSET = 0;
    assign TXR_DATA_END_FLAG = rDone[(C_DATA_DELAY-1)*1 +:1];
    assign TXR_DATA_END_OFFSET = rLen[(C_DATA_DELAY-1)*10 +:`SIG_OFFSET_W] - 1;
    assign TXR_META_VALID = rCountStart;
    assign TXR_META_TYPE = rCapIsWr ? `TRLS_REQ_WR : `TRLS_REQ_RD;
    assign TXR_META_ADDR = {rCapAddr,2'b00};
    assign TXR_META_LENGTH = rCapLen;
    assign TXR_META_LDWBE = rCapLen == 10'd1 ? 0 : 4'b1111; // TODO: This should be retimed
    assign TXR_META_FDWBE = 4'b1111;
    assign TXR_META_TAG = rCountTag;
    assign TXR_META_EP = 1'b0;
    assign TXR_META_ATTR = 3'b110;
    assign TXR_META_TC = 0;
endmodule