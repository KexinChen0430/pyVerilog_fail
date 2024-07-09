module RAM_controller(
	inout [15:0], // Input/Output port
	output  reg address [17:0], // Address
	output reg CE, //Chip Select Enaeble (en cero)
   output UB, //High Byte [16-bit data word] (en cero)
	output LB,// Low byte [16-bit data word] (en cero)
	output WE, //write-enable (en cero)
	output OE //read-enable (en cero)
);
endmodule