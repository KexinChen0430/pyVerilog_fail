module
  assign im_req = (im_emp || im_deq);                 // note!!!
  assign im_dot = mux(dot_t[31:0], dot[31:0], cntez);
  always @(posedge CLK) begin
    if (RST) begin
      cnte <= 0;
    end else begin
      if (IB_enq) cnte <= cnte + 1;
    end
  end
  always @(posedge CLK) begin
    if (RST) begin
      cntez <= 1;
    end else begin
      case ({IB_enq, (cnte==15)})
        2'b10: cntez <= 0;
        2'b11: cntez <= 1;
      endcase
    end
  end
  always @(posedge CLK) begin
    if (RST) begin
      cntef <= 0;
    end else begin
      case ({IB_enq, (cnte==14)})
        2'b10: cntef <= 0;
        2'b11: cntef <= 1;
      endcase
    end
  end
  always @(posedge CLK) begin
    case ({IB_enq, cntez})
      2'b10: dot_t <= {32'b0, dot_t[`DRAMW-1:32]};
      2'b11: dot_t <= {32'b0, dot[`DRAMW-1:32]};
    endcase
  end
  MRE2 #(1, `DRAMW) imf(.CLK(CLK), .RST(RST), .enq(im_enq), .deq(im_deq),
                        .din(d_dout), .dot(dot), .emp(im_emp), .full(im_full));
endmodule