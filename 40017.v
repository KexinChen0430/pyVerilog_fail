module
 output         [6:0] sys_mon_addr_o,            // System monitor address
 output reg           sys_mon_en_o,              // System monitor enable
 input        [15:0]  sys_mon_data_i,            // Data from system monitor
 input                sys_mon_rdy_i,             // System monitor data valid
 //enet
 output               o_enet_enable,             // Ethernet controller enable
 output               o_enet_loopback,
 output       [31:0]  o_enet_send_data_size,     // Length to data to be sent from DDR
 output       [31:0]  o_enet_rcv_data_size,      // Length to data to be written into DDR
 output       [31:0]  o_enet_ddr_src_addr,       // DDR source address for send data
 output       [31:0]  o_enet_ddr_dest_addr,      // DDR destination address for receive data
 input        [31:0]  i_enet_rx_cnt,
 input        [31:0]  i_enet_tx_cnt,
 input                i_enet_rx_done,
 input                i_enet_tx_done
 );
 parameter  VER = 32'h00000005;                   // Present Version Number. 16 bit major version and 16 bit minor version
 //Interrupt state machine state variables.
 localparam INTR_IDLE =  'd0,
            WAIT_ACK  =  'd1;
//The global register set in the address of address
reg [31:0] SCR_PAD;
reg [31:0] CTRL_REG;
reg [31:0] STAT_REG;
reg [31:0] USR_CTRL_REG;
reg [31:0] PIO_ADDR;
reg [31:0] PIO_RD_DATA;
reg [31:0] PIO_WR_DATA;
reg [31:0] PC_DDR_DMA_SYS;
reg [31:0] PC_DDR_DMA_FPGA;
reg [31:0] PC_DDR_DMA_LEN;
reg [31:0] DDR_PC_DMA_SYS;
reg [31:0] DDR_PC_DMA_FPGA;
reg [31:0] DDR_PC_DMA_LEN;
reg [31:0] ETH_SEND_DATA_SIZE;
reg [31:0] ETH_RCV_DATA_SIZE;
reg [31:0] ETH_DDR_SRC_ADDR;
reg [31:0] ETH_DDR_DST_ADDR;
reg [31:0] RECONFIG_ADDR;
reg [31:0] PC_USER1_DMA_SYS;
reg [31:0] PC_USER1_DMA_LEN;
reg [31:0] USER1_PC_DMA_SYS;
reg [31:0] USER1_PC_DMA_LEN;
reg [31:0] USER1_DDR_STR_ADDR;
reg [31:0] USER1_DDR_STR_LEN;
reg [31:0] DDR_USER1_STR_ADDR;
reg [31:0] DDR_USER1_STR_LEN;
reg [31:0] PC_USER2_DMA_SYS;
reg [31:0] PC_USER2_DMA_LEN;
reg [31:0] USER2_PC_DMA_SYS;
reg [31:0] USER2_PC_DMA_LEN;
reg [31:0] DDR_USER2_STR_ADDR;
reg [31:0] DDR_USER2_STR_LEN;
reg [31:0] USER2_DDR_STR_ADDR;
reg [31:0] USER2_DDR_STR_LEN;
reg [31:0] PC_USER3_DMA_SYS;
reg [31:0] PC_USER3_DMA_LEN;
reg [31:0] USER3_PC_DMA_SYS;
reg [31:0] USER3_PC_DMA_LEN;
reg [31:0] DDR_USER3_STR_ADDR;
reg [31:0] DDR_USER3_STR_LEN;
reg [31:0] USER3_DDR_STR_ADDR;
reg [31:0] USER3_DDR_STR_LEN;
reg [31:0] PC_USER4_DMA_SYS;
reg [31:0] PC_USER4_DMA_LEN;
reg [31:0] USER4_PC_DMA_SYS;
reg [31:0] USER4_PC_DMA_LEN;
reg [31:0] DDR_USER4_STR_ADDR;
reg [31:0] DDR_USER4_STR_LEN;
reg [31:0] USER4_DDR_STR_ADDR;
reg [31:0] USER4_DDR_STR_LEN;
reg [15:0] SYS_MON_DATA;
reg [31:0] ETH_RX_TIMER;
reg [31:0] ETH_TX_TIMER;
//local registers
reg        ddr_rd_ack;
reg        ddr_rd_ack_p;
reg        fpga_reg_wr_ack;
reg        ddr_pio_wr_ack;
reg        ddr_pio_wr_ack_p;
reg        ddr_pio_data_valid_p;
reg        ddr_pio_data_valid_f;
reg        system_dma_ack;
reg        system_dma_ack_p;
reg        clr_sys_ddr_dma_req;
reg        sys_ddr_dma_last_flag;
reg        sys_mon_rd_ack;
reg        sys_mon_rd_ack_p;
reg        sys_mon_en;
reg        sys_mon_en_p;
reg        intr_state;
reg        processor_clr_intr;
reg        ddr_user1_str_done;
reg        ddr_user1_str_done_p;
reg        user1_dma_done;
reg        user1_dma_done_f;
reg        ddr_user2_str_done;
reg        ddr_user2_str_done_p;
reg        user2_dma_done;
reg        user2_dma_done_f;
reg        ddr_user3_str_done;
reg        ddr_user3_str_done_p;
reg        user3_dma_done;
reg        user3_dma_done_f;
reg        ddr_user4_str_done;
reg        ddr_user4_str_done_p;
reg        user4_dma_done;
reg        user4_dma_done_f;
reg        enet_rx_done_sync_d1;
reg        enet_rx_done_sync;
reg        enet_tx_done_sync_d1;
reg        enet_tx_done_sync;
reg  [1:0] prev_user_clk;
reg        user_swtch_clk_p;
reg        user_swtch_clk;
reg        user_clk_swtch_done;
reg        user_clk_swch_p;
wire       intr_pending;
reg        enet_done;
reg        enet_done_p;
reg        enet_intr;
reg        enet_link_stat;
reg        enet_link_stat_p;
reg        ddr_link_stat;
reg        ddr_link_stat_p;
assign  ddr_sys_dma_wr_addr_o     = DDR_PC_DMA_SYS;
assign  o_pcie_ddr_ctrl_en        = CTRL_REG[0];
assign  o_pcie_ddr_dma_done_ack   = STAT_REG[0];
assign  o_pcie_ddr_dma_src_addr   = PC_DDR_DMA_SYS;
assign  o_pcie_ddr_dma_len        = PC_DDR_DMA_LEN;
assign  fpga_system_dma_req_o     = CTRL_REG[1];
assign  sys_fpga_dma_addr_o       = PC_DDR_DMA_FPGA;
assign  fpga_sys_dma_addr_o       = DDR_PC_DMA_FPGA;
assign  ddr_pio_addr_o            = PIO_ADDR;
assign  ddr_pio_data_o            = PIO_WR_DATA;
assign  dma_len_o                 = DDR_PC_DMA_LEN;
assign  o_enet_enable             = CTRL_REG[2];
assign  o_load_bitstream          = CTRL_REG[3];
assign  o_enet_loopback           = 1'b0;
assign  o_user_str1_en            = CTRL_REG[4];
assign  o_user_str1_done_ack      = STAT_REG[4];
assign  o_user_str1_dma_addr      = PC_USER1_DMA_SYS;
assign  o_user_str1_dma_len       = PC_USER1_DMA_LEN;
assign  user1_sys_strm_en_o       = CTRL_REG[5];
assign  user1_sys_strm_done_ack_o = STAT_REG[5];
assign  user1_sys_dma_wr_addr_o   = USER1_PC_DMA_SYS;
assign  user1_sys_stream_len_o    = USER1_PC_DMA_LEN;
assign  o_ddr_user1_str_en        = CTRL_REG[6];
assign  o_ddr_user1_str_done_ack  = STAT_REG[6];
assign  o_ddr_user1_str_addr      = DDR_USER1_STR_ADDR;
assign  o_ddr_user1_str_len       = DDR_USER1_STR_LEN;
assign  o_user1_ddr_str_en        = CTRL_REG[7];
assign  o_user1_ddr_str_done_ack  = STAT_REG[7];
assign  o_user1_ddr_str_len       = USER1_DDR_STR_LEN;
assign  o_user1_ddr_str_addr      = USER1_DDR_STR_ADDR;
assign  o_user_str2_en            = CTRL_REG[8];
assign  o_user_str2_done_ack      = STAT_REG[8];
assign  o_user_str2_dma_addr      = PC_USER2_DMA_SYS;
assign  o_user_str2_dma_len       = PC_USER2_DMA_LEN;
assign  user2_sys_strm_en_o       = CTRL_REG[9];
assign  user2_sys_strm_done_ack_o = STAT_REG[9];
assign  user2_sys_dma_wr_addr_o   = USER2_PC_DMA_SYS;
assign  user2_sys_stream_len_o    = USER2_PC_DMA_LEN;
assign  o_ddr_user2_str_en        = CTRL_REG[10];
assign  o_ddr_user2_str_done_ack  = STAT_REG[10];
assign  o_ddr_user2_str_addr      = DDR_USER2_STR_ADDR;
assign  o_ddr_user2_str_len       = DDR_USER2_STR_LEN;
assign  o_user2_ddr_str_en        = CTRL_REG[11];
assign  o_user2_ddr_str_done_ack  = STAT_REG[11];
assign  o_user2_ddr_str_len       = USER2_DDR_STR_LEN;
assign  o_user2_ddr_str_addr      = USER2_DDR_STR_ADDR;
assign  o_user_str3_en            = CTRL_REG[12];
assign  o_user_str3_done_ack      = STAT_REG[12];
assign  o_user_str3_dma_addr      = PC_USER3_DMA_SYS;
assign  o_user_str3_dma_len       = PC_USER3_DMA_LEN;
assign  user3_sys_strm_en_o       = CTRL_REG[13];
assign  user3_sys_strm_done_ack_o = STAT_REG[13];
assign  user3_sys_dma_wr_addr_o   = USER3_PC_DMA_SYS;
assign  user3_sys_stream_len_o    = USER3_PC_DMA_LEN;
assign  o_ddr_user3_str_en        = CTRL_REG[14];
assign  o_ddr_user3_str_done_ack  = STAT_REG[14];
assign  o_ddr_user3_str_addr      = DDR_USER3_STR_ADDR;
assign  o_ddr_user3_str_len       = DDR_USER3_STR_LEN;
assign  o_user3_ddr_str_en        = CTRL_REG[15];
assign  o_user3_ddr_str_done_ack  = STAT_REG[15];
assign  o_user3_ddr_str_len       = USER3_DDR_STR_LEN;
assign  o_user3_ddr_str_addr      = USER3_DDR_STR_ADDR;
assign  o_user_str4_en            = CTRL_REG[16];
assign  o_user_str4_done_ack      = STAT_REG[16];
assign  o_user_str4_dma_addr      = PC_USER4_DMA_SYS;
assign  o_user_str4_dma_len       = PC_USER4_DMA_LEN;
assign  user4_sys_strm_en_o       = CTRL_REG[17];
assign  user4_sys_strm_done_ack_o = STAT_REG[17];
assign  user4_sys_dma_wr_addr_o   = USER4_PC_DMA_SYS;
assign  user4_sys_stream_len_o    = USER4_PC_DMA_LEN;
assign  o_ddr_user4_str_en        = CTRL_REG[18];
assign  o_ddr_user4_str_done_ack  = STAT_REG[18];
assign  o_ddr_user4_str_addr      = DDR_USER4_STR_ADDR;
assign  o_ddr_user4_str_len       = DDR_USER4_STR_LEN;
assign  o_user4_ddr_str_en        = CTRL_REG[19];
assign  o_user4_ddr_str_done_ack  = STAT_REG[19];
assign  o_user4_ddr_str_len       = USER4_DDR_STR_LEN;
assign  o_user4_ddr_str_addr      = USER4_DDR_STR_ADDR;
assign  user_reset_o             = USR_CTRL_REG[0];
assign  user_clk_sel_o           = USR_CTRL_REG[2:1];
assign  o_enet_send_data_size    = ETH_SEND_DATA_SIZE;
assign  o_enet_rcv_data_size     = ETH_RCV_DATA_SIZE;
assign  o_enet_ddr_src_addr      = ETH_DDR_SRC_ADDR;
assign  o_enet_ddr_dest_addr     = ETH_DDR_DST_ADDR;
assign  o_boot_address           = RECONFIG_ADDR;
assign  fpga_reg_wr_ack_o        = fpga_reg_wr_ack|ddr_pio_data_valid_f;
assign  sys_mon_addr_o           = addr_i[8:2];
assign  user_intr_ack_o          = processor_clr_intr & data_i[3];
assign  intr_pending             = |STAT_REG[19:0];
//Clock synchronizers for signals from DDR clock domain (200Mhz)
always @(posedge clk_i)
begin
    ddr_rd_ack           <=   ddr_pio_rd_ack_i;
    ddr_rd_ack_p         <=   ddr_rd_ack;
    system_dma_ack       <=   fpga_system_dma_ack_i;
    system_dma_ack_p     <=   system_dma_ack;
    ddr_pio_wr_ack       <=   ddr_pio_wr_ack_i;
    ddr_pio_wr_ack_p     <=   ddr_pio_wr_ack;
    ddr_pio_data_valid_p <=   ddr_pio_data_valid_o;
    ddr_pio_data_valid_f <=  ~ddr_pio_data_valid_o & ddr_pio_data_valid_p;
    sys_mon_rd_ack       <=   sys_mon_rdy_i;
    sys_mon_rd_ack_p     <=   sys_mon_rd_ack;
    ddr_user1_str_done   <=   i_ddr_user1_str_done;
    ddr_user1_str_done_p <=   ddr_user1_str_done;
    user1_dma_done       <=   i_user1_ddr_str_done;
    user1_dma_done_f     <=   user1_dma_done;
    ddr_user2_str_done   <=   i_ddr_user2_str_done;
    ddr_user2_str_done_p <=   ddr_user2_str_done;
    user2_dma_done       <=   i_user2_ddr_str_done;
    user2_dma_done_f     <=   user2_dma_done;
    ddr_user3_str_done   <=   i_ddr_user3_str_done;
    ddr_user3_str_done_p <=   ddr_user3_str_done;
    user3_dma_done       <=   i_user3_ddr_str_done;
    user3_dma_done_f     <=   user3_dma_done;
    ddr_user4_str_done   <=   i_ddr_user4_str_done;
    ddr_user4_str_done_p <=   ddr_user4_str_done;
    user4_dma_done       <=   i_user4_ddr_str_done;
    user4_dma_done_f     <=   user4_dma_done;
    enet_done_p          <=   enet_done;
    enet_done            <=   i_enet_tx_done && i_enet_rx_done;
    enet_intr            <=   enet_done & ~enet_done_p;
    enet_link_stat       <=   i_enet_link_stat;
    enet_link_stat_p     <=   enet_link_stat;
    ddr_link_stat        <=   i_ddr_link_stat;
    ddr_link_stat_p      <=   ddr_link_stat;
