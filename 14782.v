module stratix_ram_register (
                             d,
                             clk,
                             aclr,
                             devclrn,
                             devpor,
                             ena,
                             q,
                             aclrout
                            );
parameter width = 1;      // data width
parameter preset = 1'b0;  // clear acts as preset
input [width - 1:0] d;    // data
input clk;                // clock
input aclr;               // asynch clear
input devclrn,devpor;     // device wide clear/reset
input ena;                // clock enable
output [width - 1:0] q;   // register output
output aclrout;           // delayed asynch clear
wire ena_ipd;
wire clk_ipd;
wire aclr_ipd;
wire [width - 1:0] d_ipd;
buf buf_ena (ena_ipd,ena);
buf buf_clk (clk_ipd,clk);
buf buf_aclr (aclr_ipd,aclr);
buf buf_d [width - 1:0] (d_ipd,d);
wire  [width - 1:0] q_opd;
buf buf_q  [width - 1:0] (q,q_opd);
reg   [width - 1:0] q_reg;
reg viol_notifier;
wire reset;
assign reset = devpor && devclrn && (!aclr_ipd) && (ena_ipd);
specify
      $setup  (d,    posedge clk &&& reset, 0, viol_notifier);
      $setup  (aclr, posedge clk, 0, viol_notifier);
      $setup  (ena,  posedge clk &&& reset, 0, viol_notifier );
      $hold   (posedge clk &&& reset, d   , 0, viol_notifier);
      $hold   (posedge clk, aclr, 0, viol_notifier);
      $hold   (posedge clk &&& reset, ena , 0, viol_notifier );
      (posedge clk =>  (q +: q_reg)) = (0,0);
      (posedge aclr => (q +: q_reg)) = (0,0);
endspecify
initial q_reg <= (preset) ? {width{1'b1}} : 'b0;
always @(posedge clk_ipd or posedge aclr_ipd or negedge devclrn or negedge devpor)
begin
    if (aclr_ipd || ~devclrn || ~devpor)
        q_reg <= (preset) ? {width{1'b1}} : 'b0;
              else if (ena_ipd)
        q_reg <= d_ipd;
end
assign aclrout = aclr_ipd;
assign q_opd = q_reg;
endmodule