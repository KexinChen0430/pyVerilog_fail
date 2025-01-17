module pc_ctrl_axi4_reg_if #(
  parameter DATA_W_IN_BYTES       = 4,
  parameter ADDR_W_IN_BITS        = 32,
  parameter DCADDR_LOW_BIT_W      = 8,
  parameter DCADDR_STROBE_MEM_SEG = 2
) (
   input  wire [(ADDR_W_IN_BITS)-1 : 0]              S_AXI_AWADDR,      // Write channel Protection type. This signal indicates the privilege and security level of the transaction, and whether the transaction is a data access or an instruction access.
   input  wire [2 : 0]                               S_AXI_AWPROT,      // Write address valid. This signal indicates that the master signaling valid write address and control information.
   input  wire                                       S_AXI_AWVALID,     // Write address ready. This signal indicates that the slave is ready    // to accept an address and associated control signals.
   output reg                                        S_AXI_AWREADY=0,   // Write data (issued by master, acceped by Slave)
   input  wire [(DATA_W_IN_BYTES*8) - 1:0]           S_AXI_WDATA,       // Write strobes. This signal indicates which byte lanes hold    // valid data. There is one write strobe bit for each eight    // bits of the write data bus.
   input  wire [DATA_W_IN_BYTES-1 : 0]               S_AXI_WSTRB,       // Write valid. This signal indicates that valid write    // data and strobes are available.
   input  wire                                       S_AXI_WVALID,      // Write ready. This signal indicates that the slave    // can accept the write data.
   output reg                                        S_AXI_WREADY=0,    // Write response. This signal indicates the status    // of the write transaction.
   output reg  [1 : 0]                               S_AXI_BRESP=0,     // Write response valid. This signal indicates that the channel    // is signaling a valid write response.
   output reg                                        S_AXI_BVALID=0,    // Response ready. This signal indicates that the master    // can accept a write response.
   input  wire                                       S_AXI_BREADY,      // Read address (issued by master, acceped by Slave)
   input  wire [(ADDR_W_IN_BITS)-1 : 0]              S_AXI_ARADDR,      // Protection type. This signal indicates the privilege    // and security level of the transaction, and whether the    // transaction is a data access or an instruction access.
   input  wire [2 : 0]                               S_AXI_ARPROT,      // Read address valid. This signal indicates that the channel    // is signaling valid read address and control information.
   input  wire                                       S_AXI_ARVALID,     // Read address ready. This signal indicates that the slave is    // ready to accept an address and associated control signals.
   output reg                                        S_AXI_ARREADY=0,   // Read data (issued by slave)
   output reg  [(DATA_W_IN_BYTES*8) - 1:0]           S_AXI_RDATA=0,     // Read response. This signal indicates the status of the    // read transfer.
   output wire [1 : 0]                               S_AXI_RRESP,       // Read valid. This signal indicates that the channel is signaling the required read data.
   output reg                                        S_AXI_RVALID=0,    // Read ready. This signal indicates that the master can accept the read data and response information.
   input  wire                                       S_AXI_RREADY,      //
   output wire [DCADDR_STROBE_MEM_SEG - 1:0]         reg_bank_rd_start, // read start strobe
   input  wire [DCADDR_STROBE_MEM_SEG - 1:0]         reg_bank_rd_done,  // read done  strobe
   output wire [DCADDR_LOW_BIT_W - 1:0]              reg_bank_rd_addr,  // read address bus
   input  wire [(DATA_W_IN_BYTES*8) - 1:0]           reg_bank_rd_data,  // read data bus
   output wire [(ADDR_W_IN_BITS)-1:DCADDR_LOW_BIT_W] decode_rd_addr,    // used external to the block to select the correct returning data
   output wire [DCADDR_STROBE_MEM_SEG - 1:0]         reg_bank_wr_start, // write start strobe
   input  wire [DCADDR_STROBE_MEM_SEG - 1:0]         reg_bank_wr_done,  // write done  strobe
   output wire [DCADDR_LOW_BIT_W - 1:0]              reg_bank_wr_addr,  // write address bus
   output reg  [(DATA_W_IN_BYTES*8) - 1:0]           reg_bank_wr_data=0,// write data bus
   input  wire                                       ACLK             , // Clock source
   input  wire                                       ARESETn            // Reset source
);
// LocalParams
localparam access_state_idle             = 0; // Idle
localparam access_state_rd_start         = 1; // read started
localparam access_state_rd_wait_complete = 2; // Wait on internal bank completion
localparam access_state_rd_wait_ready    = 3; // Wait on AXI interface completion
localparam access_state_wr_start         = 4; // write started
localparam access_state_wr_wait_complete = 5; // Wait on internal bank completion
localparam access_state_wr_wait_ready    = 6; // Wait on AXI interface completion
// Internal signals
reg  [2:0]                                 access_state=0; // State register for access sequencin
reg                                        start_read  =0; // Strobe indicating a read has started
reg                                        start_write =0; // Strobe indicating a write has started
wire [DCADDR_STROBE_MEM_SEG - 1:0]         read_decode;    // Read strobe bus, one bit for each register bank
wire [DCADDR_STROBE_MEM_SEG - 1:0]         write_decode;   // Write strobe bus, one bit for each register bank
reg  [(ADDR_W_IN_BITS)-1 : 0]              rd_addr=0;      // Keep a full copy of the address as we need the
reg  [(ADDR_W_IN_BITS)-1 : 0]              wr_addr=0;      // to pass to the banks and decode the strobes
// wires to slice the top of the address used to decode the relevant bank
wire [(ADDR_W_IN_BITS)-1:DCADDR_LOW_BIT_W] decode_wr_addr;
// For simplicity everything is marked as OKAY.
assign S_AXI_RRESP = 'd0; // OKAY
// Address Decoding
// Wire bus registered in state process. One for each channel for debug ease
// Could optomise into one.
// Slice the address bus for the block outputs xx_addr are registers
assign reg_bank_rd_addr = rd_addr[DCADDR_LOW_BIT_W -1 : 0];
assign reg_bank_wr_addr = wr_addr[DCADDR_LOW_BIT_W -1 : 0];
assign decode_rd_addr = rd_addr[(ADDR_W_IN_BITS)-1:DCADDR_LOW_BIT_W];
assign decode_wr_addr = wr_addr[(ADDR_W_IN_BITS)-1:DCADDR_LOW_BIT_W];
// This generate loop allows us to generate a variable number of decode strobes
// for the attached banks.
genvar i;
generate
   for (i = 0; i < DCADDR_STROBE_MEM_SEG ; i = i + 1) begin
      // Read decoding logic
      assign read_decode[i] = decode_rd_addr == i;
      // write decoding logic
      assign write_decode[i] = decode_wr_addr == i;
      // Generate the strobes that leave this block to the blank. start_read is registered.
      assign reg_bank_rd_start[i] = start_read & read_decode[i];
      // Generate the strobes that leave this block to the blank. start_read is registered.
      assign reg_bank_wr_start[i] = start_write & write_decode[i];
   end
