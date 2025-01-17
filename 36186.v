module pci_userapp (
            // Default PCI userapp ports
            input         FRAMEQ_N,
            input         TRDYQ_N,
            input         IRDYQ_N,
            input         STOPQ_N,
            input         DEVSELQ_N,
            input  [31:0] ADDR,
            inout  [31:0] ADIO,
            input         CFG_VLD,
            input         CFG_HIT,
            output reg    C_TERM,
            output reg    C_READY,
            input         ADDR_VLD,
            input   [7:0] BASE_HIT,
            output reg    S_TERM,
            output reg    S_READY,
            output reg    S_ABORT,
            input         S_WRDN,
            input         S_SRC_EN,
            input         S_DATA_VLD,
            input   [3:0] S_CBE,
            input  [15:0] PCI_CMD,
            output        REQUEST,
            output        REQUESTHOLD,
            output        COMPLETE,
            output        M_WRDN,
            output reg    M_READY,
            input         M_SRC_EN,
            input         M_DATA_VLD,
            output [3:0]   M_CBE,
            input         TIME_OUT,
            output        CFG_SELF,
            input         M_DATA,
            input         DR_BUS,
            input         I_IDLE,
            input         M_ADDR_N,
            input         IDLE,
            input         B_BUSY,
            input         S_DATA,
            input         BACKOFF,
            output        INTR_N,
            input         PERRQ_N,
            input         SERRQ_N,
            output        KEEPOUT,
            input  [39:0] CSR,
            output [31:0] SUB_DATA,
            input [255:0] CFG,
            input         RST,
            input         CLK,
            // Additional ports
            output reg     reg_hit,       // Indicates a hit on the CPCI registers
            output reg     cnet_hit,      // Indicates a hit on the CNET address range
            output reg     reg_we,        // Write enable signal for CPCI registers
            output reg     cnet_we,       // Write enable signal for CNET
            output [`PCI_ADDR_WIDTH-1:0]   pci_addr,      // The address of the current transaction
            output [`PCI_DATA_WIDTH-1:0]   pci_data,      // The current data DWORD
            output         pci_data_vld,  // Indicates data on pci_data is valid
            output [`PCI_BE_WIDTH-1:0]     pci_be,        // Byte enables for current transaction
            output         pci_retry,     // Retry signal from CSRs
            output         pci_fatal,     // Fatal signal from CSRs
            input [`PCI_DATA_WIDTH-1:0]   reg_data,      // Data to be read for registers
            input [`PCI_DATA_WIDTH-1:0]   cnet_data,     // Data to be read for CNET
            input          cnet_retry,    // Generate a retry for CNET
            input          cnet_reprog,   // Is CNET being reprogrammed
            input          reg_vld,       // Is the data on reg_data valid?
            input          cnet_vld,      // Is the data on cnet_data valid?
            input          dma_vld,       // Is the data on dma_data valid?
            input          intr_req,      // Interrupt request
            input          dma_request,   // Transaction request for DMA
            input [`PCI_DATA_WIDTH-1:0] dma_data,      // Data from DMA block
            input [`PCI_BE_WIDTH-1:0]   dma_cbe,       // Command/byte enables for DMA block
            output         dma_data_vld,  // Indicates data should be captured
            output         dma_src_en,    // Next piece of data should be provided
                                          // on dma_data
            input          dma_wrdn,      // Logic high = Write, low = read
            input          dma_complete,  // Complete signal
            output         dma_lat_timeout, // Latency timer has expired
            output         dma_addr_st,   // Indicates that the core is
                                          // currently in the address phase
            output         dma_data_st    // Core in the data state
         );
         // synthesis syn_edif_bit_format = "%u<%i>"
         // synthesis syn_edif_scalar_format = "%u"
         // synthesis syn_noclockbuf = 1
         // synthesis syn_hier = "hard"
/*******************************************************************
// ========================================
// Generate the xxx_hit and xxx_we signals
// ========================================
reg reg_hit_nxt, cnet_hit_nxt;
reg reg_we_nxt, cnet_we_nxt;
reg cnet_hit_d1;
always @(posedge CLK)
begin
   cnet_hit_d1 <= cnet_hit;
end
always @(posedge CLK, posedge RST)
begin
   if (RST)
   begin
      reg_hit <= 1'b0;
      cnet_hit <= 1'b0;
      reg_we <= 1'b0;
      cnet_we <= 1'b0;
   end
   else
   begin
      reg_hit <= reg_hit_nxt;
      cnet_hit <= cnet_hit_nxt;
      reg_we <= reg_we_nxt;
      cnet_we <= cnet_we_nxt;
   end
end
always @*
begin
   // Default to previous values
   reg_hit_nxt = reg_hit;
   reg_we_nxt = reg_we;
   cnet_hit_nxt = cnet_hit;
   cnet_we_nxt = cnet_we;
   // Registers
   // 4MB -- CPCI
   if (BASE_HIT[0] && ADDR[`CPCI_CNET_ADDR_WIDTH-1:22] == 'h0)
   begin
      reg_hit_nxt = 1;
      reg_we_nxt = S_WRDN;
   end
   else if (!S_DATA)
   begin
      reg_hit_nxt = 0;
      reg_we_nxt = 0;
   end
   // CNET
   if (BASE_HIT[0] && ADDR[26:22] != 5'b0)
   begin
      cnet_hit_nxt = 1;
      cnet_we_nxt = S_WRDN;
   end
   else if (!S_DATA)
   begin
      cnet_hit_nxt = 0;
      cnet_we_nxt = 0;
   end
end
// ================================================================
// Generate the pci_addr, pci_data, pci_data_vld and pci_be signals
// ================================================================
assign pci_addr = ADDR;
assign pci_data = ADIO;
assign pci_data_vld = S_DATA_VLD;
assign pci_be = ~S_CBE;
// ================================================================
// Generate the pci_retry and pci_fatal signals
// ================================================================
assign pci_retry = CSR[36];
assign pci_fatal = CSR[39] | CSR[38];
// =================================================
// Generate the ADIO signal (and supporting signals)
// =================================================
wire [`PCI_DATA_WIDTH - 1:0] adio_nxt;
assign oe = (reg_hit && !reg_we && reg_vld) || (cnet_hit && !cnet_we && cnet_vld) || dma_vld;
//assign adio_nxt = reg_hit ? reg_data : (cnet_hit ? cnet_data : dma_data);
assign adio_nxt = (reg_hit & M_ADDR_N) ? reg_data : ((cnet_hit & M_ADDR_N) ? cnet_data : dma_data);
//assign adio_nxt = (/*!I_IDLE ||*/ !M_ADDR_N || (!cnet_hit && !reg_hit)) ? dma_data : (cnet_hit ? cnet_data : reg_data);
//assign adio_nxt = (!I_IDLE) ? dma_data : (cnet_hit ? cnet_data : reg_data);
assign ADIO = oe ? adio_nxt : 'bz;
// ===================================================
// Generate the dma_data_vld, dma_src_en, dma_lat_timeout,
// dma_addr_st and dma_data_st
// ===================================================
assign dma_data_vld = M_DATA_VLD;
assign dma_src_en = M_SRC_EN;
assign dma_lat_timeout = TIME_OUT;
assign dma_addr_st = !M_ADDR_N;
assign dma_data_st = M_DATA;
/*******************************************************************
reg s_ready_nxt;
reg s_term_nxt;
always @(posedge CLK or posedge RST)
begin : cannot_be_optimized_sa
   if (RST) S_ABORT = 1'b1;
   else S_ABORT = 1'b0;
end
always @(posedge CLK or posedge RST)
begin
   if (RST) begin
      S_READY <= 1'b0;
      S_TERM <= 1'b0;
   end
   else begin
      S_READY <= s_ready_nxt;
      S_TERM <= s_term_nxt;
   end
end
always @*
begin
   s_ready_nxt = S_READY;
   s_term_nxt = S_TERM;
   if (RST || CSR[33]) begin
      s_ready_nxt = 1'b0;
      s_term_nxt = 1'b0;
   end
   else if (reg_hit_nxt && !reg_hit ||
            cnet_hit_nxt && !cnet_hit && (cnet_we_nxt || cnet_reprog) ||
            cnet_hit && !cnet_hit_d1) begin
      // Generate a retry if the retry signal is asserted
      s_ready_nxt = reg_hit_nxt | (cnet_hit_nxt & (!cnet_retry | cnet_reprog));
      s_term_nxt = 1'b1;
   end
end
/*******************************************************************
always @(posedge CLK or posedge RST)
begin : cannot_be_optimized_ca
   if (RST) C_READY = 1'b0;
   else C_READY = 1'b1;
end
always @(posedge CLK or posedge RST)
begin : cannot_be_optimized_cb
   if (RST) C_TERM = 1'b0;
   else C_TERM = 1'b1;
end
/*******************************************************************
assign REQUEST = dma_request;
assign REQUESTHOLD = 0;
assign COMPLETE = dma_complete;
assign M_WRDN = dma_wrdn;
assign M_CBE = dma_cbe;
always @(posedge CLK or posedge RST)
begin : cannot_be_optimized_f
   if (RST) M_READY = 1'b0;
   else M_READY = 1'b1;
end
/*******************************************************************
assign INTR_N = ~intr_req;
/*******************************************************************
assign CFG_SELF = 0;
assign KEEPOUT = 1'b0;
assign SUB_DATA = 'h0;
endmodule