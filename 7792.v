module COMPARE
    #(parameter DEPTH = 10, ALMOST_FULL = 4 /* 32 Elements */)
    (input  [DEPTH:0] wptr, rptr,
    output wire      empty, full);
    /*************************************************************************
    assign empty = (wptr[DEPTH:0] == rptr[DEPTH:0]);
    // assign full  = (wptr[DEPTH] != rptr[DEPTH]) & (wptr[DEPTH-1:0] == rptr[DEPTH-1:0]);
    assign full  = (wptr[DEPTH] != rptr[DEPTH]) & (wptr[DEPTH-1: ALMOST_FULL] == rptr[DEPTH-1: ALMOST_FULL]);
    // synthesis translate off
    always@(full or empty) begin
        $display("current depth is %0d, current empty is %0d, current full is %0d", DEPTH, empty, full);
    end
    // synthesis translate on
endmodule