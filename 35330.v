module
//sensor_ctl sensor_ctl
//(
//.clk(bus_clk),
//.rst_32(!user_w_write_32_open && !user_r_read_32_open),
//.din_32(user_w_write_32_data),
//.wr_en_32(user_w_write_32_wren),
//.rd_en_32(user_r_read_32_rden),
//.dout_32(user_r_read_32_data),
//.full_32(user_w_write_32_full),
//.empty_32(user_r_read_32_empty),
// .sig(sig),
// .out_data(out_data),
// .led(led)
//);
parameter INIT_32 = 0,
			READY_RCV_32 	= 1,
			RCV_DATA_32 	= 2,
			POSE_32		= 3,
			READY_SND_32	= 4,
			SND_DATA_32	= 5;
// for input fifo
wire [31:0] rcv_data_32;
wire rcv_en_32;
wire data_empty_32;
// for output fifo
wire [31:0] snd_data_32;
wire snd_en_32;
wire data_full_32;
// state register
reg [3:0] state_32;
reg req_sonic_sensor;
wire busy_sonic_sensor;
reg finish_sonic_sensor;
fifo_32x512 input_fifo_32(
	.clk(clk),
	.srst(rst_32),
	.din(din_32),
	.wr_en(wr_en_32),
	.full(full_32),
	.dout(rcv_data_32),
	.rd_en(rcv_en_32),
	.empty(data_empty_32)
	);
fifo_32x512 output_fifo_32(
	.clk(clk),
	.srst(rst_32),
	.din(snd_data_32),
	.wr_en(snd_en_32),
	.full(data_full_32),
	.dout(dout_32),
	.rd_en(rd_en_32),
	.empty(empty_32)
	);
//for 32bit FIFO;
wire [31:0] out_data;
//instance for sonic_sensor
sonic_sensor sonic_sensor
(
.clk(clk),
.rst(rst_32),
.req(req_sonic_sensor),
.busy(busy_sonic_sensor),
.sig(sig),
.out_data(out_data),
.led(led)
);
always @(posedge clk)begin
	if(rst_32)
		state_32 <= 0;
	else
		case (state_32)
			INIT_32: 										state_32 <= READY_RCV_32;
			READY_RCV_32: if(1) 							state_32 <= RCV_DATA_32;
			RCV_DATA_32: 									state_32 <= POSE_32;
			POSE_32:		  if(hs_state == DONE)		state_32 <= READY_SND_32;
			READY_SND_32: if(data_full_32 == 0)		state_32 <= SND_DATA_32;
			SND_DATA_32:									state_32 <= READY_RCV_32;
		endcase
end
assign rcv_en_32 = (state_32 == RCV_DATA_32);
assign snd_en_32 = (state_32 == SND_DATA_32);
/*user assign*/
assign snd_data_32[31:0] = out_data;
reg [3:0] hs_state;
parameter INIT = 0,
			IDLE = 1,
			START = 2,
			PROCESSING = 3,
			DONE = 4;
always @(posedge clk) begin
	if (rst_32) begin
		req_sonic_sensor  <= 0;
		finish_sonic_sensor <= 0;
		hs_state <= 0;
	end
	else
		case (hs_state)
			INIT: hs_state <= IDLE;
			IDLE: hs_state <= START;
			START:begin
				if(busy_sonic_sensor == 0 && state_32 == POSE_32)begin
					req_sonic_sensor <= 1;
					hs_state <= PROCESSING;
				end
			end
			PROCESSING:begin
				req_sonic_sensor <= 0;
				if(busy_sonic_sensor == 0)begin
					hs_state <= DONE;
				end
			end
			DONE: hs_state <= IDLE;
		endcase
end
endmodule