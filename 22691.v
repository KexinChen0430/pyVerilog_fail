module hardcopyiii_lvds_rx_fifo (
                           wclk,
                           rclk,
                           dparst,
                           fiforst,
                           datain,
                           dataout
                          );
    parameter channel_width = 10;
    // INPUT PORTS
    input wclk;
    input rclk;
    input dparst;
    input fiforst;
    input datain;
    // OUTPUT PORTS
    output dataout;
    // INTERNAL VARIABLES AND NETS
    reg dataout_tmp;
    wire data_out;
    integer i;
    reg ram_datain;
    wire ram_dataout;
    reg   [2:0]  wrPtr,rdPtr;        // writer pointer, read pointer
    wire  [2:0]  rdAddr;             // read address
    reg ram_we;
    reg wclk_last_value, rclk_last_value;
    reg write_side_sync_reset;
    reg read_side_sync_reset;
    specify
        (posedge rclk => (dataout +: data_out)) = (0, 0);
        (posedge dparst => (dataout +: data_out)) = (0, 0);
    endspecify
    initial
    begin
        dataout_tmp = 0;
        wrPtr = 2'b00;
        rdPtr = 2'b11;
        write_side_sync_reset = 1'b0;
        read_side_sync_reset = 1'b0;
    end
    assign rdAddr = rdPtr;
    hardcopyiii_lvds_rx_fifo_sync_ram  s_fifo_ram (
                                             .clk(wclk),
                                             .datain(ram_datain),
                                             .write_reset(write_side_sync_reset),
                                             .waddr(wrPtr),
                                             .raddr(rdAddr), // rdPtr ??
                                             .we(ram_we),
                                             .dataout(ram_dataout)
                                            );
    // update pointer and RAM input
always @(wclk or dparst)
    begin
        if (dparst === 1'b1 || (fiforst === 1'b1 && wclk === 1'b1 && wclk_last_value === 1'b0))
            begin
                write_side_sync_reset <= 1'b1;
                ram_datain <= 1'b0;
                wrPtr <= 0;
                ram_we <= 'b0;
            end
        else if (dparst === 1'b0 && (fiforst === 1'b0 && wclk === 1'b1 && wclk_last_value === 1'b0))
            begin
                write_side_sync_reset <= 1'b0;
            end
            if (wclk === 1'b1 && wclk_last_value === 1'b0 && write_side_sync_reset === 1'b0 && fiforst === 1'b0 && dparst === 1'b0)
                begin
                    ram_datain <= datain;       // input register
                    ram_we <= 'b1;
                    wrPtr <= wrPtr + 1;
                    if (wrPtr == 5)
                        wrPtr <= 0;
                end
        wclk_last_value = wclk;
    end
always @(rclk or dparst)
    begin
        if (dparst === 1'b1 || (fiforst === 1'b1 && rclk === 1'b1 && rclk_last_value === 1'b0))
            begin
                read_side_sync_reset <= 1'b1;
                rdPtr <= 3;
                dataout_tmp <= 0;
            end
        else if (dparst === 1'b0 && (fiforst === 1'b0 && rclk === 1'b1 && rclk_last_value === 1'b0))
            begin
                read_side_sync_reset <= 0;
            end
        if (rclk === 1'b1 && rclk_last_value === 1'b0 && read_side_sync_reset === 1'b0 && fiforst === 1'b0 && dparst === 1'b0)
            begin
                rdPtr <= rdPtr + 1;
                if (rdPtr == 5)
                    rdPtr <= 0;
                dataout_tmp <= ram_dataout;     // output register
            end
        rclk_last_value = rclk;
    end
assign data_out = dataout_tmp;
buf (dataout, data_out);
endmodule