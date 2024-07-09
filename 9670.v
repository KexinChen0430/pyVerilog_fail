module RAM32X2S (
  output O0, O1,
  input  D0, D1, WCLK, WE,
  input  A0, A1, A2, A3, A4
);
    parameter [31:0] INIT_00 = 32'bx;
    parameter [31:0] INIT_01 = 32'bx;
    parameter IS_WCLK_INVERTED = 0;
    DPRAM32 #(
        .INIT_00(INIT_00),
        .IS_WCLK_INVERTED(IS_WCLK_INVERTED)
    ) ram0 (
        .DI(D0),
        .A({A4, A3, A2, A1, A0}),
        .WA({A4, A3, A2, A1, A0}),
        .CLK(WCLK),
        .WE(WE),
        .O(O0)
    );
    DPRAM32 #(
        .INIT_00(INIT_01),
        .IS_WCLK_INVERTED(IS_WCLK_INVERTED)
    ) ram1 (
        .DI(D1),
        .A({A4, A3, A2, A1, A0}),
        .WA({A4, A3, A2, A1, A0}),
        .CLK(WCLK),
        .WE(WE),
        .O(O1),
    );
endmodule