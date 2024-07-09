module ; skipping test.");
      // check Chaining DMA Error Status register
      ebfm_barrd_wait(bar_table,dma_bar,48,SCR_MEMSLAVE,4,0);
      err_status = shmem_read (SCR_MEMSLAVE, 4);
      if (err_status != 32'h0) begin
           unused_result = ebfm_display(EBFM_MSG_ERROR_FATAL, {"Chaining DMA Error Status Reg - ECRC errors detected:    ", himage8(err_status)});
      end
      else begin
           unused_result = ebfm_display(EBFM_MSG_INFO, "Chaining DMA Error Status Reg - PASSED    ");
      end
      unused_result = ebfm_log_stop_sim(1);
      forever #100000;
   end
   always
     begin
        #(TIMEOUT)
          timer_toggle <= ! timer_toggle ;
     end
   // purpose: this is a watchdog timer, if it sees no activity on the activity
   // toggle signal for 200 us it ends the simulation
   always @(activity_toggle or timer_toggle)
     begin : watchdog
        reg unused_result ;
        if ( ($time - time_stamp) >= TIMEOUT)
          begin
             unused_result = ebfm_display(EBFM_MSG_ERROR_FATAL, "Simulation stopped due to inactivity!");
          end
        time_stamp <= $time ;
     end
endmodule