end
//Clock synchronization for system monitor enable (50 MHz)
always @(posedge sys_mon_clk_i)
begin
    sys_mon_en_p <= sys_mon_en;
    sys_mon_en_o <= sys_mon_en_p;
end
// Read register data based on address. Registers for user stream interface are kept as write only so that
// when unused those are automatically optimised by the tool
always @(*)
begin
    case(addr_i)
        `VER:begin
            data_o  <=    VER;
        end
        `SCR:begin
            data_o  <=    SCR_PAD;
        end
        `CTRL:begin
            data_o  <=    CTRL_REG;
        end
        `STA:begin
            data_o  <=    STAT_REG;
        end
        `PC_DDR_DMA_SYS:begin
            data_o  <=    PC_DDR_DMA_SYS;
         end
        `PC_DDR_DMA_FPGA:begin
            data_o  <=    PC_DDR_DMA_FPGA;
        end
        `PC_DDR_DMA_LEN:begin
            data_o  <=    PC_DDR_DMA_LEN;
        end
        `DDR_PC_DMA_SYS:begin
            data_o  <=    DDR_PC_DMA_SYS;
        end
        `DDR_PC_DMA_FPGA:begin
            data_o  <=    DDR_PC_DMA_FPGA;
        end
        `DDR_PC_DMA_LEN:begin
            data_o  <=    DDR_PC_DMA_LEN;
        end
        `PIOA:begin
            data_o  <=    PIO_ADDR;
        end
        `PIOD:begin
            data_o  <=    PIO_RD_DATA;
        end
        `UCTR:begin
            data_o  <=    USR_CTRL_REG;
        end
        `RECONFIG_ADDR:begin
            data_o   <=    RECONFIG_ADDR;
        end
        `ETH_RX_STATISTIC: begin
            data_o  <=    ETH_RX_TIMER;
        end
        `ETH_TX_STATISTIC: begin
            data_o  <=    ETH_TX_TIMER;
        end
        default:begin
            data_o  <=    SYS_MON_DATA;
        end
    endcase
