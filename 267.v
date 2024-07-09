module blk_mem_gen_v8_3_5
  #(parameter C_CORENAME                = "blk_mem_gen_v8_3_5",
    parameter C_FAMILY                  = "virtex7",
    parameter C_XDEVICEFAMILY           = "virtex7",
    parameter C_ELABORATION_DIR         = "",
    parameter C_INTERFACE_TYPE          = 0,
    parameter C_USE_BRAM_BLOCK          = 0,
    parameter C_CTRL_ECC_ALGO           = "NONE",
    parameter C_ENABLE_32BIT_ADDRESS    = 0,
    parameter C_AXI_TYPE                = 0,
    parameter C_AXI_SLAVE_TYPE          = 0,
    parameter C_HAS_AXI_ID              = 0,
    parameter C_AXI_ID_WIDTH            = 4,
    parameter C_MEM_TYPE                = 2,
    parameter C_BYTE_SIZE               = 9,
    parameter C_ALGORITHM               = 1,
    parameter C_PRIM_TYPE               = 3,
    parameter C_LOAD_INIT_FILE          = 0,
    parameter C_INIT_FILE_NAME          = "",
    parameter C_INIT_FILE               = "",
    parameter C_USE_DEFAULT_DATA        = 0,
    parameter C_DEFAULT_DATA            = "0",
    //parameter C_RST_TYPE                = "SYNC",
    parameter C_HAS_RSTA                = 0,
    parameter C_RST_PRIORITY_A          = "CE",
    parameter C_RSTRAM_A                = 0,
    parameter C_INITA_VAL               = "0",
    parameter C_HAS_ENA                 = 1,
    parameter C_HAS_REGCEA              = 0,
    parameter C_USE_BYTE_WEA            = 0,
    parameter C_WEA_WIDTH               = 1,
    parameter C_WRITE_MODE_A            = "WRITE_FIRST",
    parameter C_WRITE_WIDTH_A           = 32,
    parameter C_READ_WIDTH_A            = 32,
    parameter C_WRITE_DEPTH_A           = 64,
    parameter C_READ_DEPTH_A            = 64,
    parameter C_ADDRA_WIDTH             = 5,
    parameter C_HAS_RSTB                = 0,
    parameter C_RST_PRIORITY_B          = "CE",
    parameter C_RSTRAM_B                = 0,
    parameter C_INITB_VAL               = "",
    parameter C_HAS_ENB                 = 1,
    parameter C_HAS_REGCEB              = 0,
    parameter C_USE_BYTE_WEB            = 0,
    parameter C_WEB_WIDTH               = 1,
    parameter C_WRITE_MODE_B            = "WRITE_FIRST",
    parameter C_WRITE_WIDTH_B           = 32,
    parameter C_READ_WIDTH_B            = 32,
    parameter C_WRITE_DEPTH_B           = 64,
    parameter C_READ_DEPTH_B            = 64,
    parameter C_ADDRB_WIDTH             = 5,
    parameter C_HAS_MEM_OUTPUT_REGS_A   = 0,
    parameter C_HAS_MEM_OUTPUT_REGS_B   = 0,
    parameter C_HAS_MUX_OUTPUT_REGS_A   = 0,
    parameter C_HAS_MUX_OUTPUT_REGS_B   = 0,
    parameter C_HAS_SOFTECC_INPUT_REGS_A = 0,
    parameter C_HAS_SOFTECC_OUTPUT_REGS_B= 0,
    parameter C_MUX_PIPELINE_STAGES     = 0,
    parameter C_USE_SOFTECC             = 0,
    parameter C_USE_ECC                 = 0,
	parameter C_EN_ECC_PIPE             = 0,
    parameter C_HAS_INJECTERR           = 0,
    parameter C_SIM_COLLISION_CHECK     = "NONE",
    parameter C_COMMON_CLK              = 1,
    parameter C_DISABLE_WARN_BHV_COLL   = 0,
	parameter C_EN_SLEEP_PIN            = 0,
    parameter C_USE_URAM                = 0,
    parameter C_EN_RDADDRA_CHG          = 0,
    parameter C_EN_RDADDRB_CHG          = 0,
    parameter C_EN_DEEPSLEEP_PIN        = 0,
    parameter C_EN_SHUTDOWN_PIN         = 0,
	parameter C_EN_SAFETY_CKT           = 0,
	parameter C_COUNT_36K_BRAM          = "",
	parameter C_COUNT_18K_BRAM          = "",
	parameter C_EST_POWER_SUMMARY       = "",
	parameter C_DISABLE_WARN_BHV_RANGE  = 0
  )
  (input                       clka,
   input                       rsta,
   input                       ena,
   input                       regcea,
   input [C_WEA_WIDTH-1:0]     wea,
   input [C_ADDRA_WIDTH-1:0]   addra,
   input [C_WRITE_WIDTH_A-1:0] dina,
   output [C_READ_WIDTH_A-1:0] douta,
   input                       clkb,
   input                       rstb,
   input                       enb,
   input                       regceb,
   input [C_WEB_WIDTH-1:0]     web,
   input [C_ADDRB_WIDTH-1:0]   addrb,
   input [C_WRITE_WIDTH_B-1:0] dinb,
   output [C_READ_WIDTH_B-1:0] doutb,
   input                       injectsbiterr,
   input                       injectdbiterr,
   output                      sbiterr,
   output                      dbiterr,
   output [C_ADDRB_WIDTH-1:0]  rdaddrecc,
   input                       eccpipece,
   input                       sleep,
   input                       deepsleep,
   input                       shutdown,
   output                      rsta_busy,
   output                      rstb_busy,
   //AXI BMG Input and Output Port Declarations
   //AXI Global Signals
   input                         s_aclk,
   input                         s_aresetn,
   //AXI                        Full/lite slave write (write side)
   input  [C_AXI_ID_WIDTH-1:0]   s_axi_awid,
   input  [31:0]                 s_axi_awaddr,
   input  [7:0]                  s_axi_awlen,
   input  [2:0]                  s_axi_awsize,
   input  [1:0]                  s_axi_awburst,
   input                         s_axi_awvalid,
   output                        s_axi_awready,
   input  [C_WRITE_WIDTH_A-1:0]  s_axi_wdata,
   input  [C_WEA_WIDTH-1:0]      s_axi_wstrb,
   input                         s_axi_wlast,
   input                         s_axi_wvalid,
   output                        s_axi_wready,
   output [C_AXI_ID_WIDTH-1:0]   s_axi_bid,
   output [1:0]                  s_axi_bresp,
   output                        s_axi_bvalid,
   input                         s_axi_bready,
   //AXI                        Full/lite slave read (write side)
   input  [C_AXI_ID_WIDTH-1:0]   s_axi_arid,
   input  [31:0]                 s_axi_araddr,
   input  [7:0]                  s_axi_arlen,
   input  [2:0]                  s_axi_arsize,
   input  [1:0]                  s_axi_arburst,
   input                         s_axi_arvalid,
   output                        s_axi_arready,
   output [C_AXI_ID_WIDTH-1:0]   s_axi_rid,
   output [C_WRITE_WIDTH_B-1:0]  s_axi_rdata,
   output [1:0]                  s_axi_rresp,
   output                        s_axi_rlast,
   output                        s_axi_rvalid,
   input                         s_axi_rready,
   //AXI                        Full/lite sideband signals
   input                         s_axi_injectsbiterr,
   input                         s_axi_injectdbiterr,
   output                        s_axi_sbiterr,
   output                        s_axi_dbiterr,
   output [C_ADDRB_WIDTH-1:0]    s_axi_rdaddrecc
  );
