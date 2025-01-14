module counters_8bit_with_TD_ff_tb(
    );
    reg Clk, Enable, Clear;
    wire [7:0] Q;
    counters_8bit_with_TD_ff DUT (.Clk(Clk), .Enable(Enable), .Clear(Clear), .Q(Q));
    initial begin
        #500 $finish;
    end
    initial begin
        Clk = 0; Enable = 0; Clear = 0;
        #5 Clk = 1;
        #5 Clk = 0; // 10ns
        #5 Clk = 1;
        #5 Clk = 0; Enable = 1;
        #5 Clk = 1;
        #5 Clk = 0;
        #5 Clk = 1;
        #5 Clk = 0; Clear = 1;
        #5 Clk = 1;
        #5 Clk = 0; // 50ns
        #5 Clk = 1;
        #5 Clk = 0;
        #5 Clk = 1;
        #5 Clk = 0;
        #5 Clk = 1;
        #5 Clk = 0;
        #5 Clk = 1;
        #5 Clk = 0; // 90ns
        #5 Clk = 1;
        #5 Clk = 0; // 100ns
        #5 Clk = 1;
        #5 Clk = 0; // 110ns
        #5 Clk = 1;
        #5 Clk = 0; Enable = 0;
        #5 Clk = 1;
        #5 Clk = 0;
        #5 Clk = 1;
        #5 Clk = 0;
        #5 Clk = 1;
        #5 Clk = 0; // 150ns
        #5 Clk = 1;
        #5 Clk = 0;
        #5 Clk = 1;
        #5 Clk = 0;
        #5 Clk = 1;
        #5 Clk = 0;
        #5 Clk = 1;
        #5 Clk = 0; // 190ns
        #5 Clk = 1;
        #5 Clk = 0; Enable = 1;// 200ns
        #5 Clk = 1;
        #5 Clk = 0; // 210ns
        #5 Clk = 1;
        #5 Clk = 0;
        #5 Clk = 1;
        #5 Clk = 0;
        #5 Clk = 1;
        #5 Clk = 0;
        #5 Clk = 1;
        #5 Clk = 0; // 250ns
        #5 Clk = 1;
        #5 Clk = 0;
        #5 Clk = 1;
        #5 Clk = 0;
        #5 Clk = 1;
        #5 Clk = 0;
        #5 Clk = 1;
        #5 Clk = 0; // 290ns
        #5 Clk = 1;
        #5 Clk = 0; // 300ns
        #5 Clk = 1;
        #5 Clk = 0; // 310ns
        #5 Clk = 1;
        #5 Clk = 0;
        #5 Clk = 1;
        #5 Clk = 0;
        #5 Clk = 1;
        #5 Clk = 0;
        #5 Clk = 1;
        #5 Clk = 0; // 350ns
        #5 Clk = 1;
        #5 Clk = 0;
        #5 Clk = 1;
        #5 Clk = 0;
        #5 Clk = 1;
        #5 Clk = 0;
        #5 Clk = 1;
        #5 Clk = 0; // 390ns
        #5 Clk = 1;
        #5 Clk = 0; // 400ns
        #5 Clk = 1;
        #5 Clk = 0; // 410ns
        #5 Clk = 1;
        #5 Clk = 0;
        #5 Clk = 1;
        #5 Clk = 0;
        #5 Clk = 1;
        #5 Clk = 0;
        #5 Clk = 1;
        #5 Clk = 0; // 450ns
        #5 Clk = 1;
        #5 Clk = 0;
        #5 Clk = 1;
        #5 Clk = 0;
        #5 Clk = 1;
        #5 Clk = 0;
        #5 Clk = 1;
        #5 Clk = 0; // 490ns
        #5 Clk = 1;
        #5 Clk = 0; // 500ns
    end
endmodule