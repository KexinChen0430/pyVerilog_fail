module registerfile(
    Q1,Q2.DI,clk,reset written,AD,A1,A2
);
    output [31:0] Q1,Q2;
    input [31:0] DI;
    input clk,reset,written;
    input [4:0] AD,A1,A2;
    wire [31:0] decoderout,regen;
    wire [31:0] q[31:0];
    decoder dec_0(decoderout,AD);
    assign regen[0] = decoderout[0]& written;
    assign regen[1] = decoderout[1]& written;
    //省略
    assign regen[31] = decoderout[31]& written;
    regesiter reg_0(q[0],DI,clk,reset,regen[0]);
    regesiter reg_1(q[1],DI,clk,reset,regen[1]);
    //省略
    regesiter reg_31(q[31],DI,clk,reset,regen[31]);
    mux_32 mux_1(Q1,q,A1);
    mux_32 mux_2(Q2,q,A2);
endmodule