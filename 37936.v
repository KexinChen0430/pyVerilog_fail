module rca_dataflow_tb(
    );
    reg [3:0] a;
    reg [3:0] b;
    reg cin;
    wire cout;
    wire [3:0] s;
    integer i;
    integer j;
    rca_dataflow DUT (.a(a), .b(b), .cin(cin), .cout(cout), .s(s));
    initial begin
        #4000 $finish;
    end
    initial begin
        a = 0; b = 0; cin = 0;
        for (i = 0 ; i < 16; i = i + 1) begin
            #2 a = i;
            for (j = 0; j < 16; j = j + 1) begin
                #2 b = j;
                #5;
                if ({cout, s} == (a + b + cin)) $display("Test Passed");
                else $display("Test Failed: %b + %b + %b != %b%b", a, b, cin, cout, s);
            end
        end
        #2 cin = 1;
        #2
        for (i = 0 ; i < 16; i = i + 1) begin
            #2 a = i;
            for (j = 0; j < 16; j = j + 1) begin
                #2 b = j;
                #5;
                if ({cout, s} == (a + b + cin)) $display("Test Passed");
                else $display("Test Failed: %b + %b + %b != %b%b", a, b, cin, cout, s);
            end
        end
        #20;
    end
endmodule