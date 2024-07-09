module fifo_generator_vlog_beh
  #(
    // Generic Declarations
    parameter C_COMMON_CLOCK                 = 0,
    parameter C_COUNT_TYPE                   = 0,
    parameter C_DATA_COUNT_WIDTH             = 2,
    parameter C_DEFAULT_VALUE                = "",
    parameter C_DIN_WIDTH                    = 8,
    parameter C_DOUT_RST_VAL                 = "",
    parameter C_DOUT_WIDTH                   = 8,
    parameter C_ENABLE_RLOCS                 = 0,
    parameter C_FAMILY                       = "",
    parameter C_FULL_FLAGS_RST_VAL           = 1,
    parameter C_HAS_ALMOST_EMPTY             = 0,
    parameter C_HAS_ALMOST_FULL              = 0,
    parameter C_HAS_BACKUP                   = 0,
    parameter C_HAS_DATA_COUNT               = 0,
    parameter C_HAS_INT_CLK                  = 0,
    parameter C_HAS_MEMINIT_FILE             = 0,
    parameter C_HAS_OVERFLOW                 = 0,
    parameter C_HAS_RD_DATA_COUNT            = 0,
    parameter C_HAS_RD_RST                   = 0,
    parameter C_HAS_RST                      = 1,
    parameter C_HAS_SRST                     = 0,
    parameter C_HAS_UNDERFLOW                = 0,
    parameter C_HAS_VALID                    = 0,
    parameter C_HAS_WR_ACK                   = 0,
    parameter C_HAS_WR_DATA_COUNT            = 0,
    parameter C_HAS_WR_RST                   = 0,
    parameter C_IMPLEMENTATION_TYPE          = 0,
    parameter C_INIT_WR_PNTR_VAL             = 0,
    parameter C_MEMORY_TYPE                  = 1,
    parameter C_MIF_FILE_NAME                = "",
    parameter C_OPTIMIZATION_MODE            = 0,
    parameter C_OVERFLOW_LOW                 = 0,
    parameter C_EN_SAFETY_CKT                = 0,
    parameter C_PRELOAD_LATENCY              = 1,
    parameter C_PRELOAD_REGS                 = 0,
    parameter C_PRIM_FIFO_TYPE               = "4kx4",
    parameter C_PROG_EMPTY_THRESH_ASSERT_VAL = 0,
    parameter C_PROG_EMPTY_THRESH_NEGATE_VAL = 0,
    parameter C_PROG_EMPTY_TYPE              = 0,
    parameter C_PROG_FULL_THRESH_ASSERT_VAL  = 0,
    parameter C_PROG_FULL_THRESH_NEGATE_VAL  = 0,
    parameter C_PROG_FULL_TYPE               = 0,
    parameter C_RD_DATA_COUNT_WIDTH          = 2,
    parameter C_RD_DEPTH                     = 256,
    parameter C_RD_FREQ                      = 1,
    parameter C_RD_PNTR_WIDTH                = 8,
    parameter C_UNDERFLOW_LOW                = 0,
    parameter C_USE_DOUT_RST                 = 0,
    parameter C_USE_ECC                      = 0,
    parameter C_USE_EMBEDDED_REG             = 0,
    parameter C_USE_PIPELINE_REG             = 0,
    parameter C_POWER_SAVING_MODE            = 0,
    parameter C_USE_FIFO16_FLAGS             = 0,
    parameter C_USE_FWFT_DATA_COUNT          = 0,
    parameter C_VALID_LOW                    = 0,
    parameter C_WR_ACK_LOW                   = 0,
    parameter C_WR_DATA_COUNT_WIDTH          = 2,
    parameter C_WR_DEPTH                     = 256,
    parameter C_WR_FREQ                      = 1,
    parameter C_WR_PNTR_WIDTH                = 8,
    parameter C_WR_RESPONSE_LATENCY          = 1,
    parameter C_MSGON_VAL                    = 1,
    parameter C_ENABLE_RST_SYNC              = 1,
    parameter C_ERROR_INJECTION_TYPE         = 0,
    parameter C_SYNCHRONIZER_STAGE           = 2,
    // AXI Interface related parameters start here
    parameter C_INTERFACE_TYPE               = 0, // 0: Native Interface, 1: AXI4 Stream, 2: AXI4/AXI3
    parameter C_AXI_TYPE                     = 0, // 1: AXI4, 2: AXI4 Lite, 3: AXI3
    parameter C_HAS_AXI_WR_CHANNEL           = 0,
    parameter C_HAS_AXI_RD_CHANNEL           = 0,
    parameter C_HAS_SLAVE_CE                 = 0,
    parameter C_HAS_MASTER_CE                = 0,
    parameter C_ADD_NGC_CONSTRAINT           = 0,
    parameter C_USE_COMMON_UNDERFLOW         = 0,
    parameter C_USE_COMMON_OVERFLOW          = 0,
    parameter C_USE_DEFAULT_SETTINGS         = 0,
    // AXI Full/Lite
    parameter C_AXI_ID_WIDTH                 = 0,
    parameter C_AXI_ADDR_WIDTH               = 0,
    parameter C_AXI_DATA_WIDTH               = 0,
    parameter C_AXI_LEN_WIDTH                = 8,
    parameter C_AXI_LOCK_WIDTH               = 2,
    parameter C_HAS_AXI_ID                   = 0,
    parameter C_HAS_AXI_AWUSER               = 0,
    parameter C_HAS_AXI_WUSER                = 0,
    parameter C_HAS_AXI_BUSER                = 0,
    parameter C_HAS_AXI_ARUSER               = 0,
    parameter C_HAS_AXI_RUSER                = 0,
    parameter C_AXI_ARUSER_WIDTH             = 0,
    parameter C_AXI_AWUSER_WIDTH             = 0,
    parameter C_AXI_WUSER_WIDTH              = 0,
    parameter C_AXI_BUSER_WIDTH              = 0,
    parameter C_AXI_RUSER_WIDTH              = 0,
    // AXI Streaming
    parameter C_HAS_AXIS_TDATA               = 0,
    parameter C_HAS_AXIS_TID                 = 0,
    parameter C_HAS_AXIS_TDEST               = 0,
    parameter C_HAS_AXIS_TUSER               = 0,
    parameter C_HAS_AXIS_TREADY              = 0,
    parameter C_HAS_AXIS_TLAST               = 0,
    parameter C_HAS_AXIS_TSTRB               = 0,
    parameter C_HAS_AXIS_TKEEP               = 0,
    parameter C_AXIS_TDATA_WIDTH             = 1,
    parameter C_AXIS_TID_WIDTH               = 1,
    parameter C_AXIS_TDEST_WIDTH             = 1,
    parameter C_AXIS_TUSER_WIDTH             = 1,
    parameter C_AXIS_TSTRB_WIDTH             = 1,
    parameter C_AXIS_TKEEP_WIDTH             = 1,
    // AXI Channel Type
    // WACH --> Write Address Channel
    // WDCH --> Write Data Channel
    // WRCH --> Write Response Channel
    // RACH --> Read Address Channel
    // RDCH --> Read Data Channel
    // AXIS --> AXI Streaming
    parameter C_WACH_TYPE                    = 0, // 0 = FIFO, 1 = Register Slice, 2 = Pass Through Logic
    parameter C_WDCH_TYPE                    = 0, // 0 = FIFO, 1 = Register Slice, 2 = Pass Through Logie
    parameter C_WRCH_TYPE                    = 0, // 0 = FIFO, 1 = Register Slice, 2 = Pass Through Logie
    parameter C_RACH_TYPE                    = 0, // 0 = FIFO, 1 = Register Slice, 2 = Pass Through Logie
    parameter C_RDCH_TYPE                    = 0, // 0 = FIFO, 1 = Register Slice, 2 = Pass Through Logie
    parameter C_AXIS_TYPE                    = 0, // 0 = FIFO, 1 = Register Slice, 2 = Pass Through Logie
    // AXI Implementation Type
    // 1 = Common Clock Block RAM FIFO
    // 2 = Common Clock Distributed RAM FIFO
    // 11 = Independent Clock Block RAM FIFO
    // 12 = Independent Clock Distributed RAM FIFO
    parameter C_IMPLEMENTATION_TYPE_WACH     = 0,
    parameter C_IMPLEMENTATION_TYPE_WDCH     = 0,
    parameter C_IMPLEMENTATION_TYPE_WRCH     = 0,
    parameter C_IMPLEMENTATION_TYPE_RACH     = 0,
    parameter C_IMPLEMENTATION_TYPE_RDCH     = 0,
    parameter C_IMPLEMENTATION_TYPE_AXIS     = 0,
    // AXI FIFO Type
    // 0 = Data FIFO
    // 1 = Packet FIFO
    // 2 = Low Latency Sync FIFO
    // 3 = Low Latency Async FIFO
    parameter C_APPLICATION_TYPE_WACH        = 0,
    parameter C_APPLICATION_TYPE_WDCH        = 0,
    parameter C_APPLICATION_TYPE_WRCH        = 0,
    parameter C_APPLICATION_TYPE_RACH        = 0,
    parameter C_APPLICATION_TYPE_RDCH        = 0,
    parameter C_APPLICATION_TYPE_AXIS        = 0,
    // AXI Built-in FIFO Primitive Type
    // 512x36, 1kx18, 2kx9, 4kx4, etc
    parameter C_PRIM_FIFO_TYPE_WACH          = "512x36",
    parameter C_PRIM_FIFO_TYPE_WDCH          = "512x36",
    parameter C_PRIM_FIFO_TYPE_WRCH          = "512x36",
    parameter C_PRIM_FIFO_TYPE_RACH          = "512x36",
    parameter C_PRIM_FIFO_TYPE_RDCH          = "512x36",
    parameter C_PRIM_FIFO_TYPE_AXIS          = "512x36",
    // Enable ECC
    // 0 = ECC disabled
    // 1 = ECC enabled
    parameter C_USE_ECC_WACH                 = 0,
    parameter C_USE_ECC_WDCH                 = 0,
    parameter C_USE_ECC_WRCH                 = 0,
    parameter C_USE_ECC_RACH                 = 0,
    parameter C_USE_ECC_RDCH                 = 0,
    parameter C_USE_ECC_AXIS                 = 0,
    // ECC Error Injection Type
    // 0 = No Error Injection
    // 1 = Single Bit Error Injection
    // 2 = Double Bit Error Injection
    // 3 = Single Bit and Double Bit Error Injection
    parameter C_ERROR_INJECTION_TYPE_WACH    = 0,
    parameter C_ERROR_INJECTION_TYPE_WDCH    = 0,
    parameter C_ERROR_INJECTION_TYPE_WRCH    = 0,
    parameter C_ERROR_INJECTION_TYPE_RACH    = 0,
    parameter C_ERROR_INJECTION_TYPE_RDCH    = 0,
    parameter C_ERROR_INJECTION_TYPE_AXIS    = 0,
    // Input Data Width
    // Accumulation of all AXI input signal's width
    parameter C_DIN_WIDTH_WACH               = 1,
    parameter C_DIN_WIDTH_WDCH               = 1,
    parameter C_DIN_WIDTH_WRCH               = 1,
    parameter C_DIN_WIDTH_RACH               = 1,
    parameter C_DIN_WIDTH_RDCH               = 1,
    parameter C_DIN_WIDTH_AXIS               = 1,
    parameter C_WR_DEPTH_WACH                = 16,
    parameter C_WR_DEPTH_WDCH                = 16,
    parameter C_WR_DEPTH_WRCH                = 16,
    parameter C_WR_DEPTH_RACH                = 16,
    parameter C_WR_DEPTH_RDCH                = 16,
    parameter C_WR_DEPTH_AXIS                = 16,
    parameter C_WR_PNTR_WIDTH_WACH           = 4,
    parameter C_WR_PNTR_WIDTH_WDCH           = 4,
    parameter C_WR_PNTR_WIDTH_WRCH           = 4,
    parameter C_WR_PNTR_WIDTH_RACH           = 4,
    parameter C_WR_PNTR_WIDTH_RDCH           = 4,
    parameter C_WR_PNTR_WIDTH_AXIS           = 4,
    parameter C_HAS_DATA_COUNTS_WACH         = 0,
    parameter C_HAS_DATA_COUNTS_WDCH         = 0,
    parameter C_HAS_DATA_COUNTS_WRCH         = 0,
    parameter C_HAS_DATA_COUNTS_RACH         = 0,
    parameter C_HAS_DATA_COUNTS_RDCH         = 0,
    parameter C_HAS_DATA_COUNTS_AXIS         = 0,
    parameter C_HAS_PROG_FLAGS_WACH          = 0,
    parameter C_HAS_PROG_FLAGS_WDCH          = 0,
    parameter C_HAS_PROG_FLAGS_WRCH          = 0,
    parameter C_HAS_PROG_FLAGS_RACH          = 0,
    parameter C_HAS_PROG_FLAGS_RDCH          = 0,
    parameter C_HAS_PROG_FLAGS_AXIS          = 0,
    parameter C_PROG_FULL_TYPE_WACH          = 0,
    parameter C_PROG_FULL_TYPE_WDCH          = 0,
    parameter C_PROG_FULL_TYPE_WRCH          = 0,
    parameter C_PROG_FULL_TYPE_RACH          = 0,
    parameter C_PROG_FULL_TYPE_RDCH          = 0,
    parameter C_PROG_FULL_TYPE_AXIS          = 0,
    parameter C_PROG_FULL_THRESH_ASSERT_VAL_WACH      = 0,
    parameter C_PROG_FULL_THRESH_ASSERT_VAL_WDCH      = 0,
    parameter C_PROG_FULL_THRESH_ASSERT_VAL_WRCH      = 0,
    parameter C_PROG_FULL_THRESH_ASSERT_VAL_RACH      = 0,
    parameter C_PROG_FULL_THRESH_ASSERT_VAL_RDCH      = 0,
    parameter C_PROG_FULL_THRESH_ASSERT_VAL_AXIS      = 0,
    parameter C_PROG_EMPTY_TYPE_WACH         = 0,
    parameter C_PROG_EMPTY_TYPE_WDCH         = 0,
    parameter C_PROG_EMPTY_TYPE_WRCH         = 0,
    parameter C_PROG_EMPTY_TYPE_RACH         = 0,
    parameter C_PROG_EMPTY_TYPE_RDCH         = 0,
    parameter C_PROG_EMPTY_TYPE_AXIS         = 0,
    parameter C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH     = 0,
    parameter C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH     = 0,
    parameter C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH     = 0,
    parameter C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH     = 0,
    parameter C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH     = 0,
    parameter C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS     = 0,
    parameter C_REG_SLICE_MODE_WACH          = 0,
    parameter C_REG_SLICE_MODE_WDCH          = 0,
    parameter C_REG_SLICE_MODE_WRCH          = 0,
    parameter C_REG_SLICE_MODE_RACH          = 0,
    parameter C_REG_SLICE_MODE_RDCH          = 0,
    parameter C_REG_SLICE_MODE_AXIS          = 0
    )
   (
    // Input and Output Declarations
    // Conventional FIFO Interface Signals
    input                               backup,
    input                               backup_marker,
    input                               clk,
    input                               rst,
    input                               srst,
    input                               wr_clk,
    input                               wr_rst,
    input                               rd_clk,
    input                               rd_rst,
    input [C_DIN_WIDTH-1:0]             din,
    input                               wr_en,
    input                               rd_en,
    // Optional inputs
    input [C_RD_PNTR_WIDTH-1:0]         prog_empty_thresh,
    input [C_RD_PNTR_WIDTH-1:0]         prog_empty_thresh_assert,
    input [C_RD_PNTR_WIDTH-1:0]         prog_empty_thresh_negate,
    input [C_WR_PNTR_WIDTH-1:0]         prog_full_thresh,
    input [C_WR_PNTR_WIDTH-1:0]         prog_full_thresh_assert,
    input [C_WR_PNTR_WIDTH-1:0]         prog_full_thresh_negate,
    input                               int_clk,
    input                               injectdbiterr,
    input                               injectsbiterr,
    input                               sleep,
    output [C_DOUT_WIDTH-1:0]           dout,
    output                              full,
    output                              almost_full,
    output                              wr_ack,
    output                              overflow,
    output                              empty,
    output                              almost_empty,
    output                              valid,
    output                              underflow,
    output [C_DATA_COUNT_WIDTH-1:0]     data_count,
    output [C_RD_DATA_COUNT_WIDTH-1:0]  rd_data_count,
    output [C_WR_DATA_COUNT_WIDTH-1:0]  wr_data_count,
    output                              prog_full,
    output                              prog_empty,
    output                              sbiterr,
    output                              dbiterr,
    output                              wr_rst_busy,
    output                              rd_rst_busy,
    // AXI Global Signal
    input                               m_aclk,
    input                               s_aclk,
    input                               s_aresetn,
    input                               s_aclk_en,
    input                               m_aclk_en,
    // AXI Full/Lite Slave Write Channel (write side)
    input [C_AXI_ID_WIDTH-1:0]          s_axi_awid,
    input [C_AXI_ADDR_WIDTH-1:0]        s_axi_awaddr,
    input [C_AXI_LEN_WIDTH-1:0]         s_axi_awlen,
    input [3-1:0]                       s_axi_awsize,
    input [2-1:0]                       s_axi_awburst,
    input [C_AXI_LOCK_WIDTH-1:0]        s_axi_awlock,
    input [4-1:0]                       s_axi_awcache,
    input [3-1:0]                       s_axi_awprot,
    input [4-1:0]                       s_axi_awqos,
    input [4-1:0]                       s_axi_awregion,
    input [C_AXI_AWUSER_WIDTH-1:0]      s_axi_awuser,
    input                               s_axi_awvalid,
    output                              s_axi_awready,
    input [C_AXI_ID_WIDTH-1:0]          s_axi_wid,
    input [C_AXI_DATA_WIDTH-1:0]        s_axi_wdata,
    input [C_AXI_DATA_WIDTH/8-1:0]      s_axi_wstrb,
    input                               s_axi_wlast,
    input [C_AXI_WUSER_WIDTH-1:0]       s_axi_wuser,
    input                               s_axi_wvalid,
    output                              s_axi_wready,
    output [C_AXI_ID_WIDTH-1:0]         s_axi_bid,
    output [2-1:0]                      s_axi_bresp,
    output [C_AXI_BUSER_WIDTH-1:0]      s_axi_buser,
    output                              s_axi_bvalid,
    input                               s_axi_bready,
    // AXI Full/Lite Master Write Channel (read side)
    output [C_AXI_ID_WIDTH-1:0]         m_axi_awid,
    output [C_AXI_ADDR_WIDTH-1:0]       m_axi_awaddr,
    output [C_AXI_LEN_WIDTH-1:0]        m_axi_awlen,
    output [3-1:0]                      m_axi_awsize,
    output [2-1:0]                      m_axi_awburst,
    output [C_AXI_LOCK_WIDTH-1:0]       m_axi_awlock,
    output [4-1:0]                      m_axi_awcache,
    output [3-1:0]                      m_axi_awprot,
    output [4-1:0]                      m_axi_awqos,
    output [4-1:0]                      m_axi_awregion,
    output [C_AXI_AWUSER_WIDTH-1:0]     m_axi_awuser,
    output                              m_axi_awvalid,
    input                               m_axi_awready,
    output [C_AXI_ID_WIDTH-1:0]         m_axi_wid,
    output [C_AXI_DATA_WIDTH-1:0]       m_axi_wdata,
    output [C_AXI_DATA_WIDTH/8-1:0]     m_axi_wstrb,
    output                              m_axi_wlast,
    output [C_AXI_WUSER_WIDTH-1:0]      m_axi_wuser,
    output                              m_axi_wvalid,
    input                               m_axi_wready,
    input [C_AXI_ID_WIDTH-1:0]          m_axi_bid,
    input [2-1:0]                       m_axi_bresp,
    input [C_AXI_BUSER_WIDTH-1:0]       m_axi_buser,
    input                               m_axi_bvalid,
    output                              m_axi_bready,
    // AXI Full/Lite Slave Read Channel (write side)
    input [C_AXI_ID_WIDTH-1:0]          s_axi_arid,
    input [C_AXI_ADDR_WIDTH-1:0]        s_axi_araddr,
    input [C_AXI_LEN_WIDTH-1:0]         s_axi_arlen,
    input [3-1:0]                       s_axi_arsize,
    input [2-1:0]                       s_axi_arburst,
    input [C_AXI_LOCK_WIDTH-1:0]        s_axi_arlock,
    input [4-1:0]                       s_axi_arcache,
    input [3-1:0]                       s_axi_arprot,
    input [4-1:0]                       s_axi_arqos,
    input [4-1:0]                       s_axi_arregion,
    input [C_AXI_ARUSER_WIDTH-1:0]      s_axi_aruser,
    input                               s_axi_arvalid,
    output                              s_axi_arready,
    output [C_AXI_ID_WIDTH-1:0]         s_axi_rid,
    output [C_AXI_DATA_WIDTH-1:0]       s_axi_rdata,
    output [2-1:0]                      s_axi_rresp,
    output                              s_axi_rlast,
    output [C_AXI_RUSER_WIDTH-1:0]      s_axi_ruser,
    output                              s_axi_rvalid,
    input                               s_axi_rready,
    // AXI Full/Lite Master Read Channel (read side)
    output [C_AXI_ID_WIDTH-1:0]         m_axi_arid,
    output [C_AXI_ADDR_WIDTH-1:0]       m_axi_araddr,
    output [C_AXI_LEN_WIDTH-1:0]        m_axi_arlen,
    output [3-1:0]                      m_axi_arsize,
    output [2-1:0]                      m_axi_arburst,
    output [C_AXI_LOCK_WIDTH-1:0]       m_axi_arlock,
    output [4-1:0]                      m_axi_arcache,
    output [3-1:0]                      m_axi_arprot,
    output [4-1:0]                      m_axi_arqos,
    output [4-1:0]                      m_axi_arregion,
    output [C_AXI_ARUSER_WIDTH-1:0]     m_axi_aruser,
    output                              m_axi_arvalid,
    input                               m_axi_arready,
    input [C_AXI_ID_WIDTH-1:0]          m_axi_rid,
    input [C_AXI_DATA_WIDTH-1:0]        m_axi_rdata,
    input [2-1:0]                       m_axi_rresp,
    input                               m_axi_rlast,
    input [C_AXI_RUSER_WIDTH-1:0]       m_axi_ruser,
    input                               m_axi_rvalid,
    output                              m_axi_rready,
    // AXI Streaming Slave Signals (Write side)
    input                               s_axis_tvalid,
    output                              s_axis_tready,
    input [C_AXIS_TDATA_WIDTH-1:0]      s_axis_tdata,
    input [C_AXIS_TSTRB_WIDTH-1:0]      s_axis_tstrb,
    input [C_AXIS_TKEEP_WIDTH-1:0]      s_axis_tkeep,
    input                               s_axis_tlast,
    input [C_AXIS_TID_WIDTH-1:0]        s_axis_tid,
    input [C_AXIS_TDEST_WIDTH-1:0]      s_axis_tdest,
    input [C_AXIS_TUSER_WIDTH-1:0]      s_axis_tuser,
    // AXI Streaming Master Signals (Read side)
    output                              m_axis_tvalid,
    input                               m_axis_tready,
    output [C_AXIS_TDATA_WIDTH-1:0]     m_axis_tdata,
    output [C_AXIS_TSTRB_WIDTH-1:0]     m_axis_tstrb,
    output [C_AXIS_TKEEP_WIDTH-1:0]     m_axis_tkeep,
    output                              m_axis_tlast,
    output [C_AXIS_TID_WIDTH-1:0]       m_axis_tid,
    output [C_AXIS_TDEST_WIDTH-1:0]     m_axis_tdest,
    output [C_AXIS_TUSER_WIDTH-1:0]     m_axis_tuser,
    // AXI Full/Lite Write Address Channel signals
    input                               axi_aw_injectsbiterr,
    input                               axi_aw_injectdbiterr,
    input  [C_WR_PNTR_WIDTH_WACH-1:0]   axi_aw_prog_full_thresh,
    input  [C_WR_PNTR_WIDTH_WACH-1:0]   axi_aw_prog_empty_thresh,
    output [C_WR_PNTR_WIDTH_WACH:0]     axi_aw_data_count,
    output [C_WR_PNTR_WIDTH_WACH:0]     axi_aw_wr_data_count,
    output [C_WR_PNTR_WIDTH_WACH:0]     axi_aw_rd_data_count,
    output                              axi_aw_sbiterr,
    output                              axi_aw_dbiterr,
    output                              axi_aw_overflow,
    output                              axi_aw_underflow,
    output                              axi_aw_prog_full,
    output                              axi_aw_prog_empty,
    // AXI Full/Lite Write Data Channel signals
    input                               axi_w_injectsbiterr,
    input                               axi_w_injectdbiterr,
    input  [C_WR_PNTR_WIDTH_WDCH-1:0]   axi_w_prog_full_thresh,
    input  [C_WR_PNTR_WIDTH_WDCH-1:0]   axi_w_prog_empty_thresh,
    output [C_WR_PNTR_WIDTH_WDCH:0]     axi_w_data_count,
    output [C_WR_PNTR_WIDTH_WDCH:0]     axi_w_wr_data_count,
    output [C_WR_PNTR_WIDTH_WDCH:0]     axi_w_rd_data_count,
    output                              axi_w_sbiterr,
    output                              axi_w_dbiterr,
    output                              axi_w_overflow,
    output                              axi_w_underflow,
    output                              axi_w_prog_full,
    output                              axi_w_prog_empty,
    // AXI Full/Lite Write Response Channel signals
    input                               axi_b_injectsbiterr,
    input                               axi_b_injectdbiterr,
    input  [C_WR_PNTR_WIDTH_WRCH-1:0]   axi_b_prog_full_thresh,
    input  [C_WR_PNTR_WIDTH_WRCH-1:0]   axi_b_prog_empty_thresh,
    output [C_WR_PNTR_WIDTH_WRCH:0]     axi_b_data_count,
    output [C_WR_PNTR_WIDTH_WRCH:0]     axi_b_wr_data_count,
    output [C_WR_PNTR_WIDTH_WRCH:0]     axi_b_rd_data_count,
    output                              axi_b_sbiterr,
    output                              axi_b_dbiterr,
    output                              axi_b_overflow,
    output                              axi_b_underflow,
    output                              axi_b_prog_full,
    output                              axi_b_prog_empty,
    // AXI Full/Lite Read Address Channel signals
    input                               axi_ar_injectsbiterr,
    input                               axi_ar_injectdbiterr,
    input  [C_WR_PNTR_WIDTH_RACH-1:0]   axi_ar_prog_full_thresh,
    input  [C_WR_PNTR_WIDTH_RACH-1:0]   axi_ar_prog_empty_thresh,
    output [C_WR_PNTR_WIDTH_RACH:0]     axi_ar_data_count,
    output [C_WR_PNTR_WIDTH_RACH:0]     axi_ar_wr_data_count,
    output [C_WR_PNTR_WIDTH_RACH:0]     axi_ar_rd_data_count,
    output                              axi_ar_sbiterr,
    output                              axi_ar_dbiterr,
    output                              axi_ar_overflow,
    output                              axi_ar_underflow,
    output                              axi_ar_prog_full,
    output                              axi_ar_prog_empty,
    // AXI Full/Lite Read Data Channel Signals
    input                               axi_r_injectsbiterr,
    input                               axi_r_injectdbiterr,
    input  [C_WR_PNTR_WIDTH_RDCH-1:0]   axi_r_prog_full_thresh,
    input  [C_WR_PNTR_WIDTH_RDCH-1:0]   axi_r_prog_empty_thresh,
    output [C_WR_PNTR_WIDTH_RDCH:0]     axi_r_data_count,
    output [C_WR_PNTR_WIDTH_RDCH:0]     axi_r_wr_data_count,
    output [C_WR_PNTR_WIDTH_RDCH:0]     axi_r_rd_data_count,
    output                              axi_r_sbiterr,
    output                              axi_r_dbiterr,
    output                              axi_r_overflow,
    output                              axi_r_underflow,
    output                              axi_r_prog_full,
    output                              axi_r_prog_empty,
    // AXI Streaming FIFO Related Signals
    input                               axis_injectsbiterr,
    input                               axis_injectdbiterr,
    input  [C_WR_PNTR_WIDTH_AXIS-1:0]   axis_prog_full_thresh,
    input  [C_WR_PNTR_WIDTH_AXIS-1:0]   axis_prog_empty_thresh,
    output [C_WR_PNTR_WIDTH_AXIS:0]     axis_data_count,
    output [C_WR_PNTR_WIDTH_AXIS:0]     axis_wr_data_count,
    output [C_WR_PNTR_WIDTH_AXIS:0]     axis_rd_data_count,
    output                              axis_sbiterr,
    output                              axis_dbiterr,
    output                              axis_overflow,
    output                              axis_underflow,
    output                              axis_prog_full,
    output                              axis_prog_empty
    );
    wire                              BACKUP;
    wire                              BACKUP_MARKER;
    wire                              CLK;
    wire                              RST;
    wire                              SRST;
    wire                              WR_CLK;
    wire                              WR_RST;
    wire                              RD_CLK;
    wire                              RD_RST;
    wire [C_DIN_WIDTH-1:0]            DIN;
    wire                              WR_EN;
    wire                              RD_EN;
    wire [C_RD_PNTR_WIDTH-1:0]        PROG_EMPTY_THRESH;
    wire [C_RD_PNTR_WIDTH-1:0]        PROG_EMPTY_THRESH_ASSERT;
    wire [C_RD_PNTR_WIDTH-1:0]        PROG_EMPTY_THRESH_NEGATE;
    wire [C_WR_PNTR_WIDTH-1:0]        PROG_FULL_THRESH;
    wire [C_WR_PNTR_WIDTH-1:0]        PROG_FULL_THRESH_ASSERT;
    wire [C_WR_PNTR_WIDTH-1:0]        PROG_FULL_THRESH_NEGATE;
    wire                              INT_CLK;
    wire                              INJECTDBITERR;
    wire                              INJECTSBITERR;
    wire                              SLEEP;
    wire [C_DOUT_WIDTH-1:0]           DOUT;
    wire                              FULL;
    wire                              ALMOST_FULL;
    wire                              WR_ACK;
    wire                              OVERFLOW;
    wire                              EMPTY;
    wire                              ALMOST_EMPTY;
    wire                              VALID;
    wire                              UNDERFLOW;
    wire [C_DATA_COUNT_WIDTH-1:0]     DATA_COUNT;
    wire [C_RD_DATA_COUNT_WIDTH-1:0]  RD_DATA_COUNT;
    wire [C_WR_DATA_COUNT_WIDTH-1:0]  WR_DATA_COUNT;
    wire                              PROG_FULL;
    wire                              PROG_EMPTY;
    wire                              SBITERR;
    wire                              DBITERR;
    wire                              WR_RST_BUSY;
    wire                              RD_RST_BUSY;
    wire                              M_ACLK;
    wire                              S_ACLK;
    wire                              S_ARESETN;
    wire                              S_ACLK_EN;
    wire                              M_ACLK_EN;
    wire [C_AXI_ID_WIDTH-1:0]         S_AXI_AWID;
    wire [C_AXI_ADDR_WIDTH-1:0]       S_AXI_AWADDR;
    wire [C_AXI_LEN_WIDTH-1:0]        S_AXI_AWLEN;
    wire [3-1:0]                      S_AXI_AWSIZE;
    wire [2-1:0]                      S_AXI_AWBURST;
    wire [C_AXI_LOCK_WIDTH-1:0]       S_AXI_AWLOCK;
    wire [4-1:0]                      S_AXI_AWCACHE;
    wire [3-1:0]                      S_AXI_AWPROT;
    wire [4-1:0]                      S_AXI_AWQOS;
    wire [4-1:0]                      S_AXI_AWREGION;
    wire [C_AXI_AWUSER_WIDTH-1:0]     S_AXI_AWUSER;
    wire                              S_AXI_AWVALID;
    wire                              S_AXI_AWREADY;
    wire [C_AXI_ID_WIDTH-1:0]         S_AXI_WID;
    wire [C_AXI_DATA_WIDTH-1:0]       S_AXI_WDATA;
    wire [C_AXI_DATA_WIDTH/8-1:0]     S_AXI_WSTRB;
    wire                              S_AXI_WLAST;
    wire [C_AXI_WUSER_WIDTH-1:0]      S_AXI_WUSER;
    wire                              S_AXI_WVALID;
    wire                              S_AXI_WREADY;
    wire [C_AXI_ID_WIDTH-1:0]         S_AXI_BID;
    wire [2-1:0]                      S_AXI_BRESP;
    wire [C_AXI_BUSER_WIDTH-1:0]      S_AXI_BUSER;
    wire                              S_AXI_BVALID;
    wire                              S_AXI_BREADY;
    wire [C_AXI_ID_WIDTH-1:0]         M_AXI_AWID;
    wire [C_AXI_ADDR_WIDTH-1:0]       M_AXI_AWADDR;
    wire [C_AXI_LEN_WIDTH-1:0]        M_AXI_AWLEN;
    wire [3-1:0]                      M_AXI_AWSIZE;
    wire [2-1:0]                      M_AXI_AWBURST;
    wire [C_AXI_LOCK_WIDTH-1:0]       M_AXI_AWLOCK;
    wire [4-1:0]                      M_AXI_AWCACHE;
    wire [3-1:0]                      M_AXI_AWPROT;
    wire [4-1:0]                      M_AXI_AWQOS;
    wire [4-1:0]                      M_AXI_AWREGION;
    wire [C_AXI_AWUSER_WIDTH-1:0]     M_AXI_AWUSER;
    wire                              M_AXI_AWVALID;
    wire                              M_AXI_AWREADY;
    wire [C_AXI_ID_WIDTH-1:0]         M_AXI_WID;
    wire [C_AXI_DATA_WIDTH-1:0]       M_AXI_WDATA;
    wire [C_AXI_DATA_WIDTH/8-1:0]     M_AXI_WSTRB;
    wire                              M_AXI_WLAST;
    wire [C_AXI_WUSER_WIDTH-1:0]      M_AXI_WUSER;
    wire                              M_AXI_WVALID;
    wire                              M_AXI_WREADY;
    wire [C_AXI_ID_WIDTH-1:0]         M_AXI_BID;
    wire [2-1:0]                      M_AXI_BRESP;
    wire [C_AXI_BUSER_WIDTH-1:0]      M_AXI_BUSER;
    wire                              M_AXI_BVALID;
    wire                              M_AXI_BREADY;
    wire [C_AXI_ID_WIDTH-1:0]         S_AXI_ARID;
    wire [C_AXI_ADDR_WIDTH-1:0]       S_AXI_ARADDR;
    wire [C_AXI_LEN_WIDTH-1:0]        S_AXI_ARLEN;
    wire [3-1:0]                      S_AXI_ARSIZE;
    wire [2-1:0]                      S_AXI_ARBURST;
    wire [C_AXI_LOCK_WIDTH-1:0]       S_AXI_ARLOCK;
    wire [4-1:0]                      S_AXI_ARCACHE;
    wire [3-1:0]                      S_AXI_ARPROT;
    wire [4-1:0]                      S_AXI_ARQOS;
    wire [4-1:0]                      S_AXI_ARREGION;
    wire [C_AXI_ARUSER_WIDTH-1:0]     S_AXI_ARUSER;
    wire                              S_AXI_ARVALID;
    wire                              S_AXI_ARREADY;
    wire [C_AXI_ID_WIDTH-1:0]         S_AXI_RID;
    wire [C_AXI_DATA_WIDTH-1:0]       S_AXI_RDATA;
    wire [2-1:0]                      S_AXI_RRESP;
    wire                              S_AXI_RLAST;
    wire [C_AXI_RUSER_WIDTH-1:0]      S_AXI_RUSER;
    wire                              S_AXI_RVALID;
    wire                              S_AXI_RREADY;
    wire [C_AXI_ID_WIDTH-1:0]         M_AXI_ARID;
    wire [C_AXI_ADDR_WIDTH-1:0]       M_AXI_ARADDR;
    wire [C_AXI_LEN_WIDTH-1:0]        M_AXI_ARLEN;
    wire [3-1:0]                      M_AXI_ARSIZE;
    wire [2-1:0]                      M_AXI_ARBURST;
    wire [C_AXI_LOCK_WIDTH-1:0]       M_AXI_ARLOCK;
    wire [4-1:0]                      M_AXI_ARCACHE;
    wire [3-1:0]                      M_AXI_ARPROT;
    wire [4-1:0]                      M_AXI_ARQOS;
    wire [4-1:0]                      M_AXI_ARREGION;
    wire [C_AXI_ARUSER_WIDTH-1:0]     M_AXI_ARUSER;
    wire                              M_AXI_ARVALID;
    wire                              M_AXI_ARREADY;
    wire [C_AXI_ID_WIDTH-1:0]         M_AXI_RID;
    wire [C_AXI_DATA_WIDTH-1:0]       M_AXI_RDATA;
    wire [2-1:0]                      M_AXI_RRESP;
    wire                              M_AXI_RLAST;
    wire [C_AXI_RUSER_WIDTH-1:0]      M_AXI_RUSER;
    wire                              M_AXI_RVALID;
    wire                              M_AXI_RREADY;
    wire                              S_AXIS_TVALID;
    wire                              S_AXIS_TREADY;
    wire [C_AXIS_TDATA_WIDTH-1:0]     S_AXIS_TDATA;
    wire [C_AXIS_TSTRB_WIDTH-1:0]     S_AXIS_TSTRB;
    wire [C_AXIS_TKEEP_WIDTH-1:0]     S_AXIS_TKEEP;
    wire                              S_AXIS_TLAST;
    wire [C_AXIS_TID_WIDTH-1:0]       S_AXIS_TID;
    wire [C_AXIS_TDEST_WIDTH-1:0]     S_AXIS_TDEST;
    wire [C_AXIS_TUSER_WIDTH-1:0]     S_AXIS_TUSER;
    wire                              M_AXIS_TVALID;
    wire                              M_AXIS_TREADY;
    wire [C_AXIS_TDATA_WIDTH-1:0]     M_AXIS_TDATA;
    wire [C_AXIS_TSTRB_WIDTH-1:0]     M_AXIS_TSTRB;
    wire [C_AXIS_TKEEP_WIDTH-1:0]     M_AXIS_TKEEP;
    wire                              M_AXIS_TLAST;
    wire [C_AXIS_TID_WIDTH-1:0]       M_AXIS_TID;
    wire [C_AXIS_TDEST_WIDTH-1:0]     M_AXIS_TDEST;
    wire [C_AXIS_TUSER_WIDTH-1:0]     M_AXIS_TUSER;
    wire                              AXI_AW_INJECTSBITERR;
    wire                              AXI_AW_INJECTDBITERR;
    wire [C_WR_PNTR_WIDTH_WACH-1:0]   AXI_AW_PROG_FULL_THRESH;
    wire [C_WR_PNTR_WIDTH_WACH-1:0]   AXI_AW_PROG_EMPTY_THRESH;
    wire [C_WR_PNTR_WIDTH_WACH:0]     AXI_AW_DATA_COUNT;
    wire [C_WR_PNTR_WIDTH_WACH:0]     AXI_AW_WR_DATA_COUNT;
    wire [C_WR_PNTR_WIDTH_WACH:0]     AXI_AW_RD_DATA_COUNT;
    wire                              AXI_AW_SBITERR;
    wire                              AXI_AW_DBITERR;
    wire                              AXI_AW_OVERFLOW;
    wire                              AXI_AW_UNDERFLOW;
    wire                              AXI_AW_PROG_FULL;
    wire                              AXI_AW_PROG_EMPTY;
    wire                              AXI_W_INJECTSBITERR;
    wire                              AXI_W_INJECTDBITERR;
    wire [C_WR_PNTR_WIDTH_WDCH-1:0]   AXI_W_PROG_FULL_THRESH;
    wire [C_WR_PNTR_WIDTH_WDCH-1:0]   AXI_W_PROG_EMPTY_THRESH;
    wire [C_WR_PNTR_WIDTH_WDCH:0]     AXI_W_DATA_COUNT;
    wire [C_WR_PNTR_WIDTH_WDCH:0]     AXI_W_WR_DATA_COUNT;
    wire [C_WR_PNTR_WIDTH_WDCH:0]     AXI_W_RD_DATA_COUNT;
    wire                              AXI_W_SBITERR;
    wire                              AXI_W_DBITERR;
    wire                              AXI_W_OVERFLOW;
    wire                              AXI_W_UNDERFLOW;
    wire                              AXI_W_PROG_FULL;
    wire                              AXI_W_PROG_EMPTY;
    wire                              AXI_B_INJECTSBITERR;
    wire                              AXI_B_INJECTDBITERR;
    wire [C_WR_PNTR_WIDTH_WRCH-1:0]   AXI_B_PROG_FULL_THRESH;
    wire [C_WR_PNTR_WIDTH_WRCH-1:0]   AXI_B_PROG_EMPTY_THRESH;
    wire [C_WR_PNTR_WIDTH_WRCH:0]     AXI_B_DATA_COUNT;
    wire [C_WR_PNTR_WIDTH_WRCH:0]     AXI_B_WR_DATA_COUNT;
    wire [C_WR_PNTR_WIDTH_WRCH:0]     AXI_B_RD_DATA_COUNT;
    wire                              AXI_B_SBITERR;
    wire                              AXI_B_DBITERR;
    wire                              AXI_B_OVERFLOW;
    wire                              AXI_B_UNDERFLOW;
    wire                              AXI_B_PROG_FULL;
    wire                              AXI_B_PROG_EMPTY;
    wire                              AXI_AR_INJECTSBITERR;
    wire                              AXI_AR_INJECTDBITERR;
    wire [C_WR_PNTR_WIDTH_RACH-1:0]   AXI_AR_PROG_FULL_THRESH;
    wire [C_WR_PNTR_WIDTH_RACH-1:0]   AXI_AR_PROG_EMPTY_THRESH;
    wire [C_WR_PNTR_WIDTH_RACH:0]     AXI_AR_DATA_COUNT;
    wire [C_WR_PNTR_WIDTH_RACH:0]     AXI_AR_WR_DATA_COUNT;
    wire [C_WR_PNTR_WIDTH_RACH:0]     AXI_AR_RD_DATA_COUNT;
    wire                              AXI_AR_SBITERR;
    wire                              AXI_AR_DBITERR;
    wire                              AXI_AR_OVERFLOW;
    wire                              AXI_AR_UNDERFLOW;
    wire                              AXI_AR_PROG_FULL;
    wire                              AXI_AR_PROG_EMPTY;
    wire                              AXI_R_INJECTSBITERR;
    wire                              AXI_R_INJECTDBITERR;
    wire [C_WR_PNTR_WIDTH_RDCH-1:0]   AXI_R_PROG_FULL_THRESH;
    wire [C_WR_PNTR_WIDTH_RDCH-1:0]   AXI_R_PROG_EMPTY_THRESH;
    wire [C_WR_PNTR_WIDTH_RDCH:0]     AXI_R_DATA_COUNT;
    wire [C_WR_PNTR_WIDTH_RDCH:0]     AXI_R_WR_DATA_COUNT;
    wire [C_WR_PNTR_WIDTH_RDCH:0]     AXI_R_RD_DATA_COUNT;
    wire                              AXI_R_SBITERR;
    wire                              AXI_R_DBITERR;
    wire                              AXI_R_OVERFLOW;
    wire                              AXI_R_UNDERFLOW;
    wire                              AXI_R_PROG_FULL;
    wire                              AXI_R_PROG_EMPTY;
    wire                              AXIS_INJECTSBITERR;
    wire                              AXIS_INJECTDBITERR;
    wire [C_WR_PNTR_WIDTH_AXIS-1:0]   AXIS_PROG_FULL_THRESH;
    wire [C_WR_PNTR_WIDTH_AXIS-1:0]   AXIS_PROG_EMPTY_THRESH;
    wire [C_WR_PNTR_WIDTH_AXIS:0]     AXIS_DATA_COUNT;
    wire [C_WR_PNTR_WIDTH_AXIS:0]     AXIS_WR_DATA_COUNT;
    wire [C_WR_PNTR_WIDTH_AXIS:0]     AXIS_RD_DATA_COUNT;
    wire                              AXIS_SBITERR;
    wire                              AXIS_DBITERR;
    wire                              AXIS_OVERFLOW;
    wire                              AXIS_UNDERFLOW;
    wire                              AXIS_PROG_FULL;
    wire                              AXIS_PROG_EMPTY;
    wire [C_WR_DATA_COUNT_WIDTH-1:0]  wr_data_count_in;
    wire                              wr_rst_int;
    wire                              rd_rst_int;
    wire                              wr_rst_busy_o;
    wire                              wr_rst_busy_ntve;
    wire                              wr_rst_busy_axis;
    wire                              wr_rst_busy_wach;
    wire                              wr_rst_busy_wdch;
    wire                              wr_rst_busy_wrch;
    wire                              wr_rst_busy_rach;
    wire                              wr_rst_busy_rdch;
  function integer find_log2;
    input integer int_val;
    integer i,j;
    begin
      i = 1;
      j = 0;
      for (i = 1; i < int_val; i = i*2) begin
        j = j + 1;
      end
      find_log2 = j;
    end
  endfunction
    // Conventional FIFO Interface Signals
    assign BACKUP                 = backup;
    assign BACKUP_MARKER          = backup_marker;
    assign CLK                    = clk;
    assign RST                    = rst;
    assign SRST                   = srst;
    assign WR_CLK                 = wr_clk;
    assign WR_RST                 = wr_rst;
    assign RD_CLK                 = rd_clk;
    assign RD_RST                 = rd_rst;
    assign WR_EN                  = wr_en;
    assign RD_EN                  = rd_en;
    assign INT_CLK                = int_clk;
    assign INJECTDBITERR          = injectdbiterr;
    assign INJECTSBITERR          = injectsbiterr;
    assign SLEEP                  = sleep;
    assign full                   = FULL;
    assign almost_full            = ALMOST_FULL;
    assign wr_ack                 = WR_ACK;
    assign overflow               = OVERFLOW;
    assign empty                  = EMPTY;
    assign almost_empty           = ALMOST_EMPTY;
    assign valid                  = VALID;
    assign underflow              = UNDERFLOW;
    assign prog_full              = PROG_FULL;
    assign prog_empty             = PROG_EMPTY;
    assign sbiterr                = SBITERR;
    assign dbiterr                = DBITERR;
