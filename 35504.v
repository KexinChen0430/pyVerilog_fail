module _80_lcu_cmp_ (A, B, Y);
parameter A_SIGNED = 0;
parameter B_SIGNED = 0;
parameter A_WIDTH = 0;
parameter B_WIDTH = 0;
parameter Y_WIDTH = 0;
(* force_downto *)
input [A_WIDTH-1:0] A;
(* force_downto *)
input [B_WIDTH-1:0] B;
(* force_downto *)
output [Y_WIDTH-1:0] Y;
parameter _TECHMAP_CELLTYPE_ = "";
generate
    if (_TECHMAP_CELLTYPE_ == "" || `LUT_WIDTH < 2)
        wire _TECHMAP_FAIL_ = 1;
    else if (_TECHMAP_CELLTYPE_ == "$lt") begin
        // Transform $lt into $gt by swapping A and B
        $gt #(.A_SIGNED(B_SIGNED), .B_SIGNED(A_SIGNED), .A_WIDTH(B_WIDTH), .B_WIDTH(A_WIDTH), .Y_WIDTH(Y_WIDTH)) _TECHMAP_REPLACE_ (.A(B), .B(A), .Y(Y));
    end
    else if (_TECHMAP_CELLTYPE_ == "$le") begin
        // Transform $le into $ge by swapping A and B
        $ge #(.A_SIGNED(B_SIGNED), .B_SIGNED(A_SIGNED), .A_WIDTH(B_WIDTH), .B_WIDTH(A_WIDTH), .Y_WIDTH(Y_WIDTH)) _TECHMAP_REPLACE_ (.A(B), .B(A), .Y(Y));
    end
    else begin
        // Perform sign extension on A and B
        localparam WIDTH = A_WIDTH > B_WIDTH ? A_WIDTH : B_WIDTH;
        (* force_downto *)
        wire [WIDTH-1:0] AA = {{(WIDTH-A_WIDTH){A_SIGNED ? A[A_WIDTH-1] : 1'b0}}, A};
        (* force_downto *)
        wire [WIDTH-1:0] BB = {{(WIDTH-B_WIDTH){B_SIGNED ? B[B_WIDTH-1] : 1'b0}}, B};
        // For $ge operation, start with the assumption that A and B are
        //   equal (propagating this equality if A and B turn out to be so)
        if (_TECHMAP_CELLTYPE_ == "$ge")
            localparam CI = 1'b1;
        else
            localparam CI = 1'b0;
        $__CMP2LCU #(.AB_WIDTH(WIDTH), .AB_SIGNED(A_SIGNED && B_SIGNED), .LCU_WIDTH(1), .BUDGET(`LUT_WIDTH), .CI(CI))
            _TECHMAP_REPLACE_ (.A(AA), .B(BB), .P(1'b1), .G(1'b0), .Y(Y));
    end
endgenerate
endmodule