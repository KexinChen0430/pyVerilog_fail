module uart_tx #(
	parameter BAUDRATE = `B9600  //-- Default baudrate
)(
	input  wire clk,        //-- System clcok (12 MHz in the ICEstick)
	input  wire rstn,       //-- Reset  (Active low)
	input  wire start,      //-- Set to 1 for starting the transmission
	input  wire [7:0] data, //-- Byte to transmit
	output reg tx,          //-- Serial data output
	output reg ready        //-- Transmitter ready (1) / busy (0)
);
wire clk_baud;
reg [3:0] bitc;
reg [7:0] data_r;
reg load;    //-- Load the shifter register / reset
reg baud_en; //-- Enable the baud generator
localparam IDLE  = 0;  //-- Idle state
localparam START = 1;  //-- Start transmission
localparam TRANS = 2;  //-- Transmitting data
reg [1:0] state;
reg [1:0] next_state;
always @(posedge clk or negedge rstn)
	if (!rstn)
		state <= IDLE;
	else
		state <= next_state;
always @(*) begin
	//-- Default values
	next_state = state;      //-- Stay in the same state by default
	load = 0;
	baud_en = 0;
	case (state)
		//-- Idle state
		//-- Remain in this state until start is 1
		IDLE: begin
			ready = 1;
			if (start == 1)
				next_state = START;
		end
		//-- 1 cycle long
		//-- turn on the baudrate generator and the load the shift register
		START: begin
			load = 1;
			baud_en = 1;
			ready = 0;
			next_state = TRANS;
		end
		//-- Stay here until all the bits have been sent
		TRANS: begin
			baud_en = 1;
			ready = 0;
			if (bitc == 11)
				next_state = IDLE;
		end
		default:
			ready = 0;
	endcase
end
always @(posedge clk or negedge rstn)
	if (!rstn)
		data_r <= 0;
	else
		if (start == 1 && state == IDLE)
			data_r <= data;
reg [9:0] shifter;
always @(posedge clk or negedge rstn)
	//-- Reset
	if (!rstn)
		shifter <= 10'b11_1111_1111;
	//-- Load mode
	else if (load == 1)
		shifter <= {data_r,2'b01};
	//-- Shift mode
	else if (load == 0 && clk_baud == 1)
		shifter <= {1'b1, shifter[9:1]};
always @(posedge clk or negedge rstn)
	if (!rstn)
		bitc <= 0;
	else if (load == 1)
		bitc <= 0;
	else if (load == 0 && clk_baud == 1)
		bitc <= bitc + 1;
always @(posedge clk or negedge rstn)
	if (!rstn)
		tx <= 0;
	else
		tx <= shifter[0];
baudgen_tx #(.BAUDRATE(BAUDRATE)) BAUD0 (
	.rstn(rstn),
	.clk(clk),
	.clk_ena(baud_en),
	.clk_out(clk_baud)
);
endmodule