//    assign wr_rst_busy            = WR_RST_BUSY | wr_rst_busy_o;
    assign wr_rst_busy            = wr_rst_busy_o;
    assign rd_rst_busy            = RD_RST_BUSY;
    assign M_ACLK                 = m_aclk;
    assign S_ACLK                 = s_aclk;
    assign S_ARESETN              = s_aresetn;
    assign S_ACLK_EN              = s_aclk_en;
    assign M_ACLK_EN              = m_aclk_en;
    assign S_AXI_AWVALID          = s_axi_awvalid;
    assign s_axi_awready          = S_AXI_AWREADY;
    assign S_AXI_WLAST            = s_axi_wlast;
    assign S_AXI_WVALID           = s_axi_wvalid;
    assign s_axi_wready           = S_AXI_WREADY;
    assign s_axi_bvalid           = S_AXI_BVALID;
    assign S_AXI_BREADY           = s_axi_bready;
    assign m_axi_awvalid          = M_AXI_AWVALID;
    assign M_AXI_AWREADY          = m_axi_awready;
    assign m_axi_wlast            = M_AXI_WLAST;
    assign m_axi_wvalid           = M_AXI_WVALID;
    assign M_AXI_WREADY           = m_axi_wready;
    assign M_AXI_BVALID           = m_axi_bvalid;
    assign m_axi_bready           = M_AXI_BREADY;
    assign S_AXI_ARVALID          = s_axi_arvalid;
    assign s_axi_arready          = S_AXI_ARREADY;
    assign s_axi_rlast            = S_AXI_RLAST;
    assign s_axi_rvalid           = S_AXI_RVALID;
    assign S_AXI_RREADY           = s_axi_rready;
    assign m_axi_arvalid          = M_AXI_ARVALID;
    assign M_AXI_ARREADY          = m_axi_arready;
    assign M_AXI_RLAST            = m_axi_rlast;
    assign M_AXI_RVALID           = m_axi_rvalid;
    assign m_axi_rready           = M_AXI_RREADY;
    assign S_AXIS_TVALID          = s_axis_tvalid;
    assign s_axis_tready          = S_AXIS_TREADY;
    assign S_AXIS_TLAST           = s_axis_tlast;
    assign m_axis_tvalid          = M_AXIS_TVALID;
    assign M_AXIS_TREADY          = m_axis_tready;
    assign m_axis_tlast           = M_AXIS_TLAST;
    assign AXI_AW_INJECTSBITERR   = axi_aw_injectsbiterr;
    assign AXI_AW_INJECTDBITERR   = axi_aw_injectdbiterr;
    assign axi_aw_sbiterr         = AXI_AW_SBITERR;
    assign axi_aw_dbiterr         = AXI_AW_DBITERR;
    assign axi_aw_overflow        = AXI_AW_OVERFLOW;
    assign axi_aw_underflow       = AXI_AW_UNDERFLOW;
    assign axi_aw_prog_full       = AXI_AW_PROG_FULL;
    assign axi_aw_prog_empty      = AXI_AW_PROG_EMPTY;
    assign AXI_W_INJECTSBITERR    = axi_w_injectsbiterr;
    assign AXI_W_INJECTDBITERR    = axi_w_injectdbiterr;
    assign axi_w_sbiterr          = AXI_W_SBITERR;
    assign axi_w_dbiterr          = AXI_W_DBITERR;
    assign axi_w_overflow         = AXI_W_OVERFLOW;
    assign axi_w_underflow        = AXI_W_UNDERFLOW;
    assign axi_w_prog_full        = AXI_W_PROG_FULL;
    assign axi_w_prog_empty       = AXI_W_PROG_EMPTY;
    assign AXI_B_INJECTSBITERR    = axi_b_injectsbiterr;
    assign AXI_B_INJECTDBITERR    = axi_b_injectdbiterr;
    assign axi_b_sbiterr          = AXI_B_SBITERR;
    assign axi_b_dbiterr          = AXI_B_DBITERR;
    assign axi_b_overflow         = AXI_B_OVERFLOW;
    assign axi_b_underflow        = AXI_B_UNDERFLOW;
    assign axi_b_prog_full        = AXI_B_PROG_FULL;
    assign axi_b_prog_empty       = AXI_B_PROG_EMPTY;
    assign AXI_AR_INJECTSBITERR   = axi_ar_injectsbiterr;
    assign AXI_AR_INJECTDBITERR   = axi_ar_injectdbiterr;
    assign axi_ar_sbiterr         = AXI_AR_SBITERR;
    assign axi_ar_dbiterr         = AXI_AR_DBITERR;
    assign axi_ar_overflow        = AXI_AR_OVERFLOW;
    assign axi_ar_underflow       = AXI_AR_UNDERFLOW;
    assign axi_ar_prog_full       = AXI_AR_PROG_FULL;
    assign axi_ar_prog_empty      = AXI_AR_PROG_EMPTY;
    assign AXI_R_INJECTSBITERR    = axi_r_injectsbiterr;
    assign AXI_R_INJECTDBITERR    = axi_r_injectdbiterr;
    assign axi_r_sbiterr          = AXI_R_SBITERR;
    assign axi_r_dbiterr          = AXI_R_DBITERR;
    assign axi_r_overflow         = AXI_R_OVERFLOW;
    assign axi_r_underflow        = AXI_R_UNDERFLOW;
    assign axi_r_prog_full        = AXI_R_PROG_FULL;
    assign axi_r_prog_empty       = AXI_R_PROG_EMPTY;
    assign AXIS_INJECTSBITERR     = axis_injectsbiterr;
    assign AXIS_INJECTDBITERR     = axis_injectdbiterr;
    assign axis_sbiterr           = AXIS_SBITERR;
    assign axis_dbiterr           = AXIS_DBITERR;
    assign axis_overflow          = AXIS_OVERFLOW;
    assign axis_underflow         = AXIS_UNDERFLOW;
    assign axis_prog_full         = AXIS_PROG_FULL;
    assign axis_prog_empty        = AXIS_PROG_EMPTY;
    assign DIN                       = din;
    assign PROG_EMPTY_THRESH         = prog_empty_thresh;
    assign PROG_EMPTY_THRESH_ASSERT  = prog_empty_thresh_assert;
    assign PROG_EMPTY_THRESH_NEGATE  = prog_empty_thresh_negate;
    assign PROG_FULL_THRESH          = prog_full_thresh;
    assign PROG_FULL_THRESH_ASSERT   = prog_full_thresh_assert;
    assign PROG_FULL_THRESH_NEGATE   = prog_full_thresh_negate;
    assign dout                      = DOUT;
    assign data_count                = DATA_COUNT;
    assign rd_data_count             = RD_DATA_COUNT;
    assign wr_data_count             = WR_DATA_COUNT;
    assign S_AXI_AWID                = s_axi_awid;
    assign S_AXI_AWADDR              = s_axi_awaddr;
    assign S_AXI_AWLEN               = s_axi_awlen;
    assign S_AXI_AWSIZE              = s_axi_awsize;
    assign S_AXI_AWBURST             = s_axi_awburst;
    assign S_AXI_AWLOCK              = s_axi_awlock;
    assign S_AXI_AWCACHE             = s_axi_awcache;
    assign S_AXI_AWPROT              = s_axi_awprot;
    assign S_AXI_AWQOS               = s_axi_awqos;
    assign S_AXI_AWREGION            = s_axi_awregion;
    assign S_AXI_AWUSER              = s_axi_awuser;
    assign S_AXI_WID                 = s_axi_wid;
    assign S_AXI_WDATA               = s_axi_wdata;
    assign S_AXI_WSTRB               = s_axi_wstrb;
    assign S_AXI_WUSER               = s_axi_wuser;
    assign s_axi_bid                 = S_AXI_BID;
    assign s_axi_bresp               = S_AXI_BRESP;
    assign s_axi_buser               = S_AXI_BUSER;
    assign m_axi_awid                = M_AXI_AWID;
    assign m_axi_awaddr              = M_AXI_AWADDR;
    assign m_axi_awlen               = M_AXI_AWLEN;
    assign m_axi_awsize              = M_AXI_AWSIZE;
    assign m_axi_awburst             = M_AXI_AWBURST;
    assign m_axi_awlock              = M_AXI_AWLOCK;
    assign m_axi_awcache             = M_AXI_AWCACHE;
    assign m_axi_awprot              = M_AXI_AWPROT;
    assign m_axi_awqos               = M_AXI_AWQOS;
    assign m_axi_awregion            = M_AXI_AWREGION;
    assign m_axi_awuser              = M_AXI_AWUSER;
    assign m_axi_wid                 = M_AXI_WID;
    assign m_axi_wdata               = M_AXI_WDATA;
    assign m_axi_wstrb               = M_AXI_WSTRB;
    assign m_axi_wuser               = M_AXI_WUSER;
    assign M_AXI_BID                 = m_axi_bid;
    assign M_AXI_BRESP               = m_axi_bresp;
    assign M_AXI_BUSER               = m_axi_buser;
    assign S_AXI_ARID                = s_axi_arid;
    assign S_AXI_ARADDR              = s_axi_araddr;
    assign S_AXI_ARLEN               = s_axi_arlen;
    assign S_AXI_ARSIZE              = s_axi_arsize;
    assign S_AXI_ARBURST             = s_axi_arburst;
    assign S_AXI_ARLOCK              = s_axi_arlock;
    assign S_AXI_ARCACHE             = s_axi_arcache;
    assign S_AXI_ARPROT              = s_axi_arprot;
    assign S_AXI_ARQOS               = s_axi_arqos;
    assign S_AXI_ARREGION            = s_axi_arregion;
    assign S_AXI_ARUSER              = s_axi_aruser;
    assign s_axi_rid                 = S_AXI_RID;
    assign s_axi_rdata               = S_AXI_RDATA;
    assign s_axi_rresp               = S_AXI_RRESP;
    assign s_axi_ruser               = S_AXI_RUSER;
    assign m_axi_arid                = M_AXI_ARID;
    assign m_axi_araddr              = M_AXI_ARADDR;
    assign m_axi_arlen               = M_AXI_ARLEN;
    assign m_axi_arsize              = M_AXI_ARSIZE;
    assign m_axi_arburst             = M_AXI_ARBURST;
    assign m_axi_arlock              = M_AXI_ARLOCK;
    assign m_axi_arcache             = M_AXI_ARCACHE;
    assign m_axi_arprot              = M_AXI_ARPROT;
    assign m_axi_arqos               = M_AXI_ARQOS;
    assign m_axi_arregion            = M_AXI_ARREGION;
    assign m_axi_aruser              = M_AXI_ARUSER;
    assign M_AXI_RID                 = m_axi_rid;
    assign M_AXI_RDATA               = m_axi_rdata;
    assign M_AXI_RRESP               = m_axi_rresp;
    assign M_AXI_RUSER               = m_axi_ruser;
    assign S_AXIS_TDATA              = s_axis_tdata;
    assign S_AXIS_TSTRB              = s_axis_tstrb;
    assign S_AXIS_TKEEP              = s_axis_tkeep;
    assign S_AXIS_TID                = s_axis_tid;
    assign S_AXIS_TDEST              = s_axis_tdest;
    assign S_AXIS_TUSER              = s_axis_tuser;
    assign m_axis_tdata              = M_AXIS_TDATA;
    assign m_axis_tstrb              = M_AXIS_TSTRB;
    assign m_axis_tkeep              = M_AXIS_TKEEP;
    assign m_axis_tid                = M_AXIS_TID;
    assign m_axis_tdest              = M_AXIS_TDEST;
    assign m_axis_tuser              = M_AXIS_TUSER;
    assign AXI_AW_PROG_FULL_THRESH   = axi_aw_prog_full_thresh;
    assign AXI_AW_PROG_EMPTY_THRESH  = axi_aw_prog_empty_thresh;
    assign axi_aw_data_count         = AXI_AW_DATA_COUNT;
    assign axi_aw_wr_data_count      = AXI_AW_WR_DATA_COUNT;
    assign axi_aw_rd_data_count      = AXI_AW_RD_DATA_COUNT;
    assign AXI_W_PROG_FULL_THRESH    = axi_w_prog_full_thresh;
    assign AXI_W_PROG_EMPTY_THRESH   = axi_w_prog_empty_thresh;
    assign axi_w_data_count          = AXI_W_DATA_COUNT;
    assign axi_w_wr_data_count       = AXI_W_WR_DATA_COUNT;
    assign axi_w_rd_data_count       = AXI_W_RD_DATA_COUNT;
    assign AXI_B_PROG_FULL_THRESH    = axi_b_prog_full_thresh;
    assign AXI_B_PROG_EMPTY_THRESH   = axi_b_prog_empty_thresh;
    assign axi_b_data_count          = AXI_B_DATA_COUNT;
    assign axi_b_wr_data_count       = AXI_B_WR_DATA_COUNT;
    assign axi_b_rd_data_count       = AXI_B_RD_DATA_COUNT;
    assign AXI_AR_PROG_FULL_THRESH   = axi_ar_prog_full_thresh;
    assign AXI_AR_PROG_EMPTY_THRESH  = axi_ar_prog_empty_thresh;
    assign axi_ar_data_count         = AXI_AR_DATA_COUNT;
    assign axi_ar_wr_data_count      = AXI_AR_WR_DATA_COUNT;
    assign axi_ar_rd_data_count      = AXI_AR_RD_DATA_COUNT;
    assign AXI_R_PROG_FULL_THRESH    = axi_r_prog_full_thresh;
    assign AXI_R_PROG_EMPTY_THRESH   = axi_r_prog_empty_thresh;
    assign axi_r_data_count          = AXI_R_DATA_COUNT;
    assign axi_r_wr_data_count       = AXI_R_WR_DATA_COUNT;
    assign axi_r_rd_data_count       = AXI_R_RD_DATA_COUNT;
    assign AXIS_PROG_FULL_THRESH     = axis_prog_full_thresh;
    assign AXIS_PROG_EMPTY_THRESH    = axis_prog_empty_thresh;
    assign axis_data_count           = AXIS_DATA_COUNT;
    assign axis_wr_data_count        = AXIS_WR_DATA_COUNT;
    assign axis_rd_data_count        = AXIS_RD_DATA_COUNT;
  generate if (C_INTERFACE_TYPE == 0) begin : conv_fifo
    fifo_generator_v13_1_3_CONV_VER
      #(
        .C_COMMON_CLOCK 		(C_COMMON_CLOCK),
        .C_INTERFACE_TYPE 		(C_INTERFACE_TYPE),
        .C_COUNT_TYPE			(C_COUNT_TYPE),
        .C_DATA_COUNT_WIDTH		(C_DATA_COUNT_WIDTH),
        .C_DEFAULT_VALUE		(C_DEFAULT_VALUE),
        .C_DIN_WIDTH			(C_DIN_WIDTH),
        .C_DOUT_RST_VAL			(C_USE_DOUT_RST == 1 ? C_DOUT_RST_VAL : 0),
        .C_DOUT_WIDTH			(C_DOUT_WIDTH),
        .C_ENABLE_RLOCS			(C_ENABLE_RLOCS),
        .C_FAMILY			(C_FAMILY),
        .C_FULL_FLAGS_RST_VAL           (C_FULL_FLAGS_RST_VAL),
        .C_HAS_ALMOST_EMPTY		(C_HAS_ALMOST_EMPTY),
        .C_HAS_ALMOST_FULL		(C_HAS_ALMOST_FULL),
        .C_HAS_BACKUP			(C_HAS_BACKUP),
        .C_HAS_DATA_COUNT		(C_HAS_DATA_COUNT),
        .C_HAS_INT_CLK                  (C_HAS_INT_CLK),
        .C_HAS_MEMINIT_FILE		(C_HAS_MEMINIT_FILE),
        .C_HAS_OVERFLOW			(C_HAS_OVERFLOW),
        .C_HAS_RD_DATA_COUNT		(C_HAS_RD_DATA_COUNT),
        .C_HAS_RD_RST			(C_HAS_RD_RST),
        .C_HAS_RST			(C_HAS_RST),
        .C_HAS_SRST			(C_HAS_SRST),
        .C_HAS_UNDERFLOW		(C_HAS_UNDERFLOW),
        .C_HAS_VALID			(C_HAS_VALID),
        .C_HAS_WR_ACK			(C_HAS_WR_ACK),
        .C_HAS_WR_DATA_COUNT		(C_HAS_WR_DATA_COUNT),
        .C_HAS_WR_RST			(C_HAS_WR_RST),
        .C_IMPLEMENTATION_TYPE		(C_IMPLEMENTATION_TYPE),
        .C_INIT_WR_PNTR_VAL		(C_INIT_WR_PNTR_VAL),
        .C_MEMORY_TYPE			(C_MEMORY_TYPE),
        .C_MIF_FILE_NAME		(C_MIF_FILE_NAME),
        .C_OPTIMIZATION_MODE		(C_OPTIMIZATION_MODE),
        .C_OVERFLOW_LOW			(C_OVERFLOW_LOW),
        .C_PRELOAD_LATENCY		(C_PRELOAD_LATENCY),
        .C_PRELOAD_REGS			(C_PRELOAD_REGS),
        .C_PRIM_FIFO_TYPE		(C_PRIM_FIFO_TYPE),
        .C_PROG_EMPTY_THRESH_ASSERT_VAL	(C_PROG_EMPTY_THRESH_ASSERT_VAL),
        .C_PROG_EMPTY_THRESH_NEGATE_VAL	(C_PROG_EMPTY_THRESH_NEGATE_VAL),
        .C_PROG_EMPTY_TYPE		(C_PROG_EMPTY_TYPE),
        .C_PROG_FULL_THRESH_ASSERT_VAL	(C_PROG_FULL_THRESH_ASSERT_VAL),
        .C_PROG_FULL_THRESH_NEGATE_VAL	(C_PROG_FULL_THRESH_NEGATE_VAL),
        .C_PROG_FULL_TYPE		(C_PROG_FULL_TYPE),
        .C_RD_DATA_COUNT_WIDTH		(C_RD_DATA_COUNT_WIDTH),
        .C_RD_DEPTH			(C_RD_DEPTH),
        .C_RD_FREQ			(C_RD_FREQ),
        .C_RD_PNTR_WIDTH		(C_RD_PNTR_WIDTH),
        .C_UNDERFLOW_LOW		(C_UNDERFLOW_LOW),
        .C_USE_DOUT_RST                 (C_USE_DOUT_RST),
        .C_USE_ECC                      (C_USE_ECC),
        .C_USE_EMBEDDED_REG		(C_USE_EMBEDDED_REG),
        .C_EN_SAFETY_CKT		(C_EN_SAFETY_CKT),
        .C_USE_FIFO16_FLAGS		(C_USE_FIFO16_FLAGS),
        .C_USE_FWFT_DATA_COUNT		(C_USE_FWFT_DATA_COUNT),
        .C_VALID_LOW			(C_VALID_LOW),
        .C_WR_ACK_LOW			(C_WR_ACK_LOW),
        .C_WR_DATA_COUNT_WIDTH		(C_WR_DATA_COUNT_WIDTH),
        .C_WR_DEPTH			(C_WR_DEPTH),
        .C_WR_FREQ			(C_WR_FREQ),
        .C_WR_PNTR_WIDTH		(C_WR_PNTR_WIDTH),
        .C_WR_RESPONSE_LATENCY		(C_WR_RESPONSE_LATENCY),
        .C_MSGON_VAL                    (C_MSGON_VAL),
        .C_ENABLE_RST_SYNC              (C_ENABLE_RST_SYNC),
        .C_ERROR_INJECTION_TYPE         (C_ERROR_INJECTION_TYPE),
        .C_AXI_TYPE                     (C_AXI_TYPE),
        .C_SYNCHRONIZER_STAGE           (C_SYNCHRONIZER_STAGE)
      )
    fifo_generator_v13_1_3_conv_dut
      (
        .BACKUP                   (BACKUP),
        .BACKUP_MARKER            (BACKUP_MARKER),
        .CLK                      (CLK),
        .RST                      (RST),
        .SRST                     (SRST),
        .WR_CLK                   (WR_CLK),
        .WR_RST                   (WR_RST),
        .RD_CLK                   (RD_CLK),
        .RD_RST                   (RD_RST),
        .DIN                      (DIN),
        .WR_EN                    (WR_EN),
        .RD_EN                    (RD_EN),
        .PROG_EMPTY_THRESH        (PROG_EMPTY_THRESH),
        .PROG_EMPTY_THRESH_ASSERT (PROG_EMPTY_THRESH_ASSERT),
        .PROG_EMPTY_THRESH_NEGATE (PROG_EMPTY_THRESH_NEGATE),
        .PROG_FULL_THRESH         (PROG_FULL_THRESH),
        .PROG_FULL_THRESH_ASSERT  (PROG_FULL_THRESH_ASSERT),
        .PROG_FULL_THRESH_NEGATE  (PROG_FULL_THRESH_NEGATE),
        .INT_CLK                  (INT_CLK),
        .INJECTDBITERR            (INJECTDBITERR),
        .INJECTSBITERR            (INJECTSBITERR),
        .DOUT                     (DOUT),
        .FULL                     (FULL),
        .ALMOST_FULL              (ALMOST_FULL),
        .WR_ACK                   (WR_ACK),
        .OVERFLOW                 (OVERFLOW),
        .EMPTY                    (EMPTY),
        .ALMOST_EMPTY             (ALMOST_EMPTY),
        .VALID                    (VALID),
        .UNDERFLOW                (UNDERFLOW),
        .DATA_COUNT               (DATA_COUNT),
        .RD_DATA_COUNT            (RD_DATA_COUNT),
        .WR_DATA_COUNT            (wr_data_count_in),
        .PROG_FULL                (PROG_FULL),
        .PROG_EMPTY               (PROG_EMPTY),
        .SBITERR                  (SBITERR),
        .DBITERR                  (DBITERR),
        .wr_rst_busy_o            (wr_rst_busy_o),
        .wr_rst_busy              (wr_rst_busy_i),
        .rd_rst_busy              (rd_rst_busy),
        .wr_rst_i_out             (wr_rst_int),
        .rd_rst_i_out             (rd_rst_int)
       );
  end endgenerate
  localparam IS_8SERIES         = (C_FAMILY == "virtexu" || C_FAMILY == "kintexu" || C_FAMILY == "artixu" || C_FAMILY == "virtexuplus" || C_FAMILY == "zynquplus" || C_FAMILY == "kintexuplus") ? 1 : 0;
  localparam C_AXI_SIZE_WIDTH   = 3;
  localparam C_AXI_BURST_WIDTH  = 2;
  localparam C_AXI_CACHE_WIDTH  = 4;
  localparam C_AXI_PROT_WIDTH   = 3;
  localparam C_AXI_QOS_WIDTH    = 4;
  localparam C_AXI_REGION_WIDTH = 4;
  localparam C_AXI_BRESP_WIDTH  = 2;
  localparam C_AXI_RRESP_WIDTH  = 2;
  localparam IS_AXI_STREAMING  = C_INTERFACE_TYPE == 1 ? 1 : 0;
  localparam TDATA_OFFSET      = C_HAS_AXIS_TDATA == 1 ? C_DIN_WIDTH_AXIS-C_AXIS_TDATA_WIDTH : C_DIN_WIDTH_AXIS;
  localparam TSTRB_OFFSET      = C_HAS_AXIS_TSTRB == 1 ? TDATA_OFFSET-C_AXIS_TSTRB_WIDTH : TDATA_OFFSET;
  localparam TKEEP_OFFSET      = C_HAS_AXIS_TKEEP == 1 ? TSTRB_OFFSET-C_AXIS_TKEEP_WIDTH : TSTRB_OFFSET;
  localparam TID_OFFSET        = C_HAS_AXIS_TID   == 1 ? TKEEP_OFFSET-C_AXIS_TID_WIDTH : TKEEP_OFFSET;
  localparam TDEST_OFFSET      = C_HAS_AXIS_TDEST == 1 ? TID_OFFSET-C_AXIS_TDEST_WIDTH : TID_OFFSET;
  localparam TUSER_OFFSET      = C_HAS_AXIS_TUSER == 1 ? TDEST_OFFSET-C_AXIS_TUSER_WIDTH : TDEST_OFFSET;
  localparam LOG_DEPTH_AXIS    = find_log2(C_WR_DEPTH_AXIS);
  localparam LOG_WR_DEPTH      = find_log2(C_WR_DEPTH);
  function [LOG_DEPTH_AXIS-1:0] bin2gray;
      input [LOG_DEPTH_AXIS-1:0] x;
      begin
         bin2gray = x ^ (x>>1);
      end
   endfunction
  function [LOG_DEPTH_AXIS-1:0] gray2bin;
      input [LOG_DEPTH_AXIS-1:0] x;
      integer                i;
      begin
         gray2bin[LOG_DEPTH_AXIS-1] = x[LOG_DEPTH_AXIS-1];
         for(i=LOG_DEPTH_AXIS-2; i>=0; i=i-1) begin
            gray2bin[i] =  gray2bin[i+1] ^ x[i];
         end
      end
   endfunction