end
// Write to global registers based on address and data valid and ack
always @(posedge clk_i)
begin
    fpga_reg_wr_ack              <=   1'b0;
    ddr_pc_dma_sys_addr_load_o   <=   1'b0;
    if(data_valid_i)
    begin
    fpga_reg_wr_ack   <=   1'b1;
        case(addr_i)
            `SCR:begin
                SCR_PAD  <=   data_i;
            end
            `UCTR:begin
                USR_CTRL_REG      <=   data_i;
            end
            `PIOA:begin
                PIO_ADDR          <=   data_i;
            end
            `PIOD:begin
                PIO_WR_DATA       <=   data_i;
                fpga_reg_wr_ack   <=   1'b0;
            end
                `PC_DDR_DMA_SYS:begin
                PC_DDR_DMA_SYS    <=  data_i;
            end
            `PC_DDR_DMA_FPGA:begin
                PC_DDR_DMA_FPGA   <=   data_i;
            end
            `PC_DDR_DMA_LEN:begin
                PC_DDR_DMA_LEN    <=   data_i;
            end
            `DDR_PC_DMA_SYS:begin
                DDR_PC_DMA_SYS     <= data_i;
                ddr_pc_dma_sys_addr_load_o  <=   1'b1;
            end
            `DDR_PC_DMA_FPGA:begin
                DDR_PC_DMA_FPGA <= data_i;
            end
            `DDR_PC_DMA_LEN:begin
                DDR_PC_DMA_LEN <= data_i;
            end
            `ETH_SEND_DATA_SIZE:begin
                ETH_SEND_DATA_SIZE  <=  data_i;
            end
            `ETH_RCV_DATA_SIZE:begin
                ETH_RCV_DATA_SIZE  <=  data_i;
            end
            `ETH_DDR_SRC_ADDR:begin
                ETH_DDR_SRC_ADDR   <=  data_i;
            end
            `ETH_DDR_DST_ADDR:begin
                ETH_DDR_DST_ADDR   <=  data_i;
            end
            `RECONFIG_ADDR:begin
                RECONFIG_ADDR   <=    data_i;
            end
            `PC_USER1_DMA_SYS:begin
                PC_USER1_DMA_SYS   <=   data_i;
            end
            `PC_USER1_DMA_LEN:begin
                PC_USER1_DMA_LEN  <=   data_i;
            end
            `USER1_PC_DMA_SYS:begin
                USER1_PC_DMA_SYS  <= data_i;
            end
            `USER1_PC_DMA_LEN:begin
                USER1_PC_DMA_LEN  <= data_i;
            end
            `USER1_DDR_STR_ADDR:begin
                USER1_DDR_STR_ADDR <=  data_i;
            end
            `USER1_DDR_STR_LEN:begin
                USER1_DDR_STR_LEN <=  data_i;
            end
            `DDR_USER1_STR_ADDR:begin
                DDR_USER1_STR_ADDR <= data_i;
            end
            `DDR_USER1_STR_LEN:begin
                DDR_USER1_STR_LEN <= data_i;
            end
            `PC_USER2_DMA_SYS:begin
                PC_USER2_DMA_SYS   <=   data_i;
            end
            `PC_USER2_DMA_LEN:begin
                PC_USER2_DMA_LEN  <=   data_i;
            end
            `USER2_PC_DMA_SYS:begin
                USER2_PC_DMA_SYS  <= data_i;
            end
            `USER2_PC_DMA_LEN:begin
                USER2_PC_DMA_LEN  <= data_i;
            end
            `USER2_DDR_STR_ADDR:begin
                USER2_DDR_STR_ADDR <=  data_i;
            end
            `USER2_DDR_STR_LEN:begin
                USER2_DDR_STR_LEN <=  data_i;
            end
            `DDR_USER2_STR_ADDR:begin
                DDR_USER2_STR_ADDR <= data_i;
            end
            `DDR_USER2_STR_LEN:begin
                DDR_USER2_STR_LEN <= data_i;
            end
            `PC_USER3_DMA_SYS:begin
                PC_USER3_DMA_SYS   <=   data_i;
            end
            `PC_USER3_DMA_LEN:begin
                PC_USER3_DMA_LEN  <=   data_i;
            end
            `USER3_PC_DMA_SYS:begin
                USER3_PC_DMA_SYS  <= data_i;
            end
            `USER3_PC_DMA_LEN:begin
                USER3_PC_DMA_LEN  <= data_i;
            end
            `USER3_DDR_STR_ADDR:begin
                USER3_DDR_STR_ADDR <=  data_i;
            end
            `USER3_DDR_STR_LEN:begin
                USER3_DDR_STR_LEN <=  data_i;
            end
            `DDR_USER3_STR_ADDR:begin
                DDR_USER3_STR_ADDR <= data_i;
            end
            `DDR_USER3_STR_LEN:begin
                DDR_USER3_STR_LEN <= data_i;
            end
            `PC_USER4_DMA_SYS:begin
                PC_USER4_DMA_SYS   <=   data_i;
            end
            `PC_USER4_DMA_LEN:begin
                PC_USER4_DMA_LEN  <=   data_i;
            end
            `USER4_PC_DMA_SYS:begin
                USER4_PC_DMA_SYS  <= data_i;
            end
            `USER4_PC_DMA_LEN:begin
                USER4_PC_DMA_LEN  <= data_i;
            end
            `USER4_DDR_STR_ADDR:begin
                USER4_DDR_STR_ADDR <=  data_i;
            end
            `USER4_DDR_STR_LEN:begin
                USER4_DDR_STR_LEN <=  data_i;
            end
            `DDR_USER4_STR_ADDR:begin
                DDR_USER4_STR_ADDR <= data_i;
            end
            `DDR_USER4_STR_LEN:begin
                DDR_USER4_STR_LEN <= data_i;
            end
        endcase
    end
end
//If the read register is not PIO register, ack immediately, else wait until data arrives from DDR
//Address bit 9 is to partiall decode the System monitor address. Be careful when modify the address
//due to this
always @(posedge clk_i)
begin
    if(fpga_reg_rd_i & (addr_i != `PIOD) & addr_i[9] != 1'b1)
        fpga_reg_rd_ack_o    <=   1'b1;
    else
        fpga_reg_rd_ack_o    <=   ddr_rd_ack_p|sys_mon_rd_ack_p;
