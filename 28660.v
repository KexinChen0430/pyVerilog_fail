module stratixii_lvds_receiver (clk0,
                                datain,
                                enable0,
                                dpareset,
                                dpahold,
                                dpaswitch,
                                fiforeset,
                                bitslip,
                                bitslipreset,
                                serialfbk,
                                dataout,
                                dpalock,
                                bitslipmax,
                                serialdataout,
                                postdpaserialdataout,
                                devclrn,
                                devpor
                               );
    parameter data_align_rollover       = 2;
    parameter enable_dpa                = "off";
    parameter lose_lock_on_one_change   = "off";
    parameter reset_fifo_at_first_lock  = "on";
    parameter align_to_rising_edge_only = "on";
    parameter use_serial_feedback_input = "off";
    parameter dpa_debug                 = "off";
    parameter x_on_bitslip              = "on";
    parameter lpm_type                  = "stratixii_lvds_receiver";
// SIMULATION_ONLY_PARAMETERS_BEGIN
    parameter channel_width             = 10;
// SIMULATION_ONLY_PARAMETERS_END
    // INPUT PORTS
    input clk0;
    input datain;
    input enable0;
    input dpareset;
    input dpahold;
    input dpaswitch;
    input fiforeset;
    input bitslip;
    input bitslipreset;
    input serialfbk;
    input devclrn;
    input devpor;
    // OUTPUT PORTS
    output [channel_width - 1:0] dataout;
    output dpalock;
    output bitslipmax;
    output serialdataout;
    output postdpaserialdataout;
    tri1 devclrn;
    tri1 devpor;
    // BUFFER INPUTS
    wire clk0_in;
    wire datain_in;
    wire enable0_in;
    wire dpareset_in;
    wire dpahold_in;
    wire dpaswitch_ipd;
    wire fiforeset_in;
    wire bitslip_in;
    wire bitslipreset_in;
    wire serialfbk_in;
    buf (clk0_in, clk0);
    buf (datain_in, datain);
    buf (enable0_in, enable0);
    buf (dpareset_in, dpareset);
    buf (dpahold_in, dpahold);
    buf (dpaswitch_ipd, dpaswitch);
    buf (fiforeset_in, fiforeset);
    buf (bitslip_in, bitslip);
    buf (bitslipreset_in, bitslipreset);
    buf (serialfbk_in, serialfbk);
    // INTERNAL NETS AND VARIABLES
    wire fifo_wclk;
    wire fifo_rclk;
    wire fifo_datain;
    wire fifo_dataout;
    wire fifo_reset;
    wire slip_datain;
    wire slip_dataout;
    wire bitslip_reset;
    wire [channel_width - 1:0] deser_dataout;
    wire dpareg0_out;
    wire dpareg1_out;
    wire dpa_clk;
    wire dpa_rst;
    wire datain_reg;
    wire datain_reg_neg;
    wire datain_reg_tmp;
    reg clk0_last_value;
    reg dpa_is_locked;
    reg dparst_msg;
    reg reset_fifo;
    reg first_dpa_lock;
    reg [3:0] dpa_lock_count;
    wire reset_int;
    wire gnd;
    wire serialdataout_tmp;
    wire postdpaserialdataout_tmp;
    wire in_reg_data;
    wire datain_tmp;
    wire dpalock_tmp;
    wire rxload;
    wire slip_datain_tmp;
    wire s_bitslip_clk;
    wire loaden;
    integer i;
// LOCAL_PARAMETERS_BEGIN
    parameter DPA_CYCLES_TO_LOCK = 2;
