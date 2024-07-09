module
output        read_request_o;
output [31:2] addr_o;
output  [3:0] sel_o;
input  [31:0] dat_i;
input         ack_i;
// Interface against masters (clip)
input         m0_read_request_i;
input  [31:2] m0_addr_i;
input   [3:0] m0_sel_i;
output [31:0] m0_dat_o;
output        m0_ack_o;
// Interface against masters (fragment processor)
input         m1_read_request_i;
input  [31:2] m1_addr_i;
input   [3:0] m1_sel_i;
output [31:0] m1_dat_o;
output        m1_ack_o;
// Interface against masters (blender)
input         m2_read_request_i;
input  [31:2] m2_addr_i;
input   [3:0] m2_sel_i;
output [31:0] m2_dat_o;
output        m2_ack_o;
// Master ins -> |MUX> -> these wires
wire        rreq_w;
wire [31:2] addr_w;
wire  [3:0] sel_w;
// Slave ins -> |MUX> -> these wires
wire [31:0] dat_w;
wire        ack_w;
// Master select (MUX controls)
wire [2:0] master_sel;
assign master_busy_o = m0_read_request_i | m1_read_request_i | m2_read_request_i;
// priority to wbm1, the blender master
assign master_sel[0] = m0_read_request_i & !m1_read_request_i & !m2_read_request_i;
assign master_sel[1] = m1_read_request_i & !m2_read_request_i;
assign master_sel[2] = m2_read_request_i;
// Master input mux, priority to blender master
assign m0_dat_o = dat_i;
assign m0_ack_o = ack_i & master_sel[0];
assign m1_dat_o = dat_i;
assign m1_ack_o = ack_i & master_sel[1];
assign m2_dat_o = dat_i;
assign m2_ack_o = ack_i & master_sel[2];
assign read_request_o = master_sel[2] |
                        master_sel[1] |
                        master_sel[0];
assign addr_o = master_sel[2] ? m2_addr_i :
                master_sel[1] ? m1_addr_i :
	                              m0_addr_i;
assign sel_o  = master_sel[2] ? m2_sel_i :
                master_sel[1] ? m1_sel_i :
	                              m0_sel_i;
endmodule