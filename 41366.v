module encounters
a start data block command while looking for an address, then it will store a new data
offset and then look for a start address block command.  Terminate the list with a 0
entry.  Normal address commands will operate normally inside a data block.
Commands:
00 0000000 : stop
00 0000001 : exit multiple device mode
00 0000011 : start write to current address
00 0001000 : start address block
00 0001001 : start data block
00 001dddd : delay 2**(16+d) cycles
00 1000001 : send I2C stop
01 aaaaaaa : start write to address
1 dddddddd : write 8-bit data
Examples
write 0x11223344 to register 0x0004 on device at 0x50
01 1010000  start write to 0x50
1 00000000  write address 0x0004
1 00000100
1 00010001  write data 0x11223344
1 00100010
1 00110011
1 01000100
0 00000000  stop
write 0x11223344 to register 0x0004 on devices at 0x50, 0x51, 0x52, and 0x53
00 0001001  start data block
00 0000011  start write to current address
1 00000000  write address 0x0004
1 00000100
1 00010001  write data 0x11223344
1 00100010
1 00110011
1 01000100
00 0001000  start address block
01 1010000  address 0x50
01 1010001  address 0x51
01 1010010  address 0x52
01 1010011  address 0x53
00 0000000  stop
*/
// init_data ROM
localparam INIT_DATA_LEN = 22;
reg [8:0] init_data [INIT_DATA_LEN-1:0];
initial begin
    // single address
    init_data[0]  = {2'b01, 7'h50}; // start write to address 0x50
    init_data[1]  = {1'b1, 8'h00}; // write address 0x0004
    init_data[2]  = {1'b1, 8'h04};
    init_data[3]  = {1'b1, 8'h11}; // write data 0x11223344
    init_data[4]  = {1'b1, 8'h22};
    init_data[5]  = {1'b1, 8'h33};
    init_data[6]  = {1'b1, 8'h44};
    // multiple addresses
    init_data[7]  = {2'b00, 7'b0001001}; // start data block
    init_data[8]  = {2'b00, 7'b0000011}; // start write to current address
    init_data[9]  = {1'b1, 8'h00}; // write address 0x0004
    init_data[10] = {1'b1, 8'h04};
    init_data[11] = {1'b1, 8'h11}; // write data 0x11223344
    init_data[12] = {1'b1, 8'h22};
    init_data[13] = {1'b1, 8'h33};
    init_data[14] = {1'b1, 8'h44};
    init_data[15] = {2'b00, 7'b0001000}; // start address block
    init_data[16] = {2'b01, 7'h50}; // start write to address 0x50
    init_data[17] = {2'b01, 7'h51}; // start write to address 0x51
    init_data[18] = {2'b01, 7'h52}; // start write to address 0x52
    init_data[19] = {2'b01, 7'h53}; // start write to address 0x53
    init_data[20] = 9'd1; // exit mode
    init_data[21] = 9'd0; // stop
end
localparam [3:0]
    STATE_IDLE = 3'd0,
    STATE_RUN = 3'd1,
    STATE_TABLE_1 = 3'd2,
    STATE_TABLE_2 = 3'd3,
    STATE_TABLE_3 = 3'd4;
