module Rotate_Mux_Array#(parameter SWR=26)(
    //INPUTS
    input wire [SWR-1:0] Data_i,
    input wire select_i,
    //OUTPUTS
    output wire [SWR-1:0] Data_o
    );
    genvar j;//Create a variable for the loop FOR
    generate for (j=0; j <= SWR-1; j=j+1) begin // generate enough Multiplexers modules for each bit
	   case (j)
        SWR-1-j:begin
            assign Data_o[j]=Data_i[SWR-1-j];
            end
		default:begin
		Multiplexer_AC #(.W(1)) rotate_mux(
		    .ctrl(select_i),
		    .D0 (Data_i[j]),
		    .D1 (Data_i[SWR-1-j]),
		    .S (Data_o[j])
		    );
			end
		endcase
	end
endgenerate
endmodule