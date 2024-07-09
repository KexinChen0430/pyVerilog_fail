module interpreter(
	input wire mclk,
	input wire stall,
	output reg[31:0] mem_address,
	output reg[31:0] mem_din,
	input wire[31:0] mem_dout,
	output reg mem_re = 0,
	output reg mem_we = 0
	/*output wire[15:0] dbg,
	output reg[11:0] vga_address,
	output reg[7:0] vga_data,
	output reg vga_we = 0*/
);
initial begin
	mem_address = 32'h0;
end
/*reg[7:0] inst[0:1];
initial begin
	inst[0] = 8'hFF;
	inst[1] = 8'hFF;
	//inst[2] = 8'hFF;
end
parameter state_load = 2'b00;
parameter state_exe0 = 2'b01;
parameter state_exe1 = 2'b10;
reg[1:0] state = state_exe0;
assign dbg = {inst[0], inst[1]};
wire has_control = !stall && !mem_re && !mem_we;
always @ (posedge mclk) begin
	if(has_control) begin
		case(state)
			state_load: begin
				inst[0] <= mem_dout[15:8];
				inst[1] <= mem_dout[7:0];
				state <= state_exe0;
			end
			state_exe0: begin
				case(inst[0])
					255: begin // Startup Step 0 - Write 223 to mem 0
						mem_address <= 0;
						mem_din <= {8'd221, 8'h00};
						mem_we <= 1;
						state <= state_exe1;
					end
					221: begin // Nop
						vga_address <= vga_address + 1;
						vga_data <= vga_data + 1;
						vga_we <= 1;
					end
					default: begin // Trap
						vga_address <= vga_address + 1;
						vga_data <= 0;
						vga_we <= 1;
					end
				endcase
			end
			state_exe1: begin
				case(inst[0])
					255: begin // Startup Step 2 - Read mem 0 into inst.
						mem_address <= 0;
						mem_re <= 1;
						state <= state_load;
					end
					default: begin // Trap
						vga_address <= vga_address + 1;
						vga_data <= 0;
						vga_we <= 1;
					end
				endcase
			end
			default: begin
				inst[0] <= 8'hDE;
				inst[1] <= 8'hAD;
				state <= state;
			end
		endcase
	end else begin
		mem_re <= 0;
		mem_we <= 0;
	end
end*/
endmodule