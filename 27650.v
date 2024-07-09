module cycloneii_ram_pulse_generator (
                                    clk,
                                    ena,
                                    pulse,
                                    cycle
                                   );
input  clk;   // clock
input  ena;   // pulse enable
output pulse; // pulse
output cycle; // delayed clock
parameter start_delay = 1;
reg  state;
reg  clk_prev;
wire clk_ipd;
specify
    specparam t_decode = 0,t_access = 0;
    (posedge clk => (pulse +: state)) = (t_decode,t_access);
endspecify
buf #(start_delay) (clk_ipd,clk);
wire  pulse_opd;
buf buf_pulse  (pulse,pulse_opd);
initial clk_prev = 1'bx;
always @(clk_ipd or posedge pulse)
begin
    if      (pulse) state <= 1'b0;
    else if (ena && clk_ipd === 1'b1 && clk_prev === 1'b0)   state <= 1'b1;
  clk_prev = clk_ipd;
end
assign cycle = clk_ipd;
assign pulse_opd = state;
endmodule