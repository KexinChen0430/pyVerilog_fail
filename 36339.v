module oq_regs_generic_reg_grp
   #(
      parameter REG_WIDTH           = `CPCI_NF2_DATA_WIDTH,
      parameter NUM_OUTPUT_QUEUES   = 8,
      parameter NUM_OQ_WIDTH        = log2(NUM_OUTPUT_QUEUES),
      parameter WRITE_WIDTH         = 16,
      parameter ALLOW_NEGATIVE      = 0, // Do we allow negative update values?
      parameter REPLACE_ON_WRITE    = 0  // Setting this replaces the existing value instead of adding on a write
   )
   (
      // "A" channel input/output signals
      input                               rd_a,
      input [NUM_OQ_WIDTH-1:0]            rd_addr_a,
      output [REG_WIDTH-1:0]              rd_data_a,
      input                               wr_a,
      input [NUM_OQ_WIDTH-1:0]            wr_addr_a,
      input [WRITE_WIDTH-1:0]             wr_data_a,
      output reg [REG_WIDTH-1:0]          wr_new_value_a,
      output reg                          wr_done_a,
      // "B" channel input/output signals
      input                               rd_b,
      input [NUM_OQ_WIDTH-1:0]            rd_addr_b,
      output [REG_WIDTH-1:0]              rd_data_b,
      input                               wr_b,
      input [NUM_OQ_WIDTH-1:0]            wr_addr_b,
      input [WRITE_WIDTH-1:0]             wr_data_b,
      output reg [REG_WIDTH-1:0]          wr_new_value_b,
      output reg                          wr_done_b,
      // Register input/output signals
      input                               reg_req,
      output reg                          reg_ack,
      input                               reg_wr,
      input [NUM_OQ_WIDTH-1:0]            reg_addr,
      input [`CPCI_NF2_DATA_WIDTH-1:0]    reg_wr_data,
      output [`CPCI_NF2_DATA_WIDTH-1:0]   reg_rd_data,
      input                               clk,
      input                               reset
   );
   function integer log2;
      input integer number;
      begin
         log2=0;
         while(2**log2<number) begin
            log2=log2+1;
         end
      end
   endfunction // log2
  //`include "NF_2.1_defines.v"
   reg                                 reg_ack_nxt;
   wire                                rd_ab;
   //     Sign extension logic
   wire                                merge_wr_data_sign;
   wire                                held_wr_data_sign_a;
   wire                                held_wr_data_sign_b;
   wire                                merge_wr_data_sign_a;
   wire                                merge_wr_data_sign_b;
   //     "Merge" logic
   reg                                 merge_update;
   wire [WRITE_WIDTH + 1 - 1:0]        wr_data_joint;
   reg [WRITE_WIDTH + 1 - 1:0]         merge_wr_data;
   wire [WRITE_WIDTH - 1:0]            merge_wr_data_a;
   wire [WRITE_WIDTH - 1:0]            merge_wr_data_b;
   //     "A" channel signals
   // Logical signals to indicate whether a read or write should be sent to
   // the RAM
   wire                                read_a;
   wire                                write_a;
   // Read/write addresses
   wire [NUM_OQ_WIDTH-1:0]             read_addr_a;
   wire [NUM_OQ_WIDTH-1:0]             write_addr_a;
   // Value to be written to RAM
   wire [REG_WIDTH-1:0]                curr_data_a;
   wire [REG_WIDTH-1:0]                write_data_a;
   wire [REG_WIDTH-1:0]                curr_plus_new_a;
   reg [REG_WIDTH-1:0]                 curr_plus_new_a_d1;
   wire [REG_WIDTH-1:0]                new_data_a;
   // Held versions of write inputs
   reg                                 held_wr_a;
   reg [NUM_OQ_WIDTH-1:0]              held_wr_addr_a;
   reg [WRITE_WIDTH-1:0]               held_wr_data_a;
   // Should we try to perform a write update in the current cycle?
   reg                                 wr_update_a;
   reg                                 wr_update_a_delayed;
   // Previous write value
   reg [REG_WIDTH-1:0]                 prev_din_a;
   // Should we bypass the read value?
   reg                                 bypass_read_a;
   // RAM access signals
   reg [NUM_OQ_WIDTH-1:0]              ram_addr_a;
   reg                                 ram_we_a;
   reg [REG_WIDTH-1:0]                 ram_din_a;
   wire [REG_WIDTH-1:0]                ram_dout_a;
   //     "B" channel signals
   // Logical signals to indicate whether a read or write should be sent to
   // the RAM
   wire                                read_b;
   wire                                write_b;
   // Read/write addresses
   wire [NUM_OQ_WIDTH-1:0]             read_addr_b;
   wire [NUM_OQ_WIDTH-1:0]             write_addr_b;
   // Value to be written to RAM
   wire [REG_WIDTH-1:0]                curr_data_b;
   wire [REG_WIDTH-1:0]                write_data_b;
   wire [REG_WIDTH-1:0]                curr_plus_new_b;
   reg [REG_WIDTH-1:0]                 curr_plus_new_b_d1;
   wire [REG_WIDTH-1:0]                new_data_b;
   // Held versions of write inputs
   reg                                 held_wr_b;
   reg [NUM_OQ_WIDTH-1:0]              held_wr_addr_b;
   reg [WRITE_WIDTH-1:0]               held_wr_data_b;
   // Should we try to perform a write update in the current cycle?
   reg                                 wr_update_b;
   reg                                 wr_update_b_delayed;
   // Previous write value
   reg [REG_WIDTH-1:0]                 prev_din_b;
   // Should we bypass the read value?
   reg                                 bypass_read_b;
   // RAM access signals
   reg [NUM_OQ_WIDTH-1:0]              ram_addr_b;
   reg                                 ram_we_b;
   reg [REG_WIDTH-1:0]                 ram_din_b;
   wire [REG_WIDTH-1:0]                ram_dout_b;
   //                RAM
   oq_regs_dual_port_ram
   #(
      .REG_WIDTH           (REG_WIDTH),
      .NUM_OUTPUT_QUEUES   (NUM_OUTPUT_QUEUES)
   ) ram (
      .addr_a                             (ram_addr_a),
      .we_a                               (ram_we_a),
      .din_a                              (ram_din_a),
      .dout_a                             (ram_dout_a),
      .clk_a                              (clk),
      .addr_b                             (ram_addr_b),
      .we_b                               (ram_we_b),
      .din_b                              (ram_din_b),
      .dout_b                             (ram_dout_b),
      .clk_b                              (clk)
   );
   assign rd_ab = rd_a || rd_b;
   //     Sign generation
   generate
      if (ALLOW_NEGATIVE) begin : sign_extend
         assign merge_wr_data_sign = merge_wr_data[WRITE_WIDTH];
         assign held_wr_data_sign_a = held_wr_data_a[WRITE_WIDTH-1];
         assign held_wr_data_sign_b = held_wr_data_b[WRITE_WIDTH-1];
         assign merge_wr_data_sign_a = merge_wr_data_a[WRITE_WIDTH-1];
         assign merge_wr_data_sign_b = merge_wr_data_b[WRITE_WIDTH-1];
      end
      else begin
         assign merge_wr_data_sign = 1'b0;
         assign held_wr_data_sign_a = 1'b0;
         assign held_wr_data_sign_b = 1'b0;
         assign merge_wr_data_sign_a = 1'b0;
         assign merge_wr_data_sign_b = 1'b0;
      end
   endgenerate
   //     "A" channel logic
   // Output logic
   assign rd_data_a = ram_dout_a;
   assign reg_rd_data = {{(`CPCI_NF2_DATA_WIDTH-REG_WIDTH){1'b0}}, ram_dout_a};
   always @(posedge clk) begin
      wr_done_a <= write_a;
      wr_new_value_a <= ram_din_a;
      reg_ack <= reg_ack_nxt;
   end
   // RAM read/write signal generation
   always @*
   begin
      // Set defaults
      ram_addr_a = read_addr_a;
      ram_we_a = 1'b0;
      ram_din_a = write_data_a;
      reg_ack_nxt = 1'b0;
      // Work out if there's an incoming request
      if (read_a) begin
         ram_addr_a = read_addr_a;
         ram_we_a = 1'b0;
      end
      else if (write_a) begin
         ram_addr_a = write_addr_a;
         ram_we_a = 1'b1;
         ram_din_a = write_data_a;
      end
      else if (reg_req && !write_b) begin
         // Only perform the read if there are NO other accesses occurring
         // This is to prevent the case of a write update on channel
         // B interfering with this access.
         reg_ack_nxt = 1'b1;
         ram_addr_a = reg_addr;
         ram_we_a = reg_wr;
         ram_din_a = reg_wr_data[REG_WIDTH-1:0];
      end
   end
   // Logic to generate the read/write signals for the A channel
   // and to generate the new values to be written
   // Priority given to reads over writes
   // Calculate the current + new value
   assign curr_plus_new_a = curr_data_a + new_data_a;
   generate
      if (REPLACE_ON_WRITE) begin : replace_on_write_logic_a
         // Work out if we're trying to do a read or a write
         // In replace on write mode only read if we get the read signal
         assign read_a = rd_ab;
         // Only write if we're not doing a read
         assign write_a = (wr_a || held_wr_a) && !rd_ab;
         // Work out the address for the read/write
         assign read_addr_a = rd_addr_a ;
         assign write_addr_a = (held_wr_a ? held_wr_addr_a : wr_addr_a);
         // What data should we write next?
         assign write_data_a = held_wr_a ? held_wr_data_a : wr_data_a;
      end
      else begin
         // Work out if we're trying to do a read or a write
         // Need to do a read on a read signal and in preparation for writes
         assign read_a = rd_ab || wr_a || held_wr_a;
         // Only write if we're not doing a read
         assign write_a = wr_update_a && !rd_ab;
         // Work out the address for the read/write
         assign read_addr_a = rd_ab ? rd_addr_a : (held_wr_a ? held_wr_addr_a : wr_addr_a);
         assign write_addr_a = held_wr_addr_a;
         // What data should we write next?
         assign write_data_a = !wr_update_a_delayed ?
                               curr_plus_new_a :
                               curr_plus_new_a_d1;
      end
   endgenerate
   // New data value value:
   // If we're doing a merged update (writing on both channels to the same
   // address) use the merged new data otherwise use the normal write data
   // Note: Generate statement prevents negative replication amount in case
   // REG_WIDTH and WRITE_WIDTH are the same
   generate
      if (REG_WIDTH == WRITE_WIDTH) begin : new_data_a_generation
         assign new_data_a = merge_update ?  merge_wr_data : held_wr_data_a;
      end
      else begin
         assign new_data_a = merge_update ?
            {{(REG_WIDTH - WRITE_WIDTH - 1){merge_wr_data_sign}}, merge_wr_data} :
            {{(REG_WIDTH - WRITE_WIDTH){held_wr_data_sign_a}}, held_wr_data_a};
      end
   endgenerate
   // State machine to keep track of write status
   // In summary:
   //          Records the address and write data when a write request arrives
   //          (necessary since writes are two step: read then update)
   //          Identifies if a new write request should be delayed (due to a read
   //          at the same time)
   //          Asserted for cycle 2 of the write process. Insructs the RAM
   //          controller to write the updated value back to RAM.
   //          If a read requests arrives in cycle 2 of the write (ie. the update
   //          cycle) then the update should be delayed.
   //          Stored version of the current RAM output plus the write value.
   //          This is used only when a write is interrupted by a read.
   //          (Normally the din to the RAM is dout + write_value. If we
   //          service an unrelated read then the dout of the RAM doesn't
   //          reflect the value in the location we are trying to update)
   always @(posedge clk)
   begin
      if (reset) begin
         held_wr_a <= 1'b0;
         wr_update_a <= 1'b0;
         wr_update_a_delayed <= 1'b0;
         held_wr_addr_a <= 'h0;
         held_wr_data_a <= 'h0;
         curr_plus_new_a_d1 <= 'h0;
      end
      else begin
         // Process a write request
         // Store both the address and the write data value
         if (wr_a) begin
            held_wr_addr_a <= wr_addr_a;
            held_wr_data_a <= wr_data_a;
         end
         // Delay the write request if a read request arrives
         if (rd_ab && wr_a)
            held_wr_a <= 1'b1;
         else
            held_wr_a <= 1'b0;
         // Delay the write update if a read request arrives
         if (rd_ab && wr_update_a) begin
            wr_update_a_delayed <= 1'b1;
            // Make sure we record what the new value should be (if we haven't
            // already)
            if (!wr_update_a_delayed)
               curr_plus_new_a_d1 <= curr_plus_new_a;
         end
         else begin
            wr_update_a_delayed <= 1'b0;
         end
         // Generate the write update signal
         // Either:
         //   a) we just had a write request without a read request
         //   b) we had a wr request and a read request in the previous cycle
         //      (so held_wr_a is asserted)
         //   c) we had a write request in the previous cycle but a read
         //      request arrived during this cycle so we had to delay
         //      the write update
         wr_update_a <= (wr_a && !rd_ab) || held_wr_a || (wr_update_a && rd_ab);
      end
   end
   //     Channel A/Channel B merge logic
   // This logic is only relevant is we receive update requests for both
   // channel A and channel B during the same cycle and the updates are for
   // the same address
   // Calculae the joint write data which is obtained by adding the two values
   // Have to extend by one bit to allow for overflow when the numbers are
   // added
   assign wr_data_joint = {merge_wr_data_sign_a, merge_wr_data_a} +
                        {merge_wr_data_sign_b, merge_wr_data_b};
   assign same_addr = read_addr_a == read_addr_b;
   assign merge_wr_data_a = held_wr_a ? held_wr_data_a : wr_data_a;
   assign merge_wr_data_b = held_wr_b ? held_wr_data_b : wr_data_b;
   always @(posedge clk)
   begin
      if (reset) begin
         merge_update <= 1'b0;
         merge_wr_data <= 'h0;
      end
      else begin
         // We can merge the updates if both channels are doing the read in
         // preparation of a write and the the addresses are the same
         if (!rd_ab &&
             (wr_a || held_wr_a) && (wr_b || held_wr_b) &&
             same_addr) begin
            merge_update  <= 1'b1;
            merge_wr_data <= wr_data_joint;
         end
         else
            // The merge_update signal should be reset except when a read is
            // happening (since the write will be delayed)
            merge_update <= merge_update && rd_ab;
      end
   end
   //     Bypass logic
   // Current value calculation:
   // If Channel X just wrote to address ABC and Channel Y just read from
   // address ABC then use the value that was just written.
   assign curr_data_a = bypass_read_a ? prev_din_b : ram_dout_a;
   assign curr_data_b = bypass_read_b ? prev_din_a : ram_dout_b;
   always @(posedge clk) begin
      prev_din_a <= ram_din_a;
      prev_din_b <= ram_din_b;
      // Bypass the read if the read was to the same address as
      // a write on the other channel.
      // Note: Thr wr_a/held_wr_a signals actually cause a read to get the
      // current value
      bypass_read_a <= (wr_a || held_wr_a) && ram_we_b &&
                       ram_addr_a == ram_addr_b;
      bypass_read_b <= (wr_b || held_wr_b) && ram_we_a &&
                       ram_addr_b == ram_addr_a;
   end
   //     "B" channel logic
   // Output logic
   assign rd_data_b = ram_dout_b;
   always @(posedge clk) begin
      wr_done_b <= write_b;
      wr_new_value_b = ram_din_b;
   end
   // RAM read/write signal generation
   always @*
   begin
      // Set defaults
      ram_addr_b = read_addr_b;
      ram_we_b = 1'b0;
      ram_din_b = write_data_b;
      // Work out if there's an incoming request
      if (read_b) begin
         ram_addr_b = read_addr_b;
         ram_we_b = 1'b0;
      end
      else if (write_b) begin
         ram_addr_b = write_addr_b;
         ram_we_b = 1'b1;
         ram_din_b = write_data_b;
      end
      else if (reg_req) begin
         // No register processing in the B channel
      end
   end
   // Logic to generate the read/update signals for the B channel
   // Priority given to reads over writes
   // Current value + the new value
   assign curr_plus_new_b = curr_data_b + new_data_b;
   generate
      if (REPLACE_ON_WRITE) begin : write_data_b_calculation
         // Work out if we're trying to do a read or a write
         // In replace on write mode only read if we get the read signal
         assign read_b = rd_ab;
         // Only write if we're not doing a read
         assign write_b = (wr_b || held_wr_b) && !rd_ab;
         // Work out the address for the read/write
         assign read_addr_b = rd_addr_b;
         assign write_addr_b = (held_wr_b ? held_wr_addr_b : wr_addr_b);
         // What data should we write next?
         assign write_data_b = held_wr_b ? held_wr_data_b : wr_data_b;
      end
      else begin
         // Work out if we're trying to do a read or a write
         // Need to do a read on a read signal of in preparation for the write
         assign read_b = rd_ab || wr_b || held_wr_b;
         // Only write if we're not doing a read (and assuuming the the update
         // hasn't been merged into channel A)
         assign write_b = wr_update_b && !rd_ab && !merge_update;
         // Work out the address for the read/write
         assign read_addr_b = rd_ab ? rd_addr_b : (held_wr_b ? held_wr_addr_b : wr_addr_b);
         assign write_addr_b = held_wr_addr_b;
               // What data should we write next?
         assign write_data_b = !wr_update_b_delayed ?
                               curr_plus_new_b :
                               curr_plus_new_b_d1;
      end
   endgenerate
   // Current write data value:
   assign new_data_b =
      {{(REG_WIDTH - WRITE_WIDTH){held_wr_data_sign_b}}, held_wr_data_b};
   // State machine to keep track of write status
   // In summary:
   //          Records the address and write data when a write request arrives
   //          (necessary since writes are two step: read then update)
   //          Identifies if a new write request should be delayed (due to a read
   //          at the same time)
   //          Asserted for cycle 2 of the write process. Insructs the RAM
   //          controller to write the updated value back to RAM.
   //          If a read requests arrives in cycle 2 of the write (ie. the update
   //          cycle) then the update should be delayed.
   //          Stored version of the current RAM output plus the write value.
   //          This is used only when a write is interrupted by a read.
   //          (Normally the din to the RAM is dout + write_value. If we
   //          service an unrelated read then the dout of the RAM doesn't
   //          reflect the value in the location we are trying to update)
   always @(posedge clk)
   begin
      if (reset) begin
         held_wr_b <= 1'b0;
         wr_update_b <= 1'b0;
         wr_update_b_delayed <= 1'b0;
         held_wr_addr_b <= 'h0;
         held_wr_data_b <= 'h0;
         curr_plus_new_b_d1 <= 'h0;
      end
      else begin
         // Process a write request
         // Store both the address and the write data value
         if (wr_b) begin
            held_wr_addr_b <= wr_addr_b;
            held_wr_data_b <= wr_data_b;
         end
         // Delay the write request if a read request arrives
         if (rd_ab && wr_b)
            held_wr_b <= 1'b1;
         else
            held_wr_b <= 1'b0;
         // Delay the write update if a read request arrives
         if (rd_ab && wr_update_b) begin
            wr_update_b_delayed <= 1'b1;
            // Make sure we record what the new value should be (if we haven't
            // already)
            if (!wr_update_b_delayed)
               curr_plus_new_b_d1 <= curr_plus_new_b;
         end
         else begin
            wr_update_b_delayed <= 1'b0;
         end
         // Generate the write update signal
         // Either:
         //   a) we just had a write request without a read request
         //   b) we had a wr request and a read request in the previous cycle
         //      (so held_wr_b is asserted)
         //   c) we had a write request in the previous cycle but a read
         //      request arrived during this cycle so we had to delay
         //      the write update
         wr_update_b <= (wr_b && !rd_ab) || held_wr_b || (wr_update_b && rd_ab);
      end
   end
endmodule