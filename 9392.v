module clb_NCY0_MX (input clk, input [7:0] din, output [7:0] dout);
    parameter LOC="SLICE_X16Y129_FIXME";
    parameter BEL="A6LUT_FIXME";
    parameter N=-1;
    wire [3:0] o;
    assign dout[0] = o[1];
    wire o6, o5;
    reg [3:0] s;
    always @(*) begin
        s = din[7:4];
        s[N] = o6;
    end
	(* LOC=LOC, BEL=BEL, KEEP, DONT_TOUCH *)
	LUT6_2 #(
		.INIT(64'h8000_0000_0000_0001)
	) lut (
		.I0(din[0]),
		.I1(din[1]),
		.I2(din[2]),
		.I3(din[3]),
		.I4(din[4]),
		.I5(din[5]),
		.O5(o5),
		.O6(o6));
	(* LOC=LOC, KEEP, DONT_TOUCH *)
    CARRY4 carry4(.O(o), .CO(), .DI(din[3:0]), .S(s), .CYINIT(1'b0), .CI());
endmodule