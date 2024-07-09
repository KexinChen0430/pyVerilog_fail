module async_fifo (reset_b, rclk, wclk, write, read, wdata, rdata, empty, full);
    parameter WIDTH =  8;
    parameter DEPTH = 32;
    parameter ADDR  =  5;
    input  wire 			reset_b;
    input  wire 			rclk;
    input  wire 			wclk;
    input  wire 			write;
    input  wire             read;
    input  wire [WIDTH-1:0] wdata;
    output wire [WIDTH-1:0] rdata;
    output wire             empty;
    output wire             full;
    wire             write_wclk;
    wire             read_rclk;
    wire [WIDTH-1:0] wdata_wclk;
    wire [WIDTH-1:0] rdata_wclk;
    wire [ADDR   :0] raddr_wclk;
    wire [ADDR   :0] waddr_wclk;
    wire [ADDR   :0] raddr_rclk;
    wire [ADDR   :0] waddr_rclk;
    /*************************************************************************
    assign wdata_wclk = wdata;
    assign write_wclk = write;
    assign read_rclk  = read;
    assign rdata      = rdata_wclk;
    /*************************************************************************
    memory #(WIDTH, DEPTH, ADDR)
        i_memory
        (// Globals Signals
        .clk     (wclk),
        .reset_b (reset_b),
        .write   (write_wclk),
        .waddr   (waddr_wclk[ADDR-1:0]),
        .raddr   (raddr_wclk[ADDR-1:0]),
        .wdata   (wdata_wclk),
        .rdata   (rdata_wclk));
    genvar i;
    generate
        for(i=0; i <= ADDR; i = i + 1) begin: Write_Address
                sync
                i_write_ClockSync
                (// Global Signals
                .OutputClock(rclk),          // I
                .reset_b    (reset_b),       // I
                .InputData  (waddr_wclk[i]), // I
                .OutputData (waddr_rclk[i]));// O
            end
    endgenerate
    genvar j;
    generate
        for(j = 0; j <= ADDR; j = j + 1) begin: Read_Address
                sync
                i_read_ClockSync
                (// Glbal Signals
                .OutputClock(wclk),          // I
                .reset_b    (reset_b),        // I
                .InputData  (raddr_rclk[j]), // I
                .OutputData (raddr_wclk[j]));// O
        end
    endgenerate
    POINTER #(ADDR)
        read_pointer_rclk
        (// Globals Signals
        .clk             (rclk),
        .reset_b         (reset_b),
        .incr    (read_rclk),
        .ptr     (raddr_rclk));
    POINTER #(ADDR)
        write_pointer_wclk
        (.clk     (wclk),
        .reset_b (reset_b),
        .incr    (write_wclk),
        .ptr     (waddr_wclk));
    COMPARE #(ADDR)
        comparator_rclk (
        .wptr    (waddr_rclk),
        .rptr    (raddr_rclk),
        .empty   (empty),
        .full    ());
    COMPARE #(ADDR)
        comparator_wclk
        (.wptr    (waddr_wclk),
        .rptr    (raddr_wclk),
        .empty   (),
        .full    (full));
endmodule