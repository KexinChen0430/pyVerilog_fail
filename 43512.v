module oper_mod ( a, b, o);
	parameter width_a = 6;
	parameter width_b = 6;
	parameter width_o = 6;
	parameter sgate_representation = 0;
	input  [width_a-1:0] a;
	input  [width_b-1:0] b;
	output [width_o-1:0] o;
	wire [width_a-1:0] tmp_result;
	reg [width_o-1:0] tmp_result2;
	wire [width_b-1:0] hold_rem;
	integer i;
	lpm_divide u1 (
			.numer (a),
			.denom (b),
			.quotient (tmp_result),
			.remain (hold_rem),
		    .clock (),
		    .aclr (),
			.clken ()
			);
		defparam u1.lpm_widthn= width_a,
			   u1.lpm_widthd= width_b,
			   u1.lpm_nrepresentation= sgate_representation ? "SIGNED" : "UNSIGNED",
			   u1.lpm_drepresentation= sgate_representation ? "SIGNED" : "UNSIGNED",
			   u1.lpm_type = "LPM_DIVIDE",
			   u1.lpm_hint = sgate_representation ? "LPM_REMAINDERPOSITIVE=FALSE" : "LPM_REMAINDERPOSITIVE=TRUE";
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
            $display("Error!  width_o must greater than 0.\n");
            $display ("Time: %0t  Instance: %m", $time);
		end
        // check if width_o > 0
        if ((sgate_representation != 1) && (sgate_representation != 0))
        begin
            $display("Error!  sgate_representation value must be 1 (signed) or 0 (unsigned).", $time);
            $display ("Time: %0t  Instance: %m", $time);
		end
    end
	always @(hold_rem)
	begin
		if (width_b > width_o)
		begin
			tmp_result2[width_o-1:0] = hold_rem[width_o-1:0];
		end
		else
		begin
			tmp_result2[width_b-1:0] = hold_rem[width_b-1:0];
		end
		if ((width_o - width_b) > 0)
		begin
			for (i = width_b; i < width_o; i = i + 1)
			begin
				tmp_result2[i] = sgate_representation ? hold_rem[width_b-1] : 1'b0;
			end
		end
	end
	assign o = tmp_result2;
endmodule