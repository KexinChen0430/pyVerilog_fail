module
  // generate the WB bus clock
  //always #(`WB_CLOCK_PERIOD/2) wb_clk <= ~wb_clk;
  // Slave adapter
  wb_slave_adapter #( .g_master_use_struct(0),
                      .g_master_mode(g_pipelined),
                      .g_master_granularity(g_word_granularity),
                      .g_slave_use_struct(0),
                      .g_slave_mode(CLASSIC),
                      .g_slave_granularity(BYTE))
  cmp_wb_slave_adapter(
    .clk_sys_i        (wb_clk),
    .rst_n_i          (wb_rst_n),
    .sl_adr_i         (wb_adr_int2adp),
    .sl_dat_i         (wb_dat_int2adp),
    .sl_sel_i         (wb_sel_int2adp),
    .sl_cyc_i         (wb_cyc_int2adp),
    .sl_stb_i         (wb_stb_int2adp),
    .sl_we_i          (wb_we_int2adp),
    .sl_dat_o         (wb_dat_adp2int),
    .sl_err_o         (),
    .sl_rty_o         (),
    .sl_ack_o         (wb_ack_adp2int),
    .sl_stall_o       (),
    .sl_int_o         (),
    .ma_adr_o         (wb_adr_o),
    .ma_dat_o         (wb_dat_o),
    .ma_sel_o         (wb_sel_o),
    .ma_cyc_o         (wb_cyc_o),
    .ma_stb_o         (wb_stb_o),
    .ma_we_o          (wb_we_o),
    .ma_dat_i         (wb_dat_i),
    .ma_err_i         (wb_err_i),
    .ma_rty_i         (wb_rty_i),
    .ma_ack_i         (wb_ack_i),
    .ma_stall_i       (wb_stall_i),
    .ma_int_i         (wb_int_i)
  );
  // generate the reset and ready signals
  initial begin
    //#(`WB_RESET_DELAY) wb_rst_n <= 1;
    //#(`WB_CLOCK_PERIOD*2) ready <= 1;
    repeat (`WB_RESET_COUNTS) @(posedge wb_clk);
    wb_rst_n <= 1;
    //repeat (`WB_CLOCK_PERIOD*2) @(posedge wb_clk);
    ready <= 1;
  end
  // enables/disables displaying information about each read/write operation.
  task verbose;
    input onoff;
  begin
    wb_tb_verbose = onoff;
  end
  endtask // wb_verbose
  task monitor_bus;
    input onoff;
  begin
    wb_monitor_bus = onoff;
  end
  endtask // monitor_bus
  task rw_generic;
    input [`WB_ADDRESS_BUS_WIDTH - 1 : 0] addr;
    input [`WB_DATA_BUS_WIDTH - 1 : 0] data_i;
    output [`WB_DATA_BUS_WIDTH - 1 : 0] data_o;
    input rw;
    input [3:0] size;
  begin : rw_generic_main
    // Debug information
    if(wb_tb_verbose) begin
      if(rw)
        $display("@%0d: WB write %s: addr %x, data %x",
            $time, (size==1?"byte":((size==2)?"short":"int")),
            addr, data_i);
      else // !rw
        $display("@%0d: WB read %s: addr %x",
            $time, (size==1?"byte":((size==2)?"short":"int")),
          addr);
    end // wb_tb_verbose
    if($time != last_access_t) begin
      @(posedge wb_clk);
    end
    wb_stb_int2adp <= 1;
    wb_cyc_int2adp <= 1;
    //wb_addr <= {2'b00, addr[31:2]};
    wb_adr_int2adp <= addr;
    wb_we_int2adp <= rw;
    if(rw) begin
      case(size)
        4: begin
          wb_dat_int2adp <= data_i;
          wb_sel_int2adp <= 4'b1111;
        end
        2: begin
          if(addr[1]) begin
            wb_dat_int2adp[31:16] = data_i[15:0];
            wb_sel_int2adp = 4'b1100;
          end else begin
            wb_dat_int2adp[15:0] = data_i[15:0];
            wb_sel_int2adp = 4'b0011;
          end
        end
        1: begin
          case(addr[1:0])
            0: begin
              wb_dat_int2adp[31:24] = data_i[7:0];
              wb_sel_int2adp <= 4'b1000;
            end
            1: begin
              wb_dat_int2adp[23:16] = data_i[7:0];
              wb_sel_int2adp <= 4'b0100;
            end
            2: begin
              wb_dat_int2adp[15:8] = data_i[7:0];
              wb_sel_int2adp <= 4'b0010;
            end
            3: begin
              wb_dat_int2adp[7:0] = data_i[7:0];
              wb_sel_int2adp <= 4'b0001;
            end
          endcase // case(addr[1:0])
        end
      endcase // case(size)
    end // if (rw)
    //#(`WB_CLOCK_PERIOD-1);
    @(posedge wb_clk);
    // Wait for ack.
    // FIXME: insert a maximum wait time
    //while(wb_ack_i == 0) begin @(posedge wb_clk); end
    while(wb_ack_adp2int == 0) begin @(posedge wb_clk); end
    data_o = wb_dat_adp2int;
    wb_cyc_int2adp <= 0;
    wb_we_int2adp <= 0;
    wb_stb_int2adp <= 0;
    //if(wb_tb_verbose && !rw)
    //  $display("@%0d: WB read %s: addr %x, data %x",
    //      $time, (size==1?"byte":((size==2)?"short":"int")),
    //      addr, wb_data_i);
    last_access_t = $time;
  end
  endtask // rw_generic
  task write8;
    input [`WB_ADDRESS_BUS_WIDTH - 1 : 0] addr;
    input [7 : 0] data_i;
  begin
    rw_generic(addr, data_i, dummy, 1, 1);
  end
  endtask // write8
  task read8;
    input [`WB_ADDRESS_BUS_WIDTH - 1 : 0] addr;
    output [7 : 0] data_o;
  begin : read8_body
    reg [`WB_DATA_BUS_WIDTH - 1 : 0] rval;
    rw_generic(addr, 0, rval, 0, 1);
    data_o = rval[7:0];
  end
  endtask // read8
  task write32;
    input [`WB_ADDRESS_BUS_WIDTH - 1 : 0] addr;
    input [31 : 0] data_i;
  begin
    rw_generic(addr, data_i, dummy, 1, 4);
  end
  endtask // write32
  task read32;
    input [`WB_ADDRESS_BUS_WIDTH - 1 : 0] addr;
    output [31 : 0] data_o;
  begin : read32_body
    reg [`WB_DATA_BUS_WIDTH - 1 : 0] rval;
    rw_generic(addr, 0, rval, 0, 4);
    data_o = rval[31:0];
  end
  endtask // read32
  // bus monitor
  always@(posedge wb_clk) begin
    if(wb_monitor_bus && wb_cyc_int2adp && wb_stb_int2adp && wb_ack_adp2int)begin
      if(wb_we_int2adp)
        $display("@%0d: ACK-Write: addr %x wdata %x bwsel %b", $time, wb_adr_int2adp,
            wb_dat_int2adp, wb_sel_int2adp);
      else
        $display("@%0d: ACK-Read: addr %x rdata %x", $time, wb_adr_int2adp, wb_dat_adp2int);
    end
  end
endmodule