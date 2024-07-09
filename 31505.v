module Register(reset, clk, en, be, d, q, value_in);
  parameter WIDTH=16;         // Number of bits in the register.
  parameter BUS_WIDTH=16;     // Width of data bus used to access register.
  parameter TYPE=`REG_RW;     // Register type: read/write, read-only, etc.
  input clk;        // System clock
  input reset;      // System reset
  input en;         // Access enable
  input [1:0] be;   // Byte enable
  input [BUS_WIDTH-1:0] d;      // Input and output ports.
  output [BUS_WIDTH-1:0] q;
  input [BUS_WIDTH-1:0] value_in;   // Read value for read-only registers.
  wire byte_lo_en = be[0];
  wire byte_hi_en = be[1];
  genvar i;
  generate
    if (TYPE == `REG_RW) begin
      for (i = 0; i < BUS_WIDTH; i = i + 1) begin: REG
        if (i < WIDTH) begin
          CC_DFlipFlop #(1) dff(.clk(clk),
                                .reset(reset),
                                .en(en & ((i < 8) ? byte_lo_en : byte_hi_en)),
                                .d(d[i]),
                                .q(q[i]));
        end else begin
          // Unused bits default to zero.
          assign q[i] = 1'b0;
        end
      end
    end else begin // if (TYPE == `REG_RO)
      // Read only register uses the |value_in| port.
      assign q = value_in;
    end
  endgenerate
endmodule