module simple_test_3f
  (input logic [8*16-1:0] wide_input_bus,
   input logic [3:0]  selector,
   output logic [7:0] selected_out);
   always_comb begin
/* -----\/----- EXCLUDED -----\/-----
      if ( selector[3:0] inside { 4'b?00?, 4'b1100})      // Matching 0000, 0001, 1000, 1100, 1001
	// if ( selector[3:2] inside { 2'b?0, selector[1:0]})
        selected_out = wide_input_bus[  7:  0];
      else
 -----/\----- EXCLUDED -----/\----- */
      /* verilator lint_off CASEOVERLAP */
        priority casez (selector[3:0])
          4'b0?10: selected_out = wide_input_bus[ 15:  8]; // Matching 0010 and 0110
          4'b0??0: selected_out = wide_input_bus[ 23: 16]; // Overlap: only 0100 remains (0000 in "if" above)
          4'b0100: selected_out = wide_input_bus[ 31: 24]; // Overlap: Will never occur
          default: selected_out = wide_input_bus[127:120];   // Remaining 0011,0100,0101,0111,1010,1011,1101,1110,1111
	endcase // case (selector)
      /* verilator lint_on CASEOVERLAP */
   end
endmodule