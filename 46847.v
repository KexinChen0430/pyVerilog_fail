module DCIRESET (LOCKED, RST);
    output LOCKED;
    input  RST;
`ifdef XIL_TIMING
    parameter LOC = "UNPLACED";
`endif
    time   sample_rising, sample_falling;
    always @(RST)
        begin
            if (RST)
                sample_rising = $time;
            else if (!RST)
                sample_falling = $time;
            if (sample_falling - sample_rising < 100000)
                $display ("Timing Violation Error : The high pulse of RST signal at time %.3f ns in DCIRESET has to be greater than 100 ns", $time/1000.0);
            if (sample_rising - sample_falling < 100000)
                $display ("Timing Violation Error : The low pulse of RST signal at time %.3f ns in DCIRESET has to be greater than 100 ns", $time/1000.0);
        end // always @ (RST)
    assign #(100000, 0) LOCKED = RST ? 1'b0 : 1'b1;
`ifdef XIL_TIMING
  specify
      (RST => LOCKED) = (0:0:0, 0:0:0);
      specparam PATHPULSE$ = 0;
  endspecify
`endif
endmodule