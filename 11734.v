module BusWriter
#(
	parameter bus_width=32,		// compatible with default bus width
	parameter device_id=1		// bit position in bus_voice or bus_receiver, ie. device_id 6 -> sixth bit
)
(
	// bus side
	input clk,
	output [bus_width-1:0] bus_data,
	output [bus_max_devices-1:0] bus_receiver,
	input [bus_max_devices-1:0] bus_buffer_full,
	output [bus_max_devices-1:0] bus_write_request,
	input  [bus_max_devices-1:0] bus_voice,
	// device side
	input [bus_width-1:0] client_data,
	input [bus_max_devices-1:0] client_target_addr,
	input client_enqueue,			// save client_data and client_target_addr in FIFOs
	output client_buffer_empty,		// true, if FIFO empty (all data sent)
	output client_buffer_full		// true, if FIFO full
);
	wire voice=bus_voice[device_id];
	wire receiver_buffer_full=bus_buffer_full[bus_receiver];
	// negedge copies of FIFO data
	wire [bus_width-1:0] buffer_out_net;
	reg [bus_width-1:0] buffer_out_reg;
	wire [bus_max_devices-1:0] receiver_addr_net;
	reg [bus_max_devices-1:0] receiver_addr_reg;
	wire client_buffer_full_net;
	reg client_buffer_full_reg;
	wire client_buffer_empty_net;
	reg client_buffer_empty_reg=1;
	always @(negedge clk) begin
		buffer_out_reg<=buffer_out_net;
		receiver_addr_reg<=receiver_addr_net;
		client_buffer_full_reg<=client_buffer_full_net;
		client_buffer_empty_reg<=client_buffer_empty_net;
	end
	assign bus_receiver=voice ? receiver_addr_reg : 'bz;
	assign bus_data=voice ? buffer_out_reg : 'bz;
	assign client_buffer_empty=client_buffer_empty_reg;
	assign client_buffer_full=client_buffer_full_reg;
	wire wreq=~client_buffer_empty && ~receiver_buffer_full;
	generate
		genvar id;
		for (id=0; id<bus_max_devices; id=id+1) begin: wreq_highz
			assign bus_write_request[id]=id==device_id ? wreq : 'bz;
		end
	endgenerate
	wire buffer_next=voice && ~receiver_buffer_full && ~client_buffer_empty;
	wire clear=0;
	FIFO
	#(
		.data_width(bus_width),
		.size(bus_buffer_size),
		.device_id(device_id)
	) buffer
	(
		.data_in(client_data),
		.data_out(buffer_out_net),
		.clk(clk),
		.next(buffer_next),
		.insert(client_enqueue),
		.clear(clear),
		.full(client_buffer_full_net),
		.empty(client_buffer_empty_net)
	);
	wire recv_addresses_buffer_full;
	wire recv_addresses_buffer_empty;
	FIFO
	#(
		.data_width(bus_max_devices),
		.size(bus_buffer_size),
		.device_id(device_id<<1)
	) recv_addresses
	(
		.data_in(client_target_addr),
		.data_out(receiver_addr_net),
		.clk(clk),
		.next(buffer_next),
		.insert(client_enqueue),
		.clear(clear),
		.full(recv_addresses_buffer_full),
		.empty(recv_addresses_buffer_empty)
	);
	always @(clk) begin
		if (clk) begin
			$display("BusWriter %d: buffer.next=%b",device_id,buffer_next);
			$display("BusWriter %d: buffer.insert=%b",device_id,client_enqueue);
			$display("BusWriter %d: buffer.full=%b",device_id,client_buffer_full);
			$display("BusWriter %d: buffer.client_buffer_empty=%b",device_id,client_buffer_empty);
			$display("BusWriter %d: buffer.data_in=%b",device_id,client_data);
			$display("BusWriter %d: recv_addresses.data_in=%b",device_id,client_target_addr);
		end
		else begin
			for (int i=0; i<4; i=i+1) begin
				$display("BusWriter %d: mem[%d]=%b",device_id,i,buffer.mem[i]);
			end
			if (receiver_addr_reg==0 && voice)
				$display("BusWriter %d: --MAJOR SCREWUP-- Sending to address 0",device_id);
		end
	end
endmodule