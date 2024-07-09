module ddr3_s4_amphy_phy_alt_mem_phy_dqs_ip (
                            poa_postamble_en_preset,
                            resync_clk_1x,
                            resync_clk_2x,
                            dedicated_dll_delay_ctrl,
                            seq_dqs_delay_ctrl,
                            dll_offset_delay_ctrl,
                            dqs_update_en,
                            dqsinputphasesetting,
                            dqs_pad,
                            dqsn_pad,
                            dqs_enable,
                            dqsn_enable,
                            dqsbusoutdelaysetting,
                            dqsenablectrlphasesetting,
                            dqsenabledelaysetting,
                            enadqsenablephasetransferreg,
                            dqsenablectrlphaseinvert,
                            enaoutputcycledelaysetting,
                            enaoutputphasetransferreg,
                            dqsoutputphaseinvert,
                            dqsoutputphasesetting
                            ) /* synthesis altera_attribute="SUPPRESS_DA_RULE_INTERNAL=\"A103,R101\"" */ ;
parameter MEM_IF_CLK_PS          =      4000;
parameter MEM_IF_CLK_PS_STR      = "4000 ps";
parameter MEM_IF_MEMTYPE         =     "DDR";
parameter LEVELLING              =         1;
parameter MEM_IF_DQSN_EN         =         1;
parameter DLL_DELAY_BUFFER_MODE  =    "HIGH";
parameter DQS_PHASE              =      9000;
parameter DQS_PHASE_SETTING      =         2;
parameter DWIDTH_RATIO           =         4;
parameter ENABLE_DDR3_SEQUENCER  =   "FALSE";
parameter DQS_DELAY_CTL_WIDTH    =         6;
parameter MEM_TCL                =    "1.5";
parameter DQS_DELAY_CODE_FROM_DLL = "FALSE";
parameter DQS_DELAY_USES_OFFSET   = "false";
parameter USE_DQS_DELAY_LATCHES   = "false";
parameter DQS_USE_PHASECTRL_IN    = "false";
parameter MEM_IF_USE_T11          =       0;
parameter MEM_IF_USE_T7           =       0;
parameter INVERT_POSTAMBLE_CLK    = "false";
localparam DQS_BUS_INSERTION_DELAY = 250;
localparam ADD_PHASE_TRANSFER_REG_SETTING = (INVERT_POSTAMBLE_CLK == "false" || INVERT_POSTAMBLE_CLK == "FALSE") ? "true" : "false";
input  wire [DWIDTH_RATIO/2 -1 : 0]                          poa_postamble_en_preset;
// Half-rate resync clock from clock dividers :
input  wire                                                  resync_clk_1x;
input  wire                                                  resync_clk_2x;
// The DLL delay control is used for the DQS Enable Control :
input  wire [DQS_DELAY_CTL_WIDTH-1:0]                        dedicated_dll_delay_ctrl;
// The sequencer can supply a unique 6bit delay control code to each DQS group or this can come straight from the DLL.
input  wire [DQS_DELAY_CTL_WIDTH-1:0]                        seq_dqs_delay_ctrl;
input wire [DQS_DELAY_CTL_WIDTH-1:0]                         dll_offset_delay_ctrl;
input wire                                                   dqs_update_en;
input wire [2 : 0]                                           dqsinputphasesetting;
inout  wire                                                  dqs_pad;
inout  wire                                                  dqsn_pad;
// NB. 'wire' omitted so that attributes can be applied later.
// DQS enable used for DDR/2/3 memories, as these either have true differential
// DQS/DQSN pins (producing one active high DQS enable) or (for DDR) just a DQS
// signal is used :
output                                                       dqs_enable;
// For QDRII devices, DQS and DQSN are pseudo-differential and as the active-low
// version of DQS is required to clock incoming DQ data, this is directly propagated :
output                                                       dqsn_enable;
// NB. These are outputs from the DQS CONFIG block :
input  wire [`DQSCONFIG_DQS_OUTPUT_PHASE_SETTING_WIDTH-1: 0] dqsoutputphasesetting;
input  wire [`DQSCONFIG_DQS_BUSOUT_DELAY_SETTING_WIDTH-1 :0] dqsbusoutdelaysetting;
input  wire [`DQSCONFIG_DQS_EN_CTRL_PHASE_SETTING_WIDTH-1:0] dqsenablectrlphasesetting;
input  wire [`DQSCONFIG_DQS_EN_DELAY_SETTING_WIDTH-1     :0] dqsenabledelaysetting;
input  wire                                                  enadqsenablephasetransferreg;
input  wire                                                  dqsenablectrlphaseinvert;
input  wire                                                  enaoutputcycledelaysetting;
input  wire                                                  enaoutputphasetransferreg;
input  wire                                                  dqsoutputphaseinvert;
(* altera_attribute = "-name global_signal off" *) wire      dqs_buffered;
(* altera_attribute = "-name global_signal off" *) wire      dqs_delayed;
(* altera_attribute = "-name global_signal off" *) wire      dqs_delayed2;
(* altera_attribute = "-name global_signal off" *) wire      dqsn_buffered;
(* altera_attribute = "-name global_signal off" *) wire      dqsn_delayed;
(* altera_attribute = "-name global_signal off" *) wire      dqsn_delayed2;
wire                                                         dqs_enable_ddio_output;
wire                                                         dqs_enable_ctrl_op;
wire                                                         dqs_enable_ctrl_op_delayed;
wire [DQS_DELAY_CTL_WIDTH-1:0]                               chosen_dqs_delay_delayctrlin;
wire                                                         dqsn_enable;
(* altera_attribute = "-name global_signal off" *) reg       dqs_enable;
(* altera_attribute = "-name global_signal off" *) wire      dqs_enable_op;
(* altera_attribute = "-name global_signal off" *) wire      dqsn_enable_op;
wire                                                         dqs_enable_sim;
function integer min (input integer a, b);
begin
    if (a < b)
        min = a;
    else
        min = b;
