module sram(
    //Address
    input wire[21:0] addr_i,
    //Enable
    input wire en_i,
    //Write
    input wire we_i,
    //Output
    input wire oe_i,
    //Data
    inout wire[31:0] data_io
    );
    wire[21:0] addr = addr_i[21:0];
    wire outputEnable;
    wire sramEnable;
    reg[31:0] ram[0:4195000];
    reg[31:0] data_o;
    assign data_io = data_o;
    assign outputEnable = ~oe_i;
    assign sramEnable = ~en_i;
    //Read
    always @(*) begin
        if (sramEnable == `Disable || outputEnable == `Disable) begin
            data_o = 32'bz;
        end else begin
            data_o = ram[addr];
        end
    end
    //Write
    always @(posedge we_i) begin
        if (sramEnable == `Enable) begin
            ram[addr] <= data_io;
        end
    end
    //Simulation
    initial begin
        $readmemh("C:/Users/NIL/Desktop/thinpad_top (1)/thinpad_top/thinpad_top.srcs/sources_1/new/kerneldata", ram);
    end
endmodule