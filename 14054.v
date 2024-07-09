module to take in PWM data and play it out on a one line speaker
    // mainly taken from:
    // http://www.fpga4fun.com/PWM_DAC.html
    // sigma delta PWM
    reg [16:0] PWM_accumulator;
    always @(posedge clk_i) begin
        PWM_accumulator[16:0] = PWM_accumulator[15:0] + {~din[15], din[14:0]}; // plus sigma
        dout = PWM_accumulator[16];
        //PWM_accumulator[16] = 0;        // delta : subtract 256
    end
endmodule