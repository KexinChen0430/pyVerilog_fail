module aes_192 (state, key, out);
    input  [127:0] state;
    input  [191:0] key;
    output [127:0] out;
    reg    [127:0] s0;
    reg    [191:0] k0;
    wire   [127:0] s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11;
    wire   [191:0] k1, k2, k3, k4, k5, k6, k7, k8, k9, k10, k11;
    wire   [127:0] k0b, k1b, k2b, k3b, k4b, k5b, k6b, k7b, k8b, k9b, k10b, k11b;
    always @ (*)
      begin
        s0 <= state ^ key[191:64];
        k0 <= key;
      end
    expand_key_type_D_192  a0 (k0, 8'h1,   k1,  k0b);
    expand_key_type_B_192  a1 (k1,         k2,  k1b);
    expand_key_type_A_192  a2 (k2, 8'h2,   k3,  k2b);
    expand_key_type_C_192  a3 (k3, 8'h4,   k4,  k3b);
    expand_key_type_B_192  a4 (k4,         k5,  k4b);
    expand_key_type_A_192  a5 (k5, 8'h8,   k6,  k5b);
    expand_key_type_C_192  a6 (k6, 8'h10,  k7,  k6b);
    expand_key_type_B_192  a7 (k7,         k8,  k7b);
    expand_key_type_A_192  a8 (k8, 8'h20,  k9,  k8b);
    expand_key_type_C_192  a9 (k9, 8'h40, k10,  k9b);
    expand_key_type_B_192 a10 (clk,k10,        k11, k10b);
    expand_key_type_A_192 a11 (clk,k11, 8'h80,    , k11b);
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
        r11 (s10, k10b, s11);
    final_round
        rf (s11, k11b, out);
endmodule