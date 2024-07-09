module additional output)
        output caro, output carco,
        output bo5, output bo6,
        //Note: b5ff_q requires the mux and will conflict with other wires
        //Otherwise this FF drops out
        output wire ff_q);
        //output wire [3:0] n5ff_q);
    parameter N=-1;
    parameter LOC="SLICE_FIXME";
    wire [3:0] caro_all;
    assign caro = caro_all[N];
    wire [3:0] carco_all;
    assign carco = carco_all[N];
    wire [3:0] lutno6;
    assign bo6 = lutno6[N];
    wire [3:0] lutno5;
    assign bo5 = lutno5[N];
    //Outputs does not have to be used, will stay without it
    (* LOC=LOC, BEL="F8MUX", KEEP, DONT_TOUCH *)
    MUXF8 mux8 (.O(lut8o), .I0(lut7bo), .I1(lut7ao), .S(din[6]));
    (* LOC=LOC, BEL="F7BMUX", KEEP, DONT_TOUCH *)
    MUXF7 mux7b (.O(lut7bo), .I0(lutno6[3]), .I1(lutno6[2]), .S(din[6]));
    (* LOC=LOC, BEL="F7AMUX", KEEP, DONT_TOUCH *)
    MUXF7 mux7a (.O(lut7ao), .I0(lutno6[1]), .I1(lutno6[0]), .S(din[6]));
	(* LOC=LOC, BEL="D6LUT", KEEP, DONT_TOUCH *)
	LUT6_2 #(
		.INIT(64'h8000_DEAD_0000_0001)
	) lutd (
		.I0(din[0]),
		.I1(din[1]),
		.I2(din[2]),
		.I3(din[3]),
		.I4(din[4]),
		.I5(din[5]),
		.O5(lutno5[3]),
		.O6(lutno6[3]));
	(* LOC=LOC, BEL="C6LUT", KEEP, DONT_TOUCH *)
	LUT6_2 #(
		.INIT(64'h8000_BEEF_0000_0001)
	) lutc (
		.I0(din[0]),
		.I1(din[1]),
		.I2(din[2]),
		.I3(din[3]),
		.I4(din[4]),
		.I5(din[5]),
		.O5(lutno5[2]),
		.O6(lutno6[2]));
	(* LOC=LOC, BEL="B6LUT", KEEP, DONT_TOUCH *)
	LUT6_2 #(
		.INIT(64'h8000_CAFE_0000_0001)
	) lutb (
		.I0(din[0]),
		.I1(din[1]),
		.I2(din[2]),
		.I3(din[3]),
		.I4(din[4]),
		.I5(din[5]),
		.O5(lutno5[1]),
		.O6(lutno6[1]));
	(* LOC=LOC, BEL="A6LUT", KEEP, DONT_TOUCH *)
	LUT6_2 #(
		.INIT(64'h8000_1CE0_0000_0001)
	) luta (
		.I0(din[0]),
		.I1(din[1]),
		.I2(din[2]),
		.I3(din[3]),
		.I4(din[4]),
		.I5(din[5]),
		.O5(lutno5[0]),
		.O6(lutno6[0]));
    //Outputs do not have to be used, will stay without them
	(* LOC=LOC, KEEP, DONT_TOUCH *)
    CARRY4 carry4(.O(caro_all), .CO(carco_all), .DI(lutno5), .S(lutno6), .CYINIT(1'b0), .CI());
    generate
        if (N == 3) begin
	        (* LOC=LOC, BEL="D5FF", KEEP, DONT_TOUCH *)
	        FDPE d5ff (
		        .C(clk),
		        .Q(ff_q),
		        .CE(1'b1),
		        .PRE(1'b0),
		        .D(lutno5[3]));
        end
        if (N == 2) begin
	        (* LOC=LOC, BEL="C5FF", KEEP, DONT_TOUCH *)
	        FDPE c5ff (
		        .C(clk),
		        .Q(ff_q),
		        .CE(1'b1),
		        .PRE(1'b0),
		        .D(lutno5[2]));
        end
        if (N == 1) begin
	        (* LOC=LOC, BEL="B5FF", KEEP, DONT_TOUCH *)
	        FDPE b5ff (
		        .C(clk),
		        .Q(ff_q),
		        .CE(1'b1),
		        .PRE(1'b0),
		        .D(lutno5[1]));
        end
        if (N == 0) begin
	        (* LOC=LOC, BEL="A5FF", KEEP, DONT_TOUCH *)
	        FDPE a5ff (
		        .C(clk),
		        .Q(ff_q),
		        .CE(1'b1),
		        .PRE(1'b0),
		        .D(lutno5[0]));
        end
    endgenerate
endmodule