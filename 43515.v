module oper_rotate_left ( amount,	a, o);
	parameter width_a = 6;
	parameter width_amount = 6;
	parameter width_o = 6;
	parameter sgate_representation = 0;
	input	[width_amount-1:0]  amount;
	input	[width_a-1:0]  a;
	output	[width_o-1:0]  o;
	wire [width_a-1:0] temp_result;
	wire temp_direction = 1'h0;
	lpm_clshift	lpm_clshift_component (
				.distance (amount),
				.direction (temp_direction),
				.data (a),
				.result (temp_result),
			    .underflow (),
			    .overflow ()
				);
	defparam
		lpm_clshift_component.lpm_type = "LPM_CLSHIFT",
		lpm_clshift_component.lpm_shifttype = "ROTATE",
		lpm_clshift_component.lpm_width = width_a,
		lpm_clshift_component.lpm_widthdist = width_amount;
	assign o = temp_result[width_o-1:0];
   initial
    begin
        // check if width_a > 0
        if (width_amount <= 0)
        begin
            $display("Error!  width_amount must be greater than 0.\n");
            $display ("Time: %0t  Instance: %m", $time);
		end
        if (width_a <= 0)
        begin
            $display("Error!  width_a must be greater than 0.\n");
            $display ("Time: %0t  Instance: %m", $time);
		end
        if (width_a != width_o)
        begin
            $display("Error!  width_a must be equal to width_o.\n");
            $display ("Time: %0t  Instance: %m", $time);
		end
        if (sgate_representation != 1 && sgate_representation != 0)
        begin
            $display("Error!  sgate_representation value must be 1 (SIGNED) or 0 (UNSIGNED).");
            $display ("Time: %0t  Instance: %m", $time);
		end
    end
endmodule