module that can be technology dependent.
   always @(`OR1200_RST_EVENT rst or posedge clk) begin
      if (rst == `OR1200_RST_VALUE) begin
	 div_quot_r <=  32'd0;
	 div_quot_generic <= 32'd0;
      end
      else begin
	 if (alu_op_udiv & !(|y)) // unsigned divide by 0 - force to MAX
	   div_quot_generic[31:0] <= 32'hffff_ffff;
	 else if (alu_op_div)
	   div_quot_generic[31:0] <= x / y;
      end
      // Add any additional statges of pipelining as required here. Ensure
      // ends with div_quot_r.
      // Then add logic to ensure div_stall stays high for as long as the
      // division should take.
      div_quot_r[31:0] <= div_quot_generic;
   end
   assign div_stall = 0;
 `endif
`else // !`ifdef OR1200_DIV_IMPLEMENTED
   assign div_stall = 0;
`endif // !`ifdef OR1200_DIV_IMPLEMENTED
   // Stall output
   assign mult_mac_stall = mac_stall_r | div_stall | mul_stall;
endmodule