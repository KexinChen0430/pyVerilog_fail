module bsg_binary_plus_one_to_gray #(parameter `BSG_INV_PARAM(width_p ))
   (input [width_p-1:0] binary_i
    , output [width_p-1:0] gray_o
    );
   wire [width_p-1:0] binary_scan;
   bsg_scan #(.width_p(width_p)
              ,.and_p(1)
              ,.lo_to_hi_p(1)
              ) scan_and (.i(binary_i), .o(binary_scan));
   wire [width_p:0]   temp = { 1'b0, binary_scan[width_p-2:0], 1'b1};
   wire [width_p-1:0] edge_detect = ~temp[width_p:1] & temp[width_p-1:0];
   // xor gray code of binary_i with the bit that should change
   assign gray_o = (binary_i >> 1) ^ (binary_i) ^ edge_detect;
endmodule