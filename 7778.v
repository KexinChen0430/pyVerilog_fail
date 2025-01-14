module testbench;
  reg sclk;
  reg ssn;
  reg clk;
  reg currentlimit0;
  reg currentlimit1;
  reg currentlimit2;
  reg tstn;
  reg wdogdisn;
  reg [7:0] outbyte;
  reg [1:0] tach0;
  reg [1:0] tach1;
  reg [1:0] tach2;
  wire mosi;
  wire miso;
  wire sold;
  wire spioe;
  wire motorena;
  wire redled0;
  wire [2:0] cycle;
  wire [7:0] inbyte;
  wire [1:0] pwm0;
  wire [1:0] pwm1;
  wire [1:0] pwm2;
  wire [3:0] pwm40;
  wire [3:0] pwm41;
  wire [3:0] pwm42;
  // Pull up miso so we don't get z's in the test shift register
  pullup (pull1) (miso);
  tbclkctr tbcc0(
    .clk(sclk),
    .enn(ssn),
    .cycle(cycle));
  tbseq tbs0(
    .cycle(cycle),
    .sold(sold));
  tbshftout so0(
    .clk(sclk),
    .outbyte(outbyte),
    .ld(sold),
    .sout(mosi));
  tbshftin si0(
    .clk(sclk),
    .sin(miso),
    .out(inbyte));
  root root0(
    .clk(clk),
    .sclk(sclk),
    .ssn(ssn),
    .mosi(mosi),
    .tstn(tstn),
    .wdogdisn(wdogdisn),
    .currentlimit0(currentlimit0),
    .currentlimit1(currentlimit1),
    .currentlimit2(currentlimit2),
    .tach0(tach0),
    .tach1(tach1),
    .tach2(tach2),
    .miso(miso),
    .motorena(motorena),
    .redled0(redled0),
    .pwm0(pwm0),
    .pwm40(pwm40),
    .pwm1(pwm1),
    .pwm41(pwm41),
    .pwm2(pwm2),
    .pwm42(pwm42));
  // Send a burst of 16 spiclks
  task spiclkburst;
    integer i;
    begin
      for(i = 0; i < 8; i = i + 1) begin
      	#16 sclk = 0;
      	#16 sclk= 1;
      end
    end
  endtask
  // Select the dut, and send a write transaction
  task spiwrite([3:0] addr, [7:0] data);
    begin
    	#80 ssn = 0;
    	#80 ssn = 0;
    	begin
    	outbyte = {1'b0, addr, 3'b0};
      	spiclkburst;
        #80 outbyte = data;
        spiclkburst;
    	end
    	#80 ssn = 0;
    	#80 ssn = 1;
    end
  endtask
    // Select the dut, and send a read transaction
  task spiread([3:0] addr);
    begin
    	#80 ssn = 0;
    	#80 ssn = 0;
    	begin
        outbyte = {1'b1, addr, 3'b0};
      	spiclkburst;
        #80 outbyte = 8'h00;
        spiclkburst;
    	end
    	#80 ssn = 0;
    	#80 ssn = 1;
    end
  endtask
  // Crude assert task
	task assert_compare_byte([7:0] actual, [7:0] expected);
		begin
			if(actual != expected) begin
				$display("!!!!!************* Assertion Error in %m: is 8'h%h s/b 8'h%h *************!!!!!", actual, expected);
				$finish;
			end
		end
	endtask
	// Combine spiread and assert_compare_byte tasks
	task spiread_expect([3:0] addr, [7:0] expected);
		begin
			spiread(addr);
			assert_compare_byte(inbyte, expected);
		end
	endtask
  initial begin
    $dumpvars(0, testbench);
    outbyte = 0;
    ssn = 1;
    sclk = 0;
    clk = 0;
    currentlimit0 = 0;
    currentlimit1 = 0;
    currentlimit2 = 0;
    tstn = 0;
    wdogdisn = 1;
    tach0 = 2'b00;
    tach1 = 2'b00;
    tach2 = 2'b00;
    #2
    sclk = 1;
    // Clear any pending SPI transaction
    #80
    spiclkburst;
    #80
    spiclkburst;
    #100
    // Test async reset
    ssn = 0;
    #20
    spiclkburst;
    #20
    ssn = 1;
    #100
    // Retrieve hardware configuration
    spiread_expect(4'hd, 8'h30);
    // Write  motor0 config register
    spiwrite(4'h2, 8'h01);
    // Write motor1 config register
    spiwrite(4'h6, 8'h02);
    // Write motor2 config register
    spiwrite(4'ha, 8'h04);
    // Read them back
    spiread_expect(4'h2, 8'h01);
    spiread_expect(4'h6, 8'h02);
    spiread_expect(4'ha, 8'h04);
    // Set motor0,1, and 2 to 0 for other testing
    spiwrite(4'h2, 8'h00);
    spiwrite(4'h6, 8'h00);
    spiwrite(4'ha, 8'h00);
    // Set watchdog divisor
    spiwrite(4'he, 8'h10);
     // Test lower bits of watchdog register
    spiwrite(4'hf, 8'h01);
    spiread_expect(4'hf, 8'h01);
    spiwrite(4'hf, 8'h03);
    spiread_expect(4'hf, 8'h03);
    spiwrite(4'hf, 8'h07);
    spiread_expect(4'hf, 8'h07);
    // Enable motor
    spiwrite(4'hf,8'h0f);
    // Wait for watchdog to trip
    #10000
    // Read watchdog register
    spiread(4'hf);
	spiread_expect(4'hf, 8'h8f);
    // Reset the watchdog
    spiwrite(4'hf,8'h80);
    // Re-enable motor
    spiwrite(4'hf,8'h0f);
    // Read watchdog register
    spiread_expect(4'hf, 8'h0f);
    #20
    // Disable watchdog
	wdogdisn = 0;
	// Read watchdog register
    spiread(4'hf);
    // Tickle tach signals
    // Motor channel 0
    tach0 = 2'b01;
    #2000
    spiread_expect(4'h0,8'h01);
    spiread_expect(4'h1, 8'h00);
    tach0 = 2'b11;
    #2000
    spiread_expect(4'h0,8'h02);
    spiread_expect(4'h1, 8'h00);
    tach0 = 2'b01;
    #2000
    spiread_expect(4'h0,8'h01);
    spiread_expect(4'h1, 8'h00);
    tach0 = 2'b00;
    #2000
    spiread_expect(4'h0,8'h00);
    spiread_expect(4'h1, 8'h00);
    tach0 = 2'b10;
    #2000
    spiread_expect(4'h0,8'hff);
    spiread_expect(4'h1, 8'hff);
    tach0 = 2'b00;
    #2000
    spiread_expect(4'h0,8'h00);
    spiread_expect(4'h1, 8'h00);
    // Motor channel 1
    tach1 = 2'b01;
    #2000
    spiread_expect(4'h4,8'h01);
    spiread_expect(4'h5, 8'h00);
    tach1 = 2'b11;
    #2000
    spiread_expect(4'h4,8'h02);
    spiread_expect(4'h5, 8'h00);
    tach1 = 2'b01;
    #2000
    spiread_expect(4'h4,8'h01);
    spiread_expect(4'h5, 8'h00);
    tach1 = 2'b00;
    #2000
    spiread_expect(4'h4,8'h00);
    spiread_expect(4'h5, 8'h00);
    tach1 = 2'b10;
    #2000
    spiread_expect(4'h4,8'hff);
    spiread_expect(4'h5, 8'hff);
    tach1 = 2'b00;
    #2000
    spiread_expect(4'h4,8'h00);
    spiread_expect(4'h5, 8'h00);
    // Motor channel 2
    tach2 = 2'b01;
    #2000
    spiread_expect(4'h8,8'h01);
    spiread_expect(4'h9, 8'h00);
    tach2 = 2'b11;
    #2000
    spiread_expect(4'h8,8'h02);
    spiread_expect(4'h9, 8'h00);
    tach2 = 2'b01;
    #2000
    spiread_expect(4'h8,8'h01);
    spiread_expect(4'h9, 8'h00);
    tach2 = 2'b00;
    #2000
    spiread_expect(4'h8,8'h00);
    spiread_expect(4'h9, 8'h00);
    tach2 = 2'b10;
    #2000
    spiread_expect(4'h8,8'hff);
    spiread_expect(4'h9, 8'hff);
    tach2 = 2'b00;
    #2000
    spiread_expect(4'h8,8'h00);
    spiread_expect(4'h9, 8'h00);
	// Set pwm to 25%
	spiwrite(4'h0, 8'h40);
	#100000
	// Set the pwm to 75%
	spiwrite(4'h0, 8'hC0);
	#100000
	// Set the pwm to 50%
	spiwrite(4'h0, 8'h80);
	#100000
	// Set pwm to 25%
	spiwrite(4'h4, 8'h40);
	#100000
	// Set the pwm to 75%
	spiwrite(4'h4, 8'hC0);
	#100000
	// Set the pwm to 50%
	spiwrite(4'h4, 8'h80);
	#100000
	// Set pwm to 25%
	spiwrite(4'h8, 8'h40);
	#100000
	// Set the pwm to 75%
	spiwrite(4'h8, 8'hC0);
	#100000
	// Set the pwm to 50%
	spiwrite(4'h8, 8'h80);
    #100000 $finish;
  end
  always #4 clk = ~clk;
endmodule