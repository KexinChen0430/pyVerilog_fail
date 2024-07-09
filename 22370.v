module
  assign rd_addr = req_addr[12:2];
  always @(posedge clk) begin
    if (!rst_n)
    begin
     rd_be <= #TCQ 0;
    end else begin
     rd_be <= #TCQ req_be[3:0];
    end
  end
  // Calculate byte count based on byte enable
  always @ (rd_be) begin
    casex (rd_be[3:0])
      4'b1xx1 : byte_count = 12'h004;
      4'b01x1 : byte_count = 12'h003;
      4'b1x10 : byte_count = 12'h003;
      4'b0011 : byte_count = 12'h002;
      4'b0110 : byte_count = 12'h002;
      4'b1100 : byte_count = 12'h002;
      4'b0001 : byte_count = 12'h001;
      4'b0010 : byte_count = 12'h001;
      4'b0100 : byte_count = 12'h001;
      4'b1000 : byte_count = 12'h001;
      4'b0000 : byte_count = 12'h001;
    endcase
  end
  always @ ( posedge clk ) begin
    if (!rst_n )
    begin
      req_compl_q      <= #TCQ 1'b0;
      req_compl_wd_q   <= #TCQ 1'b1;
    end // if !rst_n
    else
    begin
      req_compl_q      <= #TCQ req_compl;
      req_compl_wd_q   <= #TCQ req_compl_wd;
    end // if rst_n
  end
//  generate
//    if (C_DATA_WIDTH == 128) begin : init_128
//  reg                     req_compl_q2;
//  reg                     req_compl_wd_q2;
//      always @ ( posedge clk ) begin
//        if (!rst_n )
//        begin
//          req_compl_q2      <= #TCQ 1'b0;
//          req_compl_wd_q2   <= #TCQ 1'b0;
//        end // if (!rst_n )
//        else
//        begin
//          req_compl_q2      <= #TCQ req_compl_q;
//          req_compl_wd_q2   <= #TCQ req_compl_wd_q;
//        end // if (rst_n )
//      end
//    end
//  endgenerate
  // Calculate lower address based on  byte enable
