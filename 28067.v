module reset_ctrl(
	input clk40,
	input idelay_rst_trig,
	input full_rst_trig,
	output reg dcm_rst = 1'b0,
	output reg idelay_rst = 1'b0
);
// Ports
/*input 	clk40;
input 	idelay_rst_trig;
input		full_rst_trig;
output 	dcm_rst;
output 	idelay_rst;*/
// Internal registers
//reg 			dcm_rst;
//reg 			idelay_rst;
reg 			rst_flag = 1'b0;
reg [23:0]	rst_count = 24'd0;
always @(posedge clk40) begin
	if (rst_flag) begin
		//Triggered
		rst_count <= rst_count + 1'd1;
		case (rst_count)
			24'd0: begin
				//Begin resetting DCM
				dcm_rst <= 1'b1;
				idelay_rst <= idelay_rst;
				rst_flag <= rst_flag;
			end
			24'd8500000: begin
				//212.5ms have passed.  Stop reset then reset idelayctrl
				dcm_rst <= 1'b0;
				idelay_rst <= idelay_rst;
				rst_flag <= rst_flag;
			end
			24'd8500010: begin
				//idelayctrl is reset.  Now do idelays
				idelay_rst <= 1'b1;
				dcm_rst <= dcm_rst;
				rst_flag <= rst_flag;
			end
			24'd8500020: begin
				//Finished
				idelay_rst <= 1'b0;
				dcm_rst <= dcm_rst;
				rst_flag <= 1'b0;
			end
		endcase
	end else begin
		//Not triggered yet
		if (idelay_rst_trig) begin
			//Trigger partial reset
			rst_flag <= 1'b1;
			rst_count <= 24'd8500010;
			idelay_rst <= idelay_rst;
			dcm_rst <= dcm_rst;
		end else begin
			//Trigger full reset
			if (full_rst_trig) begin
				rst_flag <= 1'b1;
				rst_count <= 24'd0;
				idelay_rst <= idelay_rst;
				dcm_rst <= dcm_rst;
			end
		end
	end
end
endmodule