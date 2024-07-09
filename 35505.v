module $__CMP2LCU (A, B, P, G, Y);
parameter AB_WIDTH = 0;
parameter AB_SIGNED = 0;
parameter LCU_WIDTH = 1;
parameter BUDGET = 0;
parameter CI = 0;
(* force_downto *)
input [AB_WIDTH-1:0] A; // A from original $gt/$ge
(* force_downto *)
input [AB_WIDTH-1:0] B; // B from original $gt/$ge
(* force_downto *)
input [LCU_WIDTH-1:0] P; // P of $lcu
(* force_downto *)
input [LCU_WIDTH-1:0] G; // G of $lcu
output Y;
parameter [AB_WIDTH-1:0] _TECHMAP_CONSTMSK_A_ = 0;
parameter [AB_WIDTH-1:0] _TECHMAP_CONSTMSK_B_ = 0;
parameter [LCU_WIDTH-1:0] _TECHMAP_CONSTMSK_P_ = 0;
generate
    if (AB_WIDTH == 0) begin
        (* force_downto *)
        wire [LCU_WIDTH-1:0] CO;
        $lcu #(.WIDTH(LCU_WIDTH)) _TECHMAP_REPLACE_ (.P(P), .G(G), .CI(CI), .CO(CO));
        assign Y = CO[LCU_WIDTH-1];
    end
    else begin
        if (_TECHMAP_CONSTMSK_A_[AB_WIDTH-1:0] && _TECHMAP_CONSTMSK_B_[AB_WIDTH-1:0])
            localparam COST = 0;
        else if (_TECHMAP_CONSTMSK_A_[AB_WIDTH-1:0] || _TECHMAP_CONSTMSK_B_[AB_WIDTH-1:0])
            localparam COST = 1;
        else
            localparam COST = 2;
        if (BUDGET < COST)
             $__CMP2LCU #(.AB_WIDTH(AB_WIDTH), .AB_SIGNED(AB_SIGNED), .LCU_WIDTH(LCU_WIDTH+1), .BUDGET(`LUT_WIDTH), .CI(CI))
                _TECHMAP_REPLACE_ (.A(A), .B(B), .P({P, 1'b1}), .G({G, 1'b0}), .Y(Y));
        else begin
            wire PP, GG;
            // Bit-wise equality (xnor) of A and B
            assign PP = A[AB_WIDTH-1] ^~ B[AB_WIDTH-1];
            if (AB_SIGNED)
                assign GG = ~A[AB_WIDTH-1] & B[AB_WIDTH-1];
            else if (_TECHMAP_CONSTMSK_P_[LCU_WIDTH-1]) // First compare for LUT if P (and G) is constant
                assign GG = A[AB_WIDTH-1] & ~B[AB_WIDTH-1];
            else
                // Priority "encoder" that checks A[i] == 1'b1 && B[i] == 1'b0
                //   from MSB down, deferring to less significant bits if the
                //   MSBs are equal
                assign GG = P[0] & (A[AB_WIDTH-1] & ~B[AB_WIDTH-1]);
            if (LCU_WIDTH == 1) begin
                // Propagate only if all pairs are equal
                //   (inconclusive evidence to say A >= B)
                wire P_ = P[0] & PP;
                // Generate if any comparisons call for it
                wire G_ = G[0] | GG;
            end
            else begin
                // Propagate only if all pairs are equal
                //   (inconclusive evidence to say A >= B)
                (* force_downto *)
                wire [LCU_WIDTH-1:0] P_ = {P[LCU_WIDTH-1:1], P[0] & PP};
                // Generate if any comparisons call for it
                (* force_downto *)
                wire [LCU_WIDTH-1:0] G_ = {G[LCU_WIDTH-1:1], G[0] | GG};
            end
            if (AB_WIDTH == 1)
               $__CMP2LCU #(.AB_WIDTH(AB_WIDTH-1), .AB_SIGNED(1'b0), .LCU_WIDTH(LCU_WIDTH), .BUDGET(BUDGET-COST), .CI(CI))
                    _TECHMAP_REPLACE_ (.A(), .B(), .P(P_), .G(G_), .Y(Y));
            else
               $__CMP2LCU #(.AB_WIDTH(AB_WIDTH-1), .AB_SIGNED(1'b0), .LCU_WIDTH(LCU_WIDTH), .BUDGET(BUDGET-COST), .CI(CI))
                    _TECHMAP_REPLACE_ (.A(A[AB_WIDTH-2:0]), .B(B[AB_WIDTH-2:0]), .P(P_), .G(G_), .Y(Y));
        end
    end
endgenerate
endmodule