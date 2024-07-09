module channelizer_xlcounter_free  (ce, clr, clk, op, up, load, din, en, rst);
 parameter core_name0= "";
 parameter op_width= 5;
 parameter op_arith= `xlSigned;
 input ce, clr, clk;
 input up, load;
 input [op_width-1:0] din;
 input en, rst;
 output [op_width-1:0] op;
 parameter [(8*op_width)-1:0] oneStr = { op_width{"1"}};
 wire  core_sinit;
 wire  core_ce;
 wire [op_width-1:0] op_net;
    assign core_ce = ce & en;
    assign core_sinit = (clr | rst) & ce;
    assign op = op_net;
 generate
if (core_name0 == "channelizer_c_counter_binary_v12_0_0")
     begin:comp0
channelizer_c_counter_binary_v12_0_0 core_instance0 (
        .CLK(clk),
        .CE(core_ce),
        .SINIT(core_sinit),
        .Q(op_net)
       );
     end
if (core_name0 == "channelizer_c_counter_binary_v12_0_1")
     begin:comp1
channelizer_c_counter_binary_v12_0_1 core_instance1 (
        .CLK(clk),
        .CE(core_ce),
        .SINIT(core_sinit),
        .Q(op_net)
       );
     end
if (core_name0 == "channelizer_c_counter_binary_v12_0_2")
     begin:comp2
channelizer_c_counter_binary_v12_0_2 core_instance2 (
        .CLK(clk),
        .CE(core_ce),
        .SINIT(core_sinit),
        .Q(op_net)
       );
     end
if (core_name0 == "channelizer_c_counter_binary_v12_0_3")
     begin:comp3
channelizer_c_counter_binary_v12_0_3 core_instance3 (
        .CLK(clk),
        .CE(core_ce),
        .SINIT(core_sinit),
        .Q(op_net)
       );
     end
endgenerate
 endmodule