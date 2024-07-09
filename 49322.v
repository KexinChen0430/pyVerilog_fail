module user_design
   (IN1_STB,
    OUT1_ACK,
    DATA_ACK,
    Q,
    ETH_CLK_OBUF,
    IN1_ACK,
    INTERNAL_RST_reg,
    OUT1_STB_reg,
    S_DATA_STB_reg,
    OUT1_STB,
    DATA,
    OUT1,
    S_DATA_STB_reg_0);
  output IN1_STB;
  output OUT1_ACK;
  output DATA_ACK;
  output [7:0]Q;
  input ETH_CLK_OBUF;
  input IN1_ACK;
  input INTERNAL_RST_reg;
  input OUT1_STB_reg;
  input S_DATA_STB_reg;
  input OUT1_STB;
  input [7:0]DATA;
  input [7:0]OUT1;
  input S_DATA_STB_reg_0;
  wire [7:0]DATA;
  wire DATA_ACK;
  wire ETH_CLK_OBUF;
  wire IN1_ACK;
  wire IN1_STB;
  wire INTERNAL_RST_reg;
  wire [7:0]OUT1;
  wire OUT1_ACK;
  wire OUT1_STB;
  wire OUT1_STB_reg;
  wire [7:0]Q;
  wire S_DATA_STB_reg;
  wire S_DATA_STB_reg_0;
  wire main_0_139931283423456_n_2;
  wire \s_output_rs232_tx_stb[0]_i_1_n_0 ;
  main_0 main_0_139931283423456
       (.DATA(DATA),
        .DATA_ACK(DATA_ACK),
        .E(main_0_139931283423456_n_2),
        .ETH_CLK_OBUF(ETH_CLK_OBUF),
        .IN1_ACK(IN1_ACK),
        .IN1_STB(IN1_STB),
        .INTERNAL_RST_reg(INTERNAL_RST_reg),
        .OUT1(OUT1),
        .OUT1_ACK(OUT1_ACK),
        .OUT1_STB(OUT1_STB),
        .OUT1_STB_reg(OUT1_STB_reg),
        .Q(Q),
        .S_DATA_STB_reg(S_DATA_STB_reg),
        .S_DATA_STB_reg_0(S_DATA_STB_reg_0),
        .S_IN1_ACK_reg(\s_output_rs232_tx_stb[0]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h7C))
    \s_output_rs232_tx_stb[0]_i_1
       (.I0(IN1_ACK),
        .I1(main_0_139931283423456_n_2),
        .I2(IN1_STB),
        .O(\s_output_rs232_tx_stb[0]_i_1_n_0 ));
endmodule