reg [4:0] state_reg = STATE_IDLE, state_next;
parameter AW = $clog2(INIT_DATA_LEN);
reg [8:0] init_data_reg = 9'd0;
reg [AW-1:0] address_reg = {AW{1'b0}}, address_next;
reg [AW-1:0] address_ptr_reg = {AW{1'b0}}, address_ptr_next;
reg [AW-1:0] data_ptr_reg = {AW{1'b0}}, data_ptr_next;
reg [6:0] cur_address_reg = 7'd0, cur_address_next;
reg [31:0] delay_counter_reg = 32'd0, delay_counter_next;
reg [6:0] m_axis_cmd_address_reg = 7'd0, m_axis_cmd_address_next;
reg m_axis_cmd_start_reg = 1'b0, m_axis_cmd_start_next;
reg m_axis_cmd_write_reg = 1'b0, m_axis_cmd_write_next;
reg m_axis_cmd_stop_reg = 1'b0, m_axis_cmd_stop_next;
reg m_axis_cmd_valid_reg = 1'b0, m_axis_cmd_valid_next;
reg [7:0] m_axis_data_tdata_reg = 8'd0, m_axis_data_tdata_next;
reg m_axis_data_tvalid_reg = 1'b0, m_axis_data_tvalid_next;
reg start_flag_reg = 1'b0, start_flag_next;
reg busy_reg = 1'b0;
assign m_axis_cmd_address = m_axis_cmd_address_reg;
assign m_axis_cmd_start = m_axis_cmd_start_reg;
assign m_axis_cmd_read = 1'b0;
assign m_axis_cmd_write = m_axis_cmd_write_reg;
assign m_axis_cmd_write_multiple = 1'b0;
assign m_axis_cmd_stop = m_axis_cmd_stop_reg;
assign m_axis_cmd_valid = m_axis_cmd_valid_reg;
assign m_axis_data_tdata = m_axis_data_tdata_reg;
assign m_axis_data_tvalid = m_axis_data_tvalid_reg;
assign m_axis_data_tlast = 1'b1;
assign busy = busy_reg;
always @* begin
    state_next = STATE_IDLE;
    address_next = address_reg;
    address_ptr_next = address_ptr_reg;
    data_ptr_next = data_ptr_reg;
    cur_address_next = cur_address_reg;
    delay_counter_next = delay_counter_reg;
    m_axis_cmd_address_next = m_axis_cmd_address_reg;
    m_axis_cmd_start_next = m_axis_cmd_start_reg & ~(m_axis_cmd_valid & m_axis_cmd_ready);
    m_axis_cmd_write_next = m_axis_cmd_write_reg & ~(m_axis_cmd_valid & m_axis_cmd_ready);
    m_axis_cmd_stop_next = m_axis_cmd_stop_reg & ~(m_axis_cmd_valid & m_axis_cmd_ready);
    m_axis_cmd_valid_next = m_axis_cmd_valid_reg & ~m_axis_cmd_ready;
    m_axis_data_tdata_next = m_axis_data_tdata_reg;
    m_axis_data_tvalid_next = m_axis_data_tvalid_reg & ~m_axis_data_tready;
    start_flag_next = start_flag_reg;
    if (m_axis_cmd_valid | m_axis_data_tvalid) begin
        // wait for output registers to clear
        state_next = state_reg;
    end else if (delay_counter_reg != 0) begin
        // delay
        delay_counter_next = delay_counter_reg - 1;
        state_next = state_reg;
    end else begin
        case (state_reg)
            STATE_IDLE: begin
                // wait for start signal
                if (~start_flag_reg & start) begin
                    address_next = {AW{1'b0}};
                    start_flag_next = 1'b1;
                    state_next = STATE_RUN;
                end else begin
                    state_next = STATE_IDLE;
                end
            end
            STATE_RUN: begin
                // process commands
                if (init_data_reg[8] == 1'b1) begin
                    // write data
                    m_axis_cmd_write_next = 1'b1;
                    m_axis_cmd_stop_next = 1'b0;
                    m_axis_cmd_valid_next = 1'b1;
                    m_axis_data_tdata_next = init_data_reg[7:0];
                    m_axis_data_tvalid_next = 1'b1;
                    address_next = address_reg + 1;
                    state_next = STATE_RUN;
                end else if (init_data_reg[8:7] == 2'b01) begin
                    // write address
                    m_axis_cmd_address_next = init_data_reg[6:0];
                    m_axis_cmd_start_next = 1'b1;
                    address_next = address_reg + 1;
                    state_next = STATE_RUN;
                end else if (init_data_reg[8:4] == 5'b00001) begin
                    // delay
                    delay_counter_next = 32'd1 << (init_data_reg[3:0]+16);
                    address_next = address_reg + 1;
                    state_next = STATE_RUN;
                end else if (init_data_reg == 9'b001000001) begin
                    // send stop
                    m_axis_cmd_write_next = 1'b0;
                    m_axis_cmd_start_next = 1'b0;
                    m_axis_cmd_stop_next = 1'b1;
                    m_axis_cmd_valid_next = 1'b1;
                    address_next = address_reg + 1;
                    state_next = STATE_RUN;
                end else if (init_data_reg == 9'b000001001) begin
                    // data table start
                    data_ptr_next = address_reg + 1;
                    address_next = address_reg + 1;
                    state_next = STATE_TABLE_1;
                end else if (init_data_reg == 9'd0) begin
                    // stop
                    m_axis_cmd_start_next = 1'b0;
                    m_axis_cmd_write_next = 1'b0;
                    m_axis_cmd_stop_next = 1'b1;
                    m_axis_cmd_valid_next = 1'b1;
                    state_next = STATE_IDLE;
                end else begin
                    // invalid command, skip
                    address_next = address_reg + 1;
                    state_next = STATE_RUN;
                end
            end
            STATE_TABLE_1: begin
                // find address table start
                if (init_data_reg == 9'b000001000) begin
                    // address table start
                    address_ptr_next = address_reg + 1;
                    address_next = address_reg + 1;
                    state_next = STATE_TABLE_2;
                end else if (init_data_reg == 9'b000001001) begin
                    // data table start
                    data_ptr_next = address_reg + 1;
                    address_next = address_reg + 1;
                    state_next = STATE_TABLE_1;
                end else if (init_data_reg == 1) begin
                    // exit mode
                    address_next = address_reg + 1;
                    state_next = STATE_RUN;
                end else if (init_data_reg == 9'd0) begin
                    // stop
                    m_axis_cmd_start_next = 1'b0;
                    m_axis_cmd_write_next = 1'b0;
                    m_axis_cmd_stop_next = 1'b1;
                    m_axis_cmd_valid_next = 1'b1;
                    state_next = STATE_IDLE;
                end else begin
                    // invalid command, skip
                    address_next = address_reg + 1;
                    state_next = STATE_TABLE_1;
                end
            end
            STATE_TABLE_2: begin
                // find next address
                if (init_data_reg[8:7] == 2'b01) begin
                    // write address command
                    // store address and move to data table
                    cur_address_next = init_data_reg[6:0];
                    address_ptr_next = address_reg + 1;
                    address_next = data_ptr_reg;
                    state_next = STATE_TABLE_3;
                end else if (init_data_reg == 9'b000001001) begin
                    // data table start
                    data_ptr_next = address_reg + 1;
                    address_next = address_reg + 1;
                    state_next = STATE_TABLE_1;
                end else if (init_data_reg == 9'd1) begin
                    // exit mode
                    address_next = address_reg + 1;
                    state_next = STATE_RUN;
                end else if (init_data_reg == 9'd0) begin
                    // stop
                    m_axis_cmd_start_next = 1'b0;
                    m_axis_cmd_write_next = 1'b0;
                    m_axis_cmd_stop_next = 1'b1;
                    m_axis_cmd_valid_next = 1'b1;
                    state_next = STATE_IDLE;
                end else begin
                    // invalid command, skip
                    address_next = address_reg + 1;
                    state_next = STATE_TABLE_2;
                end
            end
            STATE_TABLE_3: begin
                // process data table with selected address
                if (init_data_reg[8] == 1'b1) begin
                    // write data
                    m_axis_cmd_write_next = 1'b1;
                    m_axis_cmd_stop_next = 1'b0;
                    m_axis_cmd_valid_next = 1'b1;
                    m_axis_data_tdata_next = init_data_reg[7:0];
                    m_axis_data_tvalid_next = 1'b1;
                    address_next = address_reg + 1;
                    state_next = STATE_TABLE_3;
                end else if (init_data_reg[8:7] == 2'b01) begin
                    // write address
                    m_axis_cmd_address_next = init_data_reg[6:0];
                    m_axis_cmd_start_next = 1'b1;
                    address_next = address_reg + 1;
                    state_next = STATE_TABLE_3;
                end else if (init_data_reg == 9'b000000011) begin
                    // write current address
                    m_axis_cmd_address_next = cur_address_reg;
                    m_axis_cmd_start_next = 1'b1;
                    address_next = address_reg + 1;
                    state_next = STATE_TABLE_3;
                end else if (init_data_reg == 9'b001000001) begin
                    // send stop
                    m_axis_cmd_write_next = 1'b0;
                    m_axis_cmd_start_next = 1'b0;
                    m_axis_cmd_stop_next = 1'b1;
                    m_axis_cmd_valid_next = 1'b1;
                    address_next = address_reg + 1;
                    state_next = STATE_TABLE_3;
                end else if (init_data_reg == 9'b000001001) begin
                    // data table start
                    data_ptr_next = address_reg + 1;
                    address_next = address_reg + 1;
                    state_next = STATE_TABLE_1;
                end else if (init_data_reg == 9'b000001000) begin
                    // address table start
                    address_next = address_ptr_reg;
                    state_next = STATE_TABLE_2;
                end else if (init_data_reg == 9'd1) begin
                    // exit mode
                    address_next = address_reg + 1;
                    state_next = STATE_RUN;
                end else if (init_data_reg == 9'd0) begin
                    // stop
                    m_axis_cmd_start_next = 1'b0;
                    m_axis_cmd_write_next = 1'b0;
                    m_axis_cmd_stop_next = 1'b1;
                    m_axis_cmd_valid_next = 1'b1;
                    state_next = STATE_IDLE;
                end else begin
                    // invalid command, skip
                    address_next = address_reg + 1;
                    state_next = STATE_TABLE_3;
                end
            end
        endcase
    end
end
always @(posedge clk) begin
    state_reg <= state_next;
    // read init_data ROM
    init_data_reg <= init_data[address_next];
    address_reg <= address_next;
    address_ptr_reg <= address_ptr_next;
    data_ptr_reg <= data_ptr_next;
    cur_address_reg <= cur_address_next;
    delay_counter_reg <= delay_counter_next;
    m_axis_cmd_address_reg <= m_axis_cmd_address_next;
    m_axis_cmd_start_reg <= m_axis_cmd_start_next;
    m_axis_cmd_write_reg <= m_axis_cmd_write_next;
    m_axis_cmd_stop_reg <= m_axis_cmd_stop_next;
    m_axis_cmd_valid_reg <= m_axis_cmd_valid_next;
    m_axis_data_tdata_reg <= m_axis_data_tdata_next;
    m_axis_data_tvalid_reg <= m_axis_data_tvalid_next;
    start_flag_reg <= start & start_flag_next;
    busy_reg <= (state_reg != STATE_IDLE);
    if (rst) begin
        state_reg <= STATE_IDLE;
        init_data_reg <= 9'd0;
        address_reg <= {AW{1'b0}};
        address_ptr_reg <= {AW{1'b0}};
        data_ptr_reg <= {AW{1'b0}};
        cur_address_reg <= 7'd0;
        delay_counter_reg <= 32'd0;
        m_axis_cmd_valid_reg <= 1'b0;
        m_axis_data_tvalid_reg <= 1'b0;
        start_flag_reg <= 1'b0;
        busy_reg <= 1'b0;
    end
end
endmodule