module oper_add ( a, b, cin, cout, o );
	parameter width_a = 32;
	parameter width_b = 32;
	parameter width_o = 32;
	parameter sgate_representation = 1;
	input [width_a-1:0] a;
	input [width_b-1:0] b;
	input cin;
	output cout;
	output [width_o-1:0] o;
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
        if (width_a != width_b)
        begin
            $display("Error!  width_a must be equal to width_b.\n");
            $display ("Time: %0t  Instance: %m", $time);
		end
        if (width_a != width_o)
        begin
            $display("Error!  width_a must be equal to width_o.\n");
            $display ("Time: %0t  Instance: %m", $time);
		end
        // check for valid lpm_rep value
        if (sgate_representation != 1 && sgate_representation != 0)
        begin
            $display("Error!  sgate_representation value must be 1 (SIGNED) or 0 (UNSIGNED).");
            $display ("Time: %0t  Instance: %m", $time);
		end
    end
 	lpm_add_sub	lpm_add_sub_component (
				.dataa (a),
				.datab (b),
				.cin (cin),
				.cout (cout),
				.result (o),
				.add_sub (),
				.clock (),
				.aclr (),
				.clken (),
				.overflow ()
				);
	defparam
		lpm_add_sub_component.lpm_width = width_a,
		lpm_add_sub_component.lpm_direction = "ADD",
		lpm_add_sub_component.lpm_representation = (sgate_representation == 1) ? "SIGNED" : "UNSIGNED",
		lpm_add_sub_component.lpm_type = "LPM_ADD_SUB",
		lpm_add_sub_component.lpm_hint = "ONE_INPUT_IS_CONSTANT=NO";
endmodule