end
endfunction
ddr3_s4_amphy_phy_alt_mem_phy_delay # (
    .WIDTH     (1),
    .DELAY_PS  (DQS_BUS_INSERTION_DELAY)
) dqs_enable_delay(
    .s_in      (dqs_enable_op),
    .s_out     (dqs_enable_sim)
);
always @*
begin
  dqs_enable = dqs_enable_sim;
end
generate
    if (MEM_IF_MEMTYPE == "QDRII")
    begin : gen_dqsn_enable_delay
        assign #DQS_BUS_INSERTION_DELAY dqsn_enable = dqsn_enable_op;
    end
    else
    begin : tie_off_dqsn_enable
        // Set dqsn_enable to zero.  The '?' is used simply to reduce warnings about dqsn_enable_op not being read :
        assign dqsn_enable = dqsn_enable_op ? 1'b0 : 1'b0;
    end
endgenerate
generate
    // For DDR, or DDR2 where DQSN is disabled, it is important to leave the DQSN
    // pad unconnected, as otherwise this path remains in the netlist even
    // though there is no intent to use DQSN, and it is unused as an output :
    if (MEM_IF_MEMTYPE == "DDR" || (MEM_IF_MEMTYPE == "DDR2" && (MEM_IF_DQSN_EN == 0)) )
    begin : ddr_no_dqsn_ibuf_gen
        // Input buf
        stratixiii_io_ibuf dqs_inpt_io_ibuf(
           .i      (dqs_pad),
           .ibar   (),
    	   // synopsys translate_off
    	   .dynamicterminationcontrol(),
    	   // synopsys translate_on
           .o      (dqs_buffered)
           );
        assign dqsn_pad = 1'b0;
    end
    // QDRII has both DQS and DQSN, but only pseudo-differential.  Both are used for DQ
    // capture in the DDIO atom :
    else if (MEM_IF_MEMTYPE == "QDRII")
    begin : qdr_ibuf_gen
        // Input buf
        stratixiii_io_ibuf dqs_inpt_io_ibuf(
           .i      (dqs_pad),
           .ibar   (),
    	   // synopsys translate_off
    	   .dynamicterminationcontrol(),
    	   // synopsys translate_on
           .o      (dqs_buffered)
           );
        // Input buf
        stratixiii_io_ibuf dqsn_inpt_io_ibuf(
           .i      (dqsn_pad),
           .ibar   (),
    	   // synopsys translate_off
    	   .dynamicterminationcontrol(),
    	   // synopsys translate_on
           .o      (dqsn_buffered)
           );
    end
    // DDR2 (with DQSN enabled) and DDR3 have true differential DQS inputs :
    else
    begin : ddr3_2_with_dqsn_ibuf_gen
        // Input buf
        stratixiii_io_ibuf dqs_inpt_io_ibuf(
           .i      (dqs_pad),
           .ibar   (dqsn_pad),
    	   // synopsys translate_off
    	   .dynamicterminationcontrol(),
    	   // synopsys translate_on
           .o      (dqs_buffered)
           );
    end
endgenerate
// DQS delay.
generate
    if (DQS_DELAY_CODE_FROM_DLL == "FALSE" || DQS_DELAY_CODE_FROM_DLL == "false" )
        assign chosen_dqs_delay_delayctrlin = seq_dqs_delay_ctrl;
    else
        assign chosen_dqs_delay_delayctrlin = dedicated_dll_delay_ctrl;
