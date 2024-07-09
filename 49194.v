module is reset *after*
//it's clock has begun
always @(posedge clk_i2c_in) begin
	if (reset == 1) begin
	end else begin
		i2c_reset <= 0;
	end
end //posedge clk_i2c_in
//Every 1s I read a new value from EEPROM
always @(posedge tick_1s) begin
end //posedge tick_1s
read_eeprom instance_name (
    .clk(clk),
    .reset(reset),
    .slave_addr_w(slave_addr),
    .mem_addr_w(mem_addr),
    .read_nbytes_w(read_nbytes),
    .start(start),
    .data_out(data_out),
    .byte_ready(byte_ready),
    .i2c_slave_addr(i2c_slave_addr),
    .i2c_rw(i2c_rw),
    .i2c_write_data(i2c_write_data),
    .i2c_nbytes(i2c_nbytes),
    .i2c_read_data(i2c_read_data),
    .i2c_tx_data_req(i2c_tx_data_req),
    .i2c_rx_data_ready(i2c_rx_data_ready),
    .i2c_start(i2c_start)
    );
wire ready;
wire busy;
wire i2c_reset;
clk_divider i2c_clk_divider (
    .reset(reset),
    .clk_in(clk),
    .clk_out(clk_i2c_in)
    );
i2c_master instance_name (
    .clk(clk_i2c_in),
    .reset(i2c_reset),
    .start(i2c_start),
    .nbytes_in(i2c_nbytes),
    .addr_in(i2c_slave_addr),
    .rw_in(i2c_rw),
    .write_data(i2c_write_data),
    .read_data(i2c_read_data),
    .tx_data_req(i2c_tx_data_req),
    .rx_data_ready(i2c_rx_data_ready),
    .sda_w(i2c_sda),
    .scl(i2c_scl),
    .ready(ready),
    .busy(busy)
    );
*/
endmodule