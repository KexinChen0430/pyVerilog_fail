module.
   //   1 => FWD_REV   = Both FWD and REV (fully-registered)
   //   2 => FWD       = The master VALID and payload signals are registrated.
   //   3 => REV       = The slave ready signal is registrated
   //   4 => RESERVED (all outputs driven to 0).
   //   5 => RESERVED (all outputs driven to 0).
   //   6 => INPUTS    = Slave and Master side inputs are registrated.
   //   7 => LIGHT_WT  = 1-stage pipeline register with bubble cycle, both FWD and REV pipelining
   )
  (
   // System Signals
   input wire ACLK,
   input wire ARESET,
   // Slave side
   input  wire [C_DATA_WIDTH-1:0] S_PAYLOAD_DATA,
   input  wire S_VALID,
   output wire S_READY,
   // Master side
   output  wire [C_DATA_WIDTH-1:0] M_PAYLOAD_DATA,
   output wire M_VALID,
   input  wire M_READY
   );
  (* use_clock_enable = "yes" *)
  generate
  // C_REG_CONFIG = 0
  // Bypass mode
    if (C_REG_CONFIG == 32'h00000000) begin
      assign M_PAYLOAD_DATA = S_PAYLOAD_DATA;
      assign M_VALID        = S_VALID;
      assign S_READY        = M_READY;
    end
  // C_REG_CONFIG = 1 (or 8)
  // Both FWD and REV mode
    else if ((C_REG_CONFIG == 32'h00000001) || (C_REG_CONFIG == 32'h00000008)) begin
      reg [C_DATA_WIDTH-1:0] m_payload_i;
      reg [C_DATA_WIDTH-1:0] skid_buffer;
      reg                    s_ready_i;
      reg                    m_valid_i;
      assign S_READY = s_ready_i;
      assign M_VALID = m_valid_i;
      assign M_PAYLOAD_DATA = m_payload_i;
      reg [1:0] aresetn_d = 2'b00; // Reset delay shifter
      always @(posedge ACLK) begin
        if (ARESET) begin
          aresetn_d <= 2'b00;
        end else begin
          aresetn_d <= {aresetn_d[0], ~ARESET};
        end
      end
      always @(posedge ACLK) begin
        if (~aresetn_d[0]) begin
          s_ready_i <= 1'b0;
        end else begin
          s_ready_i <= M_READY | ~m_valid_i | (s_ready_i & ~S_VALID);
        end
        if (~aresetn_d[1]) begin
          m_valid_i <= 1'b0;
        end else begin
          m_valid_i <= S_VALID | ~s_ready_i | (m_valid_i & ~M_READY);
        end
        if (M_READY | ~m_valid_i) begin
          m_payload_i <= s_ready_i ? S_PAYLOAD_DATA : skid_buffer;
        end
        if (s_ready_i) begin
          skid_buffer <= S_PAYLOAD_DATA;
        end
      end
    end // if (C_REG_CONFIG == 1)
  // C_REG_CONFIG = 2
  // Only FWD mode
    else if (C_REG_CONFIG == 32'h00000002)
    begin
      reg [C_DATA_WIDTH-1:0] storage_data;
      wire                   s_ready_i; //local signal of output
      reg                    m_valid_i; //local signal of output
      // assign local signal to its output signal
      assign S_READY = s_ready_i;
      assign M_VALID = m_valid_i;
      reg aresetn_d = 1'b0; // Reset delay register
      always @(posedge ACLK) begin
        if (ARESET) begin
          aresetn_d <= 1'b0;
        end else begin
          aresetn_d <= ~ARESET;
        end
      end
      // Save payload data whenever we have a transaction on the slave side
      always @(posedge ACLK)
      begin
        if (S_VALID & s_ready_i)
          storage_data <= S_PAYLOAD_DATA;
      end
      assign M_PAYLOAD_DATA = storage_data;
      // M_Valid set to high when we have a completed transfer on slave side
      // Is removed on a M_READY except if we have a new transfer on the slave side
      always @(posedge ACLK)
      begin
        if (~aresetn_d)
          m_valid_i <= 1'b0;
        else
          if (S_VALID) // Always set m_valid_i when slave side is valid
            m_valid_i <= 1'b1;
          else
            if (M_READY) // Clear (or keep) when no slave side is valid but master side is ready
              m_valid_i <= 1'b0;
      end // always @ (posedge ACLK)
      // Slave Ready is either when Master side drives M_Ready or we have space in our storage data
      assign s_ready_i = (M_READY | ~m_valid_i) & aresetn_d;
    end // if (C_REG_CONFIG == 2)
  // C_REG_CONFIG = 3
  // Only REV mode
    else if (C_REG_CONFIG == 32'h00000003)
    begin
      reg [C_DATA_WIDTH-1:0] storage_data;
      reg                    s_ready_i; //local signal of output
      reg                    has_valid_storage_i;
      reg                    has_valid_storage;
      reg [1:0] aresetn_d = 2'b00; // Reset delay register
      always @(posedge ACLK) begin
        if (ARESET) begin
          aresetn_d <= 2'b00;
        end else begin
          aresetn_d <= {aresetn_d[0], ~ARESET};
        end
      end
      // Save payload data whenever we have a transaction on the slave side
      always @(posedge ACLK)
      begin
        if (S_VALID & s_ready_i)
          storage_data <= S_PAYLOAD_DATA;
      end
      assign M_PAYLOAD_DATA = has_valid_storage?storage_data:S_PAYLOAD_DATA;
      // Need to determine when we need to save a payload
      // Need a combinatorial signals since it will also effect S_READY
      always @ *
      begin
        // Set the value if we have a slave transaction but master side is not ready
        if (S_VALID & s_ready_i & ~M_READY)
          has_valid_storage_i = 1'b1;
        // Clear the value if it's set and Master side completes the transaction but we don't have a new slave side
        // transaction
        else if ( (has_valid_storage == 1) && (M_READY == 1) && ( (S_VALID == 0) || (s_ready_i == 0)))
          has_valid_storage_i = 1'b0;
        else
          has_valid_storage_i = has_valid_storage;
      end // always @ *
      always @(posedge ACLK)
      begin
        if (~aresetn_d[0])
          has_valid_storage <= 1'b0;
        else
          has_valid_storage <= has_valid_storage_i;
      end
      // S_READY is either clocked M_READY or that we have room in local storage
      always @(posedge ACLK)
      begin
        if (~aresetn_d[0])
          s_ready_i <= 1'b0;
        else
          s_ready_i <= M_READY | ~has_valid_storage_i;
      end
      // assign local signal to its output signal
      assign S_READY = s_ready_i;
      // M_READY is either combinatorial S_READY or that we have valid data in local storage
      assign M_VALID = (S_VALID | has_valid_storage) & aresetn_d[1];
    end // if (C_REG_CONFIG == 3)
  // C_REG_CONFIG = 4 or 5 is NO LONGER SUPPORTED
    else if ((C_REG_CONFIG == 32'h00000004) || (C_REG_CONFIG == 32'h00000005))
    begin
// synthesis translate_off
      initial begin
        $display ("ERROR: For axi_register_slice, C_REG_CONFIG = 4 or 5 is RESERVED.");
      end
// synthesis translate_on
      assign M_PAYLOAD_DATA = 0;
      assign M_VALID        = 1'b0;
      assign S_READY        = 1'b0;
    end
  // C_REG_CONFIG = 6
  // INPUTS mode
    else if (C_REG_CONFIG == 32'h00000006)
    begin
      reg [1:0] state;
      reg [1:0] next_state;
      localparam [1:0]
        ZERO = 2'b00,
        ONE  = 2'b01,
        TWO  = 2'b11;
      reg [C_DATA_WIDTH-1:0] storage_data1;
      reg [C_DATA_WIDTH-1:0] storage_data2;
      reg                    s_valid_d;
      reg                    s_ready_d;
      reg                    m_ready_d;
      reg                    m_valid_d;
      reg                    load_s2;
      reg                    sel_s2;
      wire                   new_access;
      wire                   access_done;
      wire                   s_ready_i; //local signal of output
      reg                    s_ready_ii;
      reg                    m_valid_i; //local signal of output
      reg [1:0] aresetn_d = 2'b00; // Reset delay register
      always @(posedge ACLK) begin
        if (ARESET) begin
          aresetn_d <= 2'b00;
        end else begin
          aresetn_d <= {aresetn_d[0], ~ARESET};
        end
      end
      // assign local signal to its output signal
      assign S_READY = s_ready_i;
      assign M_VALID = m_valid_i;
      assign s_ready_i = s_ready_ii & aresetn_d[1];
      // Registrate input control signals
      always @(posedge ACLK)
      begin
        if (~aresetn_d[0]) begin
          s_valid_d <= 1'b0;
          s_ready_d <= 1'b0;
          m_ready_d <= 1'b0;
        end else begin
          s_valid_d <= S_VALID;
          s_ready_d <= s_ready_i;
          m_ready_d <= M_READY;
        end
      end // always @ (posedge ACLK)
      // Load storage1 with slave side payload data when slave side ready is high
      always @(posedge ACLK)
      begin
        if (s_ready_i)
          storage_data1 <= S_PAYLOAD_DATA;
      end
      // Load storage2 with storage data
      always @(posedge ACLK)
      begin
        if (load_s2)
          storage_data2 <= storage_data1;
      end
      always @(posedge ACLK)
      begin
        if (~aresetn_d[0])
          m_valid_d <= 1'b0;
        else
          m_valid_d <= m_valid_i;
      end
      // Local help signals
      assign new_access  = s_ready_d & s_valid_d;
      assign access_done = m_ready_d & m_valid_d;
      // State Machine for handling output signals
      always @*
      begin
        next_state = state; // Stay in the same state unless we need to move to another state
        load_s2   = 0;
        sel_s2    = 0;
        m_valid_i = 0;
        s_ready_ii = 0;
        case (state)
            // No transaction stored locally
            ZERO: begin
              load_s2   = 0;
              sel_s2    = 0;
              m_valid_i = 0;
              s_ready_ii = 1;
              if (new_access) begin
                next_state = ONE; // Got one so move to ONE
                load_s2   = 1;
                m_valid_i = 0;
              end
              else begin
                next_state = next_state;
                load_s2   = load_s2;
                m_valid_i = m_valid_i;
              end
            end // case: ZERO
            // One transaction stored locally
            ONE: begin
              load_s2   = 0;
              sel_s2    = 1;
              m_valid_i = 1;
              s_ready_ii = 1;
              if (~new_access & access_done) begin
                next_state = ZERO; // Read out one so move to ZERO
                m_valid_i = 0;
              end
              else if (new_access & ~access_done) begin
                next_state = TWO;  // Got another one so move to TWO
                s_ready_ii = 0;
              end
              else if (new_access & access_done) begin
                load_s2   = 1;
                sel_s2    = 0;
              end
              else begin
                load_s2   = load_s2;
                sel_s2    = sel_s2;
              end
            end // case: ONE
            // TWO transaction stored locally
            TWO: begin
              load_s2   = 0;
              sel_s2    = 1;
              m_valid_i = 1;
              s_ready_ii = 0;
              if (access_done) begin
                next_state = ONE; // Read out one so move to ONE
                s_ready_ii  = 1;
                load_s2    = 1;
                sel_s2     = 0;
              end
              else begin
                next_state = next_state;
                s_ready_ii  = s_ready_ii;
                load_s2    = load_s2;
                sel_s2     = sel_s2;
              end
            end // case: TWO
        endcase // case (state)
      end // always @ *
      // State Machine for handling output signals
      always @(posedge ACLK)
      begin
        if (~aresetn_d[0])
          state <= ZERO;
        else
          state <= next_state; // Stay in the same state unless we need to move to another state
      end
      // Master Payload mux
      assign M_PAYLOAD_DATA = sel_s2?storage_data2:storage_data1;
    end // if (C_REG_CONFIG == 6)
  // C_REG_CONFIG = 7
  // Light-weight mode.
  // 1-stage pipeline register with bubble cycle, both FWD and REV pipelining
  // Operates same as 1-deep FIFO
    else if (C_REG_CONFIG == 32'h00000007) begin
      reg [C_DATA_WIDTH-1:0] m_payload_i;
      reg                    s_ready_i;
      reg                    m_valid_i;
      assign S_READY = s_ready_i;
      assign M_VALID = m_valid_i;
      assign M_PAYLOAD_DATA = m_payload_i;
      reg [1:0] aresetn_d = 2'b00; // Reset delay shifter
      always @(posedge ACLK) begin
        if (ARESET) begin
          aresetn_d <= 2'b00;
        end else begin
          aresetn_d <= {aresetn_d[0], ~ARESET};
        end
      end
      always @(posedge ACLK) begin
        if (~aresetn_d[0]) begin
          s_ready_i <= 1'b0;
        end else if (~aresetn_d[1]) begin
          s_ready_i <= 1'b1;
        end else begin
          s_ready_i <= m_valid_i ? M_READY : ~S_VALID;
        end
        if (~aresetn_d[1]) begin
          m_valid_i <= 1'b0;
        end else begin
          m_valid_i <= s_ready_i ? S_VALID : ~M_READY;
        end
        if (~m_valid_i) begin
          m_payload_i <= S_PAYLOAD_DATA;
        end
      end
    end // if (C_REG_CONFIG == 7)
    else begin : default_case
      // Passthrough
      assign M_PAYLOAD_DATA = S_PAYLOAD_DATA;
      assign M_VALID        = S_VALID;
      assign S_READY        = M_READY;
    end
  endgenerate
endmodule