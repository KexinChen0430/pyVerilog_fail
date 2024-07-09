module simple_pic #(parameter int NUM_IRQ=32) (
  clk_i, rst_i, cyc_i, stb_i, adr_i, we_i, dat_i, dat_o, ack_o, int_o,
  irq
);
  // Inputs & outputs
  // 8bit WISHBONE bus slave interface
  input         clk_i;         // clock
  input         rst_i;         // reset (asynchronous active low)
  input         cyc_i;         // cycle
  input         stb_i;         // strobe  (cycle and strobe are the same signal)
  input  [ 2:1] adr_i;         // address
  input         we_i;          // write enable
  input  [ 31:0] dat_i;         // data output
  output [ 31:0] dat_o;         // data input
  output        ack_o;         // normal bus termination
  output        int_o;         // interrupt output
  // Interrupt sources
  input  [NUM_IRQ:1] irq;           // interrupt request inputs
  //  Module body
  reg  [NUM_IRQ:1] pol, edgen, pending, mask;   // register bank
  reg  [NUM_IRQ:1] lirq, dirq;                  // latched irqs, delayed latched irqs
  // perform parameter checks
  // synopsys translate_off
  initial
  begin
      if(NUM_IRQ > 32)
        $display("simple_pic: max. 32 interrupt sources supported.");
  end
  // synopsys translate_on
  // latch interrupt inputs
  always @(posedge clk_i)
    lirq <= irq;
  // generate delayed latched irqs
  always @(posedge clk_i)
    dirq <= lirq;
  // generate actual triggers
  function trigger;
    input edgen, pol, lirq, dirq;
    reg   edge_irq, level_irq;
  begin
      edge_irq  = pol ? (lirq & ~dirq) : (dirq & ~lirq);
      level_irq = pol ? lirq : ~lirq;
      trigger = edgen ? edge_irq : level_irq;
  end
  endfunction
  reg  [NUM_IRQ:1] irq_event;
  integer n;
  always @(posedge clk_i)
    for(n=1; n<=NUM_IRQ; n=n+1)
      irq_event[n] <= trigger(edgen[n], pol[n], lirq[n], dirq[n]);
  // generate wishbone register bank writes
  wire wb_acc = cyc_i & stb_i;                   // WISHBONE access
  wire wb_wr  = wb_acc & we_i;                   // WISHBONE write access
  always @(posedge clk_i or negedge rst_i)
    if (~rst_i)
      begin
          pol   <= {{NUM_IRQ}{1'b0}};              // clear polarity register
          edgen <= {{NUM_IRQ}{1'b0}};              // clear edge enable register
          mask  <= {{NUM_IRQ}{1'b1}};              // mask all interrupts
      end
    else if(wb_wr)                               // wishbone write cycle??
      case (adr_i) // synopsys full_case parallel_case
        2'b00: edgen <= dat_i[NUM_IRQ-1:0];        // EDGE-ENABLE register
        2'b01: pol   <= dat_i[NUM_IRQ-1:0];        // POLARITY register
        2'b10: mask  <= dat_i[NUM_IRQ-1:0];        // MASK register
        2'b11: ;                                 // PENDING register is a special case (see below)
      endcase
    // pending register is a special case
    always @(posedge clk_i or negedge rst_i)
      if (~rst_i)
          pending <= {{NUM_IRQ}{1'b0}};            // clear all pending interrupts
      else if ( wb_wr & (&adr_i) )
          pending <= (pending & ~dat_i[NUM_IRQ-1:0]) | irq_event;
      else
          pending <= pending | irq_event;
    // generate dat_o
    reg [31:0] dat_o;
    always @(posedge clk_i)
      case (adr_i) // synopsys full_case parallel_case
        2'b00: dat_o <= { {{32-NUM_IRQ}{1'b0}}, edgen};
        2'b01: dat_o <= { {{32-NUM_IRQ}{1'b0}}, pol};
        2'b10: dat_o <= { {{32-NUM_IRQ}{1'b0}}, mask};
        2'b11: dat_o <= { {{32-NUM_IRQ}{1'b0}}, pending};
      endcase
   // generate ack_o
   reg ack_o;
   always @(posedge clk_i)
     ack_o <= wb_acc & !ack_o;
  // generate CPU interrupt signal
  reg int_o;
  always @(posedge clk_i)
    int_o <= |(pending & ~mask);
endmodule