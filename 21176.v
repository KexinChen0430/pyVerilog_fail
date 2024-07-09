module Test
  (
   output logic       din_ready,
   input logic        din_valid,
   input logic [4:0]  din_data,
   input logic        dout0_ready,
   output logic       dout0_valid,
   output logic [0:0] dout0_data,
   input logic        dout1_ready,
   output logic       dout1_valid,
   output logic [1:0] dout1_data,
   input logic        dout2_ready,
   output logic       dout2_valid,
   output logic [2:0] dout2_data
   );
   // Interface declarations
   dti #(.W_DATA(5)) din();
   dti #(.W_DATA(1)) dout0();
   dti #(.W_DATA(2)) dout1();
   dti #(.W_DATA(3)) dout2();
   // Interface wiring to top level ports
   assign din.valid = din_valid;
   assign din.data = din_data;
   assign din_ready = din.ready;
   assign dout0_valid = dout0.valid;
   assign dout0_data = dout0.data;
   assign dout0.ready = dout0_ready;
   assign dout1_valid = dout1.valid;
   assign dout1_data = dout1.data;
   assign dout1.ready = dout1_ready;
   assign dout2_valid = dout2.valid;
   assign dout2_data = dout2.data;
   assign dout2.ready = dout2_ready;
   assign din.ready = 0;
   assign dout0.data = 0;
   assign dout1.data = 0;
   assign dout2.data = 0;
   typedef struct      packed {
      logic [1:0]      ctrl;
      logic [2:0]      data;
   } din_t;
   din_t din_s;
   assign din_s = din.data;
   always_comb begin
      dout0.valid = 0;
      dout1.valid = 0;
      dout2.valid = 0;
      case (din_s.ctrl)
        0 : dout0.valid = din.valid;
        1 : dout1.valid = din.valid;
        2 : dout2.valid = din.valid;
        default: ;
      endcase
   end
endmodule