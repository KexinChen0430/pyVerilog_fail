module generates a serial BAUD clock automatically.
// The unit synchronizes on the carriage return character, so the user
// only needs to press the "enter" key for serial communications to start
// working, no matter what BAUD rate and clk_i frequency are used!
auto_baud #(
            `CLOCK_FACTOR,    // CLOCK_FACTOR_PP
            16                // LOG2_MAX_COUNT_PP
            )
  clock_unit_2
  (
  .clk_i(clk_i),
  .reset_i(reset_i),
  .serial_dat_i(rs232_rxd_i),
  .auto_baud_locked_o(),
  .baud_clk_o(serial_clk)
  );
/*
auto_baud_with_tracking #(
                          `CLOCK_FACTOR,    // CLOCK_FACTOR_PP
                          16                // LOG2_MAX_COUNT_PP
                          )
  clock_unit_2
  (
  .clk_i(clk_i),
  .reset_i(reset_i),
  .serial_dat_i(rs232_rxd_i),
  .auto_baud_locked_o(),
  .baud_clk_o(serial_clk)
  );
*/
// A transmitter, which asserts load_request at the end of the currently
// transmitted word.  The tx_clk must be a "clock enable" (narrow positive
// pulse) which occurs at 16x the desired transmit rate.  If load_request
// is connected directly to load, the unit will transmit continuously.
rs232tx #(
          `START_BITS,   // start_bits
          `DATA_BITS,    // data_bits
          `STOP_BITS,    // stop_bits (add intercharacter delay...)
          `CLOCK_FACTOR  // clock_factor
         )
         rs232_tx_block // instance name
         (
          .clk(clk_i),
          .tx_clk(serial_clk),
          .reset(reset_i),
          .load(rs232_tx_load),
          .data(rs232_tx_char),
          .load_request(rs232_tx_load_request),
          .txd(rs232_txd_o)
         );
// A receiver, which asserts "word_ready" to indicate a received word.
// Asserting "read_word" will cause "word_ready" to go low again if it was high.
// The character is held in the output register, during the time the next
//   character is coming in.
rs232rx #(
          `START_BITS,  // start_bits
          `DATA_BITS,   // data_bits
          `STOP_BITS,   // stop_bits
          `CLOCK_FACTOR // clock_factor
         )
         rs232_rx_block // instance name
         (
          .clk(clk_i),
          .rx_clk(serial_clk),
          .reset(reset_i || (| rs232_rx_error)),
          .rxd(rs232_rxd_i),
          .read(rs232_tx_load),
          .data(rs232_rx_char),
          .data_ready(rs232_rx_data_ready),
          .error_over_run(rs232_rx_error[0]),
          .error_under_run(rs232_rx_error[1]),
          .error_all_low(rs232_rx_error[2])
         );
//`undef START_BITS
//`undef DATA_BITS
//`undef STOP_BITS
//`undef CLOCK_FACTOR
// Module code
assign adr_o = master_bg_i?adr_ptr:master_adr_i;
assign we_o = master_bg_i?we_l:master_we_i;
assign stb_o = master_bg_i?stb_l:master_stb_i;
//assign dat_io = (master_bg_i && we_l && stb_l)?
                   //dat_sr:{`NIBBLE_SIZE*DAT_DIGITS_PP{1'bZ}};
