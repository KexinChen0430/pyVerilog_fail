module
        finish  <= 0;
        _clear  <= 1;
        _enable <= 0;
    end else begin
        // => should not enter this always loop : rw/s, r/w/s, r/ws
        _error[0] = 1;
    end
end
// 'for loop'
always @ (posedge clk) begin
    if (_start && ~_running && ~_waiting) begin
        // start loop with index i > 0 (doesn't handle i = 0)
        _running <= 1;
        _i = bitLength - 2;         // first bit is always 0 (sent in this if-block)
        if (_i == 0) begin
            // end loop condition
            _running <= 0;
            _waiting <= 1;
        end
    end else if (_start && _running & ~_waiting) begin
        // looping
        _i = _i - 1;
        if (_i == 1) begin          // signal delay to control block (this::line 60) compensation
            // end loop condition
            _running <= 0;
            _waiting <= 1;
        end
    end else if (_start && _waiting) begin
        // do nothing if waiting
    end else begin
        // iff not started
        _running = 0;
        _waiting = 0;
    end
end
assign state = {_start, _running, _waiting};
always @ (posedge clk) begin
    _sync_enable <= _enable;
end
always @ (posedge clk) begin
    _edge_useModule[1] <= _edge_useModule[0];
    _edge_useModule[0] <= useModule;
end
always @ (posedge clk) begin
    _sync_useModule <= useModule;
end
endmodule