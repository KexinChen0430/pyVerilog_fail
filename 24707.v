module down_counter_tb(
    );
    parameter COUNT = 100;
    parameter DELAY = 10;
    parameter TIME = (COUNT * DELAY);
    reg clk, start;
    wire cnt_done;
    integer i;
    down_counter #(5) DUT (start, clk, cnt_done);
    initial begin
        #TIME $finish;
    end
    initial begin
        clk = 0;
        for (i = 0; i < COUNT; i = i + 1) begin
            #DELAY clk = ~clk;
        end
    end
    initial begin
        start = 0;
        #DELAY start = 1;
        #DELAY start = 0;
    end
endmodule