// Port and Generic Definitions
  // Generic Definitions
  // C_CORENAME              : Instance name of the Block Memory Generator core
  // C_FAMILY,C_XDEVICEFAMILY: Designates architecture targeted. The following
  //                           options are available - "spartan3", "spartan6",
  //                           "virtex4", "virtex5", "virtex6" and "virtex6l".
  // C_MEM_TYPE              : Designates memory type.
  //                           It can be
  //                           0 - Single Port Memory
  //                           1 - Simple Dual Port Memory
  //                           2 - True Dual Port Memory
  //                           3 - Single Port Read Only Memory
  //                           4 - Dual Port Read Only Memory
  // C_BYTE_SIZE             : Size of a byte (8 or 9 bits)
  // C_ALGORITHM             : Designates the algorithm method used
  //                           for constructing the memory.
  //                           It can be Fixed_Primitives, Minimum_Area or
  //                           Low_Power
  // C_PRIM_TYPE             : Designates the user selected primitive used to
  //                           construct the memory.
  // C_LOAD_INIT_FILE        : Designates the use of an initialization file to
  //                           initialize memory contents.
  // C_INIT_FILE_NAME        : Memory initialization file name.
  // C_USE_DEFAULT_DATA      : Designates whether to fill remaining
  //                           initialization space with default data
  // C_DEFAULT_DATA          : Default value of all memory locations
  //                           not initialized by the memory
  //                           initialization file.
  // C_RST_TYPE              : Type of reset - Synchronous or Asynchronous
  // C_HAS_RSTA              : Determines the presence of the RSTA port
  // C_RST_PRIORITY_A        : Determines the priority between CE and SR for
  //                           Port A.
  // C_RSTRAM_A              : Determines if special reset behavior is used for
  //                           Port A
  // C_INITA_VAL             : The initialization value for Port A
  // C_HAS_ENA               : Determines the presence of the ENA port
  // C_HAS_REGCEA            : Determines the presence of the REGCEA port
  // C_USE_BYTE_WEA          : Determines if the Byte Write is used or not.
  // C_WEA_WIDTH             : The width of the WEA port
  // C_WRITE_MODE_A          : Configurable write mode for Port A. It can be
  //                           WRITE_FIRST, READ_FIRST or NO_CHANGE.
  // C_WRITE_WIDTH_A         : Memory write width for Port A.
  // C_READ_WIDTH_A          : Memory read width for Port A.
  // C_WRITE_DEPTH_A         : Memory write depth for Port A.
  // C_READ_DEPTH_A          : Memory read depth for Port A.
  // C_ADDRA_WIDTH           : Width of the ADDRA input port
  // C_HAS_RSTB              : Determines the presence of the RSTB port
  // C_RST_PRIORITY_B        : Determines the priority between CE and SR for
  //                           Port B.
  // C_RSTRAM_B              : Determines if special reset behavior is used for
  //                           Port B
  // C_INITB_VAL             : The initialization value for Port B
  // C_HAS_ENB               : Determines the presence of the ENB port
  // C_HAS_REGCEB            : Determines the presence of the REGCEB port
  // C_USE_BYTE_WEB          : Determines if the Byte Write is used or not.
  // C_WEB_WIDTH             : The width of the WEB port
  // C_WRITE_MODE_B          : Configurable write mode for Port B. It can be
  //                           WRITE_FIRST, READ_FIRST or NO_CHANGE.
  // C_WRITE_WIDTH_B         : Memory write width for Port B.
  // C_READ_WIDTH_B          : Memory read width for Port B.
  // C_WRITE_DEPTH_B         : Memory write depth for Port B.
  // C_READ_DEPTH_B          : Memory read depth for Port B.
  // C_ADDRB_WIDTH           : Width of the ADDRB input port
  // C_HAS_MEM_OUTPUT_REGS_A : Designates the use of a register at the output
  //                           of the RAM primitive for Port A.
  // C_HAS_MEM_OUTPUT_REGS_B : Designates the use of a register at the output
  //                           of the RAM primitive for Port B.
  // C_HAS_MUX_OUTPUT_REGS_A : Designates the use of a register at the output
  //                           of the MUX for Port A.
  // C_HAS_MUX_OUTPUT_REGS_B : Designates the use of a register at the output
  //                           of the MUX for Port B.
  // C_HAS_SOFTECC_INPUT_REGS_A  :
  // C_HAS_SOFTECC_OUTPUT_REGS_B :
  // C_MUX_PIPELINE_STAGES   : Designates the number of pipeline stages in
  //                           between the muxes.
  // C_USE_SOFTECC           : Determines if the Soft ECC feature is used or
  //                           not. Only applicable Spartan-6
  // C_USE_ECC               : Determines if the ECC feature is used or
  //                           not. Only applicable for V5 and V6
  // C_HAS_INJECTERR         : Determines if the error injection pins
  //                           are present or not. If the ECC feature
  //                           is not used, this value is defaulted to
  //                           0, else the following are the allowed
  //                           values:
  //                         0 : No INJECTSBITERR or INJECTDBITERR pins
  //                         1 : Only INJECTSBITERR pin exists
  //                         2 : Only INJECTDBITERR pin exists
  //                         3 : Both INJECTSBITERR and INJECTDBITERR pins exist
  // C_SIM_COLLISION_CHECK   : Controls the disabling of Unisim model collision
  //                           warnings. It can be "ALL", "NONE",
  //                           "Warnings_Only" or "Generate_X_Only".
  // C_COMMON_CLK            : Determins if the core has a single CLK input.
  // C_DISABLE_WARN_BHV_COLL : Controls the Behavioral Model Collision warnings
  // C_DISABLE_WARN_BHV_RANGE: Controls the Behavioral Model Out of Range
  //                           warnings
  // Port Definitions
  // CLKA    : Clock to synchronize all read and write operations of Port A.
  // RSTA    : Reset input to reset memory outputs to a user-defined
  //           reset state for Port A.
  // ENA     : Enable all read and write operations of Port A.
  // REGCEA  : Register Clock Enable to control each pipeline output
  //           register stages for Port A.
  // WEA     : Write Enable to enable all write operations of Port A.
  // ADDRA   : Address of Port A.
  // DINA    : Data input of Port A.
  // DOUTA   : Data output of Port A.
  // CLKB    : Clock to synchronize all read and write operations of Port B.
  // RSTB    : Reset input to reset memory outputs to a user-defined
  //           reset state for Port B.
  // ENB     : Enable all read and write operations of Port B.
  // REGCEB  : Register Clock Enable to control each pipeline output
  //           register stages for Port B.
  // WEB     : Write Enable to enable all write operations of Port B.
  // ADDRB   : Address of Port B.
  // DINB    : Data input of Port B.
  // DOUTB   : Data output of Port B.
  // INJECTSBITERR : Single Bit ECC Error Injection Pin.
  // INJECTDBITERR : Double Bit ECC Error Injection Pin.
  // SBITERR       : Output signal indicating that a Single Bit ECC Error has been
  //                 detected and corrected.
  // DBITERR       : Output signal indicating that a Double Bit ECC Error has been
  //                 detected.
  // RDADDRECC     : Read Address Output signal indicating address at which an
  //                 ECC error has occurred.
  wire SBITERR;
  wire DBITERR;
  wire S_AXI_AWREADY;
  wire S_AXI_WREADY;
  wire S_AXI_BVALID;
  wire S_AXI_ARREADY;
  wire S_AXI_RLAST;
  wire S_AXI_RVALID;
  wire S_AXI_SBITERR;
  wire S_AXI_DBITERR;
  wire [C_WEA_WIDTH-1:0]       WEA              = wea;
  wire [C_ADDRA_WIDTH-1:0]     ADDRA            = addra;
  wire [C_WRITE_WIDTH_A-1:0]   DINA             = dina;
  wire [C_READ_WIDTH_A-1:0]    DOUTA;
  wire [C_WEB_WIDTH-1:0]       WEB              = web;
  wire [C_ADDRB_WIDTH-1:0]     ADDRB            = addrb;
  wire [C_WRITE_WIDTH_B-1:0]   DINB             = dinb;
  wire [C_READ_WIDTH_B-1:0]    DOUTB;
  wire [C_ADDRB_WIDTH-1:0]     RDADDRECC;
  wire [C_AXI_ID_WIDTH-1:0]    S_AXI_AWID       = s_axi_awid;
  wire [31:0]                  S_AXI_AWADDR     = s_axi_awaddr;
  wire [7:0]                   S_AXI_AWLEN      = s_axi_awlen;
  wire [2:0]                   S_AXI_AWSIZE     = s_axi_awsize;
  wire [1:0]                   S_AXI_AWBURST    = s_axi_awburst;
  wire [C_WRITE_WIDTH_A-1:0]   S_AXI_WDATA      = s_axi_wdata;
  wire [C_WEA_WIDTH-1:0]       S_AXI_WSTRB      = s_axi_wstrb;
  wire [C_AXI_ID_WIDTH-1:0]    S_AXI_BID;
  wire [1:0]                   S_AXI_BRESP;
  wire [C_AXI_ID_WIDTH-1:0]    S_AXI_ARID       = s_axi_arid;
  wire [31:0]                  S_AXI_ARADDR     = s_axi_araddr;
  wire [7:0]                   S_AXI_ARLEN      = s_axi_arlen;
  wire [2:0]                   S_AXI_ARSIZE     = s_axi_arsize;
  wire [1:0]                   S_AXI_ARBURST    = s_axi_arburst;
  wire [C_AXI_ID_WIDTH-1:0]    S_AXI_RID;
  wire [C_WRITE_WIDTH_B-1:0]   S_AXI_RDATA;
  wire [1:0]                   S_AXI_RRESP;
  wire [C_ADDRB_WIDTH-1:0]     S_AXI_RDADDRECC;
  // Added to fix the simulation warning #CR731605
  wire [C_WEB_WIDTH-1:0]       WEB_parameterized = 0;
  wire                         ECCPIPECE;
  wire                         SLEEP;
  reg                          RSTA_BUSY = 0;
  reg                          RSTB_BUSY = 0;
  // Declaration of internal signals to avoid warnings #927399
  wire                         CLKA;
  wire                         RSTA;
  wire                         ENA;
  wire                         REGCEA;
  wire                         CLKB;
  wire                         RSTB;
  wire                         ENB;
  wire                         REGCEB;
  wire                         INJECTSBITERR;
  wire                         INJECTDBITERR;
  wire                         S_ACLK;
  wire                         S_ARESETN;
  wire                         S_AXI_AWVALID;
  wire                         S_AXI_WLAST;
  wire                         S_AXI_WVALID;
  wire                         S_AXI_BREADY;
  wire                         S_AXI_ARVALID;
  wire                         S_AXI_RREADY;
  wire                         S_AXI_INJECTSBITERR;
  wire                         S_AXI_INJECTDBITERR;
  assign CLKA                 = clka;
  assign RSTA                 = rsta;
  assign ENA                  = ena;
  assign REGCEA               = regcea;
  assign CLKB                 = clkb;
  assign RSTB                 = rstb;
  assign ENB                  = enb;
  assign REGCEB               = regceb;
  assign INJECTSBITERR        = injectsbiterr;
  assign INJECTDBITERR        = injectdbiterr;
  assign ECCPIPECE            = eccpipece;
  assign SLEEP                = sleep;
  assign sbiterr              = SBITERR;
  assign dbiterr              = DBITERR;
  assign S_ACLK               = s_aclk;
  assign S_ARESETN            = s_aresetn;
  assign S_AXI_AWVALID        = s_axi_awvalid;
  assign s_axi_awready        = S_AXI_AWREADY;
  assign S_AXI_WLAST          = s_axi_wlast;
  assign S_AXI_WVALID         = s_axi_wvalid;
  assign s_axi_wready         = S_AXI_WREADY;
  assign s_axi_bvalid         = S_AXI_BVALID;
  assign S_AXI_BREADY         = s_axi_bready;
  assign S_AXI_ARVALID        = s_axi_arvalid;
  assign s_axi_arready        = S_AXI_ARREADY;
  assign s_axi_rlast          = S_AXI_RLAST;
  assign s_axi_rvalid         = S_AXI_RVALID;
  assign S_AXI_RREADY         = s_axi_rready;
  assign S_AXI_INJECTSBITERR  = s_axi_injectsbiterr;
  assign S_AXI_INJECTDBITERR  = s_axi_injectdbiterr;
  assign s_axi_sbiterr        = S_AXI_SBITERR;
  assign s_axi_dbiterr        = S_AXI_DBITERR;
  assign rsta_busy            = RSTA_BUSY;
  assign rstb_busy            = RSTB_BUSY;
  assign doutb            = DOUTB;
  assign douta            = DOUTA;
  assign rdaddrecc        = RDADDRECC;
  assign s_axi_bid        = S_AXI_BID;
  assign s_axi_bresp      = S_AXI_BRESP;
  assign s_axi_rid        = S_AXI_RID;
  assign s_axi_rdata      = S_AXI_RDATA;
  assign s_axi_rresp      = S_AXI_RRESP;
  assign s_axi_rdaddrecc  = S_AXI_RDADDRECC;
  localparam FLOP_DELAY  = 100;  // 100 ps
   reg                       injectsbiterr_in;
   reg                       injectdbiterr_in;
   reg                       rsta_in;
   reg                       ena_in;
   reg                       regcea_in;
   reg [C_WEA_WIDTH-1:0]     wea_in;
   reg [C_ADDRA_WIDTH-1:0]   addra_in;
   reg [C_WRITE_WIDTH_A-1:0] dina_in;
  wire [C_ADDRA_WIDTH-1:0] s_axi_awaddr_out_c;
  wire [C_ADDRB_WIDTH-1:0] s_axi_araddr_out_c;
  wire s_axi_wr_en_c;
  wire s_axi_rd_en_c;
  wire s_aresetn_a_c;
  wire [7:0] s_axi_arlen_c ;
  wire [C_AXI_ID_WIDTH-1 : 0] s_axi_rid_c;
  wire [C_WRITE_WIDTH_B-1 : 0] s_axi_rdata_c;
  wire [1:0] s_axi_rresp_c;
  wire s_axi_rlast_c;
  wire s_axi_rvalid_c;
  wire s_axi_rready_c;
  wire regceb_c;
  localparam C_AXI_PAYLOAD = (C_HAS_MUX_OUTPUT_REGS_B == 1)?C_WRITE_WIDTH_B+C_AXI_ID_WIDTH+3:C_AXI_ID_WIDTH+3;
  wire [C_AXI_PAYLOAD-1 : 0] s_axi_payload_c;
  wire [C_AXI_PAYLOAD-1 : 0] m_axi_payload_c;
