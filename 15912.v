module will print DEBUG ENABLED / DEBUG
   // DISABLED. No messages are printed if a state change does not
   // occur.
   function void bsg_dpi_debug(input bit switch_i);
      if(!debug_o & switch_i)
        $display("BSG DBGINFO (%M@%t): DEBUG ENABLED", $time);
      else if (debug_o & !switch_i)
        $display("BSG DBGINFO (%M@%t): DEBUG DISABLED", $time);
      debug_o = switch_i;
   endfunction
   // Silly, but useful.
   function int bsg_dpi_width();
      return width_p;
   endfunction
   // Initialize this FIFO DPI Interface
   function void bsg_dpi_init();
      if(debug_o)
        $display("BSG DBGINFO (%M@%t): bsg_dpi_init() called", $time);
      if(init_r)
        $fatal(1, "BSG ERROR (%M): bsg_dpi_init() already called");
      init_r = 1;
   endfunction
   // Terminate this FIFO DPI Interface
   function void bsg_dpi_fini();
      if(debug_o)
        $display("BSG DBGINFO (%M@%t): bsg_dpi_fini() called", $time);
      if(~init_r)
        $fatal(1, "BSG ERROR (%M): bsg_dpi_fini() already called");
      init_r = 0;
   endfunction
   // bsg_dpi_fifo_rx(output bit [width_p-1:0] data_o) -- Set ready_i and
   // read data_i from the FIFO interface. When valid data is
   // available (v_i === 1) this function will return 1. When there is
   // no valid data available, this function will return 0.
   // bsg_dpi_fifo_rx() MUST be called after the positive edge of clk_i is
   // evaluated. It MUST be called only once per cycle. Failure will
   // cause an error and a call to $fatal.
   // We set yumi_o_n so that we can signal a read to the producer on
   // the NEXT positive edge without reading multiple times
   logic    yumi_o_n;
   // We track the "last" v_i and last yumi_o values to detect
   // protocol violations. These are captured on the positive edge of
   // the clock
   reg    v_i_r;
   reg    yumi_o_r;
   // We track the polarity of the current edge so that we can notify
   // the user of incorrect behavior.
   reg    edgepol;
   always @(posedge clk_i or negedge clk_i) begin
      edgepol <= clk_i;
   end
   function bit bsg_dpi_fifo_rx(output bit [width_p-1:0] data_bo);
      if(init_r === 0) begin
         $fatal(1,"BSG ERROR (%M): bsg_dpi_fifo_rx() called before init()");
      end
      if(reset_i === 1) begin
         $fatal(1, "BSG ERROR (%M): bsg_dpi_fifo_rx() called while reset_i === 1");
      end
      if(clk_i === 0) begin
         $fatal(1, "BSG ERROR (%M): bsg_dpi_fifo_rx() must be called when clk_i == 1");
      end
      if(rx_r !== 0) begin
         $fatal(1, "BSG ERROR (%M): bsg_dpi_fifo_rx() called multiple times in a clk_i cycle");
      end
      if(edgepol === 0) begin
        $fatal(1, "BSG ERROR (%M): bsg_dpi_fifo_rx() must be called after the positive edge of clk_i has been evaluated");
      end
      // This will flow to its output on the next negative clock edge.
      yumi_o_n = v_i;
      data_bo = data_i;
      rx_r = 1;
      if(debug_o)
        $display("BSG DBGINFO (%M@%t): bsg_dpi_fifo_rx() called -- v_i: %b data_i: 0x%x",
                 $time, v_i, data_i);
      return (v_i === 1);
   endfunction
   // The function bsg_dpi returns true if the interface is in a
   // valid time-window to call bsg_dpi_fifo_rx()
   function bit bsg_dpi_fifo_is_window();
      return (~rx_r & clk_i & edgepol & ~reset_i);
   endfunction
   // We set yumi_o to 0 on the positive edge of clk_i (after it has
   // been seen by the producer) so that we don't trigger negedge
   // protocol assertions in the BSG FIFOs. We also need to reset
   // yumi_o to 0 after data has been read to ensure that we don't
   // "latch" yumi_o ===1 and unintentionally read multiple cycles in
   // a row.
   // To ensure that the correct yumi_o value is read on a positive
   // clock edge, we set yumi_o_n ("next yumi") in bsg_dpi_fifo_rx() and
   // propogate it to yumi_o on the negative clock edge. The producer
   // will see the correct value of yumi_o on the next positive edge.
   // We also set yumi_o on the negative edge to ensure that it
   // changes after the BSG FIFO protocol assertions have
   // passed. After yumi_o_n has been read, we pre-emptively set it
   // back to 0. If bsg_dpi_fifo_rx() is called again on the next cycle, it
   // will set yumi_o_n === 1 to read.
   always @ (posedge clk_i or negedge clk_i) begin
      if(clk_i)
        yumi_o <= 0;
      else
        yumi_o <= yumi_o_n;
      yumi_o_n = '0;
   end
   // Save the last v_i and yumi_o values for protocol checking
   always @(posedge clk_i) begin
      v_i_r <= v_i;
      yumi_o_r <= yumi_o;
      rx_r = 0;
      if(debug_o)
        $display("BSG DBGINFO (%M@%t): posedge clk_i -- reset_i: %b v_i: %b yumi_o: %b data_i: 0x%x",
                 $time, reset_i, v_i, yumi_o, data_i);
   end
endmodule