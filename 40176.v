module aaa
   (
    input  data_t iii_in,
    input  data_t jjj_in,
    input  [1:0] ctl0,
    output data_t iii_out,
    output data_t jjj_out,
    input  logic clk,
    input  logic rst
    );
   // Below is a bug; {} concat isn't used to make arrays
  bbb bbb (
	   .ggg_in  ({jjj_in,            iii_in}),
	   .ggg_out ({jjj_out,           iii_out}),
	   .ctl	    ({{1'b1,ctl0[1]},    {1'b0,ctl0[0]}}),
           .*);
endmodule