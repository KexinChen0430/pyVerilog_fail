module simple_test_3e
  (input logic [8*16-1:0] wide_input_bus,
   input logic [3:0]  selector,
   output logic [7:0] selected_out);
   always_comb begin
      priority case (1'b1)
        selector[0]: selected_out = wide_input_bus[  7:  0]; // Bit 0 has highets priority
        selector[2]: selected_out = wide_input_bus[ 39: 32]; // Note 2 higher priority than 1
        selector[1]: selected_out = wide_input_bus[ 23: 16]; // Note 1 lower priority than 2
        selector[3]: selected_out = wide_input_bus[ 71: 64]; // Bit 3 has lowest priority
        default:     selected_out = wide_input_bus[127:120]; // for selector = 0.
      endcase // case (selector)
   end
endmodule