module wb_spi #(
parameter SPI_CHAR_LEN_BITS = 8
)(
  input                         clk,
  input                         rst,
  //wishbone slave signals
  input                         i_wbs_we,
  input                         i_wbs_stb,
  input                         i_wbs_cyc,
  input                 [31:0]  i_wbs_adr,
  input                 [31:0]  i_wbs_dat,
  output reg            [31:0]  o_wbs_dat,
  output reg                    o_wbs_ack,
  output reg                    o_wbs_int,
  // SPI signals
  output                [31:0]  ss_pad_o,         // slave select
  //output                        ss_pad_o,         // slave select
  output                        sclk_pad_o,       // serial clock
  output                        mosi_pad_o,       // master out slave in
  input                         miso_pad_i        // master in slave out
);
localparam  SPI_MAX_CHAR        = 2 ** SPI_CHAR_LEN_BITS;
localparam  SPI_MAX_REG_SIZE    = SPI_MAX_CHAR / 32;
//parameters
localparam SPI_CTRL             = 0;
localparam SPI_CLOCK_RATE       = 1;
localparam SPI_DIVIDER          = 2;
localparam SPI_SS               = 3;
localparam SPI_BIT_COUNT        = 4;
localparam SPI_MAX_BITSIZE      = 5;
localparam SPI_RX_DATA          = 6;
localparam SPI_TX_DATA          = ((SPI_RX_DATA) + (SPI_MAX_REG_SIZE));
//Registers/Wires
reg       [31:0]                divider = 100;    // Divider register
reg       [31:0]                ctrl    = 0;      // Control and status register
reg       [31:0]                ss      = 0;      // Slave select register
//reg                             ss      = 0;      // Slave select register
reg       [31:0]                char_len= 8;      // char len
wire      [SPI_MAX_CHAR - 1:0]  rx_data;          // Rx register
wire      [SPI_MAX_CHAR - 1:0]  tx_data;
wire                            rx_negedge;       // miso is sampled on negative edge
wire                            tx_negedge;       // mosi is driven on negative edge
wire                            go;               // go
wire                            lsb;              // lsb first on line
wire                            ie;               // interrupt enable
wire                            ass;              // automatic slave select
wire                            inv_clk;          // invert clock
wire                            spi_ss_sel;       // ss register select
wire                            tip;              // transfer in progress
wire                            pos_edge;         // recognize posedge of sclk
wire                            neg_edge;         // recognize negedge of sclk
wire                            last_bit;         // marks last character bit
wire                            sclk;
wire      [31:0]                read_reg_pos;
wire      [31:0]                write_reg_pos;
reg       [31:0]                tx_data_array     [(SPI_MAX_REG_SIZE - 1):0];
wire      [31:0]                rx_data_array     [(SPI_MAX_REG_SIZE - 1):0];
integer                         i;
//Submodules
spi_clkgen clgen (
  .clk_in             (clk                        ),
  .rst                (rst                        ),
  .go                 (go                         ),
  .enable             (tip                        ),
  .last_clk           (last_bit                   ),
  .divider            (divider                    ),
  .clk_out            (sclk                       ),
  .pos_edge           (pos_edge                   ),
  .neg_edge           (neg_edge                   )
);
spi_shift #(
  .SPI_CHAR_LEN_BITS  (SPI_CHAR_LEN_BITS          )
) shift (
  .clk                (clk                        ),
  .rst                (rst                        ),
  .len                (char_len                   ),
  .lsb                (lsb                        ),
  .go                 (go                         ),
  .pos_edge           (pos_edge                   ),
  .neg_edge           (neg_edge                   ),
  .rx_negedge         (rx_negedge                 ),
  .tx_negedge         (tx_negedge                 ),
  .tip                (tip                        ),
  .last               (last_bit                   ),
  .s_clk              (sclk                       ),
  .s_in               (miso_pad_i                 ),
  .s_out              (mosi_pad_o                 ),
  .mosi_data          (tx_data                    ),
  .miso_data          (rx_data                    )
);
//Asynchronous Logic
genvar gv;
generate
for (gv = 0; gv < SPI_MAX_REG_SIZE; gv = gv + 1) begin : wb_spi_init
  assign  tx_data[((gv << 5) + 31): (gv << 5)]        = tx_data_array[(SPI_MAX_REG_SIZE - 1) - gv];
  assign  rx_data_array[(SPI_MAX_REG_SIZE - 1) - gv]  = rx_data[(gv << 5) + 31: (gv << 5)];
