module pulse width modulated output
  );
  //internal registers, signals and wire assignments are here
  parameter [4:0] N = 31, K=1;                        //The division forumula is pwm_clk=(CLK_IN)/(K*2^n*2^8)
  reg [31:0] clk_div =0;                              //clock division counter for the main clock
  reg [7:0]  pwm_clk =0;                              //the PWM clock counter
  //code body goes here
  always @ ( posedge CLK_IN ) begin
    clk_div<=clk_div+K;                               //Increment the clock each cycle by K
  end
  always @ (posedge  clk_div[N]) begin                //Watch the change of the Nth bit
    pwm_clk<=pwm_clk+1;
  end
always @ ( * ) begin
  if(pwm_clk<=PWM_DCycle & PWM_DCycle!=0)
    PWM_OUT<=1;
  else
    PWM_OUT<=0;
end
endmodule