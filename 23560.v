module Teste;
    reg [11:0] Ponto1X;
    reg [11:0] Ponto1Y;
    reg [11:0] Ponto2X;
    reg [11:0] Ponto2Y;
    reg [11:0] Ponto3X;
    reg [11:0] Ponto3Y;
    reg [11:0] PontoTX;
    reg [11:0] PontoTY;
    wire Dentro;
    TesteTriangulo A(Ponto1X, Ponto1Y, Ponto2X, Ponto2Y, Ponto3X, Ponto3Y, PontoTX, PontoTY, Dentro);
    initial
        begin
           $dumpvars(0,A);
           #1
           Ponto1X <= 10;
           Ponto1Y <= 10;
           Ponto2X <= 30;
           Ponto2Y <= 10;
           Ponto3X <= 20;
           Ponto3Y <= 30;
           PontoTX <= 15;
           PontoTY <= 15;
           #1
           PontoTX <= 15;
           PontoTY <= 15;
           #1
           PontoTX <= 9;
           PontoTY <= 15;
           #1
           PontoTX <= 10;
           PontoTY <= 11;
           #1
           PontoTX <= 30;
           PontoTY <= 11;
           #40
           $finish;
        end
endmodule