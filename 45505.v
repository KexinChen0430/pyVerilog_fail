module test;
    reg[`WIDTH-1:0] a, b;
    reg[`WIDTH-1:0] result, corr_result;
    wire[`WIDTH-1:0] out, remainder;
    reg start = 1'b0;
    reg next_reg = 1'b0;
    wire clk, reset, ready, next;
    assign next = next_reg;
    integer t;
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars;
        #10 start = 1'b1;
        a = $random % 10;
        b = $random % 10;
        t = 0;
    end
    always @(posedge ready) begin
        $display("Result = %d, exp = %d", out, corr_result);
        start <= 1'b0;
        #10 next_reg<= 1'b1;
    end
    always @(posedge next) begin
        a <= $random % 10000;
        b <= $random % 10;
        #10 next_reg <= 1'b0;
        #1 corr_result <= a/b;
        #1 start <= 1'b1;
        t = t+1;
        if (t >= `TESTS-1)
            #10 $finish;
    end
    divider div(
        .start(start),
        .clk(clk),
        .dividend(b),
        .divisor(a),
        .quotient(out),
        .remainder(remainder),
        .ready(ready));
    sim my_sim(.clk(clk), .reset(reset));
endmodule