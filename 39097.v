module cam ();
parameter DEPTH = 100;
parameter KEY_W = 8;
parameter DATA_W = 16;
reg [DATA_W-1:0] data_mem [0:DEPTH-1];
reg [KEY_W-1:0]  key_mem  [0:DEPTH-1];
reg              valids   [0:DEPTH-1];
integer          initial_idx;
task invalidate (input x);
integer i = 0;
begin
    for (i = 0; i < DEPTH; i = i + 1) begin
        data_mem[i] = 0;
        key_mem [i] = 0;
        valids  [i] = 0;
    end
end
endtask
initial begin
    invalidate(1);
end
    task add_pair (input [KEY_W-1:0] key, input [DATA_W-1:0] data);
    reg exists = 0;
    integer key_idx = 0;
    integer insert_idx = 0;
    integer i = 0;
    begin
        for (i = 0; i < DEPTH; i = i+1) begin
            if (key_mem[i] == key && valid[i]) begin
                exists = 1;
                key_idx = i;
            end
        end
        if (exists) begin
            $display("WARNING: Key %x exists with data : %x", key, data_mem[key_idx]);
        end
        else begin
            for (insert_idx = 0; insert_idx < DEPTH; insert_idx = insert_idx + 1) begin : FIND_INSERT_IDX
                if (!valids[insert_idx])
                    disable FIND_INSERT_IDX;
            end
            //Does the for loop increment the idx after the condition evaluates false? if yes then
            if (insert_idx == DEPTH) begin
            //else
            //if (valids[insert_idx]) begin
                $display("CAM IS FULL");
            end
            else begin
                $display("Add key pair %x : %x at index %d", key, data, head);
                key_mem[insert_idx] = key;
                data_mem[insert_idx] = data;
                valids[insert_idx] = 1'b1;
            end
        end
    end
    endtask
    task find_value_by_key (input [KEY_W-1:0] key, output [DATA_W-1:0] data, output found);
    integer i = 0;
    begin
        found = 1'b0;
        for (i = 0; i < DEPTH; i = i+1) begin : FIND_BLOCK
            if (key_mem[i] == key && valids[i]) begin
                found = 1;
                data = data_mem[i];
                disable FIND_BLOCK;
            end
        end
    end
    endtask
    task next (inout integer index, output valid);
    begin
        valid = 1'b0;
        while (index < DEPTH) begin : LOOP
            if (valids[index]) begin
                valid = 1'b1;
                disable LOOP;
            end
            else begin
                index = index + 1;
            end
        end
    end
    endtask
    task get_pair_by_index (input integer index, output [KEY_W-1:0] key, output [DATA_W-1:0], output success);
    integer i = 0;
    integer idx = 0;
    reg valid = 1;
    begin
        success = 1'b0;
        while (valid) begin : SEARCH_LOOP
            next(i, valid);
            if (idx == index) begin
                key = key_mem[i];
                data = key_mem[i];
                success = 1'b1;
                disable SEARCH_LOOP;
            end
            else begin
                idx = idx + 1;
            end
        end
        success = 1'b0;
    end
    endtask
    /*
    task get_index_by_key (input [KEY_W-1:0] key, output integer index, output success);
    endtask
    */
endmodule