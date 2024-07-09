module symmetric_mem_core #(
   parameter RAM_WIDTH          = 16,
   parameter RAM_ADDR_BITS      = 5
)(
	input	wire							clockA,
	input	wire							clockB,
	input	wire							write_enableA,
	input	wire							write_enableB,
	input	wire	[RAM_ADDR_BITS-1:0] 	addressA,
	input	wire	[RAM_ADDR_BITS-1:0] 	addressB,
	input	wire	[RAM_WIDTH-1:0] 		input_dataA,
	input	wire	[RAM_WIDTH-1:0] 		input_dataB,
	output	reg 	[RAM_WIDTH-1:0] 		output_dataA,
	output	reg 	[RAM_WIDTH-1:0] 		output_dataB
);
    // 1.Parameter and constant define
    `define SIM
    // 2.input and output declaration
//   (* RAM_STYLE="{AUTO | BLOCK |  BLOCK_POWER1 | BLOCK_POWER2}" *)
	(* RAM_STYLE="BLOCK" *)
    reg [RAM_WIDTH-1:0] sym_ram [(2**RAM_ADDR_BITS)-1:0];
	wire	enableA;
	wire	enableB;
    integer begin_address   = 0;
    integer end_address     = 2**RAM_ADDR_BITS)-1;
    // 3.Register and wire declaration
    // 3.1 the clk wire signal
    assign enableA = 1'b1;
	assign enableB = 1'b1;
   //  The forllowing code is only necessary if you wish to initialize the RAM
   //  contents via an external file (use $readmemb for binary data)
    `ifdef SIM
        integer i;
        initial begin
            for(i=0;i<2**RAM_ADDR_BITS;i=i+1)
                sym_ram[i] = 'd0;
        end
    `else
        initial
            $readmemh("data_file_name", sym_ram, begin_address, end_address);
    `endif
    always @(posedge clockA)
        if (enableA) begin
            if (write_enableA)
                sym_ram[addressA] <= input_dataA;
            output_dataA <= sym_ram[addressA];
      end
    always @(posedge clockB)
        if (enableB) begin
            if (write_enableB)
                sym_ram[addressB] <= input_dataB;
            output_dataB <= sym_ram[addressB];
      end
endmodule