module echo_tb();
localparam BAUDRATE = `B115200;
localparam SERIAL_PACK = (BAUDRATE * 10);
localparam WAIT = (BAUDRATE * 4);
  task send_char;
    input [7:0] char;
  begin
    rx <= 0;                   //-- Send the Start bit
    #BAUDRATE rx <= char[0];   //-- Bit 0
    #BAUDRATE rx <= char[1];   //-- Bit 1
    #BAUDRATE rx <= char[2];   //-- Bit 2
    #BAUDRATE rx <= char[3];   //-- Bit 3
    #BAUDRATE rx <= char[4];   //-- Bit 4
    #BAUDRATE rx <= char[5];   //-- Bit 5
    #BAUDRATE rx <= char[6];   //-- Bit 6
    #BAUDRATE rx <= char[7];   //-- Bit 7
    #BAUDRATE rx <= 1;         //-- stop bit
    #BAUDRATE rx <= 1;         //-- Wait until the bits stop is sent
  end
  endtask
reg clk = 0;
reg rx = 1;
wire tx;
wire [3:0] leds;
echo #(.BAUDRATE(BAUDRATE))
  dut(
    .clk(clk),
    .rx(rx),
    .tx(tx)
  );
always
  # 0.5 clk <= ~clk;
initial begin
  $dumpfile("echo_tb.vcd");
  $dumpvars(0, echo_tb);
  #BAUDRATE    send_char(8'h55);
  #WAIT        send_char("K");
  #(WAIT * 4) $display("END of the simulation");
  $finish;
end
endmodule