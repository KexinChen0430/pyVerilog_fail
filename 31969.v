module edge_detect_sim;
    reg clk, async;
    wire rise, fall;
    edge_detect uut (
        .async_sig(async),
        .clk(clk),
        .rise(rise),
        .fall(fall)
    );
    initial begin
      clk = 0;
      async = 0;
      while ($time < 1000) begin
        clk <= ~clk;
        #5; // ns
      end
    end
    // Produce a randomly-changing async signal.
    integer seed;
    time delay;
    initial
    begin
        while ($time < 1000) begin
            @(negedge clk);
            // wait for a random number of ns
            delay = $dist_uniform(seed, 50, 100);
            #delay;
            async = ~ async;
        end
    end
endmodule