assign data_out = (master_bg_i && we_l && stb_l)?
                   dat_sr:{`NIBBLE_SIZE*DAT_DIGITS_PP{1'bZ}};
//assign data_in = (master_bg_i && we_l && stb_l)?
  //                 dat_sr:{`NIBBLE_SIZE*DAT_DIGITS_PP{1'bZ}};
// Temporary
assign cyc_o = stb_o;  // Separate cyc_o is not yet supported!
// This is the adress offset counter
always @(posedge clk_i)
begin
  if (reset_i || reset_adr_offset) adr_offset <= 0;
  else if (incr_adr_offset) adr_offset <= adr_offset + 1;
end
// This forms the adress pointer which is used on the bus.
assign adr_ptr = adr_sr + adr_offset;
// This is the ROM for the ASCII characters to be transmitted.
always @(msg_pointer)
begin
  case (msg_pointer) // synthesis parallel_case
    5'b00000 : msg_char <= "0";    // Hexadecimal characters
    5'b00001 : msg_char <= "1";
    5'b00010 : msg_char <= "2";
    5'b00011 : msg_char <= "3";
    5'b00100 : msg_char <= "4";
    5'b00101 : msg_char <= "5";
    5'b00110 : msg_char <= "6";
    5'b00111 : msg_char <= "7";
    5'b01000 : msg_char <= "8";
    5'b01001 : msg_char <= "9";
    5'b01010 : msg_char <= "A";    // Address error indication
    5'b01011 : msg_char <= "B";
    5'b01100 : msg_char <= "C";    // Command error indication
    5'b01101 : msg_char <= "D";    // Data error indication
    5'b01110 : msg_char <= "E";
    5'b01111 : msg_char <= "F";
    5'b10000 : msg_char <= " ";    // Space
    5'b10001 : msg_char <= ":";    // Colon
    5'b10010 : msg_char <= " ";    // Space
    5'b10011 : msg_char <= "?";    // Parse error indication
    5'b10100 : msg_char <= "!";    // ack_i/err_i error indication
    5'b10101 : msg_char <= "O";    // "All is well" message
    5'b10110 : msg_char <= "K";
    5'b10111 : msg_char <= 8'h0d;  // Carriage return & line feed
    5'b11000 : msg_char <= 8'h0a;
    5'b11001 : msg_char <= "-";    // Command Prompt
    5'b11010 : msg_char <= ">";
    5'b11011 : msg_char <= " ";
    5'b11100 : msg_char <= "Q";    // Quantity error indication
    default  : msg_char <= "=";
  endcase
end
// This logic determines when to load a transmit character.
assign rs232_tx_load = rs232_echo?
  (rs232_rx_data_ready && rs232_tx_load_request):rs232_tx_load_request;
// This is the counter for incrementing, decrementing or resetting the
// message pointer.
always @(posedge clk_i)
begin
  if (reset_i || reset_msg_offset) msg_offset <= 0;
  else if (incr_msg_offset) msg_offset <= msg_offset + 1;
end
assign msg_pointer = msg_offset + msg_base;
// This is the mux which selects whether to echo back the characters
// received (as during the entering of a command) or to send back response
// characters.
assign rs232_tx_char = (rs232_echo)?rs232_rx_char:msg_char;
// These assigments are for detecting whether the received rs232 character is
// anything of special interest.
assign rx_char_is_enter = (rs232_rx_char == 8'h0d);
assign rx_char_is_backspace = (rs232_rx_char == 8'h08);
// This is state machine m1.  It handles receiving the command line, including
// backspaces, and prints error/response messages.  It also parses and
// executes the commands.
// State register
always @(posedge clk_i)
begin : m1_state_register
  if (reset_i) m1_state <= m1_initial_state; // perform reset for rest of system
  else m1_state <= m1_next_state;
end
// State transition logic
always @(m1_state
         or rx_char_is_enter
         or rx_char_is_backspace
         or msg_offset
         or cmd_ptr
         or rs232_tx_load
         or char_is_whitespace
         or char_is_hex
         or char_is_enter
         or char_is_i
         or char_is_r
         or char_is_w
         or command
         or master_bg_i
         or watchdog_timer_done
         or err_i
         or ack_i
         or adr_offset
         or qty_sr
         or dat_sr
         or rd_adr_sr
         or rd_field_count
         or rd_digit_count
         )
begin : m1_state_logic
  // Default values for outputs.  The individual states can override these.
  msg_base <= 5'b0;
  reset_msg_offset <= 0;
  incr_msg_offset <= 0;
  rs232_echo <= 0;
  rst_o <= 0;
  we_l <= 0;
  stb_l <= 0;
  cmd_buffer_write <= 0;
  reset_cmd_ptr <= 0;
  incr_cmd_ptr <= 0;
  decr_cmd_ptr <= 0;
  master_br_o <= 0;
  cmd_r <= 0;
  cmd_w <= 0;
  cmd_i <= 0;
  shift_rd_adr <= 0;
  store_adr <= 0;          // enables storing hex chars in adr_sr (shift)
  store_dat <= 0;          // enables storing hex chars in dat_sr (shift)
  store_qty <= 0;          // enables storing hex chars in qty_sr (shift)
  reset_adr <= 0;
  reset_dat <= 0;
  reset_qty <= 0;
  init_qty <= 0;
  capture_dat <= 0;        // enables capturing bus data in dat_sr (load)
  incr_adr_offset <= 0;
  reset_adr_offset <= 0;
  reset_watchdog <= 0;
  incr_rd_field_count <= 0;
  incr_rd_digit_count <= 0;
  reset_rd_field_count <= 0;
  reset_rd_digit_count <= 0;
  case (m1_state) // synthesis parallel_case
    m1_initial_state :
      begin
        incr_msg_offset <= rs232_tx_load;
        if ((msg_offset == 15) && rs232_tx_load) begin
          m1_next_state <= m1_send_prompt;
          reset_msg_offset <= 1;
        end
        else m1_next_state <= m1_initial_state;
      end
    m1_send_ok :
      begin
        msg_base <= 5'b10101;     // Address of the OK message
        incr_msg_offset <= rs232_tx_load;
        if ((msg_offset == 1) && rs232_tx_load) begin
          m1_next_state <= m1_send_prompt;
          reset_msg_offset <= 1;
        end
        else m1_next_state <= m1_send_ok;
      end
    m1_send_prompt :
      begin
        msg_base <= 5'b10111;     // Address of the cr,lf,prompt message
        incr_msg_offset <= rs232_tx_load;
        if ((msg_offset == 4) && rs232_tx_load) begin
          m1_next_state <= m1_check_received_char;
          reset_cmd_ptr <= 1;
        end
        else m1_next_state <= m1_send_prompt;
      end
    // This state always leads to activating the parser...
    m1_send_crlf :
      begin
        msg_base <= 5'b10111;     // Address of the cr/lf message
        incr_msg_offset <= rs232_tx_load;
        if ((msg_offset == 1) && rs232_tx_load) begin
          m1_next_state <= m1_scan_command;
          reset_cmd_ptr <= 1;
        end
        else m1_next_state <= m1_send_crlf;
      end
    m1_check_received_char :
      begin
        rs232_echo <= 1;          // Allow echoing of characters
        if (rx_char_is_backspace && rs232_tx_load)
        begin
          m1_next_state <= m1_check_received_char;
          decr_cmd_ptr <= 1;     // This effectively eliminates the last char
        end
        else if (rx_char_is_enter && rs232_tx_load)
        begin
          m1_next_state <= m1_send_crlf;
          cmd_buffer_write <= 1;  // Store the enter as "marker" for parsing
          reset_msg_offset <= 1;
        end
        else if (rs232_tx_load && (cmd_ptr == CMD_BUFFER_SIZE_PP-1))
        begin
          m1_next_state <= m1_parse_error_indicator_crlf;
          reset_msg_offset <= 1;
          reset_cmd_ptr <= 1;
        end
        else if (rs232_tx_load)
        begin
          incr_cmd_ptr <= 1;
          cmd_buffer_write <= 1;
          m1_next_state <= m1_check_received_char;
        end
        else m1_next_state <= m1_check_received_char;
      end
    m1_bg_error_indicator :
      begin
        msg_base <= 5'b01011;    // Address of the B character
        incr_msg_offset <= rs232_tx_load;
        if ((msg_offset == 0) && rs232_tx_load) begin
          m1_next_state <= m1_ack_error_indicator;
          reset_msg_offset <= 1;
        end
        else m1_next_state <= m1_bg_error_indicator;
      end
    m1_ack_error_indicator :
      begin
        msg_base <= 5'b10100;    // Address of the ! error message
        incr_msg_offset <= rs232_tx_load;
        if ((msg_offset == 0) && rs232_tx_load) begin
          m1_next_state <= m1_send_prompt;
          reset_msg_offset <= 1;
        end
        else m1_next_state <= m1_ack_error_indicator;
      end
    // This state is used when the line is too long...
    m1_parse_error_indicator_crlf :
      begin
        msg_base <= 5'b10111;    // Address of the cr,lf message.
        incr_msg_offset <= rs232_tx_load;
        if ((msg_offset == 1) && rs232_tx_load) begin
          m1_next_state <= m1_parse_error_indicator;
          reset_msg_offset <= 1;
        end
        else m1_next_state <= m1_parse_error_indicator_crlf;
      end
    m1_parse_error_indicator :
      begin
        msg_base <= 5'b10011;    // Address of the ? message.
        incr_msg_offset <= rs232_tx_load;
        if ((msg_offset == 0) && rs232_tx_load) begin
          m1_next_state <= m1_send_prompt;
          reset_msg_offset <= 1;
        end
        else m1_next_state <= m1_parse_error_indicator;
      end
    m1_cmd_error_indicator :
      begin
        msg_base <= 5'b01100;    // Address of 'C'
        incr_msg_offset <= rs232_tx_load;
        if ((msg_offset == 0) && rs232_tx_load) begin
          m1_next_state <= m1_parse_error_indicator;
          reset_msg_offset <= 1;
        end
        else m1_next_state <= m1_cmd_error_indicator;
      end
    m1_adr_error_indicator :
      begin
        msg_base <= 5'b01010;    // Address of 'A'
        incr_msg_offset <= rs232_tx_load;
        if ((msg_offset == 0) && rs232_tx_load)
        begin
          m1_next_state <= m1_parse_error_indicator;
          reset_msg_offset <= 1;
        end
        else m1_next_state <= m1_adr_error_indicator;
      end
    m1_dat_error_indicator :
      begin
        msg_base <= 5'b01101;    // Address of 'D'
        incr_msg_offset <= rs232_tx_load;
        if ((msg_offset == 0) && rs232_tx_load)
        begin
          m1_next_state <= m1_parse_error_indicator;
          reset_msg_offset <= 1;
        end
        else m1_next_state <= m1_dat_error_indicator;
      end
    m1_qty_error_indicator :
      begin
        msg_base <= 5'b11100;    // Address of 'Q'
        incr_msg_offset <= rs232_tx_load;
        if ((msg_offset == 0) && rs232_tx_load)
        begin
          m1_next_state <= m1_parse_error_indicator;
          reset_msg_offset <= 1;
        end
        else m1_next_state <= m1_qty_error_indicator;
      end
    // The following states are for parsing and executing the command.
    // This state takes care of leading whitespace before the command
    m1_scan_command :
      begin
        rs232_echo <= 1;          // Don't send message characters
        reset_msg_offset <= 1;    // This one reset should cover all of the
                                  // parse/exec. states.  With rs232_echo
                                  // on, and no receive characters arrive,
                                  // then the msg_offset will remain reset.
                                  // This means the watchdog timer can take
                                  // a long time, if need be, during exec.
                                  // (NOTE: It might be better to disable
                                  //  the echoing of rx chars during these
                                  //  states.)
        init_qty <= 1;         // Set qty = 1 by default.  That can be
                               // overridden later, if the command has
                               // a different qty field.
        if (char_is_whitespace) begin
          m1_next_state <= m1_scan_command;
          incr_cmd_ptr <= 1;
        end
        else if (char_is_r) begin
          m1_next_state <= m1_scan_adr_whitespace;
          incr_cmd_ptr <= 1;
          cmd_r <= 1;
        end
        else if (char_is_w) begin
          m1_next_state <= m1_scan_adr_whitespace;
          incr_cmd_ptr <= 1;
          cmd_w <= 1;
        end
        else if (char_is_i) begin
          m1_next_state <= m1_start_execution;
          cmd_i <= 1;
        end
        else m1_next_state <= m1_cmd_error_indicator;
      end
    // The only way to determine the end of a valid field is to find
    // whitespace.  Therefore, char_is_whitespace must be used as an exit
    // condition from the "get_xxx_field" states.  So, this state is used to
    // scan through any leading whitespace prior to it.
    m1_scan_adr_whitespace :
      begin
        rs232_echo <= 1;          // Don't send message characters
        if (char_is_whitespace) begin
          m1_next_state <= m1_scan_adr_whitespace;
          incr_cmd_ptr <= 1;
        end
        else if (char_is_enter) m1_next_state <= m1_start_execution;
        else begin
          m1_next_state <= m1_get_adr_field;
          reset_adr <= 1;
        end
      end
    m1_get_adr_field :
      begin
        rs232_echo <= 1;          // Don't send message characters
        if (char_is_hex) begin
          m1_next_state <= m1_get_adr_field;
          store_adr <= 1;
          incr_cmd_ptr <= 1;
        end
        else if (char_is_whitespace) begin            // Normal exit
          m1_next_state <= m1_scan_dat_whitespace;
        end
        else if (char_is_enter) m1_next_state <= m1_start_execution;
        else m1_next_state <= m1_adr_error_indicator;
      end
    m1_scan_dat_whitespace :
      begin
        rs232_echo <= 1;          // Don't send message characters
        // There is no DAT field for reads, so skip it.
        if (command == `CMD_R) m1_next_state <= m1_scan_qty_whitespace;
        else if (char_is_whitespace) begin
          m1_next_state <= m1_scan_dat_whitespace;
          incr_cmd_ptr <= 1;
        end
        else if (char_is_enter) m1_next_state <= m1_start_execution;
        else begin
          m1_next_state <= m1_get_dat_field;
          reset_dat <= 1;
        end
      end
    m1_get_dat_field :
      begin
        rs232_echo <= 1;          // Don't send message characters
        if (char_is_hex) begin
          m1_next_state <= m1_get_dat_field;
          store_dat <= 1;
          incr_cmd_ptr <= 1;
        end
        else if (char_is_whitespace) begin            // Normal exit
          m1_next_state <= m1_scan_qty_whitespace;
        end
        else if (char_is_enter) m1_next_state <= m1_start_execution;
        else m1_next_state <= m1_dat_error_indicator;
      end
    m1_scan_qty_whitespace :
      begin
        rs232_echo <= 1;          // Don't send message characters
        if (char_is_whitespace) begin
          m1_next_state <= m1_scan_qty_whitespace;
          incr_cmd_ptr <= 1;
        end
        else if (char_is_enter) m1_next_state <= m1_start_execution;
        else begin
          m1_next_state <= m1_get_qty_field;
          reset_qty <= 1;
        end
      end
    m1_get_qty_field :
      begin
        rs232_echo <= 1;          // Don't send message characters
        if (char_is_hex) begin
          m1_next_state <= m1_get_qty_field;
          store_qty <= 1;
          incr_cmd_ptr <= 1;
        end
        else if (char_is_whitespace || char_is_enter) begin  // Normal exit
          m1_next_state <= m1_start_execution;
        end
        else m1_next_state <= m1_qty_error_indicator;
      end
    // This state seeks to obtain master_bg_i, which grants the bus to
    // rs232_syscon.
    m1_start_execution :
      begin
        rs232_echo <= 1;           // Don't send message characters
        reset_watchdog <= 1;       // Reset the timer.
        reset_adr_offset <= 1;     // Reset the address offset.
        reset_rd_field_count <= 1; // Reset the rd_field_count.
        m1_next_state <= m1_request_bus;
      end
    m1_request_bus :
      begin
        rs232_echo <= 1;          // Don't send message characters
        master_br_o <= 1;         // Request the bus.
        if (master_bg_i) m1_next_state <= m1_bus_granted;
        else if (watchdog_timer_done) begin
          m1_next_state <= m1_bg_error_indicator;
        end
        else m1_next_state <= m1_request_bus;
      end
    m1_bus_granted :
      begin
        rs232_echo <= 1;          // Don't send message characters
        master_br_o <= 1;         // Keep holding the bus
        reset_watchdog <= 1;      // Reset the timer.
        if (adr_offset != qty_sr) m1_next_state <= m1_execute;
        else m1_next_state <= m1_send_ok;
      end
    // This single state does reset/write/read depending upon the value
    // contained in "command"!
    m1_execute :
      begin
        rs232_echo <= 1;          // Don't send message characters
        master_br_o <= 1;         // Keep holding the bus
        stb_l <= 1'b1;            // Show that a bus cycle is happening
        case (command)            // Assert the appropriate signals
          `CMD_I : rst_o <= 1;
          `CMD_R : capture_dat <= ack_i;
          `CMD_W : we_l <= 1;
          default: ;
        endcase
        if (watchdog_timer_done || err_i) begin
          m1_next_state <= m1_ack_error_indicator;
        end
        else if (ack_i
                 && (command == `CMD_R)
                 && (rd_field_count == 0)
                 )
        begin
          m1_next_state <= m1_rd_send_adr_sr; // Leads to a new address line.
          reset_rd_digit_count <= 1;
          incr_adr_offset <= 1;               // move to the next address
        end
        else if (ack_i && (command == `CMD_R)) begin
          m1_next_state <= m1_rd_send_dat_sr; // Leads to a new data field.
          reset_rd_digit_count <= 1;
          reset_msg_offset <= 1;
          incr_adr_offset <= 1;             // move to the next address
        end
        else if (ack_i) begin
          m1_next_state <= m1_bus_granted;  // continue to the next cycle
          incr_adr_offset <= 1;             // move to the next address
        end
        else m1_next_state <= m1_execute;
      end
    m1_rd_send_adr_sr :
      begin
        msg_base <= {1'b0,rd_adr_sr[`NIBBLE_SIZE*ADR_DIGITS_PP-1:
                                    `NIBBLE_SIZE*(ADR_DIGITS_PP-1)]};
        if ((rd_digit_count == ADR_DIGITS_PP-1) && rs232_tx_load) begin
          m1_next_state <= m1_rd_send_separator;
          reset_msg_offset <= 1;
        end
        else if (rs232_tx_load) begin
          shift_rd_adr <= 1;
          incr_rd_digit_count <= 1;
          m1_next_state <= m1_rd_send_adr_sr;
        end
        else m1_next_state <= m1_rd_send_adr_sr;
      end
    m1_rd_send_separator :
      begin
        msg_base <= 5'b10000;    // Address of the separator message
        incr_msg_offset <= rs232_tx_load;
        if ((msg_offset == 2) && rs232_tx_load)
        begin
          m1_next_state <= m1_rd_send_dat_sr;
          reset_rd_digit_count <= 1;
          reset_msg_offset <= 1;
        end
        else m1_next_state <= m1_rd_send_separator;
      end
    m1_rd_send_dat_sr :
      begin
        msg_base <= {1'b0,dat_sr[`NIBBLE_SIZE*DAT_DIGITS_PP-1:
                                 `NIBBLE_SIZE*(DAT_DIGITS_PP-1)]};
        if (
            (rd_digit_count == DAT_DIGITS_PP-1)
            && (rd_field_count == RD_FIELDS_PP-1)
            && rs232_tx_load
            )
        begin
          m1_next_state <= m1_rd_send_crlf;
          reset_rd_field_count <= 1;
        end
        else if ((rd_digit_count == DAT_DIGITS_PP-1) && rs232_tx_load) begin
          m1_next_state <= m1_rd_send_space;
          incr_rd_field_count <= 1;
        end
        else if (rs232_tx_load) begin
            store_dat <= 1;
            incr_rd_digit_count <= 1;
            m1_next_state <= m1_rd_send_dat_sr;
        end
        else m1_next_state <= m1_rd_send_dat_sr;
      end
    m1_rd_send_space :
      begin
        msg_base <= 5'b10000;    // Address of the space
        incr_msg_offset <= rs232_tx_load;
        if ((msg_offset == 0) && rs232_tx_load) begin
          m1_next_state <= m1_bus_granted;
          reset_msg_offset <= 1;
        end
        else m1_next_state <= m1_rd_send_space;
      end
    m1_rd_send_crlf :
      begin
        msg_base <= 5'b10111;     // Address of the cr/lf message
        incr_msg_offset <= rs232_tx_load;
        if ((msg_offset == 1) && rs232_tx_load) begin
          m1_next_state <= m1_bus_granted;
          reset_msg_offset <= 1;
        end
        else m1_next_state <= m1_rd_send_crlf;
      end
    default : m1_next_state <= m1_initial_state;
  endcase
end
// This is the counter for incrementing or loading the cmd_ptr
always @(posedge clk_i)
begin
  if (reset_i || reset_cmd_ptr) cmd_ptr <= 0;
  else if (decr_cmd_ptr) cmd_ptr <= cmd_ptr - 1;
  else if (incr_cmd_ptr) cmd_ptr <= cmd_ptr + 1;
end
// This is the command buffer writing section
always @(posedge clk_i)
begin
  if (rs232_echo && cmd_buffer_write) cmd_buffer[cmd_ptr] <= rs232_rx_char;
end
// This is the command buffer reading section
assign cmd_char = cmd_buffer[cmd_ptr];
assign lc_cmd_char = (cmd_buffer[cmd_ptr] | 8'h20); // lowercase
// These assigments are for detecting whether the cmd_char is
// anything of special interest.
assign char_is_enter = (cmd_char == 8'h0d);          // enter
assign char_is_whitespace = (
                                (cmd_char == " ")    // space
                             || (cmd_char == 8'h09)  // tab
                             );
assign char_is_num = ((cmd_char>=8'h30)&&(cmd_char<=8'h39));
assign char_is_a_f = ((lc_cmd_char>=8'h61)&&(lc_cmd_char<=8'h66));
assign char_is_hex = ( char_is_num || char_is_a_f );
assign char_is_r = (lc_cmd_char == "r");
assign char_is_w = (lc_cmd_char == "w");
assign char_is_i = (lc_cmd_char == "i");
assign hex_digit = char_is_num?cmd_char[3:0]:(cmd_char[3:0]+9);
// This is the command register.  It stores the type of command to execute.
// This is so that the state machine can parse address, data and qty
// into "generic" storage locations, and then when it executes the command,
// it refers back to this register in order to determine what type of
// operation to perform.
always @(posedge clk_i)
begin
  if (reset_i) command <= `CMD_0;
  else if (cmd_i) command <= `CMD_I;
  else if (cmd_r) command <= `CMD_R;
  else if (cmd_w) command <= `CMD_W;
end
// This is the "nibble" shift register for the address which is sent character
// by character to the user.  It is loaded each time the adr_offset is
// incremented, in order to save the previous address for use in printing
// to the user.
always @(posedge clk_i)
begin
  if (reset_i || reset_adr) rd_adr_sr <= 0;
  else if (incr_adr_offset) rd_adr_sr <= adr_ptr;
  else if (shift_rd_adr) begin
    rd_adr_sr[`NIBBLE_SIZE*ADR_DIGITS_PP-1:`NIBBLE_SIZE] <=
      rd_adr_sr[`NIBBLE_SIZE*(ADR_DIGITS_PP-1)-1:0];
    rd_adr_sr[`NIBBLE_SIZE-1:0] <= {`NIBBLE_SIZE{1'b0}};
  end
end
// These are the "nibble" shift registers.  They handle loading the
// hexadecimal digits from the command line.
always @(posedge clk_i)
begin
  if (reset_i || reset_adr) adr_sr <= 0;
  else if (store_adr) begin
    adr_sr[`NIBBLE_SIZE*ADR_DIGITS_PP-1:`NIBBLE_SIZE] <=
      adr_sr[`NIBBLE_SIZE*(ADR_DIGITS_PP-1)-1:0];
    adr_sr[`NIBBLE_SIZE-1:0] <= hex_digit;
  end
end
always @(posedge clk_i)
begin
  if (reset_i || reset_dat) dat_sr <= 0;
  else if (capture_dat) dat_sr <= data_in;
  //else if (capture_dat) dat_sr <= data_out;
  else if (store_dat) begin
    dat_sr[`NIBBLE_SIZE*DAT_DIGITS_PP-1:`NIBBLE_SIZE] <=
      dat_sr[`NIBBLE_SIZE*(DAT_DIGITS_PP-1)-1:0];
    dat_sr[`NIBBLE_SIZE-1:0] <= hex_digit;
  end
end
always @(posedge clk_i)
begin
  if (reset_i || reset_qty) qty_sr <= 0;
  else if (init_qty) qty_sr <= 1;
  else if (store_qty) begin
    qty_sr[`NIBBLE_SIZE*QTY_DIGITS_PP-1:`NIBBLE_SIZE] <=
      qty_sr[`NIBBLE_SIZE*(QTY_DIGITS_PP-1)-1:0];
    qty_sr[`NIBBLE_SIZE-1:0] <= hex_digit;
  end
end
// This is the rd_digit_count counter.  It is used for counting digits
// displayed of both the adr_sr and dat_sr, so it must be able to count up
// to the extent of the larger of the two...
always @(posedge clk_i)
begin
  if (reset_i || reset_rd_digit_count) rd_digit_count <= 0;
  else if (incr_rd_digit_count) rd_digit_count <= rd_digit_count + 1;
end
// This is the rd_field_count counter.  It is used for counting dat_sr fields
// displayed per line.
always @(posedge clk_i)
begin
  if (reset_i || reset_rd_field_count) rd_field_count <= 0;
  else if (incr_rd_field_count) rd_field_count <= rd_field_count + 1;
end
// This is the watchdog timer counter
// The watchdog timer is always "enabled" to operate.
always @(posedge clk_i)
begin
  if (reset_i || reset_watchdog) watchdog_timer_count <= 0;
  else if (~watchdog_timer_done)
    watchdog_timer_count <= watchdog_timer_count + 1;
end
assign watchdog_timer_done = (watchdog_timer_count==WATCHDOG_TIMER_VALUE_PP);
endmodule