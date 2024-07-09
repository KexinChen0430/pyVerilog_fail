module Cfu(cmd_ready, cmd_payload_function_id, cmd_payload_inputs_0, cmd_payload_inputs_1, rsp_valid, rsp_ready, rsp_payload_outputs_0, reset, clk, rst, cmd_valid);
  reg \initial  = 0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:199" *)
  wire [32:0] \$27 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:199" *)
  wire [32:0] \$28 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:229" *)
  wire [31:0] \$signal ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:230" *)
  wire \$signal$30 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:231" *)
  reg \$signal$31 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:229" *)
  wire [31:0] \$signal$32 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:230" *)
  wire \$signal$33 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:231" *)
  reg \$signal$34 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:229" *)
  wire [31:0] \$signal$35 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:230" *)
  wire \$signal$36 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:231" *)
  reg \$signal$37 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:229" *)
  wire [31:0] \$signal$38 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:230" *)
  wire \$signal$39 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:231" *)
  reg \$signal$40 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:229" *)
  wire [31:0] \$signal$41 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:230" *)
  wire \$signal$42 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:231" *)
  reg \$signal$44 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:229" *)
  wire [31:0] \$signal$45 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:230" *)
  wire \$signal$46 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:231" *)
  reg \$signal$48 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:229" *)
  wire [31:0] \$signal$49 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:230" *)
  wire \$signal$50 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:231" *)
  reg \$signal$52 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:229" *)
  wire [31:0] \$signal$53 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:230" *)
  wire \$signal$54 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:231" *)
  reg \$signal$55 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:48" *)
  wire [31:0] add_one_input__payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:48" *)
  wire add_one_input__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:48" *)
  wire add_one_input__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:49" *)
  wire [31:0] add_one_output__payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:49" *)
  wire add_one_output__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:49" *)
  wire add_one_output__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/ir.py:524" *)
  input clk;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:172" *)
  input [9:0] cmd_payload_function_id;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:174" *)
  input [31:0] cmd_payload_inputs_0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:175" *)
  input [31:0] cmd_payload_inputs_1;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:171" *)
  output cmd_ready;
  reg cmd_ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:170" *)
  input cmd_valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:225" *)
  reg current_function_done;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:224" *)
  reg [2:0] current_function_id;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:53" *)
  wire fallback3_done;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:48" *)
  wire [31:0] fallback3_in0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:49" *)
  wire [31:0] fallback3_in1;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:51" *)
  wire [31:0] fallback3_output;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:53" *)
  wire fallback4_done;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:48" *)
  wire [31:0] fallback4_in0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:49" *)
  wire [31:0] fallback4_in1;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:51" *)
  wire [31:0] fallback4_output;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:53" *)
  wire fallback5_done;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:48" *)
  wire [31:0] fallback5_in0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:49" *)
  wire [31:0] fallback5_in1;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:51" *)
  wire [31:0] fallback5_output;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:53" *)
  wire fallback6_done;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:48" *)
  wire [31:0] fallback6_in0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:49" *)
  wire [31:0] fallback6_in1;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:51" *)
  wire [31:0] fallback6_output;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:48" *)
  wire [127:0] filter_flow_restrictor_input__payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:48" *)
  wire filter_flow_restrictor_input__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:48" *)
  wire filter_flow_restrictor_input__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:49" *)
  wire [127:0] filter_flow_restrictor_output__payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:49" *)
  wire filter_flow_restrictor_output__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:49" *)
  wire filter_flow_restrictor_output__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/flow.py:53" *)
  wire [31:0] filter_flow_restrictor_release__payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/flow.py:53" *)
  wire filter_flow_restrictor_release__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:60" *)
  wire [31:0] filter_store_data_input__payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:60" *)
  wire filter_store_data_input__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:60" *)
  wire filter_store_data_input__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:62" *)
  wire [127:0] filter_store_data_output__payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:62" *)
  wire filter_store_data_output__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:62" *)
  wire filter_store_data_output__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:61" *)
  wire [31:0] filter_store_num_words_input__payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:61" *)
  wire filter_store_num_words_input__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:61" *)
  wire filter_store_num_words_input__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:251" *)
  reg [1:0] fsm_state = 2'h0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:251" *)
  reg [1:0] \fsm_state$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:217" *)
  wire [2:0] funct3;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:218" *)
  wire [6:0] funct7;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:50" *)
  wire [6:0] \funct7$56 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:50" *)
  wire [6:0] \funct7$57 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:50" *)
  wire [6:0] \funct7$58 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:50" *)
  wire [6:0] \funct7$59 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:50" *)
  wire [6:0] \funct7$60 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:53" *)
  wire get_done;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:50" *)
  wire [6:0] get_funct7;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:48" *)
  wire [31:0] get_in0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:49" *)
  wire [31:0] get_in1;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:51" *)
  wire [31:0] get_output;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:121" *)
  wire [31:0] get_sink_30__payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:121" *)
  wire get_sink_30__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:121" *)
  wire get_sink_30__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:121" *)
  wire [31:0] get_sink_44__payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:121" *)
  wire get_sink_44__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:121" *)
  wire get_sink_44__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:121" *)
  wire [31:0] get_sink_70__payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:121" *)
  wire get_sink_70__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:121" *)
  wire get_sink_70__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:52" *)
  wire get_start;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:48" *)
  wire [127:0] input_flow_restrictor_input__payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:48" *)
  wire input_flow_restrictor_input__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:48" *)
  wire input_flow_restrictor_input__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:49" *)
  wire [127:0] input_flow_restrictor_output__payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:49" *)
  wire input_flow_restrictor_output__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:49" *)
  wire input_flow_restrictor_output__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/flow.py:53" *)
  wire [31:0] input_flow_restrictor_release__payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/flow.py:53" *)
  wire input_flow_restrictor_release__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:52" *)
  wire [31:0] input_store_data_input__payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:52" *)
  wire input_store_data_input__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:52" *)
  wire input_store_data_input__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:54" *)
  wire [127:0] input_store_data_output__payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:54" *)
  wire input_store_data_output__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:54" *)
  wire input_store_data_output__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:53" *)
  wire [31:0] input_store_num_words_input__payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:53" *)
  wire input_store_num_words_input__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:53" *)
  wire input_store_num_words_input__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:56" *)
  wire macc_enable;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:57" *)
  wire [8:0] macc_offset;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:58" *)
  wire [127:0] macc_operands__payload__filters;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:58" *)
  wire [127:0] macc_operands__payload__inputs;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:58" *)
  wire macc_operands__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:58" *)
  wire macc_operands__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:60" *)
  wire [31:0] macc_result__payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:60" *)
  wire macc_result__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:60" *)
  wire macc_result__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:172" *)
  wire [15:0] op_store_read_data__bias;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:172" *)
  wire [31:0] op_store_read_data__multiplier;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:172" *)
  wire [3:0] op_store_read_data__shift;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:171" *)
  wire op_store_read_enable;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:168" *)
  wire op_store_reset;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:170" *)
  wire [15:0] op_store_write_data__bias;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:170" *)
  wire [31:0] op_store_write_data__multiplier;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:170" *)
  wire [3:0] op_store_write_data__shift;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:169" *)
  reg op_store_write_enable = 1'h0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:169" *)
  reg \op_store_write_enable$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:123" *)
  wire [127:0] operands_buffer_output__payload__filters;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:123" *)
  wire [127:0] operands_buffer_output__payload__inputs;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:123" *)
  wire operands_buffer_output__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:123" *)
  wire operands_buffer_output__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:122" *)
  wire [127:0] operands_buffer_payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:122" *)
  wire [127:0] \operands_buffer_payload$25 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:122" *)
  wire operands_buffer_ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:122" *)
  wire \operands_buffer_ready$26 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:122" *)
  wire operands_buffer_valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:122" *)
  wire \operands_buffer_valid$24 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:51" *)
  wire [31:0] \output ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:53" *)
  wire ping_done;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:48" *)
  wire [31:0] ping_in0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:49" *)
  wire [31:0] ping_in1;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:51" *)
  wire [31:0] ping_output;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:52" *)
  wire ping_start;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:368" *)
  wire [7:0] pp_activation_max;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:367" *)
  wire [7:0] pp_activation_min;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:53" *)
  wire pp_done;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:50" *)
  wire [6:0] pp_funct7;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:48" *)
  wire [31:0] pp_in0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:49" *)
  wire [31:0] pp_in1;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:366" *)
  wire [8:0] pp_offset;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:51" *)
  wire [31:0] pp_output;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:369" *)
  wire [15:0] pp_read_data__bias;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:369" *)
  wire [31:0] pp_read_data__multiplier;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:369" *)
  wire [3:0] pp_read_data__shift;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:370" *)
  wire pp_read_enable;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:371" *)
  wire [31:0] pp_result__payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:371" *)
  wire pp_result__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:371" *)
  wire pp_result__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:52" *)
  wire pp_start;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:179" *)
  input reset;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:83" *)
  wire [31:0] result_accumulator_accumulated__payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:83" *)
  wire result_accumulator_accumulated__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:83" *)
  wire result_accumulator_accumulated__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:81" *)
  wire [31:0] result_accumulator_num_results__payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:81" *)
  wire result_accumulator_num_results__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:82" *)
  wire [31:0] result_accumulator_results__payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:82" *)
  wire result_accumulator_results__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:82" *)
  wire result_accumulator_results__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:178" *)
  output [31:0] rsp_payload_outputs_0;
  reg [31:0] rsp_payload_outputs_0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:177" *)
  input rsp_ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:176" *)
  output rsp_valid;
  reg rsp_valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/ir.py:524" *)
  output rst;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:102" *)
  wire [31:0] \set_$signal ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:102" *)
  wire [31:0] \set_$signal$16 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:102" *)
  wire [31:0] \set_$signal$17 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:102" *)
  wire [31:0] \set_$signal$18 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:103" *)
  wire \set_$signal$19 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:103" *)
  wire \set_$signal$20 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:102" *)
  wire [31:0] \set_$signal$21 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:102" *)
  wire [31:0] \set_$signal$22 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:102" *)
  wire [31:0] \set_$signal$23 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:53" *)
  wire set_done;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:50" *)
  wire [6:0] set_funct7;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:48" *)
  wire [31:0] set_in0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:49" *)
  wire [31:0] set_in1;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:100" *)
  wire [31:0] set_payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:100" *)
  wire [31:0] \set_payload$11 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:100" *)
  wire [31:0] \set_payload$13 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:100" *)
  wire [31:0] \set_payload$2 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:100" *)
  wire [31:0] \set_payload$5 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:100" *)
  wire [31:0] \set_payload$8 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:100" *)
  wire set_ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:100" *)
  wire \set_ready$12 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:100" *)
  wire \set_ready$15 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:100" *)
  wire \set_ready$3 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:100" *)
  wire \set_ready$6 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:100" *)
  wire \set_ready$9 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:52" *)
  wire set_start;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:100" *)
  wire set_valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:100" *)
  wire \set_valid$1 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:100" *)
  wire \set_valid$10 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:100" *)
  wire \set_valid$14 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:100" *)
  wire \set_valid$4 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:100" *)
  wire \set_valid$7 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:52" *)
  wire start;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:52" *)
  wire \start$43 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:52" *)
  wire \start$47 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:52" *)
  wire \start$51 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:223" *)
  reg [2:0] stored_function_id = 3'h0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:223" *)
  reg [2:0] \stored_function_id$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:226" *)
  reg [31:0] stored_output = 32'd0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:226" *)
  reg [31:0] \stored_output$next ;
  assign \$28  = - (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:199" *) \set_$signal$18 ;
  always @(posedge clk)
    stored_output <= \stored_output$next ;
  always @(posedge clk)
    fsm_state <= \fsm_state$next ;
  always @(posedge clk)
    stored_function_id <= \stored_function_id$next ;
  always @(posedge clk)
    op_store_write_enable <= \op_store_write_enable$next ;
  add_one add_one (
    .input__payload(add_one_input__payload),
    .input__ready(add_one_input__ready),
    .input__valid(add_one_input__valid),
    .output__payload(add_one_output__payload),
    .output__ready(add_one_output__ready),
    .output__valid(add_one_output__valid)
  );
  fallback3 fallback3 (
    .done(fallback3_done),
    .in0(fallback3_in0),
    .in1(fallback3_in1),
    .\output (fallback3_output)
  );
  fallback4 fallback4 (
    .done(fallback4_done),
    .in0(fallback4_in0),
    .in1(fallback4_in1),
    .\output (fallback4_output)
  );
  fallback5 fallback5 (
    .done(fallback5_done),
    .in0(fallback5_in0),
    .in1(fallback5_in1),
    .\output (fallback5_output)
  );
  fallback6 fallback6 (
    .done(fallback6_done),
    .in0(fallback6_in0),
    .in1(fallback6_in1),
    .\output (fallback6_output)
  );
  filter_flow_restrictor filter_flow_restrictor (
    .clk(clk),
    .input__payload(filter_flow_restrictor_input__payload),
    .input__ready(filter_flow_restrictor_input__ready),
    .input__valid(filter_flow_restrictor_input__valid),
    .output__payload(filter_flow_restrictor_output__payload),
    .output__ready(filter_flow_restrictor_output__ready),
    .output__valid(filter_flow_restrictor_output__valid),
    .release__payload(filter_flow_restrictor_release__payload),
    .release__valid(filter_flow_restrictor_release__valid),
    .rst(rst)
  );
  filter_store filter_store (
    .clk(clk),
    .data_input__payload(filter_store_data_input__payload),
    .data_input__ready(filter_store_data_input__ready),
    .data_input__valid(filter_store_data_input__valid),
    .data_output__payload(filter_store_data_output__payload),
    .data_output__ready(filter_store_data_output__ready),
    .data_output__valid(filter_store_data_output__valid),
    .num_words_input__payload(filter_store_num_words_input__payload),
    .num_words_input__ready(filter_store_num_words_input__ready),
    .num_words_input__valid(filter_store_num_words_input__valid),
    .rst(rst)
  );
  get get (
    .clk(clk),
    .done(get_done),
    .funct7(get_funct7),
    .in0(get_in0),
    .in1(get_in1),
    .\output (get_output),
    .rst(rst),
    .sink_30__payload(get_sink_30__payload),
    .sink_30__ready(get_sink_30__ready),
    .sink_30__valid(get_sink_30__valid),
    .sink_44__payload(get_sink_44__payload),
    .sink_44__ready(get_sink_44__ready),
    .sink_44__valid(get_sink_44__valid),
    .sink_70__payload(get_sink_70__payload),
    .sink_70__ready(get_sink_70__ready),
    .sink_70__valid(get_sink_70__valid),
    .start(get_start)
  );
  input_flow_restrictor input_flow_restrictor (
    .clk(clk),
    .input__payload(input_flow_restrictor_input__payload),
    .input__ready(input_flow_restrictor_input__ready),
    .input__valid(input_flow_restrictor_input__valid),
    .output__payload(input_flow_restrictor_output__payload),
    .output__ready(input_flow_restrictor_output__ready),
    .output__valid(input_flow_restrictor_output__valid),
    .release__payload(input_flow_restrictor_release__payload),
    .release__valid(input_flow_restrictor_release__valid),
    .rst(rst)
  );
  input_store input_store (
    .clk(clk),
    .data_input__payload(input_store_data_input__payload),
    .data_input__ready(input_store_data_input__ready),
    .data_input__valid(input_store_data_input__valid),
    .data_output__payload(input_store_data_output__payload),
    .data_output__ready(input_store_data_output__ready),
    .data_output__valid(input_store_data_output__valid),
    .num_words_input__payload(input_store_num_words_input__payload),
    .num_words_input__ready(input_store_num_words_input__ready),
    .num_words_input__valid(input_store_num_words_input__valid),
    .rst(rst)
  );
  macc macc (
    .clk(clk),
    .enable(1'h1),
    .offset(macc_offset),
    .operands__payload__filters(macc_operands__payload__filters),
    .operands__payload__inputs(macc_operands__payload__inputs),
    .operands__ready(macc_operands__ready),
    .operands__valid(macc_operands__valid),
    .result__payload(macc_result__payload),
    .result__ready(macc_result__ready),
    .result__valid(macc_result__valid),
    .rst(rst)
  );
  op_store op_store (
    .clk(clk),
    .read_data__bias(op_store_read_data__bias),
    .read_data__multiplier(op_store_read_data__multiplier),
    .read_data__shift(op_store_read_data__shift),
    .read_enable(op_store_read_enable),
    .reset(op_store_reset),
    .rst(rst),
    .write_data__bias(op_store_write_data__bias),
    .write_data__multiplier(op_store_write_data__multiplier),
    .write_data__shift(op_store_write_data__shift),
    .write_enable(op_store_write_enable)
  );
  operands_buffer operands_buffer (
    .clk(clk),
    .output__payload__filters(operands_buffer_output__payload__filters),
    .output__payload__inputs(operands_buffer_output__payload__inputs),
    .output__ready(operands_buffer_output__ready),
    .output__valid(operands_buffer_output__valid),
    .payload(operands_buffer_payload),
    .\payload$2 (\operands_buffer_payload$25 ),
    .ready(operands_buffer_ready),
    .\ready$3 (\operands_buffer_ready$26 ),
    .rst(rst),
    .valid(operands_buffer_valid),
    .\valid$1 (\operands_buffer_valid$24 )
  );
  ping ping (
    .clk(clk),
    .done(ping_done),
    .in0(ping_in0),
    .in1(ping_in1),
    .\output (ping_output),
    .rst(rst),
    .start(ping_start)
  );
  pp pp (
    .activation_max(pp_activation_max),
    .activation_min(pp_activation_min),
    .clk(clk),
    .done(pp_done),
    .funct7(pp_funct7),
    .in0(pp_in0),
    .in1(pp_in1),
    .offset(pp_offset),
    .\output (pp_output),
    .read_data__bias(pp_read_data__bias),
    .read_data__multiplier(pp_read_data__multiplier),
    .read_data__shift(pp_read_data__shift),
    .read_enable(pp_read_enable),
    .result__payload(pp_result__payload),
    .result__ready(pp_result__ready),
    .result__valid(pp_result__valid),
    .rst(rst),
    .start(pp_start)
  );
  result_accumulator result_accumulator (
    .accumulated__payload(result_accumulator_accumulated__payload),
    .accumulated__ready(result_accumulator_accumulated__ready),
    .accumulated__valid(result_accumulator_accumulated__valid),
    .clk(clk),
    .num_results__payload(result_accumulator_num_results__payload),
    .num_results__valid(result_accumulator_num_results__valid),
    .results__payload(result_accumulator_results__payload),
    .results__ready(result_accumulator_results__ready),
    .results__valid(result_accumulator_results__valid),
    .rst(rst)
  );
  set set (
    .\$signal (\set_$signal ),
    .\$signal$16 (\set_$signal$16 ),
    .\$signal$17 (\set_$signal$17 ),
    .\$signal$18 (\set_$signal$18 ),
    .\$signal$19 (\set_$signal$19 ),
    .\$signal$20 (\set_$signal$20 ),
    .\$signal$21 (\set_$signal$21 ),
    .\$signal$22 (\set_$signal$22 ),
    .\$signal$23 (\set_$signal$23 ),
    .clk(clk),
    .done(set_done),
    .funct7(set_funct7),
    .in0(set_in0),
    .in1(set_in1),
    .payload(set_payload),
    .\payload$11 (\set_payload$11 ),
    .\payload$13 (\set_payload$13 ),
    .\payload$2 (\set_payload$2 ),
    .\payload$5 (\set_payload$5 ),
    .\payload$8 (\set_payload$8 ),
    .ready(set_ready),
    .\ready$12 (\set_ready$12 ),
    .\ready$15 (1'h1),
    .\ready$3 (\set_ready$3 ),
    .\ready$6 (\set_ready$6 ),
    .\ready$9 (\set_ready$9 ),
    .rst(rst),
    .start(set_start),
    .valid(set_valid),
    .\valid$1 (\set_valid$1 ),
    .\valid$10 (\set_valid$10 ),
    .\valid$14 (\set_valid$14 ),
    .\valid$4 (\set_valid$4 ),
    .\valid$7 (\set_valid$7 )
  );
  always @* begin
    if (\initial ) begin end
    rsp_valid = 1'h0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:251" *)
    casez (fsm_state)
      /* \nmigen.decoding  = "WAIT_CMD/0" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:252" */
      2'h0:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:258" *)
          casez (cmd_valid)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:258" */
            1'h1:
                (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:238" *)
                casez (current_function_done)
                  /* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:238" */
                  1'h1:
                      rsp_valid = 1'h1;
                endcase
          endcase
      /* \nmigen.decoding  = "WAIT_INSTRUCTION/2" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:263" */
      2'h2:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:238" *)
          casez (current_function_done)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:238" */
            1'h1:
                rsp_valid = 1'h1;
          endcase
      /* \nmigen.decoding  = "WAIT_TRANSFER/1" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:270" */
      2'h1:
          rsp_valid = 1'h1;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    rsp_payload_outputs_0 = 32'd0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:251" *)
    casez (fsm_state)
      /* \nmigen.decoding  = "WAIT_CMD/0" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:252" */
      2'h0:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:258" *)
          casez (cmd_valid)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:258" */
            1'h1:
                (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:238" *)
                casez (current_function_done)
                  /* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:238" */
                  1'h1:
                      (* full_case = 32'd1 *)
                      (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:241" *)
                      casez (current_function_id)
                        3'h0:
                            rsp_payload_outputs_0 = \$signal ;
                        3'h1:
                            rsp_payload_outputs_0 = \$signal$32 ;
                        3'h2:
                            rsp_payload_outputs_0 = \$signal$35 ;
                        3'h3:
                            rsp_payload_outputs_0 = \$signal$38 ;
                        3'h4:
                            rsp_payload_outputs_0 = \$signal$41 ;
                        3'h5:
                            rsp_payload_outputs_0 = \$signal$45 ;
                        3'h6:
                            rsp_payload_outputs_0 = \$signal$49 ;
                        3'h?:
                            rsp_payload_outputs_0 = \$signal$53 ;
                      endcase
                endcase
          endcase
      /* \nmigen.decoding  = "WAIT_INSTRUCTION/2" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:263" */
      2'h2:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:238" *)
          casez (current_function_done)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:238" */
            1'h1:
                (* full_case = 32'd1 *)
                (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:241" *)
                casez (current_function_id)
                  3'h0:
                      rsp_payload_outputs_0 = \$signal ;
                  3'h1:
                      rsp_payload_outputs_0 = \$signal$32 ;
                  3'h2:
                      rsp_payload_outputs_0 = \$signal$35 ;
                  3'h3:
                      rsp_payload_outputs_0 = \$signal$38 ;
                  3'h4:
                      rsp_payload_outputs_0 = \$signal$41 ;
                  3'h5:
                      rsp_payload_outputs_0 = \$signal$45 ;
                  3'h6:
                      rsp_payload_outputs_0 = \$signal$49 ;
                  3'h?:
                      rsp_payload_outputs_0 = \$signal$53 ;
                endcase
          endcase
      /* \nmigen.decoding  = "WAIT_TRANSFER/1" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:270" */
      2'h1:
          rsp_payload_outputs_0 = stored_output;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \fsm_state$next  = fsm_state;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:251" *)
    casez (fsm_state)
      /* \nmigen.decoding  = "WAIT_CMD/0" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:252" */
      2'h0:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:258" *)
          casez (cmd_valid)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:258" */
            1'h1:
                (* full_case = 32'd1 *)
                (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:238" *)
                casez (current_function_done)
                  /* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:238" */
                  1'h1:
                      (* full_case = 32'd1 *)
                      (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:242" *)
                      casez (rsp_ready)
                        /* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:242" */
                        1'h1:
                            \fsm_state$next  = 2'h0;
                        /* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:244" */
                        default:
                            \fsm_state$next  = 2'h1;
                      endcase
                  /* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:248" */
                  default:
                      \fsm_state$next  = 2'h2;
                endcase
          endcase
      /* \nmigen.decoding  = "WAIT_INSTRUCTION/2" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:263" */
      2'h2:
          (* full_case = 32'd1 *)
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:238" *)
          casez (current_function_done)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:238" */
            1'h1:
                (* full_case = 32'd1 *)
                (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:242" *)
                casez (rsp_ready)
                  /* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:242" */
                  1'h1:
                      \fsm_state$next  = 2'h0;
                  /* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:244" */
                  default:
                      \fsm_state$next  = 2'h1;
                endcase
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:248" */
            default:
                \fsm_state$next  = 2'h2;
          endcase
      /* \nmigen.decoding  = "WAIT_TRANSFER/1" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:270" */
      2'h1:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:275" *)
          casez (rsp_ready)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:275" */
            1'h1:
                \fsm_state$next  = 2'h0;
          endcase
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \fsm_state$next  = 2'h0;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \stored_output$next  = stored_output;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:251" *)
    casez (fsm_state)
      /* \nmigen.decoding  = "WAIT_CMD/0" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:252" */
      2'h0:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:258" *)
          casez (cmd_valid)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:258" */
            1'h1:
                (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:238" *)
                casez (current_function_done)
                  /* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:238" */
                  1'h1:
                      (* full_case = 32'd1 *)
                      (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:242" *)
                      casez (rsp_ready)
                        /* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:242" */
                        1'h1:
                            /* empty */;
                        /* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:244" */
                        default:
                            (* full_case = 32'd1 *)
                            (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:246" *)
                            casez (current_function_id)
                              3'h0:
                                  \stored_output$next  = \$signal ;
                              3'h1:
                                  \stored_output$next  = \$signal$32 ;
                              3'h2:
                                  \stored_output$next  = \$signal$35 ;
                              3'h3:
                                  \stored_output$next  = \$signal$38 ;
                              3'h4:
                                  \stored_output$next  = \$signal$41 ;
                              3'h5:
                                  \stored_output$next  = \$signal$45 ;
                              3'h6:
                                  \stored_output$next  = \$signal$49 ;
                              3'h?:
                                  \stored_output$next  = \$signal$53 ;
                            endcase
                      endcase
                endcase
          endcase
      /* \nmigen.decoding  = "WAIT_INSTRUCTION/2" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:263" */
      2'h2:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:238" *)
          casez (current_function_done)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:238" */
            1'h1:
                (* full_case = 32'd1 *)
                (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:242" *)
                casez (rsp_ready)
                  /* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:242" */
                  1'h1:
                      /* empty */;
                  /* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:244" */
                  default:
                      (* full_case = 32'd1 *)
                      (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:246" *)
                      casez (current_function_id)
                        3'h0:
                            \stored_output$next  = \$signal ;
                        3'h1:
                            \stored_output$next  = \$signal$32 ;
                        3'h2:
                            \stored_output$next  = \$signal$35 ;
                        3'h3:
                            \stored_output$next  = \$signal$38 ;
                        3'h4:
                            \stored_output$next  = \$signal$41 ;
                        3'h5:
                            \stored_output$next  = \$signal$45 ;
                        3'h6:
                            \stored_output$next  = \$signal$49 ;
                        3'h?:
                            \stored_output$next  = \$signal$53 ;
                      endcase
                endcase
          endcase
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \stored_output$next  = 32'd0;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \op_store_write_enable$next  = \set_$signal$19 ;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \op_store_write_enable$next  = 1'h0;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    current_function_id = 3'h0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:251" *)
    casez (fsm_state)
      /* \nmigen.decoding  = "WAIT_CMD/0" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:252" */
      2'h0:
          current_function_id = funct3;
      /* \nmigen.decoding  = "WAIT_INSTRUCTION/2" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:263" */
      2'h2:
          current_function_id = stored_function_id;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    current_function_done = 1'h0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:251" *)
    casez (fsm_state)
      /* \nmigen.decoding  = "WAIT_CMD/0" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:252" */
      2'h0:
          (* full_case = 32'd1 *)
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:256" *)
          casez (current_function_id)
            3'h0:
                current_function_done = \$signal$30 ;
            3'h1:
                current_function_done = \$signal$33 ;
            3'h2:
                current_function_done = \$signal$36 ;
            3'h3:
                current_function_done = \$signal$39 ;
            3'h4:
                current_function_done = \$signal$42 ;
            3'h5:
                current_function_done = \$signal$46 ;
            3'h6:
                current_function_done = \$signal$50 ;
            3'h?:
                current_function_done = \$signal$54 ;
          endcase
      /* \nmigen.decoding  = "WAIT_INSTRUCTION/2" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:263" */
      2'h2:
          (* full_case = 32'd1 *)
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:268" *)
          casez (current_function_id)
            3'h0:
                current_function_done = \$signal$30 ;
            3'h1:
                current_function_done = \$signal$33 ;
            3'h2:
                current_function_done = \$signal$36 ;
            3'h3:
                current_function_done = \$signal$39 ;
            3'h4:
                current_function_done = \$signal$42 ;
            3'h5:
                current_function_done = \$signal$46 ;
            3'h6:
                current_function_done = \$signal$50 ;
            3'h?:
                current_function_done = \$signal$54 ;
          endcase
    endcase
  end
  always @* begin
    if (\initial ) begin end
    cmd_ready = 1'h0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:251" *)
    casez (fsm_state)
      /* \nmigen.decoding  = "WAIT_CMD/0" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:252" */
      2'h0:
          cmd_ready = 1'h1;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \stored_function_id$next  = stored_function_id;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:251" *)
    casez (fsm_state)
      /* \nmigen.decoding  = "WAIT_CMD/0" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:252" */
      2'h0:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:258" *)
          casez (cmd_valid)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:258" */
            1'h1:
                \stored_function_id$next  = cmd_payload_function_id[2:0];
          endcase
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \stored_function_id$next  = 3'h0;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \$signal$31  = 1'h0;
    \$signal$34  = 1'h0;
    \$signal$37  = 1'h0;
    \$signal$40  = 1'h0;
    \$signal$44  = 1'h0;
    \$signal$48  = 1'h0;
    \$signal$52  = 1'h0;
    \$signal$55  = 1'h0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:251" *)
    casez (fsm_state)
      /* \nmigen.decoding  = "WAIT_CMD/0" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:252" */
      2'h0:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:258" *)
          casez (cmd_valid)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:258" */
            1'h1:
                (* full_case = 32'd1 *)
                (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:261" *)
                casez (current_function_id)
                  3'h0:
                      \$signal$31  = 1'h1;
                  3'h1:
                      \$signal$34  = 1'h1;
                  3'h2:
                      \$signal$37  = 1'h1;
                  3'h3:
                      \$signal$40  = 1'h1;
                  3'h4:
                      \$signal$44  = 1'h1;
                  3'h5:
                      \$signal$48  = 1'h1;
                  3'h6:
                      \$signal$52  = 1'h1;
                  3'h?:
                      \$signal$55  = 1'h1;
                endcase
          endcase
    endcase
  end
  assign \$27  = \$28 ;
  assign \output  = 32'd0;
  assign rst = reset;
  assign \funct7$60  = funct7;
  assign ping_in1 = cmd_payload_inputs_1;
  assign ping_in0 = cmd_payload_inputs_0;
  assign \funct7$59  = funct7;
  assign fallback6_in1 = cmd_payload_inputs_1;
  assign fallback6_in0 = cmd_payload_inputs_0;
  assign \funct7$58  = funct7;
  assign fallback5_in1 = cmd_payload_inputs_1;
  assign fallback5_in0 = cmd_payload_inputs_0;
  assign \funct7$57  = funct7;
  assign fallback4_in1 = cmd_payload_inputs_1;
  assign fallback4_in0 = cmd_payload_inputs_0;
  assign \funct7$56  = funct7;
  assign fallback3_in1 = cmd_payload_inputs_1;
  assign fallback3_in0 = cmd_payload_inputs_0;
  assign pp_funct7 = funct7;
  assign pp_in1 = cmd_payload_inputs_1;
  assign pp_in0 = cmd_payload_inputs_0;
  assign get_funct7 = funct7;
  assign get_in1 = cmd_payload_inputs_1;
  assign get_in0 = cmd_payload_inputs_0;
  assign set_funct7 = funct7;
  assign set_in1 = cmd_payload_inputs_1;
  assign set_in0 = cmd_payload_inputs_0;
  assign ping_start = \$signal$55 ;
  assign \$signal$54  = ping_done;
  assign \$signal$53  = ping_output;
  assign \start$51  = \$signal$52 ;
  assign \$signal$50  = fallback6_done;
  assign \$signal$49  = fallback6_output;
  assign \start$47  = \$signal$48 ;
  assign \$signal$46  = fallback5_done;
  assign \$signal$45  = fallback5_output;
  assign \start$43  = \$signal$44 ;
  assign \$signal$42  = fallback4_done;
  assign \$signal$41  = fallback4_output;
  assign start = \$signal$40 ;
  assign \$signal$39  = fallback3_done;
  assign \$signal$38  = fallback3_output;
  assign pp_start = \$signal$37 ;
  assign \$signal$36  = pp_done;
  assign \$signal$35  = pp_output;
  assign get_start = \$signal$34 ;
  assign \$signal$33  = get_done;
  assign \$signal$32  = get_output;
  assign set_start = \$signal$31 ;
  assign \$signal$30  = set_done;
  assign \$signal  = 32'd0;
  assign pp_result__ready = get_sink_44__ready;
  assign get_sink_44__payload = pp_result__payload;
  assign get_sink_44__valid = pp_result__valid;
  assign op_store_read_enable = pp_read_enable;
  assign { pp_read_data__shift, pp_read_data__multiplier, pp_read_data__bias } = { op_store_read_data__shift, op_store_read_data__multiplier, op_store_read_data__bias };
  assign pp_activation_max = \set_$signal$23 [7:0];
  assign pp_activation_min = \set_$signal$22 [7:0];
  assign pp_offset = \set_$signal$21 [8:0];
  assign op_store_reset = \set_$signal$20 ;
  assign op_store_write_data__shift = \$28 [3:0];
  assign op_store_write_data__multiplier = \set_$signal$17 ;
  assign op_store_write_data__bias = \set_$signal$16 [15:0];
  assign result_accumulator_accumulated__ready = get_sink_30__ready;
  assign get_sink_30__payload = result_accumulator_accumulated__payload;
  assign get_sink_30__valid = result_accumulator_accumulated__valid;
  assign result_accumulator_num_results__valid = \set_valid$14 ;
  assign result_accumulator_num_results__payload = \set_payload$13 ;
  assign macc_result__ready = result_accumulator_results__ready;
  assign result_accumulator_results__payload = macc_result__payload;
  assign result_accumulator_results__valid = macc_result__valid;
  assign operands_buffer_output__ready = macc_operands__ready;
  assign { macc_operands__payload__filters, macc_operands__payload__inputs } = { operands_buffer_output__payload__filters, operands_buffer_output__payload__inputs };
  assign macc_operands__valid = operands_buffer_output__valid;
  assign filter_flow_restrictor_output__ready = \operands_buffer_ready$26 ;
  assign \operands_buffer_payload$25  = filter_flow_restrictor_output__payload;
  assign \operands_buffer_valid$24  = filter_flow_restrictor_output__valid;
  assign input_flow_restrictor_output__ready = operands_buffer_ready;
  assign operands_buffer_payload = input_flow_restrictor_output__payload;
  assign operands_buffer_valid = input_flow_restrictor_output__valid;
  assign filter_flow_restrictor_release__valid = \set_valid$14 ;
  assign filter_flow_restrictor_release__payload = \set_payload$13 ;
  assign filter_store_data_output__ready = filter_flow_restrictor_input__ready;
  assign filter_flow_restrictor_input__payload = filter_store_data_output__payload;
  assign filter_flow_restrictor_input__valid = filter_store_data_output__valid;
  assign \set_ready$15  = 1'h1;
  assign input_flow_restrictor_release__valid = \set_valid$14 ;
  assign input_flow_restrictor_release__payload = \set_payload$13 ;
  assign input_store_data_output__ready = input_flow_restrictor_input__ready;
  assign input_flow_restrictor_input__payload = input_store_data_output__payload;
  assign input_flow_restrictor_input__valid = input_store_data_output__valid;
  assign macc_offset = \set_$signal [8:0];
  assign macc_enable = 1'h1;
  assign \set_ready$12  = filter_store_data_input__ready;
  assign filter_store_data_input__payload = \set_payload$11 ;
  assign filter_store_data_input__valid = \set_valid$10 ;
  assign \set_ready$9  = filter_store_num_words_input__ready;
  assign filter_store_num_words_input__payload = \set_payload$8 ;
  assign filter_store_num_words_input__valid = \set_valid$7 ;
  assign \set_ready$6  = input_store_data_input__ready;
  assign input_store_data_input__payload = \set_payload$5 ;
  assign input_store_data_input__valid = \set_valid$4 ;
  assign \set_ready$3  = input_store_num_words_input__ready;
  assign input_store_num_words_input__payload = \set_payload$2 ;
  assign input_store_num_words_input__valid = \set_valid$1 ;
  assign add_one_output__ready = get_sink_70__ready;
  assign get_sink_70__payload = add_one_output__payload;
  assign get_sink_70__valid = add_one_output__valid;
  assign set_ready = add_one_input__ready;
  assign add_one_input__payload = set_payload;
  assign add_one_input__valid = set_valid;
  assign funct7 = cmd_payload_function_id[9:3];
  assign funct3 = cmd_payload_function_id[2:0];
endmodule