module to echo result back to us
            // Wait random time
            random_delay = $random % 1000000; // Up to 1 ms
            #(random_delay);
        end
        #1000000
        if (write_complete_received == 0)   $display("Test failed");
        else                                $display("Test passed");
        $stop;
    end
    // Receiver loop
    always begin
        for (j=0; j<test_receive_vector_len; j=j+1) begin
            recv_byte(received_byte);
            $display("Recv j: %d expect: %x val: %x", j, test_receive_vector[j], received_byte);
            if (received_byte != test_receive_vector[j]) $stop;
            if ((j+1) % 2 == 0) test_step_complete = 1;
        end
        write_complete_received = 1;
    end
    task xmit_byte();
        input [7:0] b;
        integer i;
        begin
            #8681 rx = 0; xmit = 1; // start bit
            for (i=0;i<8;i = i+1) begin
                #8681 rx = b[0]; xmit = 0; // 0
                b = {1'b0, b[7:1]};
            end
            #8681 rx = 1; // stop bit
        end
    endtask
    task recv_byte();
        output [7:0] b;
        integer i;
        begin
            b = 0;
            @ (negedge tx); // Wait for start bit
            recv = 1;
            #4340;          // Wait half a bit period to align sampling to middle of transition.
            // 8 times, wait a bit period and then sample the value, shifting in from left to right.
            for (i=0;i<8;i = i+1) begin
                b = {1'b0, b[7:1]};
                #8681 b[7] = tx; recv = 0;
            end
            #4340;          // Wait another half a bit period to give the stop bit some time to occur.
        end
    endtask
endmodule