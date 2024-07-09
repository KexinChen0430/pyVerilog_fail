module TB ();
  //Signals, and internal registers are declared here
  pullup(SDA);
  pullup(SCK);
  reg CLK_IN=0;
  wire PWM_OUT_1,PWM_OUT_2,PWM_OUT_3;
  parameter [7:0] dev1 = 8'bzzz0000z,dev2 = 8'bzzzz000z, dev3 = 8'bz0z0000z;
  //Devices instantiation here
//this is dev1
  I2C_PWM_INTERFACE #(8'hE1,6,1) uut_1(
       .SDA(SDA),
       .SCK(SCK),
       .CLK_IN(CLK_IN),
       .PWM_OUT(PWM_OUT_1)
    );
//this is dev2
  I2C_PWM_INTERFACE #(8'hF1,6,1) uut_2(
       .SDA(SDA),
       .SCK(SCK),
       .CLK_IN(CLK_IN),
       .PWM_OUT(PWM_OUT_2)
    );
//this is dev3
  I2C_PWM_INTERFACE #(8'hA1,6,1) uut_3(
       .SDA(SDA),
       .SCK(SCK),
       .CLK_IN(CLK_IN),
       .PWM_OUT(PWM_OUT_3)
    );
  //Master starting the i2c communication
  virtual_master master(.SDA(SDA),.SCL(SCK));
  initial begin
    $dumpfile("testing.dump");
    $dumpvars;
    master.sendData(dev1,8'b0zzzzzzz);    //Set dev1 duty cycle to 127
    master.sendData(dev2,8'b00zz00z0);    //Set dev2 duty cycle to 50
    master.sendData(dev3,8'bzz00z000);    //Set dev3 duty cycle to 200
  end
  always begin
    CLK_IN=~CLK_IN;
    #1;
    if($time==500us)$finish();
  end
endmodule