end
//Request the memory controller for DDR PIO data
always @(posedge clk_i)
begin
    if(ddr_rd_ack_p)
        ddr_pio_rd_req_o    <=   1'b0;
    else if((fpga_reg_rd_i & addr_i == `PIOD)& ~ddr_pio_rd_req_o)
    begin
        ddr_pio_rd_req_o    <=   1'b1;
    end
end
//Latch the PIO data read from DDR
always @(posedge clk_i)
begin
    if(ddr_rd_ack_p)
	begin
       PIO_RD_DATA    <=    ddr_rd_data_i;
	end
end
//Request the memory controller for DDR PIO data
always @(posedge clk_i)
begin
    if(sys_mon_rd_ack_p)
        sys_mon_en    <=   1'b0;
    else if((fpga_reg_rd_i & addr_i[9] == 1'b1) & ~sys_mon_en)
    begin
        sys_mon_en    <=   1'b1;
    end
end
always @(posedge clk_i)
begin
    if(sys_mon_rd_ack_p)
        SYS_MON_DATA <= sys_mon_data_i;
end
//Indicate the memory controller when PIO data is received
always @(posedge clk_i)
begin
    if(data_valid_i & (addr_i == `PIOD))
        ddr_pio_data_valid_o <=  1'b1;
    else if(ddr_pio_wr_ack_p)
        ddr_pio_data_valid_o <=  1'b0;
