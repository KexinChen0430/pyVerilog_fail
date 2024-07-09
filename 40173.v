module mpx_regfile_xil
(
    clk_i,
    rst_i,
    en_i,
    wr_i,
    rs_i,
    rt_i,
    rd_i,
    reg_rs_o,
    reg_rt_o,
    reg_rd_i
);
// I/O
input           clk_i       /*verilator public*/;
input           rst_i       /*verilator public*/;
input           en_i        /*verilator public*/;
input           wr_i        /*verilator public*/;
input [4:0]     rs_i        /*verilator public*/;
input [4:0]     rt_i        /*verilator public*/;
input [4:0]     rd_i        /*verilator public*/;
output [31:0]   reg_rs_o    /*verilator public*/;
output [31:0]   reg_rt_o    /*verilator public*/;
input [31:0]    reg_rd_i    /*verilator public*/;
// Registers
reg [4:0]       addr_write;
wire [31:0]     data_out1;
wire [31:0]     data_out2;
reg             write_enable;
wire [31:0]     data_out1a;
wire [31:0]     data_out1b;
wire [31:0]     data_out2a;
wire [31:0]     data_out2b;
wire            wea;
wire            web;
reg [31:0]      reg_rs_o;
reg [31:0]      reg_rt_o;
// Async Read Process
always @ (clk_i or rs_i or rt_i or rd_i or reg_rd_i or data_out1 or data_out2 or rst_i or wr_i)
begin
    // Read Rs
    if (rs_i == 5'b00000)
        reg_rs_o <= 32'h00000000;
    else
        reg_rs_o <= data_out1;
    // Read Rt
    if (rt_i == 5'b00000)
        reg_rt_o <= 32'h00000000;
    else
        reg_rt_o <= data_out2;
    // Write enabled?
    addr_write <= rd_i[4:0];
    if ((rd_i != 5'b00000) & (wr_i == 1'b1))
        write_enable <= 1'b1;
    else
        write_enable <= 1'b0;
end
// Register File (using RAM16X1D )
generate
begin
   genvar i;
   for (i=0;i<32;i=i+1)
   begin : reg_loop
       RAM16X1D reg_bit1a(.WCLK(clk_i), .WE(wea), .A0(addr_write[0]), .A1(addr_write[1]), .A2(addr_write[2]), .A3(addr_write[3]), .D(reg_rd_i[i]), .DPRA0(rs_i[0]), .DPRA1(rs_i[1]), .DPRA2(rs_i[2]), .DPRA3(rs_i[3]), .DPO(data_out1a[i]), .SPO(/* open */));
       RAM16X1D reg_bit1b(.WCLK(clk_i), .WE(web), .A0(addr_write[0]), .A1(addr_write[1]), .A2(addr_write[2]), .A3(addr_write[3]), .D(reg_rd_i[i]), .DPRA0(rs_i[0]), .DPRA1(rs_i[1]), .DPRA2(rs_i[2]), .DPRA3(rs_i[3]), .DPO(data_out1b[i]), .SPO(/* open */));
       RAM16X1D reg_bit2a(.WCLK(clk_i), .WE(wea), .A0(addr_write[0]), .A1(addr_write[1]), .A2(addr_write[2]), .A3(addr_write[3]), .D(reg_rd_i[i]), .DPRA0(rt_i[0]), .DPRA1(rt_i[1]), .DPRA2(rt_i[2]), .DPRA3(rt_i[3]), .DPO(data_out2a[i]), .SPO(/* open */));
       RAM16X1D reg_bit2b(.WCLK(clk_i), .WE(web), .A0(addr_write[0]), .A1(addr_write[1]), .A2(addr_write[2]), .A3(addr_write[3]), .D(reg_rd_i[i]), .DPRA0(rt_i[0]), .DPRA1(rt_i[1]), .DPRA2(rt_i[2]), .DPRA3(rt_i[3]), .DPO(data_out2b[i]), .SPO(/* open */));
   end
end
endgenerate
// Combinatorial Assignments
assign data_out1  = (rs_i[4] == 1'b0) ? data_out1a : data_out1b;
assign data_out2  = (rt_i[4] == 1'b0) ? data_out2a : data_out2b;
assign wea        = (write_enable & ~ (addr_write[4]));
assign web        = (write_enable & addr_write[4]);
endmodule