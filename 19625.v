module Rotate_Mux_Array
    #(parameter SWR=26)
    (
    input wire [SWR-1:0] Data_i,
    input wire select_i,
    output wire [SWR-1:0] Data_o
    );
  genvar j;//Create a variable for the loop FOR
  generate for (j=0; j <= SWR-1; j=j+1) begin : MUX_ARRAY
    case (j)
      SWR-1-j:begin : MUX_ARRAY11
        assign Data_o[j]=Data_i[SWR-1-j];
        end
      default:begin : MUX_ARRAY12
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