module full_adder_tb(
    );
    parameter TIME = 600;
    parameter DELAY = 50;
    reg Ai,Bi,Ci_1;
    wire F,Si,Ci;
    integer i, j;
//    full_adder DUT (.Ai(Ai), .Bi(Bi), .Ci_1(Ci_1), .F(F), .Ci(Ci), .Si(Si));
    full_adder_fix DUT (.Ai(Ai), .Bi(Bi), .Ci_1(Ci_1), .F(F), .Ci(Ci), .Si(Si));
    initial begin
        #TIME $finish;
    end
    initial
    begin
    Ai = 0; Bi = 0;
    Ci_1 = 0;
    for (i = 0;i < 2; i = i + 1) begin
        #DELAY Ai = i;
        for (j = 0;j < 2;j = j + 1) begin
        #DELAY Bi = j;
        end
    end
    Ci_1 = 1;
    for (i = 0;i < 2; i = i + 1) begin
        #DELAY Ai = i;
        for (j = 0;j < 2;j = j + 1) begin
        #DELAY Bi = j;
        end
    end
    end
endmodule