// Safety logic related signals
  reg [4:0] RSTA_SHFT_REG = 0;
  reg POR_A = 0;
  reg [4:0] RSTB_SHFT_REG = 0;
  reg POR_B = 0;
  reg ENA_dly = 0;
  reg ENA_dly_D = 0;
  reg ENB_dly = 0;
  reg ENB_dly_D = 0;
  wire RSTA_I_SAFE;
  wire RSTB_I_SAFE;
  wire ENA_I_SAFE;
  wire ENB_I_SAFE;
  reg ram_rstram_a_busy = 0;
  reg ram_rstreg_a_busy = 0;
  reg ram_rstram_b_busy = 0;
  reg ram_rstreg_b_busy = 0;
  reg ENA_dly_reg = 0;
  reg ENB_dly_reg = 0;
  reg ENA_dly_reg_D = 0;
  reg ENB_dly_reg_D = 0;
  // log2roundup
  function integer log2roundup (input integer data_value);
      integer width;
      integer cnt;
      begin
         width = 0;
         if (data_value > 1) begin
            for(cnt=1 ; cnt < data_value ; cnt = cnt * 2) begin
               width = width + 1;
            end //loop
         end //if
         log2roundup = width;
      end //log2roundup
   endfunction
  // log2int
  function integer log2int (input integer data_value);
      integer width;
      integer cnt;
      begin
         width = 0;
		 cnt= data_value;
            for(cnt=data_value ; cnt >1 ; cnt = cnt / 2) begin
               width = width + 1;
            end //loop
         log2int = width;
      end //log2int
   endfunction
 // FUNCTION : divroundup
 // Returns the ceiling value of the division
 // Data_value - the quantity to be divided, dividend
 // Divisor - the value to divide the data_value by
  function integer divroundup (input integer data_value,input integer divisor);
      integer div;
      begin
    div   = data_value/divisor;
         if ((data_value % divisor) != 0) begin
      div = div+1;
         end //if
         divroundup = div;
         end //if
   endfunction
  localparam AXI_FULL_MEMORY_SLAVE = ((C_AXI_SLAVE_TYPE == 0 && C_AXI_TYPE == 1)?1:0);
  localparam C_AXI_ADDR_WIDTH_MSB = C_ADDRA_WIDTH+log2roundup(C_WRITE_WIDTH_A/8);
  localparam C_AXI_ADDR_WIDTH     = C_AXI_ADDR_WIDTH_MSB;
  //Data Width        Number of LSB address bits to be discarded
  //1 to 16                      1
  //17 to 32                     2
  //33 to 64                     3
  //65 to 128                    4
  //129 to 256                   5
  //257 to 512                   6
  //513 to 1024                  7
  // The following two constants determine this.
  localparam LOWER_BOUND_VAL = (log2roundup(divroundup(C_WRITE_WIDTH_A,8) == 0))?0:(log2roundup(divroundup(C_WRITE_WIDTH_A,8)));
  localparam C_AXI_ADDR_WIDTH_LSB = ((AXI_FULL_MEMORY_SLAVE == 1)?0:LOWER_BOUND_VAL);
  localparam C_AXI_OS_WR = 2;
 // INPUT REGISTERS.
  generate if (C_HAS_SOFTECC_INPUT_REGS_A==0) begin : no_softecc_input_reg_stage
      always @* begin
      injectsbiterr_in = INJECTSBITERR;
      injectdbiterr_in = INJECTDBITERR;
      rsta_in    = RSTA;
      ena_in     = ENA;
      regcea_in  = REGCEA;
      wea_in     = WEA;
      addra_in   = ADDRA;
      dina_in    = DINA;
      end //end always
      end //end no_softecc_input_reg_stage
 endgenerate
  generate if (C_HAS_SOFTECC_INPUT_REGS_A==1) begin : has_softecc_input_reg_stage
      always @(posedge CLKA) begin
      injectsbiterr_in <= #FLOP_DELAY INJECTSBITERR;
      injectdbiterr_in <= #FLOP_DELAY INJECTDBITERR;
      rsta_in     <= #FLOP_DELAY RSTA;
      ena_in     <= #FLOP_DELAY ENA;
      regcea_in  <= #FLOP_DELAY REGCEA;
      wea_in     <= #FLOP_DELAY WEA;
      addra_in   <= #FLOP_DELAY ADDRA;
      dina_in    <= #FLOP_DELAY DINA;
      end //end always
      end //end input_reg_stages generate statement
 endgenerate
  // NO SAFETY LOGIC
   generate
     if (C_EN_SAFETY_CKT == 0) begin : NO_SAFETY_CKT_GEN
       assign ENA_I_SAFE     = ena_in;
       assign ENB_I_SAFE     = ENB;
       assign RSTA_I_SAFE    = rsta_in;
       assign RSTB_I_SAFE    = RSTB;
     end
   endgenerate
  // SAFETY LOGIC
  // Power-ON Reset Generation
  generate
    if (C_EN_SAFETY_CKT == 1) begin
      always @(posedge clka)  RSTA_SHFT_REG <= #FLOP_DELAY {RSTA_SHFT_REG[3:0],1'b1} ;
      always @(posedge clka)  POR_A <= #FLOP_DELAY RSTA_SHFT_REG[4] ^ RSTA_SHFT_REG[0];
      always @(posedge clkb)  RSTB_SHFT_REG <= #FLOP_DELAY {RSTB_SHFT_REG[3:0],1'b1} ;
      always @(posedge clkb)  POR_B <= #FLOP_DELAY RSTB_SHFT_REG[4] ^ RSTB_SHFT_REG[0];
      assign RSTA_I_SAFE = rsta_in | POR_A;
      assign RSTB_I_SAFE = (C_MEM_TYPE == 0 || C_MEM_TYPE == 3) ? 1'b0 : (RSTB | POR_B);
    end
  endgenerate
  generate
    if ((C_HAS_MEM_OUTPUT_REGS_A==0 || (C_HAS_MEM_OUTPUT_REGS_A==1 && C_RSTRAM_A==1)) && (C_EN_SAFETY_CKT == 1)) begin : RSTA_BUSY_NO_REG
      always @(*) ram_rstram_a_busy = RSTA_I_SAFE | ENA_dly | ENA_dly_D;
      always @(posedge clka) RSTA_BUSY <= #FLOP_DELAY ram_rstram_a_busy;
    end
  endgenerate
  generate
    if (C_HAS_MEM_OUTPUT_REGS_A==1 && C_RSTRAM_A==0 && C_EN_SAFETY_CKT == 1) begin : RSTA_BUSY_WITH_REG
      always @(*) ram_rstreg_a_busy = RSTA_I_SAFE | ENA_dly_reg | ENA_dly_reg_D;
      always @(posedge clka) RSTA_BUSY <= #FLOP_DELAY ram_rstreg_a_busy;
    end
  endgenerate
  generate
    if ( (C_MEM_TYPE == 0 || C_MEM_TYPE == 3) && C_EN_SAFETY_CKT == 1) begin : SPRAM_RST_BUSY
      always @(*) RSTB_BUSY = 1'b0;
    end
  endgenerate
  generate
    if ( (C_HAS_MEM_OUTPUT_REGS_B==0 || (C_HAS_MEM_OUTPUT_REGS_B==1 && C_RSTRAM_B==1)) && (C_MEM_TYPE != 0 && C_MEM_TYPE != 3) && C_EN_SAFETY_CKT == 1)  begin : RSTB_BUSY_NO_REG
      always @(*) ram_rstram_b_busy = RSTB_I_SAFE | ENB_dly | ENB_dly_D;
      always @(posedge clkb) RSTB_BUSY <= #FLOP_DELAY ram_rstram_b_busy;
    end
  endgenerate
  generate
    if (C_HAS_MEM_OUTPUT_REGS_B==1 && C_RSTRAM_B==0 && C_MEM_TYPE != 0 && C_MEM_TYPE != 3 && C_EN_SAFETY_CKT == 1) begin : RSTB_BUSY_WITH_REG
      always @(*) ram_rstreg_b_busy = RSTB_I_SAFE | ENB_dly_reg | ENB_dly_reg_D;
      always @(posedge clkb) RSTB_BUSY <= #FLOP_DELAY ram_rstreg_b_busy;
    end
  endgenerate
  generate
    if ((C_HAS_MEM_OUTPUT_REGS_A==0 || (C_HAS_MEM_OUTPUT_REGS_A==1 && C_RSTRAM_A==1)) && C_EN_SAFETY_CKT == 1) begin : ENA_NO_REG
      always @(posedge clka) begin
        ENA_dly   <= #FLOP_DELAY RSTA_I_SAFE;
        ENA_dly_D <= #FLOP_DELAY ENA_dly;
      end
      assign ENA_I_SAFE = (C_HAS_ENA == 0)? 1'b1 : (ENA_dly_D | ena_in);
    end
  endgenerate
  generate
    if ( (C_HAS_MEM_OUTPUT_REGS_A==1 && C_RSTRAM_A==0) && C_EN_SAFETY_CKT == 1) begin : ENA_WITH_REG
      always @(posedge clka) begin
        ENA_dly_reg   <= #FLOP_DELAY RSTA_I_SAFE;
        ENA_dly_reg_D <= #FLOP_DELAY ENA_dly_reg;
      end
      assign ENA_I_SAFE = (C_HAS_ENA == 0)? 1'b1 : (ENA_dly_reg_D | ena_in);
    end
  endgenerate
  generate
    if (C_MEM_TYPE == 0 || C_MEM_TYPE == 3) begin : SPRAM_ENB
      assign ENB_I_SAFE = 1'b0;
    end
  endgenerate
  generate
    if ((C_HAS_MEM_OUTPUT_REGS_B==0 || (C_HAS_MEM_OUTPUT_REGS_B==1 && C_RSTRAM_B==1)) && C_MEM_TYPE != 0 && C_MEM_TYPE != 3 && C_EN_SAFETY_CKT == 1) begin : ENB_NO_REG
      always @(posedge clkb) begin : PROC_ENB_GEN
        ENB_dly   <= #FLOP_DELAY RSTB_I_SAFE;
        ENB_dly_D <= #FLOP_DELAY ENB_dly;
      end
      assign ENB_I_SAFE = (C_HAS_ENB == 0)? 1'b1 : (ENB_dly_D | ENB);
    end
  endgenerate
  generate
    if (C_HAS_MEM_OUTPUT_REGS_B==1 && C_RSTRAM_B==0 && C_MEM_TYPE != 0 && C_MEM_TYPE != 3 && C_EN_SAFETY_CKT == 1)begin : ENB_WITH_REG
      always @(posedge clkb) begin : PROC_ENB_GEN
        ENB_dly_reg    <= #FLOP_DELAY RSTB_I_SAFE;
        ENB_dly_reg_D  <= #FLOP_DELAY ENB_dly_reg;
      end
      assign ENB_I_SAFE = (C_HAS_ENB == 0)? 1'b1 : (ENB_dly_reg_D | ENB);
    end
  endgenerate
  generate if ((C_INTERFACE_TYPE == 0) && (C_ENABLE_32BIT_ADDRESS == 0)) begin : native_mem_module
