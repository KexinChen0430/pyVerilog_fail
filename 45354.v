module Data_path_with_mux_adder_register_tb(
    );
    parameter DATA_WIDTH = 16;
    reg Clk, reset, s0, s1, s2, s3;
    reg [(DATA_WIDTH - 1):0] reset_value;
    wire [(DATA_WIDTH - 1):0] s0_o, s1_o, s2_o, s3_o, r0_o, r1_o, acc_o, s;
    integer i, j;
    Data_path_with_mux_adder_register #(DATA_WIDTH) DUT (.Clk(Clk), .reset(reset), .reset_value(reset_value), .s0(s0), .s1(s1), .s2(s2), .s3(s3), .s0_o(s0_o), .s1_o(s1_o), .s2_o(s2_o), .s3_o(s3_o), .r0_o(r0_o), .r1_o(r1_o), .acc_o(acc_o), .s(s));
    initial begin
            #650 $finish;
    end
    initial begin
        Clk = 0;
        for (i = 0; i < 65; i = i + 1) begin
            #10 Clk = ~Clk;
        end
    end
    initial begin
        reset = 0;
        {s3, s2, s1, s0} = 4'b0000;
        reset_value = {{(DATA_WIDTH/2){1'b0}}, {(DATA_WIDTH/2){1'b1}}};
        #10 reset = 1;
        #10 reset = 0;
        for (j = 1; j < 16; j = j + 1) begin
            #40 {s3, s2, s1, s0} = j;
        end
        #20;
    end
endmodule