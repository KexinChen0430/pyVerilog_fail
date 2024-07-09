module tb_pixelfeed();
reg sys_clk;
initial sys_clk = 1'b0;
always #5 sys_clk = ~sys_clk;
reg sys_rst;
reg vga_rst;
wire pixel_valid;
wire fml_stb;
wire [25:0] fml_adr;
initial begin
	sys_rst = 1'b1;
	vga_rst = 1'b1;
	#20 sys_rst = 1'b0;
	#20 vga_rst = 1'b0;
end
vgafb_pixelfeed dut(
	.sys_clk(sys_clk),
	.sys_rst(sys_rst),
	.vga_rst(vga_rst),
	.nbursts(18'd100),
	.baseaddress(26'd1024),
	.baseaddress_ack(),
	.fml_adr(fml_adr),
	.fml_stb(fml_stb),
	.fml_ack(fml_stb),
	.fml_di(64'hcafebabedeadbeef),
	.pixel_valid(pixel_valid),
	.pixel(),
	.pixel_ack(pixel_valid)
);
always @(posedge sys_clk) $display("%x", fml_adr);
initial #600 $finish;
endmodule