blk_mem_gen_v8_3_5_mem_module
  #(.C_CORENAME                        (C_CORENAME),
    .C_FAMILY                          (C_FAMILY),
    .C_XDEVICEFAMILY                   (C_XDEVICEFAMILY),
    .C_MEM_TYPE                        (C_MEM_TYPE),
    .C_BYTE_SIZE                       (C_BYTE_SIZE),
    .C_ALGORITHM                       (C_ALGORITHM),
    .C_USE_BRAM_BLOCK                  (C_USE_BRAM_BLOCK),
    .C_PRIM_TYPE                       (C_PRIM_TYPE),
    .C_LOAD_INIT_FILE                  (C_LOAD_INIT_FILE),
    .C_INIT_FILE_NAME                  (C_INIT_FILE_NAME),
    .C_INIT_FILE                       (C_INIT_FILE),
    .C_USE_DEFAULT_DATA                (C_USE_DEFAULT_DATA),
    .C_DEFAULT_DATA                    (C_DEFAULT_DATA),
    .C_RST_TYPE                        ("SYNC"),
    .C_HAS_RSTA                        (C_HAS_RSTA),
    .C_RST_PRIORITY_A                  (C_RST_PRIORITY_A),
    .C_RSTRAM_A                        (C_RSTRAM_A),
    .C_INITA_VAL                       (C_INITA_VAL),
    .C_HAS_ENA                         (C_HAS_ENA),
    .C_HAS_REGCEA                      (C_HAS_REGCEA),
    .C_USE_BYTE_WEA                    (C_USE_BYTE_WEA),
    .C_WEA_WIDTH                       (C_WEA_WIDTH),
    .C_WRITE_MODE_A                    (C_WRITE_MODE_A),
    .C_WRITE_WIDTH_A                   (C_WRITE_WIDTH_A),
    .C_READ_WIDTH_A                    (C_READ_WIDTH_A),
    .C_WRITE_DEPTH_A                   (C_WRITE_DEPTH_A),
    .C_READ_DEPTH_A                    (C_READ_DEPTH_A),
    .C_ADDRA_WIDTH                     (C_ADDRA_WIDTH),
    .C_HAS_RSTB                        (C_HAS_RSTB),
    .C_RST_PRIORITY_B                  (C_RST_PRIORITY_B),
    .C_RSTRAM_B                        (C_RSTRAM_B),
    .C_INITB_VAL                       (C_INITB_VAL),
    .C_HAS_ENB                         (C_HAS_ENB),
    .C_HAS_REGCEB                      (C_HAS_REGCEB),
    .C_USE_BYTE_WEB                    (C_USE_BYTE_WEB),
    .C_WEB_WIDTH                       (C_WEB_WIDTH),
    .C_WRITE_MODE_B                    (C_WRITE_MODE_B),
    .C_WRITE_WIDTH_B                   (C_WRITE_WIDTH_B),
    .C_READ_WIDTH_B                    (C_READ_WIDTH_B),
    .C_WRITE_DEPTH_B                   (C_WRITE_DEPTH_B),
    .C_READ_DEPTH_B                    (C_READ_DEPTH_B),
    .C_ADDRB_WIDTH                     (C_ADDRB_WIDTH),
    .C_HAS_MEM_OUTPUT_REGS_A           (C_HAS_MEM_OUTPUT_REGS_A),
    .C_HAS_MEM_OUTPUT_REGS_B           (C_HAS_MEM_OUTPUT_REGS_B),
    .C_HAS_MUX_OUTPUT_REGS_A           (C_HAS_MUX_OUTPUT_REGS_A),
    .C_HAS_MUX_OUTPUT_REGS_B           (C_HAS_MUX_OUTPUT_REGS_B),
    .C_HAS_SOFTECC_INPUT_REGS_A        (C_HAS_SOFTECC_INPUT_REGS_A),
    .C_HAS_SOFTECC_OUTPUT_REGS_B       (C_HAS_SOFTECC_OUTPUT_REGS_B),
    .C_MUX_PIPELINE_STAGES             (C_MUX_PIPELINE_STAGES),
    .C_USE_SOFTECC                     (C_USE_SOFTECC),
    .C_USE_ECC                         (C_USE_ECC),
    .C_HAS_INJECTERR                   (C_HAS_INJECTERR),
    .C_SIM_COLLISION_CHECK             (C_SIM_COLLISION_CHECK),
    .C_COMMON_CLK                      (C_COMMON_CLK),
    .FLOP_DELAY                        (FLOP_DELAY),
    .C_DISABLE_WARN_BHV_COLL           (C_DISABLE_WARN_BHV_COLL),
 .C_EN_ECC_PIPE                     (C_EN_ECC_PIPE),
    .C_DISABLE_WARN_BHV_RANGE          (C_DISABLE_WARN_BHV_RANGE))
    blk_mem_gen_v8_3_5_inst
   (.CLKA            (CLKA),
   .RSTA             (RSTA_I_SAFE),//(rsta_in),
   .ENA              (ENA_I_SAFE),//(ena_in),
   .REGCEA           (regcea_in),
   .WEA              (wea_in),
   .ADDRA            (addra_in),
   .DINA             (dina_in),
   .DOUTA            (DOUTA),
   .CLKB             (CLKB),
   .RSTB             (RSTB_I_SAFE),//(RSTB),
   .ENB              (ENB_I_SAFE),//(ENB),
   .REGCEB           (REGCEB),
   .WEB              (WEB),
   .ADDRB            (ADDRB),
   .DINB             (DINB),
   .DOUTB            (DOUTB),
   .INJECTSBITERR    (injectsbiterr_in),
   .INJECTDBITERR    (injectdbiterr_in),
   .ECCPIPECE        (ECCPIPECE),
   .SLEEP            (SLEEP),
   .SBITERR          (SBITERR),
   .DBITERR          (DBITERR),
   .RDADDRECC        (RDADDRECC)
  );
 end
 endgenerate
  generate if((C_INTERFACE_TYPE == 0) && (C_ENABLE_32BIT_ADDRESS == 1)) begin : native_mem_mapped_module
  localparam C_ADDRA_WIDTH_ACTUAL = log2roundup(C_WRITE_DEPTH_A);
  localparam C_ADDRB_WIDTH_ACTUAL = log2roundup(C_WRITE_DEPTH_B);
  localparam C_ADDRA_WIDTH_MSB = C_ADDRA_WIDTH_ACTUAL+log2int(C_WRITE_WIDTH_A/8);
  localparam C_ADDRB_WIDTH_MSB = C_ADDRB_WIDTH_ACTUAL+log2int(C_WRITE_WIDTH_B/8);
 // localparam C_ADDRA_WIDTH_MSB = C_ADDRA_WIDTH_ACTUAL+log2roundup(C_WRITE_WIDTH_A/8);
 // localparam C_ADDRB_WIDTH_MSB = C_ADDRB_WIDTH_ACTUAL+log2roundup(C_WRITE_WIDTH_B/8);
  localparam C_MEM_MAP_ADDRA_WIDTH_MSB     = C_ADDRA_WIDTH_MSB;
  localparam C_MEM_MAP_ADDRB_WIDTH_MSB     = C_ADDRB_WIDTH_MSB;
  // Data Width        Number of LSB address bits to be discarded
  //  1 to 16                      1
  //  17 to 32                     2
  //  33 to 64                     3
  //  65 to 128                    4
  //  129 to 256                   5
  //  257 to 512                   6
  //  513 to 1024                  7
  // The following two constants determine this.
  localparam MEM_MAP_LOWER_BOUND_VAL_A      = (log2int(divroundup(C_WRITE_WIDTH_A,8)==0)) ? 0:(log2int(divroundup(C_WRITE_WIDTH_A,8)));
  localparam MEM_MAP_LOWER_BOUND_VAL_B      = (log2int(divroundup(C_WRITE_WIDTH_A,8)==0)) ? 0:(log2int(divroundup(C_WRITE_WIDTH_A,8)));
  localparam C_MEM_MAP_ADDRA_WIDTH_LSB = MEM_MAP_LOWER_BOUND_VAL_A;
  localparam C_MEM_MAP_ADDRB_WIDTH_LSB = MEM_MAP_LOWER_BOUND_VAL_B;
  wire [C_ADDRB_WIDTH_ACTUAL-1 :0] rdaddrecc_i;
  wire [C_ADDRB_WIDTH-1:C_MEM_MAP_ADDRB_WIDTH_MSB] msb_zero_i;
  wire [C_MEM_MAP_ADDRB_WIDTH_LSB-1:0] lsb_zero_i;
  assign msb_zero_i = 0;
  assign lsb_zero_i = 0;
  assign RDADDRECC  = {msb_zero_i,rdaddrecc_i,lsb_zero_i};