end
//control register updates
always @(posedge clk_i)
begin
    if(!rst_n)
        CTRL_REG    <=    32'd0;
    else
    begin
        if(data_valid_i & (addr_i == `CTRL))
        begin
            CTRL_REG    <=    CTRL_REG|data_i;   //Internall ored to keep the previously set bits
        end
        else
        begin
            if(i_pcie_ddr_dma_done)
                CTRL_REG[0] <=    1'b0;
            if(system_dma_ack_p)
                CTRL_REG[1] <=    1'b0;
            if (!(enet_rx_done_sync && enet_tx_done_sync))   //for enet
                    CTRL_REG[2] <=    1'b0;
            if(i_user_str1_done)
                CTRL_REG[4] <=    1'b0;
            if(user1_sys_strm_done_i)
                CTRL_REG[5] <=    1'b0;
            if(ddr_user1_str_done_p)
                CTRL_REG[6] <=    1'b0;
            if(user1_dma_done_f)
                CTRL_REG[7] <=    1'b0;
            if(i_user_str2_done)
                CTRL_REG[8] <=    1'b0;
            if(user2_sys_strm_done_i)
                CTRL_REG[9] <=    1'b0;
            if(ddr_user2_str_done_p)
                CTRL_REG[10] <=    1'b0;
            if(user2_dma_done_f)
                CTRL_REG[11] <=    1'b0;
            if(i_user_str3_done)
                CTRL_REG[12] <=    1'b0;
            if(user3_sys_strm_done_i)
                CTRL_REG[13] <=    1'b0;
            if(ddr_user3_str_done_p)
                CTRL_REG[14] <=    1'b0;
            if(user3_dma_done_f)
                CTRL_REG[15] <=    1'b0;
            if(i_user_str4_done)
                CTRL_REG[16] <=    1'b0;
            if(user4_sys_strm_done_i)
                CTRL_REG[17] <=    1'b0;
            if(ddr_user4_str_done_p)
                CTRL_REG[18] <=    1'b0;
            if(user4_dma_done_f)
                CTRL_REG[19] <=    1'b0;
        end
    end
end
//status register updates
always @(posedge clk_i)
begin
    if(!rst_n)
    begin
        STAT_REG             <= 0;
        processor_clr_intr   <= 1'b0;
    end
    else
    begin
        processor_clr_intr   <= 1'b0;
        STAT_REG[31]         <= enet_link_stat_p;
        STAT_REG[30]         <= ddr_link_stat_p;
        STAT_REG[29]         <= i_pcie_link_stat;
        if(data_valid_i & (addr_i == `STA))
        begin
            STAT_REG[19:0]     <=   STAT_REG[19:0]^data_i[19:0];
            processor_clr_intr <=   1'b1;
        end
        else
        begin
            if(i_pcie_ddr_dma_done)
                STAT_REG[0] <=    1'b1;  //indicates system to fpga dma is complete
            if(system_dma_ack_p)
                STAT_REG[1] <=    1'b1;
            if(enet_intr)        //for enet
                STAT_REG[2] <=    1'b1;
            if(user_intr_req_i & ~user_intr_ack_o)
                STAT_REG[3] <=    1'b1;
            if(i_user_str1_done)
                STAT_REG[4] <=    1'b1;
            if(user1_sys_strm_done_i)
                 STAT_REG[5] <=    1'b1;
            if(ddr_user1_str_done_p)
                STAT_REG[6] <=    1'b1;
            if(user1_dma_done_f)
                STAT_REG[7] <=    1'b1;
            if(i_user_str2_done)
                STAT_REG[8] <=    1'b1;
            if(user2_sys_strm_done_i)
                STAT_REG[9] <=    1'b1;
            if(ddr_user2_str_done_p)
                STAT_REG[10] <=    1'b1;
            if(user2_dma_done_f)
                STAT_REG[11] <=    1'b1;
            if(i_user_str3_done)
                STAT_REG[12] <=    1'b1;
            if(user3_sys_strm_done_i)
                 STAT_REG[13] <=    1'b1;
            if(ddr_user3_str_done_p)
                STAT_REG[14] <=    1'b1;
            if(user3_dma_done_f)
                STAT_REG[15] <=    1'b1;
            if(i_user_str4_done)
                STAT_REG[16] <=    1'b1;
            if(user4_sys_strm_done_i)
                STAT_REG[17] <=    1'b1;
            if(ddr_user4_str_done_p)
                STAT_REG[18] <=    1'b1;
            if(user4_dma_done_f)
                STAT_REG[19] <=    1'b1;
        end
    end
