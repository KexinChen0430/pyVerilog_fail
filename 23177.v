module or a submodule
  output  reg         o_wbs_int
  //output              o_wbs_int
);
//Local Registers/Wires
reg   [31:0]          control;
reg   [31:0]          status;
wire  [31:0]          prescaler;
reg   [31:0]          clock_div;
reg                   set_clock_div;
wire  [31:0]          default_clock_div;
reg                   write_strobe;
reg   [7:0]           write_data;
wire                  write_full;
wire  [31:0]          write_available;
reg   [15:0]          write_count;
reg   [1:0]           dw_countdown;
wire  [31:0]          write_size;
reg   [1:0]           read_delay;
reg                   read_strobe;
wire  [7:0]           read_data;
wire                  read_empty;
wire  [31:0]          read_count;
wire  [31:0]          read_size;
//Status
wire                  read_overflow;
wire                  write_overflow;
//write data
reg                   write_en;
reg                   read_en;
reg   [1:0]           local_read_count;
//User Request to red this much data
reg   [31:0]          user_read_count;
wire                  reading;
wire                  writing;
reg   [31:0]          interrupt_sleep;
wire                  interrupt_ready;
//Submodules
uart_controller uc  (
  .clk                 (clk                          ),
  .rst                 (rst                          ),
  //Physical Lines
  .rx                  (i_rx                         ),
  .tx                  (o_tx                         ),
  .cts                 (o_cts                        ),
  .rts                 (i_rts                        ),
  //Control/Status
  .control_reset       (control[`CONTROL_RESET]      ),
  .cts_rts_flowcontrol (control[`CONTROL_FC_CTS_RTS] ),
  .read_overflow       (read_overflow                ),
  .prescaler           (prescaler                    ),
  .set_clock_div       (set_clock_div                ),
  .clock_div           (clock_div                    ),
  .default_clock_div   (default_clock_div            ),
  //Data In
  .write_strobe        (write_strobe                 ),
  .write_data          (write_data                   ),
  .write_full          (write_full                   ),
  .write_available     (write_available              ),
  .write_size          (write_size                   ),
  //Data Out
  .read_strobe         (read_strobe                  ),
  .read_data           (read_data                    ),
  .read_empty          (read_empty                   ),
  .read_count          (read_count                   ),
  .read_size           (read_size                    )
);
//Asynchronous Logic
integer         i;
assign          reading   = ((i_wbs_cyc && !i_wbs_we && (read_count > 0) && (i_wbs_adr == `UART_REG_READ)) || read_en);
assign          writing   = (i_wbs_cyc && i_wbs_we && ((write_count > 0) || (i_wbs_adr == `UART_REG_WRITE)));
/*
assign          interrupt_ready = (!o_wbs_ack && !i_wbs_cyc && !write_en && !read_en) &&
                      (user_read_count == 0) &&
                        ((control[`CONTROL_READ_INTERRUPT] && !read_empty) ||
                         (control[`CONTROL_WRITE_INTERRUPT] && !write_full));
*/
assign          interrupt_ready =   (user_read_count == 0) &&
                                    ((control[`CONTROL_READ_INTERRUPT] && !read_empty) ||
                                    (control[`CONTROL_WRITE_INTERRUPT] && !write_full));
