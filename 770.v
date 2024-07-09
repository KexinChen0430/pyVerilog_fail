module single_bit_cdc_synchronizer #(
   parameter NUM_STAGES = 3 // minimum 2 stages, recommended 3 stages
                            // probability of metastability decreases
                            // exponentially with #stages
) (
   input clk, //latch clock
   input d_in,
   output q_out;
);
reg[NUM_STAGES-1:0] r;
assign q_out=r[NUM_STAGES-1];
integer i;
always@(posedge latch_clk)
begin
   for(i=1; i<NUM_STAGES; i=i+1) begin
      r[i] <= r[i-1];
   end
end
endmodule