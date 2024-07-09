module bch_chien_counter #(
	parameter [`BCH_PARAM_SZ-1:0] P = `BCH_SANE,
	parameter BITS = 1
) (
	input clk,
	input first,		/* First valid output data */
	output last,		/* Last valid output cycle */
	output valid		/* Outputting data */
);
	`include "bch.vh"
	localparam TCQ = 1;
	localparam CYCLES = (`BCH_DATA_BITS(P) + BITS - 1) / BITS;
	localparam M = `BCH_M(P);
	if (CYCLES == 1) begin
		assign last = first;
		assign valid = first;
	end else begin
		reg _valid = 0;
		reg _last = 0;
		wire penult;
		if (CYCLES == 2)
			assign penult = first;
		else if (CYCLES == 3)
			assign penult = valid && !last;
		else begin
			wire [M-1:0] count;
			lfsr_counter #(M) u_counter(
				.clk(clk),
				.reset(first),
				.ce(valid),
				.count(count)
			);
			assign penult = count == lfsr_count(M, CYCLES - 3);
		end
		always @(posedge clk) begin
			if (first)
				_valid <= #TCQ 1;
			else if (last)
				_valid <= #TCQ 0;
			_last <= #TCQ penult;
		end
		assign last = _last;
		assign valid = _valid;
	end
endmodule