module instantiations.
  rosc_entropy_core core(
                         .clk(clk),
                         .reset_n(reset_n),
                         .opa(op_a_reg),
                         .opb(op_b_reg),
                         .rosc_en(enable_reg),
                         .rosc_cycles(rosc_cycles_reg),
                         .raw_entropy(raw_entropy),
                         .rosc_outputs(rosc_outputs),
                         .entropy_data(internal_entropy_data),
                         .entropy_valid(internal_entropy_valid),
                         .entropy_ack(internal_entropy_ack),
                         .debug(debug),
                         .debug_update(debug_update)
                        );
  // reg_update
  // Update functionality for all registers in the core.
  // All registers are positive edge triggered with asynchronous
  // active low reset.
  always @ (posedge clk or negedge reset_n)
    begin
      if (!reset_n)
        begin
          enable_reg      <= 32'hffffffff;
          rosc_cycles_reg <= 8'hff;
          op_a_reg        <= DEFAULT_OP_A;
          op_b_reg        <= DEFAULT_OP_B;
        end
      else
        begin
          if (enable_we)
            begin
              enable_reg <= write_data;
            end
          if (rosc_cycles_we)
            begin
              rosc_cycles_reg <= write_data[7 : 0];
            end
          if (op_a_we)
            begin
              op_a_reg <=  write_data;
            end
          if (op_b_we)
            begin
              op_b_reg <=  write_data;
            end
         end
    end // reg_update
  // api_logic
  // Implementation of the api logic. If cs is enabled will either
  // try to write to or read from the internal registers.
  always @*
    begin : api_logic
      enable_we       = 0;
      rosc_cycles_we  = 0;
      op_a_we         = 0;
      op_b_we         = 0;
      api_entropy_ack = 0;
      tmp_read_data   = 32'h00000000;
      tmp_error       = 0;
      if (cs)
        begin
          if (we)
            begin
              case (address)
                // Write operations.
                ADDR_CTRL:
                  begin
                    enable_we  = 1;
                  end
                ADDR_ROSC_CYCLES:
                  begin
                    rosc_cycles_we = 1;
                  end
                ADDR_OP_A:
                  begin
                    op_a_we  = 1;
                  end
                ADDR_OP_B:
                  begin
                    op_b_we  = 1;
                  end
                default:
                  begin
                    tmp_error = 1;
                  end
              endcase // case (address)
            end
          else
            begin
              case (address)
                ADDR_NAME0:
                  begin
                    tmp_read_data = CORE_NAME0;
                  end
                ADDR_NAME1:
                  begin
                    tmp_read_data = CORE_NAME1;
                  end
                ADDR_VERSION:
                  begin
                    tmp_read_data = CORE_VERSION;
                  end
                ADDR_CTRL:
                  begin
                    tmp_read_data = enable_reg;
                  end
                ADDR_STATUS:
                  begin
                    tmp_read_data[STATUS_ENTROPY_VALID_BIT] = internal_entropy_valid;
                  end
                ADDR_ROSC_CYCLES:
                  begin
                    tmp_read_data = rosc_cycles_reg;
                  end
                ADDR_OP_A:
                  begin
                    tmp_read_data = op_a_reg;
                  end
                ADDR_OP_B:
                  begin
                    tmp_read_data = op_b_reg;
                  end
                ADDR_ENTROPY:
                  begin
                    tmp_read_data = entropy_data;
                    api_entropy_ack = 1;
                  end
                ADDR_RAW:
                  begin
                    tmp_read_data = raw_entropy;
                  end
                ADDR_ROSC_OUTPUTS:
                  begin
                    tmp_read_data = rosc_outputs;
                  end
                default:
                  begin
                    tmp_error = 1;
                  end
              endcase // case (address)
            end
        end
    end
endmodule