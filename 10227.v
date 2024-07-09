module's enqueue
  function mux1;
    input a;
    input b;
    input sel;
    begin
      case (sel)
        1'b0: mux1 = a;
        1'b1: mux1 = b;
      endcase
    end
  endfunction
  function [`SORTW-1:0] mux32;
    input [`SORTW-1:0] a;
    input [`SORTW-1:0] b;
    input              sel;
    begin
      case (sel)
        1'b0: mux32 = a;
        1'b1: mux32 = b;
      endcase
    end
  endfunction
  wire [`SORTW-1:0]  F_dout;
  wire        F_deq, F_emp;
  reg [31:0] ecnt;  // the number of elements in one iteration
  reg        ecntz; // ecnt==0 ?
  wire f_full;
  MRE2 #(1,`SORTW) F(.CLK(CLK), .RST(RST), .enq(ib_enq), .deq(F_deq),  // input buffer FIFO
                     .din(din), .dot(F_dout), .emp(F_emp), .full(f_full));
  assign ib_full = mux1(f_full, 0, F_deq); // INBUF back_pressure
  assign enq = !full && (!F_emp || ecntz);  // enqueue for the next buffer
  assign F_deq = enq && (ecnt!=0);          //
  assign dot = mux32(F_dout, `MAX_VALUE, ecntz);
  always @(posedge CLK) begin
    if (RST || idone) begin
      ecnt  <= (`ELEMS_PER_UNIT << (phase * `WAY_LOG)); /// note
      ecntz <= 0;
    end else begin
      if (ecnt!=0 && enq) ecnt  <= ecnt - 1;
      if (ecnt==1 && enq) ecntz <= 1; // old version has a bug here!
    end
  end
endmodule