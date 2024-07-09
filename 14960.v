module my_fpga_test_count_up_1k;
    reg clk = 0, n_rst = 0;
    reg up = 0, dn = 0;
    wire [31:0] cnt;
    wire [3:0] cnt_1k;
    reg in1 = 0, in2 = 0;
    wire out1, out2;
    time t, u;
    my_fpga uut(clk, n_rst, up, dn, cnt, cnt_1k, in1, in2, out1, out2);
    tbmsgs msgs();
    always
        #5 clk = ~clk;
    initial
    begin
        msgs.testcase("my_fpga count up 1k", 1);
        #1000
        n_rst = 1;
        #1000
        @(negedge clk);
        up <= 1;
        // wait until cnt_1k output is 0x1
        begin : break1
            while (1) begin
                @(negedge clk);
                if (cnt_1k == 4'h1) begin
                    t = $time;
                    disable break1;
                end
            end
        end
        // wait until cnt_1k output is 0xb
        begin : break2
            while (1) begin
                @(negedge clk);
                if (cnt_1k == 4'hb) begin
                    t = $time - t;
                    disable break2;
                end
            end
        end
        msgs.check(t > `ms(10) - `ns(100) && t < `ms(10) + `ns(100),
                "cnt_1k output should count at 1KHz");
        msgs.tested("count 1k output");
        msgs.testcase_complete();
        $finish;
    end
endmodule