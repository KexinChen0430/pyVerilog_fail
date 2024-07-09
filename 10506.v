module tb (input c);
   reg w = 0;
   reg [2:0] a = 0;
   reg [31:0] wd = 0;
   wand       uart = 1;
   wire [31:0] rd0, rd1;
   uart_1wire uart0 (.c(c), .w(w & ~a[2]), .a(a[1:0]), .wd(wd), .rd(rd0), .uart(uart));
   uart_1wire uart1 (.c(c), .w(w &  a[2]), .a(a[1:0]), .wd(wd), .rd(rd1), .uart(uart));
   initial
     begin
	$dumpfile("dump.vcd");
	$dumpvars(0);
     end
endmodule