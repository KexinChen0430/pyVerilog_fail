module,
                                    // we don't actually have any status to report.
                          2'b01 };  // Bits [1:0] must be "01" according to the JTAG specification,
                                    // which helps tell whether a device in the JTAG chain supports the IDCODE instruction
                                    // or not (in which case it would be in BYPASS mode, and its first bit would then be 0).
           STATE_update_ir:
                begin
                   if ( TRACE_STATE_MACHINE_TRANSITIONS )
                     begin
                        instruction_name = get_instruction_name( jtag_ir );
                        $display( "%sCurrent instruction set to %0s.", TRACE_PREFIX, instruction_name );
                     end
                   current_instruction <= jtag_ir;
                   is_tap_current_instruction_debug_o <= 0;
                   case ( jtag_ir )
                     `JTAG_INSTRUCTION_DEBUG:  is_tap_current_instruction_debug_o <= 1;
                     default:
                       begin
                          // Nothing to do here.
                       end
                   endcase
                end
           STATE_shift_ir:
             jtag_ir <= { jtag_tdi_i, jtag_ir[IR_LENGTH-1:1] };
           STATE_capture_dr:
             do_capture_dr;
           STATE_shift_dr:
             do_shift_dr;
           default:
             begin
                // Nothing to do here.
             end
         endcase
      end
   endtask
   task automatic switch_to_next_state;
      reg [3:0] next_state;
      reg [16*8-1:0] prev_state_name;
      reg [16*8-1:0] next_state_name;
      begin
         next_state = get_next_state( current_state );
         if ( TRACE_JTAG_DATA || TRACE_STATE_MACHINE_TRANSITIONS )
           begin
              prev_state_name = get_state_name( current_state );
              if ( next_state == current_state )
                begin
                   if ( TRACE_JTAG_DATA )
                     $display( "%sTCK posedge, TMS=%0d, TDI=%0d while in state '%0s'.",
                               TRACE_PREFIX, jtag_tms_i, jtag_tdi_i, prev_state_name );
                end
              else
                begin
                   next_state_name = get_state_name( next_state );
                   if ( TRACE_JTAG_DATA )
                     $display( "%sTCK posedge, TMS=%0d, TDI=%0d, changing state from '%0s' to '%0s'.",
                               TRACE_PREFIX, jtag_tms_i, jtag_tdi_i, prev_state_name, next_state_name );
                   if ( TRACE_STATE_MACHINE_TRANSITIONS )
                     $display( "%sChanging state from '%0s' to '%0s'.",
                               TRACE_PREFIX, prev_state_name, next_state_name );
                end
           end
         current_state <= next_state;
         is_tap_state_test_logic_reset_o <= 0;
         is_tap_state_shift_dr_o         <= 0;
         is_tap_state_update_dr_o        <= 0;
         is_tap_state_capture_dr_o       <= 0;
         case ( next_state )
           STATE_test_logic_reset:  is_tap_state_test_logic_reset_o <= 1;
           STATE_shift_dr:          is_tap_state_shift_dr_o         <= 1;
           STATE_update_dr:         is_tap_state_update_dr_o        <= 1;
           STATE_capture_dr:        is_tap_state_capture_dr_o       <= 1;
           default:
             begin
                // Nothing to do here.
             end
         endcase
      end
   endtask
   task automatic tck_negedge;
      reg [16*8-1:0] state_name;
      begin
         if ( TRACE_JTAG_DATA )
           begin
              state_name = get_state_name( current_state );
              $display( "%sTCK negedge, TMS=%0d, TDI=%0d while in state '%0s'.",
                        TRACE_PREFIX, jtag_tms_i, jtag_tdi_i, state_name );
           end
         // According to the JTAG specification TDO changes state at the negative edge of TCK.
         // This is from the documentation about Xilinx BSCAN_SPARTAN6 (which allows access to the FPGA's JTAG TAP):
         //   TDO input driven from the user fabric logic. This signal is
         //   internally sampled on the falling edge before being driven out
         //   to the FPGA TDO pin.
         if ( current_state == STATE_shift_ir )
           jtag_tdo_o <= jtag_ir[0];
         else
           begin
              case ( current_instruction )
                `JTAG_INSTRUCTION_IDCODE:            jtag_tdo_o <= idcode_reg[0];
                `JTAG_INSTRUCTION_DEBUG:             jtag_tdo_o <= debug_reg[0]; //debug_tdo_i; TH
                `JTAG_INSTRUCTION_SAMPLE_PRELOAD:    jtag_tdo_o <= 0;  // Boundary scan not supported.
                `JTAG_INSTRUCTION_EXTEST:            jtag_tdo_o <= 0;  // Boundary scan not supported.
                `JTAG_INSTRUCTION_MBIST:             jtag_tdo_o <= 0;  // MBIST not supported.
                default:                             jtag_tdo_o <= bypass_reg;
              endcase
           end
      end
   endtask
   always @( posedge jtag_tck_i or negedge jtag_trstn_i )
     begin
        // These 2 conditions must be combined in a single always block,
        // otherwise Verilator complains that current_state has 2 drivers,
        // as the reset is asynchronous.
        if ( jtag_trstn_i == 0 )
          begin
             if ( TRACE_STATE_MACHINE_TRANSITIONS )
               $display( "%sAsync reset signal TRST asserted (the value is now 0).", TRACE_PREFIX );
             reset_sync;
          end
        else
          begin
             tck_posedge;
             switch_to_next_state;
          end
     end
   always @( negedge jtag_tck_i )
     begin
        tck_negedge;
     end
   always @( posedge jtag_trstn_i )
     begin
        if ( TRACE_STATE_MACHINE_TRANSITIONS )
          $display( "%sAsync reset signal TRST deasserted (the value is now 1).", TRACE_PREFIX );
     end
endmodule