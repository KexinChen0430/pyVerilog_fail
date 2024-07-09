module clock_get_all(input clk_origin, //需输入50MHz时钟，
                   input clkcnt_reset, //异步复位，低有效用于仿真
                    output out_clk_1khz, //对输入50k分频后输出时钟
                   output out_clk_100hz); //对输入时钟500k分频后输出
    wire clk_1ms; //千分之一秒
    wire clk_1cs; //百分之一秒
    assign out_clk_1khz = clk_1ms;
    assign out_clk_100hz = clk_1cs;
     clock_div_50k instan_div_50k (.clk(clk_origin),
                                   .clkcnt_reset(clkcnt_reset),
                                   .div_50k(clk_1ms)); //得毫秒时钟
     clock_div_500k instan_div_500k(.clk(clk_origin),
                                    .clkcnt_reset(clkcnt_reset),
                                    .div_500k(clk_1cs)); //得百分之一秒时钟
endmodule