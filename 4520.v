module axis_stat_counter #
(
    parameter DATA_WIDTH = 64,
    parameter KEEP_WIDTH = (DATA_WIDTH/8),
    parameter TAG_ENABLE = 1,
    parameter TAG_WIDTH = 16,
    parameter TICK_COUNT_ENABLE = 1,
    parameter TICK_COUNT_WIDTH = 32,
    parameter BYTE_COUNT_ENABLE = 1,
    parameter BYTE_COUNT_WIDTH = 32,
    parameter FRAME_COUNT_ENABLE = 1,
    parameter FRAME_COUNT_WIDTH = 32
)
(
    input  wire                   clk,
    input  wire                   rst,
    /*
     */
    input  wire [KEEP_WIDTH-1:0]  monitor_axis_tkeep,
    input  wire                   monitor_axis_tvalid,
    input  wire                   monitor_axis_tready,
    input  wire                   monitor_axis_tlast,
    /*
     */
    output wire [7:0]  output_axis_tdata,
    output wire        output_axis_tvalid,
    input  wire        output_axis_tready,
    output wire        output_axis_tlast,
    output wire        output_axis_tuser,
    /*
     */
    input  wire [TAG_WIDTH-1:0] tag,
    input  wire        trigger,
    /*
     */
    output wire        busy
);
localparam TAG_BYTE_WIDTH = (TAG_WIDTH + 7) / 8;
localparam TICK_COUNT_BYTE_WIDTH = (TICK_COUNT_WIDTH + 7) / 8;
localparam BYTE_COUNT_BYTE_WIDTH = (BYTE_COUNT_WIDTH + 7) / 8;
localparam FRAME_COUNT_BYTE_WIDTH = (FRAME_COUNT_WIDTH + 7) / 8;
localparam TOTAL_LENGTH = TAG_BYTE_WIDTH + TICK_COUNT_BYTE_WIDTH + BYTE_COUNT_BYTE_WIDTH + FRAME_COUNT_BYTE_WIDTH;
// state register
localparam [1:0]
    STATE_IDLE = 2'd0,
    STATE_OUTPUT_DATA = 2'd1;
