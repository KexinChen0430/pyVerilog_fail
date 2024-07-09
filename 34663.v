module CIRCUIT5(a, b, c, Clk, Rst, x, z);
    input Clk, Rst;
    input [63:0] a, b, c;
    output [31:0] x, z;
    wire [63:0] d, e, f, g, h;
    wire dLTe, dEQe;
    wire [63:0] xrin, zrin;
    reg [63:0] greg, hreg;
    ADD #(64) add1(a, b, d);
    ADD #(64) add2(a, c, e);
    SUB #(64) sub1(a, b, f);
    COMP #(64) comp1(d, e, , , dEQe);
    COMP #(64) comp2(d, e, , dLTe, );
    MUX2x1 #(64) mux1(e, d, dLTe, g);
    MUX2x1 #(64) mux2(f, g, dEQe, h);
    SHL #(64) shl1(hreg, dLTe, xrin);
    SHR #(64) shr1(greg, dEQe, zrin);
    REG #(64) reg1(xrin, Clk, Rst, x);
    REG #(64) reg2(zrin, Clk, Rst, z);
    always @(g, h) begin
        greg <= g; hreg <= h;
    end
endmodule