//  generate
//    if (C_DATA_WIDTH == 64) begin : cd_64
//      assign compl_wd = req_compl_wd_q;
//    end
//    else if (C_DATA_WIDTH == 128) begin : cd_128
//      assign compl_wd = req_compl_wd_q2;
//    end
//  endgenerate
    always @ (rd_be or req_addr or compl_wd) begin
    casex ({compl_wd, rd_be[3:0]})
       5'b1_0000 : lower_addr = {req_addr[6:2], 2'b00};
       5'b1_xxx1 : lower_addr = {req_addr[6:2], 2'b00};
       5'b1_xx10 : lower_addr = {req_addr[6:2], 2'b01};
       5'b1_x100 : lower_addr = {req_addr[6:2], 2'b10};
       5'b1_1000 : lower_addr = {req_addr[6:2], 2'b11};
       5'b0_xxxx : lower_addr = 8'h0;
    endcase // casex ({compl_wd, rd_be[3:0]})
    end
  //  Generate Completion with 1 DW Payload
  generate
    if (C_DATA_WIDTH == 64) begin : gen_cpl_64
      reg                     state;
      assign compl_wd = req_compl_wd_q;
      always @ ( posedge clk ) begin
        if (!rst_n )
        begin
          s_axis_tx_tlast   <= #TCQ 1'b0;
          s_axis_tx_tvalid  <= #TCQ 1'b0;
          s_axis_tx_tdata   <= #TCQ {C_DATA_WIDTH{1'b0}};
          s_axis_tx_tkeep   <= #TCQ {KEEP_WIDTH{1'b0}};
          compl_done        <= #TCQ 1'b0;
          state             <= #TCQ PIO_TX_RST_STATE;
        end // if (!rst_n )
        else
        begin
          case ( state )
            PIO_TX_RST_STATE : begin
              if (req_compl_q)
              begin
                s_axis_tx_tlast  <= #TCQ 1'b0;
                s_axis_tx_tvalid <= #TCQ 1'b1;
                // Swap DWORDS for AXI
                s_axis_tx_tdata  <= #TCQ {                      // Bits
                                      completer_id,             // 16
                                      {3'b0},                   // 3
                                      {1'b0},                   // 1
                                      byte_count,               // 12
                                      {1'b0},                   // 1
                                      (req_compl_wd_q ?
                                      PIO_CPLD_FMT_TYPE :
                                      PIO_CPL_FMT_TYPE),        // 7
                                      {1'b0},                   // 1
                                      req_tc,                   // 3
                                      {4'b0},                   // 4
                                      req_td,                   // 1
                                      req_ep,                   // 1
                                      req_attr,                 // 2
                                      {2'b0},                   // 2
                                      req_len                   // 10
                                      };
                s_axis_tx_tkeep   <= #TCQ 8'hFF;
                // Wait in this state if the PCIe core does not accept
                // the first beat of the packet
                if (s_axis_tx_tready)
                  state             <= #TCQ PIO_TX_CPLD_QW1;
                else
                  state             <= #TCQ PIO_TX_RST_STATE;
              end // if (req_compl_q)
              else
              begin
                s_axis_tx_tlast   <= #TCQ 1'b0;
                s_axis_tx_tvalid  <= #TCQ 1'b0;
                s_axis_tx_tdata   <= #TCQ 64'b0;
                s_axis_tx_tkeep   <= #TCQ 8'hFF;
                compl_done        <= #TCQ 1'b0;
                state             <= #TCQ PIO_TX_RST_STATE;
              end // if !(req_compl_q)
            end // PIO_TX_RST_STATE
            PIO_TX_CPLD_QW1 : begin
              if (s_axis_tx_tready)
              begin
                s_axis_tx_tlast  <= #TCQ 1'b1;
                s_axis_tx_tvalid <= #TCQ 1'b1;
                // Swap DWORDS for AXI
                s_axis_tx_tdata  <= #TCQ {        // Bits
                                      rd_data,    // 32
                                      req_rid,    // 16
                                      req_tag,    //  8
                                      {1'b0},     //  1
                                      lower_addr  //  7
                                      };
                // Here we select if the packet has data or
                // not.  The strobe signal will mask data
                // when it is not needed.  No reason to change
                // the data bus.
                if (req_compl_wd_q)
                  s_axis_tx_tkeep <= #TCQ 8'hFF;
                else
                  s_axis_tx_tkeep <= #TCQ 8'h0F;
                compl_done        <= #TCQ 1'b1;
                state             <= #TCQ PIO_TX_RST_STATE;
              end // if (s_axis_tx_tready)
              else
                state             <= #TCQ PIO_TX_CPLD_QW1;
            end // PIO_TX_CPLD_QW1
            default : begin
              // case default stmt
              state             <= #TCQ PIO_TX_RST_STATE;
            end
          endcase
        end // if rst_n
      end
    end
    else if (C_DATA_WIDTH == 128) begin : gen_cpl_128
      reg                     hold_state;
      reg                     req_compl_q2;
      reg                     req_compl_wd_q2;
      assign compl_wd = req_compl_wd_q2;
      always @ ( posedge clk ) begin
        if (!rst_n )
        begin
          req_compl_q2      <= #TCQ 1'b0;
          req_compl_wd_q2   <= #TCQ 1'b0;
        end // if (!rst_n )
        else
        begin
          req_compl_q2      <= #TCQ req_compl_q;
          req_compl_wd_q2   <= #TCQ req_compl_wd_q;
        end // if (rst_n )
      end
      always @ ( posedge clk ) begin
        if (!rst_n )
        begin
          s_axis_tx_tlast   <= #TCQ 1'b0;
          s_axis_tx_tvalid  <= #TCQ 1'b0;
          s_axis_tx_tdata   <= #TCQ {C_DATA_WIDTH{1'b0}};
          s_axis_tx_tkeep   <= #TCQ {KEEP_WIDTH{1'b0}};
          compl_done        <= #TCQ 1'b0;
          hold_state        <= #TCQ 1'b0;
        end // if !rst_n
        else
        begin
          if (req_compl_q2 | hold_state)
          begin
            if (s_axis_tx_tready)
            begin
              s_axis_tx_tlast   <= #TCQ 1'b1;
              s_axis_tx_tvalid  <= #TCQ 1'b1;
              s_axis_tx_tdata   <= #TCQ {                   // Bits
                                  rd_data,                  // 32
                                  req_rid,                  // 16
                                  req_tag,                  //  8
                                  {1'b0},                   //  1
                                  lower_addr,               //  7
                                  completer_id,             // 16
                                  {3'b0},                   //  3
                                  {1'b0},                   //  1
                                  byte_count,               // 12
                                  {1'b0},                   //  1
                                  (req_compl_wd_q2 ?
                                  PIO_CPLD_FMT_TYPE :
                                  PIO_CPL_FMT_TYPE),        //  7
                                  {1'b0},                   //  1
                                  req_tc,                   //  3
                                  {4'b0},                   //  4
                                  req_td,                   //  1
                                  req_ep,                   //  1
                                  req_attr,                 //  2
                                  {2'b0},                   //  2
                                  req_len                   // 10
                                  };
              // Here we select if the packet has data or
              // not.  The strobe signal will mask data
              // when it is not needed.  No reason to change
              // the data bus.
              if (req_compl_wd_q2)
                s_axis_tx_tkeep   <= #TCQ 16'hFFFF;
              else
                s_axis_tx_tkeep   <= #TCQ 16'h0FFF;
              compl_done        <= #TCQ 1'b1;
              hold_state        <= #TCQ 1'b0;
            end // if (s_axis_tx_tready)
            else
              hold_state        <= #TCQ 1'b1;
          end // if (req_compl_q2 | hold_state)
          else
          begin
            s_axis_tx_tlast   <= #TCQ 1'b0;
            s_axis_tx_tvalid  <= #TCQ 1'b0;
            s_axis_tx_tdata   <= #TCQ {C_DATA_WIDTH{1'b0}};
            s_axis_tx_tkeep   <= #TCQ {KEEP_WIDTH{1'b1}};
            compl_done        <= #TCQ 1'b0;
          end // if !(req_compl_q2 | hold_state)
        end // if rst_n
      end
    end
  endgenerate
endmodule