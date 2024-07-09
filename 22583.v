module top_sim;
  reg CLK, RST;
  wire CLK100M = CLK;
  wire              d_busy;
  wire              d_w;
  wire [`DRAMW-1:0] d_din;
  wire [`DRAMW-1:0] d_dout;
  wire              d_douten;
  wire [1:0]        d_req;       // DRAM access request (read/write)
  wire [31:0]       d_initadr;   // dram initial address for the access
  wire [31:0]       d_blocks;    // the number of blocks per one access(read/write)
  wire initdone;
  wire sortdone;
  initial begin CLK=0; forever #50 CLK=~CLK; end
  initial begin RST=1; #400 RST=0; end
  reg [31:0] cnt;
  always @(posedge CLK) cnt <= (RST) ? 0 : cnt + 1;
  reg [31:0] cnt0, cnt1, cnt2, cnt3, cnt4, cnt5, cnt6, cnt7, cnt8, cnt9;
  always @(posedge CLK) cnt0 <= (RST) ? 0 : (c.phase==0 && c.initdone) ? cnt0 + 1 : cnt0;
  always @(posedge CLK) cnt1 <= (RST) ? 0 : (c.phase==1 && c.initdone) ? cnt1 + 1 : cnt1;
  always @(posedge CLK) cnt2 <= (RST) ? 0 : (c.phase==2 && c.initdone) ? cnt2 + 1 : cnt2;
  always @(posedge CLK) cnt3 <= (RST) ? 0 : (c.phase==3 && c.initdone) ? cnt3 + 1 : cnt3;
  always @(posedge CLK) cnt4 <= (RST) ? 0 : (c.phase==4 && c.initdone) ? cnt4 + 1 : cnt4;
  always @(posedge CLK) cnt5 <= (RST) ? 0 : (c.phase==5 && c.initdone) ? cnt5 + 1 : cnt5;
  always @(posedge CLK) cnt6 <= (RST) ? 0 : (c.phase==6 && c.initdone) ? cnt6 + 1 : cnt6;
  always @(posedge CLK) cnt7 <= (RST) ? 0 : (c.phase==7 && c.initdone) ? cnt7 + 1 : cnt7;
  always @(posedge CLK) cnt8 <= (RST) ? 0 : (c.phase==8 && c.initdone) ? cnt8 + 1 : cnt8;
  always @(posedge CLK) cnt9 <= (RST) ? 0 : (c.phase==9 && c.initdone) ? cnt9 + 1 : cnt9;
  generate
    if (`INITTYPE=="reverse" || `INITTYPE=="sorted") begin
      always @(posedge CLK) begin /// note
        if (c.initdone) begin
          $write("%d|%d|P%d|%d%d%d|%d", cnt[19:0], c.elem, c.phase[2:0], c.iter_done, c.pchange, c.irst, c.ecnt);
          $write("%d %d (%d) : ", d_dout[63:32], d_dout[31:0], d_douten);
          $write("[%d](%d)", c.req, c.state);
          $write("|");
          if (c.stree.F08_emp) $write("---------- "); else  $write("%d ", c.stree.F08_dot);
          if (c.stree.F09_emp) $write("---------- "); else  $write("%d ", c.stree.F09_dot);
          if (c.stree.F10_emp) $write("---------- "); else  $write("%d ", c.stree.F10_dot);
          if (c.stree.F11_emp) $write("---------- "); else  $write("%d ", c.stree.F11_dot);
          if (c.stree.F12_emp) $write("---------- "); else  $write("%d ", c.stree.F12_dot);
          if (c.stree.F13_emp) $write("---------- "); else  $write("%d ", c.stree.F13_dot);
          if (c.stree.F14_emp) $write("---------- "); else  $write("%d ", c.stree.F14_dot);
          if (c.stree.F15_emp) $write("---------- "); else  $write("%d ", c.stree.F15_dot);
          $write("|");
          $write("| %d %d %d %d %d %d %d %d|",
                 c.im00.imf.cnt, c.im01.imf.cnt, c.im02.imf.cnt, c.im03.imf.cnt,
                 c.im04.imf.cnt, c.im05.imf.cnt, c.im06.imf.cnt, c.im07.imf.cnt);
          $write("| %d %d %d %d %d %d %d %d|",
                 c.im00.im_deq, c.im01.im_deq, c.im02.im_deq, c.im03.im_deq,
                 c.im04.im_deq, c.im05.im_deq, c.im06.im_deq, c.im07.im_deq);
          if (c.F01_deq) $write("%d", c.F01_dot); else $write("          ");
          if (d.app_wdf_wren) $write(" |M%d %d ", d_din[63:32], d_din[31:0]);
          $write("\n");
          $fflush();
        end
      end
      always @(posedge CLK) begin
        if(c.sortdone) begin : simulation_finish
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
    end else if (`INITTYPE == "xorshift") begin
      integer fp;
      initial begin
        fp = $fopen("test.txt", "w");
      end
      always @(posedge CLK) begin /// note
        if (c.phase==`LAST_PHASE && c.F01_deq) begin
          $write("%08x ", c.F01_dot);
          $fwrite(fp, "%08x ", c.F01_dot);
          $fflush();
        end
        if (c.sortdone) begin
          $fclose(fp);
          $finish();
        end
      end
    end
  endgenerate
  /***** DRAM Controller & DRAM Instantiation                                               *****/
  DRAM d(CLK, RST, d_req, d_initadr, d_blocks, d_din, d_w, d_dout, d_douten, d_busy);
  wire ERROR;
  /***** Core Module Instantiation                                                          *****/
  CORE c(CLK100M, RST, initdone, sortdone,
         d_busy, d_din, d_w, d_dout, d_douten, d_req, d_initadr, d_blocks, ERROR);
endmodule