module verification error". Should return
                //       value be verified, or it's already done at loading?
                callStack_data <= {blockStack_index, blockStack_underflow,
                                   stack_upper, stack_lower,
                                   mem_data_returnType, call_PC,
                                   stack_index-mem_data_arguments,
                                   stack_underflow};
                // Set empty stacks for the called function
                blockStack_underflow <= blockStack_index;
                stack_underflow <= stack_index + mem_data_localEntries - mem_data_arguments;
                stack_upper     <= stack_index + mem_data_localEntries - mem_data_arguments;
                stack_lower     <= stack_index                         - mem_data_arguments;
              end
            end
            // Variable access
            `op_get_local: begin
              if(stack_error) trap <= `STACK_ERROR;
              else begin
                stack_op   <= `PUSH;
                stack_data <= stack_getter;
              end
            end
          endcase
        end
        EXEC4: begin
          step <= EXEC5;
        end
        EXEC5: begin
          step <= FETCH;
          case (opcode)
            `op_br_table: begin
              if(blockStack_error)
                trap <= `BLOCK_STACK_ERROR;
              else
                block_break2();
            end
          endcase
        end
      endcase
  end
endmodule