module user_logic
(
  Bus2IP_Clk,                     // Bus to IP clock
  Bus2IP_Reset,                   // Bus to IP reset
  Bus2IP_Data,                    // Bus to IP data bus
  Bus2IP_BE,                      // Bus to IP byte enables
  Bus2IP_RdCE,                    // Bus to IP read chip enable
  Bus2IP_WrCE,                    // Bus to IP write chip enable
  IP2Bus_Data,                    // IP to Bus data bus
  IP2Bus_RdAck,                   // IP to Bus read transfer acknowledgement
  IP2Bus_WrAck,                   // IP to Bus write transfer acknowledgement
  IP2Bus_Error                    // IP to Bus error response
); // user_logic
parameter C_SLV_DWIDTH                   = 32;
parameter C_NUM_REG                      = 8;
input                                     Bus2IP_Clk;
input                                     Bus2IP_Reset;
input      [0 : C_SLV_DWIDTH-1]           Bus2IP_Data;
input      [0 : C_SLV_DWIDTH/8-1]         Bus2IP_BE;
input      [0 : C_NUM_REG-1]              Bus2IP_RdCE;
input      [0 : C_NUM_REG-1]              Bus2IP_WrCE;
output     [0 : C_SLV_DWIDTH-1]           IP2Bus_Data;
output                                    IP2Bus_RdAck;
output                                    IP2Bus_WrAck;
output                                    IP2Bus_Error;
// Implementation
  // Nets for user logic slave model s/w accessible register example
  reg        [0 : C_SLV_DWIDTH-1]           slv_reg0;
  reg        [0 : C_SLV_DWIDTH-1]           slv_reg1;
  reg        [0 : C_SLV_DWIDTH-1]           slv_reg2;
  reg        [0 : C_SLV_DWIDTH-1]           slv_reg3;
  reg        [0 : C_SLV_DWIDTH-1]           slv_reg4;
  reg        [0 : C_SLV_DWIDTH-1]           slv_reg5;
  reg        [0 : C_SLV_DWIDTH-1]           slv_reg6;
  reg        [0 : C_SLV_DWIDTH-1]           slv_reg7;
  wire       [0 : 7]                        slv_reg_write_sel;
  wire       [0 : 7]                        slv_reg_read_sel;
  reg        [0 : C_SLV_DWIDTH-1]           slv_ip2bus_data;
  wire                                      slv_read_ack;
  wire                                      slv_write_ack;
  integer                                   byte_index, bit_index;
  reg [0 : C_SLV_DWIDTH-1] t_ROkey;
  reg [0 : C_SLV_DWIDTH-1] t_ROdata;
  wire			   t_Q_full;
  wire			   t_Q_empty;
  wire			   t_insert;
  wire			   t_extract;
  TSProject32 ts1(.clk(Bus2IP_Clk), .reset(Bus2IP_Reset),
                 .insert(t_op0), .extract(t_op1),
                 .LIkey(slv_reg4), .LIdata(slv_reg5),
                 .ROkey(t_ROkey), .ROdata(t_ROdata),
                 .Q_FULL(t_Q_full), .Q_EMPTY(t_Q_empty));
  assign t_op0 = slv_reg0[0:0];
  assign t_op1 = slv_reg1[0:0];
  // Example code to read/write user logic slave model s/w accessible registers
  // Note:
  // The example code presented here is to show you one way of reading/writing
  // software accessible registers implemented in the user logic slave model.
  // Each bit of the Bus2IP_WrCE/Bus2IP_RdCE signals is configured to correspond
  // to one software accessible register by the top level template. For example,
  // if you have four 32 bit software accessible registers in the user logic,
  // you are basically operating on the following memory mapped registers:
  //    Bus2IP_WrCE/Bus2IP_RdCE   Memory Mapped Register
  //                     "1000"   C_BASEADDR + 0x0
  //                     "0100"   C_BASEADDR + 0x4
  //                     "0010"   C_BASEADDR + 0x8
  //                     "0001"   C_BASEADDR + 0xC
  assign
    slv_reg_write_sel = Bus2IP_WrCE[0:7],
    slv_reg_read_sel  = Bus2IP_RdCE[0:7],
    slv_write_ack     = Bus2IP_WrCE[0] || Bus2IP_WrCE[1] || Bus2IP_WrCE[2] || Bus2IP_WrCE[3] || Bus2IP_WrCE[4] || Bus2IP_WrCE[5] || Bus2IP_WrCE[6] || Bus2IP_WrCE[7],
    slv_read_ack      = Bus2IP_RdCE[0] || Bus2IP_RdCE[1] || Bus2IP_RdCE[2] || Bus2IP_RdCE[3] || Bus2IP_RdCE[4] || Bus2IP_RdCE[5] || Bus2IP_RdCE[6] || Bus2IP_RdCE[7];
  // implement slave model register(s)
  always @( posedge Bus2IP_Clk )
    begin: SLAVE_REG_WRITE_PROC
      if ( Bus2IP_Reset == 1 )
        begin
          slv_reg0 <= 0;
          slv_reg1 <= 0;
          slv_reg2 <= 0;
          slv_reg3 <= 0;
          slv_reg4 <= 0;
          slv_reg5 <= 0;
          slv_reg6 <= 0;
          slv_reg7 <= 0;
        end
      else
        case ( slv_reg_write_sel )
          8'b10000000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                for ( bit_index = byte_index*8; bit_index <= byte_index*8+7; bit_index = bit_index+1 )
                  slv_reg0[bit_index] <= Bus2IP_Data[bit_index];
          8'b01000000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                for ( bit_index = byte_index*8; bit_index <= byte_index*8+7; bit_index = bit_index+1 )
                  slv_reg1[bit_index] <= Bus2IP_Data[bit_index];
          8'b00100000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                for ( bit_index = byte_index*8; bit_index <= byte_index*8+7; bit_index = bit_index+1 )
                  slv_reg2[bit_index] <= Bus2IP_Data[bit_index];
          8'b00010000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                for ( bit_index = byte_index*8; bit_index <= byte_index*8+7; bit_index = bit_index+1 )
                  slv_reg3[bit_index] <= Bus2IP_Data[bit_index];
          8'b00001000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                for ( bit_index = byte_index*8; bit_index <= byte_index*8+7; bit_index = bit_index+1 )
                  slv_reg4[bit_index] <= Bus2IP_Data[bit_index];
          8'b00000100 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                for ( bit_index = byte_index*8; bit_index <= byte_index*8+7; bit_index = bit_index+1 )
                  slv_reg5[bit_index] <= Bus2IP_Data[bit_index];
          8'b00000010 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                for ( bit_index = byte_index*8; bit_index <= byte_index*8+7; bit_index = bit_index+1 )
                  slv_reg6[bit_index] <= Bus2IP_Data[bit_index];
          8'b00000001 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                for ( bit_index = byte_index*8; bit_index <= byte_index*8+7; bit_index = bit_index+1 )
                  slv_reg7[bit_index] <= Bus2IP_Data[bit_index];
          default : ;
        endcase
    end // SLAVE_REG_WRITE_PROC
  // implement slave model register read mux
  always @( slv_reg_read_sel or slv_reg0 or slv_reg1 or slv_reg2 or slv_reg3 or slv_reg4 or slv_reg5 or slv_reg6 or slv_reg7 )
    begin: SLAVE_REG_READ_PROC
      case ( slv_reg_read_sel )
        8'b10000000 : slv_ip2bus_data <= slv_reg0;
        8'b01000000 : slv_ip2bus_data <= slv_reg1;
        8'b00100000 : slv_ip2bus_data <= slv_reg2;
        8'b00010000 : slv_ip2bus_data <= slv_reg3;
        8'b00001000 : slv_ip2bus_data <= slv_reg4;
        8'b00000100 : slv_ip2bus_data <= slv_reg5;
        8'b00000010 : slv_ip2bus_data <= t_ROkey; //slv_reg6;
        8'b00000001 : slv_ip2bus_data <= t_ROdata;//slv_reg7;
        default : slv_ip2bus_data <= 0;
      endcase
    end // SLAVE_REG_READ_PROC
  // Example code to drive IP to Bus signals
  assign IP2Bus_Data    = slv_ip2bus_data;
  assign IP2Bus_WrAck   = slv_write_ack;
  assign IP2Bus_RdAck   = slv_read_ack;
  assign IP2Bus_Error   = 0;
endmodule