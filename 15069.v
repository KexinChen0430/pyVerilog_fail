module DE1_SoC (CLOCK_50, LEDR, HEX0, HEX1, HEX2, HEX3, SW, KEY);
	input CLOCK_50;  // connect to system 50 MHz clock
	output reg [9:0] LEDR;
	output [6:0] HEX0, HEX1, HEX2, HEX3;
	input [9:0] SW;
	input [3:0] KEY;
	reg [31:0] A, B, data;
	reg [1:0] count, currMode;
	wire clk, enter, run, res, Z, V, C, N;
	wire [2:0] oper;
	wire [1:0] sel;
	assign clk = CLOCK_50;
	//Interpreted by the system as an Enter. When Enter is pressed
	// the ALU will read the state of the input switches and respond accordingly
	assign enter = ~KEY[0];
	//Directs the ALU to perform the specified operation and display the results.
	assign run = ~KEY[1];
	// sets the hex digits
	assign digits = SW[3:0];
	// Operation code
	assign oper = SW[6:4];
	// Specify whether operand A or B is to be entered or the result is to be displayed
	assign sel = SW[9:8];
	// controls the hex
	hexOnHex hex0(data[3:0], HEX0);
	hexOnHex hex1(data[7:4], HEX1);
	hexOnHex hex2(data[11:8], HEX2);
	hexOnHex hex3(data[15:12], HEX3);
	always @(posedge clk) begin
		if(enter) begin
			case(sel)
				0: begin
					data = A;
					currMode =
					end
				1: begin
					data = B;
					end
				2: begin
					end
				3: begin
					end
				default:
			endcase
			case(oper)
				0: //NOP
				1: //ADD
				2: //SUB
				3: //AND
				4: //OR
				5: //XOR
				6: //SLT
				7: //SLL
				default:
			endcase
			case(digits)
			endcase
		end
		else if (run) begin
				0: begin
					data = A;
					end
				1: begin
					data = B;
					end
				2: begin
					end
				3: begin
					end
				default:
			endcase
			case(oper)
				0: //NOP
				1: //ADD
				2: //SUB
				3: //AND
				4: //OR
				5: //XOR
				6: //SLT
				7: //SLL
				default:
			endcase
			case(digits)
			endcase
		end
endmodule