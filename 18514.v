module top_level_sim(
    );
    reg clk = 0, rst = 0;
    wire[31:0] base_ram_data;
    wire[21:0] base_ram_addr;
    wire[3:0] base_ram_be_n;
    wire base_ram_ce_n;
    wire base_ram_oe_n;
    wire base_ram_we_n;
    cpu cpu_impl(
        .clk50(clk),
        .rst(rst),
        .sram_sramEnable_o(base_ram_ce_n),
        .sram_writeEnable_o(base_ram_we_n),
        .sram_readEnable_o(base_ram_oe_n),
        .sram_addr_o(base_ram_addr),
        .sram_data_io(base_ram_data)
    );
    sram SRAM(
        .addr_i(base_ram_addr),
        //Enable
        .en_i(base_ram_ce_n),
        //Write
        .we_i(base_ram_we_n),
        //Output
        .oe_i(base_ram_oe_n),
        //Data
        .data_io(base_ram_data)
    );
    always begin
        #10;
        clk = ~clk;
    end
    always begin
        #20;
        rst = 1;
    end
endmodule