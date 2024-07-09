module
    .data_out0    (data0),
    .data_out1    (data1),
    .data_out2    (data2),
    .data_out3    (data3),
    .data_out4    (data4),
    .data_out5    (data5),
    .data_out6    (data6),
    .data_out7    (data7),
    .data_out8    (data8),
    .data_out9    (data9)
    );
  HuffmanCode huffmancode (
    .clk        (clk),
    .rst_n      (rst_n),
    .data_in0  (data0),
    .data_in1  (data1),
    .data_in2  (data2),
    .data_in3  (data3),
    .data_in4  (data4),
    .data_in5  (data5),
    .data_in6  (data6),
    .data_in7  (data7),
    .data_in8  (data8),
    .data_in9  (data9),
    .req_coding (req_coding),
    .ack_coding (ack_coding),
    .data_out   (data_para),
    .data_len   (data_len),
    .trans_start(trans_start)
    );
  para2ser para2ser_inst(
    .clk          (clk),
    .rst_n        (rst_n),
    .trans_start  (trans_start),   // indicate tansform begin, level signal
    .data         (data_para),          // signal:0-9   max coding length:9
    .data_len     (data_len),      // 9 - 1
    .output_data  (output_data),    // MSB first
    .output_start (output_start),
    .output_done  (output_done)
    );
endmodule