module router_wrap
  (clk, reset, router_address, channel_in_ip, flow_ctrl_out_ip, channel_out_op,
   flow_ctrl_in_op, error, count_down, DoS_detected, permanent_blocked);
`include "c_functions.v"
`include "c_constants.v"
`include "rtr_constants.v"
`include "vcr_constants.v"
`include "parameters.v"
   // total number of packet classes
   localparam num_packet_classes = num_message_classes * num_resource_classes;
   // number of VCs
   localparam num_vcs = num_packet_classes * num_vcs_per_class;
   // width required to select individual VC
   localparam vc_idx_width = clogb(num_vcs);
   // total number of routers
   localparam num_routers
     = (num_nodes + num_nodes_per_router - 1) / num_nodes_per_router;
   // number of routers in each dimension
   localparam num_routers_per_dim = croot(num_routers, num_dimensions);
   // width required to select individual router in a dimension
   localparam dim_addr_width = clogb(num_routers_per_dim);
   // width required to select individual router in entire network
   localparam router_addr_width = num_dimensions * dim_addr_width;
   // connectivity within each dimension
   localparam connectivity
     = (topology == `TOPOLOGY_MESH) ?
       `CONNECTIVITY_LINE :
       (topology == `TOPOLOGY_TORUS) ?
       `CONNECTIVITY_RING :
       (topology == `TOPOLOGY_FBFLY) ?
       `CONNECTIVITY_FULL :
       -1;
   // number of adjacent routers in each dimension
   localparam num_neighbors_per_dim
     = ((connectivity == `CONNECTIVITY_LINE) ||
	(connectivity == `CONNECTIVITY_RING)) ?
       2 :
       (connectivity == `CONNECTIVITY_FULL) ?
       (num_routers_per_dim - 1) :
       -1;
   // number of input and output ports on router
   localparam num_ports
     = num_dimensions * num_neighbors_per_dim + num_nodes_per_router;
   // width of flow control signals
   localparam flow_ctrl_width
     = (flow_ctrl_type == `FLOW_CTRL_TYPE_CREDIT) ? (1 + vc_idx_width) :
       -1;
   // width of link management signals
   localparam link_ctrl_width = enable_link_pm ? 1 : 0;
   // width of flit control signals
   localparam flit_ctrl_width
     = (packet_format == `PACKET_FORMAT_HEAD_TAIL) ?
       (1 + vc_idx_width + 1 + 1) :
       (packet_format == `PACKET_FORMAT_TAIL_ONLY) ?
       (1 + vc_idx_width + 1) :
       (packet_format == `PACKET_FORMAT_EXPLICIT_LENGTH) ?
       (1 + vc_idx_width + 1) :
       -1;
   // width of channel
   localparam channel_width
     = link_ctrl_width + flit_ctrl_width + flit_data_width;
   //DoS Attack Detection
   wire [0:channel_width-1] local_port;
   wire valid_packet;
   assign local_port = channel_in_ip[(num_ports-1)*channel_width:num_ports*channel_width-1];
   assign valid_packet = local_port[0];
   reg [9:0] packet_count;
   reg [9:0] epoch;
   output reg [10:0] count_down;
   output reg DoS_detected;
   output reg permanent_blocked;
   always @(posedge clk, posedge reset) begin
     if (reset)
       epoch <= 0;
     else begin
       if (epoch == 1000)
         epoch <= 0;
       else begin
         epoch <= epoch + 1;
         //$display("%d",epoch);
       end
     end
   end
   always @(posedge clk, posedge reset) begin
     if (reset)
       packet_count <= 0;
     else begin
       if (epoch == 1000)
         packet_count <= 0;
       else if (valid_packet)
         packet_count <= packet_count + 1;
     end
   end
   always @(posedge clk, posedge reset) begin
     if (reset)
       DoS_detected <= 0;
     else begin
       if (epoch == 1000 && packet_count >= 700) begin
         $display("At time:%t, Router Address: %b, DoS attack detected!!!", $time, router_address);
         DoS_detected <= 1;
       end
       else if (count_down == 0 && epoch == 1000 && packet_count < 700 && DoS_detected) begin
         $display("At time: %t, Router Address: %b, DoS cleared", $time, router_address);
         DoS_detected <= 0;
       end
     end
   end
   always @(posedge clk, posedge reset) begin
     if (reset) begin
       count_down        <= 2002;
       permanent_blocked <= 0;
     end
     else begin
       if (DoS_detected && count_down != 0)
         count_down <= count_down - 1;
       else if (count_down == 0 && epoch == 1000 && packet_count >= 700 && DoS_detected) begin
         permanent_blocked <= 1;
         $display("Router Address: %b, Permanent Blocked!!!", router_address);
       end
       else if (count_down == 0 && epoch == 1000 && packet_count < 700 && DoS_detected)
         count_down <= 2002;
     end
   end
   //PRIV MODE
   reg [3:0] counter;
   wire increment, decrement;
   assign increment = channel_in_ip[0];
   assign decrement = channel_in_ip[1];
   always @(posedge clk) begin
     if (reset)
     	counter <= 0;
     else begin
     	if (increment && !decrement)
     		counter <= counter + 1;
     	else if (!increment && decrement && counter > 0)
     		counter <= counter - 1;
     end
   end
   input clk;
   input reset;
   // current router's address
   input [0:router_addr_width-1] router_address;
   // incoming channels
   input [0:num_ports*channel_width-1] channel_in_ip;
   // outgoing flow control signals
   output [0:num_ports*flow_ctrl_width-1] flow_ctrl_out_ip;
   wire [0:num_ports*flow_ctrl_width-1]   flow_ctrl_out_ip;
   // outgoing channels
   output [0:num_ports*channel_width-1]   channel_out_op;
   wire [0:num_ports*channel_width-1] 	  channel_out_op;
   // incoming flow control signals
   input [0:num_ports*flow_ctrl_width-1]  flow_ctrl_in_op;
   // internal error condition detected
   output 				  error;
   wire 				  error;
   generate
      case(router_type)
	`ROUTER_TYPE_WORMHOLE:
	  begin
	     whr_top
	       #(.buffer_size(buffer_size),
		 .num_routers_per_dim(num_routers_per_dim),
		 .num_dimensions(num_dimensions),
		 .num_nodes_per_router(num_nodes_per_router),
		 .connectivity(connectivity),
		 .packet_format(packet_format),
		 .flow_ctrl_type(flow_ctrl_type),
		 .flow_ctrl_bypass(flow_ctrl_bypass),
		 .max_payload_length(max_payload_length),
		 .min_payload_length(min_payload_length),
		 .enable_link_pm(enable_link_pm),
		 .flit_data_width(flit_data_width),
		 .error_capture_mode(error_capture_mode),
		 .restrict_turns(restrict_turns),
		 .routing_type(routing_type),
		 .dim_order(dim_order),
		 .input_stage_can_hold(input_stage_can_hold),
		 .fb_regfile_type(fb_regfile_type),
		 .fb_fast_peek(fb_fast_peek),
		 .explicit_pipeline_register(explicit_pipeline_register),
		 .gate_buffer_write(gate_buffer_write),
		 .precomp_ip_sel(precomp_ip_sel),
		 .arbiter_type(sw_alloc_arbiter_type),
		 .crossbar_type(crossbar_type),
		 .reset_type(reset_type))
	     whr
	       (.clk(clk),
		.reset(reset),
		.router_address(router_address),
		.channel_in_ip(channel_in_ip),
		.flow_ctrl_out_ip(flow_ctrl_out_ip),
		.channel_out_op(channel_out_op),
		.flow_ctrl_in_op(flow_ctrl_in_op),
		.error(error));
	  end
	`ROUTER_TYPE_VC:
	  begin
	     vcr_top
	       #(.buffer_size(buffer_size),
		 .num_message_classes(num_message_classes),
		 .num_resource_classes(num_resource_classes),
		 .num_vcs_per_class(num_vcs_per_class),
		 .num_routers_per_dim(num_routers_per_dim),
		 .num_dimensions(num_dimensions),
		 .num_nodes_per_router(num_nodes_per_router),
		 .connectivity(connectivity),
		 .packet_format(packet_format),
		 .flow_ctrl_type(flow_ctrl_type),
		 .flow_ctrl_bypass(flow_ctrl_bypass),
		 .max_payload_length(max_payload_length),
		 .min_payload_length(min_payload_length),
		 .enable_link_pm(enable_link_pm),
		 .flit_data_width(flit_data_width),
		 .error_capture_mode(error_capture_mode),
		 .restrict_turns(restrict_turns),
		 .routing_type(routing_type),
		 .dim_order(dim_order),
		 .fb_regfile_type(fb_regfile_type),
		 .fb_mgmt_type(fb_mgmt_type),
		 .fb_fast_peek(fb_fast_peek),
		 .disable_static_reservations(disable_static_reservations),
		 .explicit_pipeline_register(explicit_pipeline_register),
		 .gate_buffer_write(gate_buffer_write),
		 .elig_mask(elig_mask),
		 .vc_alloc_type(vc_alloc_type),
		 .vc_alloc_arbiter_type(vc_alloc_arbiter_type),
		 .sw_alloc_type(sw_alloc_type),
		 .sw_alloc_arbiter_type(sw_alloc_arbiter_type),
		 .sw_alloc_spec_type(sw_alloc_spec_type),
		 .crossbar_type(crossbar_type),
		 .reset_type(reset_type))
	     vcr
	       (.clk(clk),
		.reset(reset),
		.router_address(router_address),
		.channel_in_ip(channel_in_ip),
		.flow_ctrl_out_ip(flow_ctrl_out_ip),
		.channel_out_op(channel_out_op),
		.flow_ctrl_in_op(flow_ctrl_in_op),
		.error(error));
	  end
	`ROUTER_TYPE_COMBINED:
	  begin
	     rtr_top
	       #(.buffer_size(buffer_size),
		 .num_message_classes(num_message_classes),
		 .num_resource_classes(num_resource_classes),
		 .num_vcs_per_class(num_vcs_per_class),
		 .num_routers_per_dim(num_routers_per_dim),
		 .num_dimensions(num_dimensions),
		 .num_nodes_per_router(num_nodes_per_router),
		 .connectivity(connectivity),
		 .packet_format(packet_format),
		 .flow_ctrl_type(flow_ctrl_type),
		 .flow_ctrl_bypass(flow_ctrl_bypass),
		 .max_payload_length(max_payload_length),
		 .min_payload_length(min_payload_length),
		 .enable_link_pm(enable_link_pm),
		 .flit_data_width(flit_data_width),
		 .error_capture_mode(error_capture_mode),
		 .restrict_turns(restrict_turns),
		 .predecode_lar_info(predecode_lar_info),
		 .routing_type(routing_type),
		 .dim_order(dim_order),
		 .fb_regfile_type(fb_regfile_type),
		 .fb_mgmt_type(fb_mgmt_type),
		 .fb_fast_peek(fb_fast_peek),
		 .disable_static_reservations(disable_static_reservations),
		 .explicit_pipeline_register(explicit_pipeline_register),
		 .gate_buffer_write(gate_buffer_write),
		 .dual_path_alloc(dual_path_alloc),
		 .dual_path_allow_conflicts(dual_path_allow_conflicts),
		 .dual_path_mask_on_ready(dual_path_mask_on_ready),
		 .precomp_ivc_sel(precomp_ivc_sel),
		 .precomp_ip_sel(precomp_ip_sel),
		 .elig_mask(elig_mask),
		 .sw_alloc_arbiter_type(sw_alloc_arbiter_type),
		 .vc_alloc_arbiter_type(vc_alloc_arbiter_type),
		 .vc_alloc_prefer_empty(vc_alloc_prefer_empty),
		 .crossbar_type(crossbar_type),
		 .reset_type(reset_type))
	     rtr
	       (.clk(clk),
		.reset(reset),
		.router_address(router_address),
		.channel_in_ip(channel_in_ip),
		.flow_ctrl_out_ip(flow_ctrl_out_ip),
		.channel_out_op(channel_out_op),
		.flow_ctrl_in_op(flow_ctrl_in_op),
		.error(error));
	  end
      endcase
   endgenerate
endmodule