blk_mem_gen_v8_3_5_mem_module
  #(.C_CORENAME                        (C_CORENAME),
    .C_FAMILY                          (C_FAMILY),
    .C_XDEVICEFAMILY                   (C_XDEVICEFAMILY),
    .C_MEM_TYPE                        (C_MEM_TYPE),
    .C_BYTE_SIZE                       (C_BYTE_SIZE),
    .C_USE_BRAM_BLOCK                  (C_USE_BRAM_BLOCK),
    .C_ALGORITHM                       (C_ALGORITHM),
    .C_PRIM_TYPE                       (C_PRIM_TYPE),
    .C_LOAD_INIT_FILE                  (C_LOAD_INIT_FILE),
    .C_INIT_FILE_NAME                  (C_INIT_FILE_NAME),
    .C_INIT_FILE                       (C_INIT_FILE),
    .C_USE_DEFAULT_DATA                (C_USE_DEFAULT_DATA),
    .C_DEFAULT_DATA                    (C_DEFAULT_DATA),
    .C_RST_TYPE                        ("SYNC"),
    .C_HAS_RSTA                        (C_HAS_RSTA),
    .C_RST_PRIORITY_A                  (C_RST_PRIORITY_A),
    .C_RSTRAM_A                        (C_RSTRAM_A),
    .C_INITA_VAL                       (C_INITA_VAL),
    .C_HAS_ENA                         (C_HAS_ENA),
    .C_HAS_REGCEA                      (C_HAS_REGCEA),
    .C_USE_BYTE_WEA                    (C_USE_BYTE_WEA),
    .C_WEA_WIDTH                       (C_WEA_WIDTH),
    .C_WRITE_MODE_A                    (C_WRITE_MODE_A),
    .C_WRITE_WIDTH_A                   (C_WRITE_WIDTH_A),
    .C_READ_WIDTH_A                    (C_READ_WIDTH_A),
    .C_WRITE_DEPTH_A                   (C_WRITE_DEPTH_A),
    .C_READ_DEPTH_A                    (C_READ_DEPTH_A),
    .C_ADDRA_WIDTH                     (C_ADDRA_WIDTH_ACTUAL),
    .C_HAS_RSTB                        (C_HAS_RSTB),
    .C_RST_PRIORITY_B                  (C_RST_PRIORITY_B),
    .C_RSTRAM_B                        (C_RSTRAM_B),
    .C_INITB_VAL                       (C_INITB_VAL),
    .C_HAS_ENB                         (C_HAS_ENB),
    .C_HAS_REGCEB                      (C_HAS_REGCEB),
    .C_USE_BYTE_WEB                    (C_USE_BYTE_WEB),
    .C_WEB_WIDTH                       (C_WEB_WIDTH),
    .C_WRITE_MODE_B                    (C_WRITE_MODE_B),
    .C_WRITE_WIDTH_B                   (C_WRITE_WIDTH_B),
    .C_READ_WIDTH_B                    (C_READ_WIDTH_B),
    .C_WRITE_DEPTH_B                   (C_WRITE_DEPTH_B),
    .C_READ_DEPTH_B                    (C_READ_DEPTH_B),
    .C_ADDRB_WIDTH                     (C_ADDRB_WIDTH_ACTUAL),
    .C_HAS_MEM_OUTPUT_REGS_A           (C_HAS_MEM_OUTPUT_REGS_A),
    .C_HAS_MEM_OUTPUT_REGS_B           (C_HAS_MEM_OUTPUT_REGS_B),
    .C_HAS_MUX_OUTPUT_REGS_A           (C_HAS_MUX_OUTPUT_REGS_A),
    .C_HAS_MUX_OUTPUT_REGS_B           (C_HAS_MUX_OUTPUT_REGS_B),
    .C_HAS_SOFTECC_INPUT_REGS_A        (C_HAS_SOFTECC_INPUT_REGS_A),
    .C_HAS_SOFTECC_OUTPUT_REGS_B       (C_HAS_SOFTECC_OUTPUT_REGS_B),
    .C_MUX_PIPELINE_STAGES             (C_MUX_PIPELINE_STAGES),
    .C_USE_SOFTECC                     (C_USE_SOFTECC),
    .C_USE_ECC                         (C_USE_ECC),
    .C_HAS_INJECTERR                   (C_HAS_INJECTERR),
    .C_SIM_COLLISION_CHECK             (C_SIM_COLLISION_CHECK),
    .C_COMMON_CLK                      (C_COMMON_CLK),
    .FLOP_DELAY                        (FLOP_DELAY),
    .C_DISABLE_WARN_BHV_COLL           (C_DISABLE_WARN_BHV_COLL),
 .C_EN_ECC_PIPE                     (C_EN_ECC_PIPE),
    .C_DISABLE_WARN_BHV_RANGE          (C_DISABLE_WARN_BHV_RANGE))
    blk_mem_gen_v8_3_5_inst
   (.CLKA            (CLKA),
   .RSTA             (RSTA_I_SAFE),//(rsta_in),
   .ENA              (ENA_I_SAFE),//(ena_in),
   .REGCEA           (regcea_in),
   .WEA              (wea_in),
   .ADDRA            (addra_in[C_MEM_MAP_ADDRA_WIDTH_MSB-1:C_MEM_MAP_ADDRA_WIDTH_LSB]),
   .DINA             (dina_in),
   .DOUTA            (DOUTA),
   .CLKB             (CLKB),
   .RSTB             (RSTB_I_SAFE),//(RSTB),
   .ENB              (ENB_I_SAFE),//(ENB),
   .REGCEB           (REGCEB),
   .WEB              (WEB),
   .ADDRB            (ADDRB[C_MEM_MAP_ADDRB_WIDTH_MSB-1:C_MEM_MAP_ADDRB_WIDTH_LSB]),
   .DINB             (DINB),
   .DOUTB            (DOUTB),
   .INJECTSBITERR    (injectsbiterr_in),
   .INJECTDBITERR    (injectdbiterr_in),
   .ECCPIPECE        (ECCPIPECE),
   .SLEEP            (SLEEP),
   .SBITERR          (SBITERR),
   .DBITERR          (DBITERR),
   .RDADDRECC        (rdaddrecc_i)
  );
 end
 endgenerate
  generate if (C_HAS_MEM_OUTPUT_REGS_B == 0 && C_HAS_MUX_OUTPUT_REGS_B == 0 ) begin : no_regs
      assign S_AXI_RDATA    = s_axi_rdata_c;
      assign S_AXI_RLAST    = s_axi_rlast_c;
      assign S_AXI_RVALID   = s_axi_rvalid_c;
      assign S_AXI_RID      = s_axi_rid_c;
      assign S_AXI_RRESP    = s_axi_rresp_c;
      assign s_axi_rready_c = S_AXI_RREADY;
 end
 endgenerate
     generate if (C_HAS_MEM_OUTPUT_REGS_B == 1) begin : has_regceb
        assign regceb_c = s_axi_rvalid_c && s_axi_rready_c;
 end
     endgenerate
     generate if (C_HAS_MEM_OUTPUT_REGS_B == 0) begin : no_regceb
        assign regceb_c = REGCEB;
 end
     endgenerate
     generate if (C_HAS_MUX_OUTPUT_REGS_B == 1) begin : only_core_op_regs
        assign s_axi_payload_c = {s_axi_rid_c,s_axi_rdata_c,s_axi_rresp_c,s_axi_rlast_c};
        assign S_AXI_RID       = m_axi_payload_c[C_AXI_PAYLOAD-1 : C_AXI_PAYLOAD-C_AXI_ID_WIDTH];
        assign S_AXI_RDATA     = m_axi_payload_c[C_AXI_PAYLOAD-C_AXI_ID_WIDTH-1 : C_AXI_PAYLOAD-C_AXI_ID_WIDTH-C_WRITE_WIDTH_B];
        assign S_AXI_RRESP     = m_axi_payload_c[2:1];
        assign S_AXI_RLAST     = m_axi_payload_c[0];
 end
     endgenerate
     generate if (C_HAS_MEM_OUTPUT_REGS_B == 1) begin : only_emb_op_regs
        assign s_axi_payload_c = {s_axi_rid_c,s_axi_rresp_c,s_axi_rlast_c};
        assign S_AXI_RDATA     = s_axi_rdata_c;
        assign S_AXI_RID       = m_axi_payload_c[C_AXI_PAYLOAD-1 : C_AXI_PAYLOAD-C_AXI_ID_WIDTH];
        assign S_AXI_RRESP     = m_axi_payload_c[2:1];
        assign S_AXI_RLAST     = m_axi_payload_c[0];
 end
     endgenerate
  generate if (C_HAS_MUX_OUTPUT_REGS_B == 1 || C_HAS_MEM_OUTPUT_REGS_B == 1) begin : has_regs_fwd
    blk_mem_axi_regs_fwd_v8_3
      #(.C_DATA_WIDTH    (C_AXI_PAYLOAD))
    axi_regs_inst (
        .ACLK           (S_ACLK),
        .ARESET         (s_aresetn_a_c),
        .S_VALID        (s_axi_rvalid_c),
        .S_READY        (s_axi_rready_c),
        .S_PAYLOAD_DATA (s_axi_payload_c),
        .M_VALID        (S_AXI_RVALID),
        .M_READY        (S_AXI_RREADY),
        .M_PAYLOAD_DATA (m_axi_payload_c)
    );
 end
 endgenerate
  generate if (C_INTERFACE_TYPE == 1) begin : axi_mem_module
