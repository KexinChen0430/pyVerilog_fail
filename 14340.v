module io_stream_read_write_array_tb;
    localparam N = 255;
    `wire(Array, (`addrN, `intN), arr);
    wire `intT res;
    integer write_seed = 21;
    integer read_seed = 42;
    `reg(stream, `intN, sRA);
    `wire(stream, `intN, sR);
    `reg(stream, `intN, sWA);
    `reg(stream, `intN, sW);
    `wire(stream, 1, sB);
    reg  `intT sRA_next;
    assign sR_ready = out_ready;
    assign sB_ready = out_ready;
    `testbench(io_stream_read_write_array_tb, 1000)
    array #(.N(N))
      array(.clk(clk),
            `out(Array, 0, arr));
    `in_ready(inst);
    `inst_sync(io_stream_read_write_array, inst, #())(
      `sync(in_valid, out_ready),
      `in(Array, 0, arr),
      `in(stream, 1, sRA),
      `in(stream, 2, sWA),
      `in(stream, 3, sW),
      `out(stream, 0, sR),
      `out(null_stream, 1, sB));
    reg `addrT i;
    initial begin
        sRA  = 0;
        sRA_next = 0;
        sRA_valid = `true;
        sWA  = 0;
        sWA_valid = `false;
        sW = 0;
        sW_valid = `false;
        `start;
        // write some data
        for(i = 0; i < N; i = i + 1) begin
            sWA = i;
            sWA_valid = `true;
            sW = (i * 7) & 8'h7f;
            sW_valid = `true;
            `wait_for(sWA_ready && sW_ready);
            if($random(write_seed) & 1) begin
                sWA_valid = `false;
                sW_valid = `false;
                @(posedge clk);
                sWA_valid = `true;
                sW_valid = `true;
            end
        end
        sWA_valid = `false;
        sW_valid = `false;
        sWA = N;
        `wait_for(sRA == N-1 && sR_valid);
        nrst = `false;
        #2;
        $display("done");
        $finish;
    end
always @(posedge clk) begin
    if(sRA_ready) begin
        if(sRA_next < sWA & ($random(read_seed) & 1)) begin
            sRA <= sRA_next;
            sRA_next <= sRA_next + 1;
        end
    end
    if(sR_valid & sR != ((sRA * 7) & 8'h7f))
      $display("MISMATCH arr(%d) = %d", sRA, sR);
end
endmodule