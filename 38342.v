module prescaler_tb();
parameter N = 2;
reg clk = 0;
wire clk_out;
reg [N-1:0] counter_check = 0;
prescaler #(.N(N))  //-- Parámetro N
  Pres1(
    .clk_in(clk),
    .clk_out(clk_out)
  );
always #1 clk = ~clk;
always @(negedge clk) begin
  counter_check = counter_check + 1;
  if (counter_check[N-1] != clk_out) begin
    $display("--->ERROR! Prescaler no funciona correctamente");
    $display(
        "Clk out: %d, counter_check[2]: %d", clk_out, counter_check[N-1]);
  end
end
initial begin
  $dumpfile("prescaler_tb.vcd");
  $dumpvars(0, prescaler_tb);
  # 99 $display("FIN de la simulacion");
  # 100 $finish;
end
endmodule