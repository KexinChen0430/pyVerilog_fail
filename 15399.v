module uart_rfifo (clk,
	wb_rst_i, data_in, data_out,
// Control signals
	push, // push strobe, active high
	pop,   // pop strobe, active high
// status signals
	overrun,
	count,
	error_bit,
	fifo_reset,
	reset_status
	);
// FIFO parameters
parameter fifo_width = `UART_FIFO_WIDTH;
parameter fifo_depth = `UART_FIFO_DEPTH;
parameter fifo_pointer_w = `UART_FIFO_POINTER_W;
parameter fifo_counter_w = `UART_FIFO_COUNTER_W;
input				clk;
input				wb_rst_i;
input				push;
input				pop;
input	[fifo_width-1:0]	data_in;
input				fifo_reset;
input       reset_status;
output	[fifo_width-1:0]	data_out;
output				overrun;
output	[fifo_counter_w-1:0]	count;
output				error_bit;
wire	[fifo_width-1:0]	data_out;
wire [7:0] data8_out;
// flags FIFO
reg	[2:0]	fifo[fifo_depth-1:0];
// FIFO pointers
reg	[fifo_pointer_w-1:0]	top;
reg	[fifo_pointer_w-1:0]	bottom;
reg	[fifo_counter_w-1:0]	count;
reg				overrun;
wire [fifo_pointer_w-1:0] top_plus_1 = top + 4'h1;
raminfr #(fifo_pointer_w,8,fifo_depth) rfifo
        (.clk(clk),
			.we(push),
			.a(top),
			.dpra(bottom),
			.di(data_in[fifo_width-1:fifo_width-8]),
			.dpo(data8_out)
		);
always @(posedge clk or posedge wb_rst_i) // synchronous FIFO
begin
	if (wb_rst_i)
	begin
		top		<= 0;
		bottom		<= 0;
		count		<= 0;
		fifo[0] <= 0;
		fifo[1] <= 0;
		fifo[2] <= 0;
		fifo[3] <= 0;
		fifo[4] <= 0;
		fifo[5] <= 0;
		fifo[6] <= 0;
		fifo[7] <= 0;
		fifo[8] <= 0;
		fifo[9] <= 0;
		fifo[10] <= 0;
		fifo[11] <= 0;
		fifo[12] <= 0;
		fifo[13] <= 0;
		fifo[14] <= 0;
		fifo[15] <= 0;
	end
	else
	if (fifo_reset) begin
		top		<= 0;
		bottom		<= 0;
		count		<= 0;
		fifo[0] <= 0;
		fifo[1] <= 0;
		fifo[2] <= 0;
		fifo[3] <= 0;
		fifo[4] <= 0;
		fifo[5] <= 0;
		fifo[6] <= 0;
		fifo[7] <= 0;
		fifo[8] <= 0;
		fifo[9] <= 0;
		fifo[10] <= 0;
		fifo[11] <= 0;
		fifo[12] <= 0;
		fifo[13] <= 0;
		fifo[14] <= 0;
		fifo[15] <= 0;
	end
  else
	begin
		case ({push, pop})
		2'b10 : if (count<fifo_depth)  // overrun condition
			begin
				top       <= top_plus_1;
				fifo[top] <= data_in[2:0];
				count     <= count + 5'd1;
			end
		2'b01 : if(count>0)
			begin
        fifo[bottom] <= 0;
				bottom   <= bottom + 4'd1;
				count	 <= count - 5'd1;
			end
		2'b11 : begin
				bottom   <= bottom + 4'd1;
				top       <= top_plus_1;
				fifo[top] <= data_in[2:0];
		        end
    default: ;
		endcase
	end
end   // always
always @(posedge clk or posedge wb_rst_i) // synchronous FIFO
begin
  if (wb_rst_i)
    overrun   <= 1'b0;
  else
  if(fifo_reset | reset_status)
    overrun   <= 1'b0;
  else
  if(push & ~pop & (count==fifo_depth))
    overrun   <= 1'b1;
end   // always
// please note though that data_out is only valid one clock after pop signal
assign data_out = {data8_out,fifo[bottom]};
// Additional logic for detection of error conditions (parity and framing) inside the FIFO
// for the Line Status Register bit 7
wire	[2:0]	word0 = fifo[0];
wire	[2:0]	word1 = fifo[1];
wire	[2:0]	word2 = fifo[2];
wire	[2:0]	word3 = fifo[3];
wire	[2:0]	word4 = fifo[4];
wire	[2:0]	word5 = fifo[5];
wire	[2:0]	word6 = fifo[6];
wire	[2:0]	word7 = fifo[7];
wire	[2:0]	word8 = fifo[8];
wire	[2:0]	word9 = fifo[9];
wire	[2:0]	word10 = fifo[10];
wire	[2:0]	word11 = fifo[11];
wire	[2:0]	word12 = fifo[12];
wire	[2:0]	word13 = fifo[13];
wire	[2:0]	word14 = fifo[14];
wire	[2:0]	word15 = fifo[15];
// a 1 is returned if any of the error bits in the fifo is 1
assign	error_bit = |(word0[2:0]  | word1[2:0]  | word2[2:0]  | word3[2:0]  |
            		      word4[2:0]  | word5[2:0]  | word6[2:0]  | word7[2:0]  |
            		      word8[2:0]  | word9[2:0]  | word10[2:0] | word11[2:0] |
            		      word12[2:0] | word13[2:0] | word14[2:0] | word15[2:0] );
endmodule