reg [1:0] state_reg = STATE_IDLE, state_next;
reg [TICK_COUNT_WIDTH-1:0] tick_count_reg = 0, tick_count_next;
reg [BYTE_COUNT_WIDTH-1:0] byte_count_reg = 0, byte_count_next;
reg [FRAME_COUNT_WIDTH-1:0] frame_count_reg = 0, frame_count_next;
reg frame_reg = 0, frame_next;
reg store_output;
reg [$clog2(TOTAL_LENGTH)-1:0] frame_ptr_reg = 0, frame_ptr_next;
reg [TICK_COUNT_WIDTH-1:0] tick_count_output_reg = 0;
reg [BYTE_COUNT_WIDTH-1:0] byte_count_output_reg = 0;
reg [FRAME_COUNT_WIDTH-1:0] frame_count_output_reg = 0;
reg busy_reg = 0;
// internal datapath
reg [7:0]  output_axis_tdata_int;
reg        output_axis_tvalid_int;
reg        output_axis_tready_int = 0;
reg        output_axis_tlast_int;
reg        output_axis_tuser_int;
wire       output_axis_tready_int_early;
assign busy = busy_reg;
integer offset, i, bit_cnt;
always @* begin
    state_next = 2'bz;
    tick_count_next = tick_count_reg;
    byte_count_next = byte_count_reg;
    frame_count_next = frame_count_reg;
    frame_next = frame_reg;
    output_axis_tdata_int = 0;
    output_axis_tvalid_int = 0;
    output_axis_tlast_int = 0;
    output_axis_tuser_int = 0;
    store_output = 0;
    frame_ptr_next = frame_ptr_reg;
    // data readout
    case (state_reg)
        STATE_IDLE: begin
            if (trigger) begin
                store_output = 1;
                tick_count_next = 0;
                byte_count_next = 0;
                frame_count_next = 0;
                frame_ptr_next = 0;
                if (output_axis_tready_int) begin
                    frame_ptr_next = 1;
                    if (TAG_ENABLE) begin
                        output_axis_tdata_int = tag[(TAG_BYTE_WIDTH-1)*8 +: 8];
                    end else if (TICK_COUNT_ENABLE) begin
                        output_axis_tdata_int = tick_count_reg[(TICK_COUNT_BYTE_WIDTH-1)*8 +: 8];
                    end else if (BYTE_COUNT_ENABLE) begin
                        output_axis_tdata_int = byte_count_reg[(BYTE_COUNT_BYTE_WIDTH-1)*8 +: 8];
                    end else if (FRAME_COUNT_ENABLE) begin
                        output_axis_tdata_int = frame_count_reg[(FRAME_COUNT_BYTE_WIDTH-1)*8 +: 8];
                    end
                    output_axis_tvalid_int = 1;
                end
                state_next = STATE_OUTPUT_DATA;
            end else begin
                state_next = STATE_IDLE;
            end
        end
        STATE_OUTPUT_DATA: begin
            if (output_axis_tready_int) begin
                state_next = STATE_OUTPUT_DATA;
                frame_ptr_next = frame_ptr_reg + 1;
                output_axis_tvalid_int = 1;
                offset = 0;
                if (TAG_ENABLE) begin
                    for (i = TAG_BYTE_WIDTH-1; i >= 0; i = i - 1) begin
                        if (frame_ptr_reg == offset) begin
                            output_axis_tdata_int = tag[i*8 +: 8];
                        end
                        offset = offset + 1;
                    end
                end
                if (TICK_COUNT_ENABLE) begin
                    for (i = TICK_COUNT_BYTE_WIDTH-1; i >= 0; i = i - 1) begin
                        if (frame_ptr_reg == offset) begin
                            output_axis_tdata_int = tick_count_output_reg[i*8 +: 8];
                        end
                        offset = offset + 1;
                    end
                end
                if (BYTE_COUNT_ENABLE) begin
                    for (i = BYTE_COUNT_BYTE_WIDTH-1; i >= 0; i = i - 1) begin
                        if (frame_ptr_reg == offset) begin
                            output_axis_tdata_int = byte_count_output_reg[i*8 +: 8];
                        end
                        offset = offset + 1;
                    end
                end
                if (FRAME_COUNT_ENABLE) begin
                    for (i = FRAME_COUNT_BYTE_WIDTH-1; i >= 0; i = i - 1) begin
                        if (frame_ptr_reg == offset) begin
                            output_axis_tdata_int = frame_count_output_reg[i*8 +: 8];
                        end
                        offset = offset + 1;
                    end
                end
                if (frame_ptr_reg == offset-1) begin
                    output_axis_tlast_int = 1;
                    state_next = STATE_IDLE;
                end
            end else begin
                state_next = STATE_OUTPUT_DATA;
            end
        end
    endcase
    // stats collection
    // increment tick count by number of words that can be transferred per cycle
    tick_count_next = tick_count_next + KEEP_WIDTH;
    if (monitor_axis_tready & monitor_axis_tvalid) begin
        // valid transfer cycle
        // increment byte count by number of words transferred
        bit_cnt = 0;
        for (i = 0; i <= KEEP_WIDTH; i = i + 1) begin
            //bit_cnt = bit_cnt + monitor_axis_tkeep[i];
            if (monitor_axis_tkeep == ({KEEP_WIDTH{1'b1}}) >> (KEEP_WIDTH-i)) bit_cnt = i;
        end
        byte_count_next = byte_count_next + bit_cnt;
        // count frames
        if (monitor_axis_tlast) begin
            // end of frame
            frame_next = 0;
        end else if (~frame_reg) begin
            // first word after end of frame
            frame_count_next = frame_count_next + 1;
            frame_next = 1;
        end
    end
end
always @(posedge clk or posedge rst) begin
    if (rst) begin
        state_reg <= STATE_IDLE;
        tick_count_reg <= 0;
        byte_count_reg <= 0;
        frame_count_reg <= 0;
        frame_reg <= 0;
        frame_ptr_reg <= 0;
        busy_reg <= 0;
        tick_count_output_reg <= 0;
        byte_count_output_reg <= 0;
        frame_count_output_reg <= 0;
    end else begin
        state_reg <= state_next;
        tick_count_reg <= tick_count_next;
        byte_count_reg <= byte_count_next;
        frame_count_reg <= frame_count_next;
        frame_reg <= frame_next;
        frame_ptr_reg <= frame_ptr_next;
        busy_reg <= state_next != STATE_IDLE;
        if (store_output) begin
            tick_count_output_reg <= tick_count_reg;
            byte_count_output_reg <= byte_count_reg;
            frame_count_output_reg <= frame_count_reg;
        end
    end
end
// output datapath logic
reg [7:0]  output_axis_tdata_reg = 0;
reg        output_axis_tvalid_reg = 0;
reg        output_axis_tlast_reg = 0;
reg        output_axis_tuser_reg = 0;
reg [7:0]  temp_axis_tdata_reg = 0;
reg        temp_axis_tvalid_reg = 0;
reg        temp_axis_tlast_reg = 0;
reg        temp_axis_tuser_reg = 0;
assign output_axis_tdata = output_axis_tdata_reg;
assign output_axis_tvalid = output_axis_tvalid_reg;
assign output_axis_tlast = output_axis_tlast_reg;
assign output_axis_tuser = output_axis_tuser_reg;
// enable ready input next cycle if output is ready or if there is space in both output registers or if there is space in the temp register that will not be filled next cycle
assign output_axis_tready_int_early = output_axis_tready | (~temp_axis_tvalid_reg & ~output_axis_tvalid_reg) | (~temp_axis_tvalid_reg & ~output_axis_tvalid_int);
always @(posedge clk or posedge rst) begin
    if (rst) begin
        output_axis_tdata_reg <= 0;
        output_axis_tvalid_reg <= 0;
        output_axis_tlast_reg <= 0;
        output_axis_tuser_reg <= 0;
        output_axis_tready_int <= 0;
        temp_axis_tdata_reg <= 0;
        temp_axis_tvalid_reg <= 0;
        temp_axis_tlast_reg <= 0;
        temp_axis_tuser_reg <= 0;
    end else begin
        // transfer sink ready state to source
        output_axis_tready_int <= output_axis_tready_int_early;
        if (output_axis_tready_int) begin
            // input is ready
            if (output_axis_tready | ~output_axis_tvalid_reg) begin
                // output is ready or currently not valid, transfer data to output
                output_axis_tdata_reg <= output_axis_tdata_int;
                output_axis_tvalid_reg <= output_axis_tvalid_int;
                output_axis_tlast_reg <= output_axis_tlast_int;
                output_axis_tuser_reg <= output_axis_tuser_int;
            end else begin
                // output is not ready, store input in temp
                temp_axis_tdata_reg <= output_axis_tdata_int;
                temp_axis_tvalid_reg <= output_axis_tvalid_int;
                temp_axis_tlast_reg <= output_axis_tlast_int;
                temp_axis_tuser_reg <= output_axis_tuser_int;
            end
        end else if (output_axis_tready) begin
            // input is not ready, but output is ready
            output_axis_tdata_reg <= temp_axis_tdata_reg;
            output_axis_tvalid_reg <= temp_axis_tvalid_reg;
            output_axis_tlast_reg <= temp_axis_tlast_reg;
            output_axis_tuser_reg <= temp_axis_tuser_reg;
            temp_axis_tdata_reg <= 0;
            temp_axis_tvalid_reg <= 0;
            temp_axis_tlast_reg <= 0;
            temp_axis_tuser_reg <= 0;
        end
    end
end
endmodule