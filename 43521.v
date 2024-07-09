module oper_bus_mux ( a, b, sel, o);
	parameter width_a = 6;
	parameter width_b = 6;
	parameter width_o = 6;
	input	[width_a-1:0]  a;
	input	[width_b-1:0]  b;
	input	 sel;
	output	[width_o-1:0] o;
	wire [width_a+width_b-1:0] all_inps;
	assign all_inps[width_a-1:0]=a[width_a-1:0];
	assign all_inps[width_a+width_b-1:width_a]=b[width_b-1:0];
   initial
    begin
        // check if width_a > 0
        if (width_a <= 0)
        begin
            $display("Error!  width_a must be greater than 0.\n");
            $display ("Time: %0t  Instance: %m", $time);
		end
        if (width_b <= 0)
        begin
            $display("Error!  width_o must be greater than 0.\n");
            $display ("Time: %0t  Instance: %m", $time);
		end
        if (width_a != width_b)
        begin
            $display("Error!  width_a must equal width_b.\n");
            $display ("Time: %0t  Instance: %m", $time);
		end
        if (width_a != width_o)
        begin
            $display("Error!  width_a must equal width_o.\n");
            $display ("Time: %0t  Instance: %m", $time);
		end
    end
	lpm_mux	lpm_mux_component (
				.data (all_inps),
				.sel(sel),
				.result (o),
			    .clock (),
			    .aclr (),
    			.clken ()
				);
	defparam
		lpm_mux_component.lpm_width = width_o,
		lpm_mux_component.lpm_size = 2,
		lpm_mux_component.lpm_widths = 1,
		lpm_mux_component.lpm_type = "lpm_mux";
endmodule