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
  reg [31:0] lcnt;
  always @(posedge CLK) lcnt <= (RST) ? 0 : (c.last_phase && c.initdone) ? lcnt + 1 : lcnt;
  reg [31:0] cnt0_0, cnt1_0, cnt2_0, cnt3_0, cnt4_0, cnt5_0, cnt6_0, cnt7_0, cnt8_0;
  always @(posedge CLK) cnt0_0 <= (RST) ? 0 : (c.phase_a==0 && c.initdone) ? cnt0_0 + 1 : cnt0_0;
  always @(posedge CLK) cnt1_0 <= (RST) ? 0 : (c.phase_a==1 && c.initdone) ? cnt1_0 + 1 : cnt1_0;
  always @(posedge CLK) cnt2_0 <= (RST) ? 0 : (c.phase_a==2 && c.initdone) ? cnt2_0 + 1 : cnt2_0;
  always @(posedge CLK) cnt3_0 <= (RST) ? 0 : (c.phase_a==3 && c.initdone) ? cnt3_0 + 1 : cnt3_0;
  always @(posedge CLK) cnt4_0 <= (RST) ? 0 : (c.phase_a==4 && c.initdone) ? cnt4_0 + 1 : cnt4_0;
  always @(posedge CLK) cnt5_0 <= (RST) ? 0 : (c.phase_a==5 && c.initdone) ? cnt5_0 + 1 : cnt5_0;
  always @(posedge CLK) cnt6_0 <= (RST) ? 0 : (c.phase_a==6 && c.initdone) ? cnt6_0 + 1 : cnt6_0;
  always @(posedge CLK) cnt7_0 <= (RST) ? 0 : (c.phase_a==7 && c.initdone) ? cnt7_0 + 1 : cnt7_0;
  always @(posedge CLK) cnt8_0 <= (RST) ? 0 : (c.phase_a==8 && c.initdone) ? cnt8_0 + 1 : cnt8_0;
  reg [31:0] cnt0_1, cnt1_1, cnt2_1, cnt3_1, cnt4_1, cnt5_1, cnt6_1, cnt7_1, cnt8_1;
  always @(posedge CLK) cnt0_1 <= (RST) ? 0 : (c.phase_b==0 && c.initdone) ? cnt0_1 + 1 : cnt0_1;
  always @(posedge CLK) cnt1_1 <= (RST) ? 0 : (c.phase_b==1 && c.initdone) ? cnt1_1 + 1 : cnt1_1;
  always @(posedge CLK) cnt2_1 <= (RST) ? 0 : (c.phase_b==2 && c.initdone) ? cnt2_1 + 1 : cnt2_1;
  always @(posedge CLK) cnt3_1 <= (RST) ? 0 : (c.phase_b==3 && c.initdone) ? cnt3_1 + 1 : cnt3_1;
  always @(posedge CLK) cnt4_1 <= (RST) ? 0 : (c.phase_b==4 && c.initdone) ? cnt4_1 + 1 : cnt4_1;
  always @(posedge CLK) cnt5_1 <= (RST) ? 0 : (c.phase_b==5 && c.initdone) ? cnt5_1 + 1 : cnt5_1;
  always @(posedge CLK) cnt6_1 <= (RST) ? 0 : (c.phase_b==6 && c.initdone) ? cnt6_1 + 1 : cnt6_1;
  always @(posedge CLK) cnt7_1 <= (RST) ? 0 : (c.phase_b==7 && c.initdone) ? cnt7_1 + 1 : cnt7_1;
  always @(posedge CLK) cnt8_1 <= (RST) ? 0 : (c.phase_b==8 && c.initdone) ? cnt8_1 + 1 : cnt8_1;
  generate
    if (`INITTYPE=="reverse" || `INITTYPE=="sorted") begin
      always @(posedge CLK) begin /// note
        if (c.initdone) begin
          $write("%d|%d|state(%d)", cnt[19:0], c.last_phase, c.state);
          $write("|");
          if (c.F01_deq0) $write("%d", c.F01_dot0); else $write("          ");
          if (c.F01_deq1) $write("%d", c.F01_dot1); else $write("          ");
          if (c.F01_deq2) $write("%d", c.F01_dot2); else $write("          ");
          if (c.F01_deq3) $write("%d", c.F01_dot3); else $write("          ");
          $write("|");
          if (d.app_wdf_wren) $write(" |M%d %d ", d_din[63:32], d_din[31:0]);
          $write("\n");
          $fflush();
        end
      end
      always @(posedge CLK) begin
        if (c.sortdone) begin : simulation_finish
          $write("\nIt takes %d cycles\n", cnt);
          $write("last(%1d): %d cycles\n", `LAST_PHASE, lcnt);
          $write("phase0:  %d %d cycles\n", cnt0_0, cnt0_1);
          $write("phase1:  %d %d cycles\n", cnt1_0, cnt1_1);
          $write("phase2:  %d %d cycles\n", cnt2_0, cnt2_1);
          $write("phase3:  %d %d cycles\n", cnt3_0, cnt3_1);
          $write("phase4:  %d %d cycles\n", cnt4_0, cnt4_1);
          $write("phase5:  %d %d cycles\n", cnt5_0, cnt5_1);
          $write("phase6:  %d %d cycles\n", cnt6_0, cnt6_1);
          $write("phase7:  %d %d cycles\n", cnt7_0, cnt7_1);
          $write("phase8:  %d %d cycles\n", cnt8_0, cnt8_1);
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
        if (c.last_phase && c.F01_deq0) begin
          $write("%08x ", c.F01_dot0);
          $fwrite(fp, "%08x ", c.F01_dot0);
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