assign s_aresetn_a_c = !S_ARESETN;
assign S_AXI_BRESP = 2'b00;
assign s_axi_rresp_c = 2'b00;
assign s_axi_arlen_c = (C_AXI_TYPE == 1)?S_AXI_ARLEN:8'h0;
  blk_mem_axi_write_wrapper_beh_v8_3
    #(.C_INTERFACE_TYPE           (C_INTERFACE_TYPE),
      .C_AXI_TYPE                 (C_AXI_TYPE),
      .C_AXI_SLAVE_TYPE           (C_AXI_SLAVE_TYPE),
      .C_MEMORY_TYPE              (C_MEM_TYPE),
      .C_WRITE_DEPTH_A            (C_WRITE_DEPTH_A),
      .C_AXI_AWADDR_WIDTH         ((AXI_FULL_MEMORY_SLAVE == 1)?C_AXI_ADDR_WIDTH:C_AXI_ADDR_WIDTH-C_AXI_ADDR_WIDTH_LSB),
      .C_HAS_AXI_ID               (C_HAS_AXI_ID),
      .C_AXI_ID_WIDTH             (C_AXI_ID_WIDTH),
      .C_ADDRA_WIDTH              (C_ADDRA_WIDTH),
      .C_AXI_WDATA_WIDTH          (C_WRITE_WIDTH_A),
      .C_AXI_OS_WR                (C_AXI_OS_WR))
  axi_wr_fsm (
      // AXI Global Signals
      .S_ACLK                     (S_ACLK),
      .S_ARESETN                  (s_aresetn_a_c),
      // AXI Full/Lite Slave Write interface
      .S_AXI_AWADDR               (S_AXI_AWADDR[C_AXI_ADDR_WIDTH_MSB-1:C_AXI_ADDR_WIDTH_LSB]),
      .S_AXI_AWLEN                (S_AXI_AWLEN),
      .S_AXI_AWID                 (S_AXI_AWID),
      .S_AXI_AWSIZE               (S_AXI_AWSIZE),
      .S_AXI_AWBURST              (S_AXI_AWBURST),
      .S_AXI_AWVALID              (S_AXI_AWVALID),
      .S_AXI_AWREADY              (S_AXI_AWREADY),
      .S_AXI_WVALID               (S_AXI_WVALID),
      .S_AXI_WREADY               (S_AXI_WREADY),
      .S_AXI_BVALID               (S_AXI_BVALID),
      .S_AXI_BREADY               (S_AXI_BREADY),
      .S_AXI_BID                  (S_AXI_BID),
      // Signals for BRAM interfac(
      .S_AXI_AWADDR_OUT           (s_axi_awaddr_out_c),
      .S_AXI_WR_EN                (s_axi_wr_en_c)
      );
  blk_mem_axi_read_wrapper_beh_v8_3
  #(.C_INTERFACE_TYPE             (C_INTERFACE_TYPE),
    .C_AXI_TYPE		          (C_AXI_TYPE),
    .C_AXI_SLAVE_TYPE             (C_AXI_SLAVE_TYPE),
    .C_MEMORY_TYPE                (C_MEM_TYPE),
    .C_WRITE_WIDTH_A              (C_WRITE_WIDTH_A),
    .C_ADDRA_WIDTH                (C_ADDRA_WIDTH),
    .C_AXI_PIPELINE_STAGES        (1),
    .C_AXI_ARADDR_WIDTH	          ((AXI_FULL_MEMORY_SLAVE == 1)?C_AXI_ADDR_WIDTH:C_AXI_ADDR_WIDTH-C_AXI_ADDR_WIDTH_LSB),
    .C_HAS_AXI_ID                 (C_HAS_AXI_ID),
    .C_AXI_ID_WIDTH               (C_AXI_ID_WIDTH),
    .C_ADDRB_WIDTH                (C_ADDRB_WIDTH))
  axi_rd_sm(
    //AXI Global Signals
    .S_ACLK                       (S_ACLK),
    .S_ARESETN                    (s_aresetn_a_c),
    //AXI Full/Lite Read Side
    .S_AXI_ARADDR                 (S_AXI_ARADDR[C_AXI_ADDR_WIDTH_MSB-1:C_AXI_ADDR_WIDTH_LSB]),
    .S_AXI_ARLEN                  (s_axi_arlen_c),
    .S_AXI_ARSIZE                 (S_AXI_ARSIZE),
    .S_AXI_ARBURST                (S_AXI_ARBURST),
    .S_AXI_ARVALID                (S_AXI_ARVALID),
    .S_AXI_ARREADY                (S_AXI_ARREADY),
    .S_AXI_RLAST                  (s_axi_rlast_c),
    .S_AXI_RVALID                 (s_axi_rvalid_c),
    .S_AXI_RREADY                 (s_axi_rready_c),
    .S_AXI_ARID                   (S_AXI_ARID),
    .S_AXI_RID                    (s_axi_rid_c),
    //AXI Full/Lite Read FSM Outputs
    .S_AXI_ARADDR_OUT             (s_axi_araddr_out_c),
    .S_AXI_RD_EN                  (s_axi_rd_en_c)
  );
