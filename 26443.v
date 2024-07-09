module wishbone_master_tb (
);
//Virtual Host Interface Signals
reg               clk             = 0;
reg               rst             = 0;
wire              w_master_ready;
reg               r_in_ready      = 0;
reg   [31:0]      r_in_command    = 32'h00000000;
reg   [31:0]      r_in_address    = 32'h00000000;
reg   [31:0]      r_in_data       = 32'h00000000;
reg   [27:0]      r_in_data_count = 0;
reg               r_out_ready     = 0;
wire              w_out_en;
wire  [31:0]      w_out_status;
wire  [31:0]      w_out_address;
wire  [31:0]      w_out_data;
wire  [27:0]      w_out_data_count;
reg               r_ih_reset      = 0;
//wishbone signals
wire              w_wbm_we;
wire              w_wbm_cyc;
wire              w_wbm_stb;
wire [3:0]        w_wbm_sel;
wire [31:0]       w_wbm_adr;
wire [31:0]       w_wbm_dat_o;
wire [31:0]       w_wbm_dat_i;
wire              w_wbm_ack;
wire              w_wbm_int;
//Wishbone Slave 0 (SDB) signals
wire              w_wbs0_we;
wire              w_wbs0_cyc;
wire  [31:0]      w_wbs0_dat_o;
wire              w_wbs0_stb;
wire  [3:0]       w_wbs0_sel;
wire              w_wbs0_ack;
wire  [31:0]      w_wbs0_dat_i;
wire  [31:0]      w_wbs0_adr;
wire              w_wbs0_int;
//wishbone slave 1 (Unit Under Test) signals
wire              w_wbs1_we;
wire              w_wbs1_cyc;
wire              w_wbs1_stb;
wire  [3:0]       w_wbs1_sel;
wire              w_wbs1_ack;
wire  [31:0]      w_wbs1_dat_i;
wire  [31:0]      w_wbs1_dat_o;
wire  [31:0]      w_wbs1_adr;
wire              w_wbs1_int;
//Local Parameters
localparam        WAIT_FOR_SDRAM      = 8'h00;
localparam        IDLE                = 8'h01;
localparam        SEND_COMMAND        = 8'h02;
localparam        MASTER_READ_COMMAND = 8'h03;
localparam        RESET               = 8'h04;
localparam        PING_RESPONSE       = 8'h05;
localparam        WRITE_DATA          = 8'h06;
localparam        WRITE_RESPONSE      = 8'h07;
localparam        GET_WRITE_DATA      = 8'h08;
localparam        READ_RESPONSE       = 8'h09;
localparam        READ_MORE_DATA      = 8'h0A;
localparam        FINISHED            = 8'h0B;
//Registers/Wires/Simulation Integers
integer           fd_in;
integer           fd_out;
integer           read_count;
integer           timeout_count;
integer           ch;
integer           data_count;
reg [3:0]         state           =   IDLE;
reg               prev_int        = 0;
reg               execute_command;
reg               command_finished;
reg               request_more_data;
reg               request_more_data_ack;
reg     [27:0]    data_write_count;
reg     [27:0]    data_read_count;
wire              clk_100mhz;
wire              calibration_done;
wire              usr_clk;
wire              usr_rst;
wire              cmd_clk;
wire              cmd_en;
wire    [2:0]     cmd_instr;
wire    [5:0]     cmd_bl;
wire    [29:0]    cmd_byte_addr;
wire              cmd_empty;
wire              cmd_full;
wire              wr_clk;
wire              wr_en;
wire    [3:0]     wr_mask;
wire    [31:0]    wr_data;
wire              wr_full;
wire              wr_empty;
wire    [6:0]     wr_count;
wire              wr_underrun;
wire              wr_error;
wire              rd_clk;
wire              rd_en;
wire    [31:0]    rd_data;
wire              rd_full;
wire              rd_empty;
wire    [6:0]     rd_count;
wire              rd_overflow;
wire              rd_error;
wire [7:0]    mcb3_dram_dq;
wire [13:0]   mcb3_dram_a;
wire [2:0]    mcb3_dram_ba;
wire          mcb3_dram_ras_n;
wire          mcb3_dram_cas_n;
wire          mcb3_dram_we_n;
wire          mcb3_dram_odt;
wire          mcb3_dram_reset_n;
wire          mcb3_dram_cke;
wire          mcb3_dram_dm;
wire          mcb3_rzq;
wire          mcb3_zio;
wire          mcb3_dram_dqs;
wire          mcb3_dram_dqs_n;
wire          mcb3_dram_ck;
wire          mcb3_dram_ck_n;
wire          p0_cmd_clk;
wire          p0_cmd_en;
wire [2:0]    p0_cmd_instr;
wire [5:0]    p0_cmd_bl;
wire [29:0]   p0_cmd_byte_addr;
wire          p0_cmd_empty;
wire          p0_cmd_full;
wire          p0_wr_clk;
wire          p0_wr_en;
wire [3:0]    p0_wr_mask;
wire [31:0]   p0_wr_data;
wire          p0_wr_full;
wire          p0_wr_empty;
wire [6:0]    p0_wr_count;
wire          p0_wr_underrun;
wire          p0_wr_error;
wire          p0_rd_clk;
wire          p0_rd_en;
wire [31:0]   p0_rd_data;
wire          p0_rd_full;
wire          p0_rd_empty;
wire [6:0]    p0_rd_count;
wire          p0_rd_overflow;
wire          p0_rd_error;
wire          p1_cmd_clk;
wire          p1_cmd_en;
wire [2:0]    p1_cmd_instr;
wire [5:0]    p1_cmd_bl;
wire [29:0]   p1_cmd_byte_addr;
wire          p1_cmd_empty;
wire          p1_cmd_full;
wire          p1_wr_clk;
wire          p1_wr_en;
wire [3:0]    p1_wr_mask;
wire [31:0]   p1_wr_data;
wire          p1_wr_full;
wire          p1_wr_empty;
wire [6:0]    p1_wr_count;
wire          p1_wr_underrun;
wire          p1_wr_error;
wire          p1_rd_clk;
wire          p1_rd_en;
wire [31:0]   p1_rd_data;
wire          p1_rd_full;
wire          p1_rd_empty;
wire [6:0]    p1_rd_count;
wire          p1_rd_overflow;
wire          p1_rd_error;
wire          p2_cmd_clk;
wire          p2_cmd_en;
wire [2:0]    p2_cmd_instr;
wire [5:0]    p2_cmd_bl;
wire [29:0]   p2_cmd_byte_addr;
wire          p2_cmd_empty;
wire          p2_cmd_full;
wire          p2_wr_clk;
wire          p2_wr_en;
wire [3:0]    p2_wr_mask;
wire [31:0]   p2_wr_data;
wire          p2_wr_full;
wire          p2_wr_empty;
wire [6:0]    p2_wr_count;
wire          p2_wr_underrun;
wire          p2_wr_error;
wire          p2_rd_clk;
wire          p2_rd_en;
wire [31:0]   p2_rd_data;
wire          p2_rd_full;
wire          p2_rd_empty;
wire [6:0]    p2_rd_count;
wire          p2_rd_overflow;
wire          p2_rd_error;
//Submodules
wishbone_master wm (
  .clk               (clk               ),
  .rst               (rst               ),
  .i_ih_rst          (r_ih_reset        ),
  .i_ready           (r_in_ready        ),
  .i_command         (r_in_command      ),
  .i_address         (r_in_address      ),
  .i_data            (r_in_data         ),
  .i_data_count      (r_in_data_count   ),
  .i_out_ready       (r_out_ready       ),
  .o_en              (w_out_en          ),
  .o_status          (w_out_status      ),
  .o_address         (w_out_address     ),
  .o_data            (w_out_data        ),
  .o_data_count      (w_out_data_count  ),
  .o_master_ready    (w_master_ready    ),
  .o_per_we          (w_wbm_we          ),
  .o_per_adr         (w_wbm_adr         ),
  .o_per_dat         (w_wbm_dat_i       ),
  .i_per_dat         (w_wbm_dat_o       ),
  .o_per_stb         (w_wbm_stb         ),
  .o_per_cyc         (w_wbm_cyc         ),
  .o_per_msk         (w_wbm_msk         ),
  .o_per_sel         (w_wbm_sel         ),
  .i_per_ack         (w_wbm_ack         ),
  .i_per_int         (w_wbm_int         )
);
//slave 1
wb_artemis_ddr3 s1(
  .clk               (clk               ),
  .rst               (rst               ),
  .ddr3_cmd_clk      (cmd_clk           ),
  .ddr3_cmd_en       (cmd_en            ),
  .ddr3_cmd_instr    (cmd_instr         ),
  .ddr3_cmd_bl       (cmd_bl            ),
  .ddr3_cmd_byte_addr(cmd_byte_addr     ),
  .ddr3_cmd_empty    (cmd_empty         ),
  .ddr3_cmd_full     (cmd_full          ),
  .ddr3_wr_clk       (wr_clk            ),
  .ddr3_wr_en        (wr_en             ),
  .ddr3_wr_mask      (wr_mask           ),
  .ddr3_wr_data      (wr_data           ),
  .ddr3_wr_full      (wr_full           ),
  .ddr3_wr_empty     (wr_empty          ),
  .ddr3_wr_count     (wr_count          ),
  .ddr3_wr_underrun  (wr_underrun       ),
  .ddr3_wr_error     (wr_error          ),
  .ddr3_rd_clk       (rd_clk            ),
  .ddr3_rd_en        (rd_en             ),
  .ddr3_rd_data      (rd_data           ),
  .ddr3_rd_full      (rd_full           ),
  .ddr3_rd_empty     (rd_empty          ),
  .ddr3_rd_count     (rd_count          ),
  .ddr3_rd_overflow  (rd_overflow       ),
  .ddr3_rd_error     (rd_error          ),
  .i_wbs_we          (w_wbs1_we         ),
  .i_wbs_cyc         (w_wbs1_cyc        ),
  .i_wbs_sel         (w_wbs1_sel        ),
  .i_wbs_dat         (w_wbs1_dat_i      ),
  .i_wbs_stb         (w_wbs1_stb        ),
  .o_wbs_ack         (w_wbs1_ack        ),
  .o_wbs_dat         (w_wbs1_dat_o      ),
  .i_wbs_adr         (w_wbs1_adr        ),
  .o_wbs_int         (w_wbs1_int        )
);
wishbone_interconnect wi (
  .clk               (clk               ),
  .rst               (rst               ),
  .i_m_we            (w_wbm_we          ),
  .i_m_cyc           (w_wbm_cyc         ),
  .i_m_stb           (w_wbm_stb         ),
  .o_m_ack           (w_wbm_ack         ),
  .i_m_dat           (w_wbm_dat_i       ),
  .o_m_dat           (w_wbm_dat_o       ),
  .i_m_adr           (w_wbm_adr         ),
  .o_m_int           (w_wbm_int         ),
  .o_s0_we           (w_wbs0_we         ),
  .o_s0_cyc          (w_wbs0_cyc        ),
  .o_s0_stb          (w_wbs0_stb        ),
  .i_s0_ack          (w_wbs0_ack        ),
  .o_s0_dat          (w_wbs0_dat_i      ),
  .i_s0_dat          (w_wbs0_dat_o      ),
  .o_s0_adr          (w_wbs0_adr        ),
  .i_s0_int          (w_wbs0_int        ),
  .o_s1_we           (w_wbs1_we         ),
  .o_s1_cyc          (w_wbs1_cyc        ),
  .o_s1_stb          (w_wbs1_stb        ),
  .i_s1_ack          (w_wbs1_ack        ),
  .o_s1_dat          (w_wbs1_dat_i      ),
  .i_s1_dat          (w_wbs1_dat_o      ),
  .o_s1_adr          (w_wbs1_adr        ),
  .i_s1_int          (w_wbs1_int        )
);
//sim_artemis_ddr3_user adu(
sim_artemis_ddr3#(
  .RFIFO_WRITE_DELAY  (1                     )
)adu(
  .ddr3_in_clk        (clk_100mhz            ),
  .rst                (rst                   ),
  .calibration_done   (calibration_done      ),
  .usr_clk            (usr_clk               ),
  .usr_rst            (usr_rst               ),
  .mcb3_dram_dq       (mcb3_dram_dq          ),
  .mcb3_dram_a        (mcb3_dram_a           ),
  .mcb3_dram_ba       (mcb3_dram_ba          ),
  .mcb3_dram_ras_n    (mcb3_dram_ras_n       ),
  .mcb3_dram_cas_n    (mcb3_dram_cas_n       ),
  .mcb3_dram_we_n     (mcb3_dram_we_n        ),
  .mcb3_dram_odt      (mcb3_dram_odt         ),
  .mcb3_dram_reset_n  (mcb3_dram_reset_n     ),
  .mcb3_dram_cke      (mcb3_dram_cke         ),
  .mcb3_dram_dm       (mcb3_dram_dm          ),
  .mcb3_rzq           (mcb3_rzq              ),
  .mcb3_zio           (mcb3_zio              ),
  .mcb3_dram_dqs      (mcb3_dram_dqs         ),
  .mcb3_dram_dqs_n    (mcb3_dram_dqs_n       ),
  .mcb3_dram_ck       (mcb3_dram_ck          ),
  .mcb3_dram_ck_n     (mcb3_dram_ck_n        ),
  .p0_cmd_clk         (p0_cmd_clk            ),
  .p0_cmd_en          (p0_cmd_en             ),
  .p0_cmd_instr       (p0_cmd_instr          ),
  .p0_cmd_bl          (p0_cmd_bl             ),
  .p0_cmd_byte_addr   (p0_cmd_byte_addr      ),
  .p0_cmd_empty       (p0_cmd_empty          ),
  .p0_cmd_full        (p0_cmd_full           ),
  .p0_wr_clk          (p0_wr_clk             ),
  .p0_wr_en           (p0_wr_en              ),
  .p0_wr_mask         (p0_wr_mask            ),
  .p0_wr_data         (p0_wr_data            ),
  .p0_wr_full         (p0_wr_full            ),
  .p0_wr_empty        (p0_wr_empty           ),
  .p0_wr_count        (p0_wr_count           ),
  .p0_wr_underrun     (p0_wr_underrun        ),
  .p0_wr_error        (p0_wr_error           ),
  .p0_rd_clk          (p0_rd_clk             ),
  .p0_rd_en           (p0_rd_en              ),
  .p0_rd_data         (p0_rd_data            ),
  .p0_rd_full         (p0_rd_full            ),
  .p0_rd_empty        (p0_rd_empty           ),
  .p0_rd_count        (p0_rd_count           ),
  .p0_rd_overflow     (p0_rd_overflow        ),
  .p0_rd_error        (p0_rd_error           ),
  .p1_cmd_clk         (p1_cmd_clk            ),
  .p1_cmd_en          (p1_cmd_en             ),
  .p1_cmd_instr       (p1_cmd_instr          ),
  .p1_cmd_bl          (p1_cmd_bl             ),
  .p1_cmd_byte_addr   (p1_cmd_byte_addr      ),
  .p1_cmd_empty       (p1_cmd_empty          ),
  .p1_cmd_full        (p1_cmd_full           ),
  .p1_wr_clk          (p1_wr_clk             ),
  .p1_wr_en           (p1_wr_en              ),
  .p1_wr_mask         (p1_wr_mask            ),
  .p1_wr_data         (p1_wr_data            ),
  .p1_wr_full         (p1_wr_full            ),
  .p1_wr_empty        (p1_wr_empty           ),
  .p1_wr_count        (p1_wr_count           ),
  .p1_wr_underrun     (p1_wr_underrun        ),
  .p1_wr_error        (p1_wr_error           ),
  .p1_rd_clk          (p1_rd_clk             ),
  .p1_rd_en           (p1_rd_en              ),
  .p1_rd_data         (p1_rd_data            ),
  .p1_rd_full         (p1_rd_full            ),
  .p1_rd_empty        (p1_rd_empty           ),
  .p1_rd_count        (p1_rd_count           ),
  .p1_rd_overflow     (p1_rd_overflow        ),
  .p1_rd_error        (p1_rd_error           ),
  .p2_cmd_clk         (p2_cmd_clk            ),
  .p2_cmd_en          (p2_cmd_en             ),
  .p2_cmd_instr       (p2_cmd_instr          ),
  .p2_cmd_bl          (p2_cmd_bl             ),
  .p2_cmd_byte_addr   (p2_cmd_byte_addr      ),
  .p2_cmd_empty       (p2_cmd_empty          ),
  .p2_cmd_full        (p2_cmd_full           ),
  .p2_wr_clk          (p2_wr_clk             ),
  .p2_wr_en           (p2_wr_en              ),
  .p2_wr_mask         (p2_wr_mask            ),
  .p2_wr_data         (p2_wr_data            ),
  .p2_wr_full         (p2_wr_full            ),
  .p2_wr_empty        (p2_wr_empty           ),
  .p2_wr_count        (p2_wr_count           ),
  .p2_wr_underrun     (p2_wr_underrun        ),
  .p2_wr_error        (p2_wr_error           ),
  .p2_rd_clk          (p2_rd_clk             ),
  .p2_rd_en           (p2_rd_en              ),
  .p2_rd_data         (p2_rd_data            ),
  .p2_rd_full         (p2_rd_full            ),
  .p2_rd_empty        (p2_rd_empty           ),
  .p2_rd_count        (p2_rd_count           ),
  .p2_rd_overflow     (p2_rd_overflow        ),
  .p2_rd_error        (p2_rd_error           ),
  //P.ort 3
  .p3_cmd_clk         (clk                   ),
  .p3_cmd_en          (cmd_en                ),
  .p3_cmd_instr       (cmd_instr             ),
  .p3_cmd_bl          (cmd_bl                ),
  .p3_cmd_byte_addr   (cmd_byte_addr         ),
  .p3_cmd_empty       (cmd_empty             ),
  .p3_cmd_full        (cmd_full              ),
  .p3_wr_clk          (wr_clk                ),
  .p3_wr_en           (wr_en                 ),
  .p3_wr_mask         (wr_mask               ),
  .p3_wr_data         (wr_data               ),
  .p3_wr_full         (wr_full               ),
  .p3_wr_empty        (wr_empty              ),
  .p3_wr_count        (wr_count              ),
  .p3_wr_underrun     (wr_underrun           ),
  .p3_wr_error        (wr_error              ),
  .p3_rd_clk          (rd_clk                ),
  .p3_rd_en           (rd_en                 ),
  .p3_rd_data         (rd_data               ),
  .p3_rd_full         (rd_full               ),
  .p3_rd_empty        (rd_empty              ),
  .p3_rd_count        (rd_count              ),
  .p3_rd_overflow     (rd_overflow           ),
  .p3_rd_error        (rd_error              )
);
assign  w_wbs0_ack              = 0;
assign  w_wbs0_dat_o            = 0;
assign  start                   = 1;
always #`CLK_HALF_PERIOD    clk = ~clk;
assign  clk_100mhz              = clk;
assign p0_cmd_clk               = clk;
assign p0_cmd_en                = 0;
assign p0_cmd_instr             = 0;
assign p0_cmd_bl                = 0;
assign p0_cmd_byte_addr         = 0;
assign p0_wr_clk                = clk;
assign p0_wr_en                 = 0;
assign p0_wr_mask               = 0;
assign p0_wr_data               = 0;
assign p0_rd_clk                = clk;
assign p0_rd_en                 = 0;
assign p0_rd_data               = 0;
assign p1_cmd_clk               = clk;
assign p1_cmd_en                = 0;
assign p1_cmd_instr             = 0;
assign p1_cmd_bl                = 0;
assign p1_cmd_byte_addr         = 0;
assign p1_wr_clk                = clk;
assign p1_wr_en                 = 0;
assign p1_wr_mask               = 0;
assign p1_wr_data               = 0;
assign p1_rd_clk                = clk;
assign p1_rd_en                 = 0;
assign p1_rd_data               = 0;
assign p2_cmd_clk               = clk;
assign p2_cmd_en                = 0;
assign p2_cmd_instr             = 0;
assign p2_cmd_bl                = 0;
assign p2_cmd_byte_addr         = 0;
assign p2_wr_clk                = clk;
assign p2_wr_en                 = 0;
assign p2_wr_mask               = 0;
assign p2_wr_data               = 0;
assign p2_rd_clk                = clk;
assign p2_rd_en                 = 0;
assign p2_rd_data               = 0;
initial begin
  fd_out                        = 0;
  read_count                    = 0;
  data_count                    = 0;
  timeout_count                 = 0;
  request_more_data_ack         <=  0;
  execute_command               <=  0;
  $dumpfile ("design.vcd");
  $dumpvars (0, wishbone_master_tb);
  fd_in                         = $fopen(`INPUT_FILE, "r");
  fd_out                        = $fopen(`OUTPUT_FILE, "w");
  `SLEEP_HALF_CLK;
  rst                           <= 0;
  `SLEEP_CLK(100);
  rst                           <= 1;
  //clear the handler signals
  r_in_ready                    <= 0;
  r_in_command                  <= 0;
  r_in_address                  <= 32'h0;
  r_in_data                     <= 32'h0;
  r_in_data_count               <= 0;
  r_out_ready                   <= 0;
  //clear wishbone signals
  `SLEEP_CLK(10);
  rst                           <= 0;
  r_out_ready                   <= 1;
  if (fd_in == 0) begin
    $display ("TB: input stimulus file was not found");
  end
  else begin
    //while there is still data to be read from the file
    while (!$feof(fd_in)) begin
      //read in a command
      read_count = $fscanf (fd_in, "%h:%h:%h:%h\n",
                                  r_in_data_count,
                                  r_in_command,
                                  r_in_address,
                                  r_in_data);
      //Handle Frindge commands/comments
      if (read_count != 4) begin
        if (read_count == 0) begin
          ch = $fgetc(fd_in);
          if (ch == "\#") begin
            //$display ("Eat a comment");
            //Eat the line
            while (ch != "\n") begin
              ch = $fgetc(fd_in);
            end
            `ifdef VERBOSE $display (""); `endif
          end
          else begin
            `ifdef VERBOSE $display ("Error unrecognized line: %h" % ch); `endif
            //Eat the line
            while (ch != "\n") begin
              ch = $fgetc(fd_in);
            end
          end
        end
        else if (read_count == 1) begin
          `ifdef VERBOSE $display ("Sleep for %h Clock cycles", r_in_data_count); `endif
          `SLEEP_CLK(r_in_data_count);
          `ifdef VERBOSE $display ("Sleep Finished"); `endif
        end
        else begin
          `ifdef VERBOSE $display ("Error: read_count = %h != 4", read_count); `endif
          `ifdef VERBOSE $display ("Character: %h", ch); `endif
        end
      end
      else begin
        //`ifdef VERBOSE
        case (r_in_command)
          0: $display ("TB: Executing PING commad");
          1: $display ("TB: Executing WRITE command");
          2: $display ("TB: Executing READ command");
          3: $display ("TB: Executing RESET command");
        endcase
        //`endif
        `ifdef VERBOSE $display ("Execute Command"); `endif
        execute_command                 <= 1;
        `SLEEP_CLK(1);
        while (~command_finished) begin
          request_more_data_ack         <= 0;
          if ((r_in_command & 32'h0000FFFF) == 1) begin
            if (request_more_data && ~request_more_data_ack) begin
              read_count      = $fscanf(fd_in, "%h\n", r_in_data);
              `ifdef VERBOSE $display ("TB: reading a new double word: %h", r_in_data); `endif
              request_more_data_ack     <= 1;
            end
          end
          //so time porgresses wait a tick
          `SLEEP_CLK(1);
          //this doesn't need to be here, but there is a weird behavior in iverilog
          //that wont allow me to put a delay in right before an 'end' statement
          //execute_command <= 1;
        end //while command is not finished
        execute_command <= 0;
        while (command_finished) begin
          //`ifdef VERBOSE $display ("Command Finished"); `endif
          $display ("Command Finished");
          `SLEEP_CLK(1);
          execute_command <= 0;
        end
        `SLEEP_CLK(50);
        `ifdef VERBOSE $display ("TB: finished command"); `endif
      end //end read_count == 4
    end //end while ! eof
  end //end not reset
  `SLEEP_CLK(50);
  $fclose (fd_in);
  $fclose (fd_out);
  $finish();
end
//initial begin
//    $monitor("%t, state: %h", $time, state);
//end
//initial begin
//    $monitor("%t, data: %h, state: %h, execute command: %h", $time, w_wbm_dat_o, state, execute_command);
//end
//initial begin
    //$monitor("%t, state: %h, execute: %h, cmd_fin: %h", $time, state, execute_command, command_finished);
    //$monitor("%t, state: %h, write_size: %d, write_count: %d, execute: %h", $time, state, r_in_data_count, data_write_count, execute_command);
//end
always @ (posedge clk) begin
  if (rst) begin
    state                     <= WAIT_FOR_SDRAM;
    request_more_data         <= 0;
    timeout_count             <= 0;
    prev_int                  <= 0;
    r_ih_reset                <= 0;
    data_write_count          <= 0;
    data_read_count           <= 1;
    command_finished          <= 0;
  end
  else begin
    r_ih_reset                <= 0;
    r_in_ready                <= 0;
    r_out_ready               <= 1;
    command_finished          <= 0;
    //Countdown the NACK timeout
    if (execute_command && timeout_count < `TIMEOUT_COUNT) begin
      timeout_count           <= timeout_count + 1;
    end
    if (execute_command && timeout_count >= `TIMEOUT_COUNT) begin
      `ifdef VERBOSE
      case (r_in_command)
        0: $display ("TB: Master timed out while executing PING commad");
        1: $display ("TB: Master timed out while executing WRITE command");
        2: $display ("TB: Master timed out while executing READ command");
        3: $display ("TB: Master timed out while executing RESET command");
      endcase
      `endif
      command_finished        <= 1;
      state                   <= IDLE;
      timeout_count           <= 0;
    end //end reached the end of a timeout
    case (state)
      WAIT_FOR_SDRAM: begin
        timeout_count         <= 0;
        r_in_ready            <= 0;
        //Uncomment 'start' conditional to wait for SDRAM  to finish starting
        //up
        if (start) begin
          `ifdef VERBOSE $display            ("TB: sdram is ready"); `endif
          state                 <=  IDLE;
        end
      end
      IDLE: begin
        timeout_count         <= 0;
        command_finished      <= 0;
        data_write_count      <= 1;
        if (execute_command && !command_finished) begin
          state               <=  SEND_COMMAND;
        end
        data_read_count       <= 1;
      end
      SEND_COMMAND: begin
        timeout_count         <= 0;
        if (w_master_ready) begin
          r_in_ready          <=  1;
          state               <=  MASTER_READ_COMMAND;
        end
      end
      MASTER_READ_COMMAND: begin
        r_in_ready            <=  1;
        if (!w_master_ready) begin
          r_in_ready          <=  0;
          case (r_in_command & 32'h0000FFFF)
            0: begin
              state             <=  PING_RESPONSE;
            end
            1: begin
              if (r_in_data_count > 1) begin
                `ifdef VERBOSE $display ("TB:\tWrote Double Word %d: %h", data_write_count, r_in_data); `endif
                if (data_write_count < r_in_data_count) begin
                  state           <=  WRITE_DATA;
                  timeout_count   <=  0;
                  data_write_count<=  data_write_count + 1;
                end
                else begin
                  `ifdef VERBOSE $display ("TB: Finished Writing: %d 32bit words of %d size", r_in_data_count, data_write_count); `endif
                  state           <=  WRITE_RESPONSE;
                end
              end
              else begin
                `ifdef VERBOSE $display ("TB:\tWrote Double Word %d: %h", data_write_count, r_in_data); `endif
                `ifdef VERBOSE $display ("TB: Finished Writing: %d 32bit words of %d size", r_in_data_count, data_write_count); `endif
                state           <=  WRITE_RESPONSE;
              end
            end
            2: begin
              state             <=  READ_RESPONSE;
            end
            3: begin
              state             <=  RESET;
            end
          endcase
        end
      end
      RESET: begin
        r_ih_reset            <=  1;
        state                 <=  RESET;
      end
      PING_RESPONSE: begin
        if (w_out_en) begin
          if (w_out_status[7:0] == 8'hFF) begin
            `ifdef VERBOSE $display ("TB: Ping Response Good"); `endif
          end
          else begin
            `ifdef VERBOSE $display ("TB: Ping Response Bad (Malformed response: %h)", w_out_status); `endif
          end
          `ifdef VERBOSE $display ("TB: \tS:A:D = %h:%h:%h\n", w_out_status, w_out_address, w_out_data); `endif
          state               <=  FINISHED;
        end
      end
      WRITE_DATA: begin
        if (!r_in_ready && w_master_ready) begin
          state               <=  GET_WRITE_DATA;
          request_more_data   <=  1;
        end
      end
      WRITE_RESPONSE: begin
        `ifdef VERBOSE $display ("In Write Response"); `endif
        if (w_out_en) begin
          if (w_out_status[7:0] == (~(8'h01))) begin
            `ifdef VERBOSE $display ("TB: Write Response Good"); `endif
          end
          else begin
            `ifdef VERBOSE $display ("TB: Write Response Bad (Malformed response: %h)", w_out_status); `endif
          end
          `ifdef VERBOSE $display ("TB: \tS:A:D = %h:%h:%h\n", w_out_status, w_out_address, w_out_data); `endif
          state               <=  FINISHED;
        end
      end
      GET_WRITE_DATA: begin
        if (request_more_data_ack) begin
          request_more_data   <=  0;
          r_in_ready          <=  1;
          state               <=  SEND_COMMAND;
        end
      end
      READ_RESPONSE: begin
        if (w_out_en) begin
          if (w_out_status[7:0] == (~(8'h02))) begin
            `ifdef VERBOSE $display ("TB: Read Response Good"); `endif
            if (w_out_data_count > 0) begin
              if (data_read_count < w_out_data_count) begin
                state           <=  READ_MORE_DATA;
                timeout_count   <=  0;
                data_read_count <=  data_read_count + 1;
              end
              else begin
                state           <=  FINISHED;
              end
            end
          end
          else begin
            `ifdef VERBOSE $display ("TB: Read Response Bad (Malformed response: %h)", w_out_status); `endif
            state               <=  FINISHED;
          end
          `ifdef VERBOSE $display ("TB: \tS:A:D = %h:%h:%h\n", w_out_status, w_out_address, w_out_data); `endif
        end
      end
      READ_MORE_DATA: begin
        if (w_out_en) begin
          timeout_count         <=  0;
          r_out_ready           <=  0;
          `ifdef VERBOSE $display ("TB: Read a 32bit data packet"); `endif
          `ifdef VERBOSE $display ("TB: \tRead Data: %h", w_out_data); `endif
          data_read_count       <=  data_read_count + 1;
        end
        if (data_read_count >= r_in_data_count) begin
          state                 <=  FINISHED;
        end
      end
      FINISHED: begin
        command_finished        <=  1;
        if (!execute_command) begin
          `ifdef VERBOSE $display ("Execute Command is low"); `endif
          command_finished      <=  0;
          state                 <=  IDLE;
        end
      end
    endcase
    if (w_out_en && w_out_status == `PERIPH_INTERRUPT) begin
      `ifdef VERBOSE $display("TB: Output Handler Recieved interrupt"); `endif
      `ifdef VERBOSE $display("TB:\tcommand: %h", w_out_status); `endif
      `ifdef VERBOSE $display("TB:\taddress: %h", w_out_address); `endif
      `ifdef VERBOSE $display("TB:\tdata: %h", w_out_data); `endif
    end
  end//not reset
end
endmodule