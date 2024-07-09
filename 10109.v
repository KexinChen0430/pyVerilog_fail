module PPG(d, A, C);
    input [1:0] d;
    input [`WIDTH:0] A;
    output [`WIDTH:0] C;
    genvar i;
    generate
        for (i=0; i < `M; i=i+1)
        begin: ppg0
            f3_mult f3_mult_0 (d, A[2*i+1:2*i], C[2*i+1:2*i]);
        end
    endgenerate
endmodule