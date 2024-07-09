module ovl_win_change (clock, reset, enable, start_event, test_expr, end_event, fire);
  parameter severity_level = `OVL_SEVERITY_DEFAULT;
  parameter width          = 1;
  parameter property_type  = `OVL_PROPERTY_DEFAULT;
  parameter msg            = `OVL_MSG_DEFAULT;
  parameter coverage_level = `OVL_COVER_DEFAULT;
  parameter clock_edge     = `OVL_CLOCK_EDGE_DEFAULT;
  parameter reset_polarity = `OVL_RESET_POLARITY_DEFAULT;
  parameter gating_type    = `OVL_GATING_TYPE_DEFAULT;
  input                          clock, reset, enable;
  input                          start_event;
  input  [width-1:0]             test_expr;
  input                          end_event;
  output [`OVL_FIRE_WIDTH-1:0]   fire;
  // Parameters that should not be edited
  parameter assert_name = "OVL_WIN_CHANGE";
  `include "std_ovl_reset.h"
  `include "std_ovl_clock.h"
  `include "std_ovl_cover.h"
  `include "std_ovl_task.h"
  `include "std_ovl_init.h"
`ifdef OVL_VERILOG
  `include "./vlog95/assert_win_change_logic.v"
  assign fire = {fire_cover, fire_xcheck, fire_2state};
`endif
`ifdef OVL_SVA
  `include "./sva05/assert_win_change_logic.sv"
  assign fire = {`OVL_FIRE_WIDTH{1'b0}}; // Tied low in V2.3
`endif
`ifdef OVL_PSL
  assign fire = {`OVL_FIRE_WIDTH{1'b0}}; // Tied low in V2.3
  `include "./psl05/assert_win_change_psl_logic.v"
`else
  `endmodule