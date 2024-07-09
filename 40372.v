module lab3_tb();
    reg INPUT,Clk, reset;
    parameter DELAY=10;
    parameter TIME=150;
    wire OUT;
    integer i;
    lab3_d DUT (.INPUT(INPUT), .Clk(Clk), .OUT(OUT), .reset(reset));
    initial
    begin
    #TIME $finish;
    end
    initial begin
        Clk = 0;
        for (i = 0; i < (TIME/DELAY); i = i + 1) begin
            #DELAY Clk = ~Clk;
        end
    end
    initial
    begin
    reset = 1; INPUT = 0;
    #(2*DELAY) reset = 0;
    #DELAY INPUT=1;
    #(2*DELAY) INPUT=1;
    #(2*DELAY) INPUT=0;
    #(2*DELAY) INPUT=1;
    #(2*DELAY) INPUT=0;
    #(2*DELAY) INPUT=0;
    #(2*DELAY) INPUT=0;
    #DELAY;
    end
endmodule