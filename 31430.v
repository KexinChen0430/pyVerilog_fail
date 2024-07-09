module FracN (
	input   clk
);
//`#start body` -- edit after this line, do not edit this line
// Special thanks to Michael Hightower KF6SJ for showing me how
// to create a Fractional-N Sigma Delta Modulator in the PSoC.
// This version is simpified to reduce PLA usage.
// A more complete implementation is available from:
// http://www.simplecircuits.com/SimpleSDR.html
    wire [7:0] fHigh;
    wire [7:0] fLow;
    wire [13:0] frac = {fHigh [5:0], fLow [7:0]};
    reg [13:0] acc1;
    reg [13:0] acc2;
    wire [14:0] adder1 = acc1 + frac;
    wire [14:0] adder2 = acc2 + acc1;
    reg minus1;
    reg [6:0] pOut;
    cy_psoc3_control #(.cy_init_value (8'h3D), .cy_force_order(`TRUE))
    FRAC_HI ( .control(fHigh));
    cy_psoc3_control #(.cy_init_value (8'hF4), .cy_force_order(`TRUE))
    FRAC_LO ( .control(fLow));
    cy_psoc3_status #(.cy_md_select(8'h00), .cy_force_order(`TRUE))
    PLL_P ( .status( {1'b0, pOut} ));
    always @(posedge clk)
    begin
		acc1 <= adder1 [13:0];
		acc2 <= adder2 [13:0];
        minus1 <= adder2 [14];
        pOut <= 8'h13 + {6'b0, adder1 [14]} + {6'b0, adder2 [14]} + {7{minus1}};
    end
//`#end` -- edit above this line, do not edit this line
endmodule