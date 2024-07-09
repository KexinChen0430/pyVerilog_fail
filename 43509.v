module oper_mult ( a, b,  o );
	parameter width_a = 32;
	parameter width_b = 32;
	parameter width_o = 32;
	parameter sgate_representation = 1;
	input [width_a-1:0] a;
	input [width_b-1:0] b;
	output [width_o-1:0] o;
	// local parameter
	parameter width_result = (width_o >= width_a + width_b) ? width_o : width_a + width_b;
	wire [width_result-1:0] result;
	initial
	begin
        // check if width_a > 0
        if (width_a <= 0)
        begin
            $display("Error!  width_a must be greater than 0.\n");
            $display ("Time: %0t  Instance: %m", $time);
		end
        // check if width_b > 0
        if (width_b <= 0)
        begin
            $display("Error!  width_b must be greater than 0.\n");
            $display ("Time: %0t  Instance: %m", $time);
		end
        // check if width_o > 0
        if (width_o <= 0)
        begin
            $display("Error!  width_o must be greater than 0.\n");
            $display ("Time: %0t  Instance: %m", $time);
		end
        // check for valid lpm_rep value
        if ((sgate_representation != 1) && (sgate_representation != 0))
        begin
            $display("Error!  sgate_representation value must be 1 (signed) or 0 (unsigned).", $time);
            $display ("Time: %0t  Instance: %m", $time);
		end
	end
	lpm_mult	lpm_mult_component (
				.dataa (a),
				.datab (b),
				.result (result),
			    .sum (),
				.aclr (),
				.clock (),
				.clken ()
				);
	defparam
		lpm_mult_component.lpm_widtha = width_a,
		lpm_mult_component.lpm_widthb = width_b,
		lpm_mult_component.lpm_widthp = width_result,
		lpm_mult_component.lpm_widths = width_result,
		lpm_mult_component.lpm_type = "LPM_MULT",
		lpm_mult_component.lpm_representation = sgate_representation ? "SIGNED" : "UNSIGNED",
		lpm_mult_component.lpm_hint = "MAXIMIZE_SPEED=6";
	assign o[width_o-1:0] = result[width_o-1:0];
endmodule