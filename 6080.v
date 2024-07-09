module riscv_core_tb ();
reg                   clk;
reg                   rstn;
//Instruction memory
wire [`REG_W-1:0]      imem_addr;
reg  [`INSTR_W-1:0]    imem_rdata;
//Data memory
wire [`REG_W-1:0]      dmem_addr;
wire                  dmem_cs;
wire                  dmem_rnw;
wire [(`DATA_W/8)-1:0] dmem_wmask;
wire [`DATA_W-1:0]     dmem_wdata;
reg  [`DATA_W-1:0]     dmem_rdata;
//Misc
wire                  stalled;
riscv_core dut (
        .clk             (clk),
        .rstn            (rstn),
        .imem_addr       (imem_addr),
        .imem_rdata      (imem_rdata),
        .dmem_addr       (dmem_addr),
        .dmem_cs         (dmem_cs),
        .dmem_rnw        (dmem_rnw),
        .dmem_wmask      (dmem_wmask),
        .dmem_wdata      (dmem_wdata),
        .dmem_rdata      (dmem_rdata),
        .stalled         (stalled)
);
initial begin
    clk = 1;
    rstn = 1;
    #5 clk = 0;
    rstn = 0;
    #5 clk = 1;
    rstn = 1;
    forever begin
        #5 clk = ~clk;
    end
end
initial
    $monitor("imem_addr : %x", imem_addr);
initial begin
    $dumpfile("test.vcd");
    $dumpvars(0,dut);
end
//reg [31:0] rand;
integer rand;
initial begin
    repeat (20) begin
        @ (posedge clk);
        dut.take_branch = 0;
        rand = $random;
        if (rand[1:0] == 2'b11) begin
            dut.take_branch = 1;
            dut.target = rand;
            $display("Branching to %x", dut.target);
        end
    end
    $finish();
end
endmodule