module pcie3_7x_0_pcie_force_adapt (
  input                     pipe_clk,
  input                     user_clk,
  input                     rx_clk,
  input       [5:0]         cfg_ltssm_state,
  input       [2:0]         cfg_current_speed,
  input       [1:0]         pipe_tx0_rate,
  input                     pipe_rx0_elec_idle,
  input                     pipe_rx0_eqlp_adaptdone,
  input       [1:0]         pipe_tx0_eqcontrol,
  input      [31:0]         pipe_rx0_data_in,
  input      [31:0]         pipe_rx1_data_in,
  input      [31:0]         pipe_rx2_data_in,
  input      [31:0]         pipe_rx3_data_in,
  input      [31:0]         pipe_rx4_data_in,
  input      [31:0]         pipe_rx5_data_in,
  input      [31:0]         pipe_rx6_data_in,
  input      [31:0]         pipe_rx7_data_in,
  input        [1:0]        pipe_rx0_eqcontrol_in,
  input        [1:0]        pipe_rx1_eqcontrol_in,
  input        [1:0]        pipe_rx2_eqcontrol_in,
  input        [1:0]        pipe_rx3_eqcontrol_in,
  input        [1:0]        pipe_rx4_eqcontrol_in,
  input        [1:0]        pipe_rx5_eqcontrol_in,
  input        [1:0]        pipe_rx6_eqcontrol_in,
  input        [1:0]        pipe_rx7_eqcontrol_in,
  output      [31:0]        pipe_rx0_data_out,
  output      [31:0]        pipe_rx1_data_out,
  output      [31:0]        pipe_rx2_data_out,
  output      [31:0]        pipe_rx3_data_out,
  output      [31:0]        pipe_rx4_data_out,
  output      [31:0]        pipe_rx5_data_out,
  output      [31:0]        pipe_rx6_data_out,
  output      [31:0]        pipe_rx7_data_out,
  output       [1:0]        pipe_rx0_eqcontrol_out,
  output       [1:0]        pipe_rx1_eqcontrol_out,
  output       [1:0]        pipe_rx2_eqcontrol_out,
  output       [1:0]        pipe_rx3_eqcontrol_out,
  output       [1:0]        pipe_rx4_eqcontrol_out,
  output       [1:0]        pipe_rx5_eqcontrol_out,
  output       [1:0]        pipe_rx6_eqcontrol_out,
  output       [1:0]        pipe_rx7_eqcontrol_out
);
localparam      RXJITTER_TEK              = "TRUE";
(* ASYNC_REG = "TRUE", SHIFT_EXTRACT = "NO" *)      reg  [5:0]   cfg_ltssm_state_reg = 6'b0;
(* ASYNC_REG = "TRUE", SHIFT_EXTRACT = "NO" *)      reg  [5:0]   cfg_ltssm_state_reg0 = 6'b0;
(* ASYNC_REG = "TRUE", SHIFT_EXTRACT = "NO" *)      reg  [5:0]   cfg_ltssm_state_reg1 = 6'b0;
 reg          speed_change = 1'b0;
 reg          gen3_flag = 1'b1;
 reg          cfg_loopback = 1'b0;
 always @ (posedge user_clk )
  begin
    cfg_ltssm_state_reg      <= cfg_ltssm_state;
    cfg_ltssm_state_reg0     <= cfg_ltssm_state_reg;
    cfg_ltssm_state_reg1     <= cfg_ltssm_state_reg0;
  end
  // Flag to indicate the first transition to Gen3
 always @ (posedge user_clk )
  begin
    if (cfg_ltssm_state_reg1 == 6'h10 && cfg_current_speed[2] )
      gen3_flag <= 1'b1;
    else if ((cfg_ltssm_state_reg1 == 6'hc || cfg_ltssm_state_reg1 == 6'hD ) && pipe_tx0_eqcontrol[0])
      gen3_flag <= 1'b0;
    else
      gen3_flag <= gen3_flag;
  end
 // Flag to indicate Speed Change
 always @ (posedge user_clk )
  begin
    if ((cfg_ltssm_state_reg1 == 6'hc || cfg_ltssm_state_reg1 == 6'h18 ) && cfg_ltssm_state == 6'hb)
    begin
      speed_change <= gen3_flag;
    end
    else if (cfg_ltssm_state != 6'hb) begin
      speed_change <= 1'b0;
    end
    else begin
      speed_change <= speed_change;
    end
  end
 // Flag to indicate cfg -> loopback slave
 generate
 if (RXJITTER_TEK == "TRUE")
 begin: loopback
 always @ (posedge user_clk )
  begin
    if (cfg_ltssm_state_reg1 == 6'h25 || cfg_ltssm_state_reg1 == 6'h24 )
    begin
      cfg_loopback <= 1'b1;
    end
    else
      cfg_loopback <= 1'b0;
  end
 end
 endgenerate
    wire         elec_idle_deasserted;
(* ASYNC_REG = "TRUE", SHIFT_EXTRACT = "NO" *)         reg          speed_change_reg0  =1'b0;
(* ASYNC_REG = "TRUE", SHIFT_EXTRACT = "NO" *)         reg          speed_change_reg1  =1'b0;
(* ASYNC_REG = "TRUE", SHIFT_EXTRACT = "NO" *)         reg          speed_change_reg2  =1'b0;
(* ASYNC_REG = "TRUE", SHIFT_EXTRACT = "NO" *)         reg          cfg_loopback_reg0  =1'b0;
(* ASYNC_REG = "TRUE", SHIFT_EXTRACT = "NO" *)         reg          cfg_loopback_reg1  =1'b0;
(* ASYNC_REG = "TRUE", SHIFT_EXTRACT = "NO" *)         reg          cfg_loopback_reg2  =1'b0;
    reg  [3:0]   eq_state           =4'b0001;
    reg         pipe_eq_adapt = 1'b0;
    localparam  EQ_IDLE     = 4'b0001;
    localparam  EQ_ADAPT    = 4'b0010;
    localparam  EQ_RX_TEK   = 4'b0100;
    localparam  EQ_WAIT     = 4'b1000;
    // Device should be in R.RL with elec idle deasserted for force adapttation to start
    assign elec_idle_deasserted = ~ pipe_rx0_elec_idle;
   // CDC speed_change from user clock to pipe clock domain
  always @ (posedge pipe_clk )
   begin
    speed_change_reg0            <= speed_change;
    speed_change_reg1            <= speed_change_reg0;
    speed_change_reg2            <= speed_change_reg1;
   end
// CDC cfg_loopback from user clock to pipe clock domain
  always @ (posedge pipe_clk )
   begin
    cfg_loopback_reg0            <= cfg_loopback;
    cfg_loopback_reg1            <= cfg_loopback_reg0;
    cfg_loopback_reg2            <= cfg_loopback_reg1;
   end
  // State Machine to Control Forced Adaptation
  always @ (posedge pipe_clk )
   begin
   case(eq_state)
    EQ_IDLE : begin
      if (speed_change_reg2 && elec_idle_deasserted && pipe_tx0_rate[1])
        eq_state                <= EQ_ADAPT;
      else if (cfg_loopback_reg2 && pipe_tx0_rate[1])
         eq_state               <= EQ_RX_TEK;
      else
        eq_state                <= EQ_IDLE;
      end
    EQ_ADAPT : begin
      if (pipe_rx0_eqlp_adaptdone)
        eq_state                <= EQ_WAIT;
      else
        eq_state                <= EQ_ADAPT;
      end
    EQ_RX_TEK : begin
      if (pipe_rx0_eqlp_adaptdone)
        eq_state                <= EQ_IDLE;
      else
        eq_state                <= EQ_RX_TEK;
      end
    EQ_WAIT : begin
      if (!speed_change_reg2)
        eq_state                <= EQ_IDLE;
      else
        eq_state                <= EQ_WAIT;
      end
   endcase
   end
  assign pipe_rx0_data_out = (eq_state == EQ_ADAPT) ? {32{1'b1}}: pipe_rx0_data_in;
  assign pipe_rx1_data_out = (eq_state == EQ_ADAPT) ? {32{1'b1}}: pipe_rx1_data_in;
  assign pipe_rx2_data_out = (eq_state == EQ_ADAPT) ? {32{1'b1}}: pipe_rx2_data_in;
  assign pipe_rx3_data_out = (eq_state == EQ_ADAPT) ? {32{1'b1}}: pipe_rx3_data_in;
  assign pipe_rx4_data_out = (eq_state == EQ_ADAPT) ? {32{1'b1}}: pipe_rx4_data_in;
  assign pipe_rx5_data_out = (eq_state == EQ_ADAPT) ? {32{1'b1}}: pipe_rx5_data_in;
  assign pipe_rx6_data_out = (eq_state == EQ_ADAPT) ? {32{1'b1}}: pipe_rx6_data_in;
  assign pipe_rx7_data_out = (eq_state == EQ_ADAPT) ? {32{1'b1}}: pipe_rx7_data_in;
  assign pipe_rx0_eqcontrol_out =  ((eq_state == EQ_ADAPT) || (eq_state == EQ_RX_TEK)) ? 2'b11 : pipe_rx0_eqcontrol_in;
  assign pipe_rx1_eqcontrol_out =  ((eq_state == EQ_ADAPT) || (eq_state == EQ_RX_TEK)) ? 2'b11 : pipe_rx1_eqcontrol_in;
  assign pipe_rx2_eqcontrol_out =  ((eq_state == EQ_ADAPT) || (eq_state == EQ_RX_TEK)) ? 2'b11 : pipe_rx2_eqcontrol_in;
  assign pipe_rx3_eqcontrol_out =  ((eq_state == EQ_ADAPT) || (eq_state == EQ_RX_TEK)) ? 2'b11 : pipe_rx3_eqcontrol_in;
  assign pipe_rx4_eqcontrol_out =  ((eq_state == EQ_ADAPT) || (eq_state == EQ_RX_TEK)) ? 2'b11 : pipe_rx4_eqcontrol_in;
  assign pipe_rx5_eqcontrol_out =  ((eq_state == EQ_ADAPT) || (eq_state == EQ_RX_TEK)) ? 2'b11 : pipe_rx5_eqcontrol_in;
  assign pipe_rx6_eqcontrol_out =  ((eq_state == EQ_ADAPT) || (eq_state == EQ_RX_TEK)) ? 2'b11 : pipe_rx6_eqcontrol_in;
  assign pipe_rx7_eqcontrol_out =  ((eq_state == EQ_ADAPT) || (eq_state == EQ_RX_TEK)) ? 2'b11 : pipe_rx7_eqcontrol_in;
endmodule