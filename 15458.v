module
.read_request_o (read_request_o),
.addr_o (addr_o),
.sel_o (sel_o),
.dat_i (dat_i),
.ack_i (ack_i),
// Interface against masters (clip)
.m0_read_request_i (m0_read_request_i),
.m0_addr_i (m0_addr_i),
.m0_sel_i (m0_sel_i),
.m0_dat_o (m0_dat_o),
.m0_ack_o (m0_ack_o),
// Interface against masters (fragment processor)
.m1_read_request_i (m1_read_request_i),
.m1_addr_i (m1_addr_i),
.m1_sel_i (m1_sel_i),
.m1_dat_o (m1_dat_o),
.m1_ack_o (m1_ack_o),
// Interface against masters (blender)
.m2_read_request_i (m2_read_request_i),
.m2_addr_i (m2_addr_i),
.m2_sel_i (m2_sel_i),
.m2_dat_o (m2_dat_o),
.m2_ack_o (m2_ack_o)
);
endmodule