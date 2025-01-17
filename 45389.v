module configuration_tb (
   reset,
   // Host interface
   host_clk,
   host_opcode,
   host_req,
   host_miim_sel,
   host_addr,
   host_wr_data,
   host_miim_rdy,
   host_rd_data,
   // Testbench semaphores
   configuration_busy,
   monitor_finished_1g,
   monitor_finished_100m,
   monitor_finished_10m,
   monitor_error
);
  // Port declarations
  output reg        reset;
  output reg        host_clk;
  output reg [1:0]  host_opcode;
  output reg        host_req;
  output reg        host_miim_sel;
  output reg [9:0]  host_addr;
  output reg [31:0] host_wr_data;
  input             host_miim_rdy;
  input [31:0]      host_rd_data;
  output reg        configuration_busy;
  input             monitor_finished_1g;
  input             monitor_finished_100m;
  input             monitor_finished_10m;
  input             monitor_error;
  // Register map constants
  // Management configuration register address (0x340)
  reg [8:0] config_management_address;
  // Flow control configuration register address (0x2C0)
  reg [8:0] config_flow_control_address;
  // Receiver configuration register address (0x240)
  reg [8:0] receiver_address;
  // Transmitter configuration register address (0x280)
  reg [8:0] transmitter_address;
  // EMAC configuration register address (0x300)
  reg [8:0] emac_config_add;
  initial
  begin
    // Management configuration register address (0x340)
    config_management_address   = 9'b101000000;
    // Flow control configuration register address (0x2C0)
    config_flow_control_address = 9'b011000000;
    // Receiver configuration register address (0x240)
    receiver_address            = 9'b001000000;
    // Transmitter configuration register address (0x280)
    transmitter_address         = 9'b010000000;
    // EMAC configuration register address (0x300)
    emac_config_add             = 9'b100000000;
  end
  // Host clock driver
  // Drive host clock at one third the frequency of GTX_CLK
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
  // EMAC host configuration write procedure
  task config_write;
    input [8:0]  address;
    input [31:0] data;
    begin
      @(negedge host_clk)
      host_addr[9]         <= 1'b1;
      host_addr[8:0]       <= address;
      host_miim_sel        <= 1'b0;
      host_opcode          <= 2'b1;
      host_wr_data         <= data;
      @(negedge host_clk)
      host_addr[9]         <= 1'b1;
      host_miim_sel        <= 1'b0;
      host_opcode          <= 2'b11;
      host_wr_data         <= 32'b0;
      @(negedge host_clk);
    end
  endtask
  // EMAC host configuration read procedure
  task config_read;
    input [8:0]  address;
    begin
      @(negedge host_clk)
      host_addr[9]         <= 1'b1;
      host_addr[8:0]       <= address;
      host_miim_sel        <= 1'b0;
      host_opcode          <= 2'b11;
      @(negedge host_clk);
      @(posedge host_clk);
    end
  endtask
  // Configuration through the host interface
  initial
  begin : tb_configuration
    configuration_busy <= 0;
    // Initialize the host bus
    host_req       <= 1'b0;
    host_addr[9]   <= 1'b1;
    host_addr[8:0] <= 9'b0;
    host_miim_sel  <= 1'b0;
    host_opcode    <= 2'b11;
    host_wr_data   <= 32'b0;
    // Reset the core
    $display("Resetting the design...");
    $display("Timing checks are not valid");
    reset <= 1'b1;
    #4000000;
    reset <= 1'b0;
    #200000;
    $display("Timing checks are valid");
    configuration_busy <= 1;
    // wait for EMAC host interface to initialize
    while (host_miim_rdy !== 1)
      @(negedge host_clk);
    // Configuration: initialization of EMAC
    // Disable flow control. Set top 3 bits of the flow control
    // configuration register (0x2C0) to zero therefore disabling Tx
    // and Rx flow control.
    $display("Disabling Tx and Rx flow control...");
    // Read the current configuration value from the register
    config_read  (config_flow_control_address);
    // Now turn off the relevant bits and write back into the register
    config_write (config_flow_control_address, {3'b0, host_rd_data[28:0]});
    // Setting the Tx configuration bit to enable the transmitter
    // and set to full duplex mode.
    // Write to transmittter configuration register (0x280).
    $display("Setting Tx configuration...");
    // Read the current configuration value from the register
    config_read  (transmitter_address);
    // Now set the relevant bits and write back into the register
    config_write (transmitter_address,
                  {1'b0, host_rd_data[30:29], 1'b1,
                  host_rd_data[27], 1'b0, host_rd_data[25:0]});
    // Setting the Rx configuration bit to enable the receiver
    // and set to full duplex mode.
    // Write to receiver configuration register (0x240).
    $display("Setting Rx configuration...");
    // Read the current configuration value from the register
    config_read  (receiver_address);
    // Now set the relevant bits and write back into the register
    config_write (receiver_address,
                  {1'b0, host_rd_data[30:29], 1'b1,
                  host_rd_data[27], 1'b0, host_rd_data[25:0]});
    // Setting the speed to 1 Gb/s
    // Write to EMAC configuration fegister (0x300)
    $display("Setting speed to 1 Gb/s...");
    // Read the current configuration value from the register
    config_read  (emac_config_add);
    // Now set the relevant bits and write back into the register
    config_write (emac_config_add, {2'b10, host_rd_data[29:0]});
    configuration_busy <= 0;
    // Wait for 1 Gb/s frames to complete
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
    $display("Simulation complete.");
  $stop;
  end
  // If the simulation is still going after 2 ms
  // then something has gone wrong
  initial
  begin : p_end_simulation
    #2000000000
    $display("ERROR - Testbench timed out");
    $stop;
  end
endmodule