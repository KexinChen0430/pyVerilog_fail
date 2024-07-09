module switch (
    // Global inputs                   // -------------------------------------
    input  wire         fast_clk,      // 1GHz Write Clock
    input  wire         slow_clk,      // 111MHz Read Clock
    input  wire         reset_b,       // Active Low, Asynchronous Reset
    // Memory inputs                   // -------------------------------------
    input  wire         mem_en,        // Memory enable
    input  wire         mem_rd_wr,     // Memory read/write
    input  wire [01:00] mem_addr,      // Memory address
    input  wire [07:00] mem_wdata,     // Data to be written to the memory interface
    output wire [07:00] mem_rdata,     // Data read from the memory interface
    // Input port                      // -------------------------------------
    output wire         data_stall,    //
    input  wire         data_valid,    // Data valid input
    input  wire [07:00] data,          // Data input
    // Output ports                    // -------------------------------------
    output wire         ready_0,       // Port 0 has data
    input  wire         read_0,        // Data valid input
    output wire [07:00] port0,         // Data input
    output wire         ready_1,       // Output has data
    input  wire         read_1,        // Data valid input
    output wire [7:0]   port1,         // Data input
    output wire         ready_2,       // Output has data
    input  wire         read_2,        // Data valid input
    output wire [7:0]   port2,         // Data input
    output wire         ready_3,       // Output has data
    input  wire         read_3,        // Data valid input
    output wire [7:0]   port3);        // Data input
    // Internal signals
    wire [07:00] address_port [03:00]; // Address for each port
    wire [03:00] router_ready;         // Router has data
    wire [07:00] router_port [03:00];  // Router data
    wire [03:00] fifo_empty;
    wire [03:00] fifo_full;            // FIFO has data
    wire [03:00] fifo_read;            //
    wire [08:00] fifo_port [03:00];    // FIFO data
    /*************************************************************************
    assign data_stall = |fifo_full;
    /*************************************************************************
    port_address_reg // Instantiate Port address registers
        i_port_address_reg
        (// Global Signals                   // -------------------------------
        .clk             (fast_clk),         //
        .reset_b         (reset_b),          //
        // Memory Configuration Interface    // -------------------------------
        .mem_en          (mem_en),           //
        .mem_rd_wr       (mem_rd_wr),        //
        .mem_addr        (mem_addr),         //
        .mem_rdata       (mem_rdata),        //
        .mem_wdata       (mem_wdata),        //
        // Output Mux'ing Interface          // -------------------------------
        .address_port_0  (address_port[0]),  //
        .address_port_1  (address_port[1]),  //
        .address_port_2  (address_port[2]),  //
        .address_port_3  (address_port[3])); //
    // Instantiate Port address registers
    packet_router
        i_packet_router (
        // Global Signals                    // -------------------------------
        .clk             (fast_clk),         // I
        .reset_b         (reset_b),          // I
        .address_port_0  (address_port[0]),  // O [07:00]
        .address_port_1  (address_port[1]),  // O [07:00]
        .address_port_2  (address_port[2]),  // O [07:00]
        .address_port_3  (address_port[3]),  //
        .data_stall      (data_stall),       // I
        .data_valid      (data_valid),       //
        .data            (data),             //
        .ready_0         (router_ready[0]),  //
        .port0           (router_port[0]),   //
        .ready_1         (router_ready[1]),  //
        .port1           (router_port[1]),   //
        .ready_2         (router_ready[2]),  //
        .port2           (router_port[2]),   //
        .ready_3         (router_ready[3]),  //
        .port3           (router_port[3]));  //
    genvar i;
    generate
        for(i=0; i < 4; i = i + 1) begin: Asynchronous_FIFOs
                async_fifo #(9,1024,10) // Instantiate Packet FIFO's (1024 deep by 8 bits)
                i_fifo (
                // Global Signals                  // ---------------------------------
                .reset_b         (reset_b),        // I         Active-Low Asynchronous
                // Read Interface                  // ---------------------------------
                .rclk            (slow_clk),       // I         111MHz Read Clock
                .read            (fifo_read[i]),   // I         Advance read pointer
                .empty           (fifo_empty[i]),  // O         FIFO is Empty
                .rdata           (fifo_port[i]),   // O [08:00] Data being read
                // Write Interface                 // ---------------------------------
                .wclk            (fast_clk),       // I         1GHz Write Clock
                .write           (router_ready[i]),// I         Push Data Signal
                .wdata           ({~data_valid, router_port[i][7:0]}), // I [08:00] Data to be written
                .full            (fifo_full[i]));  // O         FIFO is Full
            end
    endgenerate
    // Instantiate Output SM's
    output_sm
        i_output_sm_0 (
        // Global Signals                  // ---------------------------------
        .clk             (slow_clk),       // I         111MHz Read Clock
        .reset_b         (reset_b),        // I         Active-Low Asynchronous
        // FIFO Interface                  // ---------------------------------
        .fifo_empty      (fifo_empty[0]),  //
        .fifo_read       (fifo_read[0]),   //
        .fifo_data       (fifo_port[0]),   //
        .ready           (ready_0),        //
        .read            (read_0),         //
        .port            (port0));         //
    output_sm
        i_output_sm_1 (
        // Global Signals                   // ----------------------------
        .clk             (slow_clk),        // I         111MHz Read Clock
        .reset_b         (reset_b),         // I         Active-Low Asynchronous
        // FIFO Interface                   // ----------------------------
        .fifo_empty      (fifo_empty[1]),
        .fifo_read       (fifo_read[1]),
        .fifo_data       (fifo_port[1]),    // I [08:00]
        // Output Interface
        .ready           (ready_1),
        .read            (read_1),
        .port            (port1));
    output_sm
        i_output_sm_2
        (// Global Signals                  // ----------------------------
        .clk             (slow_clk),        // I         111MHz Read Clock
        .reset_b         (reset_b),         // I         Active-Low Asynchronous
        // FIFO Interface                   // ----------------------------
        .fifo_empty      (fifo_empty[2]),   //
        .fifo_read       (fifo_read[2]),    //
        .fifo_data       (fifo_port[2]),    //
        // Output Interface                 // -----------------------------
        .ready           (ready_2),         //
        .read            (read_2),          //
        .port            (port2));          //
    output_sm
        i_output_sm_3
        (// Global Signals                  // ----------------------------
        .clk             (slow_clk),       // I         111MHz Read Clock
        .reset_b         (reset_b),        // I         Active-Low Asynchronous
        // FIFO Interface                  // ----------------------------
        .fifo_empty      (fifo_empty[3]),
        .fifo_read       (fifo_read[3]),
        .fifo_data       (fifo_port[3]),
        // Output Interface                // -----------------------------
        .ready           (ready_3),
        .read            (read_3),
        .port            (port3));
endmodule