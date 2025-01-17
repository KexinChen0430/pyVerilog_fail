module body
    // generate internal reset
    wire rst_i = arst_i ^ ARST_LVL;
    // generate wishbone signals
    wire wb_wacc = wb_cyc_i & wb_stb_i & wb_we_i;
    // generate acknowledge output signal
    always @(posedge wb_clk_i or negedge rst_i)
    //always @(posedge wb_clk_i)//Bob: Here the ack is X by default, so add the rst here
      if (!rst_i)
        wb_ack_o <= #1 1'b0;
      else
        wb_ack_o <= #1 wb_cyc_i & wb_stb_i & ~wb_ack_o; // because timing is always honored
    // assign DAT_O
    always @(posedge wb_clk_i)
    begin
      case (wb_adr_i) // synopsis parallel_case
        3'b000: wb_dat_o <= #1 prer[ 7:0];
        3'b001: wb_dat_o <= #1 prer[15:8];
        3'b010: wb_dat_o <= #1 ctr;
        3'b011: wb_dat_o <= #1 rxr; // write is transmit register (txr)
        3'b100: wb_dat_o <= #1 sr;  // write is command register (cr)
        3'b101: wb_dat_o <= #1 txr;
        3'b110: wb_dat_o <= #1 cr;
        3'b111: wb_dat_o <= #1 0;   // reserved
      endcase
    end
    // generate registers
    always @(posedge wb_clk_i or negedge rst_i)
      if (!rst_i)
        begin
            prer <= #1 16'hffff;
            ctr  <= #1  8'h0;
            txr  <= #1  8'h0;
        end
      else if (wb_rst_i)
        begin
            prer <= #1 16'hffff;
            ctr  <= #1  8'h0;
            txr  <= #1  8'h0;
        end
      else
        if (wb_wacc)
          case (wb_adr_i) // synopsis parallel_case
             3'b000 : prer [ 7:0] <= #1 wb_dat_i;
             3'b001 : prer [15:8] <= #1 wb_dat_i;
             3'b010 : ctr         <= #1 wb_dat_i;
             3'b011 : txr         <= #1 wb_dat_i;
             //default: ; //Bob: here have a lint warning, so commented it out
          endcase
    // generate command register (special case)
    always @(posedge wb_clk_i or negedge rst_i)
      if (~rst_i)
        cr <= #1 8'h0;
      else if (wb_rst_i)
        cr <= #1 8'h0;
      else if (wb_wacc)
        begin
            if (core_en & (wb_adr_i == 3'b100) )
              cr <= #1 wb_dat_i;
        end
      else
        begin
            if (done | i2c_al)
              cr[7:4] <= #1 4'h0;           // clear command bits when done
                                            // or when aribitration lost
            cr[2:1] <= #1 2'b0;             // reserved bits
            cr[0]   <= #1 2'b0;             // clear IRQ_ACK bit
        end
    // decode command register
    wire sta  = cr[7];
    wire sto  = cr[6];
    wire rd   = cr[5];
    wire wr   = cr[4];
    wire ack  = cr[3];
    wire iack = cr[0];
    // decode control register
    assign core_en = ctr[7];
    assign ien = ctr[6];
    // hookup byte controller block
    i2c_master_byte_ctrl byte_controller (
        .clk      ( wb_clk_i     ),
        .rst      ( wb_rst_i     ),
        .nReset   ( rst_i        ),
        .ena      ( core_en      ),
        .clk_cnt  ( prer         ),
        .start    ( sta          ),
        .stop     ( sto          ),
        .read     ( rd           ),
        .write    ( wr           ),
        .ack_in   ( ack          ),
        .din      ( txr          ),
        .cmd_ack  ( done         ),
        .ack_out  ( irxack       ),
        .dout     ( rxr          ),
        .i2c_busy ( i2c_busy     ),
        .i2c_al   ( i2c_al       ),
        .scl_i    ( scl_pad_i    ),
        .scl_o    ( scl_pad_o    ),
        .scl_oen  ( scl_padoen_o ),
        .sda_i    ( sda_pad_i    ),
        .sda_o    ( sda_pad_o    ),
        .sda_oen  ( sda_padoen_o )
    );
    // status register block + interrupt request signal
    always @(posedge wb_clk_i or negedge rst_i)
      if (!rst_i)
        begin
            al       <= #1 1'b0;
            rxack    <= #1 1'b0;
            tip      <= #1 1'b0;
            irq_flag <= #1 1'b0;
        end
      else if (wb_rst_i)
        begin
            al       <= #1 1'b0;
            rxack    <= #1 1'b0;
            tip      <= #1 1'b0;
            irq_flag <= #1 1'b0;
        end
      else
        begin
            al       <= #1 i2c_al | (al & ~sta);
            rxack    <= #1 irxack;
            tip      <= #1 (rd | wr);
            irq_flag <= #1 (done | i2c_al | irq_flag) & ~iack; // interrupt request flag is always generated
        end
    // generate interrupt request signals
    always @(posedge wb_clk_i or negedge rst_i)
      if (!rst_i)
        wb_inta_o <= #1 1'b0;
      else if (wb_rst_i)
        wb_inta_o <= #1 1'b0;
      else
        wb_inta_o <= #1 irq_flag && ien; // interrupt signal is only generated when IEN (interrupt enable bit is set)
    // assign status register bits
    assign sr[7]   = rxack;
    assign sr[6]   = i2c_busy;
    assign sr[5]   = al;
    assign sr[4:2] = 3'h0; // reserved
    assign sr[1]   = tip;
    assign sr[0]   = irq_flag;
endmodule