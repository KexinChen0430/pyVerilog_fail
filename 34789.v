module DNA_PORT (DOUT, CLK, DIN, READ, SHIFT);
    parameter [56:0] SIM_DNA_VALUE = 57'h0;
`ifdef XIL_TIMING
    parameter LOC = "UNPLACED";
`endif
    output DOUT;
    input  CLK, DIN, READ, SHIFT;
    tri0  GSR = glbl.GSR;
    localparam MAX_DNA_BITS = 57;
    localparam MSB_DNA_BITS = MAX_DNA_BITS - 1;
    reg [MSB_DNA_BITS:0] dna_val = SIM_DNA_VALUE;
    reg dout_out;
    reg notifier;
    wire clk_in, din_in, gsr_in, read_in, shift_in;
    buf b_dout  (DOUT, dout_out);
    buf b_clk   (clk_in, CLK);
    buf b_din   (din_in, DIN);
    buf buf_gsr (gsr_in, GSR);
    buf b_read  (read_in, READ);
    buf b_shift (shift_in, SHIFT);
//  GSR has no effect
    always @(posedge clk_in) begin
       if(read_in == 1'b1) begin
          dna_val = SIM_DNA_VALUE;
	  dout_out = dna_val[MSB_DNA_BITS];
       end // read_in == 1'b1
       else if(read_in == 1'b0)
               if(shift_in == 1'b1) begin
// IR 494079
//                   dna_val = {din_in, dna_val[MSB_DNA_BITS :1]};
                   dna_val = {dna_val[MSB_DNA_BITS-1 : 0], din_in};
                   dout_out = dna_val[MSB_DNA_BITS];
               end  // shift_in == 1'b1
    end // always @ (posedge clk_in)
    specify
	(CLK => DOUT) = (100:100:100, 100:100:100);
`ifdef XIL_TIMING
        $period (posedge CLK, 0:0:0, notifier);
        $setuphold (posedge CLK, posedge DIN, 0:0:0, 0:0:0, notifier);
        $setuphold (posedge CLK, negedge DIN, 0:0:0, 0:0:0, notifier);
        $setuphold (posedge CLK, posedge READ, 0:0:0, 0:0:0, notifier);
        $setuphold (posedge CLK, negedge READ, 0:0:0, 0:0:0, notifier);
        $setuphold (posedge CLK, posedge SHIFT, 0:0:0, 0:0:0, notifier);
        $setuphold (posedge CLK, negedge SHIFT, 0:0:0, 0:0:0, notifier);
`endif
        specparam PATHPULSE$ = 0;
    endspecify
endmodule