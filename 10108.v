module mod_p(B, C);
    input [`WIDTH:0] B;
    output [`WIDTH:0] C;
    wire [`WIDTH+2:0] A;
    assign A = {B[`WIDTH:0], 2'd0}; // A == B*x
    wire [1:0] w0;
    f3_mult m0 (A[195:194], 2'd2, w0);
    f3_add s0 (A[1:0], {w0[0], w0[1]}, C[1:0]); //f3_sub s0 (A[1:0], w0, C[1:0]);
    assign C[23:2] = A[23:2];
    wire [1:0] w12;
    f3_mult m12 (A[195:194], 2'd1, w12);
    f3_add s12 (A[25:24], {w12[0], w12[1]}, C[25:24]); // f3_sub s12 (A[25:24], w12, C[25:24]);
    assign C[193:26] = A[193:26];
endmodule