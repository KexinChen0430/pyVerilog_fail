module my_fpga_test_count_dn;
    reg clk = 0, n_rst = 0;
    reg up = 0, dn = 0;
    wire [31:0] cnt;
    wire [3:0] cnt_1k;
    reg in1 = 0, in2 = 0;
    wire out1, out2;
    my_fpga uut(clk, n_rst, up, dn, cnt, cnt_1k, in1, in2, out1, out2);
    tbmsgs msgs();
    always
        #5 clk = ~clk;
    initial
    begin
        msgs.testcase("my_fpga count dn", 2);
        #1000
        n_rst = 1;
        #1000
        // check count is 0xfffffff6 after 10 clocks
        @(negedge clk);
        dn <= 1;
        repeat (10)
            @(negedge clk);
        msgs.check(cnt == 32'hfffffff6, "cnt should be 0xfffffff6");
        msgs.tested("count down to 0xfffffff6");
        // check count is 0xfffffc00 after another 1014 clocks
        repeat (1014)
            @(negedge clk);
        msgs.check(cnt == 32'hfffffc00, "cnt should be 0xfffffc00");
        msgs.tested("count down to 0xfffff400");
        msgs.testcase_complete();
        $finish;
    end
endmodule