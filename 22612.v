module Alu(clock,reset,inst,inst_en,result);
   input wire        clock;
   input wire        reset;
   input wire [11:0] inst;
   input wire        inst_en;
   output wire [7:0] result;
   reg [1:0]         s_State;
   reg [7:0]         s_Accum;
   wire [3:0]        w_InstCode;
   wire [7:0]        w_InstImm;
   reg [256*8-1:0]   d_Input;
   reg [256*8-1:0]   d_State;
   assign result = s_Accum;
   assign w_InstCode = inst[11:8];
   assign w_InstImm = inst[7:0];
   always @ (posedge clock) begin
      if (reset) begin
         s_State <= `Alu_State_Reset;
         s_Accum <= 0;
      end
      else begin
        case (s_State)
          `Alu_State_Reset: begin
             s_State <= `Alu_State_Ready;
             s_Accum <= 0;
          end
          `Alu_State_Ready: begin
             if (inst_en) begin
                case (w_InstCode)
                  `Alu_NOP: begin
                     s_State <= `Alu_State_Ready;
                     s_Accum <= s_Accum;
                  end
                  `Alu_LDI: begin
                     s_State <= `Alu_State_Ready;
                     s_Accum <= w_InstImm;
                  end
                  `Alu_ADD: begin
                     s_State <= `Alu_State_Ready;
                     s_Accum <= s_Accum + w_InstImm;
                  end
                  `Alu_SUB: begin
                     s_State <= `Alu_State_Ready;
                     s_Accum <= s_Accum - w_InstImm;
                  end
                  `Alu_NOT: begin
                     s_State <= `Alu_State_Ready;
                     s_Accum <= ~s_Accum;
                  end
                  `Alu_AND: begin
                     s_State <= `Alu_State_Ready;
                     s_Accum <= s_Accum & w_InstImm;
                  end
                  `Alu_IOR: begin
                     s_State <= `Alu_State_Ready;
                     s_Accum <= s_Accum | w_InstImm;
                  end
                  `Alu_XOR: begin
                     s_State <= `Alu_State_Ready;
                     s_Accum <= s_Accum ^ w_InstImm;
                  end
                  `Alu_SHL: begin
                     s_State <= `Alu_State_Ready;
                     s_Accum <= s_Accum << 1;
                  end
                  `Alu_SHR: begin
                     s_State <= `Alu_State_Ready;
                     s_Accum <= s_Accum >> 1;
                  end
                  `Alu_EQL: begin
                     s_State <= `Alu_State_Ready;
                     s_Accum <= s_Accum == w_InstImm;
                  end
                  `Alu_NEQ: begin
                     s_State <= `Alu_State_Ready;
                     s_Accum <= s_Accum != w_InstImm;
                  end
                  `Alu_LTS: begin
                     s_State <= `Alu_State_Ready;
                     s_Accum <= s_Accum < w_InstImm;
                  end
                  `Alu_LTE: begin
                     s_State <= `Alu_State_Ready;
                     s_Accum <= s_Accum <= w_InstImm;
                  end
                  `Alu_GTS: begin
                     s_State <= `Alu_State_Ready;
                     s_Accum <= s_Accum > w_InstImm;
                  end
                  `Alu_GTE: begin
                     s_State <= `Alu_State_Ready;
                     s_Accum <= s_Accum >= w_InstImm;
                  end
                  default: begin
                     s_State <= `Alu_State_Error;
                     s_Accum <= 0;
                  end
                endcase // case (w_InstCode)
             end // if (inst_en)
             else begin
                s_State <= `Alu_State_Ready;
                s_Accum <= s_Accum;
             end // else: !if(inst_en)
          end // case: `Alu_State_Ready
          `Alu_State_Error: begin
             s_State <= `Alu_State_Error;
             s_Accum <= 0;
          end
          default: begin
             s_State <= `Alu_State_Error;
             s_Accum <= 0;
          end
        endcase // case (s_State)
      end // else: !if(reset)
   end // always @ (posedge clock)
`ifdef SIM
   always @ * begin
      if (inst_en) begin
         case (w_InstCode)
           `Alu_NOP: begin
              $sformat(d_Input,"EN NOP");
           end
           `Alu_LDI: begin
              $sformat(d_Input,"EN (LDI %2X)",w_InstImm);
           end
           `Alu_ADD: begin
              $sformat(d_Input,"EN (ADD %2X)",w_InstImm);
           end
           `Alu_SUB: begin
              $sformat(d_Input,"EN (SUB %2X)",w_InstImm);
           end
           `Alu_NOT: begin
              $sformat(d_Input,"EN NOT");
           end
           `Alu_AND: begin
              $sformat(d_Input,"EN (AND %2X)",w_InstImm);
           end
           `Alu_IOR: begin
              $sformat(d_Input,"EN (IOR %2X)",w_InstImm);
           end
           `Alu_XOR: begin
              $sformat(d_Input,"EN (XOR %2X)",w_InstImm);
           end
           `Alu_SHL: begin
              $sformat(d_Input,"EN SHL");
           end
           `Alu_SHR: begin
              $sformat(d_Input,"EN SHR");
           end
           `Alu_EQL: begin
              $sformat(d_Input,"EN (EQL %2X)",w_InstImm);
           end
           `Alu_NEQ: begin
              $sformat(d_Input,"EN (NEQ %2X)",w_InstImm);
           end
           `Alu_LTS: begin
              $sformat(d_Input,"EN (LTS %2X)",w_InstImm);
           end
           `Alu_LTE: begin
              $sformat(d_Input,"EN (LTE %2X)",w_InstImm);
           end
           `Alu_GTS: begin
              $sformat(d_Input,"EN (GTS %2X)",w_InstImm);
           end
           `Alu_GTE: begin
              $sformat(d_Input,"EN (GTE %2X)",w_InstImm);
           end
           default: begin
              $sformat(d_Input,"EN (? %2X)",w_InstImm);
           end
         endcase // case (w_InstCode)
      end // if (inst_en)
      else begin
         $sformat(d_Input,"NN");
      end // else: !if(inst_en)
   end // always @ *
   always @ * begin
      case (s_State)
        `Alu_State_Reset: begin
           $sformat(d_State,"X");
        end
        `Alu_State_Ready: begin
           $sformat(d_State,"R %2X",s_Accum);
        end
        `Alu_State_Error: begin
           $sformat(d_State,"E");
        end
        default: begin
           $sformat(d_State,"?");
        end
      endcase // case (s_State)
   end // always @ *
`endif //  `ifdef SIM
endmodule