wire [(LOG_WR_DEPTH)-1 : 0] w_cnt_gc_asreg_last;
wire  [LOG_WR_DEPTH-1 : 0]  w_q [0:C_SYNCHRONIZER_STAGE] ;
wire [LOG_WR_DEPTH-1 : 0] w_q_temp [1:C_SYNCHRONIZER_STAGE]  ;
reg [LOG_WR_DEPTH-1 : 0] w_cnt_rd = 0;
reg [LOG_WR_DEPTH-1 : 0] w_cnt = 0;
reg [LOG_WR_DEPTH-1 : 0] w_cnt_gc = 0;
reg [LOG_WR_DEPTH-1 : 0] r_cnt = 0;
wire [LOG_WR_DEPTH : 0] adj_w_cnt_rd_pad;
wire [LOG_WR_DEPTH : 0] r_inv_pad;
wire [LOG_WR_DEPTH-1 : 0] d_cnt;
reg [LOG_WR_DEPTH : 0] d_cnt_pad = 0;
reg adj_w_cnt_rd_pad_0 = 0;
reg r_inv_pad_0 = 0;
   genvar l;
   generate for (l = 1; ((l <= C_SYNCHRONIZER_STAGE) && (C_HAS_DATA_COUNTS_AXIS == 3 && C_INTERFACE_TYPE == 0) ); l = l + 1) begin : g_cnt_sync_stage
     fifo_generator_v13_1_3_sync_stage
       #(
         .C_WIDTH  (LOG_WR_DEPTH)
        )
     rd_stg_inst
        (
         .RST      (rd_rst_int),
         .CLK      (RD_CLK),
         .DIN      (w_q[l-1]),
         .DOUT     (w_q[l])
        );
   end endgenerate // gpkt_cnt_sync_stage
      generate if (C_INTERFACE_TYPE == 0 && C_HAS_DATA_COUNTS_AXIS == 3) begin : fifo_ic_adapter
    assign wr_eop_ad = WR_EN & !(FULL);
    assign rd_eop_ad = RD_EN & !(EMPTY);
  always @ (posedge wr_rst_int or posedge WR_CLK)
    begin
      if (wr_rst_int)
        w_cnt    <= 1'b0;
      else if (wr_eop_ad)
        w_cnt    <= w_cnt + 1;
    end
  always @ (posedge wr_rst_int or posedge WR_CLK)
    begin
      if (wr_rst_int)
        w_cnt_gc    <= 1'b0;
      else
        w_cnt_gc    <= bin2gray(w_cnt);
    end
    assign  w_q[0]  = w_cnt_gc;
    assign  w_cnt_gc_asreg_last       = w_q[C_SYNCHRONIZER_STAGE];
  always @ (posedge rd_rst_int or posedge RD_CLK)
    begin
      if (rd_rst_int)
        w_cnt_rd    <= 1'b0;
      else
        w_cnt_rd    <= gray2bin(w_cnt_gc_asreg_last);
    end
  always @ (posedge rd_rst_int or posedge RD_CLK)
    begin
      if (rd_rst_int)
        r_cnt    <= 1'b0;
      else if (rd_eop_ad)
        r_cnt    <= r_cnt + 1;
    end
  // Take the difference of write and read packet count
  // Logic is similar to rd_pe_as
   assign adj_w_cnt_rd_pad[LOG_WR_DEPTH : 1] = w_cnt_rd;
   assign r_inv_pad[LOG_WR_DEPTH : 1]        = ~r_cnt;
   assign adj_w_cnt_rd_pad[0]                = adj_w_cnt_rd_pad_0;
   assign r_inv_pad[0]                       = r_inv_pad_0;
  always @ ( rd_eop_ad )
    begin
      if (!rd_eop_ad) begin
        adj_w_cnt_rd_pad_0    <= 1'b1;
        r_inv_pad_0           <= 1'b1;
      end else begin
        adj_w_cnt_rd_pad_0    <= 1'b0;
        r_inv_pad_0           <= 1'b0;
      end
    end
  always @ (posedge rd_rst_int or posedge RD_CLK)
    begin
      if (rd_rst_int)
        d_cnt_pad    <= 1'b0;
      else
        d_cnt_pad    <= adj_w_cnt_rd_pad + r_inv_pad ;
    end
   assign  d_cnt = d_cnt_pad [LOG_WR_DEPTH : 1] ;
   assign  WR_DATA_COUNT = d_cnt;
  end endgenerate // fifo_ic_adapter
      generate if (C_INTERFACE_TYPE == 0 && C_HAS_DATA_COUNTS_AXIS != 3) begin : fifo_icn_adapter
   assign  WR_DATA_COUNT = wr_data_count_in;
  end endgenerate // fifo_icn_adapter
  wire                          inverted_reset = ~S_ARESETN;
  wire                          axi_rs_rst;
  wire  [C_DIN_WIDTH_AXIS-1:0]  axis_din          ;
  wire  [C_DIN_WIDTH_AXIS-1:0]  axis_dout         ;
  wire                          axis_full         ;
  wire                          axis_almost_full  ;
  wire                          axis_empty        ;
  wire                          axis_s_axis_tready;
  wire                          axis_m_axis_tvalid;
  wire                          axis_wr_en        ;
  wire                          axis_rd_en        ;
  wire                          axis_we           ;
  wire                          axis_re           ;
  wire [C_WR_PNTR_WIDTH_AXIS:0] axis_dc;
  reg                           axis_pkt_read = 1'b0;
  wire                          axis_rd_rst;
  wire                          axis_wr_rst;
  generate if (C_INTERFACE_TYPE > 0 && (C_AXIS_TYPE == 1 || C_WACH_TYPE == 1 ||
               C_WDCH_TYPE == 1 || C_WRCH_TYPE == 1 || C_RACH_TYPE == 1 || C_RDCH_TYPE == 1)) begin : gaxi_rs_rst
      reg                           rst_d1 = 0        ;
      reg                           rst_d2 = 0        ;
      reg [3:0]                    axi_rst = 4'h0     ;
      always @ (posedge inverted_reset or posedge S_ACLK) begin
        if (inverted_reset) begin
          rst_d1         <= 1'b1;
          rst_d2         <= 1'b1;
          axi_rst        <= 4'hf;
        end else begin
          rst_d1         <= #`TCQ 1'b0;
          rst_d2         <= #`TCQ rst_d1;
          axi_rst        <= #`TCQ {axi_rst[2:0],1'b0};
        end
      end
      assign axi_rs_rst = axi_rst[3];//rst_d2;
  end endgenerate // gaxi_rs_rst
  generate if (IS_AXI_STREAMING == 1 && C_AXIS_TYPE == 0) begin : axi_streaming
    // Write protection when almost full or prog_full is high
    assign axis_we    = (C_PROG_FULL_TYPE_AXIS != 0) ? axis_s_axis_tready & S_AXIS_TVALID :
                        (C_APPLICATION_TYPE_AXIS == 1) ? axis_s_axis_tready & S_AXIS_TVALID : S_AXIS_TVALID;
    // Read protection when almost empty or prog_empty is high
    assign axis_re    = (C_PROG_EMPTY_TYPE_AXIS != 0) ? axis_m_axis_tvalid & M_AXIS_TREADY :
                        (C_APPLICATION_TYPE_AXIS == 1) ? axis_m_axis_tvalid & M_AXIS_TREADY : M_AXIS_TREADY;
    assign axis_wr_en = (C_HAS_SLAVE_CE == 1)  ? axis_we & S_ACLK_EN : axis_we;
    assign axis_rd_en = (C_HAS_MASTER_CE == 1) ? axis_re & M_ACLK_EN : axis_re;
    fifo_generator_v13_1_3_CONV_VER
      #(
        .C_FAMILY			(C_FAMILY),
        .C_COMMON_CLOCK                 (C_COMMON_CLOCK),
        .C_INTERFACE_TYPE               (C_INTERFACE_TYPE),
        .C_MEMORY_TYPE			((C_IMPLEMENTATION_TYPE_AXIS == 1  || C_IMPLEMENTATION_TYPE_AXIS == 11) ? 1 :
                                         (C_IMPLEMENTATION_TYPE_AXIS == 2  || C_IMPLEMENTATION_TYPE_AXIS == 12) ? 2 : 4),
        .C_IMPLEMENTATION_TYPE		((C_IMPLEMENTATION_TYPE_AXIS == 1  || C_IMPLEMENTATION_TYPE_AXIS == 2) ? 0 :
                                         (C_IMPLEMENTATION_TYPE_AXIS == 11 || C_IMPLEMENTATION_TYPE_AXIS == 12) ? 2 : 6),
        .C_PRELOAD_REGS			(1), // always FWFT for AXI
        .C_PRELOAD_LATENCY		(0), // always FWFT for AXI
        .C_DIN_WIDTH			(C_DIN_WIDTH_AXIS),
        .C_WR_DEPTH			(C_WR_DEPTH_AXIS),
        .C_WR_PNTR_WIDTH		(C_WR_PNTR_WIDTH_AXIS),
        .C_DOUT_WIDTH			(C_DIN_WIDTH_AXIS),
        .C_RD_DEPTH			(C_WR_DEPTH_AXIS),
        .C_RD_PNTR_WIDTH		(C_WR_PNTR_WIDTH_AXIS),
        .C_PROG_FULL_TYPE		(C_PROG_FULL_TYPE_AXIS),
        .C_PROG_FULL_THRESH_ASSERT_VAL	(C_PROG_FULL_THRESH_ASSERT_VAL_AXIS),
        .C_PROG_EMPTY_TYPE		(C_PROG_EMPTY_TYPE_AXIS),
        .C_PROG_EMPTY_THRESH_ASSERT_VAL	(C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS),
        .C_USE_ECC                      (C_USE_ECC_AXIS),
        .C_ERROR_INJECTION_TYPE         (C_ERROR_INJECTION_TYPE_AXIS),
        .C_HAS_ALMOST_EMPTY		(0),
        .C_HAS_ALMOST_FULL		(C_APPLICATION_TYPE_AXIS == 1 ? 1: 0),
        .C_AXI_TYPE                     (C_INTERFACE_TYPE == 1 ? 0 : C_AXI_TYPE),
        .C_USE_EMBEDDED_REG		(C_USE_EMBEDDED_REG),
        .C_FIFO_TYPE                    (C_APPLICATION_TYPE_AXIS == 1 ? 0: C_APPLICATION_TYPE_AXIS),
        .C_SYNCHRONIZER_STAGE           (C_SYNCHRONIZER_STAGE),
        .C_HAS_WR_RST			(0),
        .C_HAS_RD_RST			(0),
        .C_HAS_RST			(1),
        .C_HAS_SRST			(0),
        .C_DOUT_RST_VAL			(0),
        .C_HAS_VALID			(0),
        .C_VALID_LOW			(C_VALID_LOW),
        .C_HAS_UNDERFLOW		(C_HAS_UNDERFLOW),
        .C_UNDERFLOW_LOW		(C_UNDERFLOW_LOW),
        .C_HAS_WR_ACK			(0),
        .C_WR_ACK_LOW			(C_WR_ACK_LOW),
        .C_HAS_OVERFLOW			(C_HAS_OVERFLOW),
        .C_OVERFLOW_LOW			(C_OVERFLOW_LOW),
        .C_HAS_DATA_COUNT		((C_COMMON_CLOCK == 1 && C_HAS_DATA_COUNTS_AXIS == 1) ? 1 : 0),
        .C_DATA_COUNT_WIDTH		(C_WR_PNTR_WIDTH_AXIS + 1),
        .C_HAS_RD_DATA_COUNT		((C_COMMON_CLOCK == 0 && C_HAS_DATA_COUNTS_AXIS == 1) ? 1 : 0),
        .C_RD_DATA_COUNT_WIDTH		(C_WR_PNTR_WIDTH_AXIS + 1),
        .C_USE_FWFT_DATA_COUNT		(1), // use extra logic is always true
        .C_HAS_WR_DATA_COUNT		((C_COMMON_CLOCK == 0 && C_HAS_DATA_COUNTS_AXIS == 1) ? 1 : 0),
        .C_WR_DATA_COUNT_WIDTH		(C_WR_PNTR_WIDTH_AXIS + 1),
        .C_FULL_FLAGS_RST_VAL           (1),
        .C_USE_DOUT_RST                 (0),
        .C_MSGON_VAL                    (C_MSGON_VAL),
        .C_ENABLE_RST_SYNC              (1),
        .C_EN_SAFETY_CKT                ((C_IMPLEMENTATION_TYPE_AXIS == 1 || C_IMPLEMENTATION_TYPE_AXIS == 11) ? 1 : 0),
        .C_COUNT_TYPE			(C_COUNT_TYPE),
        .C_DEFAULT_VALUE		(C_DEFAULT_VALUE),
        .C_ENABLE_RLOCS			(C_ENABLE_RLOCS),
        .C_HAS_BACKUP			(C_HAS_BACKUP),
        .C_HAS_INT_CLK                  (C_HAS_INT_CLK),
        .C_MIF_FILE_NAME		(C_MIF_FILE_NAME),
        .C_HAS_MEMINIT_FILE		(C_HAS_MEMINIT_FILE),
        .C_INIT_WR_PNTR_VAL		(C_INIT_WR_PNTR_VAL),
        .C_OPTIMIZATION_MODE		(C_OPTIMIZATION_MODE),
        .C_PRIM_FIFO_TYPE		(C_PRIM_FIFO_TYPE),
        .C_RD_FREQ			(C_RD_FREQ),
        .C_USE_FIFO16_FLAGS		(C_USE_FIFO16_FLAGS),
        .C_WR_FREQ			(C_WR_FREQ),
        .C_WR_RESPONSE_LATENCY		(C_WR_RESPONSE_LATENCY)
      )
    fifo_generator_v13_1_3_axis_dut
      (
        .CLK                      (S_ACLK),
        .WR_CLK                   (S_ACLK),
        .RD_CLK                   (M_ACLK),
        .RST                      (inverted_reset),
        .SRST                     (1'b0),
        .WR_RST                   (inverted_reset),
        .RD_RST                   (inverted_reset),
        .WR_EN                    (axis_wr_en),
        .RD_EN                    (axis_rd_en),
        .PROG_FULL_THRESH         (AXIS_PROG_FULL_THRESH),
        .PROG_FULL_THRESH_ASSERT  ({C_WR_PNTR_WIDTH_AXIS{1'b0}}),
        .PROG_FULL_THRESH_NEGATE  ({C_WR_PNTR_WIDTH_AXIS{1'b0}}),
        .PROG_EMPTY_THRESH        (AXIS_PROG_EMPTY_THRESH),
        .PROG_EMPTY_THRESH_ASSERT ({C_WR_PNTR_WIDTH_AXIS{1'b0}}),
        .PROG_EMPTY_THRESH_NEGATE ({C_WR_PNTR_WIDTH_AXIS{1'b0}}),
        .INJECTDBITERR            (AXIS_INJECTDBITERR),
        .INJECTSBITERR            (AXIS_INJECTSBITERR),
        .DIN                      (axis_din),
        .DOUT                     (axis_dout),
        .FULL                     (axis_full),
        .EMPTY                    (axis_empty),
        .ALMOST_FULL              (axis_almost_full),
        .PROG_FULL                (AXIS_PROG_FULL),
        .ALMOST_EMPTY             (),
        .PROG_EMPTY               (AXIS_PROG_EMPTY),
        .WR_ACK                   (),
        .OVERFLOW                 (AXIS_OVERFLOW),
        .VALID                    (),
        .UNDERFLOW                (AXIS_UNDERFLOW),
        .DATA_COUNT               (axis_dc),
        .RD_DATA_COUNT            (AXIS_RD_DATA_COUNT),
        .WR_DATA_COUNT            (AXIS_WR_DATA_COUNT),
        .SBITERR                  (AXIS_SBITERR),
        .DBITERR                  (AXIS_DBITERR),
        .wr_rst_busy              (wr_rst_busy_axis),
        .rd_rst_busy              (rd_rst_busy_axis),
        .wr_rst_i_out             (axis_wr_rst),
        .rd_rst_i_out             (axis_rd_rst),
        .BACKUP                   (BACKUP),
        .BACKUP_MARKER            (BACKUP_MARKER),
        .INT_CLK                  (INT_CLK)
       );
    assign axis_s_axis_tready    = (IS_8SERIES == 0) ? ~axis_full : (C_IMPLEMENTATION_TYPE_AXIS == 5 || C_IMPLEMENTATION_TYPE_AXIS == 13) ? ~(axis_full | wr_rst_busy_axis) : ~axis_full;
    assign axis_m_axis_tvalid    = (C_APPLICATION_TYPE_AXIS != 1) ? ~axis_empty : ~axis_empty & axis_pkt_read;
    assign S_AXIS_TREADY         = axis_s_axis_tready;
    assign M_AXIS_TVALID         = axis_m_axis_tvalid;
  end endgenerate // axi_streaming
  wire axis_wr_eop;
  reg  axis_wr_eop_d1 = 1'b0;
  wire axis_rd_eop;
  integer  axis_pkt_cnt;
  generate if (C_APPLICATION_TYPE_AXIS == 1 && C_COMMON_CLOCK == 1) begin : gaxis_pkt_fifo_cc
    assign axis_wr_eop = axis_wr_en & S_AXIS_TLAST;
    assign axis_rd_eop = axis_rd_en & axis_dout[0];
    always @ (posedge inverted_reset or posedge S_ACLK)
    begin
      if (inverted_reset)
        axis_pkt_read    <= 1'b0;
      else if (axis_rd_eop && (axis_pkt_cnt == 1) && ~axis_wr_eop_d1)
        axis_pkt_read    <= 1'b0;
      else if ((axis_pkt_cnt > 0) || (axis_almost_full && ~axis_empty))
        axis_pkt_read    <= 1'b1;
    end
    always @ (posedge inverted_reset or posedge S_ACLK)
    begin
      if (inverted_reset)
        axis_wr_eop_d1    <= 1'b0;
      else
        axis_wr_eop_d1   <= axis_wr_eop;
    end
    always @ (posedge inverted_reset or posedge S_ACLK)
    begin
      if (inverted_reset)
        axis_pkt_cnt    <= 0;
      else if (axis_wr_eop_d1 && ~axis_rd_eop)
        axis_pkt_cnt    <= axis_pkt_cnt + 1;
      else if (axis_rd_eop && ~axis_wr_eop_d1)
        axis_pkt_cnt    <= axis_pkt_cnt - 1;
    end
  end endgenerate // gaxis_pkt_fifo_cc
reg [LOG_DEPTH_AXIS-1 : 0] axis_wpkt_cnt_gc = 0;
wire [(LOG_DEPTH_AXIS)-1 : 0] axis_wpkt_cnt_gc_asreg_last;
wire axis_rd_has_rst;
wire [0:C_SYNCHRONIZER_STAGE] axis_af_q ;
wire  [LOG_DEPTH_AXIS-1 : 0]  wpkt_q [0:C_SYNCHRONIZER_STAGE] ;
wire [1:C_SYNCHRONIZER_STAGE] axis_af_q_temp = 0;
wire [LOG_DEPTH_AXIS-1 : 0] wpkt_q_temp [1:C_SYNCHRONIZER_STAGE]  ;
reg [LOG_DEPTH_AXIS-1 : 0] axis_wpkt_cnt_rd = 0;
reg [LOG_DEPTH_AXIS-1 : 0] axis_wpkt_cnt = 0;
reg [LOG_DEPTH_AXIS-1 : 0] axis_rpkt_cnt = 0;
wire [LOG_DEPTH_AXIS : 0] adj_axis_wpkt_cnt_rd_pad;
wire [LOG_DEPTH_AXIS : 0] rpkt_inv_pad;
wire [LOG_DEPTH_AXIS-1 : 0] diff_pkt_cnt;
reg [LOG_DEPTH_AXIS : 0] diff_pkt_cnt_pad = 0;
reg adj_axis_wpkt_cnt_rd_pad_0 = 0;
reg rpkt_inv_pad_0 = 0;
wire axis_af_rd ;
generate if (C_HAS_RST == 1) begin : rst_blk_has
  assign axis_rd_has_rst = axis_rd_rst;
end endgenerate //rst_blk_has
generate if (C_HAS_RST == 0) begin :rst_blk_no
  assign axis_rd_has_rst = 1'b0;
end endgenerate //rst_blk_no
   genvar i;
   generate for (i = 1; ((i <= C_SYNCHRONIZER_STAGE) && (C_APPLICATION_TYPE_AXIS == 1 && C_COMMON_CLOCK == 0) ); i = i + 1) begin : gpkt_cnt_sync_stage
     fifo_generator_v13_1_3_sync_stage
       #(
         .C_WIDTH  (LOG_DEPTH_AXIS)
        )
     rd_stg_inst
        (
         .RST      (axis_rd_has_rst),
         .CLK      (M_ACLK),
         .DIN      (wpkt_q[i-1]),
         .DOUT     (wpkt_q[i])
        );
     fifo_generator_v13_1_3_sync_stage
       #(
         .C_WIDTH  (1)
        )
     wr_stg_inst
        (
         .RST      (axis_rd_has_rst),
         .CLK      (M_ACLK),
         .DIN      (axis_af_q[i-1]),
         .DOUT     (axis_af_q[i])
        );
   end endgenerate // gpkt_cnt_sync_stage
  generate if (C_APPLICATION_TYPE_AXIS == 1 && C_COMMON_CLOCK == 0) begin : gaxis_pkt_fifo_ic
    assign axis_wr_eop = axis_wr_en & S_AXIS_TLAST;
    assign axis_rd_eop = axis_rd_en & axis_dout[0];
    always @ (posedge axis_rd_has_rst or posedge M_ACLK)
    begin
      if (axis_rd_has_rst)
        axis_pkt_read    <= 1'b0;
      else if (axis_rd_eop && (diff_pkt_cnt == 1))
        axis_pkt_read    <= 1'b0;
      else if ((diff_pkt_cnt > 0) || (axis_af_rd && ~axis_empty))
        axis_pkt_read    <= 1'b1;
    end
  always @ (posedge axis_wr_rst or posedge S_ACLK)
    begin
      if (axis_wr_rst)
        axis_wpkt_cnt    <= 1'b0;
      else if (axis_wr_eop)
        axis_wpkt_cnt    <= axis_wpkt_cnt + 1;
    end
  always @ (posedge axis_wr_rst or posedge S_ACLK)
    begin
      if (axis_wr_rst)
        axis_wpkt_cnt_gc    <= 1'b0;
      else
        axis_wpkt_cnt_gc    <= bin2gray(axis_wpkt_cnt);
    end
    assign  wpkt_q[0]  = axis_wpkt_cnt_gc;
    assign  axis_wpkt_cnt_gc_asreg_last       = wpkt_q[C_SYNCHRONIZER_STAGE];
    assign  axis_af_q[0]                      = axis_almost_full;
    //assign  axis_af_q[1:C_SYNCHRONIZER_STAGE] = axis_af_q_temp[1:C_SYNCHRONIZER_STAGE];
    assign  axis_af_rd                        = axis_af_q[C_SYNCHRONIZER_STAGE];
  always @ (posedge axis_rd_has_rst or posedge M_ACLK)
    begin
      if (axis_rd_has_rst)
        axis_wpkt_cnt_rd    <= 1'b0;
      else
        axis_wpkt_cnt_rd    <= gray2bin(axis_wpkt_cnt_gc_asreg_last);
    end
  always @ (posedge axis_rd_rst or posedge M_ACLK)
    begin
      if (axis_rd_has_rst)
        axis_rpkt_cnt    <= 1'b0;
      else if (axis_rd_eop)
        axis_rpkt_cnt    <= axis_rpkt_cnt + 1;
    end
  // Take the difference of write and read packet count
  // Logic is similar to rd_pe_as
   assign adj_axis_wpkt_cnt_rd_pad[LOG_DEPTH_AXIS : 1] = axis_wpkt_cnt_rd;
   assign rpkt_inv_pad[LOG_DEPTH_AXIS : 1]             = ~axis_rpkt_cnt;
   assign adj_axis_wpkt_cnt_rd_pad[0]                                = adj_axis_wpkt_cnt_rd_pad_0;
   assign rpkt_inv_pad[0]                                            = rpkt_inv_pad_0;
  always @ ( axis_rd_eop )
    begin
      if (!axis_rd_eop) begin
        adj_axis_wpkt_cnt_rd_pad_0    <= 1'b1;
        rpkt_inv_pad_0                <= 1'b1;
      end else begin
        adj_axis_wpkt_cnt_rd_pad_0    <= 1'b0;
        rpkt_inv_pad_0                <= 1'b0;
      end
    end
  always @ (posedge axis_rd_rst or posedge M_ACLK)
    begin
      if (axis_rd_has_rst)
        diff_pkt_cnt_pad    <= 1'b0;
      else
        diff_pkt_cnt_pad    <= adj_axis_wpkt_cnt_rd_pad + rpkt_inv_pad ;
    end
   assign  diff_pkt_cnt = diff_pkt_cnt_pad [LOG_DEPTH_AXIS : 1] ;
   end endgenerate // gaxis_pkt_fifo_ic
  // Generate the accurate data count for axi stream packet fifo configuration
  reg [C_WR_PNTR_WIDTH_AXIS:0] axis_dc_pkt_fifo = 0;
  generate if (IS_AXI_STREAMING == 1 && C_HAS_DATA_COUNTS_AXIS == 1 && C_APPLICATION_TYPE_AXIS == 1) begin : gdc_pkt
    always @ (posedge inverted_reset or posedge S_ACLK)
    begin
      if (inverted_reset)
        axis_dc_pkt_fifo <= 0;
      else if (axis_wr_en && (~axis_rd_en))
        axis_dc_pkt_fifo <= #`TCQ axis_dc_pkt_fifo + 1;
      else if (~axis_wr_en && axis_rd_en)
        axis_dc_pkt_fifo <= #`TCQ axis_dc_pkt_fifo - 1;
    end
    assign AXIS_DATA_COUNT = axis_dc_pkt_fifo;
  end endgenerate // gdc_pkt
  generate if (IS_AXI_STREAMING == 1 && C_HAS_DATA_COUNTS_AXIS == 0 && C_APPLICATION_TYPE_AXIS == 1) begin : gndc_pkt
    assign AXIS_DATA_COUNT = 0;
  end endgenerate // gndc_pkt
  generate if (IS_AXI_STREAMING == 1 && C_APPLICATION_TYPE_AXIS != 1) begin : gdc
    assign AXIS_DATA_COUNT = axis_dc;
  end endgenerate // gdc
  // Register Slice for Write Address Channel
  generate if (C_AXIS_TYPE == 1) begin : gaxis_reg_slice
    assign axis_wr_en = (C_HAS_SLAVE_CE == 1)  ? S_AXIS_TVALID & S_ACLK_EN : S_AXIS_TVALID;
    assign axis_rd_en = (C_HAS_MASTER_CE == 1) ? M_AXIS_TREADY & M_ACLK_EN : M_AXIS_TREADY;
    fifo_generator_v13_1_3_axic_reg_slice
          #(
            .C_FAMILY                (C_FAMILY),
            .C_DATA_WIDTH            (C_DIN_WIDTH_AXIS),
            .C_REG_CONFIG            (C_REG_SLICE_MODE_AXIS)
            )
    axis_reg_slice_inst
        (
          // System Signals
          .ACLK                      (S_ACLK),
          .ARESET                    (axi_rs_rst),
          // Slave side
          .S_PAYLOAD_DATA            (axis_din),
          .S_VALID                   (axis_wr_en),
          .S_READY                   (S_AXIS_TREADY),
          // Master side
          .M_PAYLOAD_DATA            (axis_dout),
          .M_VALID                   (M_AXIS_TVALID),
          .M_READY                   (axis_rd_en)
          );
  end endgenerate // gaxis_reg_slice
  generate if ((IS_AXI_STREAMING == 1 || C_AXIS_TYPE == 1) && C_HAS_AXIS_TDATA == 1) begin : tdata
    assign axis_din[C_DIN_WIDTH_AXIS-1:TDATA_OFFSET] = S_AXIS_TDATA;
    assign M_AXIS_TDATA   = axis_dout[C_DIN_WIDTH_AXIS-1:TDATA_OFFSET];
  end endgenerate
  generate if ((IS_AXI_STREAMING == 1 || C_AXIS_TYPE == 1) && C_HAS_AXIS_TSTRB == 1) begin : tstrb
    assign axis_din[TDATA_OFFSET-1:TSTRB_OFFSET] = S_AXIS_TSTRB;
    assign M_AXIS_TSTRB   = axis_dout[TDATA_OFFSET-1:TSTRB_OFFSET];
  end endgenerate
  generate if ((IS_AXI_STREAMING == 1 || C_AXIS_TYPE == 1) && C_HAS_AXIS_TKEEP == 1) begin : tkeep
    assign axis_din[TSTRB_OFFSET-1:TKEEP_OFFSET] = S_AXIS_TKEEP;
    assign M_AXIS_TKEEP   = axis_dout[TSTRB_OFFSET-1:TKEEP_OFFSET];
  end endgenerate
  generate if ((IS_AXI_STREAMING == 1 || C_AXIS_TYPE == 1) && C_HAS_AXIS_TID == 1) begin : tid
    assign axis_din[TKEEP_OFFSET-1:TID_OFFSET] = S_AXIS_TID;
    assign M_AXIS_TID     = axis_dout[TKEEP_OFFSET-1:TID_OFFSET];
  end endgenerate
  generate if ((IS_AXI_STREAMING == 1 || C_AXIS_TYPE == 1) && C_HAS_AXIS_TDEST == 1) begin : tdest
    assign axis_din[TID_OFFSET-1:TDEST_OFFSET] = S_AXIS_TDEST;
    assign M_AXIS_TDEST   = axis_dout[TID_OFFSET-1:TDEST_OFFSET];
  end endgenerate
  generate if ((IS_AXI_STREAMING == 1 || C_AXIS_TYPE == 1) && C_HAS_AXIS_TUSER == 1) begin : tuser
    assign axis_din[TDEST_OFFSET-1:TUSER_OFFSET] = S_AXIS_TUSER;
    assign M_AXIS_TUSER   = axis_dout[TDEST_OFFSET-1:TUSER_OFFSET];
  end endgenerate
  generate if ((IS_AXI_STREAMING == 1 || C_AXIS_TYPE == 1) && C_HAS_AXIS_TLAST == 1) begin : tlast
    assign axis_din[0] = S_AXIS_TLAST;
    assign M_AXIS_TLAST   = axis_dout[0];
  end endgenerate
  //###########################################################################
  //  AXI FULL Write Channel (axi_write_channel)
  //###########################################################################
  localparam IS_AXI_FULL       = ((C_INTERFACE_TYPE == 2) && (C_AXI_TYPE != 2)) ? 1 : 0;
  localparam IS_AXI_LITE       = ((C_INTERFACE_TYPE == 2) && (C_AXI_TYPE == 2)) ? 1 : 0;
  localparam IS_AXI_FULL_WACH  = ((IS_AXI_FULL == 1) && (C_WACH_TYPE == 0) && C_HAS_AXI_WR_CHANNEL == 1) ? 1 : 0;
  localparam IS_AXI_FULL_WDCH  = ((IS_AXI_FULL == 1) && (C_WDCH_TYPE == 0) && C_HAS_AXI_WR_CHANNEL == 1) ? 1 : 0;
  localparam IS_AXI_FULL_WRCH  = ((IS_AXI_FULL == 1) && (C_WRCH_TYPE == 0) && C_HAS_AXI_WR_CHANNEL == 1) ? 1 : 0;
  localparam IS_AXI_FULL_RACH  = ((IS_AXI_FULL == 1) && (C_RACH_TYPE == 0) && C_HAS_AXI_RD_CHANNEL == 1) ? 1 : 0;
  localparam IS_AXI_FULL_RDCH  = ((IS_AXI_FULL == 1) && (C_RDCH_TYPE == 0) && C_HAS_AXI_RD_CHANNEL == 1) ? 1 : 0;
  localparam IS_AXI_LITE_WACH  = ((IS_AXI_LITE == 1) && (C_WACH_TYPE == 0) && C_HAS_AXI_WR_CHANNEL == 1) ? 1 : 0;
  localparam IS_AXI_LITE_WDCH  = ((IS_AXI_LITE == 1) && (C_WDCH_TYPE == 0) && C_HAS_AXI_WR_CHANNEL == 1) ? 1 : 0;
  localparam IS_AXI_LITE_WRCH  = ((IS_AXI_LITE == 1) && (C_WRCH_TYPE == 0) && C_HAS_AXI_WR_CHANNEL == 1) ? 1 : 0;
  localparam IS_AXI_LITE_RACH  = ((IS_AXI_LITE == 1) && (C_RACH_TYPE == 0) && C_HAS_AXI_RD_CHANNEL == 1) ? 1 : 0;
  localparam IS_AXI_LITE_RDCH  = ((IS_AXI_LITE == 1) && (C_RDCH_TYPE == 0) && C_HAS_AXI_RD_CHANNEL == 1) ? 1 : 0;
  localparam IS_WR_ADDR_CH     = ((IS_AXI_FULL_WACH == 1) || (IS_AXI_LITE_WACH == 1)) ? 1 : 0;
  localparam IS_WR_DATA_CH     = ((IS_AXI_FULL_WDCH == 1) || (IS_AXI_LITE_WDCH == 1)) ? 1 : 0;
  localparam IS_WR_RESP_CH     = ((IS_AXI_FULL_WRCH == 1) || (IS_AXI_LITE_WRCH == 1)) ? 1 : 0;
  localparam IS_RD_ADDR_CH     = ((IS_AXI_FULL_RACH == 1) || (IS_AXI_LITE_RACH == 1)) ? 1 : 0;
  localparam IS_RD_DATA_CH     = ((IS_AXI_FULL_RDCH == 1) || (IS_AXI_LITE_RDCH == 1)) ? 1 : 0;
  localparam AWID_OFFSET       = (C_AXI_TYPE != 2 && C_HAS_AXI_ID == 1) ? C_DIN_WIDTH_WACH - C_AXI_ID_WIDTH : C_DIN_WIDTH_WACH;
  localparam AWADDR_OFFSET     = AWID_OFFSET - C_AXI_ADDR_WIDTH;
  localparam AWLEN_OFFSET      = C_AXI_TYPE != 2 ? AWADDR_OFFSET - C_AXI_LEN_WIDTH : AWADDR_OFFSET;
  localparam AWSIZE_OFFSET     = C_AXI_TYPE != 2 ? AWLEN_OFFSET - C_AXI_SIZE_WIDTH : AWLEN_OFFSET;
  localparam AWBURST_OFFSET    = C_AXI_TYPE != 2 ? AWSIZE_OFFSET - C_AXI_BURST_WIDTH : AWSIZE_OFFSET;
  localparam AWLOCK_OFFSET     = C_AXI_TYPE != 2 ? AWBURST_OFFSET - C_AXI_LOCK_WIDTH : AWBURST_OFFSET;
  localparam AWCACHE_OFFSET    = C_AXI_TYPE != 2 ? AWLOCK_OFFSET - C_AXI_CACHE_WIDTH : AWLOCK_OFFSET;
  localparam AWPROT_OFFSET     = AWCACHE_OFFSET - C_AXI_PROT_WIDTH;
  localparam AWQOS_OFFSET      = AWPROT_OFFSET - C_AXI_QOS_WIDTH;
  localparam AWREGION_OFFSET   = C_AXI_TYPE == 1 ? AWQOS_OFFSET - C_AXI_REGION_WIDTH : AWQOS_OFFSET;
  localparam AWUSER_OFFSET     = C_HAS_AXI_AWUSER == 1 ? AWREGION_OFFSET-C_AXI_AWUSER_WIDTH : AWREGION_OFFSET;
  localparam WID_OFFSET        = (C_AXI_TYPE == 3 && C_HAS_AXI_ID == 1) ? C_DIN_WIDTH_WDCH - C_AXI_ID_WIDTH : C_DIN_WIDTH_WDCH;
  localparam WDATA_OFFSET      = WID_OFFSET - C_AXI_DATA_WIDTH;
  localparam WSTRB_OFFSET      = WDATA_OFFSET - C_AXI_DATA_WIDTH/8;
  localparam WUSER_OFFSET      = C_HAS_AXI_WUSER == 1 ? WSTRB_OFFSET-C_AXI_WUSER_WIDTH : WSTRB_OFFSET;
  localparam BID_OFFSET        = (C_AXI_TYPE != 2 && C_HAS_AXI_ID == 1) ? C_DIN_WIDTH_WRCH - C_AXI_ID_WIDTH : C_DIN_WIDTH_WRCH;
  localparam BRESP_OFFSET      = BID_OFFSET - C_AXI_BRESP_WIDTH;
  localparam BUSER_OFFSET      = C_HAS_AXI_BUSER == 1 ? BRESP_OFFSET-C_AXI_BUSER_WIDTH : BRESP_OFFSET;
  wire  [C_DIN_WIDTH_WACH-1:0]  wach_din          ;
  wire  [C_DIN_WIDTH_WACH-1:0]  wach_dout         ;
  wire  [C_DIN_WIDTH_WACH-1:0]  wach_dout_pkt     ;
  wire                          wach_full         ;
  wire                          wach_almost_full  ;
  wire                          wach_prog_full    ;
  wire                          wach_empty        ;
  wire                          wach_almost_empty ;
  wire                          wach_prog_empty   ;
  wire  [C_DIN_WIDTH_WDCH-1:0]  wdch_din          ;
  wire  [C_DIN_WIDTH_WDCH-1:0]  wdch_dout         ;
  wire                          wdch_full         ;
  wire                          wdch_almost_full  ;
  wire                          wdch_prog_full    ;
  wire                          wdch_empty        ;
  wire                          wdch_almost_empty ;
  wire                          wdch_prog_empty   ;
  wire  [C_DIN_WIDTH_WRCH-1:0]  wrch_din          ;
  wire  [C_DIN_WIDTH_WRCH-1:0]  wrch_dout         ;
  wire                          wrch_full         ;
  wire                          wrch_almost_full  ;
  wire                          wrch_prog_full    ;
  wire                          wrch_empty        ;
  wire                          wrch_almost_empty ;
  wire                          wrch_prog_empty   ;
  wire                          axi_aw_underflow_i;
  wire                          axi_w_underflow_i ;
  wire                          axi_b_underflow_i ;
  wire                          axi_aw_overflow_i ;
  wire                          axi_w_overflow_i  ;
  wire                          axi_b_overflow_i  ;
  wire                          axi_wr_underflow_i;
  wire                          axi_wr_overflow_i ;
  wire                          wach_s_axi_awready;
  wire                          wach_m_axi_awvalid;
  wire                          wach_wr_en        ;
  wire                          wach_rd_en        ;
  wire                          wdch_s_axi_wready ;
  wire                          wdch_m_axi_wvalid ;
  wire                          wdch_wr_en        ;
  wire                          wdch_rd_en        ;
  wire                          wrch_s_axi_bvalid ;
  wire                          wrch_m_axi_bready ;
  wire                          wrch_wr_en        ;
  wire                          wrch_rd_en        ;
  wire                          txn_count_up      ;
  wire                          txn_count_down    ;
  wire                          awvalid_en        ;
  wire                          awvalid_pkt       ;
  wire                          awready_pkt       ;
  integer                       wr_pkt_count      ;
  wire                          wach_we           ;
  wire                          wach_re           ;
  wire                          wdch_we           ;
  wire                          wdch_re           ;
  wire                          wrch_we           ;
  wire                          wrch_re           ;
  generate if (IS_WR_ADDR_CH == 1) begin : axi_write_address_channel
    // Write protection when almost full or prog_full is high
    assign wach_we    = (C_PROG_FULL_TYPE_WACH != 0) ? wach_s_axi_awready & S_AXI_AWVALID : S_AXI_AWVALID;
    // Read protection when almost empty or prog_empty is high
    assign wach_re    = (C_PROG_EMPTY_TYPE_WACH != 0 && C_APPLICATION_TYPE_WACH == 1) ?
                        wach_m_axi_awvalid & awready_pkt & awvalid_en :
                        (C_PROG_EMPTY_TYPE_WACH != 0 && C_APPLICATION_TYPE_WACH != 1) ?
                        M_AXI_AWREADY && wach_m_axi_awvalid :
                        (C_PROG_EMPTY_TYPE_WACH == 0 && C_APPLICATION_TYPE_WACH == 1) ?
                        awready_pkt & awvalid_en :
                        (C_PROG_EMPTY_TYPE_WACH == 0 && C_APPLICATION_TYPE_WACH != 1) ?
                        M_AXI_AWREADY : 1'b0;
    assign wach_wr_en = (C_HAS_SLAVE_CE == 1)  ? wach_we & S_ACLK_EN : wach_we;
    assign wach_rd_en = (C_HAS_MASTER_CE == 1) ? wach_re & M_ACLK_EN : wach_re;
    fifo_generator_v13_1_3_CONV_VER
      #(
        .C_FAMILY			(C_FAMILY),
        .C_COMMON_CLOCK                 (C_COMMON_CLOCK),
        .C_MEMORY_TYPE			((C_IMPLEMENTATION_TYPE_WACH == 1  || C_IMPLEMENTATION_TYPE_WACH == 11) ? 1 :
                                         (C_IMPLEMENTATION_TYPE_WACH == 2  || C_IMPLEMENTATION_TYPE_WACH == 12) ? 2 : 4),
        .C_IMPLEMENTATION_TYPE		((C_IMPLEMENTATION_TYPE_WACH == 1  || C_IMPLEMENTATION_TYPE_WACH == 2) ? 0 :
                                         (C_IMPLEMENTATION_TYPE_WACH == 11 || C_IMPLEMENTATION_TYPE_WACH == 12) ? 2 : 6),
        .C_PRELOAD_REGS			(1), // always FWFT for AXI
        .C_PRELOAD_LATENCY		(0), // always FWFT for AXI
        .C_DIN_WIDTH			(C_DIN_WIDTH_WACH),
        .C_INTERFACE_TYPE 		(C_INTERFACE_TYPE),
        .C_WR_DEPTH			(C_WR_DEPTH_WACH),
        .C_WR_PNTR_WIDTH		(C_WR_PNTR_WIDTH_WACH),
        .C_DOUT_WIDTH			(C_DIN_WIDTH_WACH),
        .C_RD_DEPTH			(C_WR_DEPTH_WACH),
        .C_RD_PNTR_WIDTH		(C_WR_PNTR_WIDTH_WACH),
        .C_PROG_FULL_TYPE		(C_PROG_FULL_TYPE_WACH),
        .C_PROG_FULL_THRESH_ASSERT_VAL	(C_PROG_FULL_THRESH_ASSERT_VAL_WACH),
        .C_PROG_EMPTY_TYPE		(C_PROG_EMPTY_TYPE_WACH),
        .C_PROG_EMPTY_THRESH_ASSERT_VAL	(C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH),
        .C_USE_ECC                      (C_USE_ECC_WACH),
        .C_ERROR_INJECTION_TYPE         (C_ERROR_INJECTION_TYPE_WACH),
        .C_HAS_ALMOST_EMPTY		(0),
        .C_HAS_ALMOST_FULL		(0),
        .C_AXI_TYPE                     (C_INTERFACE_TYPE == 1 ? 0 : C_AXI_TYPE),
        .C_FIFO_TYPE                    ((C_APPLICATION_TYPE_WACH == 1)?0:C_APPLICATION_TYPE_WACH),
        .C_SYNCHRONIZER_STAGE           (C_SYNCHRONIZER_STAGE),
        .C_HAS_WR_RST			(0),
        .C_HAS_RD_RST			(0),
        .C_HAS_RST			(1),
        .C_HAS_SRST			(0),
        .C_DOUT_RST_VAL			(0),
        .C_EN_SAFETY_CKT                ((C_IMPLEMENTATION_TYPE_WACH == 1 || C_IMPLEMENTATION_TYPE_WACH == 11) ? 1 : 0),
        .C_HAS_VALID			(0),
        .C_VALID_LOW			(C_VALID_LOW),
        .C_HAS_UNDERFLOW		(C_HAS_UNDERFLOW),
        .C_UNDERFLOW_LOW		(C_UNDERFLOW_LOW),
        .C_HAS_WR_ACK			(0),
        .C_WR_ACK_LOW			(C_WR_ACK_LOW),
        .C_HAS_OVERFLOW			(C_HAS_OVERFLOW),
        .C_OVERFLOW_LOW			(C_OVERFLOW_LOW),
        .C_HAS_DATA_COUNT		((C_COMMON_CLOCK == 1 && C_HAS_DATA_COUNTS_WACH == 1) ? 1 : 0),
        .C_DATA_COUNT_WIDTH		(C_WR_PNTR_WIDTH_WACH + 1),
        .C_HAS_RD_DATA_COUNT		((C_COMMON_CLOCK == 0 && C_HAS_DATA_COUNTS_WACH == 1) ? 1 : 0),
        .C_RD_DATA_COUNT_WIDTH		(C_WR_PNTR_WIDTH_WACH + 1),
        .C_USE_FWFT_DATA_COUNT		(1), // use extra logic is always true
        .C_HAS_WR_DATA_COUNT		((C_COMMON_CLOCK == 0 && C_HAS_DATA_COUNTS_WACH == 1) ? 1 : 0),
        .C_WR_DATA_COUNT_WIDTH		(C_WR_PNTR_WIDTH_WACH + 1),
        .C_FULL_FLAGS_RST_VAL           (1),
        .C_USE_EMBEDDED_REG		(0),
        .C_USE_DOUT_RST                 (0),
        .C_MSGON_VAL                    (C_MSGON_VAL),
        .C_ENABLE_RST_SYNC              (1),
        .C_COUNT_TYPE			(C_COUNT_TYPE),
        .C_DEFAULT_VALUE		(C_DEFAULT_VALUE),
        .C_ENABLE_RLOCS			(C_ENABLE_RLOCS),
        .C_HAS_BACKUP			(C_HAS_BACKUP),
        .C_HAS_INT_CLK                  (C_HAS_INT_CLK),
        .C_MIF_FILE_NAME		(C_MIF_FILE_NAME),
        .C_HAS_MEMINIT_FILE		(C_HAS_MEMINIT_FILE),
        .C_INIT_WR_PNTR_VAL		(C_INIT_WR_PNTR_VAL),
        .C_OPTIMIZATION_MODE		(C_OPTIMIZATION_MODE),
        .C_PRIM_FIFO_TYPE		(C_PRIM_FIFO_TYPE),
        .C_RD_FREQ			(C_RD_FREQ),
        .C_USE_FIFO16_FLAGS		(C_USE_FIFO16_FLAGS),
        .C_WR_FREQ			(C_WR_FREQ),
        .C_WR_RESPONSE_LATENCY		(C_WR_RESPONSE_LATENCY)
      )
    fifo_generator_v13_1_3_wach_dut
      (
        .CLK                      (S_ACLK),
        .WR_CLK                   (S_ACLK),
        .RD_CLK                   (M_ACLK),
        .RST                      (inverted_reset),
        .SRST                     (1'b0),
        .WR_RST                   (inverted_reset),
        .RD_RST                   (inverted_reset),
        .WR_EN                    (wach_wr_en),
        .RD_EN                    (wach_rd_en),
        .PROG_FULL_THRESH         (AXI_AW_PROG_FULL_THRESH),
        .PROG_FULL_THRESH_ASSERT  ({C_WR_PNTR_WIDTH_WACH{1'b0}}),
        .PROG_FULL_THRESH_NEGATE  ({C_WR_PNTR_WIDTH_WACH{1'b0}}),
        .PROG_EMPTY_THRESH        (AXI_AW_PROG_EMPTY_THRESH),
        .PROG_EMPTY_THRESH_ASSERT ({C_WR_PNTR_WIDTH_WACH{1'b0}}),
        .PROG_EMPTY_THRESH_NEGATE ({C_WR_PNTR_WIDTH_WACH{1'b0}}),
        .INJECTDBITERR            (AXI_AW_INJECTDBITERR),
        .INJECTSBITERR            (AXI_AW_INJECTSBITERR),
        .DIN                      (wach_din),
        .DOUT                     (wach_dout_pkt),
        .FULL                     (wach_full),
        .EMPTY                    (wach_empty),
        .ALMOST_FULL              (),
        .PROG_FULL                (AXI_AW_PROG_FULL),
        .ALMOST_EMPTY             (),
        .PROG_EMPTY               (AXI_AW_PROG_EMPTY),
        .WR_ACK                   (),
        .OVERFLOW                 (axi_aw_overflow_i),
        .VALID                    (),
        .UNDERFLOW                (axi_aw_underflow_i),
        .DATA_COUNT               (AXI_AW_DATA_COUNT),
        .RD_DATA_COUNT            (AXI_AW_RD_DATA_COUNT),
        .WR_DATA_COUNT            (AXI_AW_WR_DATA_COUNT),
        .SBITERR                  (AXI_AW_SBITERR),
        .DBITERR                  (AXI_AW_DBITERR),
        .wr_rst_busy              (wr_rst_busy_wach),
        .rd_rst_busy              (rd_rst_busy_wach),
        .wr_rst_i_out             (),
        .rd_rst_i_out             (),
        .BACKUP                   (BACKUP),
        .BACKUP_MARKER            (BACKUP_MARKER),
        .INT_CLK                  (INT_CLK)
       );
    assign wach_s_axi_awready    = (IS_8SERIES == 0) ? ~wach_full : (C_IMPLEMENTATION_TYPE_WACH == 5 || C_IMPLEMENTATION_TYPE_WACH == 13) ? ~(wach_full | wr_rst_busy_wach) : ~wach_full;
    assign wach_m_axi_awvalid   = ~wach_empty;
    assign S_AXI_AWREADY        = wach_s_axi_awready;
    assign AXI_AW_UNDERFLOW  = C_USE_COMMON_UNDERFLOW == 0 ? axi_aw_underflow_i : 0;
    assign AXI_AW_OVERFLOW   = C_USE_COMMON_OVERFLOW  == 0 ? axi_aw_overflow_i  : 0;
  end endgenerate // axi_write_address_channel
  // Register Slice for Write Address Channel
  generate if (C_WACH_TYPE == 1) begin : gwach_reg_slice
    fifo_generator_v13_1_3_axic_reg_slice
          #(
            .C_FAMILY                (C_FAMILY),
            .C_DATA_WIDTH            (C_DIN_WIDTH_WACH),
            .C_REG_CONFIG            (C_REG_SLICE_MODE_WACH)
            )
    wach_reg_slice_inst
        (
          // System Signals
          .ACLK                      (S_ACLK),
          .ARESET                    (axi_rs_rst),
          // Slave side
          .S_PAYLOAD_DATA            (wach_din),
          .S_VALID                   (S_AXI_AWVALID),
          .S_READY                   (S_AXI_AWREADY),
          // Master side
          .M_PAYLOAD_DATA            (wach_dout),
          .M_VALID                   (M_AXI_AWVALID),
          .M_READY                   (M_AXI_AWREADY)
          );
  end endgenerate // gwach_reg_slice
  generate if (C_APPLICATION_TYPE_WACH == 1 && C_HAS_AXI_WR_CHANNEL == 1) begin : axi_mm_pkt_fifo_wr
    fifo_generator_v13_1_3_axic_reg_slice
          #(
            .C_FAMILY                (C_FAMILY),
            .C_DATA_WIDTH            (C_DIN_WIDTH_WACH),
            .C_REG_CONFIG            (1)
            )
    wach_pkt_reg_slice_inst
        (
          // System Signals
          .ACLK                      (S_ACLK),
          .ARESET                    (inverted_reset),
          // Slave side
          .S_PAYLOAD_DATA            (wach_dout_pkt),
          .S_VALID                   (awvalid_pkt),
          .S_READY                   (awready_pkt),
          // Master side
          .M_PAYLOAD_DATA            (wach_dout),
          .M_VALID                   (M_AXI_AWVALID),
          .M_READY                   (M_AXI_AWREADY)
          );
    assign awvalid_pkt = wach_m_axi_awvalid && awvalid_en;
    assign txn_count_up = wdch_s_axi_wready && wdch_wr_en && wdch_din[0];
    assign txn_count_down = wach_m_axi_awvalid && awready_pkt && awvalid_en;
    always@(posedge S_ACLK or posedge inverted_reset) begin
      if(inverted_reset == 1) begin
	wr_pkt_count <= 0;
      end else begin
	if(txn_count_up == 1 && txn_count_down == 0) begin
	  wr_pkt_count <= wr_pkt_count + 1;
	end else if(txn_count_up == 0 && txn_count_down == 1) begin
	  wr_pkt_count <= wr_pkt_count - 1;
	end
      end
    end //Always end
    assign awvalid_en = (wr_pkt_count > 0)?1:0;
  end endgenerate
  generate if (C_APPLICATION_TYPE_WACH != 1) begin : axi_mm_fifo_wr
    assign awvalid_en    = 1;
    assign wach_dout     = wach_dout_pkt;
    assign M_AXI_AWVALID = wach_m_axi_awvalid;
  end
  endgenerate
  generate if (IS_WR_DATA_CH == 1) begin : axi_write_data_channel
    // Write protection when almost full or prog_full is high
    assign wdch_we    = (C_PROG_FULL_TYPE_WDCH != 0) ? wdch_s_axi_wready & S_AXI_WVALID : S_AXI_WVALID;
    // Read protection when almost empty or prog_empty is high
    assign wdch_re    = (C_PROG_EMPTY_TYPE_WDCH != 0) ? wdch_m_axi_wvalid & M_AXI_WREADY : M_AXI_WREADY;
    assign wdch_wr_en = (C_HAS_SLAVE_CE == 1)  ? wdch_we & S_ACLK_EN : wdch_we;
    assign wdch_rd_en = (C_HAS_MASTER_CE == 1) ? wdch_re & M_ACLK_EN : wdch_re;
    fifo_generator_v13_1_3_CONV_VER
      #(
        .C_FAMILY			(C_FAMILY),
        .C_COMMON_CLOCK                 (C_COMMON_CLOCK),
        .C_MEMORY_TYPE			((C_IMPLEMENTATION_TYPE_WDCH == 1  || C_IMPLEMENTATION_TYPE_WDCH == 11) ? 1 :
                                         (C_IMPLEMENTATION_TYPE_WDCH == 2  || C_IMPLEMENTATION_TYPE_WDCH == 12) ? 2 : 4),
        .C_IMPLEMENTATION_TYPE		((C_IMPLEMENTATION_TYPE_WDCH == 1  || C_IMPLEMENTATION_TYPE_WDCH == 2) ? 0 :
                                         (C_IMPLEMENTATION_TYPE_WDCH == 11 || C_IMPLEMENTATION_TYPE_WDCH == 12) ? 2 : 6),
        .C_PRELOAD_REGS			(1), // always FWFT for AXI
        .C_PRELOAD_LATENCY		(0), // always FWFT for AXI
        .C_DIN_WIDTH			(C_DIN_WIDTH_WDCH),
        .C_WR_DEPTH			(C_WR_DEPTH_WDCH),
        .C_INTERFACE_TYPE 		(C_INTERFACE_TYPE),
        .C_WR_PNTR_WIDTH		(C_WR_PNTR_WIDTH_WDCH),
        .C_DOUT_WIDTH			(C_DIN_WIDTH_WDCH),
        .C_RD_DEPTH			(C_WR_DEPTH_WDCH),
        .C_RD_PNTR_WIDTH		(C_WR_PNTR_WIDTH_WDCH),
        .C_PROG_FULL_TYPE		(C_PROG_FULL_TYPE_WDCH),
        .C_PROG_FULL_THRESH_ASSERT_VAL	(C_PROG_FULL_THRESH_ASSERT_VAL_WDCH),
        .C_PROG_EMPTY_TYPE		(C_PROG_EMPTY_TYPE_WDCH),
        .C_PROG_EMPTY_THRESH_ASSERT_VAL	(C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH),
        .C_USE_ECC                      (C_USE_ECC_WDCH),
        .C_ERROR_INJECTION_TYPE         (C_ERROR_INJECTION_TYPE_WDCH),
        .C_HAS_ALMOST_EMPTY		(0),
        .C_HAS_ALMOST_FULL		(0),
        .C_AXI_TYPE                     (C_INTERFACE_TYPE == 1 ? 0 : C_AXI_TYPE),
        .C_FIFO_TYPE                    (C_APPLICATION_TYPE_WDCH),
        .C_SYNCHRONIZER_STAGE           (C_SYNCHRONIZER_STAGE),
        .C_HAS_WR_RST			(0),
        .C_HAS_RD_RST			(0),
        .C_HAS_RST			(1),
        .C_HAS_SRST			(0),
        .C_DOUT_RST_VAL			(0),
        .C_HAS_VALID			(0),
        .C_VALID_LOW			(C_VALID_LOW),
        .C_HAS_UNDERFLOW		(C_HAS_UNDERFLOW),
        .C_UNDERFLOW_LOW		(C_UNDERFLOW_LOW),
        .C_HAS_WR_ACK			(0),
        .C_WR_ACK_LOW			(C_WR_ACK_LOW),
        .C_HAS_OVERFLOW			(C_HAS_OVERFLOW),
        .C_OVERFLOW_LOW			(C_OVERFLOW_LOW),
        .C_HAS_DATA_COUNT		((C_COMMON_CLOCK == 1 && C_HAS_DATA_COUNTS_WDCH == 1) ? 1 : 0),
        .C_DATA_COUNT_WIDTH		(C_WR_PNTR_WIDTH_WDCH + 1),
        .C_HAS_RD_DATA_COUNT		((C_COMMON_CLOCK == 0 && C_HAS_DATA_COUNTS_WDCH == 1) ? 1 : 0),
        .C_RD_DATA_COUNT_WIDTH		(C_WR_PNTR_WIDTH_WDCH + 1),
        .C_USE_FWFT_DATA_COUNT		(1), // use extra logic is always true
        .C_HAS_WR_DATA_COUNT		((C_COMMON_CLOCK == 0 && C_HAS_DATA_COUNTS_WDCH == 1) ? 1 : 0),
        .C_WR_DATA_COUNT_WIDTH		(C_WR_PNTR_WIDTH_WDCH + 1),
        .C_FULL_FLAGS_RST_VAL           (1),
        .C_USE_EMBEDDED_REG		(0),
        .C_USE_DOUT_RST                 (0),
        .C_MSGON_VAL                    (C_MSGON_VAL),
        .C_ENABLE_RST_SYNC              (1),
        .C_EN_SAFETY_CKT                ((C_IMPLEMENTATION_TYPE_WDCH == 1 || C_IMPLEMENTATION_TYPE_WDCH == 11) ? 1 : 0),
        .C_COUNT_TYPE			(C_COUNT_TYPE),
        .C_DEFAULT_VALUE		(C_DEFAULT_VALUE),
        .C_ENABLE_RLOCS			(C_ENABLE_RLOCS),
        .C_HAS_BACKUP			(C_HAS_BACKUP),
        .C_HAS_INT_CLK                  (C_HAS_INT_CLK),
        .C_MIF_FILE_NAME		(C_MIF_FILE_NAME),
        .C_HAS_MEMINIT_FILE		(C_HAS_MEMINIT_FILE),
        .C_INIT_WR_PNTR_VAL		(C_INIT_WR_PNTR_VAL),
        .C_OPTIMIZATION_MODE		(C_OPTIMIZATION_MODE),
        .C_PRIM_FIFO_TYPE		(C_PRIM_FIFO_TYPE),
        .C_RD_FREQ			(C_RD_FREQ),
        .C_USE_FIFO16_FLAGS		(C_USE_FIFO16_FLAGS),
        .C_WR_FREQ			(C_WR_FREQ),
        .C_WR_RESPONSE_LATENCY		(C_WR_RESPONSE_LATENCY)
      )
    fifo_generator_v13_1_3_wdch_dut
      (
        .CLK                      (S_ACLK),
        .WR_CLK                   (S_ACLK),
        .RD_CLK                   (M_ACLK),
        .RST                      (inverted_reset),
        .SRST                     (1'b0),
        .WR_RST                   (inverted_reset),
        .RD_RST                   (inverted_reset),
        .WR_EN                    (wdch_wr_en),
        .RD_EN                    (wdch_rd_en),
        .PROG_FULL_THRESH         (AXI_W_PROG_FULL_THRESH),
        .PROG_FULL_THRESH_ASSERT  ({C_WR_PNTR_WIDTH_WDCH{1'b0}}),
        .PROG_FULL_THRESH_NEGATE  ({C_WR_PNTR_WIDTH_WDCH{1'b0}}),
        .PROG_EMPTY_THRESH        (AXI_W_PROG_EMPTY_THRESH),
        .PROG_EMPTY_THRESH_ASSERT ({C_WR_PNTR_WIDTH_WDCH{1'b0}}),
        .PROG_EMPTY_THRESH_NEGATE ({C_WR_PNTR_WIDTH_WDCH{1'b0}}),
        .INJECTDBITERR            (AXI_W_INJECTDBITERR),
        .INJECTSBITERR            (AXI_W_INJECTSBITERR),
        .DIN                      (wdch_din),
        .DOUT                     (wdch_dout),
        .FULL                     (wdch_full),
        .EMPTY                    (wdch_empty),
        .ALMOST_FULL              (),
        .PROG_FULL                (AXI_W_PROG_FULL),
        .ALMOST_EMPTY             (),
        .PROG_EMPTY               (AXI_W_PROG_EMPTY),
        .WR_ACK                   (),
        .OVERFLOW                 (axi_w_overflow_i),
        .VALID                    (),
        .UNDERFLOW                (axi_w_underflow_i),
        .DATA_COUNT               (AXI_W_DATA_COUNT),
        .RD_DATA_COUNT            (AXI_W_RD_DATA_COUNT),
        .WR_DATA_COUNT            (AXI_W_WR_DATA_COUNT),
        .SBITERR                  (AXI_W_SBITERR),
        .DBITERR                  (AXI_W_DBITERR),
        .wr_rst_busy              (wr_rst_busy_wdch),
        .rd_rst_busy              (rd_rst_busy_wdch),
        .wr_rst_i_out             (),
        .rd_rst_i_out             (),
        .BACKUP                   (BACKUP),
        .BACKUP_MARKER            (BACKUP_MARKER),
        .INT_CLK                  (INT_CLK)
       );
    assign wdch_s_axi_wready     = (IS_8SERIES == 0) ? ~wdch_full : (C_IMPLEMENTATION_TYPE_WDCH == 5 || C_IMPLEMENTATION_TYPE_WDCH == 13) ? ~(wdch_full | wr_rst_busy_wdch) : ~wdch_full;
    assign wdch_m_axi_wvalid = ~wdch_empty;
    assign S_AXI_WREADY      = wdch_s_axi_wready;
    assign M_AXI_WVALID      = wdch_m_axi_wvalid;
    assign AXI_W_UNDERFLOW   = C_USE_COMMON_UNDERFLOW == 0 ? axi_w_underflow_i  : 0;
    assign AXI_W_OVERFLOW    = C_USE_COMMON_OVERFLOW  == 0 ? axi_w_overflow_i   : 0;
  end endgenerate // axi_write_data_channel
  // Register Slice for Write Data Channel
  generate if (C_WDCH_TYPE == 1) begin : gwdch_reg_slice
    fifo_generator_v13_1_3_axic_reg_slice
          #(
            .C_FAMILY                (C_FAMILY),
            .C_DATA_WIDTH            (C_DIN_WIDTH_WDCH),
            .C_REG_CONFIG            (C_REG_SLICE_MODE_WDCH)
            )
    wdch_reg_slice_inst
        (
          // System Signals
          .ACLK                      (S_ACLK),
          .ARESET                    (axi_rs_rst),
          // Slave side
          .S_PAYLOAD_DATA            (wdch_din),
          .S_VALID                   (S_AXI_WVALID),
          .S_READY                   (S_AXI_WREADY),
          // Master side
          .M_PAYLOAD_DATA            (wdch_dout),
          .M_VALID                   (M_AXI_WVALID),
          .M_READY                   (M_AXI_WREADY)
          );
  end endgenerate // gwdch_reg_slice
  generate if (IS_WR_RESP_CH == 1) begin : axi_write_resp_channel
    // Write protection when almost full or prog_full is high
    assign wrch_we    = (C_PROG_FULL_TYPE_WRCH != 0) ? wrch_m_axi_bready & M_AXI_BVALID : M_AXI_BVALID;
    // Read protection when almost empty or prog_empty is high
    assign wrch_re    = (C_PROG_EMPTY_TYPE_WRCH != 0) ? wrch_s_axi_bvalid & S_AXI_BREADY : S_AXI_BREADY;
    assign wrch_wr_en = (C_HAS_MASTER_CE == 1)  ? wrch_we & M_ACLK_EN : wrch_we;
    assign wrch_rd_en = (C_HAS_SLAVE_CE == 1) ? wrch_re & S_ACLK_EN : wrch_re;
    fifo_generator_v13_1_3_CONV_VER
      #(
        .C_FAMILY			(C_FAMILY),
        .C_COMMON_CLOCK                 (C_COMMON_CLOCK),
        .C_MEMORY_TYPE			((C_IMPLEMENTATION_TYPE_WRCH == 1  || C_IMPLEMENTATION_TYPE_WRCH == 11) ? 1 :
                                         (C_IMPLEMENTATION_TYPE_WRCH == 2  || C_IMPLEMENTATION_TYPE_WRCH == 12) ? 2 : 4),
        .C_IMPLEMENTATION_TYPE		((C_IMPLEMENTATION_TYPE_WRCH == 1  || C_IMPLEMENTATION_TYPE_WRCH == 2) ? 0 :
                                         (C_IMPLEMENTATION_TYPE_WRCH == 11 || C_IMPLEMENTATION_TYPE_WRCH == 12) ? 2 : 6),
        .C_PRELOAD_REGS			(1), // always FWFT for AXI
        .C_PRELOAD_LATENCY		(0), // always FWFT for AXI
        .C_DIN_WIDTH			(C_DIN_WIDTH_WRCH),
        .C_WR_DEPTH			(C_WR_DEPTH_WRCH),
        .C_WR_PNTR_WIDTH		(C_WR_PNTR_WIDTH_WRCH),
        .C_DOUT_WIDTH			(C_DIN_WIDTH_WRCH),
        .C_INTERFACE_TYPE 		(C_INTERFACE_TYPE),
        .C_RD_DEPTH			(C_WR_DEPTH_WRCH),
        .C_RD_PNTR_WIDTH		(C_WR_PNTR_WIDTH_WRCH),
        .C_PROG_FULL_TYPE		(C_PROG_FULL_TYPE_WRCH),
        .C_PROG_FULL_THRESH_ASSERT_VAL	(C_PROG_FULL_THRESH_ASSERT_VAL_WRCH),
        .C_PROG_EMPTY_TYPE		(C_PROG_EMPTY_TYPE_WRCH),
        .C_PROG_EMPTY_THRESH_ASSERT_VAL	(C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH),
        .C_USE_ECC                      (C_USE_ECC_WRCH),
        .C_ERROR_INJECTION_TYPE         (C_ERROR_INJECTION_TYPE_WRCH),
        .C_HAS_ALMOST_EMPTY		(0),
        .C_HAS_ALMOST_FULL		(0),
        .C_AXI_TYPE                     (C_INTERFACE_TYPE == 1 ? 0 : C_AXI_TYPE),
        .C_FIFO_TYPE                    (C_APPLICATION_TYPE_WRCH),
        .C_SYNCHRONIZER_STAGE           (C_SYNCHRONIZER_STAGE),
        .C_HAS_WR_RST			(0),
        .C_HAS_RD_RST			(0),
        .C_HAS_RST			(1),
        .C_HAS_SRST			(0),
        .C_DOUT_RST_VAL			(0),
        .C_HAS_VALID			(0),
        .C_VALID_LOW			(C_VALID_LOW),
        .C_HAS_UNDERFLOW		(C_HAS_UNDERFLOW),
        .C_UNDERFLOW_LOW		(C_UNDERFLOW_LOW),
        .C_HAS_WR_ACK			(0),
        .C_WR_ACK_LOW			(C_WR_ACK_LOW),
        .C_HAS_OVERFLOW			(C_HAS_OVERFLOW),
        .C_OVERFLOW_LOW			(C_OVERFLOW_LOW),
        .C_HAS_DATA_COUNT		((C_COMMON_CLOCK == 1 && C_HAS_DATA_COUNTS_WRCH == 1) ? 1 : 0),
        .C_DATA_COUNT_WIDTH		(C_WR_PNTR_WIDTH_WRCH + 1),
        .C_HAS_RD_DATA_COUNT		((C_COMMON_CLOCK == 0 && C_HAS_DATA_COUNTS_WRCH == 1) ? 1 : 0),
        .C_RD_DATA_COUNT_WIDTH		(C_WR_PNTR_WIDTH_WRCH + 1),
        .C_USE_FWFT_DATA_COUNT		(1), // use extra logic is always true
        .C_HAS_WR_DATA_COUNT		((C_COMMON_CLOCK == 0 && C_HAS_DATA_COUNTS_WRCH == 1) ? 1 : 0),
        .C_WR_DATA_COUNT_WIDTH		(C_WR_PNTR_WIDTH_WRCH + 1),
        .C_FULL_FLAGS_RST_VAL           (1),
        .C_USE_EMBEDDED_REG		(0),
        .C_USE_DOUT_RST                 (0),
        .C_MSGON_VAL                    (C_MSGON_VAL),
        .C_ENABLE_RST_SYNC              (1),
        .C_EN_SAFETY_CKT                ((C_IMPLEMENTATION_TYPE_WRCH == 1 || C_IMPLEMENTATION_TYPE_WRCH == 11) ? 1 : 0),
        .C_COUNT_TYPE			(C_COUNT_TYPE),
        .C_DEFAULT_VALUE		(C_DEFAULT_VALUE),
        .C_ENABLE_RLOCS			(C_ENABLE_RLOCS),
        .C_HAS_BACKUP			(C_HAS_BACKUP),
        .C_HAS_INT_CLK                  (C_HAS_INT_CLK),
        .C_MIF_FILE_NAME		(C_MIF_FILE_NAME),
        .C_HAS_MEMINIT_FILE		(C_HAS_MEMINIT_FILE),
        .C_INIT_WR_PNTR_VAL		(C_INIT_WR_PNTR_VAL),
        .C_OPTIMIZATION_MODE		(C_OPTIMIZATION_MODE),
        .C_PRIM_FIFO_TYPE		(C_PRIM_FIFO_TYPE),
        .C_RD_FREQ			(C_RD_FREQ),
        .C_USE_FIFO16_FLAGS		(C_USE_FIFO16_FLAGS),
        .C_WR_FREQ			(C_WR_FREQ),
        .C_WR_RESPONSE_LATENCY		(C_WR_RESPONSE_LATENCY)
      )
    fifo_generator_v13_1_3_wrch_dut
      (
        .CLK                      (S_ACLK),
        .WR_CLK                   (M_ACLK),
        .RD_CLK                   (S_ACLK),
        .RST                      (inverted_reset),
        .SRST                     (1'b0),
        .WR_RST                   (inverted_reset),
        .RD_RST                   (inverted_reset),
        .WR_EN                    (wrch_wr_en),
        .RD_EN                    (wrch_rd_en),
        .PROG_FULL_THRESH         (AXI_B_PROG_FULL_THRESH),
        .PROG_FULL_THRESH_ASSERT  ({C_WR_PNTR_WIDTH_WRCH{1'b0}}),
        .PROG_FULL_THRESH_NEGATE  ({C_WR_PNTR_WIDTH_WRCH{1'b0}}),
        .PROG_EMPTY_THRESH        (AXI_B_PROG_EMPTY_THRESH),
        .PROG_EMPTY_THRESH_ASSERT ({C_WR_PNTR_WIDTH_WRCH{1'b0}}),
        .PROG_EMPTY_THRESH_NEGATE ({C_WR_PNTR_WIDTH_WRCH{1'b0}}),
        .INJECTDBITERR            (AXI_B_INJECTDBITERR),
        .INJECTSBITERR            (AXI_B_INJECTSBITERR),
        .DIN                      (wrch_din),
        .DOUT                     (wrch_dout),
        .FULL                     (wrch_full),
        .EMPTY                    (wrch_empty),
        .ALMOST_FULL              (),
        .ALMOST_EMPTY             (),
        .PROG_FULL                (AXI_B_PROG_FULL),
        .PROG_EMPTY               (AXI_B_PROG_EMPTY),
        .WR_ACK                   (),
        .OVERFLOW                 (axi_b_overflow_i),
        .VALID                    (),
        .UNDERFLOW                (axi_b_underflow_i),
        .DATA_COUNT               (AXI_B_DATA_COUNT),
        .RD_DATA_COUNT            (AXI_B_RD_DATA_COUNT),
        .WR_DATA_COUNT            (AXI_B_WR_DATA_COUNT),
        .SBITERR                  (AXI_B_SBITERR),
        .DBITERR                  (AXI_B_DBITERR),
        .wr_rst_busy              (wr_rst_busy_wrch),
        .rd_rst_busy              (rd_rst_busy_wrch),
        .wr_rst_i_out             (),
        .rd_rst_i_out             (),
        .BACKUP                   (BACKUP),
        .BACKUP_MARKER            (BACKUP_MARKER),
        .INT_CLK                  (INT_CLK)
       );
    assign wrch_s_axi_bvalid = ~wrch_empty;
    assign wrch_m_axi_bready     = (IS_8SERIES == 0) ? ~wrch_full : (C_IMPLEMENTATION_TYPE_WRCH == 5 || C_IMPLEMENTATION_TYPE_WRCH == 13) ? ~(wrch_full | wr_rst_busy_wrch) : ~wrch_full;
    assign S_AXI_BVALID      = wrch_s_axi_bvalid;
    assign M_AXI_BREADY      = wrch_m_axi_bready;
    assign AXI_B_UNDERFLOW   = C_USE_COMMON_UNDERFLOW == 0 ? axi_b_underflow_i  : 0;
    assign AXI_B_OVERFLOW    = C_USE_COMMON_OVERFLOW  == 0 ? axi_b_overflow_i   : 0;
  end endgenerate // axi_write_resp_channel
  // Register Slice for Write Response Channel
  generate if (C_WRCH_TYPE == 1) begin : gwrch_reg_slice
    fifo_generator_v13_1_3_axic_reg_slice
          #(
            .C_FAMILY                (C_FAMILY),
            .C_DATA_WIDTH            (C_DIN_WIDTH_WRCH),
            .C_REG_CONFIG            (C_REG_SLICE_MODE_WRCH)
            )
    wrch_reg_slice_inst
        (
          // System Signals
          .ACLK                      (S_ACLK),
          .ARESET                    (axi_rs_rst),
          // Slave side
          .S_PAYLOAD_DATA            (wrch_din),
          .S_VALID                   (M_AXI_BVALID),
          .S_READY                   (M_AXI_BREADY),
          // Master side
          .M_PAYLOAD_DATA            (wrch_dout),
          .M_VALID                   (S_AXI_BVALID),
          .M_READY                   (S_AXI_BREADY)
          );
  end endgenerate // gwrch_reg_slice
    assign axi_wr_underflow_i = C_USE_COMMON_UNDERFLOW  == 1 ? (axi_aw_underflow_i || axi_w_underflow_i || axi_b_underflow_i) : 0;
    assign axi_wr_overflow_i  = C_USE_COMMON_OVERFLOW   == 1 ? (axi_aw_overflow_i  || axi_w_overflow_i  || axi_b_overflow_i)  : 0;
  generate if (IS_AXI_FULL_WACH == 1 || (IS_AXI_FULL == 1 && C_WACH_TYPE == 1)) begin : axi_wach_output
    assign M_AXI_AWADDR    = wach_dout[AWID_OFFSET-1:AWADDR_OFFSET];
    assign M_AXI_AWLEN     = wach_dout[AWADDR_OFFSET-1:AWLEN_OFFSET];
    assign M_AXI_AWSIZE    = wach_dout[AWLEN_OFFSET-1:AWSIZE_OFFSET];
    assign M_AXI_AWBURST   = wach_dout[AWSIZE_OFFSET-1:AWBURST_OFFSET];
    assign M_AXI_AWLOCK    = wach_dout[AWBURST_OFFSET-1:AWLOCK_OFFSET];
    assign M_AXI_AWCACHE   = wach_dout[AWLOCK_OFFSET-1:AWCACHE_OFFSET];
    assign M_AXI_AWPROT    = wach_dout[AWCACHE_OFFSET-1:AWPROT_OFFSET];
    assign M_AXI_AWQOS     = wach_dout[AWPROT_OFFSET-1:AWQOS_OFFSET];
    assign wach_din[AWID_OFFSET-1:AWADDR_OFFSET]    = S_AXI_AWADDR;
    assign wach_din[AWADDR_OFFSET-1:AWLEN_OFFSET]   = S_AXI_AWLEN;
    assign wach_din[AWLEN_OFFSET-1:AWSIZE_OFFSET]   = S_AXI_AWSIZE;
    assign wach_din[AWSIZE_OFFSET-1:AWBURST_OFFSET] = S_AXI_AWBURST;
    assign wach_din[AWBURST_OFFSET-1:AWLOCK_OFFSET] = S_AXI_AWLOCK;
    assign wach_din[AWLOCK_OFFSET-1:AWCACHE_OFFSET] = S_AXI_AWCACHE;
    assign wach_din[AWCACHE_OFFSET-1:AWPROT_OFFSET] = S_AXI_AWPROT;
    assign wach_din[AWPROT_OFFSET-1:AWQOS_OFFSET]   = S_AXI_AWQOS;
  end endgenerate // axi_wach_output
  generate if ((IS_AXI_FULL_WACH == 1 || (IS_AXI_FULL == 1 && C_WACH_TYPE == 1)) && C_AXI_TYPE == 1) begin : axi_awregion
    assign M_AXI_AWREGION  = wach_dout[AWQOS_OFFSET-1:AWREGION_OFFSET];
  end endgenerate // axi_awregion
  generate if ((IS_AXI_FULL_WACH == 1 || (IS_AXI_FULL == 1 && C_WACH_TYPE == 1)) && C_AXI_TYPE != 1) begin : naxi_awregion
    assign M_AXI_AWREGION  = 0;
  end endgenerate // naxi_awregion
  generate if ((IS_AXI_FULL_WACH == 1 || (IS_AXI_FULL == 1 && C_WACH_TYPE == 1)) && C_HAS_AXI_AWUSER == 1) begin : axi_awuser
    assign M_AXI_AWUSER  = wach_dout[AWREGION_OFFSET-1:AWUSER_OFFSET];
  end endgenerate // axi_awuser
  generate if ((IS_AXI_FULL_WACH == 1 || (IS_AXI_FULL == 1 && C_WACH_TYPE == 1)) && C_HAS_AXI_AWUSER == 0) begin : naxi_awuser
    assign M_AXI_AWUSER  = 0;
  end endgenerate // naxi_awuser
  generate if ((IS_AXI_FULL_WACH == 1 || (IS_AXI_FULL == 1 && C_WACH_TYPE == 1)) && C_HAS_AXI_ID == 1) begin : axi_awid
    assign M_AXI_AWID      = wach_dout[C_DIN_WIDTH_WACH-1:AWID_OFFSET];
  end endgenerate //axi_awid
  generate if ((IS_AXI_FULL_WACH == 1 || (IS_AXI_FULL == 1 && C_WACH_TYPE == 1)) && C_HAS_AXI_ID == 0) begin : naxi_awid
    assign M_AXI_AWID      = 0;
  end endgenerate //naxi_awid
  generate if (IS_AXI_FULL_WDCH == 1 || (IS_AXI_FULL == 1 && C_WDCH_TYPE == 1)) begin : axi_wdch_output
    assign M_AXI_WDATA     = wdch_dout[WID_OFFSET-1:WDATA_OFFSET];
    assign M_AXI_WSTRB     = wdch_dout[WDATA_OFFSET-1:WSTRB_OFFSET];
    assign M_AXI_WLAST     = wdch_dout[0];
    assign wdch_din[WID_OFFSET-1:WDATA_OFFSET]   = S_AXI_WDATA;
    assign wdch_din[WDATA_OFFSET-1:WSTRB_OFFSET] = S_AXI_WSTRB;
    assign wdch_din[0]   = S_AXI_WLAST;
  end endgenerate // axi_wdch_output
  generate if ((IS_AXI_FULL_WDCH == 1 || (IS_AXI_FULL == 1 && C_WDCH_TYPE == 1)) && C_HAS_AXI_ID == 1 && C_AXI_TYPE == 3) begin
    assign M_AXI_WID       = wdch_dout[C_DIN_WIDTH_WDCH-1:WID_OFFSET];
  end endgenerate
  generate if ((IS_AXI_FULL_WDCH == 1 || (IS_AXI_FULL == 1 && C_WDCH_TYPE == 1)) && (C_HAS_AXI_ID == 0 || C_AXI_TYPE != 3)) begin
    assign M_AXI_WID       = 0;
  end endgenerate
  generate if ((IS_AXI_FULL_WDCH == 1 || (IS_AXI_FULL == 1 && C_WDCH_TYPE == 1)) && C_HAS_AXI_WUSER == 1 ) begin
    assign M_AXI_WUSER     = wdch_dout[WSTRB_OFFSET-1:WUSER_OFFSET];
  end endgenerate
  generate if (C_HAS_AXI_WUSER == 0) begin
    assign M_AXI_WUSER       = 0;
  end endgenerate
  generate if (IS_AXI_FULL_WRCH == 1 || (IS_AXI_FULL == 1 && C_WRCH_TYPE == 1)) begin : axi_wrch_output
    assign S_AXI_BRESP = wrch_dout[BID_OFFSET-1:BRESP_OFFSET];
    assign wrch_din[BID_OFFSET-1:BRESP_OFFSET]   = M_AXI_BRESP;
  end endgenerate // axi_wrch_output
  generate if ((IS_AXI_FULL_WRCH == 1 || (IS_AXI_FULL == 1 && C_WRCH_TYPE == 1)) && C_HAS_AXI_BUSER == 1) begin : axi_buser
    assign S_AXI_BUSER = wrch_dout[BRESP_OFFSET-1:BUSER_OFFSET];
  end endgenerate // axi_buser
  generate if ((IS_AXI_FULL_WRCH == 1 || (IS_AXI_FULL == 1 && C_WRCH_TYPE == 1)) && C_HAS_AXI_BUSER == 0) begin : naxi_buser
    assign S_AXI_BUSER = 0;
  end endgenerate // naxi_buser
  generate if ((IS_AXI_FULL_WRCH == 1 || (IS_AXI_FULL == 1 && C_WRCH_TYPE == 1)) && C_HAS_AXI_ID == 1) begin : axi_bid
    assign S_AXI_BID   =  wrch_dout[C_DIN_WIDTH_WRCH-1:BID_OFFSET];
  end endgenerate // axi_bid
  generate if ((IS_AXI_FULL_WRCH == 1 || (IS_AXI_FULL == 1 && C_WRCH_TYPE == 1)) && C_HAS_AXI_ID == 0) begin : naxi_bid
    assign S_AXI_BID   =  0 ;
  end endgenerate // naxi_bid
  generate if (IS_AXI_LITE_WACH == 1 || (IS_AXI_LITE == 1 && C_WACH_TYPE == 1)) begin : axi_wach_output1
    assign wach_din        = {S_AXI_AWADDR, S_AXI_AWPROT};
    assign M_AXI_AWADDR    = wach_dout[C_DIN_WIDTH_WACH-1:AWADDR_OFFSET];
    assign M_AXI_AWPROT    = wach_dout[AWADDR_OFFSET-1:AWPROT_OFFSET];
  end endgenerate // axi_wach_output1
  generate if (IS_AXI_LITE_WDCH == 1 || (IS_AXI_LITE == 1 && C_WDCH_TYPE == 1)) begin : axi_wdch_output1
    assign wdch_din        = {S_AXI_WDATA, S_AXI_WSTRB};
    assign M_AXI_WDATA     = wdch_dout[C_DIN_WIDTH_WDCH-1:WDATA_OFFSET];
    assign M_AXI_WSTRB     = wdch_dout[WDATA_OFFSET-1:WSTRB_OFFSET];
  end endgenerate // axi_wdch_output1
  generate if (IS_AXI_LITE_WRCH == 1 || (IS_AXI_LITE == 1 && C_WRCH_TYPE == 1)) begin : axi_wrch_output1
    assign wrch_din        = M_AXI_BRESP;
    assign S_AXI_BRESP     = wrch_dout[C_DIN_WIDTH_WRCH-1:BRESP_OFFSET];
  end endgenerate // axi_wrch_output1
  generate if ((IS_AXI_FULL_WACH == 1 || (IS_AXI_FULL == 1 && C_WACH_TYPE == 1)) && C_HAS_AXI_AWUSER == 1) begin : gwach_din1
    assign wach_din[AWREGION_OFFSET-1:AWUSER_OFFSET]     = S_AXI_AWUSER;
  end endgenerate // gwach_din1
  generate if ((IS_AXI_FULL_WACH == 1 || (IS_AXI_FULL == 1 && C_WACH_TYPE == 1)) && C_HAS_AXI_ID == 1) begin : gwach_din2
    assign wach_din[C_DIN_WIDTH_WACH-1:AWID_OFFSET]     = S_AXI_AWID;
  end endgenerate // gwach_din2
  generate if ((IS_AXI_FULL_WACH == 1 || (IS_AXI_FULL == 1 && C_WACH_TYPE == 1)) && C_AXI_TYPE == 1) begin : gwach_din3
    assign wach_din[AWQOS_OFFSET-1:AWREGION_OFFSET]     = S_AXI_AWREGION;
  end endgenerate // gwach_din3
  generate if ((IS_AXI_FULL_WDCH == 1 || (IS_AXI_FULL == 1 && C_WDCH_TYPE == 1)) && C_HAS_AXI_WUSER == 1) begin : gwdch_din1
    assign wdch_din[WSTRB_OFFSET-1:WUSER_OFFSET] = S_AXI_WUSER;
  end endgenerate // gwdch_din1
  generate if ((IS_AXI_FULL_WDCH == 1 || (IS_AXI_FULL == 1 && C_WDCH_TYPE == 1)) && C_HAS_AXI_ID == 1 && C_AXI_TYPE == 3) begin : gwdch_din2
    assign wdch_din[C_DIN_WIDTH_WDCH-1:WID_OFFSET] = S_AXI_WID;
  end endgenerate // gwdch_din2
  generate if ((IS_AXI_FULL_WRCH == 1 || (IS_AXI_FULL == 1 && C_WRCH_TYPE == 1)) && C_HAS_AXI_BUSER == 1) begin : gwrch_din1
    assign wrch_din[BRESP_OFFSET-1:BUSER_OFFSET]    = M_AXI_BUSER;
  end endgenerate // gwrch_din1
  generate if ((IS_AXI_FULL_WRCH == 1 || (IS_AXI_FULL == 1 && C_WRCH_TYPE == 1)) && C_HAS_AXI_ID == 1) begin : gwrch_din2
    assign wrch_din[C_DIN_WIDTH_WRCH-1:BID_OFFSET]    = M_AXI_BID;
  end endgenerate // gwrch_din2
  //end of  axi_write_channel
  //###########################################################################
  //  AXI FULL Read Channel (axi_read_channel)
  //###########################################################################
  wire [C_DIN_WIDTH_RACH-1:0]        rach_din            ;
  wire [C_DIN_WIDTH_RACH-1:0]        rach_dout           ;
  wire [C_DIN_WIDTH_RACH-1:0]        rach_dout_pkt       ;
  wire                               rach_full           ;
  wire                               rach_almost_full    ;
  wire                               rach_prog_full      ;
  wire                               rach_empty          ;
  wire                               rach_almost_empty   ;
  wire                               rach_prog_empty     ;
  wire [C_DIN_WIDTH_RDCH-1:0]        rdch_din            ;
  wire [C_DIN_WIDTH_RDCH-1:0]        rdch_dout           ;
  wire                               rdch_full           ;
  wire                               rdch_almost_full    ;
  wire                               rdch_prog_full      ;
  wire                               rdch_empty          ;
  wire                               rdch_almost_empty   ;
  wire                               rdch_prog_empty     ;
  wire                               axi_ar_underflow_i  ;
  wire                               axi_r_underflow_i   ;
  wire                               axi_ar_overflow_i   ;
  wire                               axi_r_overflow_i    ;
  wire                               axi_rd_underflow_i  ;
  wire                               axi_rd_overflow_i   ;
  wire                               rach_s_axi_arready  ;
  wire                               rach_m_axi_arvalid  ;
  wire                               rach_wr_en          ;
  wire                               rach_rd_en          ;
  wire                               rdch_m_axi_rready   ;
  wire                               rdch_s_axi_rvalid   ;
  wire                               rdch_wr_en          ;
  wire                               rdch_rd_en          ;
  wire                               arvalid_pkt         ;
  wire                               arready_pkt         ;
  wire                               arvalid_en          ;
  wire                               rdch_rd_ok          ;
  wire                               accept_next_pkt     ;
  integer                            rdch_free_space     ;
  integer                            rdch_commited_space ;
  wire                               rach_we             ;
  wire                               rach_re             ;
  wire                               rdch_we             ;
  wire                               rdch_re             ;
  localparam ARID_OFFSET       = (C_AXI_TYPE != 2 && C_HAS_AXI_ID == 1) ? C_DIN_WIDTH_RACH - C_AXI_ID_WIDTH : C_DIN_WIDTH_RACH;
  localparam ARADDR_OFFSET     = ARID_OFFSET - C_AXI_ADDR_WIDTH;
  localparam ARLEN_OFFSET      = C_AXI_TYPE != 2 ? ARADDR_OFFSET - C_AXI_LEN_WIDTH : ARADDR_OFFSET;
  localparam ARSIZE_OFFSET     = C_AXI_TYPE != 2 ? ARLEN_OFFSET - C_AXI_SIZE_WIDTH : ARLEN_OFFSET;
  localparam ARBURST_OFFSET    = C_AXI_TYPE != 2 ? ARSIZE_OFFSET - C_AXI_BURST_WIDTH : ARSIZE_OFFSET;
  localparam ARLOCK_OFFSET     = C_AXI_TYPE != 2 ? ARBURST_OFFSET - C_AXI_LOCK_WIDTH : ARBURST_OFFSET;
  localparam ARCACHE_OFFSET    = C_AXI_TYPE != 2 ? ARLOCK_OFFSET - C_AXI_CACHE_WIDTH : ARLOCK_OFFSET;
  localparam ARPROT_OFFSET     = ARCACHE_OFFSET - C_AXI_PROT_WIDTH;
  localparam ARQOS_OFFSET      = ARPROT_OFFSET - C_AXI_QOS_WIDTH;
  localparam ARREGION_OFFSET   = C_AXI_TYPE == 1 ? ARQOS_OFFSET - C_AXI_REGION_WIDTH : ARQOS_OFFSET;
  localparam ARUSER_OFFSET     = C_HAS_AXI_ARUSER == 1 ? ARREGION_OFFSET-C_AXI_ARUSER_WIDTH : ARREGION_OFFSET;
  localparam RID_OFFSET        = (C_AXI_TYPE != 2 && C_HAS_AXI_ID == 1) ? C_DIN_WIDTH_RDCH - C_AXI_ID_WIDTH : C_DIN_WIDTH_RDCH;
  localparam RDATA_OFFSET      = RID_OFFSET - C_AXI_DATA_WIDTH;
  localparam RRESP_OFFSET      = RDATA_OFFSET - C_AXI_RRESP_WIDTH;
  localparam RUSER_OFFSET      = C_HAS_AXI_RUSER == 1 ? RRESP_OFFSET-C_AXI_RUSER_WIDTH : RRESP_OFFSET;
  generate if (IS_RD_ADDR_CH == 1) begin : axi_read_addr_channel
    // Write protection when almost full or prog_full is high
    assign rach_we    = (C_PROG_FULL_TYPE_RACH != 0) ? rach_s_axi_arready & S_AXI_ARVALID : S_AXI_ARVALID;
    // Read protection when almost empty or prog_empty is high
//    assign rach_rd_en = (C_PROG_EMPTY_TYPE_RACH != 5) ? rach_m_axi_arvalid & M_AXI_ARREADY : M_AXI_ARREADY && arvalid_en;
    assign rach_re    = (C_PROG_EMPTY_TYPE_RACH != 0 && C_APPLICATION_TYPE_RACH == 1) ?
                        rach_m_axi_arvalid & arready_pkt & arvalid_en :
                        (C_PROG_EMPTY_TYPE_RACH != 0 && C_APPLICATION_TYPE_RACH != 1) ?
                        M_AXI_ARREADY && rach_m_axi_arvalid :
                        (C_PROG_EMPTY_TYPE_RACH == 0 && C_APPLICATION_TYPE_RACH == 1) ?
                        arready_pkt & arvalid_en :
                        (C_PROG_EMPTY_TYPE_RACH == 0 && C_APPLICATION_TYPE_RACH != 1) ?
                        M_AXI_ARREADY : 1'b0;
    assign rach_wr_en = (C_HAS_SLAVE_CE == 1)  ? rach_we & S_ACLK_EN : rach_we;
    assign rach_rd_en = (C_HAS_MASTER_CE == 1) ? rach_re & M_ACLK_EN : rach_re;
    fifo_generator_v13_1_3_CONV_VER
      #(
        .C_FAMILY			(C_FAMILY),
        .C_COMMON_CLOCK                 (C_COMMON_CLOCK),
        .C_MEMORY_TYPE			((C_IMPLEMENTATION_TYPE_RACH == 1  || C_IMPLEMENTATION_TYPE_RACH == 11) ? 1 :
                                         (C_IMPLEMENTATION_TYPE_RACH == 2  || C_IMPLEMENTATION_TYPE_RACH == 12) ? 2 : 4),
        .C_IMPLEMENTATION_TYPE		((C_IMPLEMENTATION_TYPE_RACH == 1  || C_IMPLEMENTATION_TYPE_RACH == 2) ? 0 :
                                         (C_IMPLEMENTATION_TYPE_RACH == 11 || C_IMPLEMENTATION_TYPE_RACH == 12) ? 2 : 6),
        .C_PRELOAD_REGS			(1), // always FWFT for AXI
        .C_PRELOAD_LATENCY		(0), // always FWFT for AXI
        .C_DIN_WIDTH			(C_DIN_WIDTH_RACH),
        .C_WR_DEPTH			(C_WR_DEPTH_RACH),
        .C_WR_PNTR_WIDTH		(C_WR_PNTR_WIDTH_RACH),
        .C_INTERFACE_TYPE 		(C_INTERFACE_TYPE),
        .C_DOUT_WIDTH			(C_DIN_WIDTH_RACH),
        .C_RD_DEPTH			(C_WR_DEPTH_RACH),
        .C_RD_PNTR_WIDTH		(C_WR_PNTR_WIDTH_RACH),
        .C_PROG_FULL_TYPE		(C_PROG_FULL_TYPE_RACH),
        .C_PROG_FULL_THRESH_ASSERT_VAL	(C_PROG_FULL_THRESH_ASSERT_VAL_RACH),
        .C_PROG_EMPTY_TYPE		(C_PROG_EMPTY_TYPE_RACH),
        .C_PROG_EMPTY_THRESH_ASSERT_VAL	(C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH),
        .C_USE_ECC                      (C_USE_ECC_RACH),
        .C_ERROR_INJECTION_TYPE         (C_ERROR_INJECTION_TYPE_RACH),
        .C_HAS_ALMOST_EMPTY		(0),
        .C_HAS_ALMOST_FULL		(0),
        .C_AXI_TYPE                     (C_INTERFACE_TYPE == 1 ? 0 : C_AXI_TYPE),
        .C_FIFO_TYPE                    ((C_APPLICATION_TYPE_RACH == 1)?0:C_APPLICATION_TYPE_RACH),
        .C_SYNCHRONIZER_STAGE           (C_SYNCHRONIZER_STAGE),
        .C_HAS_WR_RST			(0),
        .C_HAS_RD_RST			(0),
        .C_HAS_RST			(1),
        .C_HAS_SRST			(0),
        .C_DOUT_RST_VAL			(0),
        .C_HAS_VALID			(0),
        .C_VALID_LOW			(C_VALID_LOW),
        .C_HAS_UNDERFLOW		(C_HAS_UNDERFLOW),
        .C_UNDERFLOW_LOW		(C_UNDERFLOW_LOW),
        .C_HAS_WR_ACK			(0),
        .C_WR_ACK_LOW			(C_WR_ACK_LOW),
        .C_HAS_OVERFLOW			(C_HAS_OVERFLOW),
        .C_OVERFLOW_LOW			(C_OVERFLOW_LOW),
        .C_HAS_DATA_COUNT		((C_COMMON_CLOCK == 1 && C_HAS_DATA_COUNTS_RACH == 1) ? 1 : 0),
        .C_DATA_COUNT_WIDTH		(C_WR_PNTR_WIDTH_RACH + 1),
        .C_HAS_RD_DATA_COUNT		((C_COMMON_CLOCK == 0 && C_HAS_DATA_COUNTS_RACH == 1) ? 1 : 0),
        .C_RD_DATA_COUNT_WIDTH		(C_WR_PNTR_WIDTH_RACH + 1),
        .C_USE_FWFT_DATA_COUNT		(1), // use extra logic is always true
        .C_HAS_WR_DATA_COUNT		((C_COMMON_CLOCK == 0 && C_HAS_DATA_COUNTS_RACH == 1) ? 1 : 0),
        .C_WR_DATA_COUNT_WIDTH		(C_WR_PNTR_WIDTH_RACH + 1),
        .C_FULL_FLAGS_RST_VAL           (1),
        .C_USE_EMBEDDED_REG		(0),
        .C_USE_DOUT_RST                 (0),
        .C_MSGON_VAL                    (C_MSGON_VAL),
        .C_ENABLE_RST_SYNC              (1),
        .C_EN_SAFETY_CKT                ((C_IMPLEMENTATION_TYPE_RACH == 1 || C_IMPLEMENTATION_TYPE_RACH == 11) ? 1 : 0),
        .C_COUNT_TYPE			(C_COUNT_TYPE),
        .C_DEFAULT_VALUE		(C_DEFAULT_VALUE),
        .C_ENABLE_RLOCS			(C_ENABLE_RLOCS),
        .C_HAS_BACKUP			(C_HAS_BACKUP),
        .C_HAS_INT_CLK                  (C_HAS_INT_CLK),
        .C_MIF_FILE_NAME		(C_MIF_FILE_NAME),
        .C_HAS_MEMINIT_FILE		(C_HAS_MEMINIT_FILE),
        .C_INIT_WR_PNTR_VAL		(C_INIT_WR_PNTR_VAL),
        .C_OPTIMIZATION_MODE		(C_OPTIMIZATION_MODE),
        .C_PRIM_FIFO_TYPE		(C_PRIM_FIFO_TYPE),
        .C_RD_FREQ			(C_RD_FREQ),
        .C_USE_FIFO16_FLAGS		(C_USE_FIFO16_FLAGS),
        .C_WR_FREQ			(C_WR_FREQ),
        .C_WR_RESPONSE_LATENCY		(C_WR_RESPONSE_LATENCY)
      )
    fifo_generator_v13_1_3_rach_dut
      (
        .CLK                      (S_ACLK),
        .WR_CLK                   (S_ACLK),
        .RD_CLK                   (M_ACLK),
        .RST                      (inverted_reset),
        .SRST                     (1'b0),
        .WR_RST                   (inverted_reset),
        .RD_RST                   (inverted_reset),
        .WR_EN                    (rach_wr_en),
        .RD_EN                    (rach_rd_en),
        .PROG_FULL_THRESH         (AXI_AR_PROG_FULL_THRESH),
        .PROG_FULL_THRESH_ASSERT  ({C_WR_PNTR_WIDTH_RACH{1'b0}}),
        .PROG_FULL_THRESH_NEGATE  ({C_WR_PNTR_WIDTH_RACH{1'b0}}),
        .PROG_EMPTY_THRESH        (AXI_AR_PROG_EMPTY_THRESH),
        .PROG_EMPTY_THRESH_ASSERT ({C_WR_PNTR_WIDTH_RACH{1'b0}}),
        .PROG_EMPTY_THRESH_NEGATE ({C_WR_PNTR_WIDTH_RACH{1'b0}}),
        .INJECTDBITERR            (AXI_AR_INJECTDBITERR),
        .INJECTSBITERR            (AXI_AR_INJECTSBITERR),
        .DIN                      (rach_din),
        .DOUT                     (rach_dout_pkt),
        .FULL                     (rach_full),
        .EMPTY                    (rach_empty),
        .ALMOST_FULL              (),
        .ALMOST_EMPTY             (),
        .PROG_FULL                (AXI_AR_PROG_FULL),
        .PROG_EMPTY               (AXI_AR_PROG_EMPTY),
        .WR_ACK                   (),
        .OVERFLOW                 (axi_ar_overflow_i),
        .VALID                    (),
        .UNDERFLOW                (axi_ar_underflow_i),
        .DATA_COUNT               (AXI_AR_DATA_COUNT),
        .RD_DATA_COUNT            (AXI_AR_RD_DATA_COUNT),
        .WR_DATA_COUNT            (AXI_AR_WR_DATA_COUNT),
        .SBITERR                  (AXI_AR_SBITERR),
        .DBITERR                  (AXI_AR_DBITERR),
        .wr_rst_busy              (wr_rst_busy_rach),
        .rd_rst_busy              (rd_rst_busy_rach),
        .wr_rst_i_out             (),
        .rd_rst_i_out             (),
        .BACKUP                   (BACKUP),
        .BACKUP_MARKER            (BACKUP_MARKER),
        .INT_CLK                  (INT_CLK)
       );
    assign rach_s_axi_arready    = (IS_8SERIES == 0) ? ~rach_full : (C_IMPLEMENTATION_TYPE_RACH == 5 || C_IMPLEMENTATION_TYPE_RACH == 13) ? ~(rach_full | wr_rst_busy_rach) : ~rach_full;
    assign rach_m_axi_arvalid = ~rach_empty;
    assign S_AXI_ARREADY      = rach_s_axi_arready;
    assign AXI_AR_UNDERFLOW  = C_USE_COMMON_UNDERFLOW == 0 ? axi_ar_underflow_i : 0;
    assign AXI_AR_OVERFLOW   = C_USE_COMMON_OVERFLOW  == 0 ? axi_ar_overflow_i  : 0;
  end endgenerate // axi_read_addr_channel
  // Register Slice for Read Address Channel
  generate if (C_RACH_TYPE == 1) begin : grach_reg_slice
    fifo_generator_v13_1_3_axic_reg_slice
          #(
            .C_FAMILY                (C_FAMILY),
            .C_DATA_WIDTH            (C_DIN_WIDTH_RACH),
            .C_REG_CONFIG            (C_REG_SLICE_MODE_RACH)
            )
    rach_reg_slice_inst
        (
          // System Signals
          .ACLK                      (S_ACLK),
          .ARESET                    (axi_rs_rst),
          // Slave side
          .S_PAYLOAD_DATA            (rach_din),
          .S_VALID                   (S_AXI_ARVALID),
          .S_READY                   (S_AXI_ARREADY),
          // Master side
          .M_PAYLOAD_DATA            (rach_dout),
          .M_VALID                   (M_AXI_ARVALID),
          .M_READY                   (M_AXI_ARREADY)
          );
  end endgenerate // grach_reg_slice
  // Register Slice for Read Address Channel for MM Packet FIFO
  generate if (C_RACH_TYPE == 0 && C_APPLICATION_TYPE_RACH == 1) begin : grach_reg_slice_mm_pkt_fifo
    fifo_generator_v13_1_3_axic_reg_slice
          #(
            .C_FAMILY                (C_FAMILY),
            .C_DATA_WIDTH            (C_DIN_WIDTH_RACH),
            .C_REG_CONFIG            (1)
            )
    reg_slice_mm_pkt_fifo_inst
        (
          // System Signals
          .ACLK                      (S_ACLK),
          .ARESET                    (inverted_reset),
          // Slave side
          .S_PAYLOAD_DATA            (rach_dout_pkt),
          .S_VALID                   (arvalid_pkt),
          .S_READY                   (arready_pkt),
          // Master side
          .M_PAYLOAD_DATA            (rach_dout),
          .M_VALID                   (M_AXI_ARVALID),
          .M_READY                   (M_AXI_ARREADY)
          );
  end endgenerate // grach_reg_slice_mm_pkt_fifo
  generate if (C_RACH_TYPE == 0 && C_APPLICATION_TYPE_RACH != 1) begin : grach_m_axi_arvalid
    assign M_AXI_ARVALID      = rach_m_axi_arvalid;
    assign rach_dout          = rach_dout_pkt;
  end endgenerate // grach_m_axi_arvalid
  generate if (C_APPLICATION_TYPE_RACH == 1 && C_HAS_AXI_RD_CHANNEL == 1) begin : axi_mm_pkt_fifo_rd
    assign rdch_rd_ok = rdch_s_axi_rvalid && rdch_rd_en;
    assign arvalid_pkt = rach_m_axi_arvalid && arvalid_en;
    assign accept_next_pkt  = rach_m_axi_arvalid && arready_pkt && arvalid_en;
    always@(posedge S_ACLK or posedge inverted_reset) begin
      if(inverted_reset) begin
	rdch_commited_space <= 0;
      end else begin
	if(rdch_rd_ok && !accept_next_pkt) begin
	  rdch_commited_space <= rdch_commited_space-1;
	end else if(!rdch_rd_ok && accept_next_pkt) begin
	  rdch_commited_space <= rdch_commited_space+(rach_dout_pkt[ARADDR_OFFSET-1:ARLEN_OFFSET]+1);
	end else if(rdch_rd_ok && accept_next_pkt) begin
	  rdch_commited_space <= rdch_commited_space+(rach_dout_pkt[ARADDR_OFFSET-1:ARLEN_OFFSET]);
	end
      end
    end //Always end
    always@(*) begin
      rdch_free_space <= (C_WR_DEPTH_RDCH-(rdch_commited_space+rach_dout_pkt[ARADDR_OFFSET-1:ARLEN_OFFSET]+1));
    end
    assign arvalid_en = (rdch_free_space >= 0)?1:0;
  end
  endgenerate
  generate if (C_APPLICATION_TYPE_RACH != 1) begin : axi_mm_fifo_rd
    assign arvalid_en = 1;
  end
  endgenerate
  generate if (IS_RD_DATA_CH == 1) begin : axi_read_data_channel
    // Write protection when almost full or prog_full is high
    assign rdch_we    = (C_PROG_FULL_TYPE_RDCH != 0) ? rdch_m_axi_rready  & M_AXI_RVALID : M_AXI_RVALID;
    // Read protection when almost empty or prog_empty is high
    assign rdch_re    = (C_PROG_EMPTY_TYPE_RDCH != 0) ? rdch_s_axi_rvalid  & S_AXI_RREADY : S_AXI_RREADY;
    assign rdch_wr_en = (C_HAS_MASTER_CE == 1)  ? rdch_we & M_ACLK_EN : rdch_we;
    assign rdch_rd_en = (C_HAS_SLAVE_CE == 1) ? rdch_re & S_ACLK_EN : rdch_re;
    fifo_generator_v13_1_3_CONV_VER
      #(
        .C_FAMILY			(C_FAMILY),
        .C_COMMON_CLOCK                 (C_COMMON_CLOCK),
        .C_MEMORY_TYPE			((C_IMPLEMENTATION_TYPE_RDCH == 1  || C_IMPLEMENTATION_TYPE_RDCH == 11) ? 1 :
                                         (C_IMPLEMENTATION_TYPE_RDCH == 2  || C_IMPLEMENTATION_TYPE_RDCH == 12) ? 2 : 4),
        .C_IMPLEMENTATION_TYPE		((C_IMPLEMENTATION_TYPE_RDCH == 1  || C_IMPLEMENTATION_TYPE_RDCH == 2) ? 0 :
                                         (C_IMPLEMENTATION_TYPE_RDCH == 11 || C_IMPLEMENTATION_TYPE_RDCH == 12) ? 2 : 6),
        .C_PRELOAD_REGS			(1), // always FWFT for AXI
        .C_PRELOAD_LATENCY		(0), // always FWFT for AXI
        .C_DIN_WIDTH			(C_DIN_WIDTH_RDCH),
        .C_WR_DEPTH			(C_WR_DEPTH_RDCH),
        .C_WR_PNTR_WIDTH		(C_WR_PNTR_WIDTH_RDCH),
        .C_DOUT_WIDTH			(C_DIN_WIDTH_RDCH),
        .C_RD_DEPTH			(C_WR_DEPTH_RDCH),
        .C_INTERFACE_TYPE 		(C_INTERFACE_TYPE),
        .C_RD_PNTR_WIDTH		(C_WR_PNTR_WIDTH_RDCH),
        .C_PROG_FULL_TYPE		(C_PROG_FULL_TYPE_RDCH),
        .C_PROG_FULL_THRESH_ASSERT_VAL	(C_PROG_FULL_THRESH_ASSERT_VAL_RDCH),
        .C_PROG_EMPTY_TYPE		(C_PROG_EMPTY_TYPE_RDCH),
        .C_PROG_EMPTY_THRESH_ASSERT_VAL	(C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH),
        .C_USE_ECC                      (C_USE_ECC_RDCH),
        .C_ERROR_INJECTION_TYPE         (C_ERROR_INJECTION_TYPE_RDCH),
        .C_HAS_ALMOST_EMPTY		(0),
        .C_HAS_ALMOST_FULL		(0),
        .C_AXI_TYPE                     (C_INTERFACE_TYPE == 1 ? 0 : C_AXI_TYPE),
        .C_FIFO_TYPE                    (C_APPLICATION_TYPE_RDCH),
        .C_SYNCHRONIZER_STAGE           (C_SYNCHRONIZER_STAGE),
        .C_HAS_WR_RST			(0),
        .C_HAS_RD_RST			(0),
        .C_HAS_RST			(1),
        .C_HAS_SRST			(0),
        .C_DOUT_RST_VAL			(0),
        .C_HAS_VALID			(0),
        .C_VALID_LOW			(C_VALID_LOW),
        .C_HAS_UNDERFLOW		(C_HAS_UNDERFLOW),
        .C_UNDERFLOW_LOW		(C_UNDERFLOW_LOW),
        .C_HAS_WR_ACK			(0),
        .C_WR_ACK_LOW			(C_WR_ACK_LOW),
        .C_HAS_OVERFLOW			(C_HAS_OVERFLOW),
        .C_OVERFLOW_LOW			(C_OVERFLOW_LOW),
        .C_HAS_DATA_COUNT		((C_COMMON_CLOCK == 1 && C_HAS_DATA_COUNTS_RDCH == 1) ? 1 : 0),
        .C_DATA_COUNT_WIDTH		(C_WR_PNTR_WIDTH_RDCH + 1),
        .C_HAS_RD_DATA_COUNT		((C_COMMON_CLOCK == 0 && C_HAS_DATA_COUNTS_RDCH == 1) ? 1 : 0),
        .C_RD_DATA_COUNT_WIDTH		(C_WR_PNTR_WIDTH_RDCH + 1),
        .C_USE_FWFT_DATA_COUNT		(1), // use extra logic is always true
        .C_HAS_WR_DATA_COUNT		((C_COMMON_CLOCK == 0 && C_HAS_DATA_COUNTS_RDCH == 1) ? 1 : 0),
        .C_WR_DATA_COUNT_WIDTH		(C_WR_PNTR_WIDTH_RDCH + 1),
        .C_FULL_FLAGS_RST_VAL           (1),
        .C_USE_EMBEDDED_REG		(0),
        .C_USE_DOUT_RST                 (0),
        .C_MSGON_VAL                    (C_MSGON_VAL),
        .C_ENABLE_RST_SYNC              (1),
        .C_EN_SAFETY_CKT                ((C_IMPLEMENTATION_TYPE_RDCH == 1 || C_IMPLEMENTATION_TYPE_RDCH == 11) ? 1 : 0),
        .C_COUNT_TYPE			(C_COUNT_TYPE),
        .C_DEFAULT_VALUE		(C_DEFAULT_VALUE),
        .C_ENABLE_RLOCS			(C_ENABLE_RLOCS),
        .C_HAS_BACKUP			(C_HAS_BACKUP),
        .C_HAS_INT_CLK                  (C_HAS_INT_CLK),
        .C_MIF_FILE_NAME		(C_MIF_FILE_NAME),
        .C_HAS_MEMINIT_FILE		(C_HAS_MEMINIT_FILE),
        .C_INIT_WR_PNTR_VAL		(C_INIT_WR_PNTR_VAL),
        .C_OPTIMIZATION_MODE		(C_OPTIMIZATION_MODE),
        .C_PRIM_FIFO_TYPE		(C_PRIM_FIFO_TYPE),
        .C_RD_FREQ			(C_RD_FREQ),
        .C_USE_FIFO16_FLAGS		(C_USE_FIFO16_FLAGS),
        .C_WR_FREQ			(C_WR_FREQ),
        .C_WR_RESPONSE_LATENCY		(C_WR_RESPONSE_LATENCY)
      )
    fifo_generator_v13_1_3_rdch_dut
      (
        .CLK                      (S_ACLK),
        .WR_CLK                   (M_ACLK),
        .RD_CLK                   (S_ACLK),
        .RST                      (inverted_reset),
        .SRST                     (1'b0),
        .WR_RST                   (inverted_reset),
        .RD_RST                   (inverted_reset),
        .WR_EN                    (rdch_wr_en),
        .RD_EN                    (rdch_rd_en),
        .PROG_FULL_THRESH         (AXI_R_PROG_FULL_THRESH),
        .PROG_FULL_THRESH_ASSERT  ({C_WR_PNTR_WIDTH_RDCH{1'b0}}),
        .PROG_FULL_THRESH_NEGATE  ({C_WR_PNTR_WIDTH_RDCH{1'b0}}),
        .PROG_EMPTY_THRESH        (AXI_R_PROG_EMPTY_THRESH),
        .PROG_EMPTY_THRESH_ASSERT ({C_WR_PNTR_WIDTH_RDCH{1'b0}}),
        .PROG_EMPTY_THRESH_NEGATE ({C_WR_PNTR_WIDTH_RDCH{1'b0}}),
        .INJECTDBITERR            (AXI_R_INJECTDBITERR),
        .INJECTSBITERR            (AXI_R_INJECTSBITERR),
        .DIN                      (rdch_din),
        .DOUT                     (rdch_dout),
        .FULL                     (rdch_full),
        .EMPTY                    (rdch_empty),
        .ALMOST_FULL              (),
        .ALMOST_EMPTY             (),
        .PROG_FULL                (AXI_R_PROG_FULL),
        .PROG_EMPTY               (AXI_R_PROG_EMPTY),
        .WR_ACK                   (),
        .OVERFLOW                 (axi_r_overflow_i),
        .VALID                    (),
        .UNDERFLOW                (axi_r_underflow_i),
        .DATA_COUNT               (AXI_R_DATA_COUNT),
        .RD_DATA_COUNT            (AXI_R_RD_DATA_COUNT),
        .WR_DATA_COUNT            (AXI_R_WR_DATA_COUNT),
        .SBITERR                  (AXI_R_SBITERR),
        .DBITERR                  (AXI_R_DBITERR),
        .wr_rst_busy              (wr_rst_busy_rdch),
        .rd_rst_busy              (rd_rst_busy_rdch),
        .wr_rst_i_out             (),
        .rd_rst_i_out             (),
        .BACKUP                   (BACKUP),
        .BACKUP_MARKER            (BACKUP_MARKER),
        .INT_CLK                  (INT_CLK)
       );
    assign rdch_s_axi_rvalid = ~rdch_empty;
    assign rdch_m_axi_rready     = (IS_8SERIES == 0) ? ~rdch_full : (C_IMPLEMENTATION_TYPE_RDCH == 5 || C_IMPLEMENTATION_TYPE_RDCH == 13) ? ~(rdch_full | wr_rst_busy_rdch) : ~rdch_full;
    assign S_AXI_RVALID      = rdch_s_axi_rvalid;
    assign M_AXI_RREADY      = rdch_m_axi_rready;
    assign AXI_R_UNDERFLOW   = C_USE_COMMON_UNDERFLOW == 0 ? axi_r_underflow_i  : 0;
    assign AXI_R_OVERFLOW    = C_USE_COMMON_OVERFLOW  == 0 ? axi_r_overflow_i   : 0;
  end endgenerate //axi_read_data_channel
  // Register Slice for read Data Channel
  generate if (C_RDCH_TYPE == 1) begin : grdch_reg_slice
    fifo_generator_v13_1_3_axic_reg_slice
          #(
            .C_FAMILY                (C_FAMILY),
            .C_DATA_WIDTH            (C_DIN_WIDTH_RDCH),
            .C_REG_CONFIG            (C_REG_SLICE_MODE_RDCH)
            )
    rdch_reg_slice_inst
        (
          // System Signals
          .ACLK                      (S_ACLK),
          .ARESET                    (axi_rs_rst),
          // Slave side
          .S_PAYLOAD_DATA            (rdch_din),
          .S_VALID                   (M_AXI_RVALID),
          .S_READY                   (M_AXI_RREADY),
          // Master side
          .M_PAYLOAD_DATA            (rdch_dout),
          .M_VALID                   (S_AXI_RVALID),
          .M_READY                   (S_AXI_RREADY)
          );
  end endgenerate // grdch_reg_slice
    assign axi_rd_underflow_i = C_USE_COMMON_UNDERFLOW == 1 ? (axi_ar_underflow_i || axi_r_underflow_i) : 0;
    assign axi_rd_overflow_i  = C_USE_COMMON_OVERFLOW  == 1 ? (axi_ar_overflow_i  || axi_r_overflow_i) : 0;
  generate if (IS_AXI_FULL_RACH == 1 || (IS_AXI_FULL == 1 && C_RACH_TYPE == 1)) begin : axi_full_rach_output
    assign M_AXI_ARADDR    = rach_dout[ARID_OFFSET-1:ARADDR_OFFSET];
    assign M_AXI_ARLEN     = rach_dout[ARADDR_OFFSET-1:ARLEN_OFFSET];
    assign M_AXI_ARSIZE    = rach_dout[ARLEN_OFFSET-1:ARSIZE_OFFSET];
    assign M_AXI_ARBURST   = rach_dout[ARSIZE_OFFSET-1:ARBURST_OFFSET];
    assign M_AXI_ARLOCK    = rach_dout[ARBURST_OFFSET-1:ARLOCK_OFFSET];
    assign M_AXI_ARCACHE   = rach_dout[ARLOCK_OFFSET-1:ARCACHE_OFFSET];
    assign M_AXI_ARPROT    = rach_dout[ARCACHE_OFFSET-1:ARPROT_OFFSET];
    assign M_AXI_ARQOS     = rach_dout[ARPROT_OFFSET-1:ARQOS_OFFSET];
    assign rach_din[ARID_OFFSET-1:ARADDR_OFFSET]    = S_AXI_ARADDR;
    assign rach_din[ARADDR_OFFSET-1:ARLEN_OFFSET]   = S_AXI_ARLEN;
    assign rach_din[ARLEN_OFFSET-1:ARSIZE_OFFSET]   = S_AXI_ARSIZE;
    assign rach_din[ARSIZE_OFFSET-1:ARBURST_OFFSET] = S_AXI_ARBURST;
    assign rach_din[ARBURST_OFFSET-1:ARLOCK_OFFSET] = S_AXI_ARLOCK;
    assign rach_din[ARLOCK_OFFSET-1:ARCACHE_OFFSET] = S_AXI_ARCACHE;
    assign rach_din[ARCACHE_OFFSET-1:ARPROT_OFFSET] = S_AXI_ARPROT;
    assign rach_din[ARPROT_OFFSET-1:ARQOS_OFFSET]   = S_AXI_ARQOS;
  end endgenerate // axi_full_rach_output
  generate if ((IS_AXI_FULL_RACH == 1 || (IS_AXI_FULL == 1 && C_RACH_TYPE == 1)) && C_AXI_TYPE == 1) begin : axi_arregion
    assign M_AXI_ARREGION  = rach_dout[ARQOS_OFFSET-1:ARREGION_OFFSET];
  end endgenerate // axi_arregion
  generate if ((IS_AXI_FULL_RACH == 1 || (IS_AXI_FULL == 1 && C_RACH_TYPE == 1)) && C_AXI_TYPE != 1) begin : naxi_arregion
    assign M_AXI_ARREGION  = 0;
  end endgenerate // naxi_arregion
  generate if ((IS_AXI_FULL_RACH == 1 || (IS_AXI_FULL == 1 && C_RACH_TYPE == 1)) && C_HAS_AXI_ARUSER == 1) begin : axi_aruser
    assign M_AXI_ARUSER = rach_dout[ARREGION_OFFSET-1:ARUSER_OFFSET];
  end endgenerate // axi_aruser
  generate if ((IS_AXI_FULL_RACH == 1 || (IS_AXI_FULL == 1 && C_RACH_TYPE == 1)) && C_HAS_AXI_ARUSER == 0) begin : naxi_aruser
    assign M_AXI_ARUSER = 0;
  end endgenerate // naxi_aruser
  generate if ((IS_AXI_FULL_RACH == 1 || (IS_AXI_FULL == 1 && C_RACH_TYPE == 1)) && C_HAS_AXI_ID == 1) begin : axi_arid
    assign M_AXI_ARID      = rach_dout[C_DIN_WIDTH_RACH-1:ARID_OFFSET];
  end endgenerate // axi_arid
  generate if ((IS_AXI_FULL_RACH == 1 || (IS_AXI_FULL == 1 && C_RACH_TYPE == 1)) && C_HAS_AXI_ID == 0) begin : naxi_arid
    assign M_AXI_ARID      = 0;
  end endgenerate // naxi_arid
  generate if (IS_AXI_FULL_RDCH == 1 || (IS_AXI_FULL == 1 && C_RDCH_TYPE == 1)) begin : axi_full_rdch_output
    assign S_AXI_RDATA     = rdch_dout[RID_OFFSET-1:RDATA_OFFSET];
    assign S_AXI_RRESP     = rdch_dout[RDATA_OFFSET-1:RRESP_OFFSET];
    assign S_AXI_RLAST     = rdch_dout[0];
    assign rdch_din[RID_OFFSET-1:RDATA_OFFSET]   = M_AXI_RDATA;
    assign rdch_din[RDATA_OFFSET-1:RRESP_OFFSET] = M_AXI_RRESP;
    assign rdch_din[0] = M_AXI_RLAST;
  end endgenerate // axi_full_rdch_output
  generate if ((IS_AXI_FULL_RDCH == 1 || (IS_AXI_FULL == 1 && C_RDCH_TYPE == 1)) && C_HAS_AXI_RUSER == 1) begin : axi_full_ruser_output
    assign S_AXI_RUSER     = rdch_dout[RRESP_OFFSET-1:RUSER_OFFSET];
  end endgenerate // axi_full_ruser_output
  generate if ((IS_AXI_FULL_RDCH == 1 || (IS_AXI_FULL == 1 && C_RDCH_TYPE == 1)) && C_HAS_AXI_RUSER == 0) begin : axi_full_nruser_output
    assign S_AXI_RUSER     =  0;
  end endgenerate // axi_full_nruser_output
  generate if ((IS_AXI_FULL_RDCH == 1 || (IS_AXI_FULL == 1 && C_RDCH_TYPE == 1)) && C_HAS_AXI_ID == 1) begin : axi_rid
    assign S_AXI_RID       = rdch_dout[C_DIN_WIDTH_RDCH-1:RID_OFFSET];
  end endgenerate // axi_rid
  generate if ((IS_AXI_FULL_RDCH == 1 || (IS_AXI_FULL == 1 && C_RDCH_TYPE == 1)) && C_HAS_AXI_ID == 0) begin : naxi_rid
    assign S_AXI_RID       = 0;
  end endgenerate // naxi_rid
  generate if (IS_AXI_LITE_RACH == 1 || (IS_AXI_LITE == 1 && C_RACH_TYPE == 1)) begin : axi_lite_rach_output1
    assign rach_din      = {S_AXI_ARADDR, S_AXI_ARPROT};
    assign M_AXI_ARADDR  = rach_dout[C_DIN_WIDTH_RACH-1:ARADDR_OFFSET];
    assign M_AXI_ARPROT  = rach_dout[ARADDR_OFFSET-1:ARPROT_OFFSET];
  end endgenerate // axi_lite_rach_output
  generate if (IS_AXI_LITE_RDCH == 1 || (IS_AXI_LITE == 1 && C_RDCH_TYPE == 1)) begin : axi_lite_rdch_output1
    assign rdch_din      = {M_AXI_RDATA, M_AXI_RRESP};
    assign S_AXI_RDATA   = rdch_dout[C_DIN_WIDTH_RDCH-1:RDATA_OFFSET];
    assign S_AXI_RRESP   = rdch_dout[RDATA_OFFSET-1:RRESP_OFFSET];
  end endgenerate // axi_lite_rdch_output
  generate if ((IS_AXI_FULL_RACH == 1 || (IS_AXI_FULL == 1 && C_RACH_TYPE == 1)) && C_HAS_AXI_ARUSER == 1) begin : grach_din1
    assign rach_din[ARREGION_OFFSET-1:ARUSER_OFFSET]     = S_AXI_ARUSER;
  end endgenerate // grach_din1
  generate if ((IS_AXI_FULL_RACH == 1 || (IS_AXI_FULL == 1 && C_RACH_TYPE == 1)) && C_HAS_AXI_ID == 1) begin : grach_din2
    assign rach_din[C_DIN_WIDTH_RACH-1:ARID_OFFSET]     = S_AXI_ARID;
  end endgenerate // grach_din2
  generate if ((IS_AXI_FULL_RACH == 1 || (IS_AXI_FULL == 1 && C_RACH_TYPE == 1)) && C_AXI_TYPE == 1) begin
    assign rach_din[ARQOS_OFFSET-1:ARREGION_OFFSET] = S_AXI_ARREGION;
  end endgenerate
  generate if ((IS_AXI_FULL_RDCH == 1 || (IS_AXI_FULL == 1 && C_RDCH_TYPE == 1)) && C_HAS_AXI_RUSER == 1) begin : grdch_din1
    assign rdch_din[RRESP_OFFSET-1:RUSER_OFFSET]     = M_AXI_RUSER;
  end endgenerate // grdch_din1
  generate if ((IS_AXI_FULL_RDCH == 1 || (IS_AXI_FULL == 1 && C_RDCH_TYPE == 1)) && C_HAS_AXI_ID == 1) begin : grdch_din2
    assign rdch_din[C_DIN_WIDTH_RDCH-1:RID_OFFSET] = M_AXI_RID;
  end endgenerate // grdch_din2
  //end of axi_read_channel
  generate if (C_INTERFACE_TYPE == 1 && C_USE_COMMON_UNDERFLOW == 1) begin : gaxi_comm_uf
    assign UNDERFLOW = (C_HAS_AXI_WR_CHANNEL == 1 && C_HAS_AXI_RD_CHANNEL == 1) ? (axi_wr_underflow_i || axi_rd_underflow_i) :
                       (C_HAS_AXI_WR_CHANNEL == 1 && C_HAS_AXI_RD_CHANNEL == 0) ? axi_wr_underflow_i :
                       (C_HAS_AXI_WR_CHANNEL == 0 && C_HAS_AXI_RD_CHANNEL == 1) ? axi_rd_underflow_i : 0;
  end endgenerate // gaxi_comm_uf
  generate if (C_INTERFACE_TYPE == 1 && C_USE_COMMON_OVERFLOW == 1) begin : gaxi_comm_of
    assign OVERFLOW = (C_HAS_AXI_WR_CHANNEL == 1 && C_HAS_AXI_RD_CHANNEL == 1) ? (axi_wr_overflow_i || axi_rd_overflow_i) :
                      (C_HAS_AXI_WR_CHANNEL == 1 && C_HAS_AXI_RD_CHANNEL == 0) ? axi_wr_overflow_i :
                      (C_HAS_AXI_WR_CHANNEL == 0 && C_HAS_AXI_RD_CHANNEL == 1) ? axi_rd_overflow_i : 0;
  end endgenerate // gaxi_comm_of
  // Pass Through Logic or Wiring Logic
  // Pass Through Logic for Read Channel
  // Wiring logic for Write Address Channel
  generate if (C_WACH_TYPE == 2) begin : gwach_pass_through
    assign M_AXI_AWID      = S_AXI_AWID;
    assign M_AXI_AWADDR    = S_AXI_AWADDR;
    assign M_AXI_AWLEN     = S_AXI_AWLEN;
    assign M_AXI_AWSIZE    = S_AXI_AWSIZE;
    assign M_AXI_AWBURST   = S_AXI_AWBURST;
    assign M_AXI_AWLOCK    = S_AXI_AWLOCK;
    assign M_AXI_AWCACHE   = S_AXI_AWCACHE;
    assign M_AXI_AWPROT    = S_AXI_AWPROT;
    assign M_AXI_AWQOS     = S_AXI_AWQOS;
    assign M_AXI_AWREGION  = S_AXI_AWREGION;
    assign M_AXI_AWUSER    = S_AXI_AWUSER;
    assign S_AXI_AWREADY   = M_AXI_AWREADY;
    assign M_AXI_AWVALID   = S_AXI_AWVALID;
  end endgenerate // gwach_pass_through;
  // Wiring logic for Write Data Channel
  generate if (C_WDCH_TYPE == 2) begin : gwdch_pass_through
    assign M_AXI_WID       = S_AXI_WID;
    assign M_AXI_WDATA     = S_AXI_WDATA;
    assign M_AXI_WSTRB     = S_AXI_WSTRB;
    assign M_AXI_WLAST     = S_AXI_WLAST;
    assign M_AXI_WUSER     = S_AXI_WUSER;
    assign S_AXI_WREADY    = M_AXI_WREADY;
    assign M_AXI_WVALID    = S_AXI_WVALID;
  end endgenerate // gwdch_pass_through;
  // Wiring logic for Write Response Channel
  generate if (C_WRCH_TYPE == 2) begin : gwrch_pass_through
    assign S_AXI_BID       = M_AXI_BID;
    assign S_AXI_BRESP     = M_AXI_BRESP;
    assign S_AXI_BUSER     = M_AXI_BUSER;
    assign M_AXI_BREADY    = S_AXI_BREADY;
    assign S_AXI_BVALID    = M_AXI_BVALID;
  end endgenerate // gwrch_pass_through;
  // Pass Through Logic for Read Channel
  // Wiring logic for Read Address Channel
  generate if (C_RACH_TYPE == 2) begin : grach_pass_through
    assign M_AXI_ARID      = S_AXI_ARID;
    assign M_AXI_ARADDR    = S_AXI_ARADDR;
    assign M_AXI_ARLEN     = S_AXI_ARLEN;
    assign M_AXI_ARSIZE    = S_AXI_ARSIZE;
    assign M_AXI_ARBURST   = S_AXI_ARBURST;
    assign M_AXI_ARLOCK    = S_AXI_ARLOCK;
    assign M_AXI_ARCACHE   = S_AXI_ARCACHE;
    assign M_AXI_ARPROT    = S_AXI_ARPROT;
    assign M_AXI_ARQOS     = S_AXI_ARQOS;
    assign M_AXI_ARREGION  = S_AXI_ARREGION;
    assign M_AXI_ARUSER    = S_AXI_ARUSER;
    assign S_AXI_ARREADY   = M_AXI_ARREADY;
    assign M_AXI_ARVALID   = S_AXI_ARVALID;
  end endgenerate // grach_pass_through;
  // Wiring logic for Read Data Channel
  generate if (C_RDCH_TYPE == 2) begin : grdch_pass_through
    assign S_AXI_RID      = M_AXI_RID;
    assign S_AXI_RLAST    = M_AXI_RLAST;
    assign S_AXI_RUSER    = M_AXI_RUSER;
    assign S_AXI_RDATA    = M_AXI_RDATA;
    assign S_AXI_RRESP    = M_AXI_RRESP;
    assign S_AXI_RVALID   = M_AXI_RVALID;
    assign M_AXI_RREADY   = S_AXI_RREADY;
  end endgenerate // grdch_pass_through;
  // Wiring logic for AXI Streaming
  generate if (C_AXIS_TYPE == 2) begin : gaxis_pass_through
    assign M_AXIS_TDATA   = S_AXIS_TDATA;
    assign M_AXIS_TSTRB   = S_AXIS_TSTRB;
    assign M_AXIS_TKEEP   = S_AXIS_TKEEP;
    assign M_AXIS_TID     = S_AXIS_TID;
    assign M_AXIS_TDEST   = S_AXIS_TDEST;
    assign M_AXIS_TUSER   = S_AXIS_TUSER;
    assign M_AXIS_TLAST   = S_AXIS_TLAST;
    assign S_AXIS_TREADY  = M_AXIS_TREADY;
    assign M_AXIS_TVALID  = S_AXIS_TVALID;
  end endgenerate // gaxis_pass_through;
endmodule