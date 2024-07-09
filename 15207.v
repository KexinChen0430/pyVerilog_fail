module tb_USER_LOGIC();
  reg CLK, RST;
  wire           chnl_rx_clk;
  wire           chnl_rx;
  wire           chnl_rx_ack;
  wire           chnl_rx_last;
  wire [31:0]    chnl_rx_len;
  wire [30:0]    chnl_rx_off;
  wire [128-1:0] chnl_rx_data;
  wire           chnl_rx_data_valid;
  wire           chnl_rx_data_ren;
  wire           chnl_tx_clk;
  wire           chnl_tx;
  wire           chnl_tx_ack;
  wire           chnl_tx_last;
  wire [31:0]    chnl_tx_len;
  wire [30:0]    chnl_tx_off;
  wire [128-1:0] chnl_tx_data;
  wire           chnl_tx_data_vaild;
  wire           chnl_tx_data_ren = 1;
  wire              d_busy;
  wire              d_w;
  wire [`DRAMW-1:0] d_din;
  wire [`DRAMW-1:0] d_dout;
  wire              d_douten;
  wire [1:0]        d_req;       // DRAM access request (read/write)
  wire [31:0]       d_initadr;   // dram initial address for the access
  wire [31:0]       d_blocks;    // the number of blocks per one access(read/write)
  reg sortdone;
  initial begin CLK=0; forever #50 CLK=~CLK; end
  initial begin RST=1; #400 RST=0; end
  reg [31:0] cnt;
  always @(posedge CLK) cnt <= (RST) ? 0 : cnt + 1;
  reg [31:0] cnt0, cnt1, cnt2, cnt3, cnt4, cnt5, cnt6, cnt7, cnt8, cnt9;
  always @(posedge CLK) cnt0 <= (RST) ? 0 : (u.core.phase==0) ? cnt0 + 1 : cnt0;
  always @(posedge CLK) cnt1 <= (RST) ? 0 : (u.core.phase==1) ? cnt1 + 1 : cnt1;
  always @(posedge CLK) cnt2 <= (RST) ? 0 : (u.core.phase==2) ? cnt2 + 1 : cnt2;
  always @(posedge CLK) cnt3 <= (RST) ? 0 : (u.core.phase==3) ? cnt3 + 1 : cnt3;
  always @(posedge CLK) cnt4 <= (RST) ? 0 : (u.core.phase==4) ? cnt4 + 1 : cnt4;
  always @(posedge CLK) cnt5 <= (RST) ? 0 : (u.core.phase==5) ? cnt5 + 1 : cnt5;
  always @(posedge CLK) cnt6 <= (RST) ? 0 : (u.core.phase==6) ? cnt6 + 1 : cnt6;
  always @(posedge CLK) cnt7 <= (RST) ? 0 : (u.core.phase==7) ? cnt7 + 1 : cnt7;
  always @(posedge CLK) cnt8 <= (RST) ? 0 : (u.core.phase==8) ? cnt8 + 1 : cnt8;
  always @(posedge CLK) cnt9 <= (RST) ? 0 : (u.core.phase==9) ? cnt9 + 1 : cnt9;
  reg [31:0] rslt_cnt;
  always @(posedge CLK) begin
    if (RST) begin
      rslt_cnt <= 0;
    end else begin
      if (chnl_tx_data_vaild) rslt_cnt <= rslt_cnt + 4;
    end
  end
  always @(posedge CLK) begin
    if      (RST)                   sortdone <= 0;
    else if (rslt_cnt == `SORT_ELM) sortdone <= 1;
  end
  // Debug Info
  always @(posedge CLK) begin
    if (!RST) begin
      $write("%d|%d|P%d|%d%d%d|%d", cnt[19:0], u.core.elem, u.core.phase[2:0], u.core.iter_done, u.core.pchange, u.core.irst, u.core.ecnt);
      $write("|");
      if (d_douten) $write("%08x %08x ", d_dout[63:32], d_dout[31:0]); else $write("                  ");
      // $write("%d %d %x ", u.rState, u.rx_wait, u.core.req_pzero);
      // if (u.idata_valid) $write("%08x %08x ", u.idata[63:32], u.idata[31:0]); else $write("                  ");
      // $write("|");
      // if (u.core.doen_t) $write("%08x %08x ", u.core.dout_t[63:32], u.core.dout_t[31:0]); else $write("                  ");
      // $write("|");
      // if (u.core.doen_tc) $write("%08x %08x ", u.core.dout_tc[63:32], u.core.dout_tc[31:0]); else $write("                  ");
      $write("|");
      $write("[%d](%d)", u.core.req, u.core.state);
      $write("| %d %d %d %d %d %d %d %d|",
             u.core.im00.imf.cnt, u.core.im01.imf.cnt, u.core.im02.imf.cnt, u.core.im03.imf.cnt,
             u.core.im04.imf.cnt, u.core.im05.imf.cnt, u.core.im06.imf.cnt, u.core.im07.imf.cnt);
      // $write("| %d %d %d %d %d %d %d %d|",
      //        u.core.im00.im_deq, u.core.im01.im_deq, u.core.im02.im_deq, u.core.im03.im_deq,
      //        u.core.im04.im_deq, u.core.im05.im_deq, u.core.im06.im_deq, u.core.im07.im_deq);
      $write(" ");
      if (u.core.F01_deq) $write("%08x %08x %08x %08x ", u.core.F01_dot[127:96], u.core.F01_dot[95:64], u.core.F01_dot[63:32], u.core.F01_dot[31:0]); else $write("                                    ");
      // $write("| ");
      // $write("%d", u.core.dcnt);
      if (d.app_wdf_wren) $write(" |M%d %d ", d_din[63:32], d_din[31:0]);
      $write("\n");
      $fflush();
    end
  end
  // checking the result
  generate
    if (`INITTYPE=="sorted" || `INITTYPE=="reverse") begin
      reg [`MERGW-1:0] check_cnt;
      always @(posedge CLK) begin
        if (RST) begin
          check_cnt[31 : 0] <= 1;
          check_cnt[63 :32] <= 2;
          check_cnt[95 :64] <= 3;
          check_cnt[127:96] <= 4;
        end else begin
          if (chnl_tx_data_vaild) begin
            if (check_cnt != chnl_tx_data) begin
              $write("Error in sorter.v: %d %d\n", chnl_tx_data, check_cnt); // for simulation
              $finish();                                                     // for simulation
            end
            check_cnt[31 : 0] <= check_cnt[31 : 0] + 4;
            check_cnt[63 :32] <= check_cnt[63 :32] + 4;
            check_cnt[95 :64] <= check_cnt[95 :64] + 4;
            check_cnt[127:96] <= check_cnt[127:96] + 4;
          end
        end
      end
    end else if (`INITTYPE=="xorshift") begin
      integer fp;
      initial begin fp = $fopen("log.txt", "w"); end
      always @(posedge CLK) begin
        if (chnl_tx_data_vaild) begin
          $fwrite(fp, "%08x\n", chnl_tx_data[31:0]);
          $fwrite(fp, "%08x\n", chnl_tx_data[63:32]);
          $fwrite(fp, "%08x\n", chnl_tx_data[95:64]);
          $fwrite(fp, "%08x\n", chnl_tx_data[127:96]);
          $fflush();
        end
        if (sortdone) $fclose(fp);
      end
    end else begin
      always @(posedge CLK) begin
        $write("Error! INITTYPE is wrong.\n");
        $write("Please make sure src/define.vh\n");
        $finish();
      end
    end
  endgenerate
  // Show the elapsed cycles
  always @(posedge CLK) begin
    if(sortdone) begin : simulation_finish
      $write("\nIt takes %d cycles\n", cnt);
      $write("phase0:  %d cycles\n", cnt0);
      $write("phase1:  %d cycles\n", cnt1);
      $write("phase2:  %d cycles\n", cnt2);
      $write("phase3:  %d cycles\n", cnt3);
      $write("phase4:  %d cycles\n", cnt4);
      $write("phase5:  %d cycles\n", cnt5);
      $write("phase6:  %d cycles\n", cnt6);
      $write("phase7:  %d cycles\n", cnt7);
      $write("phase8:  %d cycles\n", cnt8);
      $write("phase9:  %d cycles\n", cnt9);
      $write("Sorting finished!\n");
      $finish();
    end
  end
  // Stub modules
  Host_to_FPGA h2f(CLK, RST, chnl_rx_data_ren, chnl_rx, chnl_rx_data, chnl_rx_data_valid, chnl_rx_len);
  DRAM d(CLK, RST, d_req, d_initadr, d_blocks, d_din, d_w, d_dout, d_douten, d_busy);
  /***** Core Module Instantiation                                                          *****/
  USER_LOGIC u(CLK,
               RST,
               chnl_rx_clk,
               chnl_rx,
               chnl_rx_ack,
               chnl_rx_last,
               chnl_rx_len,
               chnl_rx_off,
               chnl_rx_data,
               chnl_rx_data_valid,
               chnl_rx_data_ren,
               chnl_tx_clk,
               chnl_tx,
               chnl_tx_ack,
               chnl_tx_last,
               chnl_tx_len,
               chnl_tx_off,
               chnl_tx_data,
               chnl_tx_data_vaild,
               chnl_tx_data_ren,
               d_busy,       // DRAM busy
               d_din,        // DRAM data in
               d_w,          // DRAM write flag
               d_dout,       // DRAM data out
               d_douten,     // DRAM data out enable
               d_req,        // DRAM REQ access request (read/write)
               d_initadr,    // DRAM REQ initial address for the access
               d_blocks      // DRAM REQ the number of blocks per one access
               );
endmodule