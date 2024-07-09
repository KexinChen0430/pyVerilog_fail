module T_ff_enable_behavior_tb(
    );
    reg T, Clk, reset_n;
    wire Q;
    T_ff_enable_behavior DUT (.T(T), .Clk(Clk), .reset_n(reset_n), .Q(Q));
    initial begin
        #300 $finish;
    end
    initial begin
        T = 0; Clk = 0; reset_n = 0;
        #10 reset_n = 1;
        #10 Clk = 1;
        #10 Clk = 0; T = 1;
        #10 Clk = 1;
        #10 Clk = 0;
        #10 Clk = 1;
        #10 Clk = 0;
        #10 Clk = 1;
        #10 Clk = 0;
        #10 Clk = 1;
        #10 Clk = 0; T = 0;
        #10 Clk = 1;
        #10 Clk = 0; reset_n = 0;
        #10 Clk = 1;
        #10 Clk = 0; reset_n = 1;
        #10 Clk = 1;
        #10 Clk = 0;
        #10 Clk = 1;
        #10 Clk = 0;
        #10 Clk = 1;
        #10 Clk = 0;
        #10 Clk = 1;
        #10 Clk = 0; T = 1;
        #10 Clk = 1;
        #10 Clk = 0;
        #10 Clk = 1;
        #10 Clk = 0;
        #10 Clk = 1;
        #10 Clk = 0;
        #10 Clk = 1;
        #10 Clk = 0;
    end
endmodule