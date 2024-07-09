module aes_256 (state, key, out);
    input  [127:0] state;
    input  [255:0] key;
    output [127:0] out;
    reg    [127:0] s0;
    reg    [255:0] k0, k0a, k1;
    wire   [127:0] s1, s2, s3, s4, s5, s6, s7, s8,
                   s9, s10, s11, s12, s13;
    wire   [255:0] k2, k3, k4, k5, k6, k7, k8,
                   k9, k10, k11, k12, k13;
    wire   [127:0] k0b, k1b, k2b, k3b, k4b, k5b, k6b, k7b, k8b,
                   k9b, k10b, k11b, k12b, k13b;
    always @ (*)
      begin
        s0 <= state ^ key[255:128];
        k0 <= key;
        k0a <= k0;
        k1 <= k0a;
      end
    assign k0b = k0a[127:0];
    expand_key_type_A_256
        a1 (k1, 8'h1, k2, k1b),
        a3 (k3, 8'h2, k4, k3b),
        a5 (k5, 8'h4, k6, k5b),
        a7 (k7, 8'h8, k8, k7b),
        a9 (k9, 8'h10, k10, k9b),
        a11 (k11, 8'h20, k12, k11b),
        a13 (k13, 8'h40,    , k13b);
    expand_key_type_B_256
        a2 (k2, k3, k2b),
        a4 (k4, k5, k4b),
        a6 (k6, k7, k6b),
        a8 (k8, k9, k8b),
        a10 (k10, k11, k10b),
        a12 (k12, k13, k12b);
    one_round
         r1 (s0, k0b, s1),
         r2 (s1, k1b, s2),
         r3 (s2, k2b, s3),
         r4 (s3, k3b, s4),
         r5 (s4, k4b, s5),
         r6 (s5, k5b, s6),
         r7 (s6, k6b, s7),
         r8 (s7, k7b, s8),
         r9 (s8, k8b, s9),
        r10 (s9, k9b, s10),
        r11 (s10, k10b, s11),
        r12 (s11, k11b, s12),
        r13 (s12, k12b, s13);
    final_round
        rf (s13, k13b, out);
endmodule