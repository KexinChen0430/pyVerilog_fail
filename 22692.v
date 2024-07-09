module hardcopyiii_lvds_rx_bitslip (
                              clk0,
                              bslipcntl,
                              bsliprst,
                              datain,
                              bslipmax,
                              dataout
                            );
    parameter channel_width = 10;
    parameter bitslip_rollover = 12;
    parameter x_on_bitslip = "on";
    // INPUT PORTS
    input  clk0;
    input  bslipcntl;
    input  bsliprst;
    input  datain;
    // OUTPUT PORTS
    output bslipmax;
    output dataout;
    // INTERNAL VARIABLES AND NETS
    integer slip_count;
    integer i, j;
    wire dataout_tmp;
    wire dataout_wire;
    wire bslipmax_wire;
    reg clk0_last_value;
    reg bsliprst_last_value;
    reg bslipcntl_last_value;
    reg start_corrupt_bits;
    reg [1:0] num_corrupt_bits;
    reg [11:0] bitslip_arr;
    reg bslipmax_tmp;
    reg ix_on_bitslip;
    wire bslipcntl_reg;
    // TIMING PATHS
    specify
        (posedge clk0 => (bslipmax +: bslipmax_tmp)) = (0, 0);
        (posedge bsliprst => (bslipmax +: bslipmax_tmp)) = (0, 0);
    endspecify
    initial
    begin
        slip_count = 0;
        bslipmax_tmp = 0;
        bitslip_arr = 12'b0;
        start_corrupt_bits = 0;
        num_corrupt_bits = 0;
        if (x_on_bitslip == "on")
            ix_on_bitslip = 1;
        else
            ix_on_bitslip = 0;
    end
    hardcopyiii_lvds_reg bslipcntlreg (
                                .d(bslipcntl),
                                .clk(clk0),
                                .ena(1'b1),
                                .clrn(!bsliprst),
                                .prn(1'b1),
                                .q(bslipcntl_reg)
                                 );
    // 4-bit slip counter
always @(bslipcntl_reg or bsliprst)
    begin
        if (bsliprst === 1'b1)
             begin
                 slip_count <= 0;
                 bslipmax_tmp <= 1'b0;
                 if (bsliprst === 1'b1 && bsliprst_last_value === 1'b0)
                     begin
                         $display("Note: Bit Slip Circuit was reset. Serial Data stream will have 0 latency");
                         $display("Time: %0t, Instance: %m", $time);
                     end
             end
        else if (bslipcntl_reg === 1'b1 && bslipcntl_last_value === 1'b0)
            begin
                 if (ix_on_bitslip == 1)
                     start_corrupt_bits <= 1;
                 num_corrupt_bits <= 0;
                 if (slip_count == bitslip_rollover)
                     begin
                         $display("Note: Rollover occurred on Bit Slip circuit. Serial data stream will have 0 latency.");
                         $display("Time: %0t, Instance: %m", $time);
                         slip_count <= 0;
                         bslipmax_tmp <= 1'b0;
                     end
                 else
                    begin
                        slip_count <= slip_count + 1;
                        if ((slip_count+1) == bitslip_rollover)
                            begin
                                $display("Note: The Bit Slip circuit has reached the maximum Bit Slip limit. Rollover will occur on the next slip.");
                                $display("Time: %0t, Instance: %m", $time);
                                bslipmax_tmp <= 1'b1;
                            end
                    end
            end
        else if (bslipcntl_reg === 1'b0 && bslipcntl_last_value === 1'b1)
            begin
                start_corrupt_bits <= 0;
                num_corrupt_bits <= 0;
            end
        bslipcntl_last_value <= bslipcntl_reg;
        bsliprst_last_value <= bsliprst;
    end
    // Bit Slip shift register
always @(clk0)
    begin
        if (clk0 === 1'b1 && clk0_last_value === 1'b0)
            begin
                bitslip_arr[0] <= datain;
                for (i = 0; i < bitslip_rollover; i=i+1)
                    bitslip_arr[i+1] <= bitslip_arr[i];
                if (start_corrupt_bits == 1'b1)
                    num_corrupt_bits <= num_corrupt_bits + 1;
                if (num_corrupt_bits+1 == 3)
                    start_corrupt_bits <= 0;
            end
        clk0_last_value <= clk0;
    end
hardcopyiii_lvds_reg dataoutreg (
                            .d(bitslip_arr[slip_count]),
                            .clk(clk0),
                            .ena(1'b1),
                            .clrn(1'b1),
                            .prn(1'b1),
                            .q(dataout_tmp)
                        );
assign dataout_wire = (start_corrupt_bits == 1'b0) ? dataout_tmp : (num_corrupt_bits < 3) ? 1'bx : dataout_tmp;
assign bslipmax_wire = bslipmax_tmp;
and (dataout, dataout_wire, 1'b1);
and (bslipmax, bslipmax_wire, 1'b1);
endmodule