endgenerate
// The delay control for each DQS group comes from the modified delay control
// from the sequencer.  Note that it is correct that DLL_DELAY_BUFFER_MODE should
// be propagated to delay_buffer_mode here.
generate
    if (MEM_IF_MEMTYPE == "QDRII")
    begin : gen_qdrii_dqs_delay_chain
        if (DQS_DELAY_USES_OFFSET =="true" || DQS_DELAY_USES_OFFSET == "TRUE")
        begin : gen_dqs_delay_chain_with_offset
            stratixiii_dqs_delay_chain # (
            .dqs_input_frequency     (MEM_IF_CLK_PS_STR),
            .use_phasectrlin         (DQS_USE_PHASECTRL_IN),
            .phase_setting           (DQS_PHASE_SETTING),
            .delay_buffer_mode       (DLL_DELAY_BUFFER_MODE),
            .dqs_phase_shift         (DQS_PHASE),
            .dqs_offsetctrl_enable   (DQS_DELAY_USES_OFFSET),
            .dqs_ctrl_latches_enable (USE_DQS_DELAY_LATCHES)
            ) delay_chain(
               .dqsin          (dqs_buffered),
               .delayctrlin    (chosen_dqs_delay_delayctrlin),
               .offsetctrlin   (dll_offset_delay_ctrl),
               .dqsupdateen    (dqs_update_en),
               .phasectrlin    (dqsinputphasesetting),
            // synopsys translate_off
               .devclrn        (),
               .devpor         (),
               .dffin          (),
            // synopsys translate_on
               .dqsbusout      (dqs_enable_op)
            );
        end
        else
        begin: gen_dqs_delay_chain_no_offset
            stratixiii_dqs_delay_chain # (
            .dqs_input_frequency     (MEM_IF_CLK_PS_STR),
            .use_phasectrlin         (DQS_USE_PHASECTRL_IN),
            .phase_setting           (DQS_PHASE_SETTING),
            .delay_buffer_mode       (DLL_DELAY_BUFFER_MODE),
            .dqs_phase_shift         (DQS_PHASE),
            .dqs_offsetctrl_enable   (DQS_DELAY_USES_OFFSET),
            .dqs_ctrl_latches_enable (USE_DQS_DELAY_LATCHES)
            ) delay_chain(
               .dqsin          (dqs_buffered),
               .delayctrlin    (chosen_dqs_delay_delayctrlin),
               .offsetctrlin   (), //(dll_offset_delay_ctrl),
               .dqsupdateen    (dqs_update_en),
               .phasectrlin    (dqsinputphasesetting),
            // synopsys translate_off
               .devclrn        (),
               .devpor         (),
               .dffin          (),
            // synopsys translate_on
               .dqsbusout      (dqs_enable_op)
            );
        end
    end
    else
    begin : gen_ddr_dqs_delay_chain
        if (DQS_DELAY_USES_OFFSET == "true" || DQS_DELAY_USES_OFFSET == "TRUE")
        begin : gen_dqs_delay_chain_with_offset
            stratixiii_dqs_delay_chain # (
            .dqs_input_frequency     (MEM_IF_CLK_PS_STR),
            .use_phasectrlin         (DQS_USE_PHASECTRL_IN),
            .phase_setting           (DQS_PHASE_SETTING),
            .delay_buffer_mode       (DLL_DELAY_BUFFER_MODE),
            .dqs_phase_shift         (DQS_PHASE),
            .dqs_offsetctrl_enable   ("true"),
            .dqs_ctrl_latches_enable (USE_DQS_DELAY_LATCHES)
            ) delay_chain(
               .dqsin          (dqs_buffered),
               .delayctrlin    (chosen_dqs_delay_delayctrlin),
               .offsetctrlin   (dll_offset_delay_ctrl),
               .dqsupdateen    (dqs_update_en),
               .phasectrlin    (dqsinputphasesetting),
            // synopsys translate_off
               .devclrn        (),
               .devpor         (),
               .dffin          (),
            // synopsys translate_on
               .dqsbusout      (dqs_delayed)
            );
        end
        else
        begin: gen_dqs_delay_chain_no_offset
            stratixiii_dqs_delay_chain # (
            .dqs_input_frequency     (MEM_IF_CLK_PS_STR),
            .use_phasectrlin         (DQS_USE_PHASECTRL_IN),
            .phase_setting           (DQS_PHASE_SETTING),
            .delay_buffer_mode       (DLL_DELAY_BUFFER_MODE),
            .dqs_phase_shift         (DQS_PHASE),
            .dqs_offsetctrl_enable   ("false"),
            .dqs_ctrl_latches_enable (USE_DQS_DELAY_LATCHES)
            ) delay_chain(
               .dqsin          (dqs_buffered),
               .delayctrlin    (chosen_dqs_delay_delayctrlin),
               .offsetctrlin   (), //(dll_offset_delay_ctrl),
               .dqsupdateen    (dqs_update_en),
               .phasectrlin    (dqsinputphasesetting),
            // synopsys translate_off
               .devclrn        (),
               .devpor         (),
               .dffin          (),
            // synopsys translate_on
               .dqsbusout      (dqs_delayed)
            );
        end
    end
