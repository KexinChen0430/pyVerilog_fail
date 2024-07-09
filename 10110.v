module f3m_add(A, B, C);
    input [`WIDTH : 0] A, B;
    output [`WIDTH : 0] C;
    genvar i;
    generate
        for(i=0; i<`M; i=i+1) begin: aa
            f3_add aa(A[(2*i+1) : 2*i], B[(2*i+1) : 2*i], C[(2*i+1) : 2*i]);
        end
    endgenerate
endmodule