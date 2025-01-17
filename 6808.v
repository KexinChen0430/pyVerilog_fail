module wb_i2c (
  input               clk,
  input               rst,
  //wishbone slave signals
  input               i_wbs_we,
  input               i_wbs_stb,
  input               i_wbs_cyc,
  input       [3:0]   i_wbs_sel,
  input       [31:0]  i_wbs_adr,
  input       [31:0]  i_wbs_dat,
  output reg  [31:0]  o_wbs_dat,
  output reg          o_wbs_ack,
  output reg          o_wbs_int,
  inout               scl,
  inout               sda
);
localparam           ADDR_CONTROL        = 32'h00000000;
localparam           ADDR_STATUS         = 32'h00000001;
localparam           ADDR_CLOCK_RATE     = 32'h00000002;
localparam           ADDR_CLOCK_DIVIDER  = 32'h00000003;
localparam           ADDR_COMMAND        = 32'h00000004;
localparam           ADDR_TRANSMIT       = 32'h00000005;
localparam           ADDR_RECEIVE        = 32'h00000006;
//Registers/Wires
reg         [15:0]  clock_divider;
reg         [7:0]   control;
reg         [7:0]   transmit;
wire        [7:0]   receive;
reg         [7:0]   command;
wire        [7:0]   status;
wire                done;
//core enable signal
wire                core_en;
wire                ien;
//Control Register bits
wire                start;
wire                stop;
wire                read;
wire                write;
wire                ack;
reg                 iack;
wire                core_reset;
//Status Register
wire                irxack;
reg                 rxack;      //Received acknowledge from slave
reg                 tip;        //Tranfer in progress
reg                 irq_flag;   //interrupt pending flag
wire                i2c_busy;   //busy (start sigal detected)
wire                i2c_al;     //arbitration lost
reg                 al;         //arbitration lost
//Assigns
//Command
assign  start               = command[0];
assign  stop                = command[1];
assign  read                = command[2];
assign  write               = command[3];
assign  ack                 = command[4];
// Control
assign  core_en             = control[0];
assign  ien                 = control[1];
assign  set_100khz          = control[2];
assign  set_400khz          = control[3];
assign  core_reset          = control[7];
// assign status register bits
assign status[7]            = rxack;
assign status[6]            = i2c_busy;
assign status[5]            = al;
assign status[4:2]          = 3'h0; // reserved
assign status[1]            = tip;
assign status[0]            = irq_flag;
assign  scl                 = scl_oen ? 1'hZ : scl_out;
assign  sda                 = sda_oen ? 1'hZ : sda_out;
i2c_master_byte_ctrl byte_controller (
  .clk      (clk              ),
  .rst      (rst | core_reset ),
  .nReset   (1                ),
  .ena      (core_en          ),
  .clk_cnt  (clock_divider    ),
  .start    (start            ),
  .stop     (stop             ),
  .read     (read             ),
  .write    (write            ),
  .ack_in   (ack              ),
  .din      (transmit         ),
  .cmd_ack  (done             ),
  .ack_out  (irxack           ),
  .dout     (receive          ),
  .i2c_busy (i2c_busy         ),
  .i2c_al   (i2c_al           ),
  .scl_i    (scl              ),
  .scl_o    (scl_out          ),
  .scl_oen  (scl_oen          ),
  .sda_i    (sda              ),
  .sda_o    (sda_out          ),
  .sda_oen  (sda_oen          )
);
//blocks
always @ (posedge clk) begin
  if (rst) begin
    o_wbs_dat         <= 32'h0;
    o_wbs_ack         <= 0;
    o_wbs_int         <= 0;
    clock_divider       <=  `CLK_DIVIDE_100KHZ;
    control             <=  8'h01;
    transmit            <=  8'h00;
    command             <=  8'h00;
    al                  <=  0;
    rxack               <=  0;
    tip                 <=  0;
    irq_flag            <=  0;
    iack                <=  0;
  end
  else begin
    iack                      <=  0;
    //when the master acks our ack, then put our ack down
    if (o_wbs_ack & ~ i_wbs_stb)begin
      o_wbs_ack       <=  0;
      //clear IRQ ACK bit
      command[0]      <=  0;
    end
    if (i_wbs_stb & i_wbs_cyc) begin
      //master is requesting something
      o_wbs_int         <=  0;
      //acknowledge an interrupt
      iack              <=  1;
      if (i_wbs_we) begin
        //write request
        case (i_wbs_adr)
          ADDR_CONTROL: begin
            control           <=  i_wbs_dat[7:0];
          end
          ADDR_CLOCK_DIVIDER: begin
            clock_divider         <=  i_wbs_dat[15:0];
          end
          ADDR_COMMAND: begin
            command           <=  i_wbs_dat[7:0];
          end
          ADDR_TRANSMIT: begin
            transmit          <=  i_wbs_dat[7:0];
          end
          default: begin
          end
        endcase
      end
      else begin
        //reset the interrupt when the user reads anything
        //read request
        case (i_wbs_adr)
          ADDR_CONTROL: begin
            o_wbs_dat         <=  {24'h000000, control};
          end
          ADDR_STATUS: begin
            o_wbs_dat         <=  {24'h000000, status};
          end
          ADDR_CLOCK_RATE: begin
            o_wbs_dat         <=  `CLOCK_RATE;
          end
          ADDR_CLOCK_DIVIDER: begin
            o_wbs_dat         <=  {16'h0000, clock_divider};
          end
          ADDR_COMMAND: begin
            o_wbs_dat         <=  {24'h000000, command};
          end
          ADDR_TRANSMIT: begin
            o_wbs_dat         <=  {24'h000000, transmit};
          end
          ADDR_RECEIVE: begin
            o_wbs_dat         <=  {24'h000000, receive};
          end
          default: begin
            o_wbs_dat         <=  32'h0000000;
          end
        endcase
      end
      o_wbs_ack <= 1;
    end
    //clear the reserved bits
    command[7:5]              <=  2'b00;
    if (set_100khz) begin
      clock_divider     <= `CLK_DIVIDE_100KHZ;
      //reset the control so they don't keep firing off
      control[2]    <=  0;
      control[3]    <=  0;
    end
    if (set_400khz) begin
      //reset the control so they don't keep firing off
      clock_divider     <= `CLK_DIVIDE_400KHZ;
      control[2]    <=  0;
      control[3]    <=  0;
    end
    if (core_reset) begin
      control[7]    <=  0;
    end
    //control/status
    al                        <=  i2c_al | (al & ~start);
    rxack                     <=  irxack;
    tip                       <=  (read | write);
	  irq_flag <= (done | i2c_al | irq_flag) & ~iack; // interrupt request flag is always generated
    if (irq_flag && ien) begin
      //interrupt enable and irq_flag fired off
      o_wbs_int       <=  1;
    end
    //Handle Status/Control oneshots
    if (done | i2c_al) begin
      command[3:0]    <=  4'h0;
    end
  end
end
endmodule