module main_0(input_rs232_rx,input_gps_rx,input_gps_count,input_rs232_rx_stb,input_gps_rx_stb,input_gps_count_stb,output_freq_out_ack,output_am_out_ack,output_ctl_out_ack,output_rs232_tx_ack,output_gps_tx_ack,output_leds_ack,clk,rst,output_freq_out,output_am_out,output_ctl_out,output_rs232_tx,output_gps_tx,output_leds,output_freq_out_stb,output_am_out_stb,output_ctl_out_stb,output_rs232_tx_stb,output_gps_tx_stb,output_leds_stb,input_rs232_rx_ack,input_gps_rx_ack,input_gps_count_ack,exception);
  integer file_count;
  parameter  stop = 4'd0,
  instruction_fetch = 4'd1,
  operand_fetch = 4'd2,
  execute = 4'd3,
  load = 4'd4,
  wait_state = 4'd5,
  read = 4'd6,
  write = 4'd7,
  unsigned_divide = 4'd8,
  unsigned_modulo = 4'd9,
  multiply = 4'd10;
  input [31:0] input_rs232_rx;
  input [31:0] input_gps_rx;
  input [31:0] input_gps_count;
  input input_rs232_rx_stb;
  input input_gps_rx_stb;
  input input_gps_count_stb;
  input output_freq_out_ack;
  input output_am_out_ack;
  input output_ctl_out_ack;
  input output_rs232_tx_ack;
  input output_gps_tx_ack;
  input output_leds_ack;
  input clk;
  input rst;
  output [31:0] output_freq_out;
  output [31:0] output_am_out;
  output [31:0] output_ctl_out;
  output [31:0] output_rs232_tx;
  output [31:0] output_gps_tx;
  output [31:0] output_leds;
  output output_freq_out_stb;
  output output_am_out_stb;
  output output_ctl_out_stb;
  output output_rs232_tx_stb;
  output output_gps_tx_stb;
  output output_leds_stb;
  output input_rs232_rx_ack;
  output input_gps_rx_ack;
  output input_gps_count_ack;
  reg [31:0] timer;
  reg [63:0] timer_clock;
  reg [15:0] program_counter;
  reg [15:0] program_counter_1;
  reg [15:0] program_counter_2;
  reg [44:0] instruction;
  reg [4:0] opcode_2;
  reg [3:0] a;
  reg [3:0] b;
  reg [3:0] z;
  reg write_enable;
  reg [3:0] address_a_2;
  reg [3:0] address_b_2;
  reg [3:0] address_z_2;
  reg [3:0] address_z_3;
  reg [31:0] load_data;
  reg [31:0] write_output;
  reg [31:0] write_value;
  reg [31:0] read_input;
  reg [15:0] literal_2;
  reg [31:0] a_hi;
  reg [31:0] b_hi;
  reg [31:0] a_lo;
  reg [31:0] b_lo;
  reg [63:0] long_result;
  reg [31:0] result;
  reg [15:0] address;
  reg [31:0] data_out;
  reg [31:0] data_in;
  reg [31:0] carry;
  reg [31:0] s_output_freq_out_stb;
  reg [31:0] s_output_am_out_stb;
  reg [31:0] s_output_ctl_out_stb;
  reg [31:0] s_output_rs232_tx_stb;
  reg [31:0] s_output_gps_tx_stb;
  reg [31:0] s_output_leds_stb;
  reg [31:0] s_output_freq_out;
  reg [31:0] s_output_am_out;
  reg [31:0] s_output_ctl_out;
  reg [31:0] s_output_rs232_tx;
  reg [31:0] s_output_gps_tx;
  reg [31:0] s_output_leds;
  reg [31:0] s_input_rs232_rx_ack;
  reg [31:0] s_input_gps_rx_ack;
  reg [31:0] s_input_gps_count_ack;
  reg [10:0] state;
  output reg exception;
  reg [28:0] instructions [1485:0];
  reg [31:0] memory [4096:0];
  reg [31:0] registers [15:0];
  wire [31:0] operand_a;
  wire [31:0] operand_b;
  wire [31:0] register_a;
  wire [31:0] register_b;
  wire [15:0] literal;
  wire [4:0] opcode;
  wire [3:0] address_a;
  wire [3:0] address_b;
  wire [3:0] address_z;
  wire [15:0] load_address;
  wire [15:0] store_address;
  wire [31:0] store_data;
  wire  store_enable;
  reg [31:0] shifter;
  reg [32:0] difference;
  reg [31:0] divisor;
  reg [31:0] dividend;
  reg [31:0] quotient;
  reg [31:0] remainder;
  reg quotient_sign;
  reg dividend_sign;
  reg [31:0] product_a;
  reg [31:0] product_b;
  reg [31:0] product_c;
  reg [31:0] product_d;
  // INSTRUCTION INITIALIZATION
  // Initialise the contents of the instruction memory
  // Intruction Set
  // ==============
  // 0 {'literal': True, 'op': 'literal'}
  // 1 {'literal': True, 'op': 'addl'}
  // 2 {'literal': False, 'op': 'store'}
  // 3 {'literal': True, 'op': 'call'}
  // 4 {'literal': False, 'op': 'stop'}
  // 5 {'literal': False, 'op': 'load'}
  // 6 {'literal': False, 'op': 'equal'}
  // 7 {'literal': True, 'op': 'jmp_if_true'}
  // 8 {'literal': True, 'op': 'goto'}
  // 9 {'literal': False, 'op': 'read'}
  // 10 {'literal': False, 'op': 'write'}
  // 11 {'literal': False, 'op': 'timer_low'}
  // 12 {'literal': False, 'op': 'subtract'}
  // 13 {'literal': False, 'op': 'unsigned_greater'}
  // 14 {'literal': True, 'op': 'jmp_if_false'}
  // 15 {'literal': False, 'op': 'shift_left'}
  // 16 {'literal': False, 'op': 'or'}
  // 17 {'literal': True, 'op': 'literal_hi'}
  // 18 {'literal': False, 'op': 'add'}
  // 19 {'literal': False, 'op': 'return'}
  // 20 {'literal': False, 'op': 'wait_clocks'}
  // 21 {'literal': False, 'op': 'ready'}
  // 22 {'literal': False, 'op': 'unsigned_divide'}
  // 23 {'literal': False, 'op': 'and'}
  // 24 {'literal': False, 'op': 'a_lo'}
  // 25 {'literal': False, 'line': 26, 'file': '/usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h', 'op': 'report'}
  // 26 {'literal': False, 'op': 'unsigned_modulo'}
  // 27 {'literal': False, 'op': 'multiply'}
  // 28 {'literal': False, 'op': 'greater_equal'}
  // 29 {'literal': False, 'op': 'shift_right'}
  // 30 {'literal': False, 'op': 'greater'}
  // 31 {'literal': False, 'op': 'unsigned_shift_right'}
  // Intructions
  // ===========
  initial
  begin
    instructions[0] = {5'd0, 4'd3, 4'd0, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 144 {'literal': 0, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 144, 'op': 'literal'}
    instructions[1] = {5'd0, 4'd4, 4'd0, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 144 {'literal': 0, 'z': 4, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 144, 'op': 'literal'}
    instructions[2] = {5'd1, 4'd3, 4'd3, 16'd41};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 144 {'a': 3, 'literal': 41, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 144, 'op': 'addl'}
    instructions[3] = {5'd0, 4'd8, 4'd0, 16'd10};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 80 {'literal': 10, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 80, 'op': 'literal'}
    instructions[4] = {5'd0, 4'd2, 4'd0, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 80 {'literal': 0, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 80, 'op': 'literal'}
    instructions[5] = {5'd2, 4'd0, 4'd2, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 80 {'a': 2, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 80, 'op': 'store'}
    instructions[6] = {5'd0, 4'd8, 4'd0, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 80 {'literal': 0, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 80, 'op': 'literal'}
    instructions[7] = {5'd0, 4'd2, 4'd0, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 80 {'literal': 1, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 80, 'op': 'literal'}
    instructions[8] = {5'd2, 4'd0, 4'd2, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 80 {'a': 2, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 80, 'op': 'store'}
    instructions[9] = {5'd0, 4'd8, 4'd0, 16'd4};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 5 {'literal': 4, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 5, 'op': 'literal'}
    instructions[10] = {5'd0, 4'd2, 4'd0, 16'd2};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 5 {'literal': 2, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 5, 'op': 'literal'}
    instructions[11] = {5'd2, 4'd0, 4'd2, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 5 {'a': 2, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 5, 'op': 'store'}
    instructions[12] = {5'd0, 4'd8, 4'd0, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 1 {'literal': 0, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 1, 'op': 'literal'}
    instructions[13] = {5'd0, 4'd2, 4'd0, 16'd4};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 1 {'literal': 4, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 1, 'op': 'literal'}
    instructions[14] = {5'd2, 4'd0, 4'd2, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 1 {'a': 2, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 1, 'op': 'store'}
    instructions[15] = {5'd0, 4'd8, 4'd0, 16'd62};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 81 {'literal': 62, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 81, 'op': 'literal'}
    instructions[16] = {5'd0, 4'd2, 4'd0, 16'd5};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 81 {'literal': 5, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 81, 'op': 'literal'}
    instructions[17] = {5'd2, 4'd0, 4'd2, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 81 {'a': 2, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 81, 'op': 'store'}
    instructions[18] = {5'd0, 4'd8, 4'd0, 16'd10};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 81 {'literal': 10, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 81, 'op': 'literal'}
    instructions[19] = {5'd0, 4'd2, 4'd0, 16'd6};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 81 {'literal': 6, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 81, 'op': 'literal'}
    instructions[20] = {5'd2, 4'd0, 4'd2, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 81 {'a': 2, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 81, 'op': 'store'}
    instructions[21] = {5'd0, 4'd8, 4'd0, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 81 {'literal': 0, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 81, 'op': 'literal'}
    instructions[22] = {5'd0, 4'd2, 4'd0, 16'd7};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 81 {'literal': 7, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 81, 'op': 'literal'}
    instructions[23] = {5'd2, 4'd0, 4'd2, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 81 {'a': 2, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 81, 'op': 'store'}
    instructions[24] = {5'd0, 4'd8, 4'd0, 16'd2};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 3 {'literal': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 3, 'op': 'literal'}
    instructions[25] = {5'd0, 4'd2, 4'd0, 16'd9};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 3 {'literal': 9, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 3, 'op': 'literal'}
    instructions[26] = {5'd2, 4'd0, 4'd2, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 3 {'a': 2, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 3, 'op': 'store'}
    instructions[27] = {5'd0, 4'd8, 4'd0, 16'd5};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 6 {'literal': 5, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 6, 'op': 'literal'}
    instructions[28] = {5'd0, 4'd2, 4'd0, 16'd10};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 6 {'literal': 10, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 6, 'op': 'literal'}
    instructions[29] = {5'd2, 4'd0, 4'd2, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 6 {'a': 2, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 6, 'op': 'store'}
    instructions[30] = {5'd0, 4'd8, 4'd0, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 5 {'literal': 0, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 5, 'op': 'literal'}
    instructions[31] = {5'd0, 4'd2, 4'd0, 16'd11};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 5 {'literal': 11, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 5, 'op': 'literal'}
    instructions[32] = {5'd2, 4'd0, 4'd2, 16'd8};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 5 {'a': 2, 'b': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 5, 'op': 'store'}
    instructions[33] = {5'd0, 4'd8, 4'd0, 16'd6};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 7 {'literal': 6, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 7, 'op': 'literal'}
    instructions[34] = {5'd0, 4'd2, 4'd0, 16'd13};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 7 {'literal': 13, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 7, 'op': 'literal'}
    instructions[35] = {5'd2, 4'd0, 4'd2, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 7 {'a': 2, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 7, 'op': 'store'}
    instructions[36] = {5'd0, 4'd8, 4'd0, 16'd10};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 88 {'literal': 10, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 88, 'op': 'literal'}
    instructions[37] = {5'd0, 4'd2, 4'd0, 16'd14};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 88 {'literal': 14, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 88, 'op': 'literal'}
    instructions[38] = {5'd2, 4'd0, 4'd2, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 88 {'a': 2, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 88, 'op': 'store'}
    instructions[39] = {5'd0, 4'd8, 4'd0, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 88 {'literal': 0, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 88, 'op': 'literal'}
    instructions[40] = {5'd0, 4'd2, 4'd0, 16'd15};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 88 {'literal': 15, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 88, 'op': 'literal'}
    instructions[41] = {5'd2, 4'd0, 4'd2, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 88 {'a': 2, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 88, 'op': 'store'}
    instructions[42] = {5'd0, 4'd8, 4'd0, 16'd62};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 115 {'literal': 62, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 115, 'op': 'literal'}
    instructions[43] = {5'd0, 4'd2, 4'd0, 16'd16};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 115 {'literal': 16, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 115, 'op': 'literal'}
    instructions[44] = {5'd2, 4'd0, 4'd2, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 115 {'a': 2, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 115, 'op': 'store'}
    instructions[45] = {5'd0, 4'd8, 4'd0, 16'd10};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 115 {'literal': 10, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 115, 'op': 'literal'}
    instructions[46] = {5'd0, 4'd2, 4'd0, 16'd17};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 115 {'literal': 17, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 115, 'op': 'literal'}
    instructions[47] = {5'd2, 4'd0, 4'd2, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 115 {'a': 2, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 115, 'op': 'store'}
    instructions[48] = {5'd0, 4'd8, 4'd0, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 115 {'literal': 0, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 115, 'op': 'literal'}
    instructions[49] = {5'd0, 4'd2, 4'd0, 16'd18};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 115 {'literal': 18, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 115, 'op': 'literal'}
    instructions[50] = {5'd2, 4'd0, 4'd2, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 115 {'a': 2, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 115, 'op': 'store'}
    instructions[51] = {5'd0, 4'd8, 4'd0, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 9 {'literal': 8, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 9, 'op': 'literal'}
    instructions[52] = {5'd0, 4'd2, 4'd0, 16'd19};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 9 {'literal': 19, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 9, 'op': 'literal'}
    instructions[53] = {5'd2, 4'd0, 4'd2, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 9 {'a': 2, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 9, 'op': 'store'}
    instructions[54] = {5'd0, 4'd8, 4'd0, 16'd10};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 114 {'literal': 10, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 114, 'op': 'literal'}
    instructions[55] = {5'd0, 4'd2, 4'd0, 16'd20};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 114 {'literal': 20, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 114, 'op': 'literal'}
    instructions[56] = {5'd2, 4'd0, 4'd2, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 114 {'a': 2, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 114, 'op': 'store'}
    instructions[57] = {5'd0, 4'd8, 4'd0, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 114 {'literal': 0, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 114, 'op': 'literal'}
    instructions[58] = {5'd0, 4'd2, 4'd0, 16'd21};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 114 {'literal': 21, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 114, 'op': 'literal'}
    instructions[59] = {5'd2, 4'd0, 4'd2, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 114 {'a': 2, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 114, 'op': 'store'}
    instructions[60] = {5'd0, 4'd8, 4'd0, 16'd10};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 97 {'literal': 10, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 97, 'op': 'literal'}
    instructions[61] = {5'd0, 4'd2, 4'd0, 16'd22};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 97 {'literal': 22, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 97, 'op': 'literal'}
    instructions[62] = {5'd2, 4'd0, 4'd2, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 97 {'a': 2, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 97, 'op': 'store'}
    instructions[63] = {5'd0, 4'd8, 4'd0, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 97 {'literal': 0, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 97, 'op': 'literal'}
    instructions[64] = {5'd0, 4'd2, 4'd0, 16'd23};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 97 {'literal': 23, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 97, 'op': 'literal'}
    instructions[65] = {5'd2, 4'd0, 4'd2, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 97 {'a': 2, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 97, 'op': 'store'}
    instructions[66] = {5'd0, 4'd8, 4'd0, 16'd62};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 73 {'literal': 62, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 73, 'op': 'literal'}
    instructions[67] = {5'd0, 4'd2, 4'd0, 16'd24};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 73 {'literal': 24, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 73, 'op': 'literal'}
    instructions[68] = {5'd2, 4'd0, 4'd2, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 73 {'a': 2, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 73, 'op': 'store'}
    instructions[69] = {5'd0, 4'd8, 4'd0, 16'd10};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 73 {'literal': 10, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 73, 'op': 'literal'}
    instructions[70] = {5'd0, 4'd2, 4'd0, 16'd25};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 73 {'literal': 25, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 73, 'op': 'literal'}
    instructions[71] = {5'd2, 4'd0, 4'd2, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 73 {'a': 2, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 73, 'op': 'store'}
    instructions[72] = {5'd0, 4'd8, 4'd0, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 73 {'literal': 0, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 73, 'op': 'literal'}
    instructions[73] = {5'd0, 4'd2, 4'd0, 16'd26};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 73 {'literal': 26, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 73, 'op': 'literal'}
    instructions[74] = {5'd2, 4'd0, 4'd2, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 73 {'a': 2, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 73, 'op': 'store'}
    instructions[75] = {5'd0, 4'd8, 4'd0, 16'd10};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 105 {'literal': 10, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 105, 'op': 'literal'}
    instructions[76] = {5'd0, 4'd2, 4'd0, 16'd27};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 105 {'literal': 27, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 105, 'op': 'literal'}
    instructions[77] = {5'd2, 4'd0, 4'd2, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 105 {'a': 2, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 105, 'op': 'store'}
    instructions[78] = {5'd0, 4'd8, 4'd0, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 105 {'literal': 0, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 105, 'op': 'literal'}
    instructions[79] = {5'd0, 4'd2, 4'd0, 16'd28};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 105 {'literal': 28, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 105, 'op': 'literal'}
    instructions[80] = {5'd2, 4'd0, 4'd2, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 105 {'a': 2, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 105, 'op': 'store'}
    instructions[81] = {5'd0, 4'd8, 4'd0, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 4 {'literal': 0, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 4, 'op': 'literal'}
    instructions[82] = {5'd0, 4'd2, 4'd0, 16'd29};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 4 {'literal': 29, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 4, 'op': 'literal'}
    instructions[83] = {5'd2, 4'd0, 4'd2, 16'd8};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 4 {'a': 2, 'b': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 4, 'op': 'store'}
    instructions[84] = {5'd0, 4'd8, 4'd0, 16'd62};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 98 {'literal': 62, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 98, 'op': 'literal'}
    instructions[85] = {5'd0, 4'd2, 4'd0, 16'd30};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 98 {'literal': 30, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 98, 'op': 'literal'}
    instructions[86] = {5'd2, 4'd0, 4'd2, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 98 {'a': 2, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 98, 'op': 'store'}
    instructions[87] = {5'd0, 4'd8, 4'd0, 16'd10};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 98 {'literal': 10, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 98, 'op': 'literal'}
    instructions[88] = {5'd0, 4'd2, 4'd0, 16'd31};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 98 {'literal': 31, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 98, 'op': 'literal'}
    instructions[89] = {5'd2, 4'd0, 4'd2, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 98 {'a': 2, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 98, 'op': 'store'}
    instructions[90] = {5'd0, 4'd8, 4'd0, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 98 {'literal': 0, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 98, 'op': 'literal'}
    instructions[91] = {5'd0, 4'd2, 4'd0, 16'd32};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 98 {'literal': 32, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 98, 'op': 'literal'}
    instructions[92] = {5'd2, 4'd0, 4'd2, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 98 {'a': 2, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 98, 'op': 'store'}
    instructions[93] = {5'd0, 4'd8, 4'd0, 16'd3};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 4 {'literal': 3, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 4, 'op': 'literal'}
    instructions[94] = {5'd0, 4'd2, 4'd0, 16'd33};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 4 {'literal': 33, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 4, 'op': 'literal'}
    instructions[95] = {5'd2, 4'd0, 4'd2, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 4 {'a': 2, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 4, 'op': 'store'}
    instructions[96] = {5'd0, 4'd8, 4'd0, 16'd62};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 106 {'literal': 62, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 106, 'op': 'literal'}
    instructions[97] = {5'd0, 4'd2, 4'd0, 16'd35};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 106 {'literal': 35, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 106, 'op': 'literal'}
    instructions[98] = {5'd2, 4'd0, 4'd2, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 106 {'a': 2, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 106, 'op': 'store'}
    instructions[99] = {5'd0, 4'd8, 4'd0, 16'd10};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 106 {'literal': 10, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 106, 'op': 'literal'}
    instructions[100] = {5'd0, 4'd2, 4'd0, 16'd36};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 106 {'literal': 36, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 106, 'op': 'literal'}
    instructions[101] = {5'd2, 4'd0, 4'd2, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 106 {'a': 2, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 106, 'op': 'store'}
    instructions[102] = {5'd0, 4'd8, 4'd0, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 106 {'literal': 0, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 106, 'op': 'literal'}
    instructions[103] = {5'd0, 4'd2, 4'd0, 16'd37};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 106 {'literal': 37, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 106, 'op': 'literal'}
    instructions[104] = {5'd2, 4'd0, 4'd2, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 106 {'a': 2, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 106, 'op': 'store'}
    instructions[105] = {5'd0, 4'd8, 4'd0, 16'd62};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 90 {'literal': 62, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 90, 'op': 'literal'}
    instructions[106] = {5'd0, 4'd2, 4'd0, 16'd38};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 90 {'literal': 38, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 90, 'op': 'literal'}
    instructions[107] = {5'd2, 4'd0, 4'd2, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 90 {'a': 2, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 90, 'op': 'store'}
    instructions[108] = {5'd0, 4'd8, 4'd0, 16'd10};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 90 {'literal': 10, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 90, 'op': 'literal'}
    instructions[109] = {5'd0, 4'd2, 4'd0, 16'd39};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 90 {'literal': 39, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 90, 'op': 'literal'}
    instructions[110] = {5'd2, 4'd0, 4'd2, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 90 {'a': 2, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 90, 'op': 'store'}
    instructions[111] = {5'd0, 4'd8, 4'd0, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 90 {'literal': 0, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 90, 'op': 'literal'}
    instructions[112] = {5'd0, 4'd2, 4'd0, 16'd40};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 90 {'literal': 40, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 90, 'op': 'literal'}
    instructions[113] = {5'd2, 4'd0, 4'd2, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 90 {'a': 2, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 90, 'op': 'store'}
    instructions[114] = {5'd1, 4'd7, 4'd4, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 144 {'a': 4, 'literal': 0, 'z': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 144, 'op': 'addl'}
    instructions[115] = {5'd1, 4'd4, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 144 {'a': 3, 'literal': 0, 'z': 4, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 144, 'op': 'addl'}
    instructions[116] = {5'd3, 4'd6, 4'd0, 16'd118};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 144 {'z': 6, 'label': 118, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 144, 'op': 'call'}
    instructions[117] = {5'd4, 4'd0, 4'd0, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 144 {'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 144, 'op': 'stop'}
    instructions[118] = {5'd1, 4'd3, 4'd3, 16'd38};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 50 {'a': 3, 'literal': 38, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 50, 'op': 'addl'}
    instructions[119] = {5'd0, 4'd8, 4'd0, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 52 {'literal': 0, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 52, 'op': 'literal'}
    instructions[120] = {5'd1, 4'd2, 4'd4, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 52 {'a': 4, 'literal': 0, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 52, 'op': 'addl'}
    instructions[121] = {5'd2, 4'd0, 4'd2, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 52 {'a': 2, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 52, 'op': 'store'}
    instructions[122] = {5'd0, 4'd8, 4'd0, 16'd8333};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 53 {'literal': 8333, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 53, 'op': 'literal'}
    instructions[123] = {5'd1, 4'd2, 4'd4, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 53 {'a': 4, 'literal': 1, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 53, 'op': 'addl'}
    instructions[124] = {5'd2, 4'd0, 4'd2, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 53 {'a': 2, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 53, 'op': 'store'}
    instructions[125] = {5'd0, 4'd8, 4'd0, 16'd105};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 54 {'literal': 105, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 54, 'op': 'literal'}
    instructions[126] = {5'd1, 4'd2, 4'd4, 16'd2};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 54 {'a': 4, 'literal': 2, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 54, 'op': 'addl'}
    instructions[127] = {5'd2, 4'd0, 4'd2, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 54 {'a': 2, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 54, 'op': 'store'}
    instructions[128] = {5'd0, 4'd8, 4'd0, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 55 {'literal': 0, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 55, 'op': 'literal'}
    instructions[129] = {5'd1, 4'd2, 4'd4, 16'd3};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 55 {'a': 4, 'literal': 3, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 55, 'op': 'addl'}
    instructions[130] = {5'd2, 4'd0, 4'd2, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 55 {'a': 2, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 55, 'op': 'store'}
    instructions[131] = {5'd0, 4'd8, 4'd0, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 56 {'literal': 0, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 56, 'op': 'literal'}
    instructions[132] = {5'd1, 4'd2, 4'd4, 16'd4};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 56 {'a': 4, 'literal': 4, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 56, 'op': 'addl'}
    instructions[133] = {5'd2, 4'd0, 4'd2, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 56 {'a': 2, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 56, 'op': 'store'}
    instructions[134] = {5'd0, 4'd8, 4'd0, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 57 {'literal': 0, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 57, 'op': 'literal'}
    instructions[135] = {5'd1, 4'd2, 4'd4, 16'd5};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 57 {'a': 4, 'literal': 5, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 57, 'op': 'addl'}
    instructions[136] = {5'd2, 4'd0, 4'd2, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 57 {'a': 2, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 57, 'op': 'store'}
    instructions[137] = {5'd0, 4'd8, 4'd0, 16'd13};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 61 {'literal': 13, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 61, 'op': 'literal'}
    instructions[138] = {5'd1, 4'd2, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 61 {'a': 8, 'literal': 0, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 61, 'op': 'addl'}
    instructions[139] = {5'd5, 4'd8, 4'd2, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 61 {'a': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 61, 'op': 'load'}
    instructions[140] = {5'd0, 4'd2, 4'd0, 16'd11};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 61 {'literal': 11, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 61, 'op': 'literal'}
    instructions[141] = {5'd2, 4'd0, 4'd2, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 61 {'a': 2, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 61, 'op': 'store'}
    instructions[142] = {5'd0, 4'd8, 4'd0, 16'd4};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 62 {'literal': 4, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 62, 'op': 'literal'}
    instructions[143] = {5'd1, 4'd2, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 62 {'a': 8, 'literal': 0, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 62, 'op': 'addl'}
    instructions[144] = {5'd5, 4'd8, 4'd2, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 62 {'a': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 62, 'op': 'load'}
    instructions[145] = {5'd0, 4'd2, 4'd0, 16'd29};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 62 {'literal': 29, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 62, 'op': 'literal'}
    instructions[146] = {5'd2, 4'd0, 4'd2, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 62 {'a': 2, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 62, 'op': 'store'}
    instructions[147] = {5'd2, 4'd0, 4'd3, 16'd6};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 63 {'a': 3, 'comment': 'push', 'b': 6, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 63, 'op': 'store'}
    instructions[148] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 63 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 63, 'op': 'addl'}
    instructions[149] = {5'd2, 4'd0, 4'd3, 16'd7};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 63 {'a': 3, 'comment': 'push', 'b': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 63, 'op': 'store'}
    instructions[150] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 63 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 63, 'op': 'addl'}
    instructions[151] = {5'd1, 4'd7, 4'd4, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 63 {'a': 4, 'literal': 0, 'z': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 63, 'op': 'addl'}
    instructions[152] = {5'd1, 4'd4, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 63 {'a': 3, 'literal': 0, 'z': 4, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 63, 'op': 'addl'}
    instructions[153] = {5'd3, 4'd6, 4'd0, 16'd797};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 63 {'z': 6, 'label': 797, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 63, 'op': 'call'}
    instructions[154] = {5'd1, 4'd3, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 63 {'a': 3, 'literal': 0, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 63, 'op': 'addl'}
    instructions[155] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 63 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 63, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[156] = {5'd5, 4'd7, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 63 {'a': 3, 'z': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 63, 'op': 'load'}
    instructions[157] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 63 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 63, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[158] = {5'd5, 4'd6, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 63 {'a': 3, 'z': 6, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 63, 'op': 'load'}
    instructions[159] = {5'd1, 4'd3, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 63 {'a': 3, 'literal': 0, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 63, 'op': 'addl'}
    instructions[160] = {5'd2, 4'd0, 4'd3, 16'd6};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 67 {'a': 3, 'comment': 'push', 'b': 6, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 67, 'op': 'store'}
    instructions[161] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 67 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 67, 'op': 'addl'}
    instructions[162] = {5'd2, 4'd0, 4'd3, 16'd7};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 67 {'a': 3, 'comment': 'push', 'b': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 67, 'op': 'store'}
    instructions[163] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 67 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 67, 'op': 'addl'}
    instructions[164] = {5'd1, 4'd7, 4'd4, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 67 {'a': 4, 'literal': 0, 'z': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 67, 'op': 'addl'}
    instructions[165] = {5'd1, 4'd4, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 67 {'a': 3, 'literal': 0, 'z': 4, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 67, 'op': 'addl'}
    instructions[166] = {5'd3, 4'd6, 4'd0, 16'd832};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 67 {'z': 6, 'label': 832, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 67, 'op': 'call'}
    instructions[167] = {5'd1, 4'd3, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 67 {'a': 3, 'literal': 0, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 67, 'op': 'addl'}
    instructions[168] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 67 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 67, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[169] = {5'd5, 4'd7, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 67 {'a': 3, 'z': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 67, 'op': 'load'}
    instructions[170] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 67 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 67, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[171] = {5'd5, 4'd6, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 67 {'a': 3, 'z': 6, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 67, 'op': 'load'}
    instructions[172] = {5'd0, 4'd2, 4'd0, 16'd12};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 67 {'literal': 12, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 67, 'op': 'literal'}
    instructions[173] = {5'd5, 4'd8, 4'd2, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 67 {'a': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 67, 'op': 'load'}
    instructions[174] = {5'd1, 4'd2, 4'd4, 16'd9};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 67 {'a': 4, 'literal': 9, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 67, 'op': 'addl'}
    instructions[175] = {5'd2, 4'd0, 4'd2, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 67 {'a': 2, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 67, 'op': 'store'}
    instructions[176] = {5'd1, 4'd8, 4'd4, 16'd9};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 69 {'a': 4, 'literal': 9, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 69, 'op': 'addl'}
    instructions[177] = {5'd1, 4'd2, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 69 {'a': 8, 'literal': 0, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 69, 'op': 'addl'}
    instructions[178] = {5'd5, 4'd8, 4'd2, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 69 {'a': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 69, 'op': 'load'}
    instructions[179] = {5'd0, 4'd0, 4'd0, 16'd97};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 69 {'literal': 97, 'z': 0, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 69, 'op': 'literal'}
    instructions[180] = {5'd6, 4'd0, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 69 {'a': 8, 'b': 0, 'z': 0, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 69, 'op': 'equal'}
    instructions[181] = {5'd7, 4'd0, 4'd0, 16'd570};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 69 {'a': 0, 'label': 570, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 69, 'op': 'jmp_if_true'}
    instructions[182] = {5'd0, 4'd0, 4'd0, 16'd98};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 69 {'literal': 98, 'z': 0, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 69, 'op': 'literal'}
    instructions[183] = {5'd6, 4'd0, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 69 {'a': 8, 'b': 0, 'z': 0, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 69, 'op': 'equal'}
    instructions[184] = {5'd7, 4'd0, 4'd0, 16'd713};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 69 {'a': 0, 'label': 713, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 69, 'op': 'jmp_if_true'}
    instructions[185] = {5'd0, 4'd0, 4'd0, 16'd99};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 69 {'literal': 99, 'z': 0, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 69, 'op': 'literal'}
    instructions[186] = {5'd6, 4'd0, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 69 {'a': 8, 'b': 0, 'z': 0, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 69, 'op': 'equal'}
    instructions[187] = {5'd7, 4'd0, 4'd0, 16'd491};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 69 {'a': 0, 'label': 491, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 69, 'op': 'jmp_if_true'}
    instructions[188] = {5'd0, 4'd0, 4'd0, 16'd100};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 69 {'literal': 100, 'z': 0, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 69, 'op': 'literal'}
    instructions[189] = {5'd6, 4'd0, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 69 {'a': 8, 'b': 0, 'z': 0, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 69, 'op': 'equal'}
    instructions[190] = {5'd7, 4'd0, 4'd0, 16'd424};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 69 {'a': 0, 'label': 424, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 69, 'op': 'jmp_if_true'}
    instructions[191] = {5'd0, 4'd0, 4'd0, 16'd102};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 69 {'literal': 102, 'z': 0, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 69, 'op': 'literal'}
    instructions[192] = {5'd6, 4'd0, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 69 {'a': 8, 'b': 0, 'z': 0, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 69, 'op': 'equal'}
    instructions[193] = {5'd7, 4'd0, 4'd0, 16'd278};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 69 {'a': 0, 'label': 278, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 69, 'op': 'jmp_if_true'}
    instructions[194] = {5'd0, 4'd0, 4'd0, 16'd103};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 69 {'literal': 103, 'z': 0, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 69, 'op': 'literal'}
    instructions[195] = {5'd6, 4'd0, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 69 {'a': 8, 'b': 0, 'z': 0, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 69, 'op': 'equal'}
    instructions[196] = {5'd7, 4'd0, 4'd0, 16'd221};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 69 {'a': 0, 'label': 221, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 69, 'op': 'jmp_if_true'}
    instructions[197] = {5'd0, 4'd0, 4'd0, 16'd115};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 69 {'literal': 115, 'z': 0, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 69, 'op': 'literal'}
    instructions[198] = {5'd6, 4'd0, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 69 {'a': 8, 'b': 0, 'z': 0, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 69, 'op': 'equal'}
    instructions[199] = {5'd7, 4'd0, 4'd0, 16'd357};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 69 {'a': 0, 'label': 357, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 69, 'op': 'jmp_if_true'}
    instructions[200] = {5'd0, 4'd0, 4'd0, 16'd62};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 69 {'literal': 62, 'z': 0, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 69, 'op': 'literal'}
    instructions[201] = {5'd6, 4'd0, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 69 {'a': 8, 'b': 0, 'z': 0, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 69, 'op': 'equal'}
    instructions[202] = {5'd7, 4'd0, 4'd0, 16'd204};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 69 {'a': 0, 'label': 204, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 69, 'op': 'jmp_if_true'}
    instructions[203] = {5'd8, 4'd0, 4'd0, 16'd793};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 69 {'label': 793, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 69, 'op': 'goto'}
    instructions[204] = {5'd2, 4'd0, 4'd3, 16'd6};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 73 {'a': 3, 'comment': 'push', 'b': 6, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 73, 'op': 'store'}
    instructions[205] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 73 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 73, 'op': 'addl'}
    instructions[206] = {5'd2, 4'd0, 4'd3, 16'd7};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 73 {'a': 3, 'comment': 'push', 'b': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 73, 'op': 'store'}
    instructions[207] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 73 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 73, 'op': 'addl'}
    instructions[208] = {5'd0, 4'd8, 4'd0, 16'd24};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 73 {'literal': 24, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 73, 'op': 'literal'}
    instructions[209] = {5'd2, 4'd0, 4'd3, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 73 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 73, 'op': 'store'}
    instructions[210] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 73 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 73, 'op': 'addl'}
    instructions[211] = {5'd1, 4'd7, 4'd4, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 73 {'a': 4, 'literal': 0, 'z': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 73, 'op': 'addl'}
    instructions[212] = {5'd1, 4'd4, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 73 {'a': 3, 'literal': 0, 'z': 4, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 73, 'op': 'addl'}
    instructions[213] = {5'd3, 4'd6, 4'd0, 16'd842};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 73 {'z': 6, 'label': 842, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 73, 'op': 'call'}
    instructions[214] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 73 {'a': 3, 'literal': -1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 73, 'op': 'addl'}
    instructions[215] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 73 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 73, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[216] = {5'd5, 4'd7, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 73 {'a': 3, 'z': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 73, 'op': 'load'}
    instructions[217] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 73 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 73, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[218] = {5'd5, 4'd6, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 73 {'a': 3, 'z': 6, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 73, 'op': 'load'}
    instructions[219] = {5'd1, 4'd3, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 73 {'a': 3, 'literal': 0, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 73, 'op': 'addl'}
    instructions[220] = {5'd8, 4'd0, 4'd0, 16'd793};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 74 {'label': 793, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 74, 'op': 'goto'}
    instructions[221] = {5'd0, 4'd8, 4'd0, 16'd9};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 78 {'literal': 9, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 78, 'op': 'literal'}
    instructions[222] = {5'd1, 4'd2, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 78 {'a': 8, 'literal': 0, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 78, 'op': 'addl'}
    instructions[223] = {5'd5, 4'd8, 4'd2, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 78 {'a': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 78, 'op': 'load'}
    instructions[224] = {5'd9, 4'd8, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 78 {'a': 8, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 78, 'op': 'read'}
    instructions[225] = {5'd1, 4'd2, 4'd4, 16'd5};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 78 {'a': 4, 'literal': 5, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 78, 'op': 'addl'}
    instructions[226] = {5'd2, 4'd0, 4'd2, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 78 {'a': 2, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 78, 'op': 'store'}
    instructions[227] = {5'd2, 4'd0, 4'd3, 16'd6};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 79 {'a': 3, 'comment': 'push', 'b': 6, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 79, 'op': 'store'}
    instructions[228] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 79 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 79, 'op': 'addl'}
    instructions[229] = {5'd2, 4'd0, 4'd3, 16'd7};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 79 {'a': 3, 'comment': 'push', 'b': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 79, 'op': 'store'}
    instructions[230] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 79 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 79, 'op': 'addl'}
    instructions[231] = {5'd1, 4'd8, 4'd4, 16'd5};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 79 {'a': 4, 'literal': 5, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 79, 'op': 'addl'}
    instructions[232] = {5'd1, 4'd2, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 79 {'a': 8, 'literal': 0, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 79, 'op': 'addl'}
    instructions[233] = {5'd5, 4'd8, 4'd2, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 79 {'a': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 79, 'op': 'load'}
    instructions[234] = {5'd2, 4'd0, 4'd3, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 79 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 79, 'op': 'store'}
    instructions[235] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 79 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 79, 'op': 'addl'}
    instructions[236] = {5'd1, 4'd7, 4'd4, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 79 {'a': 4, 'literal': 0, 'z': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 79, 'op': 'addl'}
    instructions[237] = {5'd1, 4'd4, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 79 {'a': 3, 'literal': 0, 'z': 4, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 79, 'op': 'addl'}
    instructions[238] = {5'd3, 4'd6, 4'd0, 16'd933};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 79 {'z': 6, 'label': 933, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 79, 'op': 'call'}
    instructions[239] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 79 {'a': 3, 'literal': -1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 79, 'op': 'addl'}
    instructions[240] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 79 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 79, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[241] = {5'd5, 4'd7, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 79 {'a': 3, 'z': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 79, 'op': 'load'}
    instructions[242] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 79 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 79, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[243] = {5'd5, 4'd6, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 79 {'a': 3, 'z': 6, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 79, 'op': 'load'}
    instructions[244] = {5'd1, 4'd3, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 79 {'a': 3, 'literal': 0, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 79, 'op': 'addl'}
    instructions[245] = {5'd2, 4'd0, 4'd3, 16'd6};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 80 {'a': 3, 'comment': 'push', 'b': 6, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 80, 'op': 'store'}
    instructions[246] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 80 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 80, 'op': 'addl'}
    instructions[247] = {5'd2, 4'd0, 4'd3, 16'd7};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 80 {'a': 3, 'comment': 'push', 'b': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 80, 'op': 'store'}
    instructions[248] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 80 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 80, 'op': 'addl'}
    instructions[249] = {5'd0, 4'd8, 4'd0, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 80 {'literal': 0, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 80, 'op': 'literal'}
    instructions[250] = {5'd2, 4'd0, 4'd3, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 80 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 80, 'op': 'store'}
    instructions[251] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 80 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 80, 'op': 'addl'}
    instructions[252] = {5'd1, 4'd7, 4'd4, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 80 {'a': 4, 'literal': 0, 'z': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 80, 'op': 'addl'}
    instructions[253] = {5'd1, 4'd4, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 80 {'a': 3, 'literal': 0, 'z': 4, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 80, 'op': 'addl'}
    instructions[254] = {5'd3, 4'd6, 4'd0, 16'd842};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 80 {'z': 6, 'label': 842, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 80, 'op': 'call'}
    instructions[255] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 80 {'a': 3, 'literal': -1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 80, 'op': 'addl'}
    instructions[256] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 80 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 80, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[257] = {5'd5, 4'd7, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 80 {'a': 3, 'z': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 80, 'op': 'load'}
    instructions[258] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 80 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 80, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[259] = {5'd5, 4'd6, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 80 {'a': 3, 'z': 6, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 80, 'op': 'load'}
    instructions[260] = {5'd1, 4'd3, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 80 {'a': 3, 'literal': 0, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 80, 'op': 'addl'}
    instructions[261] = {5'd2, 4'd0, 4'd3, 16'd6};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 81 {'a': 3, 'comment': 'push', 'b': 6, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 81, 'op': 'store'}
    instructions[262] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 81 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 81, 'op': 'addl'}
    instructions[263] = {5'd2, 4'd0, 4'd3, 16'd7};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 81 {'a': 3, 'comment': 'push', 'b': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 81, 'op': 'store'}
    instructions[264] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 81 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 81, 'op': 'addl'}
    instructions[265] = {5'd0, 4'd8, 4'd0, 16'd5};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 81 {'literal': 5, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 81, 'op': 'literal'}
    instructions[266] = {5'd2, 4'd0, 4'd3, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 81 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 81, 'op': 'store'}
    instructions[267] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 81 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 81, 'op': 'addl'}
    instructions[268] = {5'd1, 4'd7, 4'd4, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 81 {'a': 4, 'literal': 0, 'z': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 81, 'op': 'addl'}
    instructions[269] = {5'd1, 4'd4, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 81 {'a': 3, 'literal': 0, 'z': 4, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 81, 'op': 'addl'}
    instructions[270] = {5'd3, 4'd6, 4'd0, 16'd842};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 81 {'z': 6, 'label': 842, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 81, 'op': 'call'}
    instructions[271] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 81 {'a': 3, 'literal': -1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 81, 'op': 'addl'}
    instructions[272] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 81 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 81, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[273] = {5'd5, 4'd7, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 81 {'a': 3, 'z': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 81, 'op': 'load'}
    instructions[274] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 81 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 81, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[275] = {5'd5, 4'd6, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 81 {'a': 3, 'z': 6, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 81, 'op': 'load'}
    instructions[276] = {5'd1, 4'd3, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 81 {'a': 3, 'literal': 0, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 81, 'op': 'addl'}
    instructions[277] = {5'd8, 4'd0, 4'd0, 16'd793};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 82 {'label': 793, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 82, 'op': 'goto'}
    instructions[278] = {5'd2, 4'd0, 4'd3, 16'd6};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 86 {'a': 3, 'comment': 'push', 'b': 6, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 86, 'op': 'store'}
    instructions[279] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 86 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 86, 'op': 'addl'}
    instructions[280] = {5'd2, 4'd0, 4'd3, 16'd7};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 86 {'a': 3, 'comment': 'push', 'b': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 86, 'op': 'store'}
    instructions[281] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 86 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 86, 'op': 'addl'}
    instructions[282] = {5'd1, 4'd7, 4'd4, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 86 {'a': 4, 'literal': 0, 'z': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 86, 'op': 'addl'}
    instructions[283] = {5'd1, 4'd4, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 86 {'a': 3, 'literal': 0, 'z': 4, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 86, 'op': 'addl'}
    instructions[284] = {5'd3, 4'd6, 4'd0, 16'd1123};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 86 {'z': 6, 'label': 1123, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 86, 'op': 'call'}
    instructions[285] = {5'd1, 4'd3, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 86 {'a': 3, 'literal': 0, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 86, 'op': 'addl'}
    instructions[286] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 86 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 86, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[287] = {5'd5, 4'd7, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 86 {'a': 3, 'z': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 86, 'op': 'load'}
    instructions[288] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 86 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 86, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[289] = {5'd5, 4'd6, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 86 {'a': 3, 'z': 6, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 86, 'op': 'load'}
    instructions[290] = {5'd0, 4'd2, 4'd0, 16'd34};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 86 {'literal': 34, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 86, 'op': 'literal'}
    instructions[291] = {5'd5, 4'd8, 4'd2, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 86 {'a': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 86, 'op': 'load'}
    instructions[292] = {5'd1, 4'd2, 4'd4, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 86 {'a': 4, 'literal': 0, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 86, 'op': 'addl'}
    instructions[293] = {5'd2, 4'd0, 4'd2, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 86 {'a': 2, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 86, 'op': 'store'}
    instructions[294] = {5'd2, 4'd0, 4'd3, 16'd6};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 87 {'a': 3, 'comment': 'push', 'b': 6, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 87, 'op': 'store'}
    instructions[295] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 87 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 87, 'op': 'addl'}
    instructions[296] = {5'd2, 4'd0, 4'd3, 16'd7};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 87 {'a': 3, 'comment': 'push', 'b': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 87, 'op': 'store'}
    instructions[297] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 87 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 87, 'op': 'addl'}
    instructions[298] = {5'd1, 4'd8, 4'd4, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 87 {'a': 4, 'literal': 0, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 87, 'op': 'addl'}
    instructions[299] = {5'd1, 4'd2, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 87 {'a': 8, 'literal': 0, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 87, 'op': 'addl'}
    instructions[300] = {5'd5, 4'd8, 4'd2, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 87 {'a': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 87, 'op': 'load'}
    instructions[301] = {5'd2, 4'd0, 4'd3, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 87 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 87, 'op': 'store'}
    instructions[302] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 87 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 87, 'op': 'addl'}
    instructions[303] = {5'd1, 4'd7, 4'd4, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 87 {'a': 4, 'literal': 0, 'z': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 87, 'op': 'addl'}
    instructions[304] = {5'd1, 4'd4, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 87 {'a': 3, 'literal': 0, 'z': 4, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 87, 'op': 'addl'}
    instructions[305] = {5'd3, 4'd6, 4'd0, 16'd933};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 87 {'z': 6, 'label': 933, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 87, 'op': 'call'}
    instructions[306] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 87 {'a': 3, 'literal': -1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 87, 'op': 'addl'}
    instructions[307] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 87 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 87, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[308] = {5'd5, 4'd7, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 87 {'a': 3, 'z': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 87, 'op': 'load'}
    instructions[309] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 87 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 87, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[310] = {5'd5, 4'd6, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 87 {'a': 3, 'z': 6, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 87, 'op': 'load'}
    instructions[311] = {5'd1, 4'd3, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 87 {'a': 3, 'literal': 0, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 87, 'op': 'addl'}
    instructions[312] = {5'd2, 4'd0, 4'd3, 16'd6};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 88 {'a': 3, 'comment': 'push', 'b': 6, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 88, 'op': 'store'}
    instructions[313] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 88 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 88, 'op': 'addl'}
    instructions[314] = {5'd2, 4'd0, 4'd3, 16'd7};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 88 {'a': 3, 'comment': 'push', 'b': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 88, 'op': 'store'}
    instructions[315] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 88 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 88, 'op': 'addl'}
    instructions[316] = {5'd0, 4'd8, 4'd0, 16'd14};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 88 {'literal': 14, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 88, 'op': 'literal'}
    instructions[317] = {5'd2, 4'd0, 4'd3, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 88 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 88, 'op': 'store'}
    instructions[318] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 88 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 88, 'op': 'addl'}
    instructions[319] = {5'd1, 4'd7, 4'd4, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 88 {'a': 4, 'literal': 0, 'z': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 88, 'op': 'addl'}
    instructions[320] = {5'd1, 4'd4, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 88 {'a': 3, 'literal': 0, 'z': 4, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 88, 'op': 'addl'}
    instructions[321] = {5'd3, 4'd6, 4'd0, 16'd842};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 88 {'z': 6, 'label': 842, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 88, 'op': 'call'}
    instructions[322] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 88 {'a': 3, 'literal': -1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 88, 'op': 'addl'}
    instructions[323] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 88 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 88, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[324] = {5'd5, 4'd7, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 88 {'a': 3, 'z': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 88, 'op': 'load'}
    instructions[325] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 88 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 88, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[326] = {5'd5, 4'd6, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 88 {'a': 3, 'z': 6, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 88, 'op': 'load'}
    instructions[327] = {5'd1, 4'd3, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 88 {'a': 3, 'literal': 0, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 88, 'op': 'addl'}
    instructions[328] = {5'd0, 4'd8, 4'd0, 16'd33};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 89 {'literal': 33, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 89, 'op': 'literal'}
    instructions[329] = {5'd1, 4'd2, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 89 {'a': 8, 'literal': 0, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 89, 'op': 'addl'}
    instructions[330] = {5'd5, 4'd8, 4'd2, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 89 {'a': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 89, 'op': 'load'}
    instructions[331] = {5'd2, 4'd0, 4'd3, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 89 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 89, 'op': 'store'}
    instructions[332] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 89 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 89, 'op': 'addl'}
    instructions[333] = {5'd1, 4'd8, 4'd4, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 89 {'a': 4, 'literal': 0, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 89, 'op': 'addl'}
    instructions[334] = {5'd1, 4'd2, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 89 {'a': 8, 'literal': 0, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 89, 'op': 'addl'}
    instructions[335] = {5'd5, 4'd8, 4'd2, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 89 {'a': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 89, 'op': 'load'}
    instructions[336] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 89 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 89, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[337] = {5'd5, 4'd0, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 89 {'a': 3, 'z': 0, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 89, 'op': 'load'}
    instructions[338] = {5'd10, 4'd0, 4'd0, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 89 {'a': 0, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 89, 'op': 'write'}
    instructions[339] = {5'd1, 4'd3, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 89 {'a': 3, 'literal': 0, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 89, 'op': 'addl'}
    instructions[340] = {5'd2, 4'd0, 4'd3, 16'd6};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 90 {'a': 3, 'comment': 'push', 'b': 6, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 90, 'op': 'store'}
    instructions[341] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 90 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 90, 'op': 'addl'}
    instructions[342] = {5'd2, 4'd0, 4'd3, 16'd7};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 90 {'a': 3, 'comment': 'push', 'b': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 90, 'op': 'store'}
    instructions[343] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 90 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 90, 'op': 'addl'}
    instructions[344] = {5'd0, 4'd8, 4'd0, 16'd38};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 90 {'literal': 38, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 90, 'op': 'literal'}
    instructions[345] = {5'd2, 4'd0, 4'd3, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 90 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 90, 'op': 'store'}
    instructions[346] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 90 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 90, 'op': 'addl'}
    instructions[347] = {5'd1, 4'd7, 4'd4, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 90 {'a': 4, 'literal': 0, 'z': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 90, 'op': 'addl'}
    instructions[348] = {5'd1, 4'd4, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 90 {'a': 3, 'literal': 0, 'z': 4, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 90, 'op': 'addl'}
    instructions[349] = {5'd3, 4'd6, 4'd0, 16'd842};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 90 {'z': 6, 'label': 842, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 90, 'op': 'call'}
    instructions[350] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 90 {'a': 3, 'literal': -1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 90, 'op': 'addl'}
    instructions[351] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 90 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 90, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[352] = {5'd5, 4'd7, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 90 {'a': 3, 'z': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 90, 'op': 'load'}
    instructions[353] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 90 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 90, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[354] = {5'd5, 4'd6, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 90 {'a': 3, 'z': 6, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 90, 'op': 'load'}
    instructions[355] = {5'd1, 4'd3, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 90 {'a': 3, 'literal': 0, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 90, 'op': 'addl'}
    instructions[356] = {5'd8, 4'd0, 4'd0, 16'd793};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 91 {'label': 793, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 91, 'op': 'goto'}
    instructions[357] = {5'd2, 4'd0, 4'd3, 16'd6};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 95 {'a': 3, 'comment': 'push', 'b': 6, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 95, 'op': 'store'}
    instructions[358] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 95 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 95, 'op': 'addl'}
    instructions[359] = {5'd2, 4'd0, 4'd3, 16'd7};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 95 {'a': 3, 'comment': 'push', 'b': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 95, 'op': 'store'}
    instructions[360] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 95 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 95, 'op': 'addl'}
    instructions[361] = {5'd1, 4'd7, 4'd4, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 95 {'a': 4, 'literal': 0, 'z': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 95, 'op': 'addl'}
    instructions[362] = {5'd1, 4'd4, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 95 {'a': 3, 'literal': 0, 'z': 4, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 95, 'op': 'addl'}
    instructions[363] = {5'd3, 4'd6, 4'd0, 16'd1123};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 95 {'z': 6, 'label': 1123, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 95, 'op': 'call'}
    instructions[364] = {5'd1, 4'd3, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 95 {'a': 3, 'literal': 0, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 95, 'op': 'addl'}
    instructions[365] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 95 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 95, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[366] = {5'd5, 4'd7, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 95 {'a': 3, 'z': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 95, 'op': 'load'}
    instructions[367] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 95 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 95, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[368] = {5'd5, 4'd6, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 95 {'a': 3, 'z': 6, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 95, 'op': 'load'}
    instructions[369] = {5'd0, 4'd2, 4'd0, 16'd34};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 95 {'literal': 34, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 95, 'op': 'literal'}
    instructions[370] = {5'd5, 4'd8, 4'd2, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 95 {'a': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 95, 'op': 'load'}
    instructions[371] = {5'd1, 4'd2, 4'd4, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 95 {'a': 4, 'literal': 1, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 95, 'op': 'addl'}
    instructions[372] = {5'd2, 4'd0, 4'd2, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 95 {'a': 2, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 95, 'op': 'store'}
    instructions[373] = {5'd2, 4'd0, 4'd3, 16'd6};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 96 {'a': 3, 'comment': 'push', 'b': 6, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 96, 'op': 'store'}
    instructions[374] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 96 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 96, 'op': 'addl'}
    instructions[375] = {5'd2, 4'd0, 4'd3, 16'd7};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 96 {'a': 3, 'comment': 'push', 'b': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 96, 'op': 'store'}
    instructions[376] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 96 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 96, 'op': 'addl'}
    instructions[377] = {5'd1, 4'd8, 4'd4, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 96 {'a': 4, 'literal': 1, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 96, 'op': 'addl'}
    instructions[378] = {5'd1, 4'd2, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 96 {'a': 8, 'literal': 0, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 96, 'op': 'addl'}
    instructions[379] = {5'd5, 4'd8, 4'd2, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 96 {'a': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 96, 'op': 'load'}
    instructions[380] = {5'd2, 4'd0, 4'd3, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 96 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 96, 'op': 'store'}
    instructions[381] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 96 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 96, 'op': 'addl'}
    instructions[382] = {5'd1, 4'd7, 4'd4, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 96 {'a': 4, 'literal': 0, 'z': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 96, 'op': 'addl'}
    instructions[383] = {5'd1, 4'd4, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 96 {'a': 3, 'literal': 0, 'z': 4, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 96, 'op': 'addl'}
    instructions[384] = {5'd3, 4'd6, 4'd0, 16'd933};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 96 {'z': 6, 'label': 933, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 96, 'op': 'call'}
    instructions[385] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 96 {'a': 3, 'literal': -1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 96, 'op': 'addl'}
    instructions[386] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 96 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 96, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[387] = {5'd5, 4'd7, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 96 {'a': 3, 'z': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 96, 'op': 'load'}
    instructions[388] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 96 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 96, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[389] = {5'd5, 4'd6, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 96 {'a': 3, 'z': 6, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 96, 'op': 'load'}
    instructions[390] = {5'd1, 4'd3, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 96 {'a': 3, 'literal': 0, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 96, 'op': 'addl'}
    instructions[391] = {5'd2, 4'd0, 4'd3, 16'd6};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 97 {'a': 3, 'comment': 'push', 'b': 6, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 97, 'op': 'store'}
    instructions[392] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 97 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 97, 'op': 'addl'}
    instructions[393] = {5'd2, 4'd0, 4'd3, 16'd7};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 97 {'a': 3, 'comment': 'push', 'b': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 97, 'op': 'store'}
    instructions[394] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 97 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 97, 'op': 'addl'}
    instructions[395] = {5'd0, 4'd8, 4'd0, 16'd22};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 97 {'literal': 22, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 97, 'op': 'literal'}
    instructions[396] = {5'd2, 4'd0, 4'd3, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 97 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 97, 'op': 'store'}
    instructions[397] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 97 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 97, 'op': 'addl'}
    instructions[398] = {5'd1, 4'd7, 4'd4, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 97 {'a': 4, 'literal': 0, 'z': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 97, 'op': 'addl'}
    instructions[399] = {5'd1, 4'd4, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 97 {'a': 3, 'literal': 0, 'z': 4, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 97, 'op': 'addl'}
    instructions[400] = {5'd3, 4'd6, 4'd0, 16'd842};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 97 {'z': 6, 'label': 842, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 97, 'op': 'call'}
    instructions[401] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 97 {'a': 3, 'literal': -1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 97, 'op': 'addl'}
    instructions[402] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 97 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 97, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[403] = {5'd5, 4'd7, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 97 {'a': 3, 'z': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 97, 'op': 'load'}
    instructions[404] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 97 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 97, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[405] = {5'd5, 4'd6, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 97 {'a': 3, 'z': 6, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 97, 'op': 'load'}
    instructions[406] = {5'd1, 4'd3, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 97 {'a': 3, 'literal': 0, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 97, 'op': 'addl'}
    instructions[407] = {5'd2, 4'd0, 4'd3, 16'd6};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 98 {'a': 3, 'comment': 'push', 'b': 6, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 98, 'op': 'store'}
    instructions[408] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 98 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 98, 'op': 'addl'}
    instructions[409] = {5'd2, 4'd0, 4'd3, 16'd7};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 98 {'a': 3, 'comment': 'push', 'b': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 98, 'op': 'store'}
    instructions[410] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 98 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 98, 'op': 'addl'}
    instructions[411] = {5'd0, 4'd8, 4'd0, 16'd30};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 98 {'literal': 30, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 98, 'op': 'literal'}
    instructions[412] = {5'd2, 4'd0, 4'd3, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 98 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 98, 'op': 'store'}
    instructions[413] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 98 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 98, 'op': 'addl'}
    instructions[414] = {5'd1, 4'd7, 4'd4, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 98 {'a': 4, 'literal': 0, 'z': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 98, 'op': 'addl'}
    instructions[415] = {5'd1, 4'd4, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 98 {'a': 3, 'literal': 0, 'z': 4, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 98, 'op': 'addl'}
    instructions[416] = {5'd3, 4'd6, 4'd0, 16'd842};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 98 {'z': 6, 'label': 842, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 98, 'op': 'call'}
    instructions[417] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 98 {'a': 3, 'literal': -1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 98, 'op': 'addl'}
    instructions[418] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 98 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 98, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[419] = {5'd5, 4'd7, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 98 {'a': 3, 'z': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 98, 'op': 'load'}
    instructions[420] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 98 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 98, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[421] = {5'd5, 4'd6, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 98 {'a': 3, 'z': 6, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 98, 'op': 'load'}
    instructions[422] = {5'd1, 4'd3, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 98 {'a': 3, 'literal': 0, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 98, 'op': 'addl'}
    instructions[423] = {5'd8, 4'd0, 4'd0, 16'd793};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 99 {'label': 793, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 99, 'op': 'goto'}
    instructions[424] = {5'd2, 4'd0, 4'd3, 16'd6};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 103 {'a': 3, 'comment': 'push', 'b': 6, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 103, 'op': 'store'}
    instructions[425] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 103 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 103, 'op': 'addl'}
    instructions[426] = {5'd2, 4'd0, 4'd3, 16'd7};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 103 {'a': 3, 'comment': 'push', 'b': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 103, 'op': 'store'}
    instructions[427] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 103 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 103, 'op': 'addl'}
    instructions[428] = {5'd1, 4'd7, 4'd4, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 103 {'a': 4, 'literal': 0, 'z': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 103, 'op': 'addl'}
    instructions[429] = {5'd1, 4'd4, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 103 {'a': 3, 'literal': 0, 'z': 4, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 103, 'op': 'addl'}
    instructions[430] = {5'd3, 4'd6, 4'd0, 16'd1123};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 103 {'z': 6, 'label': 1123, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 103, 'op': 'call'}
    instructions[431] = {5'd1, 4'd3, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 103 {'a': 3, 'literal': 0, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 103, 'op': 'addl'}
    instructions[432] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 103 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 103, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[433] = {5'd5, 4'd7, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 103 {'a': 3, 'z': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 103, 'op': 'load'}
    instructions[434] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 103 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 103, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[435] = {5'd5, 4'd6, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 103 {'a': 3, 'z': 6, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 103, 'op': 'load'}
    instructions[436] = {5'd0, 4'd2, 4'd0, 16'd34};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 103 {'literal': 34, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 103, 'op': 'literal'}
    instructions[437] = {5'd5, 4'd8, 4'd2, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 103 {'a': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 103, 'op': 'load'}
    instructions[438] = {5'd1, 4'd2, 4'd4, 16'd2};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 103 {'a': 4, 'literal': 2, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 103, 'op': 'addl'}
    instructions[439] = {5'd2, 4'd0, 4'd2, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 103 {'a': 2, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 103, 'op': 'store'}
    instructions[440] = {5'd2, 4'd0, 4'd3, 16'd6};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 104 {'a': 3, 'comment': 'push', 'b': 6, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 104, 'op': 'store'}
    instructions[441] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 104 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 104, 'op': 'addl'}
    instructions[442] = {5'd2, 4'd0, 4'd3, 16'd7};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 104 {'a': 3, 'comment': 'push', 'b': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 104, 'op': 'store'}
    instructions[443] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 104 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 104, 'op': 'addl'}
    instructions[444] = {5'd1, 4'd8, 4'd4, 16'd2};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 104 {'a': 4, 'literal': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 104, 'op': 'addl'}
    instructions[445] = {5'd1, 4'd2, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 104 {'a': 8, 'literal': 0, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 104, 'op': 'addl'}
    instructions[446] = {5'd5, 4'd8, 4'd2, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 104 {'a': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 104, 'op': 'load'}
    instructions[447] = {5'd2, 4'd0, 4'd3, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 104 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 104, 'op': 'store'}
    instructions[448] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 104 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 104, 'op': 'addl'}
    instructions[449] = {5'd1, 4'd7, 4'd4, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 104 {'a': 4, 'literal': 0, 'z': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 104, 'op': 'addl'}
    instructions[450] = {5'd1, 4'd4, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 104 {'a': 3, 'literal': 0, 'z': 4, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 104, 'op': 'addl'}
    instructions[451] = {5'd3, 4'd6, 4'd0, 16'd933};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 104 {'z': 6, 'label': 933, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 104, 'op': 'call'}
    instructions[452] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 104 {'a': 3, 'literal': -1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 104, 'op': 'addl'}
    instructions[453] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 104 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 104, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[454] = {5'd5, 4'd7, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 104 {'a': 3, 'z': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 104, 'op': 'load'}
    instructions[455] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 104 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 104, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[456] = {5'd5, 4'd6, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 104 {'a': 3, 'z': 6, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 104, 'op': 'load'}
    instructions[457] = {5'd1, 4'd3, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 104 {'a': 3, 'literal': 0, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 104, 'op': 'addl'}
    instructions[458] = {5'd2, 4'd0, 4'd3, 16'd6};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 105 {'a': 3, 'comment': 'push', 'b': 6, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 105, 'op': 'store'}
    instructions[459] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 105 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 105, 'op': 'addl'}
    instructions[460] = {5'd2, 4'd0, 4'd3, 16'd7};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 105 {'a': 3, 'comment': 'push', 'b': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 105, 'op': 'store'}
    instructions[461] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 105 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 105, 'op': 'addl'}
    instructions[462] = {5'd0, 4'd8, 4'd0, 16'd27};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 105 {'literal': 27, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 105, 'op': 'literal'}
    instructions[463] = {5'd2, 4'd0, 4'd3, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 105 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 105, 'op': 'store'}
    instructions[464] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 105 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 105, 'op': 'addl'}
    instructions[465] = {5'd1, 4'd7, 4'd4, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 105 {'a': 4, 'literal': 0, 'z': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 105, 'op': 'addl'}
    instructions[466] = {5'd1, 4'd4, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 105 {'a': 3, 'literal': 0, 'z': 4, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 105, 'op': 'addl'}
    instructions[467] = {5'd3, 4'd6, 4'd0, 16'd842};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 105 {'z': 6, 'label': 842, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 105, 'op': 'call'}
    instructions[468] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 105 {'a': 3, 'literal': -1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 105, 'op': 'addl'}
    instructions[469] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 105 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 105, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[470] = {5'd5, 4'd7, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 105 {'a': 3, 'z': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 105, 'op': 'load'}
    instructions[471] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 105 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 105, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[472] = {5'd5, 4'd6, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 105 {'a': 3, 'z': 6, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 105, 'op': 'load'}
    instructions[473] = {5'd1, 4'd3, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 105 {'a': 3, 'literal': 0, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 105, 'op': 'addl'}
    instructions[474] = {5'd2, 4'd0, 4'd3, 16'd6};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 106 {'a': 3, 'comment': 'push', 'b': 6, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 106, 'op': 'store'}
    instructions[475] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 106 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 106, 'op': 'addl'}
    instructions[476] = {5'd2, 4'd0, 4'd3, 16'd7};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 106 {'a': 3, 'comment': 'push', 'b': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 106, 'op': 'store'}
    instructions[477] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 106 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 106, 'op': 'addl'}
    instructions[478] = {5'd0, 4'd8, 4'd0, 16'd35};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 106 {'literal': 35, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 106, 'op': 'literal'}
    instructions[479] = {5'd2, 4'd0, 4'd3, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 106 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 106, 'op': 'store'}
    instructions[480] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 106 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 106, 'op': 'addl'}
    instructions[481] = {5'd1, 4'd7, 4'd4, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 106 {'a': 4, 'literal': 0, 'z': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 106, 'op': 'addl'}
    instructions[482] = {5'd1, 4'd4, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 106 {'a': 3, 'literal': 0, 'z': 4, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 106, 'op': 'addl'}
    instructions[483] = {5'd3, 4'd6, 4'd0, 16'd842};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 106 {'z': 6, 'label': 842, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 106, 'op': 'call'}
    instructions[484] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 106 {'a': 3, 'literal': -1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 106, 'op': 'addl'}
    instructions[485] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 106 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 106, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[486] = {5'd5, 4'd7, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 106 {'a': 3, 'z': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 106, 'op': 'load'}
    instructions[487] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 106 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 106, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[488] = {5'd5, 4'd6, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 106 {'a': 3, 'z': 6, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 106, 'op': 'load'}
    instructions[489] = {5'd1, 4'd3, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 106 {'a': 3, 'literal': 0, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 106, 'op': 'addl'}
    instructions[490] = {5'd8, 4'd0, 4'd0, 16'd793};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 107 {'label': 793, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 107, 'op': 'goto'}
    instructions[491] = {5'd2, 4'd0, 4'd3, 16'd6};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 111 {'a': 3, 'comment': 'push', 'b': 6, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 111, 'op': 'store'}
    instructions[492] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 111 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 111, 'op': 'addl'}
    instructions[493] = {5'd2, 4'd0, 4'd3, 16'd7};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 111 {'a': 3, 'comment': 'push', 'b': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 111, 'op': 'store'}
    instructions[494] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 111 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 111, 'op': 'addl'}
    instructions[495] = {5'd1, 4'd7, 4'd4, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 111 {'a': 4, 'literal': 0, 'z': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 111, 'op': 'addl'}
    instructions[496] = {5'd1, 4'd4, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 111 {'a': 3, 'literal': 0, 'z': 4, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 111, 'op': 'addl'}
    instructions[497] = {5'd3, 4'd6, 4'd0, 16'd1123};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 111 {'z': 6, 'label': 1123, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 111, 'op': 'call'}
    instructions[498] = {5'd1, 4'd3, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 111 {'a': 3, 'literal': 0, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 111, 'op': 'addl'}
    instructions[499] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 111 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 111, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[500] = {5'd5, 4'd7, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 111 {'a': 3, 'z': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 111, 'op': 'load'}
    instructions[501] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 111 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 111, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[502] = {5'd5, 4'd6, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 111 {'a': 3, 'z': 6, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 111, 'op': 'load'}
    instructions[503] = {5'd0, 4'd2, 4'd0, 16'd34};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 111 {'literal': 34, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 111, 'op': 'literal'}
    instructions[504] = {5'd5, 4'd8, 4'd2, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 111 {'a': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 111, 'op': 'load'}
    instructions[505] = {5'd1, 4'd2, 4'd4, 16'd3};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 111 {'a': 4, 'literal': 3, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 111, 'op': 'addl'}
    instructions[506] = {5'd2, 4'd0, 4'd2, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 111 {'a': 2, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 111, 'op': 'store'}
    instructions[507] = {5'd0, 4'd8, 4'd0, 16'd10};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 112 {'literal': 10, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 112, 'op': 'literal'}
    instructions[508] = {5'd1, 4'd2, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 112 {'a': 8, 'literal': 0, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 112, 'op': 'addl'}
    instructions[509] = {5'd5, 4'd8, 4'd2, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 112 {'a': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 112, 'op': 'load'}
    instructions[510] = {5'd2, 4'd0, 4'd3, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 112 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 112, 'op': 'store'}
    instructions[511] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 112 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 112, 'op': 'addl'}
    instructions[512] = {5'd1, 4'd8, 4'd4, 16'd3};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 112 {'a': 4, 'literal': 3, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 112, 'op': 'addl'}
    instructions[513] = {5'd1, 4'd2, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 112 {'a': 8, 'literal': 0, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 112, 'op': 'addl'}
    instructions[514] = {5'd5, 4'd8, 4'd2, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 112 {'a': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 112, 'op': 'load'}
    instructions[515] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 112 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 112, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[516] = {5'd5, 4'd0, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 112 {'a': 3, 'z': 0, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 112, 'op': 'load'}
    instructions[517] = {5'd10, 4'd0, 4'd0, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 112 {'a': 0, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 112, 'op': 'write'}
    instructions[518] = {5'd1, 4'd3, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 112 {'a': 3, 'literal': 0, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 112, 'op': 'addl'}
    instructions[519] = {5'd2, 4'd0, 4'd3, 16'd6};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 113 {'a': 3, 'comment': 'push', 'b': 6, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 113, 'op': 'store'}
    instructions[520] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 113 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 113, 'op': 'addl'}
    instructions[521] = {5'd2, 4'd0, 4'd3, 16'd7};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 113 {'a': 3, 'comment': 'push', 'b': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 113, 'op': 'store'}
    instructions[522] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 113 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 113, 'op': 'addl'}
    instructions[523] = {5'd1, 4'd8, 4'd4, 16'd3};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 113 {'a': 4, 'literal': 3, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 113, 'op': 'addl'}
    instructions[524] = {5'd1, 4'd2, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 113 {'a': 8, 'literal': 0, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 113, 'op': 'addl'}
    instructions[525] = {5'd5, 4'd8, 4'd2, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 113 {'a': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 113, 'op': 'load'}
    instructions[526] = {5'd2, 4'd0, 4'd3, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 113 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 113, 'op': 'store'}
    instructions[527] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 113 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 113, 'op': 'addl'}
    instructions[528] = {5'd1, 4'd7, 4'd4, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 113 {'a': 4, 'literal': 0, 'z': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 113, 'op': 'addl'}
    instructions[529] = {5'd1, 4'd4, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 113 {'a': 3, 'literal': 0, 'z': 4, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 113, 'op': 'addl'}
    instructions[530] = {5'd3, 4'd6, 4'd0, 16'd933};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 113 {'z': 6, 'label': 933, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 113, 'op': 'call'}
    instructions[531] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 113 {'a': 3, 'literal': -1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 113, 'op': 'addl'}
    instructions[532] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 113 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 113, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[533] = {5'd5, 4'd7, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 113 {'a': 3, 'z': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 113, 'op': 'load'}
    instructions[534] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 113 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 113, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[535] = {5'd5, 4'd6, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 113 {'a': 3, 'z': 6, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 113, 'op': 'load'}
    instructions[536] = {5'd1, 4'd3, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 113 {'a': 3, 'literal': 0, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 113, 'op': 'addl'}
    instructions[537] = {5'd2, 4'd0, 4'd3, 16'd6};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 114 {'a': 3, 'comment': 'push', 'b': 6, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 114, 'op': 'store'}
    instructions[538] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 114 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 114, 'op': 'addl'}
    instructions[539] = {5'd2, 4'd0, 4'd3, 16'd7};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 114 {'a': 3, 'comment': 'push', 'b': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 114, 'op': 'store'}
    instructions[540] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 114 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 114, 'op': 'addl'}
    instructions[541] = {5'd0, 4'd8, 4'd0, 16'd20};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 114 {'literal': 20, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 114, 'op': 'literal'}
    instructions[542] = {5'd2, 4'd0, 4'd3, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 114 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 114, 'op': 'store'}
    instructions[543] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 114 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 114, 'op': 'addl'}
    instructions[544] = {5'd1, 4'd7, 4'd4, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 114 {'a': 4, 'literal': 0, 'z': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 114, 'op': 'addl'}
    instructions[545] = {5'd1, 4'd4, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 114 {'a': 3, 'literal': 0, 'z': 4, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 114, 'op': 'addl'}
    instructions[546] = {5'd3, 4'd6, 4'd0, 16'd842};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 114 {'z': 6, 'label': 842, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 114, 'op': 'call'}
    instructions[547] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 114 {'a': 3, 'literal': -1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 114, 'op': 'addl'}
    instructions[548] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 114 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 114, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[549] = {5'd5, 4'd7, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 114 {'a': 3, 'z': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 114, 'op': 'load'}
    instructions[550] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 114 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 114, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[551] = {5'd5, 4'd6, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 114 {'a': 3, 'z': 6, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 114, 'op': 'load'}
    instructions[552] = {5'd1, 4'd3, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 114 {'a': 3, 'literal': 0, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 114, 'op': 'addl'}
    instructions[553] = {5'd2, 4'd0, 4'd3, 16'd6};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 115 {'a': 3, 'comment': 'push', 'b': 6, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 115, 'op': 'store'}
    instructions[554] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 115 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 115, 'op': 'addl'}
    instructions[555] = {5'd2, 4'd0, 4'd3, 16'd7};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 115 {'a': 3, 'comment': 'push', 'b': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 115, 'op': 'store'}
    instructions[556] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 115 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 115, 'op': 'addl'}
    instructions[557] = {5'd0, 4'd8, 4'd0, 16'd16};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 115 {'literal': 16, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 115, 'op': 'literal'}
    instructions[558] = {5'd2, 4'd0, 4'd3, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 115 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 115, 'op': 'store'}
    instructions[559] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 115 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 115, 'op': 'addl'}
    instructions[560] = {5'd1, 4'd7, 4'd4, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 115 {'a': 4, 'literal': 0, 'z': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 115, 'op': 'addl'}
    instructions[561] = {5'd1, 4'd4, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 115 {'a': 3, 'literal': 0, 'z': 4, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 115, 'op': 'addl'}
    instructions[562] = {5'd3, 4'd6, 4'd0, 16'd842};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 115 {'z': 6, 'label': 842, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 115, 'op': 'call'}
    instructions[563] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 115 {'a': 3, 'literal': -1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 115, 'op': 'addl'}
    instructions[564] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 115 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 115, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[565] = {5'd5, 4'd7, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 115 {'a': 3, 'z': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 115, 'op': 'load'}
    instructions[566] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 115 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 115, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[567] = {5'd5, 4'd6, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 115 {'a': 3, 'z': 6, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 115, 'op': 'load'}
    instructions[568] = {5'd1, 4'd3, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 115 {'a': 3, 'literal': 0, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 115, 'op': 'addl'}
    instructions[569] = {5'd8, 4'd0, 4'd0, 16'd793};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 116 {'label': 793, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 116, 'op': 'goto'}
    instructions[570] = {5'd1, 4'd8, 4'd4, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 120 {'a': 4, 'literal': 1, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 120, 'op': 'addl'}
    instructions[571] = {5'd1, 4'd2, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 120 {'a': 8, 'literal': 0, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 120, 'op': 'addl'}
    instructions[572] = {5'd5, 4'd8, 4'd2, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 120 {'a': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 120, 'op': 'load'}
    instructions[573] = {5'd2, 4'd0, 4'd3, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 120 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 120, 'op': 'store'}
    instructions[574] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 120 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 120, 'op': 'addl'}
    instructions[575] = {5'd1, 4'd8, 4'd4, 16'd4};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 120 {'a': 4, 'literal': 4, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 120, 'op': 'addl'}
    instructions[576] = {5'd1, 4'd2, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 120 {'a': 8, 'literal': 0, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 120, 'op': 'addl'}
    instructions[577] = {5'd5, 4'd8, 4'd2, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 120 {'a': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 120, 'op': 'load'}
    instructions[578] = {5'd2, 4'd0, 4'd3, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 120 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 120, 'op': 'store'}
    instructions[579] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 120 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 120, 'op': 'addl'}
    instructions[580] = {5'd11, 4'd8, 4'd0, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 120 {'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 120, 'op': 'timer_low'}
    instructions[581] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 120 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 120, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[582] = {5'd5, 4'd10, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 120 {'a': 3, 'z': 10, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 120, 'op': 'load'}
    instructions[583] = {5'd12, 4'd8, 4'd8, 16'd10};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 120 {'a': 8, 'z': 8, 'b': 10, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 120, 'op': 'subtract'}
    instructions[584] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 120 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 120, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[585] = {5'd5, 4'd10, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 120 {'a': 3, 'z': 10, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 120, 'op': 'load'}
    instructions[586] = {5'd13, 4'd8, 4'd8, 16'd10};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 120 {'a': 8, 'z': 8, 'b': 10, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 120, 'op': 'unsigned_greater'}
    instructions[587] = {5'd14, 4'd0, 4'd8, 16'd592};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 120 {'a': 8, 'label': 592, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 120, 'op': 'jmp_if_false'}
    instructions[588] = {5'd11, 4'd8, 4'd0, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 121 {'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 121, 'op': 'timer_low'}
    instructions[589] = {5'd1, 4'd2, 4'd4, 16'd4};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 121 {'a': 4, 'literal': 4, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 121, 'op': 'addl'}
    instructions[590] = {5'd2, 4'd0, 4'd2, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 121 {'a': 2, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 121, 'op': 'store'}
    instructions[591] = {5'd8, 4'd0, 4'd0, 16'd592};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 120 {'label': 592, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 120, 'op': 'goto'}
    instructions[592] = {5'd2, 4'd0, 4'd3, 16'd6};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 123 {'a': 3, 'comment': 'push', 'b': 6, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 123, 'op': 'store'}
    instructions[593] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 123 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 123, 'op': 'addl'}
    instructions[594] = {5'd2, 4'd0, 4'd3, 16'd7};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 123 {'a': 3, 'comment': 'push', 'b': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 123, 'op': 'store'}
    instructions[595] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 123 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 123, 'op': 'addl'}
    instructions[596] = {5'd1, 4'd7, 4'd4, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 123 {'a': 4, 'literal': 0, 'z': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 123, 'op': 'addl'}
    instructions[597] = {5'd1, 4'd4, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 123 {'a': 3, 'literal': 0, 'z': 4, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 123, 'op': 'addl'}
    instructions[598] = {5'd3, 4'd6, 4'd0, 16'd832};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 123 {'z': 6, 'label': 832, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 123, 'op': 'call'}
    instructions[599] = {5'd1, 4'd3, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 123 {'a': 3, 'literal': 0, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 123, 'op': 'addl'}
    instructions[600] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 123 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 123, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[601] = {5'd5, 4'd7, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 123 {'a': 3, 'z': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 123, 'op': 'load'}
    instructions[602] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 123 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 123, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[603] = {5'd5, 4'd6, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 123 {'a': 3, 'z': 6, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 123, 'op': 'load'}
    instructions[604] = {5'd0, 4'd2, 4'd0, 16'd12};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 123 {'literal': 12, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 123, 'op': 'literal'}
    instructions[605] = {5'd5, 4'd8, 4'd2, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 123 {'a': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 123, 'op': 'load'}
    instructions[606] = {5'd1, 4'd2, 4'd4, 16'd6};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 123 {'a': 4, 'literal': 6, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 123, 'op': 'addl'}
    instructions[607] = {5'd2, 4'd0, 4'd2, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 123 {'a': 2, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 123, 'op': 'store'}
    instructions[608] = {5'd0, 4'd8, 4'd0, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 124 {'literal': 8, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 124, 'op': 'literal'}
    instructions[609] = {5'd2, 4'd0, 4'd3, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 124 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 124, 'op': 'store'}
    instructions[610] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 124 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 124, 'op': 'addl'}
    instructions[611] = {5'd2, 4'd0, 4'd3, 16'd6};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 124 {'a': 3, 'comment': 'push', 'b': 6, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 124, 'op': 'store'}
    instructions[612] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 124 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 124, 'op': 'addl'}
    instructions[613] = {5'd2, 4'd0, 4'd3, 16'd7};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 124 {'a': 3, 'comment': 'push', 'b': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 124, 'op': 'store'}
    instructions[614] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 124 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 124, 'op': 'addl'}
    instructions[615] = {5'd1, 4'd7, 4'd4, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 124 {'a': 4, 'literal': 0, 'z': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 124, 'op': 'addl'}
    instructions[616] = {5'd1, 4'd4, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 124 {'a': 3, 'literal': 0, 'z': 4, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 124, 'op': 'addl'}
    instructions[617] = {5'd3, 4'd6, 4'd0, 16'd832};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 124 {'z': 6, 'label': 832, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 124, 'op': 'call'}
    instructions[618] = {5'd1, 4'd3, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 124 {'a': 3, 'literal': 0, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 124, 'op': 'addl'}
    instructions[619] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 124 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 124, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[620] = {5'd5, 4'd7, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 124 {'a': 3, 'z': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 124, 'op': 'load'}
    instructions[621] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 124 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 124, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[622] = {5'd5, 4'd6, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 124 {'a': 3, 'z': 6, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 124, 'op': 'load'}
    instructions[623] = {5'd0, 4'd2, 4'd0, 16'd12};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 124 {'literal': 12, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 124, 'op': 'literal'}
    instructions[624] = {5'd5, 4'd8, 4'd2, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 124 {'a': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 124, 'op': 'load'}
    instructions[625] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 124 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 124, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[626] = {5'd5, 4'd10, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 124 {'a': 3, 'z': 10, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 124, 'op': 'load'}
    instructions[627] = {5'd15, 4'd8, 4'd8, 16'd10};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 124 {'a': 8, 'z': 8, 'b': 10, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 124, 'op': 'shift_left'}
    instructions[628] = {5'd2, 4'd0, 4'd3, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 124 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 124, 'op': 'store'}
    instructions[629] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 124 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 124, 'op': 'addl'}
    instructions[630] = {5'd1, 4'd8, 4'd4, 16'd6};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 124 {'a': 4, 'literal': 6, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 124, 'op': 'addl'}
    instructions[631] = {5'd1, 4'd2, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 124 {'a': 8, 'literal': 0, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 124, 'op': 'addl'}
    instructions[632] = {5'd5, 4'd8, 4'd2, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 124 {'a': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 124, 'op': 'load'}
    instructions[633] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 124 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 124, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[634] = {5'd5, 4'd10, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 124 {'a': 3, 'z': 10, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 124, 'op': 'load'}
    instructions[635] = {5'd16, 4'd8, 4'd8, 16'd10};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 124 {'a': 8, 'z': 8, 'b': 10, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 124, 'op': 'or'}
    instructions[636] = {5'd1, 4'd2, 4'd4, 16'd6};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 124 {'a': 4, 'literal': 6, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 124, 'op': 'addl'}
    instructions[637] = {5'd2, 4'd0, 4'd2, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 124 {'a': 2, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 124, 'op': 'store'}
    instructions[638] = {5'd0, 4'd8, 4'd0, 16'd32768};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 125 {'literal': 32768, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 125, 'op': 'literal'}
    instructions[639] = {5'd17, 4'd8, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 125 {'a': 8, 'literal': 0, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 125, 'op': 'literal_hi'}
    instructions[640] = {5'd2, 4'd0, 4'd3, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 125 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 125, 'op': 'store'}
    instructions[641] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 125 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 125, 'op': 'addl'}
    instructions[642] = {5'd1, 4'd8, 4'd4, 16'd6};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 125 {'a': 4, 'literal': 6, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 125, 'op': 'addl'}
    instructions[643] = {5'd1, 4'd2, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 125 {'a': 8, 'literal': 0, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 125, 'op': 'addl'}
    instructions[644] = {5'd5, 4'd8, 4'd2, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 125 {'a': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 125, 'op': 'load'}
    instructions[645] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 125 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 125, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[646] = {5'd5, 4'd10, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 125 {'a': 3, 'z': 10, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 125, 'op': 'load'}
    instructions[647] = {5'd12, 4'd8, 4'd8, 16'd10};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 125 {'a': 8, 'z': 8, 'b': 10, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 125, 'op': 'subtract'}
    instructions[648] = {5'd1, 4'd2, 4'd4, 16'd6};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 125 {'a': 4, 'literal': 6, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 125, 'op': 'addl'}
    instructions[649] = {5'd2, 4'd0, 4'd2, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 125 {'a': 2, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 125, 'op': 'store'}
    instructions[650] = {5'd1, 4'd8, 4'd4, 16'd4};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 126 {'a': 4, 'literal': 4, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 126, 'op': 'addl'}
    instructions[651] = {5'd1, 4'd2, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 126 {'a': 8, 'literal': 0, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 126, 'op': 'addl'}
    instructions[652] = {5'd5, 4'd8, 4'd2, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 126 {'a': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 126, 'op': 'load'}
    instructions[653] = {5'd2, 4'd0, 4'd3, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 126 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 126, 'op': 'store'}
    instructions[654] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 126 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 126, 'op': 'addl'}
    instructions[655] = {5'd11, 4'd8, 4'd0, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 126 {'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 126, 'op': 'timer_low'}
    instructions[656] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 126 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 126, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[657] = {5'd5, 4'd10, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 126 {'a': 3, 'z': 10, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 126, 'op': 'load'}
    instructions[658] = {5'd12, 4'd8, 4'd8, 16'd10};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 126 {'a': 8, 'z': 8, 'b': 10, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 126, 'op': 'subtract'}
    instructions[659] = {5'd2, 4'd0, 4'd3, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 126 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 126, 'op': 'store'}
    instructions[660] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 126 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 126, 'op': 'addl'}
    instructions[661] = {5'd1, 4'd8, 4'd4, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 126 {'a': 4, 'literal': 1, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 126, 'op': 'addl'}
    instructions[662] = {5'd1, 4'd2, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 126 {'a': 8, 'literal': 0, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 126, 'op': 'addl'}
    instructions[663] = {5'd5, 4'd8, 4'd2, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 126 {'a': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 126, 'op': 'load'}
    instructions[664] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 126 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 126, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[665] = {5'd5, 4'd10, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 126 {'a': 3, 'z': 10, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 126, 'op': 'load'}
    instructions[666] = {5'd13, 4'd8, 4'd8, 16'd10};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 126 {'a': 8, 'z': 8, 'b': 10, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 126, 'op': 'unsigned_greater'}
    instructions[667] = {5'd14, 4'd0, 4'd8, 16'd669};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 127 {'a': 8, 'label': 669, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 127, 'op': 'jmp_if_false'}
    instructions[668] = {5'd8, 4'd0, 4'd0, 16'd670};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 127 {'label': 670, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 127, 'op': 'goto'}
    instructions[669] = {5'd8, 4'd0, 4'd0, 16'd671};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 127 {'label': 671, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 127, 'op': 'goto'}
    instructions[670] = {5'd8, 4'd0, 4'd0, 16'd650};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 126 {'label': 650, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 126, 'op': 'goto'}
    instructions[671] = {5'd1, 4'd8, 4'd4, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 127 {'a': 4, 'literal': 1, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 127, 'op': 'addl'}
    instructions[672] = {5'd1, 4'd2, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 127 {'a': 8, 'literal': 0, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 127, 'op': 'addl'}
    instructions[673] = {5'd5, 4'd8, 4'd2, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 127 {'a': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 127, 'op': 'load'}
    instructions[674] = {5'd2, 4'd0, 4'd3, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 127 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 127, 'op': 'store'}
    instructions[675] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 127 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 127, 'op': 'addl'}
    instructions[676] = {5'd1, 4'd8, 4'd4, 16'd4};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 127 {'a': 4, 'literal': 4, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 127, 'op': 'addl'}
    instructions[677] = {5'd1, 4'd2, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 127 {'a': 8, 'literal': 0, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 127, 'op': 'addl'}
    instructions[678] = {5'd5, 4'd8, 4'd2, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 127 {'a': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 127, 'op': 'load'}
    instructions[679] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 127 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 127, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[680] = {5'd5, 4'd10, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 127 {'a': 3, 'z': 10, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 127, 'op': 'load'}
    instructions[681] = {5'd18, 4'd8, 4'd8, 16'd10};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 127 {'a': 8, 'z': 8, 'b': 10, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 127, 'op': 'add'}
    instructions[682] = {5'd1, 4'd2, 4'd4, 16'd4};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 127 {'a': 4, 'literal': 4, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 127, 'op': 'addl'}
    instructions[683] = {5'd2, 4'd0, 4'd2, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 127 {'a': 2, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 127, 'op': 'store'}
    instructions[684] = {5'd2, 4'd0, 4'd3, 16'd6};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 128 {'a': 3, 'comment': 'push', 'b': 6, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 128, 'op': 'store'}
    instructions[685] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 128 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 128, 'op': 'addl'}
    instructions[686] = {5'd2, 4'd0, 4'd3, 16'd7};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 128 {'a': 3, 'comment': 'push', 'b': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 128, 'op': 'store'}
    instructions[687] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 128 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 128, 'op': 'addl'}
    instructions[688] = {5'd1, 4'd8, 4'd4, 16'd6};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 128 {'a': 4, 'literal': 6, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 128, 'op': 'addl'}
    instructions[689] = {5'd1, 4'd2, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 128 {'a': 8, 'literal': 0, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 128, 'op': 'addl'}
    instructions[690] = {5'd5, 4'd8, 4'd2, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 128 {'a': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 128, 'op': 'load'}
    instructions[691] = {5'd2, 4'd0, 4'd3, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 128 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 128, 'op': 'store'}
    instructions[692] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 128 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 128, 'op': 'addl'}
    instructions[693] = {5'd1, 4'd8, 4'd4, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 128 {'a': 4, 'literal': 0, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 128, 'op': 'addl'}
    instructions[694] = {5'd1, 4'd2, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 128 {'a': 8, 'literal': 0, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 128, 'op': 'addl'}
    instructions[695] = {5'd5, 4'd8, 4'd2, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 128 {'a': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 128, 'op': 'load'}
    instructions[696] = {5'd2, 4'd0, 4'd3, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 128 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 128, 'op': 'store'}
    instructions[697] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 128 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 128, 'op': 'addl'}
    instructions[698] = {5'd1, 4'd8, 4'd4, 16'd2};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 128 {'a': 4, 'literal': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 128, 'op': 'addl'}
    instructions[699] = {5'd1, 4'd2, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 128 {'a': 8, 'literal': 0, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 128, 'op': 'addl'}
    instructions[700] = {5'd5, 4'd8, 4'd2, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 128 {'a': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 128, 'op': 'load'}
    instructions[701] = {5'd2, 4'd0, 4'd3, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 128 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 128, 'op': 'store'}
    instructions[702] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 128 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 128, 'op': 'addl'}
    instructions[703] = {5'd1, 4'd7, 4'd4, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 128 {'a': 4, 'literal': 0, 'z': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 128, 'op': 'addl'}
    instructions[704] = {5'd1, 4'd4, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 128 {'a': 3, 'literal': 0, 'z': 4, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 128, 'op': 'addl'}
    instructions[705] = {5'd3, 4'd6, 4'd0, 16'd1250};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 128 {'z': 6, 'label': 1250, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 128, 'op': 'call'}
    instructions[706] = {5'd1, 4'd3, 4'd3, -16'd3};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 128 {'a': 3, 'literal': -3, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 128, 'op': 'addl'}
    instructions[707] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 128 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 128, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[708] = {5'd5, 4'd7, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 128 {'a': 3, 'z': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 128, 'op': 'load'}
    instructions[709] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 128 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 128, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[710] = {5'd5, 4'd6, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 128 {'a': 3, 'z': 6, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 128, 'op': 'load'}
    instructions[711] = {5'd1, 4'd3, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 128 {'a': 3, 'literal': 0, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 128, 'op': 'addl'}
    instructions[712] = {5'd8, 4'd0, 4'd0, 16'd793};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 129 {'label': 793, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 129, 'op': 'goto'}
    instructions[713] = {5'd0, 4'd8, 4'd0, 16'd33};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 134 {'literal': 33, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 134, 'op': 'literal'}
    instructions[714] = {5'd1, 4'd2, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 134 {'a': 8, 'literal': 0, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 134, 'op': 'addl'}
    instructions[715] = {5'd5, 4'd8, 4'd2, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 134 {'a': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 134, 'op': 'load'}
    instructions[716] = {5'd2, 4'd0, 4'd3, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 134 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 134, 'op': 'store'}
    instructions[717] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 134 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 134, 'op': 'addl'}
    instructions[718] = {5'd1, 4'd8, 4'd4, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 134 {'a': 4, 'literal': 0, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 134, 'op': 'addl'}
    instructions[719] = {5'd1, 4'd2, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 134 {'a': 8, 'literal': 0, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 134, 'op': 'addl'}
    instructions[720] = {5'd5, 4'd8, 4'd2, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 134 {'a': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 134, 'op': 'load'}
    instructions[721] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 134 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 134, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[722] = {5'd5, 4'd0, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 134 {'a': 3, 'z': 0, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 134, 'op': 'load'}
    instructions[723] = {5'd10, 4'd0, 4'd0, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 134 {'a': 0, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 134, 'op': 'write'}
    instructions[724] = {5'd1, 4'd3, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 134 {'a': 3, 'literal': 0, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 134, 'op': 'addl'}
    instructions[725] = {5'd0, 4'd8, 4'd0, 16'd128};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 135 {'literal': 128, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 135, 'op': 'literal'}
    instructions[726] = {5'd2, 4'd0, 4'd3, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 135 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 135, 'op': 'store'}
    instructions[727] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 135 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 135, 'op': 'addl'}
    instructions[728] = {5'd2, 4'd0, 4'd3, 16'd6};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 135 {'a': 3, 'comment': 'push', 'b': 6, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 135, 'op': 'store'}
    instructions[729] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 135 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 135, 'op': 'addl'}
    instructions[730] = {5'd2, 4'd0, 4'd3, 16'd7};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 135 {'a': 3, 'comment': 'push', 'b': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 135, 'op': 'store'}
    instructions[731] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 135 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 135, 'op': 'addl'}
    instructions[732] = {5'd1, 4'd7, 4'd4, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 135 {'a': 4, 'literal': 0, 'z': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 135, 'op': 'addl'}
    instructions[733] = {5'd1, 4'd4, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 135 {'a': 3, 'literal': 0, 'z': 4, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 135, 'op': 'addl'}
    instructions[734] = {5'd3, 4'd6, 4'd0, 16'd832};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 135 {'z': 6, 'label': 832, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 135, 'op': 'call'}
    instructions[735] = {5'd1, 4'd3, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 135 {'a': 3, 'literal': 0, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 135, 'op': 'addl'}
    instructions[736] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 135 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 135, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[737] = {5'd5, 4'd7, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 135 {'a': 3, 'z': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 135, 'op': 'load'}
    instructions[738] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 135 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 135, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[739] = {5'd5, 4'd6, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 135 {'a': 3, 'z': 6, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 135, 'op': 'load'}
    instructions[740] = {5'd0, 4'd2, 4'd0, 16'd12};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 135 {'literal': 12, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 135, 'op': 'literal'}
    instructions[741] = {5'd5, 4'd8, 4'd2, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 135 {'a': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 135, 'op': 'load'}
    instructions[742] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 135 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 135, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[743] = {5'd5, 4'd10, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 135 {'a': 3, 'z': 10, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 135, 'op': 'load'}
    instructions[744] = {5'd12, 4'd8, 4'd8, 16'd10};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 135 {'a': 8, 'z': 8, 'b': 10, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 135, 'op': 'subtract'}
    instructions[745] = {5'd1, 4'd2, 4'd4, 16'd7};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 135 {'a': 4, 'literal': 7, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 135, 'op': 'addl'}
    instructions[746] = {5'd2, 4'd0, 4'd2, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 135 {'a': 2, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 135, 'op': 'store'}
    instructions[747] = {5'd0, 4'd8, 4'd0, 16'd128};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 136 {'literal': 128, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 136, 'op': 'literal'}
    instructions[748] = {5'd2, 4'd0, 4'd3, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 136 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 136, 'op': 'store'}
    instructions[749] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 136 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 136, 'op': 'addl'}
    instructions[750] = {5'd2, 4'd0, 4'd3, 16'd6};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 136 {'a': 3, 'comment': 'push', 'b': 6, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 136, 'op': 'store'}
    instructions[751] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 136 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 136, 'op': 'addl'}
    instructions[752] = {5'd2, 4'd0, 4'd3, 16'd7};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 136 {'a': 3, 'comment': 'push', 'b': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 136, 'op': 'store'}
    instructions[753] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 136 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 136, 'op': 'addl'}
    instructions[754] = {5'd1, 4'd7, 4'd4, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 136 {'a': 4, 'literal': 0, 'z': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 136, 'op': 'addl'}
    instructions[755] = {5'd1, 4'd4, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 136 {'a': 3, 'literal': 0, 'z': 4, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 136, 'op': 'addl'}
    instructions[756] = {5'd3, 4'd6, 4'd0, 16'd832};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 136 {'z': 6, 'label': 832, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 136, 'op': 'call'}
    instructions[757] = {5'd1, 4'd3, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 136 {'a': 3, 'literal': 0, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 136, 'op': 'addl'}
    instructions[758] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 136 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 136, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[759] = {5'd5, 4'd7, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 136 {'a': 3, 'z': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 136, 'op': 'load'}
    instructions[760] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 136 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 136, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[761] = {5'd5, 4'd6, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 136 {'a': 3, 'z': 6, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 136, 'op': 'load'}
    instructions[762] = {5'd0, 4'd2, 4'd0, 16'd12};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 136 {'literal': 12, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 136, 'op': 'literal'}
    instructions[763] = {5'd5, 4'd8, 4'd2, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 136 {'a': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 136, 'op': 'load'}
    instructions[764] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 136 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 136, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[765] = {5'd5, 4'd10, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 136 {'a': 3, 'z': 10, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 136, 'op': 'load'}
    instructions[766] = {5'd12, 4'd8, 4'd8, 16'd10};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 136 {'a': 8, 'z': 8, 'b': 10, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 136, 'op': 'subtract'}
    instructions[767] = {5'd1, 4'd2, 4'd4, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 136 {'a': 4, 'literal': 8, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 136, 'op': 'addl'}
    instructions[768] = {5'd2, 4'd0, 4'd2, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 136 {'a': 2, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 136, 'op': 'store'}
    instructions[769] = {5'd2, 4'd0, 4'd3, 16'd6};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 137 {'a': 3, 'comment': 'push', 'b': 6, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 137, 'op': 'store'}
    instructions[770] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 137 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 137, 'op': 'addl'}
    instructions[771] = {5'd2, 4'd0, 4'd3, 16'd7};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 137 {'a': 3, 'comment': 'push', 'b': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 137, 'op': 'store'}
    instructions[772] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 137 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 137, 'op': 'addl'}
    instructions[773] = {5'd1, 4'd8, 4'd4, 16'd7};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 137 {'a': 4, 'literal': 7, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 137, 'op': 'addl'}
    instructions[774] = {5'd1, 4'd2, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 137 {'a': 8, 'literal': 0, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 137, 'op': 'addl'}
    instructions[775] = {5'd5, 4'd8, 4'd2, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 137 {'a': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 137, 'op': 'load'}
    instructions[776] = {5'd2, 4'd0, 4'd3, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 137 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 137, 'op': 'store'}
    instructions[777] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 137 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 137, 'op': 'addl'}
    instructions[778] = {5'd1, 4'd8, 4'd4, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 137 {'a': 4, 'literal': 8, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 137, 'op': 'addl'}
    instructions[779] = {5'd1, 4'd2, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 137 {'a': 8, 'literal': 0, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 137, 'op': 'addl'}
    instructions[780] = {5'd5, 4'd8, 4'd2, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 137 {'a': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 137, 'op': 'load'}
    instructions[781] = {5'd2, 4'd0, 4'd3, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 137 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 137, 'op': 'store'}
    instructions[782] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 137 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 137, 'op': 'addl'}
    instructions[783] = {5'd1, 4'd7, 4'd4, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 137 {'a': 4, 'literal': 0, 'z': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 137, 'op': 'addl'}
    instructions[784] = {5'd1, 4'd4, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 137 {'a': 3, 'literal': 0, 'z': 4, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 137, 'op': 'addl'}
    instructions[785] = {5'd3, 4'd6, 4'd0, 16'd1396};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 137 {'z': 6, 'label': 1396, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 137, 'op': 'call'}
    instructions[786] = {5'd1, 4'd3, 4'd3, -16'd2};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 137 {'a': 3, 'literal': -2, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 137, 'op': 'addl'}
    instructions[787] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 137 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 137, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[788] = {5'd5, 4'd7, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 137 {'a': 3, 'z': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 137, 'op': 'load'}
    instructions[789] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 137 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 137, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[790] = {5'd5, 4'd6, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 137 {'a': 3, 'z': 6, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 137, 'op': 'load'}
    instructions[791] = {5'd1, 4'd3, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 137 {'a': 3, 'literal': 0, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 137, 'op': 'addl'}
    instructions[792] = {5'd8, 4'd0, 4'd0, 16'd793};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 139 {'label': 793, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 139, 'op': 'goto'}
    instructions[793] = {5'd8, 4'd0, 4'd0, 16'd160};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 65 {'label': 160, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 65, 'op': 'goto'}
    instructions[794] = {5'd1, 4'd3, 4'd4, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 50 {'a': 4, 'literal': 0, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 50, 'op': 'addl'}
    instructions[795] = {5'd1, 4'd4, 4'd7, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 50 {'a': 7, 'literal': 0, 'z': 4, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 50, 'op': 'addl'}
    instructions[796] = {5'd19, 4'd0, 4'd6, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 50 {'a': 6, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 50, 'op': 'return'}
    instructions[797] = {5'd1, 4'd3, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 21 {'a': 3, 'literal': 0, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 21, 'op': 'addl'}
    instructions[798] = {5'd0, 4'd8, 4'd0, 16'd61568};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 23 {'literal': 61568, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 23, 'op': 'literal'}
    instructions[799] = {5'd17, 4'd8, 4'd8, 16'd762};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 23 {'a': 8, 'literal': 762, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 23, 'op': 'literal_hi'}
    instructions[800] = {5'd20, 4'd0, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 23 {'a': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 23, 'op': 'wait_clocks'}
    instructions[801] = {5'd0, 4'd8, 4'd0, 16'd29};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 24 {'literal': 29, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 24, 'op': 'literal'}
    instructions[802] = {5'd1, 4'd2, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 24 {'a': 8, 'literal': 0, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 24, 'op': 'addl'}
    instructions[803] = {5'd5, 4'd8, 4'd2, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 24 {'a': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 24, 'op': 'load'}
    instructions[804] = {5'd21, 4'd8, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 24 {'a': 8, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 24, 'op': 'ready'}
    instructions[805] = {5'd14, 4'd0, 4'd8, 16'd814};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 28 {'a': 8, 'label': 814, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 28, 'op': 'jmp_if_false'}
    instructions[806] = {5'd0, 4'd8, 4'd0, 16'd29};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 25 {'literal': 29, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 25, 'op': 'literal'}
    instructions[807] = {5'd1, 4'd2, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 25 {'a': 8, 'literal': 0, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 25, 'op': 'addl'}
    instructions[808] = {5'd5, 4'd8, 4'd2, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 25 {'a': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 25, 'op': 'load'}
    instructions[809] = {5'd9, 4'd8, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 25 {'a': 8, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 25, 'op': 'read'}
    instructions[810] = {5'd0, 4'd8, 4'd0, 16'd38528};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 26 {'literal': 38528, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 26, 'op': 'literal'}
    instructions[811] = {5'd17, 4'd8, 4'd8, 16'd152};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 26 {'a': 8, 'literal': 152, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 26, 'op': 'literal_hi'}
    instructions[812] = {5'd20, 4'd0, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 26 {'a': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 26, 'op': 'wait_clocks'}
    instructions[813] = {5'd8, 4'd0, 4'd0, 16'd815};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 28 {'label': 815, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 28, 'op': 'goto'}
    instructions[814] = {5'd8, 4'd0, 4'd0, 16'd816};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 28 {'label': 816, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 28, 'op': 'goto'}
    instructions[815] = {5'd8, 4'd0, 4'd0, 16'd801};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 24 {'label': 801, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 24, 'op': 'goto'}
    instructions[816] = {5'd0, 4'd8, 4'd0, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 28 {'literal': 0, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 28, 'op': 'literal'}
    instructions[817] = {5'd2, 4'd0, 4'd3, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 28 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 28, 'op': 'store'}
    instructions[818] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 28 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 28, 'op': 'addl'}
    instructions[819] = {5'd0, 4'd8, 4'd0, 16'd29};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 28 {'literal': 29, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 28, 'op': 'literal'}
    instructions[820] = {5'd1, 4'd2, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 28 {'a': 8, 'literal': 0, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 28, 'op': 'addl'}
    instructions[821] = {5'd5, 4'd8, 4'd2, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 28 {'a': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 28, 'op': 'load'}
    instructions[822] = {5'd21, 4'd8, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 28 {'a': 8, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 28, 'op': 'ready'}
    instructions[823] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 28 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 28, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[824] = {5'd5, 4'd10, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 28 {'a': 3, 'z': 10, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 28, 'op': 'load'}
    instructions[825] = {5'd6, 4'd8, 4'd8, 16'd10};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 28 {'a': 8, 'z': 8, 'b': 10, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 28, 'op': 'equal'}
    instructions[826] = {5'd14, 4'd0, 4'd8, 16'd831};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 28 {'a': 8, 'label': 831, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 28, 'op': 'jmp_if_false'}
    instructions[827] = {5'd1, 4'd3, 4'd4, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 28 {'a': 4, 'literal': 0, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 28, 'op': 'addl'}
    instructions[828] = {5'd1, 4'd4, 4'd7, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 28 {'a': 7, 'literal': 0, 'z': 4, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 28, 'op': 'addl'}
    instructions[829] = {5'd19, 4'd0, 4'd6, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 28 {'a': 6, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 28, 'op': 'return'}
    instructions[830] = {5'd8, 4'd0, 4'd0, 16'd831};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 28 {'label': 831, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 28, 'op': 'goto'}
    instructions[831] = {5'd8, 4'd0, 4'd0, 16'd798};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 22 {'label': 798, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 22, 'op': 'goto'}
    instructions[832] = {5'd1, 4'd3, 4'd3, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 84 {'a': 3, 'literal': 0, 'z': 3, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 84, 'op': 'addl'}
    instructions[833] = {5'd0, 4'd8, 4'd0, 16'd29};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 85 {'literal': 29, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 85, 'op': 'literal'}
    instructions[834] = {5'd1, 4'd2, 4'd8, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 85 {'a': 8, 'literal': 0, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 85, 'op': 'addl'}
    instructions[835] = {5'd5, 4'd8, 4'd2, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 85 {'a': 2, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 85, 'op': 'load'}
    instructions[836] = {5'd9, 4'd8, 4'd8, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 85 {'a': 8, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 85, 'op': 'read'}
    instructions[837] = {5'd0, 4'd2, 4'd0, 16'd12};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 85 {'literal': 12, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 85, 'op': 'literal'}
    instructions[838] = {5'd2, 4'd0, 4'd2, 16'd8};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 85 {'a': 2, 'b': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 85, 'op': 'store'}
    instructions[839] = {5'd1, 4'd3, 4'd4, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 85 {'a': 4, 'literal': 0, 'z': 3, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 85, 'op': 'addl'}
    instructions[840] = {5'd1, 4'd4, 4'd7, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 85 {'a': 7, 'literal': 0, 'z': 4, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 85, 'op': 'addl'}
    instructions[841] = {5'd19, 4'd0, 4'd6, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 85 {'a': 6, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 85, 'op': 'return'}
    instructions[842] = {5'd1, 4'd3, 4'd3, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 73 {'a': 3, 'literal': 0, 'z': 3, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 73, 'op': 'addl'}
    instructions[843] = {5'd2, 4'd0, 4'd3, 16'd6};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 74 {'a': 3, 'comment': 'push', 'b': 6, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 74, 'op': 'store'}
    instructions[844] = {5'd1, 4'd3, 4'd3, 16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 74 {'a': 3, 'literal': 1, 'z': 3, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 74, 'op': 'addl'}
    instructions[845] = {5'd2, 4'd0, 4'd3, 16'd7};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 74 {'a': 3, 'comment': 'push', 'b': 7, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 74, 'op': 'store'}
    instructions[846] = {5'd1, 4'd3, 4'd3, 16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 74 {'a': 3, 'literal': 1, 'z': 3, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 74, 'op': 'addl'}
    instructions[847] = {5'd1, 4'd8, 4'd4, -16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 74 {'a': 4, 'literal': -1, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 74, 'op': 'addl'}
    instructions[848] = {5'd1, 4'd2, 4'd8, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 74 {'a': 8, 'literal': 0, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 74, 'op': 'addl'}
    instructions[849] = {5'd5, 4'd8, 4'd2, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 74 {'a': 2, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 74, 'op': 'load'}
    instructions[850] = {5'd2, 4'd0, 4'd3, 16'd8};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 74 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 74, 'op': 'store'}
    instructions[851] = {5'd1, 4'd3, 4'd3, 16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 74 {'a': 3, 'literal': 1, 'z': 3, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 74, 'op': 'addl'}
    instructions[852] = {5'd0, 4'd8, 4'd0, 16'd11};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 74 {'literal': 11, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 74, 'op': 'literal'}
    instructions[853] = {5'd1, 4'd2, 4'd8, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 74 {'a': 8, 'literal': 0, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 74, 'op': 'addl'}
    instructions[854] = {5'd5, 4'd8, 4'd2, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 74 {'a': 2, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 74, 'op': 'load'}
    instructions[855] = {5'd2, 4'd0, 4'd3, 16'd8};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 74 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 74, 'op': 'store'}
    instructions[856] = {5'd1, 4'd3, 4'd3, 16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 74 {'a': 3, 'literal': 1, 'z': 3, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 74, 'op': 'addl'}
    instructions[857] = {5'd1, 4'd7, 4'd4, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 74 {'a': 4, 'literal': 0, 'z': 7, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 74, 'op': 'addl'}
    instructions[858] = {5'd1, 4'd4, 4'd3, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 74 {'a': 3, 'literal': 0, 'z': 4, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 74, 'op': 'addl'}
    instructions[859] = {5'd3, 4'd6, 4'd0, 16'd869};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 74 {'z': 6, 'label': 869, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 74, 'op': 'call'}
    instructions[860] = {5'd1, 4'd3, 4'd3, -16'd2};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 74 {'a': 3, 'literal': -2, 'z': 3, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 74, 'op': 'addl'}
    instructions[861] = {5'd1, 4'd3, 4'd3, -16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 74 {'a': 3, 'comment': 'pop', 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 74, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[862] = {5'd5, 4'd7, 4'd3, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 74 {'a': 3, 'z': 7, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 74, 'op': 'load'}
    instructions[863] = {5'd1, 4'd3, 4'd3, -16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 74 {'a': 3, 'comment': 'pop', 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 74, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[864] = {5'd5, 4'd6, 4'd3, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 74 {'a': 3, 'z': 6, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 74, 'op': 'load'}
    instructions[865] = {5'd1, 4'd3, 4'd3, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 74 {'a': 3, 'literal': 0, 'z': 3, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 74, 'op': 'addl'}
    instructions[866] = {5'd1, 4'd3, 4'd4, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 73 {'a': 4, 'literal': 0, 'z': 3, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 73, 'op': 'addl'}
    instructions[867] = {5'd1, 4'd4, 4'd7, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 73 {'a': 7, 'literal': 0, 'z': 4, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 73, 'op': 'addl'}
    instructions[868] = {5'd19, 4'd0, 4'd6, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 73 {'a': 6, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 73, 'op': 'return'}
    instructions[869] = {5'd1, 4'd3, 4'd3, 16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 23 {'a': 3, 'literal': 1, 'z': 3, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 23, 'op': 'addl'}
    instructions[870] = {5'd0, 4'd8, 4'd0, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 24 {'literal': 0, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 24, 'op': 'literal'}
    instructions[871] = {5'd1, 4'd2, 4'd4, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 24 {'a': 4, 'literal': 0, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 24, 'op': 'addl'}
    instructions[872] = {5'd2, 4'd0, 4'd2, 16'd8};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 24 {'a': 2, 'b': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 24, 'op': 'store'}
    instructions[873] = {5'd1, 4'd8, 4'd4, -16'd2};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 25 {'a': 4, 'literal': -2, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 25, 'op': 'addl'}
    instructions[874] = {5'd1, 4'd2, 4'd8, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 25 {'a': 8, 'literal': 0, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 25, 'op': 'addl'}
    instructions[875] = {5'd5, 4'd8, 4'd2, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 25 {'a': 2, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 25, 'op': 'load'}
    instructions[876] = {5'd2, 4'd0, 4'd3, 16'd8};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 25 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 25, 'op': 'store'}
    instructions[877] = {5'd1, 4'd3, 4'd3, 16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 25 {'a': 3, 'literal': 1, 'z': 3, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 25, 'op': 'addl'}
    instructions[878] = {5'd1, 4'd8, 4'd4, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 25 {'a': 4, 'literal': 0, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 25, 'op': 'addl'}
    instructions[879] = {5'd1, 4'd2, 4'd8, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 25 {'a': 8, 'literal': 0, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 25, 'op': 'addl'}
    instructions[880] = {5'd5, 4'd8, 4'd2, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 25 {'a': 2, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 25, 'op': 'load'}
    instructions[881] = {5'd1, 4'd3, 4'd3, -16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 25 {'a': 3, 'comment': 'pop', 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 25, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[882] = {5'd5, 4'd2, 4'd3, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 25 {'a': 3, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 25, 'op': 'load'}
    instructions[883] = {5'd18, 4'd8, 4'd8, 16'd2};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 25 {'a': 8, 'z': 8, 'b': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 25, 'op': 'add'}
    instructions[884] = {5'd1, 4'd2, 4'd8, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 25 {'a': 8, 'literal': 0, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 25, 'op': 'addl'}
    instructions[885] = {5'd5, 4'd8, 4'd2, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 25 {'a': 2, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 25, 'op': 'load'}
    instructions[886] = {5'd14, 4'd0, 4'd8, 16'd928};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 29 {'a': 8, 'label': 928, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 29, 'op': 'jmp_if_false'}
    instructions[887] = {5'd1, 4'd8, 4'd4, -16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 26 {'a': 4, 'literal': -1, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 26, 'op': 'addl'}
    instructions[888] = {5'd1, 4'd2, 4'd8, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 26 {'a': 8, 'literal': 0, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 26, 'op': 'addl'}
    instructions[889] = {5'd5, 4'd8, 4'd2, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 26 {'a': 2, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 26, 'op': 'load'}
    instructions[890] = {5'd2, 4'd0, 4'd3, 16'd8};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 26 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 26, 'op': 'store'}
    instructions[891] = {5'd1, 4'd3, 4'd3, 16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 26 {'a': 3, 'literal': 1, 'z': 3, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 26, 'op': 'addl'}
    instructions[892] = {5'd1, 4'd8, 4'd4, -16'd2};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 26 {'a': 4, 'literal': -2, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 26, 'op': 'addl'}
    instructions[893] = {5'd1, 4'd2, 4'd8, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 26 {'a': 8, 'literal': 0, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 26, 'op': 'addl'}
    instructions[894] = {5'd5, 4'd8, 4'd2, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 26 {'a': 2, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 26, 'op': 'load'}
    instructions[895] = {5'd2, 4'd0, 4'd3, 16'd8};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 26 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 26, 'op': 'store'}
    instructions[896] = {5'd1, 4'd3, 4'd3, 16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 26 {'a': 3, 'literal': 1, 'z': 3, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 26, 'op': 'addl'}
    instructions[897] = {5'd1, 4'd8, 4'd4, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 26 {'a': 4, 'literal': 0, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 26, 'op': 'addl'}
    instructions[898] = {5'd1, 4'd2, 4'd8, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 26 {'a': 8, 'literal': 0, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 26, 'op': 'addl'}
    instructions[899] = {5'd5, 4'd8, 4'd2, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 26 {'a': 2, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 26, 'op': 'load'}
    instructions[900] = {5'd1, 4'd3, 4'd3, -16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 26 {'a': 3, 'comment': 'pop', 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 26, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[901] = {5'd5, 4'd2, 4'd3, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 26 {'a': 3, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 26, 'op': 'load'}
    instructions[902] = {5'd18, 4'd8, 4'd8, 16'd2};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 26 {'a': 8, 'z': 8, 'b': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 26, 'op': 'add'}
    instructions[903] = {5'd1, 4'd2, 4'd8, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 26 {'a': 8, 'literal': 0, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 26, 'op': 'addl'}
    instructions[904] = {5'd5, 4'd8, 4'd2, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 26 {'a': 2, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 26, 'op': 'load'}
    instructions[905] = {5'd1, 4'd3, 4'd3, -16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 26 {'a': 3, 'comment': 'pop', 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 26, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[906] = {5'd5, 4'd0, 4'd3, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 26 {'a': 3, 'z': 0, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 26, 'op': 'load'}
    instructions[907] = {5'd10, 4'd0, 4'd0, 16'd8};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 26 {'a': 0, 'b': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 26, 'op': 'write'}
    instructions[908] = {5'd1, 4'd3, 4'd3, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 26 {'a': 3, 'literal': 0, 'z': 3, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 26, 'op': 'addl'}
    instructions[909] = {5'd1, 4'd8, 4'd4, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 27 {'a': 4, 'literal': 0, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 27, 'op': 'addl'}
    instructions[910] = {5'd1, 4'd2, 4'd8, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 27 {'a': 8, 'literal': 0, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 27, 'op': 'addl'}
    instructions[911] = {5'd5, 4'd8, 4'd2, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 27 {'a': 2, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 27, 'op': 'load'}
    instructions[912] = {5'd2, 4'd0, 4'd3, 16'd8};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 27 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 27, 'op': 'store'}
    instructions[913] = {5'd1, 4'd3, 4'd3, 16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 27 {'a': 3, 'literal': 1, 'z': 3, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 27, 'op': 'addl'}
    instructions[914] = {5'd0, 4'd8, 4'd0, 16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 27 {'literal': 1, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 27, 'op': 'literal'}
    instructions[915] = {5'd2, 4'd0, 4'd3, 16'd8};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 27 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 27, 'op': 'store'}
    instructions[916] = {5'd1, 4'd3, 4'd3, 16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 27 {'a': 3, 'literal': 1, 'z': 3, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 27, 'op': 'addl'}
    instructions[917] = {5'd1, 4'd8, 4'd4, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 27 {'a': 4, 'literal': 0, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 27, 'op': 'addl'}
    instructions[918] = {5'd1, 4'd2, 4'd8, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 27 {'a': 8, 'literal': 0, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 27, 'op': 'addl'}
    instructions[919] = {5'd5, 4'd8, 4'd2, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 27 {'a': 2, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 27, 'op': 'load'}
    instructions[920] = {5'd1, 4'd3, 4'd3, -16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 27 {'a': 3, 'comment': 'pop', 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 27, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[921] = {5'd5, 4'd10, 4'd3, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 27 {'a': 3, 'z': 10, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 27, 'op': 'load'}
    instructions[922] = {5'd18, 4'd8, 4'd8, 16'd10};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 27 {'a': 8, 'z': 8, 'b': 10, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 27, 'op': 'add'}
    instructions[923] = {5'd1, 4'd2, 4'd4, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 27 {'a': 4, 'literal': 0, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 27, 'op': 'addl'}
    instructions[924] = {5'd2, 4'd0, 4'd2, 16'd8};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 27 {'a': 2, 'b': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 27, 'op': 'store'}
    instructions[925] = {5'd1, 4'd3, 4'd3, -16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 27 {'a': 3, 'comment': 'pop', 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 27, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[926] = {5'd5, 4'd8, 4'd3, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 27 {'a': 3, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 27, 'op': 'load'}
    instructions[927] = {5'd8, 4'd0, 4'd0, 16'd929};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 29 {'label': 929, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 29, 'op': 'goto'}
    instructions[928] = {5'd8, 4'd0, 4'd0, 16'd930};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 29 {'label': 930, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 29, 'op': 'goto'}
    instructions[929] = {5'd8, 4'd0, 4'd0, 16'd873};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 25 {'label': 873, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 25, 'op': 'goto'}
    instructions[930] = {5'd1, 4'd3, 4'd4, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 23 {'a': 4, 'literal': 0, 'z': 3, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 23, 'op': 'addl'}
    instructions[931] = {5'd1, 4'd4, 4'd7, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 23 {'a': 7, 'literal': 0, 'z': 4, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 23, 'op': 'addl'}
    instructions[932] = {5'd19, 4'd0, 4'd6, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 23 {'a': 6, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/stdio.h : 23, 'op': 'return'}
    instructions[933] = {5'd1, 4'd3, 4'd3, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 128 {'a': 3, 'literal': 0, 'z': 3, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 128, 'op': 'addl'}
    instructions[934] = {5'd2, 4'd0, 4'd3, 16'd6};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 129 {'a': 3, 'comment': 'push', 'b': 6, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 129, 'op': 'store'}
    instructions[935] = {5'd1, 4'd3, 4'd3, 16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 129 {'a': 3, 'literal': 1, 'z': 3, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 129, 'op': 'addl'}
    instructions[936] = {5'd2, 4'd0, 4'd3, 16'd7};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 129 {'a': 3, 'comment': 'push', 'b': 7, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 129, 'op': 'store'}
    instructions[937] = {5'd1, 4'd3, 4'd3, 16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 129 {'a': 3, 'literal': 1, 'z': 3, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 129, 'op': 'addl'}
    instructions[938] = {5'd1, 4'd8, 4'd4, -16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 129 {'a': 4, 'literal': -1, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 129, 'op': 'addl'}
    instructions[939] = {5'd1, 4'd2, 4'd8, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 129 {'a': 8, 'literal': 0, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 129, 'op': 'addl'}
    instructions[940] = {5'd5, 4'd8, 4'd2, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 129 {'a': 2, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 129, 'op': 'load'}
    instructions[941] = {5'd2, 4'd0, 4'd3, 16'd8};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 129 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 129, 'op': 'store'}
    instructions[942] = {5'd1, 4'd3, 4'd3, 16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 129 {'a': 3, 'literal': 1, 'z': 3, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 129, 'op': 'addl'}
    instructions[943] = {5'd0, 4'd8, 4'd0, 16'd11};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 129 {'literal': 11, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 129, 'op': 'literal'}
    instructions[944] = {5'd1, 4'd2, 4'd8, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 129 {'a': 8, 'literal': 0, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 129, 'op': 'addl'}
    instructions[945] = {5'd5, 4'd8, 4'd2, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 129 {'a': 2, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 129, 'op': 'load'}
    instructions[946] = {5'd2, 4'd0, 4'd3, 16'd8};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 129 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 129, 'op': 'store'}
    instructions[947] = {5'd1, 4'd3, 4'd3, 16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 129 {'a': 3, 'literal': 1, 'z': 3, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 129, 'op': 'addl'}
    instructions[948] = {5'd1, 4'd7, 4'd4, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 129 {'a': 4, 'literal': 0, 'z': 7, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 129, 'op': 'addl'}
    instructions[949] = {5'd1, 4'd4, 4'd3, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 129 {'a': 3, 'literal': 0, 'z': 4, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 129, 'op': 'addl'}
    instructions[950] = {5'd3, 4'd6, 4'd0, 16'd960};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 129 {'z': 6, 'label': 960, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 129, 'op': 'call'}
    instructions[951] = {5'd1, 4'd3, 4'd3, -16'd2};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 129 {'a': 3, 'literal': -2, 'z': 3, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 129, 'op': 'addl'}
    instructions[952] = {5'd1, 4'd3, 4'd3, -16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 129 {'a': 3, 'comment': 'pop', 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 129, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[953] = {5'd5, 4'd7, 4'd3, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 129 {'a': 3, 'z': 7, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 129, 'op': 'load'}
    instructions[954] = {5'd1, 4'd3, 4'd3, -16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 129 {'a': 3, 'comment': 'pop', 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 129, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[955] = {5'd5, 4'd6, 4'd3, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 129 {'a': 3, 'z': 6, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 129, 'op': 'load'}
    instructions[956] = {5'd1, 4'd3, 4'd3, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 129 {'a': 3, 'literal': 0, 'z': 3, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 129, 'op': 'addl'}
    instructions[957] = {5'd1, 4'd3, 4'd4, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 128 {'a': 4, 'literal': 0, 'z': 3, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 128, 'op': 'addl'}
    instructions[958] = {5'd1, 4'd4, 4'd7, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 128 {'a': 7, 'literal': 0, 'z': 4, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 128, 'op': 'addl'}
    instructions[959] = {5'd19, 4'd0, 4'd6, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 128 {'a': 6, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 128, 'op': 'return'}
    instructions[960] = {5'd1, 4'd3, 4'd3, 16'd12};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 16 {'a': 3, 'literal': 12, 'z': 3, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 16, 'op': 'addl'}
    instructions[961] = {5'd0, 4'd8, 4'd0, 16'd51712};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 21 {'literal': 51712, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 21, 'op': 'literal'}
    instructions[962] = {5'd17, 4'd8, 4'd8, 16'd15258};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 21 {'a': 8, 'literal': 15258, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 21, 'op': 'literal_hi'}
    instructions[963] = {5'd1, 4'd2, 4'd4, 16'd10};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 21 {'a': 4, 'literal': 10, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 21, 'op': 'addl'}
    instructions[964] = {5'd2, 4'd0, 4'd2, 16'd8};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 21 {'a': 2, 'b': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 21, 'op': 'store'}
    instructions[965] = {5'd0, 4'd8, 4'd0, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 22 {'literal': 0, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 22, 'op': 'literal'}
    instructions[966] = {5'd1, 4'd2, 4'd4, 16'd11};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 22 {'a': 4, 'literal': 11, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 22, 'op': 'addl'}
    instructions[967] = {5'd2, 4'd0, 4'd2, 16'd8};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 22 {'a': 2, 'b': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 22, 'op': 'store'}
    instructions[968] = {5'd1, 4'd8, 4'd4, 16'd10};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 23 {'a': 4, 'literal': 10, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 23, 'op': 'addl'}
    instructions[969] = {5'd1, 4'd2, 4'd8, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 23 {'a': 8, 'literal': 0, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 23, 'op': 'addl'}
    instructions[970] = {5'd5, 4'd8, 4'd2, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 23 {'a': 2, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 23, 'op': 'load'}
    instructions[971] = {5'd14, 4'd0, 4'd8, 16'd1066};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30 {'a': 8, 'label': 1066, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30, 'op': 'jmp_if_false'}
    instructions[972] = {5'd0, 4'd8, 4'd0, 16'd48};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24 {'literal': 48, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24, 'op': 'literal'}
    instructions[973] = {5'd2, 4'd0, 4'd3, 16'd8};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24, 'op': 'store'}
    instructions[974] = {5'd1, 4'd3, 4'd3, 16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24 {'a': 3, 'literal': 1, 'z': 3, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24, 'op': 'addl'}
    instructions[975] = {5'd0, 4'd8, 4'd0, 16'd15};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24 {'literal': 15, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24, 'op': 'literal'}
    instructions[976] = {5'd2, 4'd0, 4'd3, 16'd8};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24, 'op': 'store'}
    instructions[977] = {5'd1, 4'd3, 4'd3, 16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24 {'a': 3, 'literal': 1, 'z': 3, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24, 'op': 'addl'}
    instructions[978] = {5'd1, 4'd8, 4'd4, 16'd10};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24 {'a': 4, 'literal': 10, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24, 'op': 'addl'}
    instructions[979] = {5'd1, 4'd2, 4'd8, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24 {'a': 8, 'literal': 0, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24, 'op': 'addl'}
    instructions[980] = {5'd5, 4'd8, 4'd2, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24 {'a': 2, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24, 'op': 'load'}
    instructions[981] = {5'd2, 4'd0, 4'd3, 16'd8};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24, 'op': 'store'}
    instructions[982] = {5'd1, 4'd3, 4'd3, 16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24 {'a': 3, 'literal': 1, 'z': 3, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24, 'op': 'addl'}
    instructions[983] = {5'd1, 4'd8, 4'd4, -16'd2};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24 {'a': 4, 'literal': -2, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24, 'op': 'addl'}
    instructions[984] = {5'd1, 4'd2, 4'd8, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24 {'a': 8, 'literal': 0, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24, 'op': 'addl'}
    instructions[985] = {5'd5, 4'd8, 4'd2, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24 {'a': 2, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24, 'op': 'load'}
    instructions[986] = {5'd1, 4'd3, 4'd3, -16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24 {'a': 3, 'comment': 'pop', 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[987] = {5'd5, 4'd10, 4'd3, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24 {'a': 3, 'z': 10, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24, 'op': 'load'}
    instructions[988] = {5'd22, 4'd8, 4'd8, 16'd10};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24 {'a': 8, 'z': 8, 'b': 10, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24, 'op': 'unsigned_divide'}
    instructions[989] = {5'd1, 4'd3, 4'd3, -16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24 {'a': 3, 'comment': 'pop', 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[990] = {5'd5, 4'd10, 4'd3, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24 {'a': 3, 'z': 10, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24, 'op': 'load'}
    instructions[991] = {5'd23, 4'd8, 4'd8, 16'd10};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24 {'a': 8, 'z': 8, 'b': 10, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24, 'op': 'and'}
    instructions[992] = {5'd1, 4'd3, 4'd3, -16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24 {'a': 3, 'comment': 'pop', 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[993] = {5'd5, 4'd10, 4'd3, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24 {'a': 3, 'z': 10, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24, 'op': 'load'}
    instructions[994] = {5'd16, 4'd8, 4'd8, 16'd10};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24 {'a': 8, 'z': 8, 'b': 10, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24, 'op': 'or'}
    instructions[995] = {5'd2, 4'd0, 4'd3, 16'd8};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24, 'op': 'store'}
    instructions[996] = {5'd1, 4'd3, 4'd3, 16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24 {'a': 3, 'literal': 1, 'z': 3, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24, 'op': 'addl'}
    instructions[997] = {5'd1, 4'd8, 4'd4, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24 {'a': 4, 'literal': 0, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24, 'op': 'addl'}
    instructions[998] = {5'd2, 4'd0, 4'd3, 16'd8};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24, 'op': 'store'}
    instructions[999] = {5'd1, 4'd3, 4'd3, 16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24 {'a': 3, 'literal': 1, 'z': 3, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24, 'op': 'addl'}
    instructions[1000] = {5'd1, 4'd8, 4'd4, 16'd11};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24 {'a': 4, 'literal': 11, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24, 'op': 'addl'}
    instructions[1001] = {5'd1, 4'd2, 4'd8, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24 {'a': 8, 'literal': 0, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24, 'op': 'addl'}
    instructions[1002] = {5'd5, 4'd8, 4'd2, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24 {'a': 2, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24, 'op': 'load'}
    instructions[1003] = {5'd1, 4'd3, 4'd3, -16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24 {'a': 3, 'comment': 'pop', 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[1004] = {5'd5, 4'd2, 4'd3, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24 {'a': 3, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24, 'op': 'load'}
    instructions[1005] = {5'd18, 4'd8, 4'd8, 16'd2};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24 {'a': 8, 'z': 8, 'b': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24, 'op': 'add'}
    instructions[1006] = {5'd1, 4'd2, 4'd8, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24 {'a': 8, 'literal': 0, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24, 'op': 'addl'}
    instructions[1007] = {5'd1, 4'd3, 4'd3, -16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24 {'a': 3, 'comment': 'pop', 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[1008] = {5'd5, 4'd8, 4'd3, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24 {'a': 3, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24, 'op': 'load'}
    instructions[1009] = {5'd2, 4'd0, 4'd2, 16'd8};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24 {'a': 2, 'b': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 24, 'op': 'store'}
    instructions[1010] = {5'd1, 4'd8, 4'd4, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 25 {'a': 4, 'literal': 0, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 25, 'op': 'addl'}
    instructions[1011] = {5'd2, 4'd0, 4'd3, 16'd8};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 25 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 25, 'op': 'store'}
    instructions[1012] = {5'd1, 4'd3, 4'd3, 16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 25 {'a': 3, 'literal': 1, 'z': 3, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 25, 'op': 'addl'}
    instructions[1013] = {5'd1, 4'd8, 4'd4, 16'd11};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 25 {'a': 4, 'literal': 11, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 25, 'op': 'addl'}
    instructions[1014] = {5'd1, 4'd2, 4'd8, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 25 {'a': 8, 'literal': 0, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 25, 'op': 'addl'}
    instructions[1015] = {5'd5, 4'd8, 4'd2, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 25 {'a': 2, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 25, 'op': 'load'}
    instructions[1016] = {5'd1, 4'd3, 4'd3, -16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 25 {'a': 3, 'comment': 'pop', 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 25, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[1017] = {5'd5, 4'd2, 4'd3, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 25 {'a': 3, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 25, 'op': 'load'}
    instructions[1018] = {5'd18, 4'd8, 4'd8, 16'd2};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 25 {'a': 8, 'z': 8, 'b': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 25, 'op': 'add'}
    instructions[1019] = {5'd1, 4'd2, 4'd8, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 25 {'a': 8, 'literal': 0, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 25, 'op': 'addl'}
    instructions[1020] = {5'd5, 4'd8, 4'd2, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 25 {'a': 2, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 25, 'op': 'load'}
    instructions[1021] = {5'd24, 4'd8, 4'd8, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 25 {'a': 8, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 25, 'op': 'a_lo'}
    instructions[1022] = {5'd25, 4'd0, 4'd0, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 25 {'line': 26, 'file': '/usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h', 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 25, 'op': 'report'}
    instructions[1023] = {5'd1, 4'd8, 4'd4, 16'd10};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 26 {'a': 4, 'literal': 10, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 26, 'op': 'addl'}
    instructions[1024] = {5'd1, 4'd2, 4'd8, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 26 {'a': 8, 'literal': 0, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 26, 'op': 'addl'}
    instructions[1025] = {5'd5, 4'd8, 4'd2, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 26 {'a': 2, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 26, 'op': 'load'}
    instructions[1026] = {5'd2, 4'd0, 4'd3, 16'd8};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 26 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 26, 'op': 'store'}
    instructions[1027] = {5'd1, 4'd3, 4'd3, 16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 26 {'a': 3, 'literal': 1, 'z': 3, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 26, 'op': 'addl'}
    instructions[1028] = {5'd1, 4'd8, 4'd4, -16'd2};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 26 {'a': 4, 'literal': -2, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 26, 'op': 'addl'}
    instructions[1029] = {5'd1, 4'd2, 4'd8, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 26 {'a': 8, 'literal': 0, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 26, 'op': 'addl'}
    instructions[1030] = {5'd5, 4'd8, 4'd2, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 26 {'a': 2, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 26, 'op': 'load'}
    instructions[1031] = {5'd1, 4'd3, 4'd3, -16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 26 {'a': 3, 'comment': 'pop', 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 26, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[1032] = {5'd5, 4'd10, 4'd3, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 26 {'a': 3, 'z': 10, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 26, 'op': 'load'}
    instructions[1033] = {5'd26, 4'd8, 4'd8, 16'd10};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 26 {'a': 8, 'z': 8, 'b': 10, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 26, 'op': 'unsigned_modulo'}
    instructions[1034] = {5'd1, 4'd2, 4'd4, -16'd2};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 26 {'a': 4, 'literal': -2, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 26, 'op': 'addl'}
    instructions[1035] = {5'd2, 4'd0, 4'd2, 16'd8};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 26 {'a': 2, 'b': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 26, 'op': 'store'}
    instructions[1036] = {5'd0, 4'd8, 4'd0, 16'd10};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 27 {'literal': 10, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 27, 'op': 'literal'}
    instructions[1037] = {5'd2, 4'd0, 4'd3, 16'd8};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 27 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 27, 'op': 'store'}
    instructions[1038] = {5'd1, 4'd3, 4'd3, 16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 27 {'a': 3, 'literal': 1, 'z': 3, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 27, 'op': 'addl'}
    instructions[1039] = {5'd1, 4'd8, 4'd4, 16'd10};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 27 {'a': 4, 'literal': 10, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 27, 'op': 'addl'}
    instructions[1040] = {5'd1, 4'd2, 4'd8, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 27 {'a': 8, 'literal': 0, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 27, 'op': 'addl'}
    instructions[1041] = {5'd5, 4'd8, 4'd2, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 27 {'a': 2, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 27, 'op': 'load'}
    instructions[1042] = {5'd1, 4'd3, 4'd3, -16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 27 {'a': 3, 'comment': 'pop', 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 27, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[1043] = {5'd5, 4'd10, 4'd3, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 27 {'a': 3, 'z': 10, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 27, 'op': 'load'}
    instructions[1044] = {5'd22, 4'd8, 4'd8, 16'd10};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 27 {'a': 8, 'z': 8, 'b': 10, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 27, 'op': 'unsigned_divide'}
    instructions[1045] = {5'd1, 4'd2, 4'd4, 16'd10};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 27 {'a': 4, 'literal': 10, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 27, 'op': 'addl'}
    instructions[1046] = {5'd2, 4'd0, 4'd2, 16'd8};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 27 {'a': 2, 'b': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 27, 'op': 'store'}
    instructions[1047] = {5'd1, 4'd8, 4'd4, 16'd11};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 28 {'a': 4, 'literal': 11, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 28, 'op': 'addl'}
    instructions[1048] = {5'd1, 4'd2, 4'd8, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 28 {'a': 8, 'literal': 0, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 28, 'op': 'addl'}
    instructions[1049] = {5'd5, 4'd8, 4'd2, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 28 {'a': 2, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 28, 'op': 'load'}
    instructions[1050] = {5'd2, 4'd0, 4'd3, 16'd8};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 28 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 28, 'op': 'store'}
    instructions[1051] = {5'd1, 4'd3, 4'd3, 16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 28 {'a': 3, 'literal': 1, 'z': 3, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 28, 'op': 'addl'}
    instructions[1052] = {5'd0, 4'd8, 4'd0, 16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 28 {'literal': 1, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 28, 'op': 'literal'}
    instructions[1053] = {5'd2, 4'd0, 4'd3, 16'd8};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 28 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 28, 'op': 'store'}
    instructions[1054] = {5'd1, 4'd3, 4'd3, 16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 28 {'a': 3, 'literal': 1, 'z': 3, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 28, 'op': 'addl'}
    instructions[1055] = {5'd1, 4'd8, 4'd4, 16'd11};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 28 {'a': 4, 'literal': 11, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 28, 'op': 'addl'}
    instructions[1056] = {5'd1, 4'd2, 4'd8, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 28 {'a': 8, 'literal': 0, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 28, 'op': 'addl'}
    instructions[1057] = {5'd5, 4'd8, 4'd2, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 28 {'a': 2, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 28, 'op': 'load'}
    instructions[1058] = {5'd1, 4'd3, 4'd3, -16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 28 {'a': 3, 'comment': 'pop', 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 28, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[1059] = {5'd5, 4'd10, 4'd3, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 28 {'a': 3, 'z': 10, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 28, 'op': 'load'}
    instructions[1060] = {5'd18, 4'd8, 4'd8, 16'd10};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 28 {'a': 8, 'z': 8, 'b': 10, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 28, 'op': 'add'}
    instructions[1061] = {5'd1, 4'd2, 4'd4, 16'd11};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 28 {'a': 4, 'literal': 11, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 28, 'op': 'addl'}
    instructions[1062] = {5'd2, 4'd0, 4'd2, 16'd8};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 28 {'a': 2, 'b': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 28, 'op': 'store'}
    instructions[1063] = {5'd1, 4'd3, 4'd3, -16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 28 {'a': 3, 'comment': 'pop', 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 28, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[1064] = {5'd5, 4'd8, 4'd3, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 28 {'a': 3, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 28, 'op': 'load'}
    instructions[1065] = {5'd8, 4'd0, 4'd0, 16'd1067};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30 {'label': 1067, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30, 'op': 'goto'}
    instructions[1066] = {5'd8, 4'd0, 4'd0, 16'd1068};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30 {'label': 1068, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30, 'op': 'goto'}
    instructions[1067] = {5'd8, 4'd0, 4'd0, 16'd968};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 23 {'label': 968, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 23, 'op': 'goto'}
    instructions[1068] = {5'd0, 4'd8, 4'd0, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30 {'literal': 0, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30, 'op': 'literal'}
    instructions[1069] = {5'd1, 4'd2, 4'd4, 16'd11};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30 {'a': 4, 'literal': 11, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30, 'op': 'addl'}
    instructions[1070] = {5'd2, 4'd0, 4'd2, 16'd8};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30 {'a': 2, 'b': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30, 'op': 'store'}
    instructions[1071] = {5'd1, 4'd8, 4'd4, 16'd11};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30 {'a': 4, 'literal': 11, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30, 'op': 'addl'}
    instructions[1072] = {5'd1, 4'd2, 4'd8, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30 {'a': 8, 'literal': 0, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30, 'op': 'addl'}
    instructions[1073] = {5'd5, 4'd8, 4'd2, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30 {'a': 2, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30, 'op': 'load'}
    instructions[1074] = {5'd2, 4'd0, 4'd3, 16'd8};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30, 'op': 'store'}
    instructions[1075] = {5'd1, 4'd3, 4'd3, 16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30 {'a': 3, 'literal': 1, 'z': 3, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30, 'op': 'addl'}
    instructions[1076] = {5'd0, 4'd8, 4'd0, 16'd10};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30 {'literal': 10, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30, 'op': 'literal'}
    instructions[1077] = {5'd1, 4'd3, 4'd3, -16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30 {'a': 3, 'comment': 'pop', 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[1078] = {5'd5, 4'd10, 4'd3, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30 {'a': 3, 'z': 10, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30, 'op': 'load'}
    instructions[1079] = {5'd13, 4'd8, 4'd8, 16'd10};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30 {'a': 8, 'z': 8, 'b': 10, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30, 'op': 'unsigned_greater'}
    instructions[1080] = {5'd14, 4'd0, 4'd8, 16'd1120};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30 {'a': 8, 'label': 1120, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30, 'op': 'jmp_if_false'}
    instructions[1081] = {5'd1, 4'd8, 4'd4, -16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30 {'a': 4, 'literal': -1, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30, 'op': 'addl'}
    instructions[1082] = {5'd1, 4'd2, 4'd8, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30 {'a': 8, 'literal': 0, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30, 'op': 'addl'}
    instructions[1083] = {5'd5, 4'd8, 4'd2, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30 {'a': 2, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30, 'op': 'load'}
    instructions[1084] = {5'd2, 4'd0, 4'd3, 16'd8};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30, 'op': 'store'}
    instructions[1085] = {5'd1, 4'd3, 4'd3, 16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30 {'a': 3, 'literal': 1, 'z': 3, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30, 'op': 'addl'}
    instructions[1086] = {5'd1, 4'd8, 4'd4, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30 {'a': 4, 'literal': 0, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30, 'op': 'addl'}
    instructions[1087] = {5'd2, 4'd0, 4'd3, 16'd8};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30, 'op': 'store'}
    instructions[1088] = {5'd1, 4'd3, 4'd3, 16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30 {'a': 3, 'literal': 1, 'z': 3, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30, 'op': 'addl'}
    instructions[1089] = {5'd1, 4'd8, 4'd4, 16'd11};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30 {'a': 4, 'literal': 11, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30, 'op': 'addl'}
    instructions[1090] = {5'd1, 4'd2, 4'd8, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30 {'a': 8, 'literal': 0, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30, 'op': 'addl'}
    instructions[1091] = {5'd5, 4'd8, 4'd2, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30 {'a': 2, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30, 'op': 'load'}
    instructions[1092] = {5'd1, 4'd3, 4'd3, -16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30 {'a': 3, 'comment': 'pop', 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[1093] = {5'd5, 4'd2, 4'd3, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30 {'a': 3, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30, 'op': 'load'}
    instructions[1094] = {5'd18, 4'd8, 4'd8, 16'd2};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30 {'a': 8, 'z': 8, 'b': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30, 'op': 'add'}
    instructions[1095] = {5'd1, 4'd2, 4'd8, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30 {'a': 8, 'literal': 0, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30, 'op': 'addl'}
    instructions[1096] = {5'd5, 4'd8, 4'd2, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30 {'a': 2, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30, 'op': 'load'}
    instructions[1097] = {5'd1, 4'd3, 4'd3, -16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30 {'a': 3, 'comment': 'pop', 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[1098] = {5'd5, 4'd0, 4'd3, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30 {'a': 3, 'z': 0, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30, 'op': 'load'}
    instructions[1099] = {5'd10, 4'd0, 4'd0, 16'd8};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30 {'a': 0, 'b': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30, 'op': 'write'}
    instructions[1100] = {5'd1, 4'd3, 4'd3, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30 {'a': 3, 'literal': 0, 'z': 3, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30, 'op': 'addl'}
    instructions[1101] = {5'd1, 4'd8, 4'd4, 16'd11};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30 {'a': 4, 'literal': 11, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30, 'op': 'addl'}
    instructions[1102] = {5'd1, 4'd2, 4'd8, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30 {'a': 8, 'literal': 0, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30, 'op': 'addl'}
    instructions[1103] = {5'd5, 4'd8, 4'd2, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30 {'a': 2, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30, 'op': 'load'}
    instructions[1104] = {5'd2, 4'd0, 4'd3, 16'd8};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30, 'op': 'store'}
    instructions[1105] = {5'd1, 4'd3, 4'd3, 16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30 {'a': 3, 'literal': 1, 'z': 3, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30, 'op': 'addl'}
    instructions[1106] = {5'd0, 4'd8, 4'd0, 16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30 {'literal': 1, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30, 'op': 'literal'}
    instructions[1107] = {5'd2, 4'd0, 4'd3, 16'd8};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30, 'op': 'store'}
    instructions[1108] = {5'd1, 4'd3, 4'd3, 16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30 {'a': 3, 'literal': 1, 'z': 3, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30, 'op': 'addl'}
    instructions[1109] = {5'd1, 4'd8, 4'd4, 16'd11};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30 {'a': 4, 'literal': 11, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30, 'op': 'addl'}
    instructions[1110] = {5'd1, 4'd2, 4'd8, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30 {'a': 8, 'literal': 0, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30, 'op': 'addl'}
    instructions[1111] = {5'd5, 4'd8, 4'd2, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30 {'a': 2, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30, 'op': 'load'}
    instructions[1112] = {5'd1, 4'd3, 4'd3, -16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30 {'a': 3, 'comment': 'pop', 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[1113] = {5'd5, 4'd10, 4'd3, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30 {'a': 3, 'z': 10, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30, 'op': 'load'}
    instructions[1114] = {5'd18, 4'd8, 4'd8, 16'd10};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30 {'a': 8, 'z': 8, 'b': 10, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30, 'op': 'add'}
    instructions[1115] = {5'd1, 4'd2, 4'd4, 16'd11};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30 {'a': 4, 'literal': 11, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30, 'op': 'addl'}
    instructions[1116] = {5'd2, 4'd0, 4'd2, 16'd8};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30 {'a': 2, 'b': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30, 'op': 'store'}
    instructions[1117] = {5'd1, 4'd3, 4'd3, -16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30 {'a': 3, 'comment': 'pop', 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[1118] = {5'd5, 4'd8, 4'd3, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30 {'a': 3, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30, 'op': 'load'}
    instructions[1119] = {5'd8, 4'd0, 4'd0, 16'd1071};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30 {'label': 1071, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 30, 'op': 'goto'}
    instructions[1120] = {5'd1, 4'd3, 4'd4, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 16 {'a': 4, 'literal': 0, 'z': 3, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 16, 'op': 'addl'}
    instructions[1121] = {5'd1, 4'd4, 4'd7, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 16 {'a': 7, 'literal': 0, 'z': 4, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 16, 'op': 'addl'}
    instructions[1122] = {5'd19, 4'd0, 4'd6, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 16 {'a': 6, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h : 16, 'op': 'return'}
    instructions[1123] = {5'd1, 4'd3, 4'd3, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 155 {'a': 3, 'literal': 0, 'z': 3, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 155, 'op': 'addl'}
    instructions[1124] = {5'd2, 4'd0, 4'd3, 16'd6};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 156 {'a': 3, 'comment': 'push', 'b': 6, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 156, 'op': 'store'}
    instructions[1125] = {5'd1, 4'd3, 4'd3, 16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 156 {'a': 3, 'literal': 1, 'z': 3, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 156, 'op': 'addl'}
    instructions[1126] = {5'd2, 4'd0, 4'd3, 16'd7};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 156 {'a': 3, 'comment': 'push', 'b': 7, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 156, 'op': 'store'}
    instructions[1127] = {5'd1, 4'd3, 4'd3, 16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 156 {'a': 3, 'literal': 1, 'z': 3, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 156, 'op': 'addl'}
    instructions[1128] = {5'd0, 4'd8, 4'd0, 16'd29};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 156 {'literal': 29, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 156, 'op': 'literal'}
    instructions[1129] = {5'd1, 4'd2, 4'd8, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 156 {'a': 8, 'literal': 0, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 156, 'op': 'addl'}
    instructions[1130] = {5'd5, 4'd8, 4'd2, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 156 {'a': 2, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 156, 'op': 'load'}
    instructions[1131] = {5'd2, 4'd0, 4'd3, 16'd8};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 156 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 156, 'op': 'store'}
    instructions[1132] = {5'd1, 4'd3, 4'd3, 16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 156 {'a': 3, 'literal': 1, 'z': 3, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 156, 'op': 'addl'}
    instructions[1133] = {5'd1, 4'd7, 4'd4, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 156 {'a': 4, 'literal': 0, 'z': 7, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 156, 'op': 'addl'}
    instructions[1134] = {5'd1, 4'd4, 4'd3, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 156 {'a': 3, 'literal': 0, 'z': 4, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 156, 'op': 'addl'}
    instructions[1135] = {5'd3, 4'd6, 4'd0, 16'd1148};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 156 {'z': 6, 'label': 1148, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 156, 'op': 'call'}
    instructions[1136] = {5'd1, 4'd3, 4'd3, -16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 156 {'a': 3, 'literal': -1, 'z': 3, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 156, 'op': 'addl'}
    instructions[1137] = {5'd1, 4'd3, 4'd3, -16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 156 {'a': 3, 'comment': 'pop', 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 156, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[1138] = {5'd5, 4'd7, 4'd3, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 156 {'a': 3, 'z': 7, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 156, 'op': 'load'}
    instructions[1139] = {5'd1, 4'd3, 4'd3, -16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 156 {'a': 3, 'comment': 'pop', 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 156, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[1140] = {5'd5, 4'd6, 4'd3, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 156 {'a': 3, 'z': 6, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 156, 'op': 'load'}
    instructions[1141] = {5'd0, 4'd2, 4'd0, 16'd3};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 156 {'literal': 3, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 156, 'op': 'literal'}
    instructions[1142] = {5'd5, 4'd8, 4'd2, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 156 {'a': 2, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 156, 'op': 'load'}
    instructions[1143] = {5'd0, 4'd2, 4'd0, 16'd34};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 156 {'literal': 34, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 156, 'op': 'literal'}
    instructions[1144] = {5'd2, 4'd0, 4'd2, 16'd8};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 156 {'a': 2, 'b': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 156, 'op': 'store'}
    instructions[1145] = {5'd1, 4'd3, 4'd4, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 156 {'a': 4, 'literal': 0, 'z': 3, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 156, 'op': 'addl'}
    instructions[1146] = {5'd1, 4'd4, 4'd7, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 156 {'a': 7, 'literal': 0, 'z': 4, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 156, 'op': 'addl'}
    instructions[1147] = {5'd19, 4'd0, 4'd6, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 156 {'a': 6, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 156, 'op': 'return'}
    instructions[1148] = {5'd1, 4'd3, 4'd3, 16'd2};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 26 {'a': 3, 'literal': 2, 'z': 3, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 26, 'op': 'addl'}
    instructions[1149] = {5'd0, 4'd8, 4'd0, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 29 {'literal': 0, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 29, 'op': 'literal'}
    instructions[1150] = {5'd1, 4'd2, 4'd4, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 29 {'a': 4, 'literal': 0, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 29, 'op': 'addl'}
    instructions[1151] = {5'd2, 4'd0, 4'd2, 16'd8};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 29 {'a': 2, 'b': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 29, 'op': 'store'}
    instructions[1152] = {5'd1, 4'd8, 4'd4, -16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 31 {'a': 4, 'literal': -1, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 31, 'op': 'addl'}
    instructions[1153] = {5'd1, 4'd2, 4'd8, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 31 {'a': 8, 'literal': 0, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 31, 'op': 'addl'}
    instructions[1154] = {5'd5, 4'd8, 4'd2, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 31 {'a': 2, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 31, 'op': 'load'}
    instructions[1155] = {5'd9, 4'd8, 4'd8, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 31 {'a': 8, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 31, 'op': 'read'}
    instructions[1156] = {5'd1, 4'd2, 4'd4, 16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 31 {'a': 4, 'literal': 1, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 31, 'op': 'addl'}
    instructions[1157] = {5'd2, 4'd0, 4'd2, 16'd8};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 31 {'a': 2, 'b': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 31, 'op': 'store'}
    instructions[1158] = {5'd0, 4'd8, 4'd0, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 32 {'literal': 0, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 32, 'op': 'literal'}
    instructions[1159] = {5'd2, 4'd0, 4'd3, 16'd8};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 32 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 32, 'op': 'store'}
    instructions[1160] = {5'd1, 4'd3, 4'd3, 16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 32 {'a': 3, 'literal': 1, 'z': 3, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 32, 'op': 'addl'}
    instructions[1161] = {5'd2, 4'd0, 4'd3, 16'd6};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 32 {'a': 3, 'comment': 'push', 'b': 6, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 32, 'op': 'store'}
    instructions[1162] = {5'd1, 4'd3, 4'd3, 16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 32 {'a': 3, 'literal': 1, 'z': 3, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 32, 'op': 'addl'}
    instructions[1163] = {5'd2, 4'd0, 4'd3, 16'd7};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 32 {'a': 3, 'comment': 'push', 'b': 7, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 32, 'op': 'store'}
    instructions[1164] = {5'd1, 4'd3, 4'd3, 16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 32 {'a': 3, 'literal': 1, 'z': 3, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 32, 'op': 'addl'}
    instructions[1165] = {5'd1, 4'd8, 4'd4, 16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 32 {'a': 4, 'literal': 1, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 32, 'op': 'addl'}
    instructions[1166] = {5'd1, 4'd2, 4'd8, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 32 {'a': 8, 'literal': 0, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 32, 'op': 'addl'}
    instructions[1167] = {5'd5, 4'd8, 4'd2, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 32 {'a': 2, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 32, 'op': 'load'}
    instructions[1168] = {5'd2, 4'd0, 4'd3, 16'd8};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 32 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 32, 'op': 'store'}
    instructions[1169] = {5'd1, 4'd3, 4'd3, 16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 32 {'a': 3, 'literal': 1, 'z': 3, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 32, 'op': 'addl'}
    instructions[1170] = {5'd1, 4'd7, 4'd4, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 32 {'a': 4, 'literal': 0, 'z': 7, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 32, 'op': 'addl'}
    instructions[1171] = {5'd1, 4'd4, 4'd3, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 32 {'a': 3, 'literal': 0, 'z': 4, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 32, 'op': 'addl'}
    instructions[1172] = {5'd3, 4'd6, 4'd0, 16'd1225};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 32 {'z': 6, 'label': 1225, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 32, 'op': 'call'}
    instructions[1173] = {5'd1, 4'd3, 4'd3, -16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 32 {'a': 3, 'literal': -1, 'z': 3, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 32, 'op': 'addl'}
    instructions[1174] = {5'd1, 4'd3, 4'd3, -16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 32 {'a': 3, 'comment': 'pop', 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 32, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[1175] = {5'd5, 4'd7, 4'd3, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 32 {'a': 3, 'z': 7, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 32, 'op': 'load'}
    instructions[1176] = {5'd1, 4'd3, 4'd3, -16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 32 {'a': 3, 'comment': 'pop', 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 32, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[1177] = {5'd5, 4'd6, 4'd3, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 32 {'a': 3, 'z': 6, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 32, 'op': 'load'}
    instructions[1178] = {5'd0, 4'd2, 4'd0, 16'd8};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 32 {'literal': 8, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 32, 'op': 'literal'}
    instructions[1179] = {5'd5, 4'd8, 4'd2, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 32 {'a': 2, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 32, 'op': 'load'}
    instructions[1180] = {5'd1, 4'd3, 4'd3, -16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 32 {'a': 3, 'comment': 'pop', 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 32, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[1181] = {5'd5, 4'd10, 4'd3, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 32 {'a': 3, 'z': 10, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 32, 'op': 'load'}
    instructions[1182] = {5'd6, 4'd8, 4'd8, 16'd10};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 32 {'a': 8, 'z': 8, 'b': 10, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 32, 'op': 'equal'}
    instructions[1183] = {5'd14, 4'd0, 4'd8, 16'd1186};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 32 {'a': 8, 'label': 1186, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 32, 'op': 'jmp_if_false'}
    instructions[1184] = {5'd8, 4'd0, 4'd0, 16'd1217};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 32 {'label': 1217, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 32, 'op': 'goto'}
    instructions[1185] = {5'd8, 4'd0, 4'd0, 16'd1186};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 32 {'label': 1186, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 32, 'op': 'goto'}
    instructions[1186] = {5'd0, 4'd8, 4'd0, 16'd10};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 33 {'literal': 10, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 33, 'op': 'literal'}
    instructions[1187] = {5'd2, 4'd0, 4'd3, 16'd8};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 33 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 33, 'op': 'store'}
    instructions[1188] = {5'd1, 4'd3, 4'd3, 16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 33 {'a': 3, 'literal': 1, 'z': 3, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 33, 'op': 'addl'}
    instructions[1189] = {5'd1, 4'd8, 4'd4, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 33 {'a': 4, 'literal': 0, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 33, 'op': 'addl'}
    instructions[1190] = {5'd1, 4'd2, 4'd8, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 33 {'a': 8, 'literal': 0, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 33, 'op': 'addl'}
    instructions[1191] = {5'd5, 4'd8, 4'd2, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 33 {'a': 2, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 33, 'op': 'load'}
    instructions[1192] = {5'd1, 4'd3, 4'd3, -16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 33 {'a': 3, 'comment': 'pop', 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 33, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[1193] = {5'd5, 4'd10, 4'd3, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 33 {'a': 3, 'z': 10, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 33, 'op': 'load'}
    instructions[1194] = {5'd27, 4'd8, 4'd8, 16'd10};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 33 {'a': 8, 'z': 8, 'b': 10, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 33, 'op': 'multiply'}
    instructions[1195] = {5'd1, 4'd2, 4'd4, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 33 {'a': 4, 'literal': 0, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 33, 'op': 'addl'}
    instructions[1196] = {5'd2, 4'd0, 4'd2, 16'd8};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 33 {'a': 2, 'b': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 33, 'op': 'store'}
    instructions[1197] = {5'd0, 4'd8, 4'd0, 16'd48};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 34 {'literal': 48, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 34, 'op': 'literal'}
    instructions[1198] = {5'd2, 4'd0, 4'd3, 16'd8};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 34 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 34, 'op': 'store'}
    instructions[1199] = {5'd1, 4'd3, 4'd3, 16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 34 {'a': 3, 'literal': 1, 'z': 3, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 34, 'op': 'addl'}
    instructions[1200] = {5'd1, 4'd8, 4'd4, 16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 34 {'a': 4, 'literal': 1, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 34, 'op': 'addl'}
    instructions[1201] = {5'd1, 4'd2, 4'd8, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 34 {'a': 8, 'literal': 0, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 34, 'op': 'addl'}
    instructions[1202] = {5'd5, 4'd8, 4'd2, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 34 {'a': 2, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 34, 'op': 'load'}
    instructions[1203] = {5'd1, 4'd3, 4'd3, -16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 34 {'a': 3, 'comment': 'pop', 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 34, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[1204] = {5'd5, 4'd10, 4'd3, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 34 {'a': 3, 'z': 10, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 34, 'op': 'load'}
    instructions[1205] = {5'd12, 4'd8, 4'd8, 16'd10};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 34 {'a': 8, 'z': 8, 'b': 10, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 34, 'op': 'subtract'}
    instructions[1206] = {5'd2, 4'd0, 4'd3, 16'd8};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 34 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 34, 'op': 'store'}
    instructions[1207] = {5'd1, 4'd3, 4'd3, 16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 34 {'a': 3, 'literal': 1, 'z': 3, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 34, 'op': 'addl'}
    instructions[1208] = {5'd1, 4'd8, 4'd4, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 34 {'a': 4, 'literal': 0, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 34, 'op': 'addl'}
    instructions[1209] = {5'd1, 4'd2, 4'd8, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 34 {'a': 8, 'literal': 0, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 34, 'op': 'addl'}
    instructions[1210] = {5'd5, 4'd8, 4'd2, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 34 {'a': 2, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 34, 'op': 'load'}
    instructions[1211] = {5'd1, 4'd3, 4'd3, -16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 34 {'a': 3, 'comment': 'pop', 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 34, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[1212] = {5'd5, 4'd10, 4'd3, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 34 {'a': 3, 'z': 10, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 34, 'op': 'load'}
    instructions[1213] = {5'd18, 4'd8, 4'd8, 16'd10};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 34 {'a': 8, 'z': 8, 'b': 10, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 34, 'op': 'add'}
    instructions[1214] = {5'd1, 4'd2, 4'd4, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 34 {'a': 4, 'literal': 0, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 34, 'op': 'addl'}
    instructions[1215] = {5'd2, 4'd0, 4'd2, 16'd8};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 34 {'a': 2, 'b': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 34, 'op': 'store'}
    instructions[1216] = {5'd8, 4'd0, 4'd0, 16'd1152};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 30 {'label': 1152, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 30, 'op': 'goto'}
    instructions[1217] = {5'd1, 4'd8, 4'd4, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 36 {'a': 4, 'literal': 0, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 36, 'op': 'addl'}
    instructions[1218] = {5'd1, 4'd2, 4'd8, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 36 {'a': 8, 'literal': 0, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 36, 'op': 'addl'}
    instructions[1219] = {5'd5, 4'd8, 4'd2, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 36 {'a': 2, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 36, 'op': 'load'}
    instructions[1220] = {5'd0, 4'd2, 4'd0, 16'd3};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 36 {'literal': 3, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 36, 'op': 'literal'}
    instructions[1221] = {5'd2, 4'd0, 4'd2, 16'd8};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 36 {'a': 2, 'b': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 36, 'op': 'store'}
    instructions[1222] = {5'd1, 4'd3, 4'd4, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 36 {'a': 4, 'literal': 0, 'z': 3, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 36, 'op': 'addl'}
    instructions[1223] = {5'd1, 4'd4, 4'd7, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 36 {'a': 7, 'literal': 0, 'z': 4, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 36, 'op': 'addl'}
    instructions[1224] = {5'd19, 4'd0, 4'd6, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 36 {'a': 6, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/scan.h : 36, 'op': 'return'}
    instructions[1225] = {5'd1, 4'd3, 4'd3, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/ctype.h : 86 {'a': 3, 'literal': 0, 'z': 3, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/ctype.h : 86, 'op': 'addl'}
    instructions[1226] = {5'd0, 4'd8, 4'd0, 16'd48};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/ctype.h : 87 {'literal': 48, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/ctype.h : 87, 'op': 'literal'}
    instructions[1227] = {5'd2, 4'd0, 4'd3, 16'd8};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/ctype.h : 87 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/ctype.h : 87, 'op': 'store'}
    instructions[1228] = {5'd1, 4'd3, 4'd3, 16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/ctype.h : 87 {'a': 3, 'literal': 1, 'z': 3, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/ctype.h : 87, 'op': 'addl'}
    instructions[1229] = {5'd1, 4'd8, 4'd4, -16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/ctype.h : 87 {'a': 4, 'literal': -1, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/ctype.h : 87, 'op': 'addl'}
    instructions[1230] = {5'd1, 4'd2, 4'd8, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/ctype.h : 87 {'a': 8, 'literal': 0, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/ctype.h : 87, 'op': 'addl'}
    instructions[1231] = {5'd5, 4'd8, 4'd2, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/ctype.h : 87 {'a': 2, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/ctype.h : 87, 'op': 'load'}
    instructions[1232] = {5'd1, 4'd3, 4'd3, -16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/ctype.h : 87 {'a': 3, 'comment': 'pop', 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/ctype.h : 87, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[1233] = {5'd5, 4'd10, 4'd3, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/ctype.h : 87 {'a': 3, 'z': 10, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/ctype.h : 87, 'op': 'load'}
    instructions[1234] = {5'd28, 4'd8, 4'd8, 16'd10};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/ctype.h : 87 {'a': 8, 'z': 8, 'b': 10, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/ctype.h : 87, 'op': 'greater_equal'}
    instructions[1235] = {5'd14, 4'd0, 4'd8, 16'd1245};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/ctype.h : 87 {'a': 8, 'label': 1245, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/ctype.h : 87, 'op': 'jmp_if_false'}
    instructions[1236] = {5'd1, 4'd8, 4'd4, -16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/ctype.h : 87 {'a': 4, 'literal': -1, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/ctype.h : 87, 'op': 'addl'}
    instructions[1237] = {5'd1, 4'd2, 4'd8, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/ctype.h : 87 {'a': 8, 'literal': 0, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/ctype.h : 87, 'op': 'addl'}
    instructions[1238] = {5'd5, 4'd8, 4'd2, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/ctype.h : 87 {'a': 2, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/ctype.h : 87, 'op': 'load'}
    instructions[1239] = {5'd2, 4'd0, 4'd3, 16'd8};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/ctype.h : 87 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/ctype.h : 87, 'op': 'store'}
    instructions[1240] = {5'd1, 4'd3, 4'd3, 16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/ctype.h : 87 {'a': 3, 'literal': 1, 'z': 3, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/ctype.h : 87, 'op': 'addl'}
    instructions[1241] = {5'd0, 4'd8, 4'd0, 16'd57};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/ctype.h : 87 {'literal': 57, 'z': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/ctype.h : 87, 'op': 'literal'}
    instructions[1242] = {5'd1, 4'd3, 4'd3, -16'd1};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/ctype.h : 87 {'a': 3, 'comment': 'pop', 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/ctype.h : 87, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[1243] = {5'd5, 4'd10, 4'd3, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/ctype.h : 87 {'a': 3, 'z': 10, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/ctype.h : 87, 'op': 'load'}
    instructions[1244] = {5'd28, 4'd8, 4'd8, 16'd10};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/ctype.h : 87 {'a': 8, 'z': 8, 'b': 10, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/ctype.h : 87, 'op': 'greater_equal'}
    instructions[1245] = {5'd0, 4'd2, 4'd0, 16'd8};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/ctype.h : 87 {'literal': 8, 'z': 2, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/ctype.h : 87, 'op': 'literal'}
    instructions[1246] = {5'd2, 4'd0, 4'd2, 16'd8};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/ctype.h : 87 {'a': 2, 'b': 8, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/ctype.h : 87, 'op': 'store'}
    instructions[1247] = {5'd1, 4'd3, 4'd4, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/ctype.h : 87 {'a': 4, 'literal': 0, 'z': 3, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/ctype.h : 87, 'op': 'addl'}
    instructions[1248] = {5'd1, 4'd4, 4'd7, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/ctype.h : 87 {'a': 7, 'literal': 0, 'z': 4, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/ctype.h : 87, 'op': 'addl'}
    instructions[1249] = {5'd19, 4'd0, 4'd6, 16'd0};///usr/local/lib/python2.7/dist-packages/chips/compiler/include/ctype.h : 87 {'a': 6, 'trace': /usr/local/lib/python2.7/dist-packages/chips/compiler/include/ctype.h : 87, 'op': 'return'}
    instructions[1250] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 40 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 40, 'op': 'addl'}
    instructions[1251] = {5'd1, 4'd8, 4'd4, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 43 {'a': 4, 'literal': -1, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 43, 'op': 'addl'}
    instructions[1252] = {5'd1, 4'd2, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 43 {'a': 8, 'literal': 0, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 43, 'op': 'addl'}
    instructions[1253] = {5'd5, 4'd8, 4'd2, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 43 {'a': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 43, 'op': 'load'}
    instructions[1254] = {5'd2, 4'd0, 4'd3, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 43 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 43, 'op': 'store'}
    instructions[1255] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 43 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 43, 'op': 'addl'}
    instructions[1256] = {5'd1, 4'd8, 4'd4, -16'd3};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 43 {'a': 4, 'literal': -3, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 43, 'op': 'addl'}
    instructions[1257] = {5'd1, 4'd2, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 43 {'a': 8, 'literal': 0, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 43, 'op': 'addl'}
    instructions[1258] = {5'd5, 4'd8, 4'd2, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 43 {'a': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 43, 'op': 'load'}
    instructions[1259] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 43 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 43, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[1260] = {5'd5, 4'd10, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 43 {'a': 3, 'z': 10, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 43, 'op': 'load'}
    instructions[1261] = {5'd27, 4'd8, 4'd8, 16'd10};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 43 {'a': 8, 'z': 8, 'b': 10, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 43, 'op': 'multiply'}
    instructions[1262] = {5'd1, 4'd2, 4'd4, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 43 {'a': 4, 'literal': 0, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 43, 'op': 'addl'}
    instructions[1263] = {5'd2, 4'd0, 4'd2, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 43 {'a': 2, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 43, 'op': 'store'}
    instructions[1264] = {5'd0, 4'd8, 4'd0, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 44 {'literal': 8, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 44, 'op': 'literal'}
    instructions[1265] = {5'd2, 4'd0, 4'd3, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 44 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 44, 'op': 'store'}
    instructions[1266] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 44 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 44, 'op': 'addl'}
    instructions[1267] = {5'd1, 4'd8, 4'd4, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 44 {'a': 4, 'literal': 0, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 44, 'op': 'addl'}
    instructions[1268] = {5'd1, 4'd2, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 44 {'a': 8, 'literal': 0, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 44, 'op': 'addl'}
    instructions[1269] = {5'd5, 4'd8, 4'd2, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 44 {'a': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 44, 'op': 'load'}
    instructions[1270] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 44 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 44, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[1271] = {5'd5, 4'd10, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 44 {'a': 3, 'z': 10, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 44, 'op': 'load'}
    instructions[1272] = {5'd29, 4'd8, 4'd8, 16'd10};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 44 {'a': 8, 'z': 8, 'b': 10, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 44, 'op': 'shift_right'}
    instructions[1273] = {5'd1, 4'd2, 4'd4, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 44 {'a': 4, 'literal': 0, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 44, 'op': 'addl'}
    instructions[1274] = {5'd2, 4'd0, 4'd2, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 44 {'a': 2, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 44, 'op': 'store'}
    instructions[1275] = {5'd1, 4'd8, 4'd4, -16'd2};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 45 {'a': 4, 'literal': -2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 45, 'op': 'addl'}
    instructions[1276] = {5'd1, 4'd2, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 45 {'a': 8, 'literal': 0, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 45, 'op': 'addl'}
    instructions[1277] = {5'd5, 4'd8, 4'd2, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 45 {'a': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 45, 'op': 'load'}
    instructions[1278] = {5'd2, 4'd0, 4'd3, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 45 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 45, 'op': 'store'}
    instructions[1279] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 45 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 45, 'op': 'addl'}
    instructions[1280] = {5'd1, 4'd8, 4'd4, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 45 {'a': 4, 'literal': 0, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 45, 'op': 'addl'}
    instructions[1281] = {5'd1, 4'd2, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 45 {'a': 8, 'literal': 0, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 45, 'op': 'addl'}
    instructions[1282] = {5'd5, 4'd8, 4'd2, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 45 {'a': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 45, 'op': 'load'}
    instructions[1283] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 45 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 45, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[1284] = {5'd5, 4'd10, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 45 {'a': 3, 'z': 10, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 45, 'op': 'load'}
    instructions[1285] = {5'd18, 4'd8, 4'd8, 16'd10};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 45 {'a': 8, 'z': 8, 'b': 10, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 45, 'op': 'add'}
    instructions[1286] = {5'd1, 4'd2, 4'd4, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 45 {'a': 4, 'literal': 0, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 45, 'op': 'addl'}
    instructions[1287] = {5'd2, 4'd0, 4'd2, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 45 {'a': 2, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 45, 'op': 'store'}
    instructions[1288] = {5'd2, 4'd0, 4'd3, 16'd6};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46 {'a': 3, 'comment': 'push', 'b': 6, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46, 'op': 'store'}
    instructions[1289] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46, 'op': 'addl'}
    instructions[1290] = {5'd2, 4'd0, 4'd3, 16'd7};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46 {'a': 3, 'comment': 'push', 'b': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46, 'op': 'store'}
    instructions[1291] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46, 'op': 'addl'}
    instructions[1292] = {5'd0, 4'd8, 4'd0, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46 {'literal': 0, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46, 'op': 'literal'}
    instructions[1293] = {5'd2, 4'd0, 4'd3, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46, 'op': 'store'}
    instructions[1294] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46, 'op': 'addl'}
    instructions[1295] = {5'd1, 4'd8, 4'd4, -16'd3};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46 {'a': 4, 'literal': -3, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46, 'op': 'addl'}
    instructions[1296] = {5'd1, 4'd2, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46 {'a': 8, 'literal': 0, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46, 'op': 'addl'}
    instructions[1297] = {5'd5, 4'd8, 4'd2, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46 {'a': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46, 'op': 'load'}
    instructions[1298] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[1299] = {5'd5, 4'd10, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46 {'a': 3, 'z': 10, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46, 'op': 'load'}
    instructions[1300] = {5'd30, 4'd8, 4'd8, 16'd10};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46 {'a': 8, 'z': 8, 'b': 10, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46, 'op': 'greater'}
    instructions[1301] = {5'd14, 4'd0, 4'd8, 16'd1306};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46 {'a': 8, 'label': 1306, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46, 'op': 'jmp_if_false'}
    instructions[1302] = {5'd1, 4'd8, 4'd4, -16'd3};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46 {'a': 4, 'literal': -3, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46, 'op': 'addl'}
    instructions[1303] = {5'd1, 4'd2, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46 {'a': 8, 'literal': 0, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46, 'op': 'addl'}
    instructions[1304] = {5'd5, 4'd8, 4'd2, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46 {'a': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46, 'op': 'load'}
    instructions[1305] = {5'd8, 4'd0, 4'd8, 16'd1321};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46 {'a': 8, 'label': 1321, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46, 'op': 'goto'}
    instructions[1306] = {5'd0, 4'd8, 4'd0, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46 {'literal': 8, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46, 'op': 'literal'}
    instructions[1307] = {5'd2, 4'd0, 4'd3, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46, 'op': 'store'}
    instructions[1308] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46, 'op': 'addl'}
    instructions[1309] = {5'd1, 4'd8, 4'd4, -16'd3};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46 {'a': 4, 'literal': -3, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46, 'op': 'addl'}
    instructions[1310] = {5'd1, 4'd2, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46 {'a': 8, 'literal': 0, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46, 'op': 'addl'}
    instructions[1311] = {5'd5, 4'd8, 4'd2, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46 {'a': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46, 'op': 'load'}
    instructions[1312] = {5'd2, 4'd0, 4'd3, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46, 'op': 'store'}
    instructions[1313] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46, 'op': 'addl'}
    instructions[1314] = {5'd0, 4'd8, 4'd0, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46 {'literal': 0, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46, 'op': 'literal'}
    instructions[1315] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[1316] = {5'd5, 4'd10, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46 {'a': 3, 'z': 10, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46, 'op': 'load'}
    instructions[1317] = {5'd12, 4'd8, 4'd8, 16'd10};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46 {'a': 8, 'z': 8, 'b': 10, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46, 'op': 'subtract'}
    instructions[1318] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[1319] = {5'd5, 4'd10, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46 {'a': 3, 'z': 10, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46, 'op': 'load'}
    instructions[1320] = {5'd29, 4'd8, 4'd8, 16'd10};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46 {'a': 8, 'z': 8, 'b': 10, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46, 'op': 'shift_right'}
    instructions[1321] = {5'd2, 4'd0, 4'd3, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46, 'op': 'store'}
    instructions[1322] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46, 'op': 'addl'}
    instructions[1323] = {5'd1, 4'd7, 4'd4, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46 {'a': 4, 'literal': 0, 'z': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46, 'op': 'addl'}
    instructions[1324] = {5'd1, 4'd4, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46 {'a': 3, 'literal': 0, 'z': 4, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46, 'op': 'addl'}
    instructions[1325] = {5'd3, 4'd6, 4'd0, 16'd1347};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46 {'z': 6, 'label': 1347, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46, 'op': 'call'}
    instructions[1326] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46 {'a': 3, 'literal': -1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46, 'op': 'addl'}
    instructions[1327] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[1328] = {5'd5, 4'd7, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46 {'a': 3, 'z': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46, 'op': 'load'}
    instructions[1329] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[1330] = {5'd5, 4'd6, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46 {'a': 3, 'z': 6, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46, 'op': 'load'}
    instructions[1331] = {5'd1, 4'd3, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46 {'a': 3, 'literal': 0, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 46, 'op': 'addl'}
    instructions[1332] = {5'd0, 4'd8, 4'd0, 16'd33};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 47 {'literal': 33, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 47, 'op': 'literal'}
    instructions[1333] = {5'd1, 4'd2, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 47 {'a': 8, 'literal': 0, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 47, 'op': 'addl'}
    instructions[1334] = {5'd5, 4'd8, 4'd2, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 47 {'a': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 47, 'op': 'load'}
    instructions[1335] = {5'd2, 4'd0, 4'd3, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 47 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 47, 'op': 'store'}
    instructions[1336] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 47 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 47, 'op': 'addl'}
    instructions[1337] = {5'd1, 4'd8, 4'd4, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 47 {'a': 4, 'literal': 0, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 47, 'op': 'addl'}
    instructions[1338] = {5'd1, 4'd2, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 47 {'a': 8, 'literal': 0, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 47, 'op': 'addl'}
    instructions[1339] = {5'd5, 4'd8, 4'd2, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 47 {'a': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 47, 'op': 'load'}
    instructions[1340] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 47 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 47, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[1341] = {5'd5, 4'd0, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 47 {'a': 3, 'z': 0, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 47, 'op': 'load'}
    instructions[1342] = {5'd10, 4'd0, 4'd0, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 47 {'a': 0, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 47, 'op': 'write'}
    instructions[1343] = {5'd1, 4'd3, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 47 {'a': 3, 'literal': 0, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 47, 'op': 'addl'}
    instructions[1344] = {5'd1, 4'd3, 4'd4, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 40 {'a': 4, 'literal': 0, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 40, 'op': 'addl'}
    instructions[1345] = {5'd1, 4'd4, 4'd7, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 40 {'a': 7, 'literal': 0, 'z': 4, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 40, 'op': 'addl'}
    instructions[1346] = {5'd19, 4'd0, 4'd6, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 40 {'a': 6, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 40, 'op': 'return'}
    instructions[1347] = {5'd1, 4'd3, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 14 {'a': 3, 'literal': 0, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 14, 'op': 'addl'}
    instructions[1348] = {5'd0, 4'd8, 4'd0, 16'd5};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 15 {'literal': 5, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 15, 'op': 'literal'}
    instructions[1349] = {5'd2, 4'd0, 4'd3, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 15 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 15, 'op': 'store'}
    instructions[1350] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 15 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 15, 'op': 'addl'}
    instructions[1351] = {5'd1, 4'd8, 4'd4, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 15 {'a': 4, 'literal': -1, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 15, 'op': 'addl'}
    instructions[1352] = {5'd1, 4'd2, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 15 {'a': 8, 'literal': 0, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 15, 'op': 'addl'}
    instructions[1353] = {5'd5, 4'd8, 4'd2, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 15 {'a': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 15, 'op': 'load'}
    instructions[1354] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 15 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 15, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[1355] = {5'd5, 4'd10, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 15 {'a': 3, 'z': 10, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 15, 'op': 'load'}
    instructions[1356] = {5'd31, 4'd8, 4'd8, 16'd10};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 15 {'a': 8, 'z': 8, 'b': 10, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 15, 'op': 'unsigned_shift_right'}
    instructions[1357] = {5'd1, 4'd2, 4'd4, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 15 {'a': 4, 'literal': -1, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 15, 'op': 'addl'}
    instructions[1358] = {5'd2, 4'd0, 4'd2, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 15 {'a': 2, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 15, 'op': 'store'}
    instructions[1359] = {5'd1, 4'd8, 4'd4, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 16 {'a': 4, 'literal': -1, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 16, 'op': 'addl'}
    instructions[1360] = {5'd1, 4'd2, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 16 {'a': 8, 'literal': 0, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 16, 'op': 'addl'}
    instructions[1361] = {5'd5, 4'd8, 4'd2, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 16 {'a': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 16, 'op': 'load'}
    instructions[1362] = {5'd2, 4'd0, 4'd3, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 16 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 16, 'op': 'store'}
    instructions[1363] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 16 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 16, 'op': 'addl'}
    instructions[1364] = {5'd0, 4'd8, 4'd0, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 16 {'literal': 8, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 16, 'op': 'literal'}
    instructions[1365] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 16 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 16, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[1366] = {5'd5, 4'd10, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 16 {'a': 3, 'z': 10, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 16, 'op': 'load'}
    instructions[1367] = {5'd12, 4'd8, 4'd8, 16'd10};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 16 {'a': 8, 'z': 8, 'b': 10, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 16, 'op': 'subtract'}
    instructions[1368] = {5'd1, 4'd2, 4'd4, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 16 {'a': 4, 'literal': -1, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 16, 'op': 'addl'}
    instructions[1369] = {5'd2, 4'd0, 4'd2, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 16 {'a': 2, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 16, 'op': 'store'}
    instructions[1370] = {5'd1, 4'd8, 4'd4, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 17 {'a': 4, 'literal': -1, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 17, 'op': 'addl'}
    instructions[1371] = {5'd1, 4'd2, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 17 {'a': 8, 'literal': 0, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 17, 'op': 'addl'}
    instructions[1372] = {5'd5, 4'd8, 4'd2, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 17 {'a': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 17, 'op': 'load'}
    instructions[1373] = {5'd2, 4'd0, 4'd3, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 17 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 17, 'op': 'store'}
    instructions[1374] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 17 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 17, 'op': 'addl'}
    instructions[1375] = {5'd0, 4'd8, 4'd0, 16'd255};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 17 {'literal': 255, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 17, 'op': 'literal'}
    instructions[1376] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 17 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 17, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[1377] = {5'd5, 4'd10, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 17 {'a': 3, 'z': 10, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 17, 'op': 'load'}
    instructions[1378] = {5'd31, 4'd8, 4'd8, 16'd10};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 17 {'a': 8, 'z': 8, 'b': 10, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 17, 'op': 'unsigned_shift_right'}
    instructions[1379] = {5'd1, 4'd2, 4'd4, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 17 {'a': 4, 'literal': -1, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 17, 'op': 'addl'}
    instructions[1380] = {5'd2, 4'd0, 4'd2, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 17 {'a': 2, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 17, 'op': 'store'}
    instructions[1381] = {5'd0, 4'd8, 4'd0, 16'd19};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 18 {'literal': 19, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 18, 'op': 'literal'}
    instructions[1382] = {5'd1, 4'd2, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 18 {'a': 8, 'literal': 0, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 18, 'op': 'addl'}
    instructions[1383] = {5'd5, 4'd8, 4'd2, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 18 {'a': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 18, 'op': 'load'}
    instructions[1384] = {5'd2, 4'd0, 4'd3, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 18 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 18, 'op': 'store'}
    instructions[1385] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 18 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 18, 'op': 'addl'}
    instructions[1386] = {5'd1, 4'd8, 4'd4, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 18 {'a': 4, 'literal': -1, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 18, 'op': 'addl'}
    instructions[1387] = {5'd1, 4'd2, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 18 {'a': 8, 'literal': 0, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 18, 'op': 'addl'}
    instructions[1388] = {5'd5, 4'd8, 4'd2, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 18 {'a': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 18, 'op': 'load'}
    instructions[1389] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 18 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 18, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[1390] = {5'd5, 4'd0, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 18 {'a': 3, 'z': 0, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 18, 'op': 'load'}
    instructions[1391] = {5'd10, 4'd0, 4'd0, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 18 {'a': 0, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 18, 'op': 'write'}
    instructions[1392] = {5'd1, 4'd3, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 18 {'a': 3, 'literal': 0, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 18, 'op': 'addl'}
    instructions[1393] = {5'd1, 4'd3, 4'd4, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 14 {'a': 4, 'literal': 0, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 14, 'op': 'addl'}
    instructions[1394] = {5'd1, 4'd4, 4'd7, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 14 {'a': 7, 'literal': 0, 'z': 4, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 14, 'op': 'addl'}
    instructions[1395] = {5'd19, 4'd0, 4'd6, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 14 {'a': 6, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 14, 'op': 'return'}
    instructions[1396] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 32 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 32, 'op': 'addl'}
    instructions[1397] = {5'd0, 4'd8, 4'd0, 16'd16};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 34 {'literal': 16, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 34, 'op': 'literal'}
    instructions[1398] = {5'd2, 4'd0, 4'd3, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 34 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 34, 'op': 'store'}
    instructions[1399] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 34 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 34, 'op': 'addl'}
    instructions[1400] = {5'd0, 4'd8, 4'd0, 16'd255};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 34 {'literal': 255, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 34, 'op': 'literal'}
    instructions[1401] = {5'd2, 4'd0, 4'd3, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 34 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 34, 'op': 'store'}
    instructions[1402] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 34 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 34, 'op': 'addl'}
    instructions[1403] = {5'd1, 4'd8, 4'd4, -16'd2};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 34 {'a': 4, 'literal': -2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 34, 'op': 'addl'}
    instructions[1404] = {5'd1, 4'd2, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 34 {'a': 8, 'literal': 0, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 34, 'op': 'addl'}
    instructions[1405] = {5'd5, 4'd8, 4'd2, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 34 {'a': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 34, 'op': 'load'}
    instructions[1406] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 34 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 34, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[1407] = {5'd5, 4'd10, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 34 {'a': 3, 'z': 10, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 34, 'op': 'load'}
    instructions[1408] = {5'd23, 4'd8, 4'd8, 16'd10};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 34 {'a': 8, 'z': 8, 'b': 10, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 34, 'op': 'and'}
    instructions[1409] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 34 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 34, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[1410] = {5'd5, 4'd10, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 34 {'a': 3, 'z': 10, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 34, 'op': 'load'}
    instructions[1411] = {5'd15, 4'd8, 4'd8, 16'd10};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 34 {'a': 8, 'z': 8, 'b': 10, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 34, 'op': 'shift_left'}
    instructions[1412] = {5'd1, 4'd2, 4'd4, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 34 {'a': 4, 'literal': 0, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 34, 'op': 'addl'}
    instructions[1413] = {5'd2, 4'd0, 4'd2, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 34 {'a': 2, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 34, 'op': 'store'}
    instructions[1414] = {5'd0, 4'd8, 4'd0, 16'd255};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 35 {'literal': 255, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 35, 'op': 'literal'}
    instructions[1415] = {5'd2, 4'd0, 4'd3, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 35 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 35, 'op': 'store'}
    instructions[1416] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 35 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 35, 'op': 'addl'}
    instructions[1417] = {5'd1, 4'd8, 4'd4, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 35 {'a': 4, 'literal': -1, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 35, 'op': 'addl'}
    instructions[1418] = {5'd1, 4'd2, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 35 {'a': 8, 'literal': 0, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 35, 'op': 'addl'}
    instructions[1419] = {5'd5, 4'd8, 4'd2, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 35 {'a': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 35, 'op': 'load'}
    instructions[1420] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 35 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 35, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[1421] = {5'd5, 4'd10, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 35 {'a': 3, 'z': 10, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 35, 'op': 'load'}
    instructions[1422] = {5'd23, 4'd8, 4'd8, 16'd10};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 35 {'a': 8, 'z': 8, 'b': 10, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 35, 'op': 'and'}
    instructions[1423] = {5'd2, 4'd0, 4'd3, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 35 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 35, 'op': 'store'}
    instructions[1424] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 35 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 35, 'op': 'addl'}
    instructions[1425] = {5'd1, 4'd8, 4'd4, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 35 {'a': 4, 'literal': 0, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 35, 'op': 'addl'}
    instructions[1426] = {5'd1, 4'd2, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 35 {'a': 8, 'literal': 0, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 35, 'op': 'addl'}
    instructions[1427] = {5'd5, 4'd8, 4'd2, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 35 {'a': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 35, 'op': 'load'}
    instructions[1428] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 35 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 35, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[1429] = {5'd5, 4'd10, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 35 {'a': 3, 'z': 10, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 35, 'op': 'load'}
    instructions[1430] = {5'd16, 4'd8, 4'd8, 16'd10};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 35 {'a': 8, 'z': 8, 'b': 10, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 35, 'op': 'or'}
    instructions[1431] = {5'd1, 4'd2, 4'd4, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 35 {'a': 4, 'literal': 0, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 35, 'op': 'addl'}
    instructions[1432] = {5'd2, 4'd0, 4'd2, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 35 {'a': 2, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 35, 'op': 'store'}
    instructions[1433] = {5'd2, 4'd0, 4'd3, 16'd6};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36 {'a': 3, 'comment': 'push', 'b': 6, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36, 'op': 'store'}
    instructions[1434] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36, 'op': 'addl'}
    instructions[1435] = {5'd2, 4'd0, 4'd3, 16'd7};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36 {'a': 3, 'comment': 'push', 'b': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36, 'op': 'store'}
    instructions[1436] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36, 'op': 'addl'}
    instructions[1437] = {5'd0, 4'd8, 4'd0, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36 {'literal': 0, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36, 'op': 'literal'}
    instructions[1438] = {5'd2, 4'd0, 4'd3, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36, 'op': 'store'}
    instructions[1439] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36, 'op': 'addl'}
    instructions[1440] = {5'd1, 4'd8, 4'd4, -16'd2};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36 {'a': 4, 'literal': -2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36, 'op': 'addl'}
    instructions[1441] = {5'd1, 4'd2, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36 {'a': 8, 'literal': 0, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36, 'op': 'addl'}
    instructions[1442] = {5'd5, 4'd8, 4'd2, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36 {'a': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36, 'op': 'load'}
    instructions[1443] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[1444] = {5'd5, 4'd10, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36 {'a': 3, 'z': 10, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36, 'op': 'load'}
    instructions[1445] = {5'd30, 4'd8, 4'd8, 16'd10};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36 {'a': 8, 'z': 8, 'b': 10, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36, 'op': 'greater'}
    instructions[1446] = {5'd14, 4'd0, 4'd8, 16'd1451};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36 {'a': 8, 'label': 1451, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36, 'op': 'jmp_if_false'}
    instructions[1447] = {5'd1, 4'd8, 4'd4, -16'd2};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36 {'a': 4, 'literal': -2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36, 'op': 'addl'}
    instructions[1448] = {5'd1, 4'd2, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36 {'a': 8, 'literal': 0, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36, 'op': 'addl'}
    instructions[1449] = {5'd5, 4'd8, 4'd2, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36 {'a': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36, 'op': 'load'}
    instructions[1450] = {5'd8, 4'd0, 4'd8, 16'd1460};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36 {'a': 8, 'label': 1460, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36, 'op': 'goto'}
    instructions[1451] = {5'd1, 4'd8, 4'd4, -16'd2};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36 {'a': 4, 'literal': -2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36, 'op': 'addl'}
    instructions[1452] = {5'd1, 4'd2, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36 {'a': 8, 'literal': 0, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36, 'op': 'addl'}
    instructions[1453] = {5'd5, 4'd8, 4'd2, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36 {'a': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36, 'op': 'load'}
    instructions[1454] = {5'd2, 4'd0, 4'd3, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36, 'op': 'store'}
    instructions[1455] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36, 'op': 'addl'}
    instructions[1456] = {5'd0, 4'd8, 4'd0, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36 {'literal': 0, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36, 'op': 'literal'}
    instructions[1457] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[1458] = {5'd5, 4'd10, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36 {'a': 3, 'z': 10, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36, 'op': 'load'}
    instructions[1459] = {5'd12, 4'd8, 4'd8, 16'd10};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36 {'a': 8, 'z': 8, 'b': 10, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36, 'op': 'subtract'}
    instructions[1460] = {5'd2, 4'd0, 4'd3, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36, 'op': 'store'}
    instructions[1461] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36, 'op': 'addl'}
    instructions[1462] = {5'd1, 4'd7, 4'd4, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36 {'a': 4, 'literal': 0, 'z': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36, 'op': 'addl'}
    instructions[1463] = {5'd1, 4'd4, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36 {'a': 3, 'literal': 0, 'z': 4, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36, 'op': 'addl'}
    instructions[1464] = {5'd3, 4'd6, 4'd0, 16'd1347};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36 {'z': 6, 'label': 1347, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36, 'op': 'call'}
    instructions[1465] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36 {'a': 3, 'literal': -1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36, 'op': 'addl'}
    instructions[1466] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[1467] = {5'd5, 4'd7, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36 {'a': 3, 'z': 7, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36, 'op': 'load'}
    instructions[1468] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[1469] = {5'd5, 4'd6, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36 {'a': 3, 'z': 6, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36, 'op': 'load'}
    instructions[1470] = {5'd1, 4'd3, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36 {'a': 3, 'literal': 0, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 36, 'op': 'addl'}
    instructions[1471] = {5'd0, 4'd8, 4'd0, 16'd2};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 37 {'literal': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 37, 'op': 'literal'}
    instructions[1472] = {5'd1, 4'd2, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 37 {'a': 8, 'literal': 0, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 37, 'op': 'addl'}
    instructions[1473] = {5'd5, 4'd8, 4'd2, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 37 {'a': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 37, 'op': 'load'}
    instructions[1474] = {5'd2, 4'd0, 4'd3, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 37 {'a': 3, 'comment': 'push', 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 37, 'op': 'store'}
    instructions[1475] = {5'd1, 4'd3, 4'd3, 16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 37 {'a': 3, 'literal': 1, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 37, 'op': 'addl'}
    instructions[1476] = {5'd1, 4'd8, 4'd4, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 37 {'a': 4, 'literal': 0, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 37, 'op': 'addl'}
    instructions[1477] = {5'd1, 4'd2, 4'd8, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 37 {'a': 8, 'literal': 0, 'z': 2, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 37, 'op': 'addl'}
    instructions[1478] = {5'd5, 4'd8, 4'd2, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 37 {'a': 2, 'z': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 37, 'op': 'load'}
    instructions[1479] = {5'd1, 4'd3, 4'd3, -16'd1};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 37 {'a': 3, 'comment': 'pop', 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 37, 'literal': -1, 'z': 3, 'op': 'addl'}
    instructions[1480] = {5'd5, 4'd0, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 37 {'a': 3, 'z': 0, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 37, 'op': 'load'}
    instructions[1481] = {5'd10, 4'd0, 4'd0, 16'd8};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 37 {'a': 0, 'b': 8, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 37, 'op': 'write'}
    instructions[1482] = {5'd1, 4'd3, 4'd3, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 37 {'a': 3, 'literal': 0, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 37, 'op': 'addl'}
    instructions[1483] = {5'd1, 4'd3, 4'd4, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 32 {'a': 4, 'literal': 0, 'z': 3, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 32, 'op': 'addl'}
    instructions[1484] = {5'd1, 4'd4, 4'd7, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 32 {'a': 7, 'literal': 0, 'z': 4, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 32, 'op': 'addl'}
    instructions[1485] = {5'd19, 4'd0, 4'd6, 16'd0};///home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 32 {'a': 6, 'trace': /home/storage/Projects/FPGA-TX/fpga_tx/c_code/application.c : 32, 'op': 'return'}
  end
  always @(posedge clk)
  begin
    load_data <= memory[load_address];
    if(store_enable && state == execute) begin
      memory[store_address] <= store_data;
    end
  end
  // PIPELINE STAGE 1 -- FETCH INSTRUCTION
  always @(posedge clk)
  begin
    //implement memory for instructions
    if (state == instruction_fetch || state == operand_fetch || state == execute) begin
      instruction <= instructions[program_counter];
      program_counter_1 <= program_counter;
    end
  end
  assign opcode    = instruction[28:24];
  assign address_z = instruction[23:20];
  assign address_a = instruction[19:16];
  assign address_b = instruction[3:0];
  assign literal   = instruction[15:0];
  // PIPELINE STAGE 2 -- FETCH OPERANDS
  always @(posedge clk)
  begin
    if (write_enable) begin
      registers[address_z_3] <= result;
    end
    if (state == operand_fetch || state == execute) begin
      opcode_2 <= opcode;
      literal_2 <= literal;
      address_a_2 <= address_a;
      address_b_2 <= address_b;
      address_z_2 <= address_z;
      program_counter_2 <= program_counter_1;
    end
  end
  assign register_a = registers[address_a_2];
  assign register_b = registers[address_b_2];
  assign operand_a = (address_a_2 == address_z_3 && write_enable)?result:register_a;
  assign operand_b = (address_b_2 == address_z_3 && write_enable)?result:register_b;
  assign store_address = operand_a;
  assign load_address = operand_a;
  assign store_data = operand_b;
  assign store_enable = (opcode_2==2);
  // PIPELINE STAGE 3 -- EXECUTE
  always @(posedge clk)
  begin
  write_enable <= 0;
  timer_clock <= timer_clock + 1;
  case(state)
    //instruction_fetch
    instruction_fetch: begin
      program_counter <= program_counter + 1;
      state <= operand_fetch;
    end
    //operand_fetch
    operand_fetch: begin
      program_counter <= program_counter + 1;
      state <= execute;
    end
    //execute
    execute: begin
      program_counter <= program_counter + 1;
      address_z_3 <= address_z_2;
      case(opcode_2)
        //literal
        16'd0:
        begin
          result<=$signed(literal_2);
          write_enable <= 1;
        end
        //addl
        16'd1:
        begin
          result<=operand_a + literal_2;
          write_enable <= 1;
        end
        //store
        16'd2:
        begin
        end
        //call
        16'd3:
        begin
          result <= program_counter_2 + 1;
          write_enable <= 1;
          program_counter <= literal_2;
          state <= instruction_fetch;
        end
        //stop
        16'd4:
        begin
        state <= stop;
        end
        //load
        16'd5:
        begin
          state <= load;
        end
        //equal
        16'd6:
        begin
          result <= operand_a == operand_b;
          write_enable <= 1;
        end
        //jmp_if_true
        16'd7:
        begin
          if (operand_a != 0) begin
            program_counter <= literal_2;
            state <= instruction_fetch;
          end
        end
        //goto
        16'd8:
        begin
          program_counter <= literal_2;
          state <= instruction_fetch;
        end
        //read
        16'd9:
        begin
          state <= read;
          read_input <= operand_a;
        end
        //write
        16'd10:
        begin
          state <= write;
          write_output <= operand_a;
          write_value <= operand_b;
        end
        //timer_low
        16'd11:
        begin
          result <= timer_clock[31:0];
          write_enable <= 1;
        end
        //subtract
        16'd12:
        begin
          long_result = operand_a + (~operand_b) + 1;
          result <= long_result[31:0];
          carry[0] <= ~long_result[32];
          write_enable <= 1;
        end
        //unsigned_greater
        16'd13:
        begin
          result <= $unsigned(operand_a) > $unsigned(operand_b);
          write_enable <= 1;
        end
        //jmp_if_false
        16'd14:
        begin
          if (operand_a == 0) begin
            program_counter <= literal_2;
            state <= instruction_fetch;
          end
        end
        //shift_left
        16'd15:
        begin
          if(operand_b < 32) begin
            result <= operand_a << operand_b;
            carry <= operand_a >> (32-operand_b);
          end else begin
            result <= 0;
            carry <= operand_a;
          end
          write_enable <= 1;
        end
        //or
        16'd16:
        begin
          result <= operand_a | operand_b;
          write_enable <= 1;
        end
        //literal_hi
        16'd17:
        begin
          result<= {literal_2, operand_a[15:0]};
          write_enable <= 1;
        end
        //add
        16'd18:
        begin
          long_result = operand_a + operand_b;
          result <= long_result[31:0];
          carry[0] <= long_result[32];
          write_enable <= 1;
        end
        //return
        16'd19:
        begin
          program_counter <= operand_a;
          state <= instruction_fetch;
        end
        //wait_clocks
        16'd20:
        begin
          timer <= operand_a;
          state <= wait_state;
        end
        //ready
        16'd21:
        begin
          result <= 0;
          case(operand_a)
            0:
            begin
              result[0] <= input_rs232_rx_stb;
            end
            1:
            begin
              result[0] <= input_gps_rx_stb;
            end
            2:
            begin
              result[0] <= input_gps_count_stb;
            end
          endcase
          write_enable <= 1;
        end
        //unsigned_divide
        16'd22:
        begin
          dividend  <= operand_a;
          divisor <= operand_b;
          timer <= 32;
          remainder <= 0;
          quotient  <= 0;
          state <= unsigned_divide;
        end
        //and
        16'd23:
        begin
          result <= operand_a & operand_b;
          write_enable <= 1;
        end
        //a_lo
        16'd24:
        begin
          a_lo <= operand_a;
          result <= a_lo;
          write_enable <= 1;
        end
        //report
        16'd25:
        begin
          $display ("%d (report (int) at line: 26 in file: /usr/local/lib/python2.7/dist-packages/chips/compiler/include/print.h)", $signed(a_lo));
        end
        //unsigned_modulo
        16'd26:
        begin
          dividend  <= operand_a;
          divisor <= operand_b;
          timer <= 32;
          remainder <= 0;
          quotient  <= 0;
          state <= unsigned_modulo;
        end
        //multiply
        16'd27:
        begin
          product_a <= operand_a[15:0]  * operand_b[15:0];
          product_b <= operand_a[15:0]  * operand_b[31:16];
          product_c <= operand_a[31:16] * operand_b[15:0];
          product_d <= operand_a[31:16] * operand_b[31:16];
          state <= multiply;
        end
        //greater_equal
        16'd28:
        begin
          result <= $signed(operand_a) >= $signed(operand_b);
          write_enable <= 1;
        end
        //shift_right
        16'd29:
        begin
          if(operand_b < 32) begin
            result <= $signed(operand_a) >>> operand_b;
            carry <= operand_a << (32-operand_b);
          end else begin
            result <= operand_a[31]?-1:0;
            carry <= operand_a;
          end
          write_enable <= 1;
        end
        //greater
        16'd30:
        begin
          result <= $signed(operand_a) > $signed(operand_b);
          write_enable <= 1;
        end
        //unsigned_shift_right
        16'd31:
        begin
          if(operand_b < 32) begin
            result <= operand_a >> operand_b;
            carry <= operand_a << (32-operand_b);
          end else begin
            result <= 0;
            carry <= operand_a;
          end
          write_enable <= 1;
        end
      endcase
    end
    multiply:
    begin
      long_result = product_a +
                    (product_b << 16) +
                    (product_c << 16) +
                    (product_d << 32);
      result <= long_result[31:0];
      carry <= long_result[63:32];
      write_enable <= 1;
      state <= execute;
    end
    unsigned_divide:
    begin
      if (timer) begin
        timer <= timer - 1;
      end else begin
        result <= quotient;
        state <= execute;
        write_enable <= 1;
      end
    end
    unsigned_modulo:
    begin
      if (timer) begin
        timer <= timer - 1;
      end else begin
        result <= remainder;
        state <= execute;
        write_enable <= 1;
      end
    end
    read:
    begin
      case(read_input)
      0:
      begin
        s_input_rs232_rx_ack <= 1;
        if (s_input_rs232_rx_ack && input_rs232_rx_stb) begin
          result <= input_rs232_rx;
          write_enable <= 1;
          s_input_rs232_rx_ack <= 0;
          state <= execute;
        end
      end
      1:
      begin
        s_input_gps_rx_ack <= 1;
        if (s_input_gps_rx_ack && input_gps_rx_stb) begin
          result <= input_gps_rx;
          write_enable <= 1;
          s_input_gps_rx_ack <= 0;
          state <= execute;
        end
      end
      2:
      begin
        s_input_gps_count_ack <= 1;
        if (s_input_gps_count_ack && input_gps_count_stb) begin
          result <= input_gps_count;
          write_enable <= 1;
          s_input_gps_count_ack <= 0;
          state <= execute;
        end
      end
      endcase
    end
    write:
    begin
      case(write_output)
      3:
      begin
        s_output_freq_out_stb <= 1;
        s_output_freq_out <= write_value;
        if (output_freq_out_ack && s_output_freq_out_stb) begin
          s_output_freq_out_stb <= 0;
          state <= execute;
        end
      end
      4:
      begin
        s_output_am_out_stb <= 1;
        s_output_am_out <= write_value;
        if (output_am_out_ack && s_output_am_out_stb) begin
          s_output_am_out_stb <= 0;
          state <= execute;
        end
      end
      5:
      begin
        s_output_ctl_out_stb <= 1;
        s_output_ctl_out <= write_value;
        if (output_ctl_out_ack && s_output_ctl_out_stb) begin
          s_output_ctl_out_stb <= 0;
          state <= execute;
        end
      end
      6:
      begin
        s_output_rs232_tx_stb <= 1;
        s_output_rs232_tx <= write_value;
        if (output_rs232_tx_ack && s_output_rs232_tx_stb) begin
          s_output_rs232_tx_stb <= 0;
          state <= execute;
        end
      end
      7:
      begin
        s_output_gps_tx_stb <= 1;
        s_output_gps_tx <= write_value;
        if (output_gps_tx_ack && s_output_gps_tx_stb) begin
          s_output_gps_tx_stb <= 0;
          state <= execute;
        end
      end
      8:
      begin
        s_output_leds_stb <= 1;
        s_output_leds <= write_value;
        if (output_leds_ack && s_output_leds_stb) begin
          s_output_leds_stb <= 0;
          state <= execute;
        end
      end
      endcase
    end
    load:
    begin
        result <= load_data;
        write_enable <= 1;
        state <= execute;
    end
    wait_state:
    begin
      if (timer) begin
        timer <= timer - 1;
      end else begin
        state <= execute;
      end
    end
    stop:
    begin
    end
    endcase
    //divider kernel logic
    repeat (1) begin
      shifter = {remainder[30:0], dividend[31]};
      difference = shifter - divisor;
      dividend = dividend << 1;
      if (difference[32]) begin
        remainder = shifter;
        quotient = quotient << 1;
      end else begin
        remainder = difference[31:0];
        quotient = quotient << 1 | 1;
      end
    end
    if (rst == 1'b1) begin
      timer <= 0;
      timer_clock <= 0;
      program_counter <= 0;
      address_z_3 <= 0;
      result <= 0;
      a = 0;
      b = 0;
      z = 0;
      state <= instruction_fetch;
      s_input_rs232_rx_ack <= 0;
      s_input_gps_rx_ack <= 0;
      s_input_gps_count_ack <= 0;
      s_output_freq_out_stb <= 0;
      s_output_am_out_stb <= 0;
      s_output_ctl_out_stb <= 0;
      s_output_rs232_tx_stb <= 0;
      s_output_gps_tx_stb <= 0;
      s_output_leds_stb <= 0;
    end
  end
  assign input_rs232_rx_ack = s_input_rs232_rx_ack;
  assign input_gps_rx_ack = s_input_gps_rx_ack;
  assign input_gps_count_ack = s_input_gps_count_ack;
  assign output_freq_out_stb = s_output_freq_out_stb;
  assign output_freq_out = s_output_freq_out;
  assign output_am_out_stb = s_output_am_out_stb;
  assign output_am_out = s_output_am_out;
  assign output_ctl_out_stb = s_output_ctl_out_stb;
  assign output_ctl_out = s_output_ctl_out;
  assign output_rs232_tx_stb = s_output_rs232_tx_stb;
  assign output_rs232_tx = s_output_rs232_tx;
  assign output_gps_tx_stb = s_output_gps_tx_stb;
  assign output_gps_tx = s_output_gps_tx;
  assign output_leds_stb = s_output_leds_stb;
  assign output_leds = s_output_leds;
endmodule