endgenerate
assign out_of_range_read = start_read & (reg_bank_rd_start=='d0);
assign out_of_range_write = start_write & (reg_bank_wr_start=='d0);
// Data muxing of the returned data must be done external to this block.
// Required signals are provided as outputs. The data from the external block
// must be valid when the corresponding ....xx_rd_done is set.
always @(posedge ACLK) begin
   if (|reg_bank_rd_done) begin
      S_AXI_RDATA <= reg_bank_rd_data;
   end else begin
      S_AXI_RDATA <= S_AXI_RDATA;
   end
end
// SM that controls R/W access. We only allow one action at a time
always @(posedge ACLK) begin
  if(!ARESETn)begin
    access_state       <= access_state_idle;
      start_read         <= 1'd0;
      start_write        <= 1'd0;
    S_AXI_AWREADY      <= 1'd0;
        S_AXI_WREADY       <= 1'd0;
        S_AXI_BVALID       <= 1'd0;
        S_AXI_ARREADY      <= 1'd0;
  end else begin
    access_state       <= access_state;
    // Write
    S_AXI_AWREADY      <= 1'd0; // Should only be high for a cycle
    S_AXI_WREADY       <= 1'd0; // Should only be high for a cycle
    S_AXI_BVALID       <= S_AXI_BVALID; // This signal may need to be held
    start_write        <= 1'd0; // Single pulse signal
    // Read
    S_AXI_ARREADY      <= 1'd0; // Should only be high for a cycle
    start_read         <= 1'd0; // Signal pulse signal
    case(access_state)
    // In idle we can accept reads or writes, but not both at the same time
    // for this controller. We will proritise reads over writes.
    access_state_idle : begin
      S_AXI_RVALID <= 1'd0; // Low until data is Valid
      if(S_AXI_ARVALID) begin
          S_AXI_ARREADY    <= 1'd1;                      // Assert AXI strobe
        access_state     <= access_state_rd_start;     // Read state sequence
        rd_addr          <= S_AXI_ARADDR;              // Lock address for internal use
        start_read       <= 1'd1;                      // Atart the read internally
      end else begin
        if(S_AXI_AWVALID & S_AXI_WVALID) begin
          // we can wait for both signals to be asserted before starting a write. Simplifies logic.
          // the slave can wait for AWVALID or WVALID, or both before asserting AWREADY
          // the slave can wait for AWVALID or WVALID, or both, before asserting WREADY
          access_state     <= access_state_wr_start; // Write state sequence
          wr_addr          <= S_AXI_AWADDR;          // Lock the address & data for internal use
          reg_bank_wr_data <= S_AXI_WDATA;
          S_AXI_AWREADY    <= 1'd1;                  // Assert ready strobes
          S_AXI_WREADY     <= 1'd1;
          start_write      <= 1'd1;                  // Start the write internally
        end
      end
    end
        // READ
    access_state_rd_start : begin
      S_AXI_ARREADY <= 1'd0; // was asserted on leaving idle, clear Address is locked
      if (|reg_bank_rd_done | out_of_range_read) begin
        // Internal bank access is complete
        S_AXI_RVALID <= 1'd1;
        access_state <= access_state_rd_wait_ready;
      end else begin
         access_state <= access_state_rd_wait_complete;
      end
    end
    access_state_rd_wait_complete : begin
            if (|reg_bank_rd_done | out_of_range_read) begin
                S_AXI_RVALID <= 1'd1;
                   access_state <= access_state_rd_wait_ready;
            end
        end
    access_state_rd_wait_ready : begin
           if (S_AXI_RREADY) begin
              S_AXI_RVALID <= 1'd0;
              access_state <= access_state_idle;
           end
        end
        // WRITE
    access_state_wr_start : begin
      S_AXI_AWREADY <= 1'd0;
      S_AXI_WREADY  <= 1'd0;
      if (|reg_bank_wr_done | out_of_range_write) begin
          S_AXI_BVALID <= 1'd1;
        access_state <= access_state_wr_wait_ready;
      end else begin
        access_state <= access_state_wr_wait_complete;
      end
    end
        access_state_wr_wait_complete : begin
          if (|reg_bank_wr_done | out_of_range_write) begin
              S_AXI_BVALID <= 1'd1;
            access_state <= access_state_wr_wait_ready;
          end else begin
            access_state <= access_state_wr_wait_complete;
          end
        end
        access_state_wr_wait_ready : begin
          if (S_AXI_BREADY) begin
              S_AXI_BVALID <= 1'd0;
            access_state <= access_state_idle;
          end
        end
    default : access_state <= access_state;
    endcase
  end
end
// Dependencies
// A3.3.1 AXI4_specification
// http://www.gstitt.ece.ufl.edu/courses/fall15/eel4720_5721/labs/refs/AXI4_specification.pdf
// Dependencies between channel handshake signals
// To prevent a deadlock situation, the dependency rules that exist between the handshake signals must be observed.
// As summarized in Channel signaling requirements on page A3-38, in any transaction:
// the VALID signal of the AXI interface sending information must not be dependent on the READY signal of the AXI interface receiving that information
// an AXI interface that is receiving information can wait until it detects a VALID signal before it asserts its corresponding READY signal.
// Note
// While it is acceptable to wait for VALID to be asserted before asserting READY, it is also acceptable to assert READY before detecting the corresponding VALID. This can result in a more efficient design.
// In addition, there are dependencies between the handshake signals on different channels, and AXI4 defines an additional write response dependency. The following subsections define these dependencies:
// Read transaction dependencies on page A3-41
// Write transaction dependencies on page A3-41
// AXI4 write response dependency on page A3-42. In the dependency diagrams:
//single-headed arrows point to signals that can be asserted before or after the signal at the start of the arrow
//double-headed arrows point to signals that must be asserted only after assertion of the signal at the start of the arrow.
// READ transaction
// ARVALID -------------->> RVALID
//         \             >>        \
//          \           /           \
//           > ARREADY /             > RREADY
//Figure A3-5 shows the read transaction handshake signal dependencies, and shows that, in a read transaction:
// the master must not wait for the slave to assert ARREADY before asserting ARVALID
// the slave can wait for ARVALID to be asserted before it asserts ARREADY
// the slave can assert ARREADY before ARVALID is asserted
// the slave must wait for both ARVALID and ARREADY to be asserted before it asserts RVALID to indicate that valid data is available
// the slave must not wait for the master to assert RREADY before asserting RVALID
// the master can wait for RVALID to be asserted before it asserts RREADY
// the master can assert RREADY before RVALID is asserted.
// WRITE transaction
// AWVALID ---              WVALID ---------------->> BVALID \
//        \   \__________  /      \               />>         \
//         \             \/        \             /             \
//          \            /\         \_>         /               \
//           > AWREADY </  \__________> WREADY /                 \__> BREADY
// Figure A3-6 shows the write transaction handshake signal dependencies, and shows that in a write transaction:
// the master must not wait for the slave to assert AWREADY or WREADY before asserting AWVALID or
// WVALID
// the slave can wait for AWVALID or WVALID, or both before asserting AWREADY
// the slave can assert AWREADY before AWVALID or WVALID, or both, are asserted
// the slave can wait for AWVALID or WVALID, or both, before asserting WREADY
// the slave can assert WREADY before AWVALID or WVALID, or both, are asserted
// the slave must wait for both WVALID and WREADY to be asserted before asserting BVALID
// the slave must also wait for WLAST to be asserted before asserting BVALID, because the write response,
// BRESP, must be signaled only after the last data transfer of a write transaction
// the slave must not wait for the master to assert BREADY before asserting BVALID
// the master can wait for BVALID before asserting BREADY
// the master can assert BREADY before BVALID is asserted.
// ACLK Clock source ARESETn Reset source
// Description
// Global clock signal. See Clock on page A3-36.
// Global reset signal, active LOW. See Reset on page A3-36.
// Signal
// WID
// WDATA WSTRB
// WLAST WUSER
// WVALID WREADY
// Source Description
// Table A2-3 Write data channel signals
// Master Write ID tag. This signal is the ID tag of the write data transfer. Supported only in AXI3. See Transaction ID on page A5-77.
// Master Write data.
// Master Write strobes. This signal indicates which byte lanes hold valid data. There is one write
// strobe bit for each eight bits of the write data bus. See Write strobes on page A3-49. Master Write last. This signal indicates the last transfer in a write burst. See Write data channel
// on page A3-39.
// Master User signal. Optional User-defined signal in the write data channel.
// Supported only in AXI4. See User-defined signaling on page A8-100.
// Master Write valid. This signal indicates that valid write data and strobes are available. See
// Channel handshake signals on page A3-38.
// Slave Write ready. This signal indicates that the slave can accept the write data. See Channel
// handshake signals on page A3-38.
// Signal Source
// RID Slave RDATA Slave
// RRESP Slave RLAST Slave RUSER Slave
// RVALID Slave RREADY Master
// Description
// Table A2-6 Read data channel signals
// Read ID tag. This signal is the identification tag for the read data group of signals generated by the slave. See Transaction ID on page A5-77.
// Read data.
// Read response. This signal indicates the status of the read transfer. See Read and write
// response structure on page A3-54.
// Read last. This signal indicates the last transfer in a read burst. See Read data channel on
// page A3-39.
// User signal. Optional User-defined signal in the read data channel.
// Supported only in AXI4. See User-defined signaling on page A8-100.
// Read valid. This signal indicates that the channel is signaling the required read data. See
// Channel handshake signals on page A3-38.
// Read ready. This signal indicates that the master can accept the read data and response
// information. See Channel handshake signals on page A3-38.
endmodule