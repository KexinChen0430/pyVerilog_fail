module filter_store(num_words_input__payload, num_words_input__ready, data_input__valid, data_input__payload, data_input__ready, data_output__valid, data_output__payload, data_output__ready, rst, clk, num_words_input__valid);
  reg \initial  = 0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *)
  wire \$1 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:77" *)
  wire \$10 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:78" *)
  wire [12:0] \$12 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:78" *)
  wire [12:0] \$13 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:93" *)
  wire \$15 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:93" *)
  wire \$17 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:93" *)
  wire \$19 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:94" *)
  wire [11:0] \$21 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:94" *)
  wire [11:0] \$22 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:94" *)
  wire [11:0] \$24 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:94" *)
  wire [12:0] \$25 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:94" *)
  wire \$27 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *)
  wire \$3 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:88" *)
  wire \$30 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *)
  wire \$32 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:88" *)
  wire \$34 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *)
  wire \$36 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *)
  wire \$38 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:77" *)
  wire [12:0] \$40 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:77" *)
  wire \$42 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:88" *)
  wire \$44 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *)
  wire \$46 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:88" *)
  wire \$48 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:76" *)
  wire [11:0] \$5 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:88" *)
  wire \$50 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *)
  wire \$52 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:88" *)
  wire \$54 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:93" *)
  wire \$56 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:93" *)
  wire \$58 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:76" *)
  wire [11:0] \$6 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:93" *)
  wire \$60 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:77" *)
  wire [12:0] \$8 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/ir.py:524" *)
  input clk;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:60" *)
  input [31:0] data_input__payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:60" *)
  output data_input__ready;
  reg data_input__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:60" *)
  input data_input__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:62" *)
  output [127:0] data_output__payload;
  reg [127:0] data_output__payload = 128'h00000000000000000000000000000000;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:62" *)
  reg [127:0] \data_output__payload$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:62" *)
  input data_output__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:62" *)
  output data_output__valid;
  reg data_output__valid = 1'h0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:62" *)
  reg \data_output__valid$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:115" *)
  reg [1:0] fsm_state = 2'h0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:115" *)
  reg [1:0] \fsm_state$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:109" *)
  reg [10:0] index = 11'h000;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:109" *)
  reg [10:0] \index$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/mem.py:54" *)
  reg [8:0] memory_read_addr;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/mem.py:55" *)
  wire [127:0] memory_read_data;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/mem.py:51" *)
  reg [10:0] memory_write_addr;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/mem.py:52" *)
  reg [31:0] memory_write_data;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/mem.py:53" *)
  reg memory_write_enable;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:108" *)
  reg [11:0] num_words = 12'h000;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:108" *)
  reg [11:0] \num_words$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:61" *)
  input [31:0] num_words_input__payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:61" *)
  output num_words_input__ready;
  reg num_words_input__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:61" *)
  input num_words_input__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:85" *)
  reg read_port_valid = 1'h0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:85" *)
  reg \read_port_valid$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:86" *)
  reg read_started = 1'h0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:86" *)
  reg \read_started$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:110" *)
  wire reset;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/ir.py:524" *)
  input rst;
  assign \$10  = index == (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:77" *) \$8 ;
  assign \$13  = num_words - (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:78" *) 3'h4;
  assign \$15  = ~ (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:93" *) read_port_valid;
  assign \$17  = ~ (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:93" *) read_started;
  assign \$1  = num_words_input__valid & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *) num_words_input__ready;
  assign \$19  = \$15  & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:93" *) \$17 ;
  assign \$22  = index + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:94" *) 3'h4;
  assign \$25  = num_words - (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:94" *) 3'h4;
  assign \$27  = index == (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:94" *) \$25 ;
  assign \$24  = \$27  ? (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:94" *) 12'h000 : \$22 ;
  assign \$30  = ~ (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:88" *) data_output__valid;
  assign \$32  = data_output__valid & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *) data_output__ready;
  assign \$34  = \$30  | (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:88" *) \$32 ;
  assign \$36  = num_words_input__valid & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *) num_words_input__ready;
  assign \$38  = data_input__valid & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *) data_input__ready;
  assign \$3  = data_input__valid & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *) data_input__ready;
  assign \$40  = num_words - (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:77" *) 1'h1;
  assign \$42  = index == (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:77" *) \$40 ;
  assign \$44  = ~ (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:88" *) data_output__valid;
  assign \$46  = data_output__valid & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *) data_output__ready;
  assign \$48  = \$44  | (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:88" *) \$46 ;
  assign \$50  = ~ (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:88" *) data_output__valid;
  assign \$52  = data_output__valid & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *) data_output__ready;
  assign \$54  = \$50  | (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:88" *) \$52 ;
  assign \$56  = ~ (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:93" *) read_port_valid;
  assign \$58  = ~ (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:93" *) read_started;
  assign \$60  = \$56  & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:93" *) \$58 ;
  assign \$6  = index + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:76" *) 1'h1;
  assign \$8  = num_words - (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:77" *) 1'h1;
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
  \memory$2  memory (
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
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:115" *)
    casez (fsm_state)
      /* \nmigen.decoding  = "RESET/0" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:116" */
      2'h0:
          \num_words$next  = 12'h000;
      /* \nmigen.decoding  = "NUM_WORDS/1" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:121" */
      2'h1:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:123" *)
          casez (\$1 )
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:123" */
            1'h1:
                \num_words$next  = num_words_input__payload[11:0];
          endcase
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \num_words$next  = 12'h000;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    memory_read_addr = 9'h000;
    (* full_case = 32'd1 *)
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:115" *)
    casez (fsm_state)
      /* \nmigen.decoding  = "RESET/0" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:116" */
      2'h0:
          /* empty */;
      /* \nmigen.decoding  = "NUM_WORDS/1" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:121" */
      2'h1:
          /* empty */;
      /* \nmigen.decoding  = "WRITING/2" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:126" */
      2'h2:
          /* empty */;
      /* \nmigen.decoding  = "READING/3" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:130" */
      2'h3:
          memory_read_addr = index[10:2];
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \data_output__payload$next  = data_output__payload;
    (* full_case = 32'd1 *)
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:115" *)
    casez (fsm_state)
      /* \nmigen.decoding  = "RESET/0" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:116" */
      2'h0:
          /* empty */;
      /* \nmigen.decoding  = "NUM_WORDS/1" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:121" */
      2'h1:
          /* empty */;
      /* \nmigen.decoding  = "WRITING/2" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:126" */
      2'h2:
          /* empty */;
      /* \nmigen.decoding  = "READING/3" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:130" */
      2'h3:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:88" *)
          casez (\$48 )
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:88" */
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
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:115" *)
    casez (fsm_state)
      /* \nmigen.decoding  = "RESET/0" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:116" */
      2'h0:
          /* empty */;
      /* \nmigen.decoding  = "NUM_WORDS/1" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:121" */
      2'h1:
          /* empty */;
      /* \nmigen.decoding  = "WRITING/2" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:126" */
      2'h2:
          /* empty */;
      /* \nmigen.decoding  = "READING/3" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:130" */
      2'h3:
        begin
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:88" *)
          casez (\$54 )
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:88" */
            1'h1:
                \read_port_valid$next  = 1'h0;
          endcase
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:99" *)
          casez (read_started)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:99" */
            1'h1:
                \read_port_valid$next  = 1'h1;
          endcase
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:103" *)
          casez (reset)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:103" */
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
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:115" *)
    casez (fsm_state)
      /* \nmigen.decoding  = "RESET/0" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:116" */
      2'h0:
          /* empty */;
      /* \nmigen.decoding  = "NUM_WORDS/1" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:121" */
      2'h1:
          /* empty */;
      /* \nmigen.decoding  = "WRITING/2" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:126" */
      2'h2:
          /* empty */;
      /* \nmigen.decoding  = "READING/3" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:130" */
      2'h3:
        begin
          (* full_case = 32'd1 *)
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:93" *)
          casez (\$60 )
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:93" */
            1'h1:
                \read_started$next  = 1'h1;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:96" */
            default:
                \read_started$next  = 1'h0;
          endcase
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:103" *)
          casez (reset)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:103" */
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
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:115" *)
    casez (fsm_state)
      /* \nmigen.decoding  = "RESET/0" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:116" */
      2'h0:
          \index$next  = 11'h000;
      /* \nmigen.decoding  = "NUM_WORDS/1" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:121" */
      2'h1:
          /* empty */;
      /* \nmigen.decoding  = "WRITING/2" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:126" */
      2'h2:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:75" *)
          casez (\$3 )
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:75" */
            1'h1:
              begin
                \index$next  = \$6 [10:0];
                (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:77" *)
                casez (\$10 )
                  /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:77" */
                  1'h1:
                      \index$next  = \$13 [10:0];
                endcase
              end
          endcase
      /* \nmigen.decoding  = "READING/3" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:130" */
      2'h3:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:93" *)
          casez (\$19 )
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:93" */
            1'h1:
                \index$next  = \$24 [10:0];
          endcase
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \index$next  = 11'h000;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \data_output__valid$next  = data_output__valid;
    (* full_case = 32'd1 *)
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:115" *)
    casez (fsm_state)
      /* \nmigen.decoding  = "RESET/0" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:116" */
      2'h0:
          \data_output__valid$next  = 1'h0;
      /* \nmigen.decoding  = "NUM_WORDS/1" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:121" */
      2'h1:
          /* empty */;
      /* \nmigen.decoding  = "WRITING/2" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:126" */
      2'h2:
          /* empty */;
      /* \nmigen.decoding  = "READING/3" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:130" */
      2'h3:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:88" *)
          casez (\$34 )
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:88" */
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
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:115" *)
    casez (fsm_state)
      /* \nmigen.decoding  = "RESET/0" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:116" */
      2'h0:
          \fsm_state$next  = 2'h1;
      /* \nmigen.decoding  = "NUM_WORDS/1" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:121" */
      2'h1:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:123" *)
          casez (\$36 )
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:123" */
            1'h1:
                \fsm_state$next  = 2'h2;
          endcase
      /* \nmigen.decoding  = "WRITING/2" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:126" */
      2'h2:
        begin
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:75" *)
          casez (\$38 )
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:75" */
            1'h1:
                (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:77" *)
                casez (\$42 )
                  /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:77" */
                  1'h1:
                      \fsm_state$next  = 2'h3;
                endcase
          endcase
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:128" *)
          casez (reset)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:128" */
            1'h1:
                \fsm_state$next  = 2'h0;
          endcase
        end
      /* \nmigen.decoding  = "READING/3" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:130" */
      2'h3:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:132" *)
          casez (reset)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:132" */
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
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:115" *)
    casez (fsm_state)
      /* \nmigen.decoding  = "RESET/0" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:116" */
      2'h0:
          /* empty */;
      /* \nmigen.decoding  = "NUM_WORDS/1" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:121" */
      2'h1:
          num_words_input__ready = 1'h1;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    memory_write_addr = 11'h000;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:115" *)
    casez (fsm_state)
      /* \nmigen.decoding  = "RESET/0" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:116" */
      2'h0:
          /* empty */;
      /* \nmigen.decoding  = "NUM_WORDS/1" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:121" */
      2'h1:
          /* empty */;
      /* \nmigen.decoding  = "WRITING/2" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:126" */
      2'h2:
          memory_write_addr = index;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    memory_write_data = 32'd0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:115" *)
    casez (fsm_state)
      /* \nmigen.decoding  = "RESET/0" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:116" */
      2'h0:
          /* empty */;
      /* \nmigen.decoding  = "NUM_WORDS/1" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:121" */
      2'h1:
          /* empty */;
      /* \nmigen.decoding  = "WRITING/2" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:126" */
      2'h2:
          memory_write_data = data_input__payload;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    memory_write_enable = 1'h0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:115" *)
    casez (fsm_state)
      /* \nmigen.decoding  = "RESET/0" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:116" */
      2'h0:
          /* empty */;
      /* \nmigen.decoding  = "NUM_WORDS/1" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:121" */
      2'h1:
          /* empty */;
      /* \nmigen.decoding  = "WRITING/2" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:126" */
      2'h2:
          memory_write_enable = 1'h1;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    data_input__ready = 1'h0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:115" *)
    casez (fsm_state)
      /* \nmigen.decoding  = "RESET/0" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:116" */
      2'h0:
          /* empty */;
      /* \nmigen.decoding  = "NUM_WORDS/1" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:121" */
      2'h1:
          /* empty */;
      /* \nmigen.decoding  = "WRITING/2" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/filter_store.py:126" */
      2'h2:
          data_input__ready = 1'h1;
    endcase
  end
  assign \$5  = \$6 ;
  assign \$12  = \$13 ;
  assign \$21  = \$24 ;
  assign reset = num_words_input__valid;
endmodule