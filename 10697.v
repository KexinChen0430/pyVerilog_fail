module pcie3_7x_0_pcie_init_ctrl_7vx # (
  parameter         TCQ = 100,
  parameter         PL_UPSTREAM_FACING = "TRUE"
) (
  input               clk_i,                   // User Clock
  output              reset_n_o,               // Fundamental reset, active low
  output              pipe_reset_n_o,          // Resets the PIPE clock domain logic, active low
  output              mgmt_reset_n_o,          // Resets management and configuration registers, active low
  output              mgmt_sticky_reset_n_o,   // Resets sticky management and configuration register bits, active low
  input               mmcm_lock_i,             // MMCM Locked : 1b = MMCM Locked
  input               phy_rdy_i,               // GT is ready : 1b = GT Ready
  input               cfg_input_update_done_i,    // Configuration Input update Complete
  output              cfg_input_update_request_o, // Configuration Input Update Request
  input               cfg_mc_update_done_i,       // Configuration Memory Cell Update Complete
  output              cfg_mc_update_request_o,    // Configuration Memory Cell Update Request
  input               user_cfg_input_update_i,    // User driven Configuration Input Update Request
  output  [2:0]       state_o                     // Debug state
);
  // Local Params
  localparam           STATE_RESET                 =  3'b000;
  localparam           STATE_MGMT_RESET_DEASSERT   =  3'b001;
  localparam           STATE_MC_TRANSFER_REQ       =  3'b010;
  localparam           STATE_INPUT_UPDATE_REQ      =  3'b011;
  localparam           STATE_PHY_RDY               =  3'b100;
  localparam           STATE_RESET_DEASSERT        =  3'b101;
  localparam           STATE_INPUT_UPDATE_REQ_REDO =  3'b110;
  localparam           STATE_MGMT_RESET_ASSERT     =  3'b111;
  // Local Registers
  reg  [2:0]          reg_state /* synthesis syn_state_machine=1 */;
  reg  [2:0]          reg_next_state;
  reg  [1:0]          reg_clock_locked;
  reg  [1:0]          reg_phy_rdy;
  reg                 reg_cold_reset = 1'b1 ;
  reg                 reg_reset_n_o;
  reg                 reg_pipe_reset_n_o;
  reg                 reg_mgmt_reset_n_o;
  reg                 reg_mgmt_sticky_reset_n_o;
  reg                 reg_cfg_input_update_request_o;
  reg                 reg_cfg_mc_update_request_o;
  reg  [1:0]          reg_reset_timer;
  reg  [4:0]          reg_mgmt_reset_timer;
  reg                 regff_mgmt_reset_n_o = 1'b0;
  reg                 regff_mgmt_sticky_reset_n_o = 1'b0;
  reg                 regff_reset_n_o = 1'b0;
  reg                 regff_pipe_reset_n_o = 1'b0;
  // Local Wires
  wire [2:0]          state_w;
  wire [2:0]          next_state_w;
  wire                clock_locked;
  wire                phy_rdy;
  wire                cold_reset;
  wire [1:0]          reset_timer_w;
  // Synchronize MMCM lock output
  always @ (posedge clk_i or negedge mmcm_lock_i) begin
    if (!mmcm_lock_i) begin
      reg_clock_locked[1:0] <= #TCQ 2'b11;
    end else begin
      reg_clock_locked[1:0] <= #TCQ {reg_clock_locked[0], 1'b0};
    end
  end
  assign  clock_locked = !reg_clock_locked[1];
  // Synchronize PHY Ready
  always @ (posedge clk_i or negedge phy_rdy_i) begin
    if (!phy_rdy_i) begin
      reg_phy_rdy[1:0] <= #TCQ 2'b11;
    end else begin
      reg_phy_rdy[1:0] <= #TCQ {reg_phy_rdy[0], 1'b0};
    end
  end
  assign  phy_rdy = !reg_phy_rdy[1];
  // Controller FSM
  always @ (posedge clk_i or negedge clock_locked) begin
    if (!clock_locked) begin
       reg_state <= #(TCQ) STATE_RESET;
       reg_reset_timer <= #(TCQ) 2'b00;
    end else begin
      reg_state <= #(TCQ) reg_next_state;
      if ((state_w == STATE_MGMT_RESET_DEASSERT) && (reset_timer_w != 2'b11))
        reg_reset_timer <= #(TCQ) reset_timer_w + 1'b1;
    end
  end
  always @ (posedge clk_i) begin
    // reset the cold reset flag
    if ((state_w == STATE_PHY_RDY) && (next_state_w == STATE_RESET_DEASSERT) && (cold_reset == 1'b1))
      reg_cold_reset <= #(TCQ) 1'b0;
  end
 always @ (posedge clk_i) begin // mgmt reset timer
    if (state_w == STATE_MGMT_RESET_ASSERT)
      reg_mgmt_reset_timer <= #(TCQ) reg_mgmt_reset_timer + 1'b1;
    else if (state_w == STATE_MGMT_RESET_DEASSERT)
      reg_mgmt_reset_timer <= #(TCQ) 5'h00;
    else
      reg_mgmt_reset_timer <= #(TCQ) reg_mgmt_reset_timer;
  end
generate // Resets for EP and Downstream Port
 begin: generate_resets
  if( PL_UPSTREAM_FACING == "TRUE") // DUT is a EP
  begin
   always @ (*) begin
    reg_next_state = STATE_RESET;
    reg_mgmt_reset_n_o = 1'b1;
    reg_mgmt_sticky_reset_n_o = 1'b1;
    reg_cfg_input_update_request_o = 1'b0;
    reg_cfg_mc_update_request_o = 1'b0;
    reg_reset_n_o = 1'b0;
    reg_pipe_reset_n_o = 1'b0;
    case(state_w)
      STATE_RESET : begin
        reg_mgmt_reset_n_o = 1'b0;
        reg_mgmt_sticky_reset_n_o = 1'b0;
        if (clock_locked) begin
          reg_next_state = STATE_MGMT_RESET_DEASSERT;
        end else begin
          reg_next_state = STATE_RESET;
        end
      end
      STATE_MGMT_RESET_DEASSERT : begin
        if (reset_timer_w == 2'b11) begin
          reg_next_state = STATE_MC_TRANSFER_REQ;
        end else begin
          reg_next_state = STATE_MGMT_RESET_DEASSERT;
        end
      end
      STATE_MC_TRANSFER_REQ : begin
        reg_cfg_mc_update_request_o = 1'b1;
        if (cfg_mc_update_done_i) begin
          reg_next_state = STATE_INPUT_UPDATE_REQ;
        end else begin
          reg_next_state = STATE_MC_TRANSFER_REQ;
        end
      end
      STATE_INPUT_UPDATE_REQ : begin
        reg_cfg_input_update_request_o = 1'b1;
        if (cfg_input_update_done_i) begin
          reg_next_state = STATE_PHY_RDY;
        end else begin
          reg_next_state = STATE_INPUT_UPDATE_REQ;
        end
      end
      STATE_PHY_RDY : begin
        // Check warm reset flag
        if (!cold_reset) begin
          reg_pipe_reset_n_o = 1'b1;
        end
        if (phy_rdy) begin
          reg_next_state = STATE_RESET_DEASSERT;
        end else begin
          reg_next_state = STATE_PHY_RDY;
        end
      end
      STATE_RESET_DEASSERT : begin
        reg_reset_n_o = 1'b1;
        reg_pipe_reset_n_o = 1'b1;
        if (!phy_rdy) begin
          reg_next_state = STATE_MGMT_RESET_ASSERT;
        end else if (user_cfg_input_update_i) begin
          reg_next_state = STATE_INPUT_UPDATE_REQ_REDO;
        end else begin
          reg_next_state = STATE_RESET_DEASSERT;
        end
      end
      STATE_INPUT_UPDATE_REQ_REDO : begin
        reg_reset_n_o = 1'b1;
        reg_pipe_reset_n_o = 1'b1;
        reg_cfg_input_update_request_o = 1'b1;
        if (cfg_input_update_done_i) begin
          reg_next_state = STATE_RESET_DEASSERT;
        end else begin
          reg_next_state = STATE_INPUT_UPDATE_REQ_REDO;
        end
      end
     STATE_MGMT_RESET_ASSERT : begin
        if (reg_mgmt_reset_timer == 5'h1f) begin
          reg_next_state = STATE_MGMT_RESET_DEASSERT;
          reg_mgmt_reset_n_o = 1'b1;
        end else begin
          reg_next_state = STATE_MGMT_RESET_ASSERT;
          reg_mgmt_reset_n_o = 1'b0;
        end
      end
    endcase
  end //always
  end else  begin // DUT is a Downstream port
   always @ (*) begin
    reg_next_state = STATE_RESET;
    reg_mgmt_reset_n_o = 1'b1;
    reg_mgmt_sticky_reset_n_o = 1'b1;
    reg_cfg_input_update_request_o = 1'b0;
    reg_cfg_mc_update_request_o = 1'b0;
    reg_reset_n_o = 1'b0;
    reg_pipe_reset_n_o = 1'b0;
    case(state_w)
      STATE_RESET : begin
        reg_mgmt_reset_n_o = 1'b0;
        reg_mgmt_sticky_reset_n_o = 1'b0;
        if (clock_locked) begin
          reg_next_state = STATE_MGMT_RESET_DEASSERT;
        end else begin
          reg_next_state = STATE_RESET;
        end
      end
      STATE_MGMT_RESET_DEASSERT : begin
        if (reset_timer_w == 2'b11) begin
          reg_next_state = STATE_MC_TRANSFER_REQ;
        end else begin
          reg_next_state = STATE_MGMT_RESET_DEASSERT;
        end
      end
      STATE_MC_TRANSFER_REQ : begin
        reg_cfg_mc_update_request_o = 1'b1;
        if (cfg_mc_update_done_i) begin
          reg_next_state = STATE_INPUT_UPDATE_REQ;
        end else begin
          reg_next_state = STATE_MC_TRANSFER_REQ;
        end
      end
      STATE_INPUT_UPDATE_REQ : begin
        reg_cfg_input_update_request_o = 1'b1;
        if (cfg_input_update_done_i) begin
          reg_next_state = STATE_PHY_RDY;
        end else begin
          reg_next_state = STATE_INPUT_UPDATE_REQ;
        end
      end
      STATE_PHY_RDY : begin
        // Check warm reset flag
        if (!cold_reset) begin
          reg_pipe_reset_n_o = 1'b1;
        end
        if (phy_rdy) begin
          reg_next_state = STATE_RESET_DEASSERT;
        end else begin
          reg_next_state = STATE_PHY_RDY;
        end
      end
      STATE_RESET_DEASSERT : begin
        reg_reset_n_o = 1'b1;
        reg_pipe_reset_n_o = 1'b1;
        if (!phy_rdy) begin
          reg_next_state = STATE_PHY_RDY;
        end else if (user_cfg_input_update_i) begin
          reg_next_state = STATE_INPUT_UPDATE_REQ_REDO;
        end else begin
          reg_next_state = STATE_RESET_DEASSERT;
        end
      end
      STATE_INPUT_UPDATE_REQ_REDO : begin
        reg_reset_n_o = 1'b1;
        reg_pipe_reset_n_o = 1'b1;
        reg_cfg_input_update_request_o = 1'b1;
        if (cfg_input_update_done_i) begin
          reg_next_state = STATE_RESET_DEASSERT;
        end else begin
          reg_next_state = STATE_INPUT_UPDATE_REQ_REDO;
        end
      end
    endcase
  end //always
  end // else // DUT is a Downstream port
 end // generate resets
 endgenerate
  // Register signals
  always @(posedge clk_i) begin
    regff_mgmt_reset_n_o        <= reg_mgmt_reset_n_o;
    regff_mgmt_sticky_reset_n_o <= reg_mgmt_sticky_reset_n_o;
    regff_pipe_reset_n_o        <= reg_pipe_reset_n_o;
    regff_reset_n_o             <= reg_reset_n_o;
  end
  // Assigns
  assign state_w                    = reg_state;
  assign next_state_w               = reg_next_state;
  //assign reset_n_o                  = reg_reset_n_o;
  //assign pipe_reset_n_o             = reg_pipe_reset_n_o;
  //assign mgmt_reset_n_o             = reg_mgmt_reset_n_o;
  //assign mgmt_sticky_reset_n_o      = reg_mgmt_sticky_reset_n_o;
  assign reset_n_o                  = regff_reset_n_o;
  assign pipe_reset_n_o             = regff_pipe_reset_n_o;
  assign mgmt_reset_n_o             = regff_mgmt_reset_n_o;
  assign mgmt_sticky_reset_n_o      = regff_mgmt_sticky_reset_n_o;
  assign cfg_input_update_request_o = reg_cfg_input_update_request_o;
  assign cfg_mc_update_request_o    = reg_cfg_mc_update_request_o;
  assign cold_reset                 = reg_cold_reset;
  assign state_o                    = reg_state;
  assign reset_timer_w              = reg_reset_timer;
endmodule