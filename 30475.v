module wb_logic_analyzer # (
  parameter                             CAPTURE_DEPTH     = 10,
  parameter                             DEFAULT_BAUDRATE  = 115200
) (
  input                                 clk,
  input                                 rst,
  //Wishbone Bus Signals
  input                                 i_wbs_we,
  input                                 i_wbs_cyc,
  input       [3:0]                     i_wbs_sel,
  input       [31:0]                    i_wbs_dat,
  input                                 i_wbs_stb,
  output  reg                           o_wbs_ack,
  output  reg [31:0]                    o_wbs_dat,
  input       [31:0]                    i_wbs_adr,
  output  reg                           o_wbs_int,
  //logic anayzer signals
  input                                 i_la_clk,
  input       [`CAPTURE_WIDTH - 1:0]    i_la_data,
  input                                 i_la_ext_trig,
  input                                 i_phy_rx,
  output                                o_phy_tx
);
//Local Parameters
localparam    CONTROL       = 32'h00000000;
localparam    STATUS        = 32'h00000001;
localparam    TRIGGER       = 32'h00000002;
localparam    TRIGGER_MASK  = 32'h00000003;
localparam    TRIGGER_AFTER = 32'h00000004;
localparam    TRIGGER_EDGE  = 32'h00000005;
localparam    BOTH_EDGES    = 32'h00000006;
localparam    REPEAT_COUNT  = 32'h00000007;
localparam    DATA_COUNT    = 32'h00000008;
localparam    START_POS     = 32'h00000009;
localparam    CLOCK_RATE    = 32'h0000000A;
localparam    READ_DATA     = 32'h0000000B;
//Local Registers/Wires
reg   [31:0]          r_trigger;
reg   [31:0]          r_trigger_mask;
reg   [31:0]          r_trigger_after;
reg   [31:0]          r_trigger_edge;
reg   [31:0]          r_repeat_count;
reg   [31:0]          r_both_edges;
reg   [31:0]          r_clock_divider;
wire  [31:0]          w_cap_data_size;
wire                  w_finished;
reg                   r_uart_en = 1;
reg                   r_force_stb;
wire                  w_force_stb;
reg                   r_data_read_en;
reg                   r_data_read_count;
reg                   r_ctr_rst;
reg                   r_ctr_int_en;
reg                   r_ctr_en_la;
reg                   r_ctr_restart_la;
reg   [31:0]          r_bram_read_addr;
wire  [31:0]          w_bram_read_data;
reg   [3:0]           r_bram_sleep;
reg                   r_prev_cyc;
wire                  w_posedge_cyc;
wire  [31:0]          w_start_pos;
wire                  w_la_reset;
//data interface
wire   [31:0]         data_read_size;
wire   [31:0]         data_read_addr;
wire                  data_read_strobe;
wire   [31:0]         data;
wire    [31:0]        w_uart_trigger;
wire    [31:0]        w_uart_trigger_mask;
wire    [31:0]        w_uart_trigger_after;
wire    [31:0]        w_uart_trigger_edge;
wire    [31:0]        w_uart_both_edges;
wire    [31:0]        w_uart_repeat_count;
wire                  w_uart_la_reset;
wire                  w_uart_la_force_trig;
wire                  w_uart_set_stb;
wire                  w_uart_la_en;
wire                  uart_la_reset;
wire    [31:0]        w_uart_read_addr;
wire    [31:0]        w_la_read_addr;
assign  w_la_read_addr  = (r_uart_en) ? w_uart_read_addr : r_bram_read_addr;
cross_clock_enable en_la_rst (
  .rst                    (rst                      ),
  .in_en                  (r_ctr_rst                ),
  .out_clk                (i_la_clk                 ),
  .out_en                 (w_la_reset               )
);
cross_clock_strobe en_la_force_stb (
  .rst                    (rst                      ),
  .in_stb                 (r_force_stb              ),
  .in_clk                 (clk                      ),
  .out_clk                (i_la_clk                 ),
  .out_stb                (w_force_stb              )
);
uart_la_interface # (
  .DEFAULT_BAUDRATE       (DEFAULT_BAUDRATE         )
) ula (
  .clk                    (clk                      ),
  .rst                    (rst                      ),
  .o_en_la                (w_uart_la_en             ),
  .o_la_reset             (w_uart_la_reset          ),
  .o_force_trigger        (w_uart_force_trig        ),
  .i_finished             (w_uart_la_en && w_finished ),
  .i_start_pos            (w_start_pos              ),
  .o_uart_set_value_stb   (w_uart_set_stb           ),
  //logic analyzer control
  .o_trigger              (w_uart_trigger           ),
  .o_trigger_mask         (w_uart_trigger_mask      ),
  .o_trigger_after        (w_uart_trigger_after     ),
  .o_trigger_edge         (w_uart_trigger_edge      ),
  .o_both_edges           (w_uart_both_edges        ),
  .o_repeat_count         (w_uart_repeat_count      ),
  //data interface
  .i_la_rd_size           (w_cap_data_size          ),
  .o_la_rd_addr           (w_uart_read_addr         ),
  .i_la_rd_data           (w_bram_read_data         ),
  .i_phy_rx               (i_phy_rx                 ),
  .o_phy_tx               (o_phy_tx                 )
);
//Submodules
logic_analyzer # (
  .CAPTURE_WIDTH          (`CAPTURE_WIDTH           ),
  .CAPTURE_DEPTH          (CAPTURE_DEPTH            )
) la (
  .clk                    (clk                      ),
  .rst                    (w_la_reset               ),
  .i_cap_clk              (i_la_clk                 ),
  .i_cap_ext_trig         (i_la_ext_trig            ),
  .i_cap_data             (i_la_data                ),
  .i_trigger              (r_trigger                ),
  .i_trigger_mask         (r_trigger_mask           ),
  .i_trigger_after        (r_trigger_after          ),
  .i_trigger_edge         (r_trigger_edge           ),
  .i_both_edges           (r_both_edges             ),
  .i_repeat_count         (r_repeat_count           ),
  .i_enable               (r_ctr_en_la              ),
  .i_restart              (r_ctr_restart_la         ),
  .o_capture_start        (w_start_pos              ),
  .o_finished             (w_finished               ),
  .o_capture_size         (w_cap_data_size          ),
  .i_force_stb            (w_force_stb              ),
  .i_bram_addr            (w_la_read_addr           ),
  .o_bram_data            (w_bram_read_data         )
);
//Asynchronous Logic
assign  w_posedge_cyc   = ( i_wbs_cyc & !r_prev_cyc);
//Synchronous Logic
always @ (posedge clk) begin
  r_ctr_restart_la          <= 0;
  r_force_stb               <= 0;
  r_ctr_rst                 <= 0;
  if (rst) begin
    o_wbs_dat               <= 32'h0;
    o_wbs_ack               <= 0;
    o_wbs_int               <= 0;
    r_trigger               <= 0;
    r_trigger_mask          <= 0;
    r_trigger_after         <= 0;
    r_trigger_edge          <= 0;
    r_both_edges            <= 0;
    r_clock_divider         <= 0;
    r_repeat_count          <= 0;
    r_data_read_en          <= 0;
    r_data_read_count       <= 0;
    r_ctr_int_en            <= 0;
    r_ctr_en_la             <= 0;
    r_bram_read_addr        <= 0;
    r_bram_sleep            <= 0;
    r_prev_cyc              <= 0;
    r_uart_en               <= 1;
  end
  else begin
    if (r_ctr_restart_la) begin
      r_ctr_en_la           <=  1;
    end
    if (r_ctr_rst) begin
      r_ctr_en_la           <=  0;
    end
    //when the master acks our ack, then put our ack down
    if (o_wbs_ack && ~i_wbs_stb)begin
      o_wbs_ack             <= 0;
    end
    if (i_wbs_stb && i_wbs_cyc) begin
      //master is requesting somethign
      if (!o_wbs_ack) begin
        if (i_wbs_we) begin
          //write request
          case (i_wbs_adr)
            CONTROL: begin
              r_ctr_rst         <=  i_wbs_dat[`CONTROL_RESET];
              r_ctr_int_en      <=  i_wbs_dat[`CONTROL_ENABLE_INTERRUPT];
              r_ctr_en_la       <=  i_wbs_dat[`CONTROL_ENABLE_LA];
              r_ctr_restart_la  <=  i_wbs_dat[`CONTROL_RESTART_LA];
              r_force_stb       <=  i_wbs_dat[`CONTROL_FORCE_STB];
              r_uart_en         <=  i_wbs_dat[`CONTROL_ENABLE_UART];
            end
            TRIGGER: begin
              r_trigger         <=  i_wbs_dat;
            end
            TRIGGER_MASK: begin
              r_trigger_mask    <=  i_wbs_dat;
            end
            TRIGGER_AFTER: begin
              r_trigger_after   <=  i_wbs_dat;
            end
            TRIGGER_EDGE: begin
              r_trigger_edge    <=  i_wbs_dat;
            end
            BOTH_EDGES: begin
              r_both_edges      <=  i_wbs_dat;
            end
            REPEAT_COUNT: begin
              r_repeat_count    <=  i_wbs_dat;
            end
            default: begin
            end
          endcase
          o_wbs_ack <= 1;
        end
        else begin
          //read request
          case (i_wbs_adr)
            CONTROL: begin
              o_wbs_dat                             <= 0;
              o_wbs_dat[`CONTROL_RESET]             <= r_ctr_rst;
              o_wbs_dat[`CONTROL_ENABLE_INTERRUPT]  <= r_ctr_int_en;
              o_wbs_dat[`CONTROL_ENABLE_LA]         <= r_ctr_en_la;
              o_wbs_dat[`CONTROL_RESTART_LA]        <= r_ctr_restart_la;
              o_wbs_dat[`CONTROL_ENABLE_UART]       <= r_uart_en;
              o_wbs_ack <=  1;
            end
            STATUS: begin
              o_wbs_dat <=  0;
              o_wbs_dat[`STATUS_FINISHED]           <= w_finished;
              o_wbs_ack <=  1;
            end
            TRIGGER: begin
              o_wbs_dat <= r_trigger;
              o_wbs_ack <=  1;
            end
            TRIGGER_MASK: begin
              o_wbs_dat <= r_trigger_mask;
              o_wbs_ack <=  1;
            end
            TRIGGER_AFTER: begin
              o_wbs_dat <= r_trigger_after;
              o_wbs_ack <=  1;
            end
            TRIGGER_EDGE: begin
              o_wbs_dat <= r_trigger_edge;
              o_wbs_ack <=  1;
            end
            BOTH_EDGES: begin
              o_wbs_dat <= r_both_edges;
              o_wbs_ack <=  1;
            end
            REPEAT_COUNT: begin
              o_wbs_dat <= r_repeat_count;
              o_wbs_ack <=  1;
            end
            DATA_COUNT: begin
              o_wbs_dat <=  w_cap_data_size;
              o_wbs_ack <=  1;
            end
            START_POS: begin
              o_wbs_dat <=  w_start_pos;
              o_wbs_ack <=  1;
            end
            CLOCK_RATE: begin
              o_wbs_dat <=  `CLOCK_RATE;
              o_wbs_ack <=  1;
            end
            READ_DATA: begin
              if (!r_data_read_en) begin
                r_bram_sleep        <=  0;
                r_data_read_en      <=  1;
              end
              else begin
                if (r_bram_sleep < `SLEEP_COUNT) begin
                  r_bram_sleep      <=  r_bram_sleep + 1;
                end
                else begin
                  o_wbs_dat         <=  w_bram_read_data;
                  r_bram_read_addr  <=  r_bram_read_addr + 1;
                  r_data_read_en    <=  0;
                  o_wbs_ack         <=  1;
                end
              end
            end
            default: begin
              o_wbs_dat <=  0;
              o_wbs_ack <=  1;
            end
          endcase
        end
      end
    end
    r_prev_cyc              <= i_wbs_cyc;
    if (w_posedge_cyc) begin
      //At the beginning of a cycle reset the data read count
      r_data_read_count     <=  0;
      r_bram_read_addr      <=  0;
    end
    o_wbs_int               <=  0;
    if (r_ctr_int_en && w_finished) begin
      o_wbs_int             <=  1;
    end
    if (r_uart_en) begin
      r_ctr_en_la             <=  w_uart_la_en;
      r_ctr_rst               <=  w_uart_la_reset;
      r_force_stb             <=  w_uart_force_trig;
      if (w_uart_set_stb) begin
        r_trigger             <=  w_uart_trigger;
        r_trigger_mask        <=  w_uart_trigger_mask;
        r_trigger_after       <=  w_uart_trigger_after;
        r_trigger_edge        <=  w_uart_trigger_edge;
        r_both_edges          <=  w_uart_both_edges;
        r_repeat_count        <=  w_uart_repeat_count;
      end
    end
  end
end
endmodule