end
endgenerate
// Address decoder
assign  read_reg_valid      = ((i_wbs_adr >= SPI_RX_DATA) && (i_wbs_adr < SPI_TX_DATA));
assign  read_reg_pos        = read_reg_valid ? (i_wbs_adr - SPI_RX_DATA): 0;
assign  write_reg_valid     = (i_wbs_adr >= SPI_TX_DATA) && (i_wbs_adr < (SPI_TX_DATA + (SPI_MAX_REG_SIZE)));
assign  write_reg_pos       = write_reg_valid ? (i_wbs_adr - SPI_TX_DATA): 0;
assign rx_negedge           = ctrl[`SPI_CTRL_RX_NEGEDGE];
assign tx_negedge           = ctrl[`SPI_CTRL_TX_NEGEDGE];
assign go                   = ctrl[`SPI_CTRL_GO];
assign lsb                  = ctrl[`SPI_CTRL_LSB];
assign ie                   = ctrl[`SPI_CTRL_IE];
assign ass                  = ctrl[`SPI_CTRL_ASS];
assign inv_clk              = ctrl[`SPI_CTRL_INV_CLK];
assign ss_pad_o             = ~((ss & {32{tip & ass}}) | (ss & {32{!ass}}));
//assign ss_pad_o             = ~((ss & tip & ass) | (ss & !ass));
//assign ss_pad_o             = !ss;
assign  sclk_pad_o          = inv_clk ? ~sclk : sclk;
//Synchronous Logic
always @ (posedge clk) begin
    if (rst) begin
        o_wbs_dat         <=  32'h00000000;
        o_wbs_ack         <=  0;
        char_len          <=  0;
        ctrl              <=  0;
        divider           <=  100;
        ss                <=  0;
        for (i = 0; i < SPI_MAX_REG_SIZE; i = i + 1) begin
            tx_data_array[i]  <=  i;
        end
    end
    else begin
        //interrupts
        if (ie && tip && last_bit && pos_edge) begin
            o_wbs_int               <=  1;
        end
        else if (o_wbs_ack) begin
            o_wbs_int               <=  0;
        end
        //when the master acks our ack, then put our ack down
        if (o_wbs_ack & ~ i_wbs_stb)begin
            o_wbs_ack               <= 0;
        end
        if (go && last_bit && pos_edge) begin
            ctrl[`SPI_CTRL_GO]      <=  0;
        end
        if (i_wbs_stb & i_wbs_cyc & !o_wbs_ack) begin
            //master is requesting somethign
            if (i_wbs_we && !tip) begin
                //write request
                case (i_wbs_adr)
                    SPI_CTRL: begin
                        ctrl                        <= i_wbs_dat;
                    end
                    SPI_BIT_COUNT: begin
                        char_len                    <= i_wbs_dat;
                    end
                    SPI_DIVIDER: begin
                        divider                     <= i_wbs_dat;
                    end
                    SPI_SS: begin
                        //ss                          <= i_wbs_dat[0];
                        ss                          <= i_wbs_dat;
                    end
                    default: begin
                    end
                endcase
                if (write_reg_valid) begin
                    tx_data_array[write_reg_pos]  <=  i_wbs_dat;
                end
            end
            else begin
                //read request
                case (i_wbs_adr)
                    SPI_CTRL: begin
                        o_wbs_dat                   <=  ctrl;
                    end
                    SPI_BIT_COUNT: begin
                        o_wbs_dat                   <=  char_len;
                    end
                    SPI_DIVIDER: begin
                        o_wbs_dat                   <=  divider;
                    end
                    SPI_SS: begin
                        //o_wbs_dat                   <=  {31'h0, ss};
                        o_wbs_dat                   <=  ss;
                    end
                    SPI_CLOCK_RATE: begin
                        o_wbs_dat                   <= `CLOCK_RATE;
                    end
                    SPI_MAX_BITSIZE: begin
                        o_wbs_dat                   <=  SPI_MAX_CHAR;
                    end
                    default: begin
                        o_wbs_dat                   <=  32'bx;
                    end
                endcase
                if (read_reg_valid) begin
                    o_wbs_dat                   <=  rx_data_array[read_reg_pos];
                end
            end
            o_wbs_ack                         <=  1;
        end
    end
end
endmodule