endgenerate
generate
    if (MEM_IF_USE_T7 == 1)
    begin : gen_dynamic_dqs_T7_delay_chain_gen
        // Delayed DQS delay chain - t7
        stratixiii_delay_chain dqs_t7_delay
        (
            .datain             (dqs_delayed),
            .delayctrlin        (dqsbusoutdelaysetting),
            // synopsys translate_off
	    .finedelayctrlin(),
            .devclrn(),
            .devpor(),
            // synopsys translate_on
            .dataout             (dqs_delayed2)
        );
    end
    else
    begin : gen_ddr_no_dqs_T7_delay_chain
        assign dqs_delayed2 = dqs_delayed;
    end
endgenerate
generate
    if (MEM_IF_MEMTYPE == "QDRII")
    begin : qdr_dqsn_delay_chain_gen
        if (DQS_DELAY_USES_OFFSET == "true" || DQS_DELAY_USES_OFFSET == "TRUE")
        begin
        stratixiii_dqs_delay_chain # (
                .dqs_input_frequency     (MEM_IF_CLK_PS_STR),
                .use_phasectrlin         (DQS_USE_PHASECTRL_IN),
                .phase_setting           (DQS_PHASE_SETTING),
                .delay_buffer_mode       (DLL_DELAY_BUFFER_MODE),
                .dqs_phase_shift         (DQS_PHASE),
                .dqs_offsetctrl_enable   ("true"),
                .dqs_ctrl_latches_enable (USE_DQS_DELAY_LATCHES)
            ) dqsn_delay_chain(
               .dqsin          (dqsn_buffered),
               .delayctrlin    (chosen_dqs_delay_delayctrlin),
               .offsetctrlin   (dll_offset_delay_ctrl),
               .dqsupdateen    (dqs_update_en),
               .phasectrlin    (dqsinputphasesetting),
                // synopsys translate_off
               .devclrn        (),
               .devpor         (),
               .dffin          (),
                // synopsys translate_on
               .dqsbusout      (dqsn_enable_op)
            );
    end
        else
        begin
        stratixiii_dqs_delay_chain # (
                .dqs_input_frequency     (MEM_IF_CLK_PS_STR),
                .use_phasectrlin         (DQS_USE_PHASECTRL_IN),
                .phase_setting           (DQS_PHASE_SETTING),
                .delay_buffer_mode       (DLL_DELAY_BUFFER_MODE),
                .dqs_phase_shift         (DQS_PHASE),
                .dqs_offsetctrl_enable   ("false"),
                .dqs_ctrl_latches_enable (USE_DQS_DELAY_LATCHES)
            ) dqsn_delay_chain(
               .dqsin          (dqsn_buffered),
               .delayctrlin    (chosen_dqs_delay_delayctrlin),
               .offsetctrlin   (), //(dll_offset_delay_ctrl),
               .dqsupdateen    (dqs_update_en),
               .phasectrlin    (dqsinputphasesetting),
                // synopsys translate_off
               .devclrn        (),
               .devpor         (),
               .dffin          (),
                // synopsys translate_on
               .dqsbusout      (dqsn_enable_op)
            );
    end
    end
