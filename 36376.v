module PS2_FIFO(
    input              clk,
    input              reset,
    input        [7:0] writedata,    // data to send
    input              write,        // signal to send it
    output  reg  [7:0] readdata,     // data read
    input              read,         // request to read from FIFO
    output             irq,          // signal data has arrived
    output             command_was_sent,
    output             error_sending_command,
    output             buffer_overrun_error,
    inout              PS2_CLK,      // PS2 Mouse Clock Line
    inout              PS2_DAT       // PS2 Mouse Data Line
);
// Internal wires and registers Declarations
wire     [7:0]    data_from_the_PS2_port;
wire              data_from_the_PS2_port_en;
wire              data_fifo_is_empty;
wire              data_fifo_is_full;
wire              write_to_buffer       =  data_from_the_PS2_port_en & ~data_fifo_is_full;
assign            irq                   = ~data_fifo_is_empty;
assign            buffer_overrun_error  =  data_fifo_is_full;
// Internal Modules
PS2_Mouse PS2_Serial_Port(
    .clk                            (clk),
    .reset                          (reset),
    .the_command                    (writedata),
    .send_command                   (write),
    .received_data                  (data_from_the_PS2_port),
    .received_data_en               (data_from_the_PS2_port_en),
    .command_was_sent               (command_was_sent),
    .error_communication_timed_out  (error_sending_command),
    .PS2_CLK                        (PS2_CLK),
    .PS2_DAT                        (PS2_DAT)
);
// FIFO Data queue
scfifo Incoming_Data_FIFO (
    .clock           (clk),
    .sclr            (reset),
    .rdreq           (read & ~data_fifo_is_empty),
    .wrreq           (write_to_buffer),
    .data            (data_from_the_PS2_port),
    .q               (readdata),
    .empty           (data_fifo_is_empty),
    .full            (data_fifo_is_full)
                         // synopsys translate_off
    ,                    // un-used lines
    .usedw          (),
    .almost_empty   (),
    .almost_full    (),
    .aclr           ()   // synopsys translate_on
);
defparam
    Incoming_Data_FIFO.add_ram_output_register   = "ON",
    Incoming_Data_FIFO.intended_device_family    = "Cyclone II",
    Incoming_Data_FIFO.lpm_numwords              = 256,
    Incoming_Data_FIFO.lpm_showahead             = "ON",
    Incoming_Data_FIFO.lpm_type                  = "scfifo",
    Incoming_Data_FIFO.lpm_width                 = 8,
    Incoming_Data_FIFO.lpm_widthu                = 8,
    Incoming_Data_FIFO.overflow_checking         = "OFF",
    Incoming_Data_FIFO.underflow_checking        = "OFF",
    Incoming_Data_FIFO.use_eab                   = "ON";
endmodule