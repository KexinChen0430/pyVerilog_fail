module incrementCounter (pcprev, newpc); //increments value from PC counter to next instruction
	input [31:0] pcprev; //setting up inputs and outputs
	reg [31:0] newpcreg;
	output [31:0] newpc;
	always@ (pcprev) begin //whenever pcprev changes, do the following
		assign newpcreg = pcprev + 1; //add 1 to pcprev and assign that value as the output, as memory is an array of 32 bit elements
	end
	assign newpc = newpcreg; //assigning actual output
endmodule