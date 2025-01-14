module dvi_encoder_13 (
         input pclk,
         input pclkx2,
         input pclkx10,
         input strobe,
         input rst,
         input [7:0] red,
         input [7:0] green,
         input [7:0] blue,
         input hsync,
         input vsync,
         input de,
         output reg [3:0] tmds,
         output reg [3:0] tmdsb
       );
reg M_toggle_d, M_toggle_q = 1'h0;
wire [1-1:0] M_clkser_iob_out;
reg [5-1:0] M_clkser_data;
serdes_n_to_1_22 clkser (
                   .ioclk(pclkx10),
                   .strobe(strobe),
                   .gclk(pclkx2),
                   .rst(rst),
                   .data(M_clkser_data),
                   .iob_out(M_clkser_iob_out)
                 );
wire [1-1:0] M_clkbuf_O;
wire [1-1:0] M_clkbuf_OB;
OBUFDS clkbuf (
         .I(M_clkser_iob_out),
         .O(M_clkbuf_O),
         .OB(M_clkbuf_OB)
       );
wire [10-1:0] M_enc_blue_data_out;
reg [8-1:0] M_enc_blue_data_in;
reg [1-1:0] M_enc_blue_c0;
reg [1-1:0] M_enc_blue_c1;
reg [1-1:0] M_enc_blue_de;
tmds_encoder_24 enc_blue (
                  .clk(pclk),
                  .rst(rst),
                  .data_in(M_enc_blue_data_in),
                  .c0(M_enc_blue_c0),
                  .c1(M_enc_blue_c1),
                  .de(M_enc_blue_de),
                  .data_out(M_enc_blue_data_out)
                );
wire [10-1:0] M_enc_green_data_out;
reg [8-1:0] M_enc_green_data_in;
reg [1-1:0] M_enc_green_c0;
reg [1-1:0] M_enc_green_c1;
reg [1-1:0] M_enc_green_de;
tmds_encoder_24 enc_green (
                  .clk(pclk),
                  .rst(rst),
                  .data_in(M_enc_green_data_in),
                  .c0(M_enc_green_c0),
                  .c1(M_enc_green_c1),
                  .de(M_enc_green_de),
                  .data_out(M_enc_green_data_out)
                );
wire [10-1:0] M_enc_red_data_out;
reg [8-1:0] M_enc_red_data_in;
reg [1-1:0] M_enc_red_c0;
reg [1-1:0] M_enc_red_c1;
reg [1-1:0] M_enc_red_de;
tmds_encoder_24 enc_red (
                  .clk(pclk),
                  .rst(rst),
                  .data_in(M_enc_red_data_in),
                  .c0(M_enc_red_c0),
                  .c1(M_enc_red_c1),
                  .de(M_enc_red_de),
                  .data_out(M_enc_red_data_out)
                );
wire [15-1:0] M_fifo_data_out;
reg [30-1:0] M_fifo_data_in;
fifo_2x_reducer_27 fifo (
                     .rst(rst),
                     .clk(pclk),
                     .clkx2(pclkx2),
                     .data_in(M_fifo_data_in),
                     .data_out(M_fifo_data_out)
                   );
wire [1-1:0] M_redser_iob_out;
reg [5-1:0] M_redser_data;
serdes_n_to_1_22 redser (
                   .ioclk(pclkx10),
                   .strobe(strobe),
                   .gclk(pclkx2),
                   .rst(rst),
                   .data(M_redser_data),
                   .iob_out(M_redser_iob_out)
                 );
wire [1-1:0] M_greenser_iob_out;
reg [5-1:0] M_greenser_data;
serdes_n_to_1_22 greenser (
                   .ioclk(pclkx10),
                   .strobe(strobe),
                   .gclk(pclkx2),
                   .rst(rst),
                   .data(M_greenser_data),
                   .iob_out(M_greenser_iob_out)
                 );
wire [1-1:0] M_blueser_iob_out;
reg [5-1:0] M_blueser_data;
serdes_n_to_1_22 blueser (
                   .ioclk(pclkx10),
                   .strobe(strobe),
                   .gclk(pclkx2),
                   .rst(rst),
                   .data(M_blueser_data),
                   .iob_out(M_blueser_iob_out)
                 );
wire [1-1:0] M_redbuf_O;
wire [1-1:0] M_redbuf_OB;
OBUFDS redbuf (
         .I(M_redser_iob_out),
         .O(M_redbuf_O),
         .OB(M_redbuf_OB)
       );
wire [1-1:0] M_greenbuf_O;
wire [1-1:0] M_greenbuf_OB;
OBUFDS greenbuf (
         .I(M_greenser_iob_out),
         .O(M_greenbuf_O),
         .OB(M_greenbuf_OB)
       );
wire [1-1:0] M_bluebuf_O;
wire [1-1:0] M_bluebuf_OB;
OBUFDS bluebuf (
         .I(M_blueser_iob_out),
         .O(M_bluebuf_O),
         .OB(M_bluebuf_OB)
       );
always @* begin
  M_toggle_d = M_toggle_q;
  M_toggle_d = ~M_toggle_q;
  M_clkser_data = {3'h5{~M_toggle_q}};
  tmds[3+0-:1] = M_clkbuf_O;
  tmdsb[3+0-:1] = M_clkbuf_OB;
  M_enc_red_data_in = red;
  M_enc_green_data_in = green;
  M_enc_blue_data_in = blue;
  M_enc_red_c0 = hsync;
  M_enc_red_c1 = vsync;
  M_enc_red_de = de;
  M_enc_green_c0 = hsync;
  M_enc_green_c1 = vsync;
  M_enc_green_de = de;
  M_enc_blue_c0 = hsync;
  M_enc_blue_c1 = vsync;
  M_enc_blue_de = de;
  M_fifo_data_in = {M_enc_red_data_out[5+4-:5], M_enc_green_data_out[5+4-:5], M_enc_blue_data_out[5+4-:5], M_enc_red_data_out[0+4-:5], M_enc_green_data_out[0+4-:5], M_enc_blue_data_out[0+4-:5]};
  M_redser_data = M_fifo_data_out[10+4-:5];
  M_greenser_data = M_fifo_data_out[5+4-:5];
  M_blueser_data = M_fifo_data_out[0+4-:5];
  tmds[0+0-:1] = M_bluebuf_O;
  tmdsb[0+0-:1] = M_bluebuf_OB;
  tmds[1+0-:1] = M_greenbuf_O;
  tmdsb[1+0-:1] = M_greenbuf_OB;
  tmds[2+0-:1] = M_redbuf_O;
  tmdsb[2+0-:1] = M_redbuf_OB;
end
always @(posedge pclkx2) begin
  if (rst == 1'b1) begin
    M_toggle_q <= 1'h0;
  end else begin
    M_toggle_q <= M_toggle_d;
  end
end
endmodule