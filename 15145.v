module alu_with_acc(clk,in,out,select,enable);
	parameter n = 16; //Bits for Input and Output
	parameter m = 3; //Bits for Select Line
	input clk, enable;
	input [n-1:0] in;
	input [m-1:0] select;
	output [n-1:0] out;
	reg [n-1:0] accumulator;
	reg v;//Overflow
	initial begin
		accumulator <= 16'h00;
		v = 0;
	end
	always @(posedge(clk))
	begin
		if (enable == 1) begin
			case (select)
			3'b000 : {v,accumulator} <= accumulator + in; //ADD
			3'b001 : {v,accumulator} <= accumulator - ((~in) + 1); //Subtract
			3'b010 : {v,accumulator} <= accumulator + 1'b1; //Increment by 1
			3'b011 : {v,accumulator} <= accumulator - 1'b1; //Decrement by 1
			//3'b100 :
			//3'b101 :
			3'b110 : accumulator <= in;
			3'b111 : accumulator <= accumulator;
			endcase
		end
	end
	//Output accumulator value to databus
	assign out = select[2] ? accumulator : 16'hZZ;
endmodule