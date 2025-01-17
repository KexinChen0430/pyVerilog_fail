module altpll #(
   parameter inclk0_input_frequency = 20000,
   parameter clk0_multiply_by       = 4,
   parameter clk0_divide_by         = 5,
   parameter clk0_phase_shift       = "0",
   parameter clk1_multiply_by       = 4,
   parameter clk1_divide_by         = 5,
   parameter clk1_phase_shift       = "0",
   parameter clk2_multiply_by       = 8,
   parameter clk2_divide_by         = 5,
   parameter clk2_phase_shift       = "0")(
    inclk0,
    c0,
    c1,
    c2);
input  inclk0;
output c0;
output c1;
output c2;
reg c0;
reg c1;
reg c2;
integer phase0;
integer phase1;
integer phase2;
// Convert string to integer with sign
function integer str2int;
input [8*16:1] s;
reg [8*16:1] reg_s;
reg [8:1] digit;
reg [8:1] tmp;
integer m, magnitude;
integer sign;
begin
  sign      = 1;
  magnitude = 0;
  reg_s     = s;
  for (m=1; m<=16; m=m+1)
  begin
    tmp     = reg_s[128:121];
    digit   = tmp & 8'b00001111;
    reg_s   = reg_s << 8;
    // Accumulate ascii digits 0-9 only.
    if ((tmp >= 48) && (tmp <= 57))
      magnitude = (magnitude * 10) + digit;
    if (tmp == 45)
      sign = -1;  // Found a '-' character, i.e. number is negative.
  end
  str2int = sign * magnitude;
end
endfunction
// Convert phase delay to integer
function integer get_int_phase_shift;
input [8*16:1] s;
input i_phase_shift;
integer i_phase_shift;
begin
  if (i_phase_shift != 0)
  begin
    get_int_phase_shift = i_phase_shift;
  end
  else
  begin
    get_int_phase_shift = str2int(s);
  end
end
endfunction
initial
begin
  c0 = 1'b1;
  phase0 = get_int_phase_shift(clk0_phase_shift, 0);
  @(negedge inclk0);
  @(posedge inclk0);
  #(phase0)
  forever #(((inclk0_input_frequency*clk0_divide_by)/clk0_multiply_by)/2)  c0 = ~c0;
end
initial
begin
  c1 = 1'b1;
  phase1 = get_int_phase_shift(clk1_phase_shift, 0);
  @(negedge inclk0);
  @(posedge inclk0);
  #(phase1)
  forever #(((inclk0_input_frequency*clk1_divide_by)/clk1_multiply_by)/2)  c1 = ~c1;
end
initial
begin
  c2 = 1'b1;
  phase2 = get_int_phase_shift(clk2_phase_shift, 0);
  @(negedge inclk0);
  @(posedge inclk0);
  #(phase2)
  forever #(((inclk0_input_frequency*clk2_divide_by)/clk2_multiply_by)/2)  c2 = ~c2;
end
endmodule