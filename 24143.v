module input_store(num_words_input__payload, num_words_input__ready, data_input__valid, data_input__payload, data_input__ready, data_output__valid, data_output__payload, data_output__ready, rst, clk, num_words_input__valid);
  reg \initial  = 0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *)
  wire \$1 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:69" *)
  wire \$10 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:70" *)
  wire [9:0] \$12 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:70" *)
  wire [9:0] \$13 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:85" *)
  wire \$15 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:85" *)
  wire \$17 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:85" *)
  wire \$19 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:86" *)
  wire [8:0] \$21 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:86" *)
  wire [8:0] \$22 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:86" *)
  wire [8:0] \$24 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:86" *)
  wire [9:0] \$25 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:86" *)
  wire \$27 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *)
  wire \$3 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:80" *)
  wire \$30 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *)
  wire \$32 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:80" *)
  wire \$34 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *)
  wire \$36 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *)
  wire \$38 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:69" *)
  wire [9:0] \$40 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:69" *)
  wire \$42 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:80" *)
  wire \$44 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *)
  wire \$46 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:80" *)
  wire \$48 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:68" *)
  wire [8:0] \$5 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:80" *)
  wire \$50 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *)
  wire \$52 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:80" *)
  wire \$54 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:85" *)
  wire \$56 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:85" *)
  wire \$58 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:68" *)
  wire [8:0] \$6 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:85" *)
  wire \$60 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:69" *)
  wire [9:0] \$8 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/ir.py:524" *)
  input clk;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:52" *)
  input [31:0] data_input__payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:52" *)
  output data_input__ready;
  reg data_input__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:52" *)
  input data_input__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:54" *)
  output [127:0] data_output__payload;
  reg [127:0] data_output__payload = 128'h00000000000000000000000000000000;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:54" *)
  reg [127:0] \data_output__payload$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:54" *)
  input data_output__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:54" *)
  output data_output__valid;
  reg data_output__valid = 1'h0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:54" *)
  reg \data_output__valid$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:107" *)
  reg [1:0] fsm_state = 2'h0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:107" *)
  reg [1:0] \fsm_state$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:101" *)
  reg [7:0] index = 8'h00;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:101" *)
  reg [7:0] \index$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/mem.py:54" *)
  reg [5:0] memory_read_addr;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/mem.py:55" *)
  wire [127:0] memory_read_data;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/mem.py:51" *)
  reg [7:0] memory_write_addr;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/mem.py:52" *)
  reg [31:0] memory_write_data;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/mem.py:53" *)
  reg memory_write_enable;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:100" *)
  reg [8:0] num_words = 9'h000;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:100" *)
  reg [8:0] \num_words$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:53" *)
  input [31:0] num_words_input__payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:53" *)
  output num_words_input__ready;
  reg num_words_input__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:53" *)
  input num_words_input__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:77" *)
  reg read_port_valid = 1'h0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:77" *)
  reg \read_port_valid$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:78" *)
  reg read_started = 1'h0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:78" *)
  reg \read_started$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:102" *)
  wire reset;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/ir.py:524" *)
  input rst;
  assign \$10  = index == (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:69" *) \$8 ;
  assign \$13  = num_words - (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:70" *) 3'h4;
  assign \$15  = ~ (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:85" *) read_port_valid;
  assign \$17  = ~ (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:85" *) read_started;
  assign \$1  = num_words_input__valid & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *) num_words_input__ready;
  assign \$19  = \$15  & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:85" *) \$17 ;
  assign \$22  = index + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:86" *) 3'h4;
  assign \$25  = num_words - (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:86" *) 3'h4;
  assign \$27  = index == (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:86" *) \$25 ;
  assign \$24  = \$27  ? (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:86" *) 9'h000 : \$22 ;
  assign \$30  = ~ (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:80" *) data_output__valid;
  assign \$32  = data_output__valid & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *) data_output__ready;
  assign \$34  = \$30  | (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:80" *) \$32 ;
  assign \$36  = num_words_input__valid & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *) num_words_input__ready;
  assign \$38  = data_input__valid & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *) data_input__ready;
  assign \$3  = data_input__valid & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *) data_input__ready;
  assign \$40  = num_words - (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:69" *) 1'h1;
  assign \$42  = index == (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:69" *) \$40 ;
  assign \$44  = ~ (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:80" *) data_output__valid;
  assign \$46  = data_output__valid & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *) data_output__ready;
  assign \$48  = \$44  | (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:80" *) \$46 ;
  assign \$50  = ~ (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:80" *) data_output__valid;
  assign \$52  = data_output__valid & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *) data_output__ready;
  assign \$54  = \$50  | (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:80" *) \$52 ;
  assign \$56  = ~ (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:85" *) read_port_valid;
  assign \$58  = ~ (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:85" *) read_started;
  assign \$60  = \$56  & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:85" *) \$58 ;
  assign \$6  = index + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:68" *) 1'h1;
  assign \$8  = num_words - (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:69" *) 1'h1;
  always @(posedge clk)
    read_started <= \read_started$next ;
  always @(posedge clk)
    read_port_valid <= \read_port_valid$next ;
  always @(posedge clk)
    data_output__payload <= \data_output__payload$next ;
  always @(posedge clk)
    fsm_state <= \fsm_state$next ;
  always @(posedge clk)
    data_output__valid <= \data_output__valid$next ;
  always @(posedge clk)
    index <= \index$next ;
  always @(posedge clk)
    num_words <= \num_words$next ;
  memory memory (
    .clk(clk),
    .read_addr(memory_read_addr),
    .read_data(memory_read_data),
    .write_addr(memory_write_addr),
    .write_data(memory_write_data),
    .write_enable(memory_write_enable)
  );
  always @* begin
    if (\initial ) begin end
    \num_words$next  = num_words;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:107" *)
    casez (fsm_state)
      /* \nmigen.decoding  = "RESET/0" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:108" */
      2'h0:
          \num_words$next  = 9'h000;
      /* \nmigen.decoding  = "NUM_WORDS/1" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:113" */
      2'h1:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:115" *)
          casez (\$1 )
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:115" */
            1'h1:
                \num_words$next  = num_words_input__payload[8:0];
          endcase
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \num_words$next  = 9'h000;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    memory_read_addr = 6'h00;
    (* full_case = 32'd1 *)
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:107" *)
    casez (fsm_state)
      /* \nmigen.decoding  = "RESET/0" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:108" */
      2'h0:
          /* empty */;
      /* \nmigen.decoding  = "NUM_WORDS/1" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:113" */
      2'h1:
          /* empty */;
      /* \nmigen.decoding  = "WRITING/2" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:118" */
      2'h2:
          /* empty */;
      /* \nmigen.decoding  = "READING/3" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:122" */
      2'h3:
          memory_read_addr = index[7:2];
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \data_output__payload$next  = data_output__payload;
    (* full_case = 32'd1 *)
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:107" *)
    casez (fsm_state)
      /* \nmigen.decoding  = "RESET/0" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:108" */
      2'h0:
          /* empty */;
      /* \nmigen.decoding  = "NUM_WORDS/1" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:113" */
      2'h1:
          /* empty */;
      /* \nmigen.decoding  = "WRITING/2" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:118" */
      2'h2:
          /* empty */;
      /* \nmigen.decoding  = "READING/3" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:122" */
      2'h3:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:80" *)
          casez (\$48 )
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:80" */
            1'h1:
                \data_output__payload$next  = memory_read_data;
          endcase
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \data_output__payload$next  = 128'h00000000000000000000000000000000;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \read_port_valid$next  = read_port_valid;
    (* full_case = 32'd1 *)
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:107" *)
    casez (fsm_state)
      /* \nmigen.decoding  = "RESET/0" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:108" */
      2'h0:
          /* empty */;
      /* \nmigen.decoding  = "NUM_WORDS/1" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:113" */
      2'h1:
          /* empty */;
      /* \nmigen.decoding  = "WRITING/2" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:118" */
      2'h2:
          /* empty */;
      /* \nmigen.decoding  = "READING/3" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:122" */
      2'h3:
        begin
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:80" *)
          casez (\$54 )
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:80" */
            1'h1:
                \read_port_valid$next  = 1'h0;
          endcase
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:91" *)
          casez (read_started)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:91" */
            1'h1:
                \read_port_valid$next  = 1'h1;
          endcase
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:95" *)
          casez (reset)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:95" */
            1'h1:
                \read_port_valid$next  = 1'h0;
          endcase
        end
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \read_port_valid$next  = 1'h0;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \read_started$next  = read_started;
    (* full_case = 32'd1 *)
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:107" *)
    casez (fsm_state)
      /* \nmigen.decoding  = "RESET/0" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:108" */
      2'h0:
          /* empty */;
      /* \nmigen.decoding  = "NUM_WORDS/1" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:113" */
      2'h1:
          /* empty */;
      /* \nmigen.decoding  = "WRITING/2" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:118" */
      2'h2:
          /* empty */;
      /* \nmigen.decoding  = "READING/3" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:122" */
      2'h3:
        begin
          (* full_case = 32'd1 *)
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:85" *)
          casez (\$60 )
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:85" */
            1'h1:
                \read_started$next  = 1'h1;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:88" */
            default:
                \read_started$next  = 1'h0;
          endcase
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:95" *)
          casez (reset)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:95" */
            1'h1:
                \read_started$next  = 1'h0;
          endcase
        end
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \read_started$next  = 1'h0;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \index$next  = index;
    (* full_case = 32'd1 *)
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:107" *)
    casez (fsm_state)
      /* \nmigen.decoding  = "RESET/0" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:108" */
      2'h0:
          \index$next  = 8'h00;
      /* \nmigen.decoding  = "NUM_WORDS/1" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:113" */
      2'h1:
          /* empty */;
      /* \nmigen.decoding  = "WRITING/2" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:118" */
      2'h2:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:67" *)
          casez (\$3 )
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:67" */
            1'h1:
              begin
                \index$next  = \$6 [7:0];
                (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:69" *)
                casez (\$10 )
                  /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:69" */
                  1'h1:
                      \index$next  = \$13 [7:0];
                endcase
              end
          endcase
      /* \nmigen.decoding  = "READING/3" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:122" */
      2'h3:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:85" *)
          casez (\$19 )
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:85" */
            1'h1:
                \index$next  = \$24 [7:0];
          endcase
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \index$next  = 8'h00;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \data_output__valid$next  = data_output__valid;
    (* full_case = 32'd1 *)
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:107" *)
    casez (fsm_state)
      /* \nmigen.decoding  = "RESET/0" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:108" */
      2'h0:
          \data_output__valid$next  = 1'h0;
      /* \nmigen.decoding  = "NUM_WORDS/1" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:113" */
      2'h1:
          /* empty */;
      /* \nmigen.decoding  = "WRITING/2" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:118" */
      2'h2:
          /* empty */;
      /* \nmigen.decoding  = "READING/3" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:122" */
      2'h3:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:80" *)
          casez (\$34 )
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:80" */
            1'h1:
                \data_output__valid$next  = read_port_valid;
          endcase
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \data_output__valid$next  = 1'h0;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \fsm_state$next  = fsm_state;
    (* full_case = 32'd1 *)
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:107" *)
    casez (fsm_state)
      /* \nmigen.decoding  = "RESET/0" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:108" */
      2'h0:
          \fsm_state$next  = 2'h1;
      /* \nmigen.decoding  = "NUM_WORDS/1" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:113" */
      2'h1:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:115" *)
          casez (\$36 )
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:115" */
            1'h1:
                \fsm_state$next  = 2'h2;
          endcase
      /* \nmigen.decoding  = "WRITING/2" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:118" */
      2'h2:
        begin
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:67" *)
          casez (\$38 )
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:67" */
            1'h1:
                (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:69" *)
                casez (\$42 )
                  /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:69" */
                  1'h1:
                      \fsm_state$next  = 2'h3;
                endcase
          endcase
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:120" *)
          casez (reset)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:120" */
            1'h1:
                \fsm_state$next  = 2'h0;
          endcase
        end
      /* \nmigen.decoding  = "READING/3" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:122" */
      2'h3:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:124" *)
          casez (reset)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:124" */
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
    num_words_input__ready = 1'h0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:107" *)
    casez (fsm_state)
      /* \nmigen.decoding  = "RESET/0" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:108" */
      2'h0:
          /* empty */;
      /* \nmigen.decoding  = "NUM_WORDS/1" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:113" */
      2'h1:
          num_words_input__ready = 1'h1;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    memory_write_addr = 8'h00;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:107" *)
    casez (fsm_state)
      /* \nmigen.decoding  = "RESET/0" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:108" */
      2'h0:
          /* empty */;
      /* \nmigen.decoding  = "NUM_WORDS/1" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:113" */
      2'h1:
          /* empty */;
      /* \nmigen.decoding  = "WRITING/2" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:118" */
      2'h2:
          memory_write_addr = index;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    memory_write_data = 32'd0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:107" *)
    casez (fsm_state)
      /* \nmigen.decoding  = "RESET/0" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:108" */
      2'h0:
          /* empty */;
      /* \nmigen.decoding  = "NUM_WORDS/1" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:113" */
      2'h1:
          /* empty */;
      /* \nmigen.decoding  = "WRITING/2" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:118" */
      2'h2:
          memory_write_data = data_input__payload;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    memory_write_enable = 1'h0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:107" *)
    casez (fsm_state)
      /* \nmigen.decoding  = "RESET/0" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:108" */
      2'h0:
          /* empty */;
      /* \nmigen.decoding  = "NUM_WORDS/1" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:113" */
      2'h1:
          /* empty */;
      /* \nmigen.decoding  = "WRITING/2" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:118" */
      2'h2:
          memory_write_enable = 1'h1;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    data_input__ready = 1'h0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:107" *)
    casez (fsm_state)
      /* \nmigen.decoding  = "RESET/0" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:108" */
      2'h0:
          /* empty */;
      /* \nmigen.decoding  = "NUM_WORDS/1" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:113" */
      2'h1:
          /* empty */;
      /* \nmigen.decoding  = "WRITING/2" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/input_store.py:118" */
      2'h2:
          data_input__ready = 1'h1;
    endcase
  end
  assign \$5  = \$6 ;
  assign \$12  = \$13 ;
  assign \$21  = \$24 ;
  assign reset = num_words_input__valid;
endmodule