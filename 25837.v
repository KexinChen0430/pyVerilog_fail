module krake_port_tb();
reg tb_clk;
reg tb_rst;
reg tb_en;
wire  tb_dout;
reg clka;
reg clkb;
reg clkc;
reg clkd;
reg        tb_we_o;
reg  [7:0] tb_dat_o;
reg  [4:0] tb_adr_o;
reg        tb_stb_o;
wire [7:0] tb_dat_i;
wire       tb_ack_i;
reg  [7:0] tb_cnt_a;
reg  [7:0] tb_cnt_d;
wire  [5:0] ch_in;
wire  [5:0] ch_out;
wire  [5:0] ch_oe;
krake_port_tx2 krake_porti(
    .clk_i(tb_clk),
    .rst_i(tb_rst),
    .ack_o(tb_ack_i),
    .dat_i(tb_dat_o),
    .adr_i(tb_adr_o),
    .dat_o(tb_dat_i),
    .stb_i(tb_stb_o),
    .we_i(tb_we_o),
    .ch_in(ch_in),
    .ch_out(ch_out),
    .ch_oe(ch_oe),
    .clka(clka),
    .clkb(clkb),
    .clkc(clkc),
    .clkd(clkd));
assign ch_in[0] = ch_oe[0] ? ch_out[0] : 1'bz;
assign ch_in[1] = ch_oe[1] ? ch_out[1] : 1'bz;
assign ch_in[2] = ch_oe[2] ? ch_out[2] : 1'bz;
assign ch_in[3] = ch_oe[3] ? ch_out[3] : 1'bz;
assign ch_in[4] = ch_oe[4] ? ch_out[4] : 1'bz;
assign ch_in[5] = ch_oe[5] ? ch_out[5] : 1'bz;
//end
initial
begin
  tb_clk <= 1'b0;
  tb_rst <= 1'b0;
  tb_en <= 1'b0;
  clka <= 1'b0;
  clkb <= 1'b0;
  clkc <= 1'b0;
  clkd <= 1'b0;
  #5 tb_rst <= 1'b1;
  #20 tb_rst <= 1'b0;
  tb_en <= 1'b1;
end
// Generate clock (25MHz)
always
begin
  #20 clka <= ~clka;
end
// Generate clock (12.5MHz)
always
begin
  #40 clkb <= ~clkb;
end
// Generate clock (6.25MHz)
always
begin
  #80 clkc <= ~clkc;
end
// Generate clock (3.125MHz)
always
begin
  #160 clkd <= ~clkd;
end
// Generate a system clock (50MHz)
always
begin
  #10 tb_clk <= ~tb_clk;
end
task wb_write;
input [7:0] adr_o;
input [7:0] dat_o;
begin
  @(posedge tb_clk);
  tb_stb_o <= 1'b1;
  tb_we_o <= 1'b1;
  tb_dat_o <= dat_o;
  tb_adr_o <= adr_o;
  @(posedge tb_clk);
  tb_stb_o <= 1'b0;
  @(posedge tb_clk);
  if(!tb_ack_i)
  begin
    $display("Write failed: 0x%02H, 0x%02H", tb_adr_o, tb_dat_o);
  end
end
endtask
reg [7:0] read_data;
task wb_read;
input [7:0] adr_o;
begin
  @(posedge tb_clk);
  tb_stb_o <= 1'b1;
  tb_we_o <= 1'b0;
  tb_adr_o <= adr_o;
  @(posedge tb_clk);
  tb_stb_o <= 1'b0;
  @(posedge tb_clk);
  read_data <= tb_dat_i;
  if(!tb_ack_i)
  begin
    $display("Read failed: 0x%02H, 0x%02H", tb_adr_o, tb_dat_i);
  end
end
endtask
always @(posedge tb_rst)
begin
  tb_dat_o <= 8'h00;
  tb_we_o <= 1'b0;
  tb_adr_o <= 4'd0;
  tb_cnt_a <= 8'd0;
  tb_cnt_d <= 8'd0;
end
initial
begin
  wait(tb_en)
  // (r/w) Peripheral configuration register
  #1 wb_read(`UART_STATUS);
  #1 if(read_data != 8'h01) $stop;
  #1 wb_write(`UART_DATAREG, 8'b10101010);
  #1 wb_read(`UART_DATAREG);
  #1 if(read_data != 8'b10101010) $stop;
  #1 wb_write(`UART_STATUS, 8'h01);
  #1 wb_read(`UART_STATUS);
  wait (krake_porti.tx_rdy == 1);
  #1 wb_read(`UART_STATUS);
  #1 if(read_data != 8'b00000001) $stop;
  #1 wb_write(`UART_DATAREG, 8'b00001111);
  #1 wb_write(`UART_STATUS, 8'b00000001);
  #1 wb_read(`UART_STATUS);
  wait (krake_porti.tx_rdy == 1);
  #1 wb_read(`UART_STATUS);
  #1 if(read_data != 8'b00000001) $stop;
  //#1 wb_read(`PORT_CONF);
  //#1 wb_write(`PORT_CONF,8'hff);
  //#1 wb_read(`PORT_CONF);
  //#1 if(read_data != 8'h3f) $stop;
  // (r/w) Port status
  //#1 wb_read(`PORT_STATUS);
  //#1 wb_write(`PORT_STATUS,8'hff);
  //#1 wb_read(`PORT_STATUS);
  //#1 if(read_data != 8'h3f) $stop;
  // (r/w) Output clocks
  //#1 wb_read(`PORT_PIN0_CONF);
  //#1 wb_write(`PORT_PIN0_CONF,8'h00);
  //#1 wb_read(`PORT_PIN0_CONF);
  //#1 if(read_data != 8'h00) $stop;
  // (r/w) Output clocks
  //#1 wb_read(`PORT_PIN1_CONF);
  //#1 wb_write(`PORT_PIN1_CONF,8'h01);
  //#1 wb_read(`PORT_PIN1_CONF);
  //#1 if(read_data != 8'h01) $stop;
  // (r/w) Output clocks
  //#1 wb_read(`PORT_PIN2_CONF);
  //#1 wb_write(`PORT_PIN2_CONF,8'h03);
  //#1 wb_read(`PORT_PIN2_CONF);
  //#1 if(read_data != 8'h03) $stop;
  // (r/w) Output clocks
  //#1 wb_read(`PORT_PIN3_CONF);
  //#1 wb_write(`PORT_PIN3_CONF,8'h07);
  //#1 wb_read(`PORT_PIN3_CONF);
  //#1 if(read_data != 8'h07) $stop;
  // (r/w) Output clocks
  //#1 wb_read(`PORT_PIN4_CONF);
  //#1 wb_write(`PORT_PIN4_CONF,8'h0f);
  //#1 wb_read(`PORT_PIN4_CONF);
  //#1 if(read_data != 8'h0f) $stop;
  // (r/w) Output clocks
  //#1 wb_read(`PORT_PIN5_CONF);
  //#1 wb_write(`PORT_PIN5_CONF,8'h1f);
  //#1 wb_read(`PORT_PIN5_CONF);
  //#1 if(read_data != 8'h1f) $stop;
  //$display("Testbench completed successfully!");
  //$stop;
end
endmodule