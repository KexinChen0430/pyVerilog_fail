module aes_128(state, key, out);
    input  [127:0] state, key;
    output [127:0] out;
    reg    [127:0] s0, k0;
    wire   [127:0] s1, s2, s3, s4, s5, s6, s7, s8, s9,
                   k1, k2, k3, k4, k5, k6, k7, k8, k9,
                   k0b, k1b, k2b, k3b, k4b, k5b, k6b, k7b, k8b, k9b;
    always @ (*)
      begin
        s0 <= state ^ key;
        k0 <= key;
      end
    expand_key_128
        a1 (k0, k1, k0b, 8'h1),
        a2 (k1, k2, k1b, 8'h2),
        a3 (k2, k3, k2b, 8'h4),
        a4 (k3, k4, k3b, 8'h8),
        a5 (k4, k5, k4b, 8'h10),
        a6 (k5, k6, k5b, 8'h20),
        a7 (k6, k7, k6b, 8'h40),
        a8 (k7, k8, k7b, 8'h80),
        a9 (k8, k9, k8b, 8'h1b),
       a10 (k9,   , k9b, 8'h36);
    one_round
        r1 (s0, k0b, s1),
        r2 (s1, k1b, s2),
        r3 (s2, k2b, s3),
        r4 (s3, k3b, s4),
        r5 (s4, k4b, s5),
        r6 (s5, k5b, s6),
        r7 (s6, k6b, s7),
        r8 (s7, k7b, s8),
        r9 (s8, k8b, s9);
    final_round
        rf (s9, k9b, out);
endmodule