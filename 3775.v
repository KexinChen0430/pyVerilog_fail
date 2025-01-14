module processing_system7_bfm_v2_0_ddrc(
 rstn,
 sw_clk,
/* Goes to port 0 of DDR */
 ddr_wr_ack_port0,
 ddr_wr_dv_port0,
 ddr_rd_req_port0,
 ddr_rd_dv_port0,
 ddr_wr_addr_port0,
 ddr_wr_data_port0,
 ddr_wr_bytes_port0,
 ddr_rd_addr_port0,
 ddr_rd_data_port0,
 ddr_rd_bytes_port0,
 ddr_wr_qos_port0,
 ddr_rd_qos_port0,
/* Goes to port 1 of DDR */
 ddr_wr_ack_port1,
 ddr_wr_dv_port1,
 ddr_rd_req_port1,
 ddr_rd_dv_port1,
 ddr_wr_addr_port1,
 ddr_wr_data_port1,
 ddr_wr_bytes_port1,
 ddr_rd_addr_port1,
 ddr_rd_data_port1,
 ddr_rd_bytes_port1,
 ddr_wr_qos_port1,
 ddr_rd_qos_port1,
/* Goes to port2 of DDR */
 ddr_wr_ack_port2,
 ddr_wr_dv_port2,
 ddr_rd_req_port2,
 ddr_rd_dv_port2,
 ddr_wr_addr_port2,
 ddr_wr_data_port2,
 ddr_wr_bytes_port2,
 ddr_rd_addr_port2,
 ddr_rd_data_port2,
 ddr_rd_bytes_port2,
 ddr_wr_qos_port2,
 ddr_rd_qos_port2,
/* Goes to port3 of DDR */
 ddr_wr_ack_port3,
 ddr_wr_dv_port3,
 ddr_rd_req_port3,
 ddr_rd_dv_port3,
 ddr_wr_addr_port3,
 ddr_wr_data_port3,
 ddr_wr_bytes_port3,
 ddr_rd_addr_port3,
 ddr_rd_data_port3,
 ddr_rd_bytes_port3,
 ddr_wr_qos_port3,
 ddr_rd_qos_port3
);
`include "processing_system7_bfm_v2_0_local_params.v"
input rstn;
input sw_clk;
output ddr_wr_ack_port0;
input ddr_wr_dv_port0;
input ddr_rd_req_port0;
output ddr_rd_dv_port0;
input[addr_width-1:0] ddr_wr_addr_port0;
input[max_burst_bits-1:0] ddr_wr_data_port0;
input[max_burst_bytes_width:0] ddr_wr_bytes_port0;
input[addr_width-1:0] ddr_rd_addr_port0;
output[max_burst_bits-1:0] ddr_rd_data_port0;
input[max_burst_bytes_width:0] ddr_rd_bytes_port0;
input [axi_qos_width-1:0] ddr_wr_qos_port0;
input [axi_qos_width-1:0] ddr_rd_qos_port0;
output ddr_wr_ack_port1;
input ddr_wr_dv_port1;
input ddr_rd_req_port1;
output ddr_rd_dv_port1;
input[addr_width-1:0] ddr_wr_addr_port1;
input[max_burst_bits-1:0] ddr_wr_data_port1;
input[max_burst_bytes_width:0] ddr_wr_bytes_port1;
input[addr_width-1:0] ddr_rd_addr_port1;
output[max_burst_bits-1:0] ddr_rd_data_port1;
input[max_burst_bytes_width:0] ddr_rd_bytes_port1;
input[axi_qos_width-1:0] ddr_wr_qos_port1;
input[axi_qos_width-1:0] ddr_rd_qos_port1;
output ddr_wr_ack_port2;
input ddr_wr_dv_port2;
input ddr_rd_req_port2;
output ddr_rd_dv_port2;
input[addr_width-1:0] ddr_wr_addr_port2;
input[max_burst_bits-1:0] ddr_wr_data_port2;
input[max_burst_bytes_width:0] ddr_wr_bytes_port2;
input[addr_width-1:0] ddr_rd_addr_port2;
output[max_burst_bits-1:0] ddr_rd_data_port2;
input[max_burst_bytes_width:0] ddr_rd_bytes_port2;
input[axi_qos_width-1:0] ddr_wr_qos_port2;
input[axi_qos_width-1:0] ddr_rd_qos_port2;
output ddr_wr_ack_port3;
input ddr_wr_dv_port3;
input ddr_rd_req_port3;
output ddr_rd_dv_port3;
input[addr_width-1:0] ddr_wr_addr_port3;
input[max_burst_bits-1:0] ddr_wr_data_port3;
input[max_burst_bytes_width:0] ddr_wr_bytes_port3;
input[addr_width-1:0] ddr_rd_addr_port3;
output[max_burst_bits-1:0] ddr_rd_data_port3;
input[max_burst_bytes_width:0] ddr_rd_bytes_port3;
input[axi_qos_width-1:0] ddr_wr_qos_port3;
input[axi_qos_width-1:0] ddr_rd_qos_port3;
wire [axi_qos_width-1:0] wr_qos;
wire wr_req;
wire [max_burst_bits-1:0] wr_data;
wire [addr_width-1:0] wr_addr;
wire [max_burst_bytes_width:0] wr_bytes;
reg wr_ack;
wire [axi_qos_width-1:0] rd_qos;
reg [max_burst_bits-1:0] rd_data;
wire [addr_width-1:0] rd_addr;
wire [max_burst_bytes_width:0] rd_bytes;
reg rd_dv;
wire rd_req;
processing_system7_bfm_v2_0_arb_wr_4 ddr_write_ports (
 .rstn(rstn),
 .sw_clk(sw_clk),
 .qos1(ddr_wr_qos_port0),
 .qos2(ddr_wr_qos_port1),
 .qos3(ddr_wr_qos_port2),
 .qos4(ddr_wr_qos_port3),
 .prt_dv1(ddr_wr_dv_port0),
 .prt_dv2(ddr_wr_dv_port1),
 .prt_dv3(ddr_wr_dv_port2),
 .prt_dv4(ddr_wr_dv_port3),
 .prt_data1(ddr_wr_data_port0),
 .prt_data2(ddr_wr_data_port1),
 .prt_data3(ddr_wr_data_port2),
 .prt_data4(ddr_wr_data_port3),
 .prt_addr1(ddr_wr_addr_port0),
 .prt_addr2(ddr_wr_addr_port1),
 .prt_addr3(ddr_wr_addr_port2),
 .prt_addr4(ddr_wr_addr_port3),
 .prt_bytes1(ddr_wr_bytes_port0),
 .prt_bytes2(ddr_wr_bytes_port1),
 .prt_bytes3(ddr_wr_bytes_port2),
 .prt_bytes4(ddr_wr_bytes_port3),
 .prt_ack1(ddr_wr_ack_port0),
 .prt_ack2(ddr_wr_ack_port1),
 .prt_ack3(ddr_wr_ack_port2),
 .prt_ack4(ddr_wr_ack_port3),
 .prt_qos(wr_qos),
 .prt_req(wr_req),
 .prt_data(wr_data),
 .prt_addr(wr_addr),
 .prt_bytes(wr_bytes),
 .prt_ack(wr_ack)
);
processing_system7_bfm_v2_0_arb_rd_4 ddr_read_ports (
 .rstn(rstn),
 .sw_clk(sw_clk),
 .qos1(ddr_rd_qos_port0),
 .qos2(ddr_rd_qos_port1),
 .qos3(ddr_rd_qos_port2),
 .qos4(ddr_rd_qos_port3),
 .prt_req1(ddr_rd_req_port0),
 .prt_req2(ddr_rd_req_port1),
 .prt_req3(ddr_rd_req_port2),
 .prt_req4(ddr_rd_req_port3),
 .prt_data1(ddr_rd_data_port0),
 .prt_data2(ddr_rd_data_port1),
 .prt_data3(ddr_rd_data_port2),
 .prt_data4(ddr_rd_data_port3),
 .prt_addr1(ddr_rd_addr_port0),
 .prt_addr2(ddr_rd_addr_port1),
 .prt_addr3(ddr_rd_addr_port2),
 .prt_addr4(ddr_rd_addr_port3),
 .prt_bytes1(ddr_rd_bytes_port0),
 .prt_bytes2(ddr_rd_bytes_port1),
 .prt_bytes3(ddr_rd_bytes_port2),
 .prt_bytes4(ddr_rd_bytes_port3),
 .prt_dv1(ddr_rd_dv_port0),
 .prt_dv2(ddr_rd_dv_port1),
 .prt_dv3(ddr_rd_dv_port2),
 .prt_dv4(ddr_rd_dv_port3),
 .prt_qos(rd_qos),
 .prt_req(rd_req),
 .prt_data(rd_data),
 .prt_addr(rd_addr),
 .prt_bytes(rd_bytes),
 .prt_dv(rd_dv)
);
processing_system7_bfm_v2_0_sparse_mem ddr();
reg [1:0] state;
always@(posedge sw_clk or negedge rstn)
begin
if(!rstn) begin
 wr_ack <= 0;
 rd_dv <= 0;
 state <= 2'd0;
end else begin
 case(state)
 0:begin
     state <= 0;
     wr_ack <= 0;
     rd_dv <= 0;
     if(wr_req) begin
       ddr.write_mem(wr_data , wr_addr, wr_bytes);
       wr_ack <= 1;
       state <= 1;
     end
     if(rd_req) begin
       ddr.read_mem(rd_data,rd_addr, rd_bytes);
       rd_dv <= 1;
       state <= 1;
     end
   end
 1:begin
       wr_ack <= 0;
       rd_dv  <= 0;
       state <= 0;
   end
 endcase
end /// if
end// always
endmodule