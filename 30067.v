module D_ff_with_ce_and_synch_reset_behavior_tb(
    );
    reg D, Clk, reset, ce;
    wire Q;
    D_ff_with_ce_and_synch_reset_behavior DUT (.D(D), .Clk(Clk), .reset(reset), .ce(ce), .Q(Q));
    initial begin
        #300 $finish;
    end
    initial begin
        D = 0; Clk = 0; reset = 0; ce = 0;
        #10 Clk = 1;
        #10 Clk = 0; D = 1;
        #10 Clk = 1;
        #10 Clk = 0;
        #10 Clk = 1;
        #10 Clk = 0; ce = 1;
        #10 Clk = 1;
        #10 Clk = 0; ce = 0;
        #10 Clk = 1;
        #10 Clk = 0; D = 0;
        #10 Clk = 1;
        #10 Clk = 0; reset = 1;
        #10 Clk = 1;
        #10 Clk = 0; reset = 0;
        #10 Clk = 1;
        #10 Clk = 0;
        #10 Clk = 1;
        #10 Clk = 0; ce = 1;
        #10 Clk = 1;
        #10 Clk = 0; ce = 0;
        #10 Clk = 1;
        #10 Clk = 0; D = 1;
        #10 Clk = 1;
        #10 Clk = 0;
        #10 Clk = 1;
        #10 Clk = 0; ce = 1;
        #10 Clk = 1;
        #10 Clk = 0; ce = 0;
        #10 Clk = 1;
        #10 Clk = 0;
    end
endmodule