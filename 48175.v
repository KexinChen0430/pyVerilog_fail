module body
  assign adr_o  = {render_addr_i, 2'b00};
  assign dat_o  = render_dat_i;
  assign sel_o  = render_sel_i;
  assign sint_o = err_i;
  // We only write, these can be constant
  assign we_o   = 1'b1;
  assign stb_o  = 1'b1;
  assign cti_o  = 3'b000;
  assign bte_o  = 2'b00;
  // Acknowledge when a command has completed
  always @(posedge clk_i or posedge rst_i)
  begin
    //  reset, init component
    if(rst_i)
    begin
      ack_o <= 1'b0;
      cyc_o <= 1'b0;
    end
    // Else, set outputs for next cycle
    else
    begin
      cyc_o <= ack_i   ? 1'b0 : // TODO: connect to pixel fifo rreq instead
               write_i ? 1'b1 :
               cyc_o;
      ack_o <= ack_i; // TODO: always set when fifo isn't full
    end
  end
endmodule