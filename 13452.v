module mod_p(B, C);
    input [`WIDTH:0] B;
    output [`WIDTH:0] C;
    wire [`WIDTH+2:0] A;
    assign A = {B[`WIDTH:0], 2'd0}; // A == B*x
    wire [1:0] w0;
    f3_mult m0 (A[1187:1186], 2'd2, w0);
    f3_sub s0 (A[1:0], w0, C[1:0]);
    assign C[223:2] = A[223:2];
    wire [1:0] w112;
    f3_mult m112 (A[1187:1186], 2'd1, w112);
    f3_sub s112 (A[225:224], w112, C[225:224]);
    assign C[1185:226] = A[1185:226];
endmodule