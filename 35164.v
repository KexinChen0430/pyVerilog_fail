module flpv3l_mbus_node(
    input   CIN,
    input   RESETn,
    input   DIN,
    output  reg COUT,
    output  reg DOUT,
    input       [`MBUS_ADDR_WIDTH-1:0] TX_ADDR,
    input       [`MBUS_DATA_WIDTH-1:0] TX_DATA,
    input       TX_PEND,
    input       TX_REQ,
    output  reg TX_ACK,
    input       TX_PRIORITY,
    output  reg [`MBUS_ADDR_WIDTH-1:0] RX_ADDR,
    output  reg [`MBUS_DATA_WIDTH-1:0] RX_DATA,
    output  reg RX_PEND,
    output  reg RX_REQ,
    input       RX_ACK,
    output      RX_BROADCAST,
    output  reg RX_FAIL,
    output  reg TX_FAIL,
    output  reg TX_SUCC,
    input       TX_RESP_ACK,
    output      MBC_IN_FWD,
    `ifdef MBUS_NODE_POWER_GATING
    // power gated signals from sleep controller
    input       MBC_RESET,
    // power gated signals to layer controller
    output  reg LRC_SLEEP,
    output  reg LRC_CLKENB,
    output  reg LRC_RESET,
    output  reg LRC_ISOLATE,
    // power gated signal to sleep controller
    output  reg SLEEP_REQUEST_TO_SLEEP_CTRL,
    // External interrupt
    input       EXTERNAL_INT,
    output  reg CLR_EXT_INT,
    output  reg MBUS_BUSY,
    `endif
    // interface with local register files (RF)
    input       [`MBUS_DYNA_WIDTH-1:0] ASSIGNED_ADDR_IN,
    output      [`MBUS_DYNA_WIDTH-1:0] ASSIGNED_ADDR_OUT,
    input       ASSIGNED_ADDR_VALID,
    output  reg ASSIGNED_ADDR_WRITE,
    output  reg ASSIGNED_ADDR_INVALIDn
);
`include "include/flpv3l_mbus_func.v"
parameter ADDRESS = 20'habcde;
parameter ADDRESS_MASK = {(`MBUS_PRFIX_WIDTH){1'b1}};
parameter ADDRESS_MASK_SHORT = {`MBUS_DYNA_WIDTH{1'b1}};
// Node mode
parameter MODE_TX_NON_PRIO = 2'd0;
parameter MODE_TX = 2'd1;
parameter MODE_RX = 2'd2;
parameter MODE_FWD = 2'd3;
// BUS state
parameter BUS_IDLE = 0;
parameter BUS_ARBITRATE = 1;
parameter BUS_PRIO = 2;
parameter BUS_ADDR = 3;
parameter BUS_DATA_RX_ADDI = 4;
parameter BUS_DATA = 5;
parameter BUS_DATA_RX_CHECK = 6;
parameter BUS_REQ_INTERRUPT = 7;
parameter BUS_CONTROL0 = 8;
parameter BUS_CONTROL1 = 9;
parameter BUS_BACK_TO_IDLE = 10;
parameter NUM_OF_BUS_STATE = 11;
// Address enumeration response type
parameter ADDR_ENUM_RESPOND_T1 = 2'b00;
parameter ADDR_ENUM_RESPOND_T2 = 2'b10;
parameter ADDR_ENUM_RESPOND_NONE = 2'b11;
// TX broadcast data length
parameter LENGTH_1BYTE = 2'b00;
parameter LENGTH_2BYTE = 2'b01;
parameter LENGTH_3BYTE = 2'b10;
parameter LENGTH_4BYTE = 2'b11;
parameter RX_ABOVE_TX = 1'b1;
parameter RX_BELOW_TX = 1'b0;
// override this parameter to "1'b1" if the node is master
parameter MASTER_NODE = 1'b0;
wire [1:0] CONTROL_BITS = `MBUS_CONTROL_SEQ; // EOM?, ~ACK?
// general registers
reg     [1:0] mode, next_mode, mode_neg, mode_temp;
reg     [log2(NUM_OF_BUS_STATE-1)-1:0] bus_state, next_bus_state, bus_state_neg;
reg     [log2(`MBUS_DATA_WIDTH-1)-1:0] bit_position, next_bit_position;
reg     req_interrupt, next_req_interrupt;
// Pat Fix
reg     req_interrupt_because_error, next_req_interrupt_because_error;
reg     out_reg_pos, next_out_reg_pos, out_reg_neg;
// tx registers
reg     [`MBUS_ADDR_WIDTH-1:0] ADDR, next_addr;
reg     [`MBUS_DATA_WIDTH-1:0] DATA, next_data;
reg     tx_pend, next_tx_pend;
reg     tx_underflow, next_tx_underflow;
reg     ctrl_bit_buf, next_ctrl_bit_buf;
// rx registers
reg     [`MBUS_ADDR_WIDTH-1:0] next_rx_addr;
reg     [`MBUS_DATA_WIDTH-1:0] next_rx_data;
reg     [`MBUS_DATA_WIDTH+1:0] rx_data_buf, next_rx_data_buf;
reg     next_rx_fail;
// address enumation registers
reg     [1:0] enum_addr_resp, next_enum_addr_resp;
reg     next_assigned_addr_write;
reg     next_assigned_addr_invalidn;
// interrupt register
reg     BUS_INT_RSTn;
wire    BUS_INT;
// interface registers
reg     next_tx_ack;
reg     next_tx_fail;
reg     next_tx_success;
reg     next_rx_req;
reg     next_rx_pend;
wire    addr_bit_extract = ((ADDR  & (1'b1<<bit_position))==0)? 1'b0 : 1'b1;
wire    data_bit_extract = ((DATA & (1'b1<<bit_position))==0)? 1'b0 : 1'b1;
reg     [1:0] addr_match_temp;
wire    address_match = (addr_match_temp[1] | addr_match_temp[0]);
// Broadcast processing
reg     [`MBUS_BROADCAST_CMD_WIDTH -1:0] rx_broadcast_command;
wire    rx_long_addr_en = (RX_ADDR[`MBUS_ADDR_WIDTH-1:`MBUS_ADDR_WIDTH-4]==4'hf)? 1'b1 : 1'b0;
wire    tx_long_addr_en = (TX_ADDR[`MBUS_ADDR_WIDTH-1:`MBUS_ADDR_WIDTH-4]==4'hf)? 1'b1 : 1'b0;
wire    tx_long_addr_en_latched = (ADDR[`MBUS_ADDR_WIDTH-1:`MBUS_ADDR_WIDTH-4]==4'hf)? 1'b1 : 1'b0;
reg     tx_broadcast_latched;
reg     [1:0] tx_dat_length, rx_dat_length;
reg     rx_position, rx_dat_length_valid;
reg     wakeup_req;
wire    [`MBUS_DATA_WIDTH-1:0] broadcast_addr = `MBUS_BROADCAST_ADDR;
wire    [`MBUS_DATA_WIDTH-1:0] rx_data_buf_proc = (rx_dat_length_valid)? (rx_position==RX_BELOW_TX)? rx_data_buf[`MBUS_DATA_WIDTH-1:0] : rx_data_buf[`MBUS_DATA_WIDTH+1:2] : {`MBUS_DATA_WIDTH{1'b0}};
// Power gating related signals
`ifdef MBUS_NODE_POWER_GATING
wire    RESETn_local = (RESETn & (~MBC_RESET));
`else
wire    RESETn_local = RESETn;
`endif
`ifdef MBUS_NODE_POWER_GATING
reg     [1:0] powerup_seq_fsm;
reg     shutdown, next_shutdown;
reg     ext_int;
`endif
wire    [15:0] layer_slot = (1'b1<<ASSIGNED_ADDR_IN);
// Assignments
assign RX_BROADCAST = addr_match_temp[0];
assign ASSIGNED_ADDR_OUT = DATA[`MBUS_DYNA_WIDTH-1:0];
assign MBC_IN_FWD = (mode == MODE_FWD);
// MBUS_BUSY generation
always @ (posedge CIN or negedge RESETn_local)
begin
    if (~RESETn_local) MBUS_BUSY <= `SD 1'b0;
    else if (bus_state == BUS_BACK_TO_IDLE) MBUS_BUSY <= `SD 1'b0;
    else MBUS_BUSY <= `SD 1'b1;
end
// Node priority
// Used only when the BUS_STATE == BUS_PRIO, determine the node should be RX or TX
always @ *
begin
    mode_temp = MODE_RX;
    if (mode==MODE_TX_NON_PRIO)
    begin
        // Other node request priority,
        if (DIN & (~TX_PRIORITY))
            mode_temp = MODE_RX;
        else
            mode_temp = MODE_TX;
    end
    else
    begin
        // the node won first trial doesn't request priority
        if (TX_REQ & TX_PRIORITY & (~DIN))
            mode_temp = MODE_TX;
        else
            mode_temp = MODE_RX;
    end
end
// End of node priority
// TX Broadcast
// For some boradcast message, TX node should take apporiate action, ex: all node sleep
// determined by ADDR flops, not TX_ADDR
always @ *
begin
    tx_broadcast_latched = 0;
    if (tx_long_addr_en_latched)
    begin
        if (ADDR[`MBUS_DATA_WIDTH-1:`MBUS_FUNC_WIDTH]==broadcast_addr[`MBUS_DATA_WIDTH-1:`MBUS_FUNC_WIDTH])
            tx_broadcast_latched = 1;
    end
    else
    begin
        if (ADDR[`MBUS_SHORT_ADDR_WIDTH-1:`MBUS_FUNC_WIDTH]==broadcast_addr[`MBUS_SHORT_ADDR_WIDTH-1:`MBUS_FUNC_WIDTH])
            tx_broadcast_latched = 1;
    end
end
// End of TX broadcast
// Wake up control
// What type of message should wake up the layer controller (LC)
always @ *
begin
    wakeup_req = 0;
    // normal messages
    if (~RX_BROADCAST)
        wakeup_req = address_match;
    else
    begin
        // master node should wake up for every broadcast message
        if (MASTER_NODE==1'b1)
            wakeup_req = address_match;
        // which channels should wake up
        case (RX_ADDR[`MBUS_FUNC_WIDTH-1:0])
            `MBUS_CHANNEL_POWER:
            begin
                case (rx_data_buf[`MBUS_BROADCAST_CMD_WIDTH-1:0])
                    `MBUS_CMD_CHANNEL_POWER_ALL_WAKE: begin wakeup_req = 1; end
                endcase
            end
            default: begin end
        endcase
    end
end
// End of Wake up control
// Address compare
// This block determine the incoming message has match the address or not
always @ *
begin
    addr_match_temp = 2'b00;
    if (rx_long_addr_en)
    begin
        if (RX_ADDR[`MBUS_DATA_WIDTH-1:`MBUS_FUNC_WIDTH]==broadcast_addr[`MBUS_DATA_WIDTH-1:`MBUS_FUNC_WIDTH])
            addr_match_temp[0] = 1;
        if (((RX_ADDR[`MBUS_DATA_WIDTH-`MBUS_RSVD_WIDTH-1:`MBUS_FUNC_WIDTH] ^ ADDRESS) & ADDRESS_MASK)==0)
            addr_match_temp[1] = 1;
    end
    // short address assigned
    else
    begin
        if (RX_ADDR[`MBUS_SHORT_ADDR_WIDTH-1:`MBUS_FUNC_WIDTH]==broadcast_addr[`MBUS_SHORT_ADDR_WIDTH-1:`MBUS_FUNC_WIDTH])
            addr_match_temp[0] = 1;
        if (ASSIGNED_ADDR_VALID)
        begin
            if (((RX_ADDR[`MBUS_SHORT_ADDR_WIDTH-1:`MBUS_FUNC_WIDTH] ^ ASSIGNED_ADDR_IN) & ADDRESS_MASK_SHORT)==0)
                addr_match_temp[1] = 1;
        end
    end
end
// End of address compare
// TX broadcast command length
// This only take care the broadcast command issued from layer controller
// CANNOT use this in self generate enumerate response
always @ *
begin
    tx_dat_length = LENGTH_4BYTE;
    if (tx_broadcast_latched)
    begin
        case (ADDR[`MBUS_FUNC_WIDTH-1:0])
            `MBUS_CHANNEL_ENUM:
            begin
                case (DATA[`MBUS_DATA_WIDTH-1:`MBUS_DATA_WIDTH-`MBUS_BROADCAST_CMD_WIDTH])
                    `MBUS_CMD_CHANNEL_ENUM_QUERRY:       begin tx_dat_length = LENGTH_1BYTE; end
                    `MBUS_CMD_CHANNEL_ENUM_RESPONSE:     begin tx_dat_length = LENGTH_4BYTE; end
                    `MBUS_CMD_CHANNEL_ENUM_ENUMERATE:    begin tx_dat_length = LENGTH_1BYTE; end
                    `MBUS_CMD_CHANNEL_ENUM_INVALIDATE:   begin tx_dat_length = LENGTH_1BYTE; end
                endcase
            end
            `MBUS_CHANNEL_POWER:
            begin
                case (DATA[`MBUS_DATA_WIDTH-1:`MBUS_DATA_WIDTH-`MBUS_BROADCAST_CMD_WIDTH])
                    `MBUS_CMD_CHANNEL_POWER_ALL_SLEEP:       begin tx_dat_length = LENGTH_1BYTE; end
                    `MBUS_CMD_CHANNEL_POWER_ALL_WAKE:        begin tx_dat_length = LENGTH_1BYTE; end
                    `MBUS_CMD_CHANNEL_POWER_SEL_SLEEP:       begin tx_dat_length = LENGTH_3BYTE; end
                    `MBUS_CMD_CHANNEL_POWER_SEL_SLEEP_FULL:  begin tx_dat_length = LENGTH_4BYTE; end
                    `MBUS_CMD_CHANNEL_POWER_SEL_WAKE:        begin tx_dat_length = LENGTH_3BYTE; end
                endcase
            end
        endcase
    end
end
// This block used to determine the received data length.
// only broadcast can be any byte aligned
// otherwise, regular message has to be word aligned
always @ *
begin
    rx_dat_length = LENGTH_4BYTE;
    rx_dat_length_valid = 0;
    rx_position = RX_ABOVE_TX;
    case (bit_position)
        1: begin rx_dat_length = LENGTH_4BYTE; rx_dat_length_valid = 1; rx_position = RX_BELOW_TX; end
        (`MBUS_DATA_WIDTH-1'b1): begin rx_dat_length = LENGTH_4BYTE; rx_dat_length_valid = 1; rx_position = RX_ABOVE_TX; end
        9: begin rx_dat_length = LENGTH_3BYTE; if (RX_BROADCAST) rx_dat_length_valid = 1; rx_position = RX_BELOW_TX; end
        7: begin rx_dat_length = LENGTH_3BYTE; if (RX_BROADCAST) rx_dat_length_valid = 1; rx_position = RX_ABOVE_TX; end
        17: begin rx_dat_length = LENGTH_2BYTE; if (RX_BROADCAST) rx_dat_length_valid = 1; rx_position = RX_BELOW_TX; end
        15: begin rx_dat_length = LENGTH_2BYTE; if (RX_BROADCAST) rx_dat_length_valid = 1; rx_position = RX_ABOVE_TX; end
        25: begin rx_dat_length = LENGTH_1BYTE; if (RX_BROADCAST) rx_dat_length_valid = 1; rx_position = RX_BELOW_TX; end
        23: begin rx_dat_length = LENGTH_1BYTE; if (RX_BROADCAST) rx_dat_length_valid = 1; rx_position = RX_ABOVE_TX; end
    endcase
end
always @ *
begin
    rx_broadcast_command = rx_data_buf_proc[`MBUS_DATA_WIDTH-1:`MBUS_DATA_WIDTH-`MBUS_BROADCAST_CMD_WIDTH];
    case (rx_dat_length)
        LENGTH_4BYTE: begin rx_broadcast_command = rx_data_buf_proc[`MBUS_DATA_WIDTH-1:`MBUS_DATA_WIDTH-`MBUS_BROADCAST_CMD_WIDTH]; end
        LENGTH_3BYTE: begin rx_broadcast_command = rx_data_buf_proc[`MBUS_DATA_WIDTH-9:`MBUS_DATA_WIDTH-`MBUS_BROADCAST_CMD_WIDTH-8]; end
        LENGTH_2BYTE: begin rx_broadcast_command = rx_data_buf_proc[`MBUS_DATA_WIDTH-17:`MBUS_DATA_WIDTH-`MBUS_BROADCAST_CMD_WIDTH-16]; end
        LENGTH_1BYTE: begin rx_broadcast_command = rx_data_buf_proc[`MBUS_DATA_WIDTH-25:`MBUS_DATA_WIDTH-`MBUS_BROADCAST_CMD_WIDTH-24]; end
    endcase
end
always @ (posedge CIN or negedge RESETn_local)
begin
    if (~RESETn_local)
    begin
        `ifdef MBUS_NODE_POWER_GATING
        if (MASTER_NODE==1'b1)
            bus_state <= `SD BUS_IDLE;
        else
            bus_state <= `SD BUS_PRIO;
        `else
        bus_state <= `SD BUS_IDLE;
        `endif
        BUS_INT_RSTn <= `SD 1;
    end
    else
    begin
        if (BUS_INT)
        begin
            bus_state <= `SD BUS_CONTROL0;
            BUS_INT_RSTn <= `SD 0;
        end
        else
        begin
            bus_state <= `SD next_bus_state;
            BUS_INT_RSTn <= `SD 1;
        end
    end
end
wire TX_RESP_RSTn = RESETn_local & (~TX_RESP_ACK);
always @ (posedge CIN or negedge TX_RESP_RSTn)
begin
    if (~TX_RESP_RSTn)
    begin
        TX_FAIL <= `SD 0;
        TX_SUCC <= `SD 0;
    end
    else
    begin
        TX_FAIL <= `SD next_tx_fail;
        TX_SUCC <= `SD next_tx_success;
    end
end
wire RX_ACK_RSTn = RESETn_local & (~RX_ACK);
always @ (posedge CIN or negedge RX_ACK_RSTn)
begin
    if (~RX_ACK_RSTn)
    begin
        RX_REQ <= `SD 0;
        RX_PEND <= `SD 0;
        RX_FAIL <= `SD 0;
    end
    else if (~BUS_INT)
    begin
        RX_REQ <= `SD next_rx_req;
        RX_PEND <= `SD next_rx_pend;
        RX_FAIL <= `SD next_rx_fail;
    end
end
always @ (posedge CIN or negedge RESETn_local)
begin
    if (~RESETn_local)
    begin
        // general registers
        mode <= `SD MODE_RX;
        bit_position <= `SD `MBUS_ADDR_WIDTH - 1'b1;
        req_interrupt <= `SD 0;
        // Pat Fix
        req_interrupt_because_error <= `SD 0;
        out_reg_pos <= `SD 0;
        // Transmitter registers
        ADDR <= `SD 0;
        DATA <= `SD 0;
        tx_pend <= `SD 0;
        tx_underflow <= `SD 0;
        ctrl_bit_buf <= `SD 0;
        // Receiver register
        RX_ADDR <= `SD 0;
        RX_DATA <= `SD 0;
        rx_data_buf <= `SD 0;
        // Interface registers
        TX_ACK <= `SD 0;
        `ifdef MBUS_NODE_POWER_GATING
        // power gated related signal
        shutdown <= `SD 0;
        `endif
        // address enumeration
        enum_addr_resp <= `SD ADDR_ENUM_RESPOND_NONE;
        // address enumeration interface
        ASSIGNED_ADDR_WRITE <= `SD 0;
        ASSIGNED_ADDR_INVALIDn <= `SD 1;
    end
    else
    begin
        // general registers
        mode <= `SD next_mode;
        if (~BUS_INT)
        begin
            bit_position <= `SD next_bit_position;
            rx_data_buf <= `SD next_rx_data_buf;
            // Receiver register
            RX_ADDR <= `SD next_rx_addr;
            RX_DATA <= `SD next_rx_data;
        end
        req_interrupt <= `SD next_req_interrupt;
        // Pat Fix
        req_interrupt_because_error <= `SD next_req_interrupt_because_error;
        out_reg_pos <= `SD next_out_reg_pos;
        // Transmitter registers
        ADDR <= `SD next_addr;
        DATA <= `SD next_data;
        tx_pend <= `SD next_tx_pend;
        tx_underflow <= `SD next_tx_underflow;
        ctrl_bit_buf <= `SD next_ctrl_bit_buf;
        // Interface registers
        TX_ACK <= `SD next_tx_ack;
        `ifdef MBUS_NODE_POWER_GATING
        // power gated related signal
        shutdown <= `SD next_shutdown;
        `endif
        // address enumeration
        enum_addr_resp <= `SD next_enum_addr_resp;
        // address enumeration interface
        ASSIGNED_ADDR_WRITE <= `SD next_assigned_addr_write;
        ASSIGNED_ADDR_INVALIDn <= `SD next_assigned_addr_invalidn;
    end
end
always @ *
begin
    // general registers
    next_mode = mode;
    next_bus_state = bus_state;
    next_bit_position = bit_position;
    next_req_interrupt = req_interrupt;
    // Pat Fix
    next_req_interrupt_because_error = req_interrupt_because_error;
    next_out_reg_pos = out_reg_pos;
    // Transmitter registers
    next_addr = ADDR;
    next_data = DATA;
    next_tx_pend = tx_pend;
    next_tx_underflow = tx_underflow;
    next_ctrl_bit_buf = ctrl_bit_buf;
    // Receiver register
    next_rx_addr = RX_ADDR;
    next_rx_data = RX_DATA;
    next_rx_fail = RX_FAIL;
    next_rx_data_buf = rx_data_buf;
    // Interface registers
    next_rx_req = RX_REQ;
    next_rx_pend = RX_PEND;
    next_tx_fail = TX_FAIL;
    next_tx_success = TX_SUCC;
    next_tx_ack = TX_ACK;
    // Address enumeration
    next_enum_addr_resp = enum_addr_resp;
    // Address enumeratio interface
    next_assigned_addr_write = 0;
    next_assigned_addr_invalidn = 1;
    // Asynchronous interface
    if (TX_ACK & (~TX_REQ))
        next_tx_ack = 0;
    `ifdef MBUS_NODE_POWER_GATING
    // power gating signals
    next_shutdown = shutdown;
    `endif
    case (bus_state)
        BUS_IDLE:
        begin
            if (DIN^DOUT)
                next_mode = MODE_TX_NON_PRIO;
            else
                next_mode = MODE_RX;
            // general registers
            next_bus_state = BUS_ARBITRATE;
            next_bit_position = `MBUS_ADDR_WIDTH - 1'b1;
        end
        BUS_ARBITRATE:
        begin
            next_bus_state = BUS_PRIO;
        end
        BUS_PRIO:
        begin
            next_mode = mode_temp;
            next_bus_state = BUS_ADDR;
            // no matter this node wins the arbitration or not, must clear
            // type T1
            if (enum_addr_resp== ADDR_ENUM_RESPOND_T1)
                next_enum_addr_resp = ADDR_ENUM_RESPOND_NONE;
            if (mode_temp==MODE_TX)
            begin
                case (enum_addr_resp)
                    // respond to enumeration
                    ADDR_ENUM_RESPOND_T1:
                    begin
                        next_bit_position = `MBUS_SHORT_ADDR_WIDTH - 1'b1;
                        next_assigned_addr_write = 1;
                    end
                    // respond to query
                    ADDR_ENUM_RESPOND_T2:
                    begin
                        next_bit_position = `MBUS_SHORT_ADDR_WIDTH - 1'b1;
                        next_enum_addr_resp = ADDR_ENUM_RESPOND_NONE;
                    end
                    // TX initiated from layer controller
                    default:
                    begin
                        next_addr = TX_ADDR;
                        next_data = TX_DATA;
                        next_tx_ack = 1;
                        next_tx_pend = TX_PEND;
                        if (tx_long_addr_en)
                            next_bit_position = `MBUS_ADDR_WIDTH - 1'b1;
                        else
                            next_bit_position = `MBUS_SHORT_ADDR_WIDTH - 1'b1;
                    end
                endcase
            end
            else
            // RX mode
            begin
                next_rx_data_buf = 0;
                next_rx_addr = 0;
            end
        end
        BUS_ADDR:
        begin
            case (mode)
                MODE_TX:
                begin
                    if (bit_position)
                        next_bit_position = bit_position - 1'b1;
                    else
                    begin
                        next_bit_position = `MBUS_DATA_WIDTH - 1'b1;
                        next_bus_state = BUS_DATA;
                    end
                end
                MODE_RX:
                begin
                    // short address
                    if ((bit_position==`MBUS_ADDR_WIDTH-3'd5)&&(RX_ADDR[3:0]!=4'hf))
                        next_bit_position = `MBUS_SHORT_ADDR_WIDTH - 3'd6;
                    else
                    begin
                        if (bit_position)
                            next_bit_position = bit_position - 1'b1;
                        else
                        begin
                            next_bit_position = `MBUS_DATA_WIDTH - 1'b1;
                            next_bus_state = BUS_DATA_RX_ADDI;
                        end
                    end
                    next_rx_addr = {RX_ADDR[`MBUS_ADDR_WIDTH-2:0], DIN};
                end
            endcase
        end
        BUS_DATA_RX_ADDI:
        begin
            next_rx_data_buf = {rx_data_buf[`MBUS_DATA_WIDTH:0], DIN};
            next_bit_position = bit_position - 1'b1;
            `ifdef MBUS_NODE_POWER_GATING
            next_shutdown = 0;
            `endif
            if (bit_position==(`MBUS_DATA_WIDTH-2'b10))
            begin
                next_bus_state = BUS_DATA;
                next_bit_position = `MBUS_DATA_WIDTH - 1'b1;
            end
            if (address_match==0)
                next_mode = MODE_FWD;
        end
        BUS_DATA:
        begin
            case (mode)
                MODE_TX:
                begin
                    // support variable tx length for broadcast messages
                    if (((tx_dat_length==LENGTH_4BYTE)&&(bit_position>0))||((tx_dat_length==LENGTH_3BYTE)&&(bit_position>8))||((tx_dat_length==LENGTH_2BYTE)&&(bit_position>16))||((tx_dat_length==LENGTH_1BYTE)&&(bit_position>24)))
                    //if (bit_position)
                        next_bit_position = bit_position - 1'b1;
                    else
                    begin
                        next_bit_position = `MBUS_DATA_WIDTH - 1'b1;
                        case ({tx_pend, TX_REQ})
                            // continue next word
                            2'b11:
                            begin
                                next_tx_pend = TX_PEND;
                                next_data = TX_DATA;
                                next_tx_ack = 1;
                            end
                            // underflow
                            2'b10:
                            begin
                                next_bus_state = BUS_REQ_INTERRUPT;
                                next_tx_underflow = 1;
                                next_req_interrupt = 1;
                                // Pat Fix
                                next_req_interrupt_because_error = 1;
                                next_tx_fail = 1;
                            end
                            default:
                            begin
                                next_bus_state = BUS_REQ_INTERRUPT;
                                next_req_interrupt = 1;
                            end
                        endcase
                    end
                end
                MODE_RX:
                begin
                    next_rx_data_buf = {rx_data_buf[`MBUS_DATA_WIDTH:0], DIN};
                    if (bit_position)
                        next_bit_position = bit_position - 1'b1;
                    else
                    begin
                        if (RX_REQ)
                        begin
                            // RX overflow
                            next_bus_state = BUS_REQ_INTERRUPT;
                            next_req_interrupt = 1;
                            // Pat Fix
                            next_req_interrupt_because_error = 1;
                            next_rx_fail = 1;
                        end
                        else
                        begin
                            next_bus_state = BUS_DATA_RX_CHECK;
                            next_bit_position = `MBUS_DATA_WIDTH - 1'b1;
                        end
                    end
                end
            endcase
        end
        BUS_DATA_RX_CHECK:
        begin
            next_bit_position = bit_position - 1'b1;
            next_rx_data_buf = {rx_data_buf[`MBUS_DATA_WIDTH:0], DIN};
            if (RX_BROADCAST)
            begin
                if (MASTER_NODE==1'b1)
                    next_rx_req = 1;
                else
                    next_rx_req = 0;
            end
            else
                next_rx_req = 1;
            next_rx_pend = 1;
            next_rx_data = rx_data_buf[`MBUS_DATA_WIDTH+1:2];
            next_bus_state = BUS_DATA;
        end
        BUS_REQ_INTERRUPT:
        begin
        end
        BUS_CONTROL0:
        begin
            next_bus_state = BUS_CONTROL1;
            next_ctrl_bit_buf = DIN;
            case (mode)
                MODE_TX:
                begin
                    if (req_interrupt)
                    begin
                        // Prevent wire floating
                        next_out_reg_pos = ~CONTROL_BITS[0];
                        if (tx_broadcast_latched)
                        begin
                            case (ADDR[`MBUS_FUNC_WIDTH-1:0])
                                `MBUS_CHANNEL_POWER:
                                begin
                                `ifdef MBUS_NODE_POWER_GATING
                                    case (DATA[`MBUS_DATA_WIDTH-1:`MBUS_DATA_WIDTH-`MBUS_BROADCAST_CMD_WIDTH ])
                                        `MBUS_CMD_CHANNEL_POWER_ALL_SLEEP:
                                        begin
                                            next_shutdown = 1;
                                        end
                                        `MBUS_CMD_CHANNEL_POWER_SEL_SLEEP:
                                        begin
                                            if ((DATA[27:12]&layer_slot)>0)
                                                next_shutdown = 1;
                                        end
                                        `MBUS_CMD_CHANNEL_POWER_SEL_SLEEP_FULL:
                                        begin
                                            if (((DATA[`MBUS_PRFIX_WIDTH+3:4] ^  ADDRESS) & ADDRESS_MASK)==0)
                                                next_shutdown = 1;
                                        end
                                    endcase
                                `endif
                                end
                            endcase
                        end
                    end
                    else
                    begin
                        next_tx_fail = 1;
                    end
                end
                MODE_RX:
                begin
                    if (req_interrupt)
                        next_out_reg_pos = ~CONTROL_BITS[0];
                    else
                    begin
                        // End of Message
                        // correct ending state
                        // rx above tx = 31
                        // rx below tx = 1
                        if ((DIN==CONTROL_BITS[1])&&(rx_dat_length_valid))
                        begin
                            // rx overflow
                            if (RX_REQ)
                            begin
                                next_out_reg_pos = ~CONTROL_BITS[0];
                                next_rx_fail = 1;
                            end
                            else
                            // assert rx_req if not a broadcast
                            begin
                                next_rx_data = rx_data_buf_proc;
                                next_out_reg_pos = CONTROL_BITS[0];
                                if (~RX_BROADCAST)
                                    next_rx_req = 1;
                                next_rx_pend = 0;
                            end
                            // broadcast message
                            if (RX_BROADCAST)
                            begin
                                // assert broadcast rx_req only in CPU layer
                                if ((MASTER_NODE==1'b1)&&(~RX_REQ)) // CPU_LAYER -> MASTER_NODE
                                    next_rx_req = 1;
                                // broadcast channel
                                case (RX_ADDR[`MBUS_FUNC_WIDTH-1:0])
                                    `MBUS_CHANNEL_ENUM:
                                    begin
                                        case (rx_broadcast_command)
                                            // any node should report its full prefix and short prefix (dynamic allocated address)
                                            // Pad "0" if the dynamic address is invalid
                                            `MBUS_CMD_CHANNEL_ENUM_QUERRY:
                                            begin
                                                // this node doesn't have a valid short address, active low
                                                next_enum_addr_resp = ADDR_ENUM_RESPOND_T2;
                                                next_addr = broadcast_addr[`MBUS_SHORT_ADDR_WIDTH-1:0];
                                                next_data = ((`MBUS_CMD_CHANNEL_ENUM_RESPONSE<<(`MBUS_DATA_WIDTH-`MBUS_BROADCAST_CMD_WIDTH)) | (ADDRESS<<`MBUS_DYNA_WIDTH) | ASSIGNED_ADDR_IN);
                                            end
                                            // request arbitration, set short prefix if successed
                                            `MBUS_CMD_CHANNEL_ENUM_ENUMERATE:
                                            begin
                                                if (~ASSIGNED_ADDR_VALID)
                                                begin
                                                    next_enum_addr_resp = ADDR_ENUM_RESPOND_T1;
                                                    next_addr = broadcast_addr[`MBUS_SHORT_ADDR_WIDTH-1:0];
                                                    next_data = ((`MBUS_CMD_CHANNEL_ENUM_RESPONSE<<(`MBUS_DATA_WIDTH-`MBUS_BROADCAST_CMD_WIDTH)) | (ADDRESS<<`MBUS_DYNA_WIDTH) | rx_data_buf_proc[`MBUS_DYNA_WIDTH-1:0]);
                                                end
                                            end
                                            `MBUS_CMD_CHANNEL_ENUM_INVALIDATE:
                                            begin
                                                case (rx_data_buf_proc[`MBUS_DYNA_WIDTH-1:0])
                                                    {`MBUS_DYNA_WIDTH{1'b1}}: begin next_assigned_addr_invalidn  = 0; end
                                                    ASSIGNED_ADDR_IN: begin next_assigned_addr_invalidn  = 0; end
                                                    default: begin end
                                                endcase
                                            end
                                        endcase
                                    end
                                    `ifdef MBUS_NODE_POWER_GATING
                                    `MBUS_CHANNEL_POWER:
                                    begin
                                        // PWR Command
                                        case (rx_broadcast_command)
                                            `MBUS_CMD_CHANNEL_POWER_ALL_SLEEP:
                                            begin
                                                next_shutdown = 1;
                                            end
                                            `MBUS_CMD_CHANNEL_POWER_SEL_SLEEP:
                                            begin
                                                if ((rx_data_buf_proc[19:4]&layer_slot)>0)
                                                    next_shutdown = 1;
                                            end
                                            `MBUS_CMD_CHANNEL_POWER_SEL_SLEEP_FULL:
                                            begin
                                                if (((rx_data_buf_proc[`MBUS_PRFIX_WIDTH+3:4] ^  ADDRESS) & ADDRESS_MASK)==0)
                                                    next_shutdown = 1;
                                            end
                                        endcase
                                    end
                                    `endif
                                    // shoud only be active at master
                                    `MBUS_CHANNEL_CTRL:
                                    begin
                                        if (MASTER_NODE==1'b1)
                                            next_rx_req = 1;
                                    end
                                endcase
                            end // endif rx_broadcast
                        end // endif valid reception
                        else
                        // invalid data length or invalid EOM
                        begin
                            next_out_reg_pos = ~CONTROL_BITS[0];
                            `ifdef MBUS_NODE_POWER_GATING
                            if (~ext_int)
                                next_rx_fail = 1;
                            `else
                                next_rx_fail = 1;
                            `endif
                        end
                    end
                end
            endcase
        end
        BUS_CONTROL1:
        begin
            next_bus_state = BUS_BACK_TO_IDLE;
            if (req_interrupt)
            begin
                if ((mode==MODE_TX)&&(~tx_underflow))
                begin
                    // ACK received
                    if ({ctrl_bit_buf, DIN}==CONTROL_BITS)
                        next_tx_success = 1;
                    else
                        next_tx_fail = 1;
                end
            end
        end
        BUS_BACK_TO_IDLE:
        begin
            next_bus_state = BUS_IDLE;
            next_req_interrupt = 0;
            // Pat Fix
            next_req_interrupt_because_error = 0;
            next_mode = MODE_RX;
            next_tx_underflow = 0;
        end
    endcase
end
`ifdef MBUS_NODE_POWER_GATING
always @ (negedge CIN or negedge RESETn_local)
begin
    if (~RESETn_local)
    begin
        powerup_seq_fsm <= `SD 0;
        LRC_SLEEP <= `SD `MBUS_IO_HOLD;
        LRC_CLKENB <= `SD `MBUS_IO_HOLD;
        LRC_ISOLATE <= `SD `MBUS_IO_HOLD;
        LRC_RESET <= `SD `MBUS_IO_HOLD;
        SLEEP_REQUEST_TO_SLEEP_CTRL <= `SD 0;
        ext_int <= `SD 0;
        CLR_EXT_INT <= `SD 0;
    end
    else
    begin
        if (CLR_EXT_INT & (~EXTERNAL_INT))
            CLR_EXT_INT <= `SD 0;
        // master node should wake up layer controller "early"
        if (((bus_state==BUS_ADDR)&&(MASTER_NODE==1'b0))||((bus_state==BUS_IDLE)&&(MASTER_NODE==1'b1)))
        begin
            if (EXTERNAL_INT)
            begin
                ext_int <= `SD 1;
                powerup_seq_fsm <= `SD 1;
                LRC_SLEEP <= `SD `MBUS_IO_RELEASE;
            end
            else
                powerup_seq_fsm <= `SD 0;
        end
        if (bus_state==BUS_CONTROL1)
            ext_int <= `SD 0;
        if (ext_int)
        begin
            case (powerup_seq_fsm)
                1: begin LRC_ISOLATE <= `SD `MBUS_IO_RELEASE; CLR_EXT_INT <= `SD 1; powerup_seq_fsm <= `SD powerup_seq_fsm + 1'b1; end
                2: begin LRC_RESET <= `SD `MBUS_IO_RELEASE; powerup_seq_fsm <= `SD powerup_seq_fsm + 1'b1; end
                3: begin LRC_CLKENB <= `SD `MBUS_IO_RELEASE; powerup_seq_fsm <= `SD powerup_seq_fsm + 1'b1; end
                0: begin end
            endcase
        end
        else
        begin
            case (bus_state)
                BUS_DATA:
                begin
                    case (powerup_seq_fsm)
                        0:
                        begin
                            // only check the wakeup_req after received broadcast command
                            // FSM stays at BUS_ADDR_ADDI for 2 cycles before entering BUS_DATA
                            // the complete command should received after `MBUS_DATA_WIDTH (32) - `MBUS_BROADCAST_CMD_WIDTH(4) + 2(2 BUS_ADDR_ADDI) - 1
                            if ((wakeup_req)&&(bit_position==`MBUS_DATA_WIDTH-`MBUS_BROADCAST_CMD_WIDTH+1))
                            begin
                                LRC_SLEEP <= `SD `MBUS_IO_RELEASE;
                                powerup_seq_fsm <= `SD powerup_seq_fsm + 1'b1;
                            end
                        end
                        1:
                        begin
                            LRC_ISOLATE <= `SD `MBUS_IO_RELEASE;
                            powerup_seq_fsm <= `SD powerup_seq_fsm + 1'b1;
                        end
                        2:
                        begin
                            LRC_RESET <= `SD `MBUS_IO_RELEASE;
                            powerup_seq_fsm <= `SD powerup_seq_fsm + 1'b1;
                        end
                        3:
                        begin
                            LRC_CLKENB <= `SD `MBUS_IO_RELEASE;
                        end
                    endcase
                end
                BUS_CONTROL1:
                begin
                    if (shutdown)
                    begin
                        SLEEP_REQUEST_TO_SLEEP_CTRL <= `SD 1;
                        LRC_ISOLATE <= `SD `MBUS_IO_HOLD;
                    end
                end
                BUS_BACK_TO_IDLE:
                begin
                end
            endcase
        end
    end
end
`endif
always @ (negedge CIN or negedge RESETn_local)
begin
    if (~RESETn_local)
    begin
        out_reg_neg <= `SD 1;
        `ifdef MBUS_NODE_POWER_GATING
        if (MASTER_NODE==1'b1)
            bus_state_neg <= `SD BUS_IDLE;
        else
            bus_state_neg <= `SD BUS_PRIO;
        `else
        bus_state_neg <= `SD BUS_IDLE;
        `endif
        mode_neg <= `SD MODE_RX;
    end
    else
    begin
        if (req_interrupt & BUS_INT)
            bus_state_neg <= `SD BUS_CONTROL0;
        else
            bus_state_neg <= `SD bus_state;
        mode_neg <= `SD mode;
        case (bus_state)
            BUS_ADDR:
            begin
                if (mode==MODE_TX)
                    out_reg_neg <= `SD addr_bit_extract;
            end
            BUS_DATA:
            begin
                if (mode==MODE_TX)
                    out_reg_neg <= `SD data_bit_extract;
            end
            BUS_CONTROL0:
            begin
                if (req_interrupt)
                begin
                    if (mode==MODE_TX)
                    begin
                        if (tx_underflow)
                            out_reg_neg <= `SD ~CONTROL_BITS[1];
                        else
                            out_reg_neg <= `SD CONTROL_BITS[1];
                    end
                    else
                        out_reg_neg <= `SD ~CONTROL_BITS[1];
                end
            end
            BUS_CONTROL1:
            begin
                out_reg_neg <= `SD out_reg_pos;
            end
        endcase
    end
end
always @ *
begin
    DOUT = DIN;
    case (bus_state_neg)
        BUS_IDLE:
        begin
            DOUT = ((~TX_REQ) & DIN & enum_addr_resp[0]);
        end
        BUS_ARBITRATE:
        begin
            if (mode_neg==MODE_TX_NON_PRIO)
                DOUT = 0;
        end
        BUS_PRIO:
        begin
            if (mode_neg==MODE_TX_NON_PRIO)
            begin
                if (TX_PRIORITY)
                    DOUT = 1;
                else
                    DOUT = 0;
            end
            else if ((mode_neg==MODE_RX)&&(TX_PRIORITY & TX_REQ))
                DOUT = 1;
        end
        BUS_ADDR:
        begin
            // Drive value only if interrupt is low
            if (~BUS_INT &(mode_neg==MODE_TX))
                DOUT = out_reg_neg;
        end
        BUS_DATA:
        begin
            // Drive value only if interrupt is low
            if (~BUS_INT &(mode_neg==MODE_TX))
                DOUT = out_reg_neg;
        end
        BUS_CONTROL0:
        begin
            if (req_interrupt)
                DOUT = out_reg_neg;
        end
        BUS_CONTROL1:
        begin
            if (mode_neg==MODE_RX)
                DOUT = out_reg_neg;
            // Pat Fix
            //else if (req_interrupt)
            else if (req_interrupt_because_error)
                DOUT = out_reg_neg;
        end
        BUS_BACK_TO_IDLE:
        begin
            DOUT = ((~TX_REQ) & DIN & enum_addr_resp[0]);
        end
    endcase
end
always @ *
begin
    // forward clock once interrupt occurred
    COUT = CIN;
    if ((bus_state==BUS_REQ_INTERRUPT)&&(~BUS_INT))
        COUT = 1;
end
flpv3l_mbus_swapper flpv3l_mbus_swapper_0 (
    // inputs
    .CLK(CIN),
    .RESETn(RESETn_local),
    .DATA(DIN),
    .INT_FLAG_RESETn(BUS_INT_RSTn),
    //Outputs
    .LAST_CLK(),
    .INT_FLAG(BUS_INT));
endmodule