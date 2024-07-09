module XOR_Shift_Block(block_input,
                       poly,
                       data_input,
                       block_output);
  parameter crc_width = 32;
  input [(crc_width-1):0] block_input;
  input [(crc_width-1):0] poly;
  input [7:0] data_input;
  output [(crc_width-1):0] block_output;
  wire [(crc_width-1):0] cascade [7:0];
  XOR_Shift bit_0(.stage_input(block_input), .poly(poly), .new_bit(data_input[7]), .stage_output(cascade[0]));
    defparam bit_0.crc_width = crc_width;
  XOR_Shift bit_1(.stage_input(cascade[0]), .poly(poly), .new_bit(data_input[6]), .stage_output(cascade[1]));
    defparam bit_1.crc_width = crc_width;
  XOR_Shift bit_2(.stage_input(cascade[1]), .poly(poly), .new_bit(data_input[5]), .stage_output(cascade[2]));
    defparam bit_2.crc_width = crc_width;
  XOR_Shift bit_3(.stage_input(cascade[2]), .poly(poly), .new_bit(data_input[4]), .stage_output(cascade[3]));
    defparam bit_3.crc_width = crc_width;
  XOR_Shift bit_4(.stage_input(cascade[3]), .poly(poly), .new_bit(data_input[3]), .stage_output(cascade[4]));
    defparam bit_4.crc_width = crc_width;
  XOR_Shift bit_5(.stage_input(cascade[4]), .poly(poly), .new_bit(data_input[2]), .stage_output(cascade[5]));
    defparam bit_5.crc_width = crc_width;
  XOR_Shift bit_6(.stage_input(cascade[5]), .poly(poly), .new_bit(data_input[1]), .stage_output(cascade[6]));
    defparam bit_6.crc_width = crc_width;
  XOR_Shift bit_7(.stage_input(cascade[6]), .poly(poly), .new_bit(data_input[0]), .stage_output(cascade[7]));
    defparam bit_7.crc_width = crc_width;
  assign block_output = cascade[7];
endmodule