module configuration_tb
 (
   reset,
   // Host interface: host_clk is always required
   host_clk,
   // Testbench semaphores
   configuration_busy,
   monitor_finished_1g,
   monitor_finished_100m,
   monitor_finished_10m,
   monitor_error
 );
  // Port declarations
  output reg       reset;
  output reg       host_clk;
  output reg       configuration_busy;
  input            monitor_finished_1g;
  input            monitor_finished_100m;
  input            monitor_finished_10m;
  input            monitor_error;
  // HOSTCLK driver
  // Drive HOSTCLK at one third the frequency of GTX_CLK
  initial
  begin
    host_clk <= 1'b0;
 #2000;
    forever
    begin
      host_clk <= 1'b1;
      #12000;
      host_clk <= 1'b0;
      #12000;
    end
  end
  // Testbench configuration
  initial
  begin : tb_configuration
    reset <= 1'b1;
    // test bench semaphores
    configuration_busy <= 0;
    #200000
    configuration_busy <= 1;
    // Reset the core
    $display("Resetting the design...");
    $display("Timing checks are not valid");
    reset <= 1'b1;
    #4000000;
    reset <= 1'b0;
    #200000;
    $display("Timing checks are valid");
    #15000000
    #100000
    configuration_busy <= 0;
    // Wait for 1Gb/s frames to complete
    wait (monitor_finished_1g == 1);
    #100000
    if (monitor_error == 1'b1)
    begin
         $display("*************************");
         $display("ERROR: Simulation Failed.");
         $display("*************************");
    end
    else begin
         $display("****************************");
         $display("PASS: Simulation Successful.");
         $display("****************************");
    end
    // Our work here is done
    $display("Simulation Complete.");
 $stop;
  end // tb_configuration
  // If the simulation is still going after 2 ms
  // then something has gone wrong
  initial
  begin : p_end_simulation
    #2000000000
    $display("ERROR - Testbench timed out");
    $stop;
  end // p_end_simulation
endmodule