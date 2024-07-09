module D_ff_behavior_tb(
    );
    reg D, Clk;
    wire Q;
    D_ff_behavior DUT (.D(D), .Clk(Clk), .Q(Q));
    initial begin
        #180 $finish;
    end
    initial begin
        Clk = 0; D = 0;
        #10 Clk = 1;
        #10 Clk = 0;
        #10 Clk = 1; D = 1;
        #10 Clk = 0;
        #10 Clk = 1;
        #10 Clk = 0; D = 0;
        #10 Clk = 1;
        #10 Clk = 0;
        #10 Clk = 1;
        #10 Clk = 0; D = 1;
        #10 Clk = 1;
        #10 Clk = 0; D = 0;
        #10 Clk = 1;
        #10 Clk = 0;
        #10 Clk = 1;
        #10 Clk = 0;
    end
endmodule