blk_mem_gen_v8_3_5_mem_module
  #(.C_CORENAME                        (C_CORENAME),
    .C_FAMILY                          (C_FAMILY),
    .C_XDEVICEFAMILY                   (C_XDEVICEFAMILY),
    .C_MEM_TYPE                        (C_MEM_TYPE),
    .C_BYTE_SIZE                       (C_BYTE_SIZE),
    .C_USE_BRAM_BLOCK                  (C_USE_BRAM_BLOCK),
    .C_ALGORITHM                       (C_ALGORITHM),
    .C_PRIM_TYPE                       (C_PRIM_TYPE),
    .C_LOAD_INIT_FILE                  (C_LOAD_INIT_FILE),
    .C_INIT_FILE_NAME                  (C_INIT_FILE_NAME),
    .C_INIT_FILE                       (C_INIT_FILE),
    .C_USE_DEFAULT_DATA                (C_USE_DEFAULT_DATA),
    .C_DEFAULT_DATA                    (C_DEFAULT_DATA),
    .C_RST_TYPE                        ("SYNC"),
    .C_HAS_RSTA                        (C_HAS_RSTA),
    .C_RST_PRIORITY_A                  (C_RST_PRIORITY_A),
    .C_RSTRAM_A                        (C_RSTRAM_A),
    .C_INITA_VAL                       (C_INITA_VAL),
    .C_HAS_ENA                         (1),
    .C_HAS_REGCEA                      (C_HAS_REGCEA),
    .C_USE_BYTE_WEA                    (1),
    .C_WEA_WIDTH                       (C_WEA_WIDTH),
    .C_WRITE_MODE_A                    (C_WRITE_MODE_A),
    .C_WRITE_WIDTH_A                   (C_WRITE_WIDTH_A),
    .C_READ_WIDTH_A                    (C_READ_WIDTH_A),
    .C_WRITE_DEPTH_A                   (C_WRITE_DEPTH_A),
    .C_READ_DEPTH_A                    (C_READ_DEPTH_A),
    .C_ADDRA_WIDTH                     (C_ADDRA_WIDTH),
    .C_HAS_RSTB                        (C_HAS_RSTB),
    .C_RST_PRIORITY_B                  (C_RST_PRIORITY_B),
    .C_RSTRAM_B                        (C_RSTRAM_B),
    .C_INITB_VAL                       (C_INITB_VAL),
    .C_HAS_ENB                         (1),
    .C_HAS_REGCEB                      (C_HAS_MEM_OUTPUT_REGS_B),
    .C_USE_BYTE_WEB                    (1),
    .C_WEB_WIDTH                       (C_WEB_WIDTH),
    .C_WRITE_MODE_B                    (C_WRITE_MODE_B),
    .C_WRITE_WIDTH_B                   (C_WRITE_WIDTH_B),
    .C_READ_WIDTH_B                    (C_READ_WIDTH_B),
    .C_WRITE_DEPTH_B                   (C_WRITE_DEPTH_B),
    .C_READ_DEPTH_B                    (C_READ_DEPTH_B),
    .C_ADDRB_WIDTH                     (C_ADDRB_WIDTH),
    .C_HAS_MEM_OUTPUT_REGS_A           (0),
    .C_HAS_MEM_OUTPUT_REGS_B           (C_HAS_MEM_OUTPUT_REGS_B),
    .C_HAS_MUX_OUTPUT_REGS_A           (0),
    .C_HAS_MUX_OUTPUT_REGS_B           (0),
    .C_HAS_SOFTECC_INPUT_REGS_A        (C_HAS_SOFTECC_INPUT_REGS_A),
    .C_HAS_SOFTECC_OUTPUT_REGS_B       (C_HAS_SOFTECC_OUTPUT_REGS_B),
    .C_MUX_PIPELINE_STAGES             (C_MUX_PIPELINE_STAGES),
    .C_USE_SOFTECC                     (C_USE_SOFTECC),
    .C_USE_ECC                         (C_USE_ECC),
    .C_HAS_INJECTERR                   (C_HAS_INJECTERR),
    .C_SIM_COLLISION_CHECK             (C_SIM_COLLISION_CHECK),
    .C_COMMON_CLK                      (C_COMMON_CLK),
    .FLOP_DELAY                        (FLOP_DELAY),
    .C_DISABLE_WARN_BHV_COLL           (C_DISABLE_WARN_BHV_COLL),
	.C_EN_ECC_PIPE                     (0),
    .C_DISABLE_WARN_BHV_RANGE          (C_DISABLE_WARN_BHV_RANGE))
    blk_mem_gen_v8_3_5_inst
   (.CLKA            (S_ACLK),
   .RSTA             (s_aresetn_a_c),
   .ENA              (s_axi_wr_en_c),
   .REGCEA           (regcea_in),
   .WEA              (S_AXI_WSTRB),
   .ADDRA            (s_axi_awaddr_out_c),
   .DINA             (S_AXI_WDATA),
   .DOUTA            (DOUTA),
   .CLKB             (S_ACLK),
   .RSTB             (s_aresetn_a_c),
   .ENB              (s_axi_rd_en_c),
   .REGCEB           (regceb_c),
   .WEB              (WEB_parameterized),
   .ADDRB            (s_axi_araddr_out_c),
   .DINB             (DINB),
   .DOUTB            (s_axi_rdata_c),
   .INJECTSBITERR    (injectsbiterr_in),
   .INJECTDBITERR    (injectdbiterr_in),
   .SBITERR          (SBITERR),
   .DBITERR          (DBITERR),
   .ECCPIPECE        (1'b0),
   .SLEEP            (1'b0),
   .RDADDRECC        (RDADDRECC)
  );
 end
 endgenerate
endmodule