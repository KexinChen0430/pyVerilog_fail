module SRAMInterface
#(
	// chip-related
	parameter bus_period_ns=7,	// 150MHz
	parameter access_time_ns=20,
	parameter ready_timer_bits=8,
	parameter word_length=16,
	parameter address_width=18,
	// bus-related
	parameter bus_width=32,
	parameter bus_max_devices=16,
	parameter bus_buffer_size=32,
	parameter device_id=1
)
(
	// bus side
	input clk,
	inout [bus_width-1:0] bus_data,
	inout [bus_max_devices-1:0] bus_receiver,
	inout [bus_max_devices-1:0] bus_write_request,
	inout [bus_max_devices-1:0] bus_buffer_full,
	input [bus_max_devices-1:0] bus_voice,
	// ram chip side
	output reg [address_width-1:0] chip_address_lines,
	inout [word_length-1:0] chip_data_lines,
	output reg chip_disable,	// "enable" in datasheet, inverted input
	output reg write_disable,
	output reg byte_low_disable,
	output reg byte_high_disable,
	output reg output_disable
);
	specparam tick_access_time=access_time_ns/bus_period_ns;
	wire [bus_width-1:0]		bus_in;
	wire [bus_max_devices-1:0]	bus_source;
	wire [bus_width-1:0]		bus_out;
	reg [bus_max_devices-1:0]	bus_target;	// yup, reg - I'll need this
	wire bus_next;					// read next from FIFO
	wire bus_send;
	wire bus_input_empty;
	wire bus_input_full;
	wire bus_output_empty;
	wire bus_output_full;
	BusClient
	#(
		.bus_width(bus_width),
		.bus_max_devices(bus_max_devices),
		.bus_buffer_size(bus_buffer_size),
		.device_id(device_id)
	) bus_client
	(
		clk,
		bus_data,
		bus_receiver,
		bus_write_request,
		bus_buffer_full,
		bus_voice,
		bus_in,
		bus_source,
		bus_out,
		bus_target,
		bus_next,
		bus_send,
		bus_input_empty,
		bus_input_full,
		bus_output_empty,
		bus_output_full
	);
	// Huh, looks like we need some kind of device protocol.
	// Let's say that first 2 LSB's of data on bus indicates action: one of
	// these in SRAMMode, next N bits are address, and depending on
	// action, there can also be 8 bits of data to write.
	// |AC|		ADDR		       |	DATA   |
	// 0..2..4..6..8..10..12..14..16..18..20..22..24..26..28..30..32
	// LSB								MSB
	wire [1:0] action=bus_in[0+:2];					// TODO is it the correct notation for LSB==0?
	wire [address_width-1:0] address=bus_in[2+:address_width];	// TODO read/write word length
	wire [7:0] data=bus_in[address_width+2+:8];
	assign bus_out[0+:word_length]=chip_data_lines;
	assign bus_out[word_length+:address_width]=chip_address_lines;
	reg [ready_timer_bits-1:0] ready_timer=0;
	SRAMState state=ready;
	always @(negedge clk) begin
		if (state==ready) begin
			bus_send<=0;
			bus_next<=0;
			if (~bus_input_empty) begin
				state<=busy;
				bus_target<=bus_source;		// bus_target is reg
				case (SRAMMode'(action))
					read: begin
						chip_address_lines<=address;
							chip_read;
						ready_timer<=tick_access_time;
					end
					write: begin
						chip_address_lines<=address;
						chip_data_lines<=data;
						chip_write;
							ready_timer<=tick_access_time;
					end
					highz: chip_highz;
				endcase
			end
		end
		else if (state==busy) begin
			if (~ready_timer) begin
				bus_send<=1;
				bus_next<=1; //	get another request
				state<=ready;
			end
			else begin
				ready_timer<=ready_timer-1;
			end
		end
	end
	task chip_highz;
		chip_disable<=1;
		write_disable<=1;
		byte_low_disable<=1;
		byte_high_disable<=1;
		output_disable<=1;
	endtask
	task chip_read;
		chip_disable<=0;
		write_disable<=1;
		byte_low_disable<=0;
		byte_high_disable<=0;
		output_disable<=0;
	endtask
	task chip_write;
		chip_disable<=0;
		write_disable<=0;
		byte_low_disable<=0;
		byte_high_disable<=0;
		// probably don't care
		//output_disable<=0;
	endtask
endmodule