//Synchronous Logic
always @ (posedge clk) begin
  if (rst) begin
    o_wbs_dat               <= 32'h0;
    o_wbs_ack               <= 0;
    control                 <=  8'h0;
    write_strobe            <=  0;
    read_strobe             <=  0;
    read_delay              <=  0;
    user_read_count         <=  0;
    local_read_count        <=  0;
    //write
    write_en                <=  0;
    read_en                 <=  0;
    write_count             <=  0;
    dw_countdown            <=  0;
    write_data              <=  0;
    //status
    status                  <=  0;
    set_clock_div           <=  0;
    clock_div               <=  0;
    o_wbs_int               <=  0;
    interrupt_sleep         <=  `INTERRUPT_SLEEP_TIMEOUT;
  end
  else begin
    write_strobe            <=  0;
    set_clock_div           <=  0;
    read_strobe             <=  0;
    control[`CONTROL_RESET] <=  0;
    //Status (Change Strobes from the UART controller to flags for the user)
    if (write_overflow) begin
      status[`STATUS_TRANSMIT_OVERFLOW]   <=  1;
    end
    if (read_overflow) begin
      status[`STATUS_READ_OVERFLOW]       <=  1;
    end
    if (!read_empty) begin
      //Tell the user there is data for them to read
      status[`STATUS_READ_INTERRUPT]      <=  1;
    end
    if (!write_full) begin
      //Tell the user there is room available
      status[`STATUS_WRITE_INTERRUPT]     <=  1;
    end
    //Control
    if (!interrupt_ready) begin
      o_wbs_int         <=  0;
    end
    //Get rid of spurious toggling of interrupts
    if (o_wbs_int) begin
      interrupt_sleep   <=  0;
    end
    else if (interrupt_ready && !o_wbs_int) begin
      if (interrupt_sleep < `INTERRUPT_SLEEP_TIMEOUT) begin
        interrupt_sleep <=  interrupt_sleep + 1;
      end
      else begin
        o_wbs_int       <=  1;
      end
    end
    if (i_wbs_cyc == 0) begin
      //at the end of a cycle disable the special case of writing to the UART FIFO
      write_en                          <=  0;
      read_en                           <=  0;
    end
    //when the master acks our ack, then put our ack down
    if (o_wbs_ack && ~i_wbs_stb)begin
      o_wbs_ack <= 0;
    end
    if (i_wbs_stb && i_wbs_cyc) begin
      //master is requesting somethign
      if (i_wbs_we) begin
        //Continuation of a read
        if (write_en) begin
          if (!o_wbs_ack) begin
            $display ("WBM: Writing a byte write_count == %d, dw_countdown == %d", write_count, dw_countdown);
            if (write_count > 0) begin
              case (dw_countdown)
                0: begin
                  write_data            <=  i_wbs_dat[7:0];
                end
                1: begin
                  write_data            <=  i_wbs_dat[15:8];
                end
                2: begin
                  write_data            <=  i_wbs_dat[23:16];
                end
                3: begin
                  write_data            <=  i_wbs_dat[31:24];
                end
              endcase
              write_strobe              <=  1;
              if (dw_countdown == 0) begin
                o_wbs_ack               <=  1;
                //I KNOW this code is redundant but it is more readible
                dw_countdown            <=  3;
              end
              else begin
                dw_countdown            <=  dw_countdown - 1;
              end
              if (write_count <= 1) begin
                o_wbs_ack               <=  1;
                write_en                <=  0;
                //Consumed all data from the user
              end
              else begin
                write_count             <=  write_count - 1;
              end
            end
            else begin
              o_wbs_ack               <=  1;
            end
          end
        end
        //not a continuation of a write
        else begin
          if (!o_wbs_ack) begin
            case (i_wbs_adr)
              `UART_REG_CONTROL: begin
                control                 <=  i_wbs_dat[31:0];
                o_wbs_ack               <=  1;
              end
              `UART_REG_STATUS: begin
                //USER CANNOT WRITE ANYTHING TO STATUS
                o_wbs_ack               <=  1;
              end
              `UART_REG_PRESCALER: begin
                //USER CANNOT WRITE ANYTHING TO PRESCALER
                o_wbs_ack               <=  1;
              end
              `UART_REG_CLOCK_DIV: begin
                //the host will have to calculate out the baudrate
                clock_div               <=  i_wbs_dat[31:0];
                set_clock_div           <=  1;
                $display("WBM: user wrote %h", i_wbs_dat);
                o_wbs_ack               <=  1;
              end
              `UART_REG_WRITE_COUNT: begin
                //USER CANNOT WRITE ANYTHING TO WRITE COUNT
                o_wbs_ack               <=  1;
              end
              `UART_REG_WRITE: begin
                if (!o_wbs_ack) begin
                  $display ("WBM: Starting a write cycle");
                  //this is where the start of a UART write will begin, subsequent burst reads after this will be written to a output FIFO
                  //I need a flag that will inidicate that the user will be writting to the buffer
                  //write register
                  write_en                <=  1;
                  dw_countdown            <=  1;
                  if (i_wbs_dat[31:16] == 0) begin
                    write_count           <=  0;
                    write_en              <=  0;
                  end
                  else begin
                    write_count           <=  i_wbs_dat[31:16];
                  end
                end
              end
              `UART_REG_READ_COUNT: begin
                //USER CANNOT WRITE ANYTHING TO READ COUNT
                user_read_count         <=  i_wbs_dat;
                o_wbs_ack               <=  1;
              end
              `UART_REG_READ: begin
                //USER CANNOT WRITE ANYTHING TO THE READ
                o_wbs_ack               <=  1;
              end
              default: begin
                o_wbs_ack               <=  1;
              end
            endcase
          end
        end
      end
      else begin
        if (read_en) begin
          if (o_wbs_ack == 0) begin
              if (read_delay > 0) begin
              read_delay  <=  read_delay - 1;
            end
            else begin
              $display ("WB_UART (%g): Reading a byte user_read_count == %d, local_read_count == %d", $time, user_read_count, local_read_count);
              $display ("WB_UART: Data: 0x%h \"%s\"", read_data, read_data);
              //I can't use a normal shift register because the first value won't be at the end if the user
              //specifies anything below a multiple of 4
              case (local_read_count)
                0: begin
                  //$display ("WB_UART (%g): putting read data into the top byte", $time);
                  o_wbs_dat[31:24]  <=  read_data;
                  o_wbs_dat[23:0]   <=  0;
                  read_strobe       <=  1;
                  read_delay        <=  2;
                end
                1: begin
                  o_wbs_dat[23:16]  <=  read_data;
                  read_strobe       <=  1;
                  read_delay        <=  2;
                end
                2: begin
                  o_wbs_dat[15:8]  <=  read_data;
                  read_strobe       <=  1;
                  read_delay        <=  2;
                end
                3: begin
                  o_wbs_dat[7:0]  <=  read_data;
                  read_strobe       <=  1;
                  read_delay        <=  2;
                end
              endcase
              if (local_read_count == 3) begin
                $display ("WB_UART (%g): Sending an Ack for a  32 bit data packet to the host", $time);
                o_wbs_ack         <=  1;
              end
              if (user_read_count == 0) begin
                $display ("WB_UART (%g): Finished reading all the user's data", $time);
                o_wbs_ack         <=  1;
                read_en           <=  0;
              end
              else begin
                local_read_count  <=  local_read_count + 1;
                user_read_count   <=  user_read_count - 1;
              end
              if (read_count == 0) begin
                local_read_count  <=  0;
                $display ("WB_UART (%g): Read FIFO is empty", $time);
                o_wbs_ack         <=  1;
              end
            end
          end
        end
        else begin
          //read request
          if (!o_wbs_ack) begin
            case (i_wbs_adr)
              `UART_REG_CONTROL: begin
                o_wbs_dat <= control;
                o_wbs_ack <= 1;
              end
              `UART_REG_STATUS: begin
                //reset all status flags on a READ
                o_wbs_dat                                 <= status;
                status[`STATUS_TRANSMIT_OVERFLOW]         <=  0;
                status[`STATUS_READ_OVERFLOW]             <=  0;
                status[`STATUS_READ_UNDERFLOW]            <=  0;
                status[`STATUS_READ_INTERRUPT]            <=  0;
                status[`STATUS_WRITE_INTERRUPT]           <=  0;
                o_wbs_ack                                 <=  1;
              end
              `UART_REG_PRESCALER: begin
                o_wbs_dat           <= prescaler;
                o_wbs_ack <= 1;
              end
              `UART_REG_CLOCK_DIV: begin
                if (clock_div ==  0) begin
                  o_wbs_dat         <=  default_clock_div;
                end
                else begin
                  o_wbs_dat         <= clock_div;
                end
                o_wbs_ack <= 1;
              end
              `UART_REG_WRITE_COUNT: begin
                o_wbs_dat           <=  write_available;
                o_wbs_ack <= 1;
              end
              `UART_REG_WRITE: begin
                o_wbs_dat           <=  32'h00000000;
                o_wbs_ack <= 1;
              end
              `UART_REG_READ_COUNT: begin
                o_wbs_dat           <=  read_count;
                o_wbs_ack <= 1;
              end
              `UART_REG_READ: begin
                $display ("WB_UART: User requested data");
                if (read_count > 0) begin
                  read_en           <=  1;
                  read_strobe       <=  0;
                  //reset the 8-bit -> 32-bit converter counter
                  local_read_count  <=  0;
                  o_wbs_dat         <=  0;
                  o_wbs_dat[31:24]  <=  read_data;
                  o_wbs_dat[23:0]   <=  0;
                  if (user_read_count > 1) begin
                    read_delay      <=  2;
                    //user has specified an amount of data to read
                    local_read_count  <=  0;
                    //decrement the user_read_count because we are requesting a byte right now
                    if (user_read_count >= 2) begin
                      user_read_count <=  user_read_count - 1;
                    end
                  end
                  else begin
                    read_delay        <=  2;
                    local_read_count  <=  0;
                    user_read_count   <=  0;
                  end
                end
                else begin
                  //no data just return 0
                  o_wbs_dat <=  32'h00000000;
                  status[`STATUS_READ_UNDERFLOW]  <=  1;
                end
              end
              default: begin
                o_wbs_dat <=  32'h00000000;
              end
            endcase
          end
        end
      end
      if (!reading && !writing) begin
        o_wbs_ack <= 1;
      end
    end
  end
end
endmodule