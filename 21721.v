module Parallel_in_serial_out_load_enable_behavior_tb(
    );
    reg [3:0] ParallelIn;
    reg Clk, ShiftIn, load, ShiftEn;
    wire [3:0] RegContent;
    wire ShiftOut;
    Parallel_in_serial_out_load_enable_behavior DUT (.Clk(Clk), .ShiftIn(ShiftIn), .ParallelIn(ParallelIn), .load(load), .ShiftEn(ShiftEn), .ShiftOut(ShiftOut), .RegContent(RegContent));
    initial begin
        #300 $finish;
    end
    initial begin
        Clk = 0; ShiftIn = 1; ParallelIn = 0; load = 0; ShiftEn = 0;
        #10 Clk = 1;
        #10 Clk = 0; ParallelIn = 4'b0101;
        #10 Clk = 1;
        #10 Clk = 0;
        #10 Clk = 1; // 50ns
        #10 Clk = 0; load = 1;
        #10 Clk = 1;
        #10 Clk = 0; load = 0;
        #10 Clk = 1;
        #10 Clk = 0; ShiftEn = 1;// 100ns
        #10 Clk = 1;
        #10 Clk = 0;
        #10 Clk = 1;
        #10 Clk = 0;
        #10 Clk = 1; // 150ns
        #10 Clk = 0;
        #10 Clk = 1;
        #10 Clk = 0; ParallelIn = 4'b1001;
        #10 Clk = 1;
        #10 Clk = 0; load = 1;// 200ns
        #10 Clk = 1;
        #10 Clk = 0; load = 0;
        #10 Clk = 1;
        #10 Clk = 0;
        #10 Clk = 1; //250ns
        #10 Clk = 0;
        #10 Clk = 1;
        #5  load = 1;
        #5 Clk = 0;
        #10 Clk = 1;
        #5 load = 0;
        #5 Clk = 0; // 300ns
    end
endmodule