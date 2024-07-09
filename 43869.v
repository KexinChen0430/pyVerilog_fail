module outputs)
   wire			loadORtxce;		// From rxtxdiv_i of rxtxdiv_m.v
   wire			rxce;			// From rxtxdiv_i of rxtxdiv_m.v
   // End of automatics
   uarttx_m uarttx_i (/*AUTOINST*/
		      // Outputs
		      .txpin		(txpin),
		      .txbusy		(txbusy),
		      // Inputs
		      .clk		(clk),
		      .load		(load),
		      .loadORtxce	(loadORtxce),
		      .d		(d[7:0]));
   uartrx_m uartrx_i (/*AUTOINST*/
		      // Outputs
		      .bytercvd		(bytercvd),
		      .rxst		(rxst[1:0]),
		      .q		(q[7:0]),
		      // Inputs
		      .clk		(clk),
		      .rxce		(rxce),
		      .rxpin		(rxpin));
   rxtxdiv_m #( .ADJUSTSAMPLEPOINT(ADJUSTSAMPLEPOINT),
                .SUBDIV16(SUBDIV16))
   rxtxdiv_i
     (/*AUTOINST*/
      // Outputs
      .loadORtxce			(loadORtxce),
      .rxce				(rxce),
      // Inputs
      .clk				(clk),
      .bitxce				(bitxce),
      .load				(load),
      .rxpin				(rxpin),
      .rxst				(rxst[1:0]));
endmodule