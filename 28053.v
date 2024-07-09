module testConditioner;
wire conditioned;
wire rising;
wire falling;
reg pin, clk;
reg ri;
always @(posedge clk) ri=rising;
inputconditioner dut(clk, pin, conditioned, rising, falling);
initial clk=0;
always #10 clk=!clk;    // 50MHz Clock
initial begin
// Your Test Code
// Be sure to test each of the three things the conditioner does:
// Synchronize, Clean, Preprocess (edge finding)
$display("Test Edge Finding");
pin=0; #1010
$display("pin=0; #1010 | expect 0 0 0 0");
$display("pin: %b | conditioned: %b | rising: %b | falling: %b", pin, conditioned, rising, falling);
pin=1; #20
$display("pin=1; #20 | expect 1 0 0 0");
$display("pin: %b | conditioned: %b | rising: %b | falling: %b", pin, conditioned, rising, falling);
#240
$display("wait #240 | expect 1 1 1 0");
$display("pin: %b | conditioned: %b | rising: %b | falling: %b", pin, conditioned, rising, falling);
#100
pin=0;
$display("wait #100 pin=0; | expect 0 1 0 0");
$display("pin: %b | conditioned: %b | rising: %b | falling: %b", pin, conditioned, rising, falling);
#250
$display("wait #250 | expect 0 0 0 1");
$display("pin: %b | conditioned: %b | rising: %b | falling: %b", pin, conditioned, rising, falling);
$display("----------------------------------------------------------");
$display("Test Cleaning");
#250
pin=1;
$display("wait #250 pin=1; | expect 1 0 0 0");
$display("pin: %b | conditioned: %b | rising: %b | falling: %b", pin, conditioned, rising, falling);
#200
$display("wait #200 | expect 1 0 0 0");
$display("pin: %b | conditioned: %b | rising: %b | falling: %b", pin, conditioned, rising, falling);
pin=0; #250
$display("pin=0; #250 | expect 0 0 0 0");
$display("pin: %b | conditioned: %b | rising: %b | falling: %b", pin, conditioned, rising, falling);
end
endmodule