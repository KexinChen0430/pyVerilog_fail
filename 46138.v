module shift_mux_array#(parameter SWR=26, parameter LEVEL=5)(
    //INPUTS
    input wire [SWR-1:0] Data_i,
    input wire select_i,
    input wire bit_shift_i,
    //OUTPUTS
    output wire [SWR-1:0] Data_o
    );
    genvar j;
    generate for (j=0; j<=SWR-1 ; j=j+1) begin
	localparam sh=(2**LEVEL)+j; //value for second mux input. It changes in exponentation by 2 for each level
	case (sh>SWR-1)
		1'b1:begin
			Multiplexer_AC #(.W(1)) rotate_mux(
			    .ctrl(select_i),
			    .D0 (Data_i[j]),
			    .D1 (bit_shift_i),
			    .S (Data_o[j])
			    );
			end
		1'b0:begin
			Multiplexer_AC #(.W(1)) rotate_mux(
			    .ctrl(select_i),
			    .D0 (Data_i[j]),
			    .D1 (Data_i[sh]),
			    .S (Data_o[j])
			    );
			end
		endcase
	end
endgenerate
endmodule