end
//Interrupt control state machine. This is to make sure that the host PC doesn't miss any interrupt signal
//Once an interrupt is issued, the state machine waits until the host write into the status register indicating
//that it has received the interrupt.
always @(posedge clk_i)
begin
    if(!rst_n)
	 begin
	     intr_state  <=  INTR_IDLE;
		  intr_req_o  <=  1'b0;
	 end
	 else
	 begin
	     case(intr_state)
		      INTR_IDLE:begin
				    if(intr_pending)
					 begin
					     intr_req_o   <=   1'b1;
						  intr_state   <=  WAIT_ACK;
					 end
				end
				WAIT_ACK:begin
				    if(intr_req_done_i)
					     intr_req_o   <=   1'b0;
					 if(processor_clr_intr)
                   intr_state    <=    INTR_IDLE;
				end
		  endcase
	 end
end
// Clock Sync for Ethernet Done Signals
always @(posedge clk_i)
begin
    if(!rst_n)
    begin
        enet_rx_done_sync_d1 <= 1'b1;
        enet_tx_done_sync_d1 <= 1'b1;
        enet_rx_done_sync    <= 1'b1;
        enet_tx_done_sync    <= 1'b1;
    end
    else begin
        enet_rx_done_sync_d1 <= i_enet_rx_done;
        enet_rx_done_sync    <= enet_rx_done_sync_d1;
        enet_tx_done_sync_d1 <= i_enet_tx_done;
        enet_tx_done_sync    <= enet_tx_done_sync_d1;
    end
