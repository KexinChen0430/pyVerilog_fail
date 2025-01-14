module testFIFO();
// Inputs
    reg [23:0] data_in;
    reg wr_en;
    reg rd_en;
    reg n_reset;
    reg clk;
// Outputs
    wire [23:0] data_out;
    wire [4:0] data_count;
    wire empty;
    wire full;
    wire almst_empty;
    wire almst_full;
    wire err;
// variable for test vectors
	reg [23:0] test_vec;
// Bidirs
// Instantiate the UUT
// Please check and add your parameters manually
    FIFO_v UUT (
        .data_out(data_out),
        .data_count(data_count),
        .empty(empty),
        .full(full),
        .almst_empty(almst_empty),
        .almst_full(almst_full),
        .err(err),
        .data_in(data_in),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .n_reset(n_reset),
        .clk(clk)
        );
// Initialize Inputs
// You can add your stimulus here
    initial begin
			$display ($time, " << Starting the Simulation >> ");
			clk = 1'b 0;
            data_in = 24'b 0;
            wr_en = 1'b 0;
            rd_en = 1'b 0;
			n_reset = 1'b 0;
    end
	always
			#10 clk = ~clk;    // every ten nanoseconds invert the clock
	always
		begin
			#30
			n_reset = 1'b 1;
			// write to fifo
			for(test_vec=0; test_vec < 17; test_vec = test_vec + 1)
				begin
					#20
					wr_en = 1'b 1;
					data_in = test_vec;
					#20
					wr_en = 1'b 0;
				end
			// read from fifo
			for(test_vec=0; test_vec < 17; test_vec = test_vec + 1)
				begin
					#20
					rd_en = 1'b 1;
					#20
					rd_en = 1'b 0;
				end
			// write to fifo
			for(test_vec=0; test_vec < 15; test_vec = test_vec + 1)
				begin
					#20
					wr_en = 1'b 1;
					data_in = test_vec;
					#20
					wr_en = 1'b 0;
				end
			// read from fifo
			for(test_vec=0; test_vec < 11; test_vec = test_vec + 1)
				begin
					#20
					rd_en = 1'b 1;
					#20
					rd_en = 1'b 0;
				end
			// read and write to fifo
			for(test_vec=0; test_vec < 11; test_vec = test_vec + 1)
				begin
					#20
					rd_en = 1'b 1;
					wr_en = 1'b 1;
					data_in = test_vec;
					#20
					rd_en = 1'b 0;
					wr_en = 1'b 0;
				end
			// read from fifo
			for(test_vec=0; test_vec < 7; test_vec = test_vec + 1)
				begin
					#20
					rd_en = 1'b 1;
					#20
					rd_en = 1'b 0;
				end
			// write to fifo
			for(test_vec=0; test_vec < 13; test_vec = test_vec + 1)
				begin
					#20
					wr_en = 1'b 1;
					data_in = test_vec;
					#20
					wr_en = 1'b 0;
				end
			#10
			n_reset = 1'b 1;
		end
endmodule