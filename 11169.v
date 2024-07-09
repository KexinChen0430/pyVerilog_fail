module arriaiigz_lvds_receiver (
                            clk0,
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
                            divfwdclk,
                            dpaclkout,
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
    parameter enable_soft_cdr           = "off";
    parameter dpa_output_clock_phase_shift   = 0;
    parameter enable_dpa_initial_phase_selection = "off";
    parameter dpa_initial_phase_value    = 0;
    parameter  enable_dpa_align_to_rising_edge_only  = "off";
    parameter  net_ppm_variation     = 0;
    parameter  is_negative_ppm_drift  = "off";
    parameter  rx_input_path_delay_engineering_bits  = 2;
    parameter lpm_type                  = "arriaiigz_lvds_receiver";
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
   output divfwdclk;
   output dpaclkout;
    tri1 devclrn;
    tri1 devpor;
    // Input registers
    wire in_reg_data;
 reg in_reg_data_dly;
    wire datain_reg;
    wire datain_reg_neg;
    wire datain_reg_tmp;
    // dpa phase select
    wire  ini_phase_select_enable;
    wire ini_dpa_clk;
    wire ini_dpa_load;
    // dpa circuit
   wire  dpareg0_out;
   wire dpareg1_out;
    wire dpa_clk_shift;
    wire dpa_data_shift;
    wire dpa_enable0_shift;
    wire dpa_clk;
    wire dpa_rst;
    wire lock_tmp;
    // fifo
    wire fifo_wclk;
    wire fifo_rclk;
    wire fifo_datain;
    wire fifo_dataout;
    wire fifo_reset;
    reg reset_fifo;
    // bitslip
    wire slip_datain;
    wire slip_dataout;
    wire bitslip_reset;
    wire slip_datain_tmp;
    wire s_bitslip_clk;
    //deserializer
    wire [channel_width - 1:0] deser_dataout;
    wire postdpaserialdataout_tmp;
    wire dpalock_tmp;
    wire rxload;
    wire loaden;
    wire lloaden;
    wire divfwdclk_tmp;
    wire gnd;
    integer i;
    // TIMING PATHS
    specify
        (posedge clk0 => (dpalock +: dpalock_tmp)) = (0, 0);
    endspecify
    assign gnd = 1'b0;
    initial
    begin
        if (reset_fifo_at_first_lock == "on")
            reset_fifo = 1;
        else
            reset_fifo = 0;
    end
    // reset_fifo at
    always @(lock_tmp)
        begin
        reset_fifo = !lock_tmp;
        end
   always @(in_reg_data)
   begin
   if( dpaswitch == 1'b1)
   begin
   	if(rx_input_path_delay_engineering_bits == 1 )
   		in_reg_data_dly <=  #60 in_reg_data ;
   	else if ( rx_input_path_delay_engineering_bits == 2)
       	in_reg_data_dly <= #120 in_reg_data;
   	else if (  rx_input_path_delay_engineering_bits == 3)
        	 in_reg_data_dly <= #180 in_reg_data;
   	else
   	   	in_reg_data_dly <= in_reg_data;
    end
    else
    	    in_reg_data_dly <= in_reg_data;
    end
    // input register in non-DPA mode for sampling incoming data
    arriaiigz_lvds_reg in_reg (
                          .d(in_reg_data_dly),
                            .clk(clk0),
                            .ena(1'b1),
                            .clrn(devclrn || devpor),
                            .prn(1'b1),
                            .q(datain_reg)
                        );
   assign in_reg_data = (use_serial_feedback_input == "on") ? serialfbk : datain;
   arriaiigz_lvds_reg neg_reg (
                          .d(in_reg_data_dly),
                            .clk(!clk0),
                            .ena(1'b1),
                            .clrn(devclrn || devpor),
                            .prn(1'b1),
                            .q(datain_reg_neg)
                          );
   assign datain_reg_tmp = (align_to_rising_edge_only == "on") ? datain_reg :  datain_reg_neg;
    // Initial DPA clock phase select
   arriaiigz_select_ini_phase_dpaclk ini_clk_phase_select(
                                                     .clkin(clk0),
                                                     .enable(ini_phase_select_enable),
                                                     .loaden(enable0),
                                                     .clkout(ini_dpa_clk),
                                                     .loadenout(ini_dpa_load)
                                                 );
 defparam  ini_clk_phase_select.initial_phase_select = dpa_initial_phase_value;
 assign   ini_phase_select_enable = (enable_dpa_initial_phase_selection == "on") ? 1'b1 : 1'b0;
     // DPA Circuitary
    arriaiigz_lvds_reg dpareg0 (
                              .d(in_reg_data_dly),
                            .clk(ini_dpa_clk),
                            .clrn(1'b1),
                            .prn(1'b1),
                            .ena(1'b1),
                            .q(dpareg0_out)
                            );
    arriaiigz_lvds_reg dpareg1 (
                            .d(dpareg0_out),
                            .clk(ini_dpa_clk),
                            .clrn(1'b1),
                            .prn(1'b1),
                            .ena(1'b1),
                            .q(dpareg1_out)
                            );
    arriaiigz_dpa_block dpa_circuit(
                                .clkin(ini_dpa_clk),
                                .dpareset(dpa_rst),
                                .dpahold(dpahold),
                                .datain(dpareg1_out),
                                .clkout(dpa_clk_shift),
                                .dataout(dpa_data_shift),
                                .dpalock (lock_tmp)
                              );
defparam dpa_circuit.net_ppm_variation = net_ppm_variation;
defparam dpa_circuit.is_negative_ppm_drift = is_negative_ppm_drift;
defparam dpa_circuit.enable_soft_cdr_mode= enable_soft_cdr;
assign dpa_clk = ((enable_soft_cdr == "on")|| (enable_dpa == "on")) ? dpa_clk_shift : 1'b0;
assign dpa_rst = ((enable_soft_cdr == "on")|| (enable_dpa == "on")) ? dpareset : 1'b0;
 // DPA clock divide and generate lloaden for soft CDR mode
 arriaiigz_pclk_divider  clk_forward(
                                 .clkin(dpa_clk),
                                 .lloaden(lloaden),
                                 .clkout(divfwdclk_tmp)
                                );
 defparam clk_forward.clk_divide_by = channel_width;
// FIFO
    arriaiigz_lvds_rx_fifo    s_fifo (
                                  .wclk(dpa_clk),
                                  .rclk(fifo_rclk),
                                  .fiforst(fifo_reset),
                                  .dparst(dpa_rst),
                                  .datain(fifo_datain),
                                  .dataout(fifo_dataout)
                                 );
    defparam s_fifo.channel_width = channel_width;
    assign fifo_rclk = (enable_dpa == "on") ? clk0 : gnd;
    assign fifo_wclk = dpa_clk;
    assign fifo_datain = (enable_dpa == "on") ? dpa_data_shift : gnd;
    assign fifo_reset = (!devpor) || (!devclrn) || fiforeset || reset_fifo || dpa_rst;
// BIT SLIP
    arriaiigz_lvds_rx_bitslip    s_bslip (
                                      .clk0(s_bitslip_clk),
                                      .bslipcntl(bitslip),
                                      .bsliprst(bitslip_reset),
                                      .datain(slip_datain),
                                      .bslipmax(bitslipmax),
                                      .dataout(slip_dataout)
                                     );
    defparam s_bslip.channel_width = channel_width;
    defparam s_bslip.bitslip_rollover = data_align_rollover;
    defparam s_bslip.x_on_bitslip = x_on_bitslip;
    assign bitslip_reset = (!devpor) || (!devclrn) || bitslipreset;
    assign slip_datain_tmp = (enable_dpa == "on") ? fifo_dataout : datain_reg_tmp;
    assign slip_datain = (enable_soft_cdr == "on") ? dpa_data_shift : slip_datain_tmp;
    assign s_bitslip_clk = (enable_soft_cdr == "on") ? dpa_clk : clk0;
    // DESERIALISER
    arriaiigz_lvds_reg rxload_reg (
                                .d(loaden),
                                .clk(s_bitslip_clk),
                                .ena(1'b1),
                                .clrn(1'b1),
                                .prn(1'b1),
                                .q(rxload)
                              );
    assign loaden = (enable_soft_cdr == "on") ? lloaden : ini_dpa_load;
    arriaiigz_lvds_rx_deser    s_deser (
                                    .clk(s_bitslip_clk),
                                    .datain(slip_dataout),
                                    .devclrn(devclrn),
                                    .devpor(devpor),
                                    .dataout(deser_dataout)
                                   );
    defparam s_deser.channel_width = channel_width;
    arriaiigz_lvds_rx_parallel_reg  output_reg  (
                                             .clk(s_bitslip_clk),
                                             .enable(rxload),
                                             .datain(deser_dataout),
                                             .devpor(devpor),
                                             .devclrn(devclrn),
                                             .dataout(dataout)
                                            );
    defparam output_reg.channel_width = channel_width;
    // generate outputs
    assign dpalock_tmp = gnd;
    assign postdpaserialdataout_tmp = dpa_data_shift;
    assign divfwdclk = divfwdclk_tmp;
    assign dpaclkout = dpa_clk_shift;
    and (postdpaserialdataout, postdpaserialdataout_tmp, 1'b1);
    and (serialdataout, datain, 1'b1);
    and (dpalock, dpalock_tmp, 1'b1);
endmodule