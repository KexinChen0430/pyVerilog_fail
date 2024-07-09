module oper_decoder ( i, o);
	parameter width_i = 6;
	parameter width_o = 6;
	input	[width_i-1:0]  i;
	output	[width_o-1:0] o;
   initial
    begin
        // check if width_i > 0
        if (width_i <= 0)
            $display("Error!  width_i must be greater than 0.\n");
        if (width_o <= 0)
            $display("Error!  width_o must be greater than 0.\n");
    end
	lpm_decode	lpm_decode_component (
				.data (i),
				.eq (o),
				.enable (),
			    .clock (),
    			.aclr (),
    			.clken ()
				);
	defparam
		lpm_decode_component.lpm_width = width_i,
		lpm_decode_component.lpm_decodes = width_o,
		lpm_decode_component.lpm_type = "LPM_DECODE";
endmodule