// LOCAL_PARAMETERS_END
    // TIMING PATHS
    specify
        (posedge clk0 => (dpalock +: dpalock_tmp)) = (0, 0);
    endspecify
    assign gnd = 1'b0;
    // fifo read and write clks
    assign fifo_rclk = (enable_dpa == "on") ? clk0_in : gnd;
    assign fifo_wclk = dpa_clk;
    assign fifo_datain = (enable_dpa == "on") ? dpareg1_out : gnd;
    assign reset_int = (!devpor) || (!devclrn);
    assign fifo_reset = (!devpor) || (!devclrn) || fiforeset_in || reset_fifo;
    assign bitslip_reset = (!devpor) || (!devclrn) || bitslipreset_in;
    assign in_reg_data = (use_serial_feedback_input == "on") ? serialfbk_in : datain_in;
    initial
    begin
        dpa_is_locked = 0;
        dparst_msg = 0;
        first_dpa_lock = 1;
        dpa_lock_count = 0;
        if (reset_fifo_at_first_lock == "on")
            reset_fifo = 1;
        else
            reset_fifo = 0;
        if (enable_dpa == "on")
        begin
            $display("Warning : DPA Phase tracking is not modeled and once locked, DPA will continue to lock until the next reset is asserted. Please refer to the StratixII device handbook for further details.");
            $display("Time: %0t, Instance: %m", $time);
        end
    end
    // SUB-MODULE INSTANTIATION
    // input register in non-DPA mode for sampling incoming data
    stratixii_lvds_reg in_reg (.d(in_reg_data),
                     .clk(clk0_in),
                     .ena(1'b1),
                     .clrn(devclrn || devpor),
                     .prn(1'b1),
                     .q(datain_reg)
                    );
   assign  datain_reg_tmp = datain_reg;
   assign dpa_clk = (enable_dpa == "on") ? clk0_in : 1'b0;
    assign dpa_rst = (enable_dpa == "on") ? dpareset_in : 1'b0;
    always @(posedge dpa_clk or posedge dpa_rst)
    begin
            if (dpa_rst === 1'b1)
            begin
                dpa_is_locked <= 0;
                dpa_lock_count = 0;
                // give message only once
                if (dparst_msg === 1'b0)
                begin
                    $display("DPA was reset");
                    $display("Time: %0t, Instance: %m", $time);
                    dparst_msg = 1;
                end
            end
            else begin
                dparst_msg = 0;
                if (dpa_is_locked === 1'b0)
                begin
                    dpa_lock_count = dpa_lock_count + 1;
                    if (dpa_lock_count > DPA_CYCLES_TO_LOCK)
                    begin
                        dpa_is_locked <= 1;
                        $display("DPA locked");
                        $display("Time: %0t, Instance: %m", $time);
                        reset_fifo <= 0;
                    end
                end
            end
    end
    // ?????????? insert delay to mimic DPLL dataout ?????????
    // DPA registers
    stratixii_lvds_reg dpareg0 (.d(in_reg_data),
                     .clk(dpa_clk),
                     .clrn(1'b1),
                     .prn(1'b1),
                     .ena(1'b1),
                     .q(dpareg0_out)
                    );
    stratixii_lvds_reg dpareg1 (.d(dpareg0_out),
                     .clk(dpa_clk),
                     .clrn(1'b1),
                     .prn(1'b1),
                     .ena(1'b1),
                     .q(dpareg1_out)
                    );
    stratixii_lvds_rx_fifo    s_fifo (.wclk(fifo_wclk),
                                      .rclk(fifo_rclk),
                                      .fiforst(fifo_reset),
                                      .dparst(dpa_rst),
                                      .datain(fifo_datain),
                                      .dataout(fifo_dataout)
                                     );
    defparam s_fifo.channel_width = channel_width;
    assign slip_datain_tmp = (enable_dpa == "on" && dpaswitch_ipd === 1'b1) ? fifo_dataout : datain_reg_tmp;
  assign slip_datain = slip_datain_tmp;
    assign s_bitslip_clk = clk0_in;
    stratixii_lvds_rx_bitslip    s_bslip (.clk0(s_bitslip_clk),
                                          .bslipcntl(bitslip_in),
                                          .bsliprst(bitslip_reset),
                                          .datain(slip_datain),
                                          .bslipmax(bitslipmax),
                                          .dataout(slip_dataout)
                                         );
    defparam s_bslip.channel_width = channel_width;
    defparam s_bslip.bitslip_rollover = data_align_rollover;
    defparam s_bslip.x_on_bitslip = x_on_bitslip;
 assign loaden = enable0_in;
    // only 1 enable signal used for StratixII
    stratixii_lvds_reg rxload_reg (.d(loaden),
                     .clk(s_bitslip_clk),
                     .ena(1'b1),
                     .clrn(1'b1),
                     .prn(1'b1),
                     .q(rxload)
                    );
    stratixii_lvds_rx_deser    s_deser (.clk(s_bitslip_clk),
                                        .datain(slip_dataout),
                                        .devclrn(devclrn),
                                        .devpor(devpor),
                                        .dataout(deser_dataout)
                                       );
    defparam s_deser.channel_width = channel_width;
    stratixii_lvds_rx_parallel_reg  output_reg  (.clk(s_bitslip_clk),
                                               .enable(rxload),
                                               .datain(deser_dataout),
                                               .devpor(devpor),
                                               .devclrn(devclrn),
                                               .dataout(dataout)
                                              );
    defparam output_reg.channel_width = channel_width;
    // generate outputs
    assign dpalock_tmp = (enable_dpa == "on") ? dpa_is_locked : gnd;
    assign postdpaserialdataout_tmp = dpareg1_out;
    assign datain_tmp = datain_in;
    and (postdpaserialdataout, postdpaserialdataout_tmp, 1'b1);
    and (serialdataout, datain_tmp, 1'b1);
    and (dpalock, dpalock_tmp, 1'b1);
endmodule