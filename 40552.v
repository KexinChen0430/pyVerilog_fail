module pc_unit(
clk,
en,
rst,
pc_in,
pc_op,
pc_out
);
input clk;
input en;
input rst;
`ifdef FORMAL
input [15:0] pc_in;
input [1:0] pc_op;
`else
input [15:0] pc_in;
input [1:0] pc_op;
`endif
output [15:0] pc_out;
wire clk;
wire en;
wire [15:0] pc_in;
wire [1:0] pc_op;
wire [15:0] pc_out;
reg [15:0] pc = 16'h 0000;
  assign pc_out = pc;
  always @(posedge clk) begin
    if(rst == 1)
        pc <= 0;
    else if(en == 1'b 1) begin
      case(pc_op)
      `PC_NOP : begin
        pc <= pc;
      end
      `PC_INC : begin
        pc <= (((pc)) + 2);
      end
      `PC_SET : begin
        pc <= pc_in;
      end
      `PC_RESET : begin
        pc <= 16'h 0000;
      end
      default : begin
      end
      endcase
    end
  end
  //Formally verified
`ifdef FORMAL
    initial begin
        assume(pc_op == `PC_RESET);
        assume(pc_in == 0);
        assume(pc == 0);
        assume(clk == 0);
    end
    always @(posedge clk) begin
        if($initstate == 1) begin
            assume($past(pc_op) == `PC_NOP);
            assume($past(pc) == 0);
        end
        else begin
            assume(en == 1 && rst == 0);
            if($past(pc_op) == `PC_RESET) begin
                cover;
                assert(pc == 0);
            end
            if($past(pc_op) == `PC_NOP) begin
                cover;
                assert($past(pc) == pc);
            end
            if($past(pc_op) == `PC_SET) begin
                cover;
                assert(pc == $past(pc_in));
            end
            if($past(pc_op) == `PC_INC) begin
                cover;
                assert(pc == ($past(pc) + 16'h2));
            end
        end
    end
`endif
endmodule