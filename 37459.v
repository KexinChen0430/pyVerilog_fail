module).
    if (!ready)
      `assert(!(go && !go_prev));
    // Invariant: priority encoder produces defined results
    if (!`isunknown(den))
      `assert_nox(den_msb);
    if (!`isunknown(rem))
      `assert_nox(rem_msb);
    // Postcondition: outputs are correct
    if (ready && !ready_prev && !error) begin
      `assert_lt(rem, den);
      `assert_eq(den*quot + rem, num);
    end
  end
end
`endif
`ifdef SIM
//  initial
//    $monitor("%t: go=%h, num=%0d, den=%0d, quot=%h, rem=%0d, a=%0d, state=%h, rem_msb=%h, den_msb=%h, sub=%0d, shift=%h, ready=%h", $time, go, num, den, quot, rem, a, state, rem_msb, den_msb, sub, shift, ready);
`endif
endmodule