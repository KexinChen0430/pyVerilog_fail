module _4bit_mod8_counter_tb(
    );
    parameter COUNT = 100;
    parameter DELAY = 10;
    parameter TIME = COUNT*DELAY;
    reg CP,reset,M;
    wire [3:0] Q;
    wire Qcc_n;
    integer i;
    _4bit_mod8_counter DUT (.CP(CP), .reset(reset), .M(M), .Q(Q), .Qcc_n(Qcc_n));
    initial begin
        #TIME $finish;
    end
    initial begin
        CP = 0;
        for (i = 0; i < COUNT; i = i + 1) begin
            #DELAY CP = ~CP;
        end
    end
    initial begin
        reset = 1;
        #(2*DELAY) reset = 0;
        #(COUNT*DELAY/5) reset = 1;
        #(COUNT*DELAY/5) reset = 0;
        #(COUNT*DELAY/4) reset = 1;
        #(2*DELAY) reset = 0;
    end
    initial begin
        M = 1;
        #(COUNT*DELAY/2) M = 0;
    end
endmodule