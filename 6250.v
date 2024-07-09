module stimulus_seven_seg;
    reg [3:0] bin_in = 0000;
    wire [6:0] led_out;
    reg clk;
    // instantiate the seven segment decoder
    seven_seg_decoder s1(led_out,bin_in);
    // We'll make a counter that counts from 00 to 1111
    // In order to do that, we'll need a clock
    initial
        clk = 1'b0;
    always
        #5 clk = ~clk; //toggle clock every 5 time units
    always @(posedge clk)
        bin_in = bin_in + 1;
    initial
    begin
        $monitor("At time",$time,"binary input=%b and hex output=%h\n",bin_in,led_out);
        #160 $stop;
    end
endmodule