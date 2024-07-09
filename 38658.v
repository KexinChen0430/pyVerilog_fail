module sram4
(
    clk_i,
    address_i,
    data_i,
    data_o,
    wr_i
);
// Params
parameter  [31:0]   SRAM_ADDR_WIDTH = 14;
// I/O
input               clk_i /*verilator public*/;
input [31:0]        address_i /*verilator public*/;
input [31:0]        data_i /*verilator public*/;
output [31:0]       data_o /*verilator public*/;
input [3:0]         wr_i /*verilator public*/;
// Registers
wire [31:0]         address;
wire [31:0]         data_o;
// Implementation
assign address      = {2'b00, address_i[31:2]};
generate
begin : sram_gen
genvar i;
for (i=0;i<4;i=i+1)
    begin :sram_loop
        sram
        #(
            .WIDTH(8),
            .SIZE(SRAM_ADDR_WIDTH)
        )
        u1_bram
        (
            .clk_i(clk_i),
            .dat_o(data_o[(((i + 1) * 8) - 1):(i * 8)]),
            .dat_i(data_i[(((i + 1) * 8) - 1):(i * 8)]),
            .adr_i(address[(SRAM_ADDR_WIDTH - 1):0]),
            .wr_i(wr_i[i])
        );
    end
end
endgenerate
endmodule