endgenerate
generate
    if (DWIDTH_RATIO == 4)
    begin : half_rate_dqs_enable_gen
        stratixiii_ddio_out # (
            .half_rate_mode("true"),
            .use_new_clocking_model("true")
        ) ddio(
            .datainhi (poa_postamble_en_preset[1]),
            .datainlo (poa_postamble_en_preset[0]),
            .clkhi    (resync_clk_1x),
            .clklo    (resync_clk_1x),
            .muxsel   (resync_clk_1x),
            .ena      (1'b1),
            .areset   (1'b0),
            .sreset   (1'b0),
            // synopsys translate_off
            .dfflo(),
            .dffhi(),
            .devclrn(),
            .devpor(),
            .clk(),
            // synopsys translate_on
            .dataout (dqs_enable_ddio_output)
        );
    end
    else
    begin
        assign dqs_enable_ddio_output  = poa_postamble_en_preset[0];
    end
endgenerate
generate
    if (MEM_IF_MEMTYPE == "DDR3" && LEVELLING == 1)
    begin : ddr3_dqs_enable_ctrl_gen
        // DQS Enable Control
        stratixiii_dqs_enable_ctrl # (
             .use_phasectrlin                ("true"),
             .phase_setting                  (0),
             .delay_buffer_mode              ("high"),
             .level_dqs_enable               ("true"),
             .delay_dqs_enable_by_half_cycle ("true"),
             .add_phase_transfer_reg         ("dynamic"),
             .invert_phase                   ("dynamic")
         ) dqs_enable_ctrl (
            .dqsenablein            (dqs_enable_ddio_output),
            .clk                    (resync_clk_2x),
            .delayctrlin            (dedicated_dll_delay_ctrl),
            .phasectrlin            (dqsenablectrlphasesetting),
            .enaphasetransferreg    (enadqsenablephasetransferreg),
            .phaseinvertctrl        (dqsenablectrlphaseinvert),
             // synopsys translate_off
            .devclrn                (),
            .devpor                 (),
            .dffin                  (),
            .dffextenddqsenable     (),
             // synopsys translate_on
            .dqsenableout           (dqs_enable_ctrl_op)
        );
         // DQS enable delay chain
         if (MEM_IF_USE_T11 == 1)
         begin : ddr3_using_t11_delay
         stratixiii_delay_chain dqs_enable_ctrl_dc1
         (
            .datain             (dqs_enable_ctrl_op),
            .delayctrlin        ({1'b0,dqsenabledelaysetting}),
             // synopsys translate_off
	     .finedelayctrlin(),
             .devclrn(),
             .devpor(),
             // synopsys translate_on
            .dataout             (dqs_enable_ctrl_op_delayed)
         );
         end
         else
         begin : ddr3_not_using_t11_delay
             assign dqs_enable_ctrl_op_delayed = dqs_enable_ctrl_op;
         end
        // DQS Enable
        stratixiii_dqs_enable dqs_enable_atom(
            .dqsin      (dqs_delayed2),
            .dqsenable  (dqs_enable_ctrl_op_delayed),
            // synopsys translate_off
            .devclrn    (),
            .devpor     (),
            // synopsys translate_on
            .dqsbusout  (dqs_enable_op)
        );
        // Tie-off unused DQSN enable for DDR :
        assign dqsn_enable_op = 1'b0;
    end
    else if (MEM_IF_MEMTYPE == "DDR2" || MEM_IF_MEMTYPE == "DDR" || (MEM_IF_MEMTYPE == "DDR3" && LEVELLING == 0))
    begin : ddr_dqs_enable_ctrl_gen
        // DQS Enable Control
        stratixiii_dqs_enable_ctrl # (
             .use_phasectrlin                ("false"),
             .phase_setting                  (0),         //zero tap used
             .delay_buffer_mode              ("high"),    // n/a due to zero tap
             .level_dqs_enable               ("true"),
             .delay_dqs_enable_by_half_cycle ("true"),
             .add_phase_transfer_reg         (ADD_PHASE_TRANSFER_REG_SETTING),
             .invert_phase                   (INVERT_POSTAMBLE_CLK)
         ) dqs_enable_ctrl (
            .dqsenablein            (dqs_enable_ddio_output),
            .clk                    (resync_clk_2x),
            .delayctrlin            (dedicated_dll_delay_ctrl),
            .phasectrlin            (dqsenablectrlphasesetting),
            .enaphasetransferreg    (enadqsenablephasetransferreg),
            .phaseinvertctrl        (dqsenablectrlphaseinvert),
             // synopsys translate_off
            .devclrn                (),
            .devpor                 (),
            .dffin                  (),
            .dffextenddqsenable     (),
             // synopsys translate_on
            .dqsenableout           (dqs_enable_ctrl_op)
        );
         // DQS enable delay chain   If used could be inserted here
         assign dqs_enable_ctrl_op_delayed = dqs_enable_ctrl_op;
        // DQS Enable
        stratixiii_dqs_enable dqs_enable_atom(
            .dqsin      (dqs_delayed2),
            .dqsenable  (dqs_enable_ctrl_op_delayed),
            // synopsys translate_off
            .devclrn    (),
            .devpor     (),
            // synopsys translate_on
            .dqsbusout  (dqs_enable_op)
        );
        // Tie-off unused DQSN enable for DDR :
        assign dqsn_enable_op = 1'b0;
    end
endgenerate
endmodule