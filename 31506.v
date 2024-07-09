module Registers(clk, reset, en, rd, wr, be, addr, data_in, data_out,
                 values_in, values_out);
  parameter ADDR_WIDTH=16;
  parameter DATA_WIDTH=16;
  parameter NUM_REGS=(1 << ADDR_WIDTH);
  parameter IS_GENERIC=1;
  input clk;        // System clock
  input reset;      // System reset
  input en;         // Access enable
  input rd;         // Read enable
  input wr;         // Write enable
  input [1:0] be;   // Byte enable
  input [ADDR_WIDTH-1:0] addr;      // Address bus
  input [DATA_WIDTH-1:0] data_in;   // Data in bus
  output reg [DATA_WIDTH-1:0] data_out; // Data out bus
  // Port for obtaining read-only register values.
  input [DATA_WIDTH * NUM_REGS - 1 : 0] values_in;
  // Port for exposing all read/write register values.
  output [DATA_WIDTH * NUM_REGS - 1 : 0] values_out;
  // This function returns the register type, given a register address.
  function integer register_type;
    input [31:0] address;
    begin
      case (address)
        `ID:            register_type = `REG_RO;
        `OUTPUT_STATUS: register_type = `REG_RO;
        `SCAN_X:        register_type = `REG_RO;
        `SCAN_Y:        register_type = `REG_RO;
        `SYS_CTRL:      register_type = `REG_RW;
        `MEM_BANK:      register_type = `REG_RW;
        `OUTPUT_CTRL:   register_type = `REG_RW;
        `MODE_CTRL:     register_type = `REG_RW;
        `SPRITE_Z:      register_type = `REG_RW;
        `SCROLL_X:      register_type = `REG_RW;
        `SCROLL_Y:      register_type = `REG_RW;
        default:        register_type = `REG_RO;
      endcase
    end
  endfunction
  function integer tile_reg_type;
    input [31:0] address;
    begin
      case (address)
        `TILE_CTRL0:          tile_reg_type = `REG_RW;
        `TILE_DATA_OFFSET:    tile_reg_type = `REG_RW;
        `TILE_NOP_VALUE:      tile_reg_type = `REG_RW;
        `TILE_COLOR_KEY:      tile_reg_type = `REG_RW;
        `TILE_OFFSET_X:       tile_reg_type = `REG_RW;
        `TILE_OFFSET_Y:       tile_reg_type = `REG_RW;
        default:              tile_reg_type = `REG_RO;
      endcase
    end
  endfunction
  // Generate the registers.
  wire [DATA_WIDTH-1:0] q_array [NUM_REGS - 1:0];
  genvar i;
  generate
    for (i = 0; i < NUM_REGS; i = i + 1) begin: REGS
      Register #(.WIDTH(DATA_WIDTH),
                 .TYPE(IS_GENERIC ? register_type(i) : tile_reg_type(i)))
          register(.clk(~wr),
                   .en(en & ~rd & (i == addr)),
                   .reset(reset),
                   .be(be),
                   .d(data_in),
                   .q(q_array[i]),
                   .value_in(values_in[DATA_WIDTH * (i + 1) - 1 :
                                       DATA_WIDTH * i]));
      assign values_out[DATA_WIDTH * (i + 1) - 1 : DATA_WIDTH * i] = q_array[i];
    end
  endgenerate
  // Memory bus data read.
  always @ (posedge clk)
    if (en & rd)
      data_out <= q_array[addr];
endmodule