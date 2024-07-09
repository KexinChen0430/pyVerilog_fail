module op_store(write_data__multiplier, write_data__shift, write_enable, reset, read_data__bias, read_data__multiplier, read_data__shift, read_enable, rst, clk, write_data__bias);
  reg \initial  = 0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:199" *)
  wire [6:0] \$11 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:199" *)
  wire [6:0] \$12 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:189" *)
  wire [6:0] \$2 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:189" *)
  wire [6:0] \$3 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:191" *)
  wire \$5 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:196" *)
  wire [6:0] \$7 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:196" *)
  wire \$9 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/ir.py:524" *)
  input clk;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:179" *)
  wire [5:0] memory_r_addr;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:179" *)
  wire [51:0] memory_r_data;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:179" *)
  wire memory_r_en;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:178" *)
  wire [5:0] memory_w_addr;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:178" *)
  wire [51:0] memory_w_data;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:178" *)
  wire memory_w_en;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:172" *)
  output [15:0] read_data__bias;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:172" *)
  output [31:0] read_data__multiplier;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:172" *)
  output [3:0] read_data__shift;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:171" *)
  input read_enable;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:183" *)
  reg [5:0] read_index = 6'h00;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:183" *)
  reg [5:0] \read_index$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:168" *)
  input reset;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/ir.py:524" *)
  input rst;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:170" *)
  input [15:0] write_data__bias;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:170" *)
  input [31:0] write_data__multiplier;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:170" *)
  input [3:0] write_data__shift;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:169" *)
  input write_enable;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:182" *)
  reg [5:0] write_index = 6'h00;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:182" *)
  reg [5:0] \write_index$next ;
  reg [51:0] memory [63:0];
  initial begin
    memory[0] = 52'h0000000000000;
    memory[1] = 52'h0000000000000;
    memory[2] = 52'h0000000000000;
    memory[3] = 52'h0000000000000;
    memory[4] = 52'h0000000000000;
    memory[5] = 52'h0000000000000;
    memory[6] = 52'h0000000000000;
    memory[7] = 52'h0000000000000;
    memory[8] = 52'h0000000000000;
    memory[9] = 52'h0000000000000;
    memory[10] = 52'h0000000000000;
    memory[11] = 52'h0000000000000;
    memory[12] = 52'h0000000000000;
    memory[13] = 52'h0000000000000;
    memory[14] = 52'h0000000000000;
    memory[15] = 52'h0000000000000;
    memory[16] = 52'h0000000000000;
    memory[17] = 52'h0000000000000;
    memory[18] = 52'h0000000000000;
    memory[19] = 52'h0000000000000;
    memory[20] = 52'h0000000000000;
    memory[21] = 52'h0000000000000;
    memory[22] = 52'h0000000000000;
    memory[23] = 52'h0000000000000;
    memory[24] = 52'h0000000000000;
    memory[25] = 52'h0000000000000;
    memory[26] = 52'h0000000000000;
    memory[27] = 52'h0000000000000;
    memory[28] = 52'h0000000000000;
    memory[29] = 52'h0000000000000;
    memory[30] = 52'h0000000000000;
    memory[31] = 52'h0000000000000;
    memory[32] = 52'h0000000000000;
    memory[33] = 52'h0000000000000;
    memory[34] = 52'h0000000000000;
    memory[35] = 52'h0000000000000;
    memory[36] = 52'h0000000000000;
    memory[37] = 52'h0000000000000;
    memory[38] = 52'h0000000000000;
    memory[39] = 52'h0000000000000;
    memory[40] = 52'h0000000000000;
    memory[41] = 52'h0000000000000;
    memory[42] = 52'h0000000000000;
    memory[43] = 52'h0000000000000;
    memory[44] = 52'h0000000000000;
    memory[45] = 52'h0000000000000;
    memory[46] = 52'h0000000000000;
    memory[47] = 52'h0000000000000;
    memory[48] = 52'h0000000000000;
    memory[49] = 52'h0000000000000;
    memory[50] = 52'h0000000000000;
    memory[51] = 52'h0000000000000;
    memory[52] = 52'h0000000000000;
    memory[53] = 52'h0000000000000;
    memory[54] = 52'h0000000000000;
    memory[55] = 52'h0000000000000;
    memory[56] = 52'h0000000000000;
    memory[57] = 52'h0000000000000;
    memory[58] = 52'h0000000000000;
    memory[59] = 52'h0000000000000;
    memory[60] = 52'h0000000000000;
    memory[61] = 52'h0000000000000;
    memory[62] = 52'h0000000000000;
    memory[63] = 52'h0000000000000;
  end
  always @(posedge clk) begin
    if (memory_w_en)
      memory[memory_w_addr] <= memory_w_data;
  end
  reg [51:0] _0_;
  always @(posedge clk) begin
    if (memory_r_en) begin
      _0_ <= memory[memory_r_addr];
    end
  end
  assign memory_r_data = _0_;
  assign \$9  = read_index == (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:196" *) \$7 ;
  assign \$12  = read_index + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:199" *) 1'h1;
  assign \$3  = write_index + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:189" *) 1'h1;
  assign \$5  = ~ (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:191" *) write_enable;
  assign \$7  = write_index - (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:196" *) 1'h1;
  always @(posedge clk)
    read_index <= \read_index$next ;
  always @(posedge clk)
    write_index <= \write_index$next ;
  always @* begin
    if (\initial ) begin end
    \write_index$next  = write_index;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:188" *)
    casez (write_enable)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:188" */
      1'h1:
          \write_index$next  = \$3 [5:0];
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:201" *)
    casez (reset)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:201" */
      1'h1:
          \write_index$next  = 6'h00;
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \write_index$next  = 6'h00;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \read_index$next  = read_index;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:195" *)
    casez (read_enable)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:195" */
      1'h1:
          (* full_case = 32'd1 *)
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:196" *)
          casez (\$9 )
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:196" */
            1'h1:
                \read_index$next  = 6'h00;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:198" */
            default:
                \read_index$next  = \$12 [5:0];
          endcase
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:201" *)
    casez (reset)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:201" */
      1'h1:
          \read_index$next  = 6'h00;
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \read_index$next  = 6'h00;
    endcase
  end
  assign \$2  = \$3 ;
  assign \$11  = \$12 ;
  assign { read_data__shift, read_data__multiplier, read_data__bias } = memory_r_data;
  assign memory_r_addr = read_index;
  assign memory_r_en = \$5 ;
  assign memory_w_data = { write_data__shift, write_data__multiplier, write_data__bias };
  assign memory_w_addr = write_index;
  assign memory_w_en = write_enable;
endmodule