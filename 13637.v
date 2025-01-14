module tb;
`include "useful_tasks.v"  // some helper tasks
  reg rst_async_n; // asynchronous reset
   reg r1,r2;
   wire a0;
   wire a1,a2,r0;
   task handshake_4ph_port1;
      input [31:0] delay;
      begin
         wait(a1 === 1'b0);
         r1 = 1'b1;
         wait(a1 === 1'b1);
         #(delay);
         r1 = 1'b0;
         wait(a1 === 1'b0);
      end
   endtask
   task handshake_4ph_port2;
      input [31:0] delay;
      begin
         wait( a2 === 1'b0);
         r2 = 1'b1;
         wait( a2 === 1'b1);
         #(delay);
         r2 = 1'b0;
         wait( a2 === 1'b0);
      end
   endtask
   task handshake_4ph;
      output r;
      input  a;
      input [31:0] delay;
      begin
         wait( a === 1'b0);
         r = 1'b1;
         wait( a === 1'b1);
         #(delay);
         r = 1'b0;
         wait( a === 1'b0);
      end
   endtask
   task stimuli_port1;
      integer i;
      begin
         $display("start 1");
         for(i=0;i<100;i=i+1) begin
            handshake_4ph_port1(($unsigned($random) % 200) + 20);
            #($unsigned($random) % 200);
         end
         $display("stop1 ");
      end
   endtask
   task stimuli_port2;
      integer i;
      begin
         $display("start 2");
         for(i=0;i<100;i=i+1) begin
            handshake_4ph_port2(($unsigned($random) % 200) + 20);
            #($unsigned($random) % 200);
         end
         $display("stop 2");
      end
   endtask
   arbitrer_r1_4ph U_ARBITER(
                             .a1(a1),
                             .a2(a2),
                             .r1(r1),
                             .r2(r2),
                             .a0(a0),
                             .r0(r0),
                             .rstn(rst_async_n)
                             );
   assign #12 a0 =  r0;
  // Dump all nets to a vcd file called tb.vcd
   event dbg_finish;
   reg   clk;
   initial clk = 0;
   always
     #100 clk = ~clk;
  initial
    begin
	$dumpfile("tb.vcd");
	$dumpvars(0,tb);
     end
  // Start by pulsing the reset low for some nanoseconds
  initial begin
     rst_async_n = 1'b0;
     r1 <= 0;
     r2 <= 0;
    #5;
    rst_async_n = 1'b1;
    $display("-I- Reset is released");
     #10;
     $display("-I- step 1");
     r1 <= 1;
     @(posedge a1);
     r1 <= 0;
     @(negedge a1);
     #10;
     $display("-I- step 2");
     r2 <= 1;
     @(posedge a2);
     r2 <= 0;
     @(negedge a2);
     #10;
     $display("-I- step 3");
     #10 handshake_4ph_port2(300);
     #200;
     #10 handshake_4ph_port1(100);
     #200;
     $display("-I- step 5");
     handshake_4ph_port2(20);
     #10;
     -> dbg_finish;
     fork
        stimuli_port1();
        stimuli_port2();
     join
    $display("-I- Done !");
    $finish;
  end
   four_phase_assertion U_CHECKER0(.req(r0),.ack(a0),.rstn(rst_async_n));
   four_phase_assertion U_CHECKER1(.req(r1),.ack(a1),.rstn(rst_async_n));
   four_phase_assertion U_CHECKER2(.req(r2),.ack(a2),.rstn(rst_async_n));
endmodule