end
always @(posedge clk_i)
begin
    if(!rst_n)
    begin
        ETH_RX_TIMER <= 32'd0;
        ETH_TX_TIMER <= 32'd0;
    end
    else begin
        if (CTRL_REG[2] && (~enet_rx_done_sync))
            ETH_RX_TIMER <= 32'd0; // Reset at start of a Test
        if (CTRL_REG[2] && (~enet_tx_done_sync))
            ETH_TX_TIMER <= 32'd0; // Reset at start of a Test
        if (enet_rx_done_sync)
            ETH_RX_TIMER <= i_enet_rx_cnt;
        if (enet_tx_done_sync)
            ETH_TX_TIMER <= i_enet_tx_cnt;
    end
end
always @(posedge clk_i)
begin
    if(prev_user_clk != USR_CTRL_REG[2:1])
	     user_swtch_clk  <=  1'b1;
	 else if(user_clk_swtch_done)
	     user_swtch_clk  <=  1'b0;
	prev_user_clk   <=  USR_CTRL_REG[2:1];
	user_clk_swch_p <=  user_clk_swch_o;
	user_clk_swtch_done <=  user_clk_swch_p;
end
always @(posedge sys_mon_clk_i)
begin
    user_swtch_clk_p  <=  user_swtch_clk;
    user_clk_swch_o   <=  user_swtch_clk_p;
end
endmodule