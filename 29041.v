module testbench ();
   reg clk;
   reg reset_;
   wire [7:0] led;
   // Create an instance of the circuit under test
   knightrider knightrider_0 (
			      .clk(clk),
			      .reset_(reset_),
			      .led(led)
			      );
   // Initialize the clock signal to zero; drive reset_ active (low) for the
   // first 100ns of the simulation.
   initial begin
      clk <= 1'b0;
      reset_ <= 1'b0;
      #100; reset_ <= 1'b1;
   end
   // Stop the simulation after 1100ms; note that simulations can run indefinitely
   // (with waveforms loaded incrementally in the viewer.) Press ctrl-c to break
   // iverilog, then enter '$finish' to stop the simulation.
   initial begin
      #1100000000 $finish;
   end
   // Toggle the clock every 31.25ns (32 MHz frequency)
   initial forever begin
      #31.25; clk <= ~clk;
   end
   // Produce a waveform output of this simulation
   initial begin
      $dumpfile("waveform.vcd");
      $dumpvars();
   end
   always@ (led)
     $display("%t LEDs changed to %b", $time, led);
endmodule