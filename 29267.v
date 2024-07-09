module lshift (
  data,
  distance,
  overflow,
  result,
  underflow);
  input  wire [31:0] data;
  input  wire [4:0]  distance;
  output wire        overflow;
  output wire [31:0] result;
  output wire        underflow;
  lpm_clshift  LPM_CLSHIFT_component (
        .data (data),
        .direction (1'h0),
        .distance (distance),
        .overflow (overflow),
        .result (result),
        .underflow (underflow)
        // synopsys translate_off
        ,
        .aclr (),
        .clken (),
        .clock ()
        // synopsys translate_on
        );
  defparam
    LPM_CLSHIFT_component.lpm_shifttype = "LOGICAL",
    LPM_CLSHIFT_component.lpm_type = "LPM_CLSHIFT",
    LPM_CLSHIFT_component.lpm_width = 32,
    LPM_CLSHIFT_component.lpm_widthdist = 5;
endmodule