module RPCv3Transceiver
#(
	//Data width (must be one of 16, 32, 64, 128).
	parameter DATA_WIDTH = 32,
	//When zero, queued data is allowed to show up on rpc_tx_data in between packets.
	//This can cause extra switching power consumption and clutters LA traces, but uses less LUTs.
	//When nonzero, force rpc_tx_data to zero when not transmitting.
	parameter QUIET_WHEN_IDLE = 1,
	//If this transceiver is a leaf (node) port, we send from this address
	parameter NODE_ADDR = 16'h8000,
	//True for leaf nodes, false for router nodes
	parameter LEAF_NODE = 1
) (
	//Clock for this link
	input wire					clk,
	//Network interface, outbound side
	output reg					rpc_tx_en,
	output reg[DATA_WIDTH-1:0]	rpc_tx_data,
	input wire					rpc_tx_ready,
	//Network interface, inbound side
	input wire					rpc_rx_en,
	input wire[DATA_WIDTH-1:0]	rpc_rx_data,
	output reg					rpc_rx_ready,
	//Fabric interface, outbound side
	input wire					rpc_fab_tx_en,
	output reg					rpc_fab_tx_busy,
	input wire[15:0]			rpc_fab_tx_src_addr,
	input wire[15:0]			rpc_fab_tx_dst_addr,
	input wire[7:0]				rpc_fab_tx_callnum,
	input wire[2:0]				rpc_fab_tx_type,
	input wire[20:0]			rpc_fab_tx_d0,
	input wire[31:0]			rpc_fab_tx_d1,
	input wire[31:0]			rpc_fab_tx_d2,
	output reg					rpc_fab_tx_done,
	//Fabric interface, inbound side
	input wire					rpc_fab_rx_ready,
	output reg 					rpc_fab_rx_busy,
	output reg					rpc_fab_rx_en		= 0,
	output reg[15:0]			rpc_fab_rx_src_addr	= 0,
	output reg[15:0]			rpc_fab_rx_dst_addr	= 0,
	output reg[7:0]				rpc_fab_rx_callnum	= 0,
	output reg[2:0]				rpc_fab_rx_type		= 0,
	output reg[20:0]			rpc_fab_rx_d0		= 0,
	output reg[31:0]			rpc_fab_rx_d1		= 0,
	output reg[31:0]			rpc_fab_rx_d2		= 0
	);
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Synthesis-time sanity checking
	initial begin
		case(DATA_WIDTH)
			16: begin
			end
			32: begin
			end
			64: begin
			end
			128: begin
			end
			default: begin
				$display("ERROR: RPCv3Transceiver DATA_WIDTH must be 16/32/64/128");
				$finish;
			end
		endcase
	end
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Compute some useful values
	//Number of clocks it takes to send a message
	localparam MESSAGE_CYCLES = 128 / DATA_WIDTH;
	//Number of bits we need in the cycle counter
	`include "../../synth_helpers/clog2.vh"
	localparam CYCLE_BITS = clog2(MESSAGE_CYCLES);
	localparam CYCLE_MAX = CYCLE_BITS ? CYCLE_BITS-1 : 0;
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Transmit path
	//Words of data to send
	wire[15:0]	tx_d0				= rpc_fab_tx_dst_addr;
	wire[15:0]	tx_d1				= LEAF_NODE ? NODE_ADDR : rpc_fab_tx_src_addr;
	wire[15:0]	tx_d2				= {rpc_fab_tx_callnum, rpc_fab_tx_type, rpc_fab_tx_d0[20:16]};
	wire[15:0]	tx_d3				= rpc_fab_tx_d0[15:0];
	wire[15:0]	tx_d4				= rpc_fab_tx_d1[31:16];
	wire[15:0]	tx_d5				= rpc_fab_tx_d1[15:0];
	wire[15:0]	tx_d6				= rpc_fab_tx_d2[31:16];
	wire[15:0]	tx_d7				= rpc_fab_tx_d2[15:0];
	//If we couldn't send the first cycle, remember that we have a send queued up
	reg			tx_pending			= 0;
	//True if we want to send (either current or queued transmit request)
	wire		tx_request			= tx_pending || rpc_fab_tx_en;
	//True if we're starting a transmit this cycle (whether queued or fresh)
	wire		tx_starting			= tx_request && rpc_tx_ready;
	//Position within the message (in DATA_WIDTH-bit units)
	reg[CYCLE_MAX:0] tx_count	= 0;
	//True if a transmit is in progress
	wire		tx_active			= (tx_count != 0) || tx_starting;
	generate
		//128-bit datapath is stupidly simple, special-case it
		if(DATA_WIDTH == 128) begin
			//All transmit logic is combinatorial
			always @(*) begin
				//Busy if we're sending or waiting to send
				rpc_fab_tx_busy <= (tx_pending || (tx_count != 0) || tx_starting );
				//Send the message if we're starting to send
				rpc_tx_en		<= tx_starting;
				//We finish sending the same cycle we send
				rpc_fab_tx_done	<= tx_starting;
				//Optionally squash output when not sending
				if(QUIET_WHEN_IDLE && !tx_active)
					rpc_tx_data	<= {DATA_WIDTH{1'b0}};
				//Nope, send it
				else
					rpc_tx_data <= {tx_d0, tx_d1, tx_d2, tx_d3, tx_d4, tx_d5, tx_d6, tx_d7};
			end
			//One little bit of stateful logic, though :)
			always @(posedge clk) begin
				//Clear pending messages once sent
				if(tx_starting)
					tx_pending	<= 0;
				//If we try to send when rx isn't ready, save it until they are
				//Send requests during a transmit cycle are ignored.
				if(rpc_fab_tx_en && !rpc_tx_ready && !tx_active)
					tx_pending	<= 1;
			end
		end
		//All other datapaths take >1 cycle to send
		else begin
			//Combinatorial transmit
			always @(*) begin
				//We're busy if we want to send, or are sending.
				rpc_fab_tx_busy <= (tx_pending || (tx_count != 0) || tx_starting );
				//Send the message if we're starting to send
				rpc_tx_en		<= tx_starting && (tx_count == 0);
				//Optionally squash output when not sending
				if(QUIET_WHEN_IDLE && !tx_active)
					rpc_tx_data	<= {DATA_WIDTH{1'b0}};
				//Nope, send it and assert the done flag on the last clock
				else if(DATA_WIDTH == 64) begin
					case(tx_count)
						1:			rpc_tx_data <= { tx_d4, tx_d5, tx_d6, tx_d7 };
						default:	rpc_tx_data <= { tx_d0, tx_d1, tx_d2, tx_d3 };
					endcase
				end
				else if(DATA_WIDTH == 32) begin
					case(tx_count)
						3:			rpc_tx_data <= { tx_d6, tx_d7 };
						2:			rpc_tx_data <= { tx_d4, tx_d5 };
						1:			rpc_tx_data <= { tx_d2, tx_d3 };
						default:	rpc_tx_data <= { tx_d0, tx_d1 };
					endcase
				end
				else begin
					case(tx_count)
						7:			rpc_tx_data <= tx_d7;
						6:			rpc_tx_data <= tx_d6;
						5:			rpc_tx_data <= tx_d5;
						4:			rpc_tx_data <= tx_d4;
						3:			rpc_tx_data <= tx_d3;
						2:			rpc_tx_data <= tx_d2;
						1:			rpc_tx_data <= tx_d1;
						default:	rpc_tx_data <= tx_d0;
					endcase
				end
				//Set done flag at end of message
				rpc_fab_tx_done		<= (tx_count == {CYCLE_BITS{1'b1}});
			end
			//More state logic needed to keep track of our phase etc
			always @(posedge clk) begin
				//Clear pending messages once sent
				if(tx_active)
					tx_pending	<= 0;
				//If we try to send when rx isn't ready, save it until they are.
				//Send requests during a transmit cycle are ignored.
				if(rpc_fab_tx_en && !rpc_tx_ready && !tx_active)
					tx_pending	<= 1;
				//Increment word counter
				if(tx_active)
					tx_count	<= tx_count + 1'h1;
			end
		end
	endgenerate
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Receive path
	//True if we are in the first cycle of an incoming message
	wire					rx_starting		= (rpc_rx_en && rpc_rx_ready);
	//Position within the message (in DATA_WIDTH-bit units)
	//Note that we keep it as 3 bits to avoid XST warnings, even when using wider datapaths.
	//Unused high-side bits will be optimized out.
	reg[2:0]				rx_count		= 0;
	//True if a receive is in progress
	wire					rx_active;
	generate
		if(DATA_WIDTH == 128)
			assign rx_active = rx_starting;
		else
			assign rx_active = (rx_count != 0) || rx_starting;
		//Set busy flag if we're doing stuff (mostly used by formal stuff)
		always @(*) begin
			rpc_fab_rx_busy		<= (rx_count != 0);
		end
		always @(posedge clk) begin
			rpc_fab_rx_en		<= 0;
			//Process incoming data words
			if(rx_active) begin
				//Whole message is on the wire right now
				if(DATA_WIDTH == 128) begin
					rpc_fab_rx_dst_addr	<= rpc_rx_data[127:112];
					rpc_fab_rx_src_addr	<= rpc_rx_data[111:96];
					rpc_fab_rx_callnum	<= rpc_rx_data[95:88];
					rpc_fab_rx_type		<= rpc_rx_data[87:85];
					rpc_fab_rx_d0		<= rpc_rx_data[84:64];
					rpc_fab_rx_d1		<= rpc_rx_data[63:32];
					rpc_fab_rx_d2		<= rpc_rx_data[31:0];
					//end of message
					rpc_fab_rx_en		<= 1;
				end
				else begin
					//Update word count as we move through the message
					if(rx_starting)
						rx_count		<= 1;
					else
						rx_count		<= rx_count + 1'h1;
					//Grab whatever fields are currently on the wire
					case(rx_count)
						0: begin
							case(DATA_WIDTH)
								16:	rpc_fab_rx_dst_addr	<= rpc_rx_data[15:0];
								32: begin
									rpc_fab_rx_dst_addr	<= rpc_rx_data[31:16];
									rpc_fab_rx_src_addr	<= rpc_rx_data[15:0];
								end
								64: begin
									rpc_fab_rx_dst_addr	<= rpc_rx_data[63:48];
									rpc_fab_rx_src_addr	<= rpc_rx_data[47:32];
									rpc_fab_rx_callnum	<= rpc_rx_data[31:24];
									rpc_fab_rx_type		<= rpc_rx_data[23:21];
									rpc_fab_rx_d0		<= rpc_rx_data[20:0];
								end
							endcase
						end
						1: begin
							case(DATA_WIDTH)
								16:	begin
									rpc_fab_rx_src_addr	<= rpc_rx_data;
								end
								32: begin
									rpc_fab_rx_callnum	<= rpc_rx_data[31:24];
									rpc_fab_rx_type		<= rpc_rx_data[23:21];
									rpc_fab_rx_d0		<= rpc_rx_data[20:0];
								end
								64: begin
									rpc_fab_rx_d1		<= rpc_rx_data[63:32];
									rpc_fab_rx_d2		<= rpc_rx_data[31:0];
									//end of message
									rpc_fab_rx_en		<= 1;
									rx_count			<= 0;
								end
							endcase
						end
						2: begin
							if(DATA_WIDTH == 32)
								rpc_fab_rx_d1			<= rpc_rx_data;
							else begin
								rpc_fab_rx_callnum		<= rpc_rx_data[15:8];
								rpc_fab_rx_type			<= rpc_rx_data[7:5];
								rpc_fab_rx_d0[20:16]	<= rpc_rx_data[4:0];
							end
						end
						3: begin
							if(DATA_WIDTH == 32) begin
								rpc_fab_rx_d2			<= rpc_rx_data;
								//end of message
								rpc_fab_rx_en			<= 1;
								rx_count				<= 0;
							end
							else
								rpc_fab_rx_d0[15:0]		<= rpc_rx_data;
						end
						//If we get here we're a 16-bit message, so no more conditionals needed
						//The explicit [15:0] selector is needed to prevent XST warnings when synthesizing
						//for larger datapath widths (since this code is synthesized before being optimized out)
						4: rpc_fab_rx_d1[31:16]	<= rpc_rx_data[15:0];
						5: rpc_fab_rx_d1[15:0]	<= rpc_rx_data[15:0];
						6: rpc_fab_rx_d2[31:16]	<= rpc_rx_data[15:0];
						7: begin
							rpc_fab_rx_d2[15:0]	<= rpc_rx_data[15:0];
							//end of message
							rpc_fab_rx_en		<= 1;
						end
					endcase
				end
			end
		end
		//Ready to receive if the fabric side is ready.
		//Once we go ready, go un-ready when a message comes in.
		reg		rpc_rx_ready_ff	= 0;
		always @(posedge clk) begin
			if(rpc_rx_en)
				rpc_rx_ready_ff		<= 0;
			if(rpc_fab_rx_ready)
				rpc_rx_ready_ff		<= 1;
		end
		always @(*) begin
			rpc_rx_ready		<= rpc_rx_ready_ff;
		end
	endgenerate
endmodule