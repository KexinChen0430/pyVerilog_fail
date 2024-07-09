module random_pool();
    parameter DEPTH = 3;
    parameter DATA_W = 16;
    reg [DATA_W-1:0] mem [0:DEPTH-1];
    integer head;
    integer tail;
    integer top;
    integer fullness;
    integer i;
    initial begin
        head = 0;
        top  = 0;
        fullness = 0;
        for (i = 0; i < DEPTH; i = i + 1) begin
            mem[i] = {DATA_W{1'b0}};
        end
    end
    task add_to_pool (input [DATA_W-1:0] data, output success);
    begin
        if (fullness == DEPTH) begin
            success = 1'b0;
        end
        else begin
            success = 1'b1;
            mem[head] = data;
            head = head + 1;
            fullness = fullness + 1;
        end
    end
    endtask
    task shuffle (output success);
    begin
        top = $random % DEPTH;
        success = 1'b1;
    end
    endtask
    task get_top (output [DATA_W-1:0] data);
    begin
        if (fullness == 0) begin
            $display("top on an empty fifo");
            $finish;
        end
        else begin
            data = mem[top];
            $display("Returning %x from pool", data);
            top = top + 1;
            if (top == fullness) begin
                top = 0;
            end
        end
    end
    endtask
    task shuffle_and_top(output [DATA_W-1:0] data);
    reg success;
    begin
        shuffle(success);
        get_top(data);
    end
    endtask
endmodule