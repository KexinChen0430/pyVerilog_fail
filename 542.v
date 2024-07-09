module fifo_generator_v13_1_3_bhv_ver_preload0
  #(
    parameter  C_DOUT_RST_VAL            = "",
    parameter  C_DOUT_WIDTH              = 8,
    parameter  C_HAS_RST                 = 0,
    parameter  C_ENABLE_RST_SYNC         = 0,
    parameter  C_HAS_SRST                = 0,
    parameter  C_USE_EMBEDDED_REG        = 0,
    parameter  C_EN_SAFETY_CKT           = 0,
    parameter  C_USE_DOUT_RST            = 0,
    parameter  C_USE_ECC                 = 0,
    parameter  C_USERVALID_LOW           = 0,
    parameter  C_USERUNDERFLOW_LOW       = 0,
    parameter  C_MEMORY_TYPE             = 0,
    parameter  C_FIFO_TYPE               = 0
  )
  (
    //Inputs
    input                          SAFETY_CKT_RD_RST,
    input                          RD_CLK,
    input                          RD_RST,
    input                          SRST,
    input                          WR_RST_BUSY,
    input                          RD_RST_BUSY,
    input                          RD_EN,
    input                          FIFOEMPTY,
    input       [C_DOUT_WIDTH-1:0] FIFODATA,
    input                          FIFOSBITERR,
    input                          FIFODBITERR,
    //Outputs
    output reg  [C_DOUT_WIDTH-1:0] USERDATA,
    output                         USERVALID,
    output                         USERUNDERFLOW,
    output                         USEREMPTY,
    output                         USERALMOSTEMPTY,
    output                         RAMVALID,
    output                         FIFORDEN,
    output reg                     USERSBITERR,
    output reg                     USERDBITERR,
    output reg                     STAGE2_REG_EN,
    output                         fab_read_data_valid_i_o,
    output                         read_data_valid_i_o,
    output                         ram_valid_i_o,
    output      [1:0]              VALID_STAGES
  );
 //Internal signals
 wire                      preloadstage1;
 wire                      preloadstage2;
 reg                       ram_valid_i;
 reg                       fab_valid;
 reg                       read_data_valid_i;
 reg                       fab_read_data_valid_i;
 reg                       fab_read_data_valid_i_1;
 reg                       ram_valid_i_d;
 reg                       read_data_valid_i_d;
 reg                       fab_read_data_valid_i_d;
 wire                      ram_regout_en;
 reg                       ram_regout_en_d1;
 reg                       ram_regout_en_d2;
 wire                      fab_regout_en;
 wire                      ram_rd_en;
 reg                       empty_i        = 1'b1;
 reg                       empty_sckt     = 1'b1;
 reg                       sckt_rrst_q    = 1'b0;
 reg                       sckt_rrst_done = 1'b0;
 reg                       empty_q        = 1'b1;
 reg                       rd_en_q        = 1'b0;
 reg                       almost_empty_i = 1'b1;
 reg                       almost_empty_q = 1'b1;
 wire                      rd_rst_i;
 wire                      srst_i;
 reg  [C_DOUT_WIDTH-1:0]   userdata_both;
 wire                      uservalid_both;
 wire                      uservalid_one;
 reg                       user_sbiterr_both = 1'b0;
 reg                       user_dbiterr_both = 1'b0;
assign ram_valid_i_o = ram_valid_i;
assign read_data_valid_i_o = read_data_valid_i;
assign fab_read_data_valid_i_o = fab_read_data_valid_i;
/*************************************************************************
   /*************************************************************************
    function [C_DOUT_WIDTH-1:0] hexstr_conv;
    input [(C_DOUT_WIDTH*8)-1:0] def_data;
    integer index,i,j;
    reg [3:0] bin;
    begin
      index = 0;
      hexstr_conv = 'b0;
      for( i=C_DOUT_WIDTH-1; i>=0; i=i-1 )
      begin
        case (def_data[7:0])
          8'b00000000 :
          begin
            bin = 4'b0000;
            i = -1;
          end
          8'b00110000 : bin = 4'b0000;
          8'b00110001 : bin = 4'b0001;
          8'b00110010 : bin = 4'b0010;
          8'b00110011 : bin = 4'b0011;
          8'b00110100 : bin = 4'b0100;
          8'b00110101 : bin = 4'b0101;
          8'b00110110 : bin = 4'b0110;
          8'b00110111 : bin = 4'b0111;
          8'b00111000 : bin = 4'b1000;
          8'b00111001 : bin = 4'b1001;
          8'b01000001 : bin = 4'b1010;
          8'b01000010 : bin = 4'b1011;
          8'b01000011 : bin = 4'b1100;
          8'b01000100 : bin = 4'b1101;
          8'b01000101 : bin = 4'b1110;
          8'b01000110 : bin = 4'b1111;
          8'b01100001 : bin = 4'b1010;
          8'b01100010 : bin = 4'b1011;
          8'b01100011 : bin = 4'b1100;
          8'b01100100 : bin = 4'b1101;
          8'b01100101 : bin = 4'b1110;
          8'b01100110 : bin = 4'b1111;
          default :
          begin
            bin = 4'bx;
          end
        endcase
        for( j=0; j<4; j=j+1)
        begin
          if ((index*4)+j < C_DOUT_WIDTH)
          begin
            hexstr_conv[(index*4)+j] = bin[j];
          end
        end
        index = index + 1;
        def_data = def_data >> 8;
      end
    end
  endfunction
   //  Set power-on states for regs
   initial begin
      ram_valid_i       = 1'b0;
      fab_valid         = 1'b0;
      read_data_valid_i = 1'b0;
      fab_read_data_valid_i = 1'b0;
      fab_read_data_valid_i_1 = 1'b0;
      USERDATA          = hexstr_conv(C_DOUT_RST_VAL);
      userdata_both          = hexstr_conv(C_DOUT_RST_VAL);
      USERSBITERR       = 1'b0;
      USERDBITERR       = 1'b0;
      user_sbiterr_both = 1'b0;
      user_dbiterr_both = 1'b0;
   end //initial
   //  connect up optional reset
   assign rd_rst_i = (C_HAS_RST == 1 || C_ENABLE_RST_SYNC == 0) ? RD_RST : 0;
   assign srst_i = C_EN_SAFETY_CKT ? SAFETY_CKT_RD_RST : C_HAS_SRST ? SRST : 0;
   reg  sckt_rd_rst_fwft = 1'b0;
   reg  fwft_rst_done_i  = 1'b0;
   wire fwft_rst_done;
   assign fwft_rst_done = C_EN_SAFETY_CKT ? fwft_rst_done_i : 1'b1;
   always @ (posedge RD_CLK) begin
     sckt_rd_rst_fwft <= #`TCQ SAFETY_CKT_RD_RST;
   end
   always @ (posedge rd_rst_i or posedge RD_CLK) begin
     if (rd_rst_i)
       fwft_rst_done_i  <= 1'b0;
     else if (sckt_rd_rst_fwft & ~SAFETY_CKT_RD_RST)
       fwft_rst_done_i  <= #`TCQ 1'b1;
   end
   localparam INVALID             = 0;
   localparam STAGE1_VALID        = 2;
   localparam STAGE2_VALID        = 1;
   localparam BOTH_STAGES_VALID   = 3;
   reg  [1:0] curr_fwft_state = INVALID;
   reg  [1:0] next_fwft_state = INVALID;
generate if (C_USE_EMBEDDED_REG < 3 && C_FIFO_TYPE != 2) begin
         always @* begin
         case (curr_fwft_state)
            INVALID: begin
               if (~FIFOEMPTY)
                  next_fwft_state     <= STAGE1_VALID;
               else
                  next_fwft_state     <= INVALID;
               end
            STAGE1_VALID: begin
               if (FIFOEMPTY)
                  next_fwft_state     <= STAGE2_VALID;
               else
                  next_fwft_state     <= BOTH_STAGES_VALID;
               end
            STAGE2_VALID: begin
               if (FIFOEMPTY && RD_EN)
                  next_fwft_state     <= INVALID;
               else if (~FIFOEMPTY && RD_EN)
                  next_fwft_state     <= STAGE1_VALID;
               else if (~FIFOEMPTY && ~RD_EN)
                  next_fwft_state     <= BOTH_STAGES_VALID;
               else
                  next_fwft_state     <= STAGE2_VALID;
               end
            BOTH_STAGES_VALID: begin
               if (FIFOEMPTY && RD_EN)
                  next_fwft_state     <= STAGE2_VALID;
               else if (~FIFOEMPTY && RD_EN)
                  next_fwft_state     <= BOTH_STAGES_VALID;
               else
                  next_fwft_state     <= BOTH_STAGES_VALID;
               end
            default: next_fwft_state     <= INVALID;
         endcase
      end
      always @ (posedge rd_rst_i or posedge RD_CLK) begin
         if (rd_rst_i && C_EN_SAFETY_CKT == 0)
            curr_fwft_state  <= INVALID;
         else if (srst_i)
            curr_fwft_state  <= #`TCQ INVALID;
         else
            curr_fwft_state  <= #`TCQ next_fwft_state;
      end
      always @* begin
         case (curr_fwft_state)
            INVALID:           STAGE2_REG_EN <= 1'b0;
            STAGE1_VALID:      STAGE2_REG_EN <= 1'b1;
            STAGE2_VALID:      STAGE2_REG_EN <= 1'b0;
            BOTH_STAGES_VALID: STAGE2_REG_EN <= RD_EN;
            default:           STAGE2_REG_EN <= 1'b0;
         endcase
      end
    assign VALID_STAGES = curr_fwft_state;
     //  preloadstage2 indicates that stage2 needs to be updated. This is true
     //  whenever read_data_valid is false, and RAM_valid is true.
     assign preloadstage2 = ram_valid_i & (~read_data_valid_i | RD_EN );
     //  preloadstage1 indicates that stage1 needs to be updated. This is true
     //  whenever the RAM has data (RAM_EMPTY is false), and either RAM_Valid is
     //  false (indicating that Stage1 needs updating), or preloadstage2 is active
     //  (indicating that Stage2 is going to update, so Stage1, therefore, must
     //  also be updated to keep it valid.
     assign preloadstage1 = ((~ram_valid_i | preloadstage2) & ~FIFOEMPTY);
     // Calculate RAM_REGOUT_EN
     //  The output registers are controlled by the ram_regout_en signal.
     //  These registers should be updated either when the output in Stage2 is
     //  invalid (preloadstage2), OR when the user is reading, in which case the
     //  Stage2 value will go invalid unless it is replenished.
     assign ram_regout_en = preloadstage2;
     // Calculate RAM_RD_EN
     //   RAM_RD_EN will be asserted whenever the RAM needs to be read in order to
     //  update the value in Stage1.
     //   One case when this happens is when preloadstage1=true, which indicates
     //  that the data in Stage1 or Stage2 is invalid, and needs to automatically
     //  be updated.
     //   The other case is when the user is reading from the FIFO, which
     // guarantees that Stage1 or Stage2 will be invalid on the next clock
     // cycle, unless it is replinished by data from the memory. So, as long
     // as the RAM has data in it, a read of the RAM should occur.
     assign ram_rd_en = (RD_EN & ~FIFOEMPTY) | preloadstage1;
   end
endgenerate // gnll_fifo
   reg curr_state         = 0;
   reg next_state         = 0;
   reg leaving_empty_fwft = 0;
   reg going_empty_fwft   = 0;
   reg empty_i_q          = 0;
   reg ram_rd_en_fwft     = 0;
   generate if (C_FIFO_TYPE == 2) begin : gll_fifo
     always @* begin // FSM fo FWFT
       case (curr_state)
         1'b0: begin
           if (~FIFOEMPTY)
             next_state <= 1'b1;
           else
             next_state <= 1'b0;
           end
         1'b1: begin
           if (FIFOEMPTY && RD_EN)
             next_state <= 1'b0;
           else
             next_state <= 1'b1;
           end
         default: next_state <= 1'b0;
       endcase
     end
     always @ (posedge RD_CLK or posedge rd_rst_i) begin
        if (rd_rst_i) begin
           empty_i       <= 1'b1;
           empty_i_q     <= 1'b1;
           ram_valid_i   <= 1'b0;
        end else if (srst_i) begin
           empty_i       <= #`TCQ 1'b1;
           empty_i_q     <= #`TCQ 1'b1;
           ram_valid_i   <= #`TCQ 1'b0;
        end else begin
           empty_i       <= #`TCQ going_empty_fwft | (~leaving_empty_fwft & empty_i);
           empty_i_q     <= #`TCQ FIFOEMPTY;
           ram_valid_i   <= #`TCQ next_state;
        end
     end //always
     always @ (posedge RD_CLK or posedge rd_rst_i) begin
        if (rd_rst_i && C_EN_SAFETY_CKT == 0) begin
           curr_state    <= 1'b0;
        end else if (srst_i) begin
           curr_state    <= #`TCQ 1'b0;
        end else begin
           curr_state    <= #`TCQ next_state;
        end
     end //always
     wire                  fe_of_empty;
     assign fe_of_empty   = empty_i_q & ~FIFOEMPTY;
     always @* begin // Finding leaving empty
       case (curr_state)
         1'b0:    leaving_empty_fwft <= fe_of_empty;
         1'b1:    leaving_empty_fwft <= 1'b1;
         default: leaving_empty_fwft <= 1'b0;
       endcase
     end
     always @* begin // Finding going empty
       case (curr_state)
         1'b1:    going_empty_fwft <= FIFOEMPTY & RD_EN;
         default: going_empty_fwft <= 1'b0;
       endcase
     end
     always @* begin // Generating FWFT rd_en
       case (curr_state)
         1'b0:    ram_rd_en_fwft <= ~FIFOEMPTY;
         1'b1:    ram_rd_en_fwft <= ~FIFOEMPTY & RD_EN;
         default: ram_rd_en_fwft <= 1'b0;
       endcase
     end
     assign ram_regout_en = ram_rd_en_fwft;
     //assign ram_regout_en_d1 = ram_rd_en_fwft;
     //assign ram_regout_en_d2 = ram_rd_en_fwft;
     assign ram_rd_en     = ram_rd_en_fwft;
   end endgenerate // gll_fifo
   // Calculate RAMVALID_P0_OUT
   //   RAMVALID_P0_OUT indicates that the data in Stage1 is valid.
   //   If the RAM is being read from on this clock cycle (ram_rd_en=1), then
   //   RAMVALID_P0_OUT is certainly going to be true.
   //   If the RAM is not being read from, but the output registers are being
   //   updated to fill Stage2 (ram_regout_en=1), then Stage1 will be emptying,
   //   therefore causing RAMVALID_P0_OUT to be false.
   //   Otherwise, RAMVALID_P0_OUT will remain unchanged.
   // PROCESS regout_valid
   generate if (C_FIFO_TYPE < 2) begin : gnll_fifo_ram_valid
     always @ (posedge RD_CLK or posedge rd_rst_i) begin
        if (rd_rst_i) begin
           // asynchronous reset (active high)
           ram_valid_i     <= #`TCQ 1'b0;
        end else begin
           if (srst_i) begin
              // synchronous reset (active high)
              ram_valid_i     <= #`TCQ 1'b0;
           end else begin
              if (ram_rd_en == 1'b1) begin
                 ram_valid_i   <= #`TCQ 1'b1;
              end else begin
                 if (ram_regout_en == 1'b1)
                   ram_valid_i <= #`TCQ 1'b0;
                 else
                   ram_valid_i <= #`TCQ ram_valid_i;
              end
           end //srst_i
        end //rd_rst_i
     end //always
   end endgenerate // gnll_fifo_ram_valid
   // Calculate READ_DATA_VALID
   //  READ_DATA_VALID indicates whether the value in Stage2 is valid or not.
   //  Stage2 has valid data whenever Stage1 had valid data and
   //  ram_regout_en_i=1, such that the data in Stage1 is propogated
   //  into Stage2.
 generate if(C_USE_EMBEDDED_REG < 3) begin
 always @ (posedge RD_CLK or posedge rd_rst_i) begin
      if (rd_rst_i)
        read_data_valid_i <= #`TCQ 1'b0;
      else if (srst_i)
        read_data_valid_i <= #`TCQ 1'b0;
      else
        read_data_valid_i <= #`TCQ ram_valid_i | (read_data_valid_i & ~RD_EN);
   end //always
end
endgenerate
   // Calculate EMPTY
   //  Defined as the inverse of READ_DATA_VALID
   // Description:
   //  If read_data_valid_i indicates that the output is not valid,
   // and there is no valid data on the output of the ram to preload it
   // with, then we will report empty.
   //  If there is no valid data on the output of the ram and we are
   // reading, then the FIFO will go empty.
   generate if (C_FIFO_TYPE < 2 && C_USE_EMBEDDED_REG < 3) begin : gnll_fifo_empty
     always @ (posedge RD_CLK or posedge rd_rst_i) begin
        if (rd_rst_i) begin
           // asynchronous reset (active high)
           empty_i <= #`TCQ 1'b1;
        end else begin
           if (srst_i) begin
              // synchronous reset (active high)
              empty_i <= #`TCQ 1'b1;
           end else begin
              // rising clock edge
              empty_i <= #`TCQ (~ram_valid_i & ~read_data_valid_i) | (~ram_valid_i & RD_EN);
           end
        end
     end //always
   end endgenerate // gnll_fifo_empty
   // Register RD_EN from user to calculate USERUNDERFLOW.
   // Register empty_i to calculate USERUNDERFLOW.
   always @ (posedge RD_CLK) begin
     rd_en_q <= #`TCQ RD_EN;
     empty_q <= #`TCQ empty_i;
   end //always
   // Calculate user_almost_empty
   //  user_almost_empty is defined such that, unless more words are written
   //  to the FIFO, the next read will cause the FIFO to go EMPTY.
   //  In most cases, whenever the output registers are updated (due to a user
   // read or a preload condition), then user_almost_empty will update to
   // whatever RAM_EMPTY is.
   //  The exception is when the output is valid, the user is not reading, and
   // Stage1 is not empty. In this condition, Stage1 will be preloaded from the
   // memory, so we need to make sure user_almost_empty deasserts properly under
   // this condition.
 generate if ( C_USE_EMBEDDED_REG < 3) begin
  always @ (posedge RD_CLK or posedge rd_rst_i)
     begin
        if (rd_rst_i) begin         // asynchronous reset (active high)
             almost_empty_i <= #`TCQ 1'b1;
             almost_empty_q <= #`TCQ 1'b1;
        end else begin // rising clock edge
           if (srst_i) begin          // synchronous reset (active high)
              almost_empty_i <= #`TCQ 1'b1;
              almost_empty_q <= #`TCQ 1'b1;
           end else begin
              if ((ram_regout_en) | (~FIFOEMPTY & read_data_valid_i & ~RD_EN)) begin
                 almost_empty_i <= #`TCQ FIFOEMPTY;
              end
              almost_empty_q   <= #`TCQ empty_i;
           end
        end
     end //always
end
endgenerate
  // BRAM resets synchronously
 generate
        if (C_EN_SAFETY_CKT==0 && C_USE_EMBEDDED_REG < 3) begin
   always @ ( posedge rd_rst_i)
     begin
        if (rd_rst_i || srst_i) begin
          if (C_USE_DOUT_RST == 1 && C_MEMORY_TYPE < 2)
           @(posedge RD_CLK)
            USERDATA     <= #`TCQ hexstr_conv(C_DOUT_RST_VAL);
        end
     end //always
   always @ (posedge RD_CLK or posedge rd_rst_i)
     begin
        if (rd_rst_i) begin //asynchronous reset (active high)
          if (C_USE_ECC == 0) begin // Reset S/DBITERR only if ECC is OFF
            USERSBITERR    <= #`TCQ 0;
            USERDBITERR    <= #`TCQ 0;
          end
          // DRAM resets asynchronously
          if (C_USE_DOUT_RST == 1 && C_MEMORY_TYPE == 2) begin  //asynchronous reset (active high)
             USERDATA     <= #`TCQ hexstr_conv(C_DOUT_RST_VAL);
        end
        end  else begin // rising clock edge
          if (srst_i) begin
            if (C_USE_ECC == 0) begin // Reset S/DBITERR only if ECC is OFF
              USERSBITERR  <= #`TCQ 0;
              USERDBITERR  <= #`TCQ 0;
            end
            if (C_USE_DOUT_RST == 1) begin
              USERDATA   <= #`TCQ hexstr_conv(C_DOUT_RST_VAL);
          end
          end  else if (fwft_rst_done) begin
            if (ram_regout_en) begin
               USERDATA     <= #`TCQ FIFODATA;
               USERSBITERR  <= #`TCQ FIFOSBITERR;
               USERDBITERR  <= #`TCQ FIFODBITERR;
            end
          end
        end
     end //always
   end   //if
  endgenerate
//safety ckt with one register
generate
       if (C_EN_SAFETY_CKT==1 && C_USE_EMBEDDED_REG < 3) begin
         reg [C_DOUT_WIDTH-1:0]     dout_rst_val_d1;
         reg [C_DOUT_WIDTH-1:0]     dout_rst_val_d2;
         reg [1:0] rst_delayed_sft1              =1;
         reg [1:0] rst_delayed_sft2              =1;
         reg [1:0] rst_delayed_sft3              =1;
         reg [1:0] rst_delayed_sft4              =1;
        always@(posedge RD_CLK)
          begin
          rst_delayed_sft1 <= #`TCQ rd_rst_i;
          rst_delayed_sft2 <= #`TCQ rst_delayed_sft1;
          rst_delayed_sft3 <= #`TCQ rst_delayed_sft2;
          rst_delayed_sft4 <= #`TCQ rst_delayed_sft3;
          end
        always @ (posedge RD_CLK)
     begin
        if (rd_rst_i || srst_i) begin
          if (C_USE_DOUT_RST == 1 && C_MEMORY_TYPE < 2 && rst_delayed_sft1 == 1'b1) begin
            @(posedge RD_CLK)
            USERDATA     <= #`TCQ hexstr_conv(C_DOUT_RST_VAL);
          end
        end
     end //always
   always @ (posedge RD_CLK or posedge rd_rst_i)
     begin
        if (rd_rst_i) begin //asynchronous reset (active high)
          if (C_USE_ECC == 0) begin // Reset S/DBITERR only if ECC is OFF
            USERSBITERR    <= #`TCQ 0;
            USERDBITERR    <= #`TCQ 0;
          end
          // DRAM resets asynchronously
          if (C_USE_DOUT_RST == 1 && C_MEMORY_TYPE == 2)begin  //asynchronous reset (active high)
          //@(posedge RD_CLK)
            USERDATA     <= #`TCQ hexstr_conv(C_DOUT_RST_VAL);
         end
       end
        else begin // rising clock edge
          if (srst_i) begin
            if (C_USE_ECC == 0) begin // Reset S/DBITERR only if ECC is OFF
              USERSBITERR  <= #`TCQ 0;
              USERDBITERR  <= #`TCQ 0;
            end
            if (C_USE_DOUT_RST == 1) begin
            //  @(posedge RD_CLK)
              USERDATA   <= #`TCQ hexstr_conv(C_DOUT_RST_VAL);
          end
          end else if (fwft_rst_done) begin
            if (ram_regout_en == 1'b1 && rd_rst_i == 1'b0) begin
               USERDATA     <= #`TCQ FIFODATA;
               USERSBITERR  <= #`TCQ FIFOSBITERR;
               USERDBITERR  <= #`TCQ FIFODBITERR;
            end
          end
        end
       end //always
  end //if
endgenerate
generate if (C_USE_EMBEDDED_REG == 3 && C_FIFO_TYPE != 2) begin
      always @* begin
         case (curr_fwft_state)
            INVALID: begin
               if (~FIFOEMPTY)
                  next_fwft_state     <= STAGE1_VALID;
               else
                  next_fwft_state     <= INVALID;
               end
            STAGE1_VALID: begin
               if (FIFOEMPTY)
                  next_fwft_state     <= STAGE2_VALID;
               else
                  next_fwft_state     <= BOTH_STAGES_VALID;
               end
            STAGE2_VALID: begin
               if (FIFOEMPTY && RD_EN)
                  next_fwft_state     <= INVALID;
               else if (~FIFOEMPTY && RD_EN)
                  next_fwft_state     <= STAGE1_VALID;
               else if (~FIFOEMPTY && ~RD_EN)
                  next_fwft_state     <= BOTH_STAGES_VALID;
               else
                  next_fwft_state     <= STAGE2_VALID;
               end
            BOTH_STAGES_VALID: begin
               if (FIFOEMPTY && RD_EN)
                  next_fwft_state     <= STAGE2_VALID;
               else if (~FIFOEMPTY && RD_EN)
                  next_fwft_state     <= BOTH_STAGES_VALID;
               else
                  next_fwft_state     <= BOTH_STAGES_VALID;
               end
            default: next_fwft_state     <= INVALID;
         endcase
      end
      always @ (posedge rd_rst_i or posedge RD_CLK) begin
         if (rd_rst_i && C_EN_SAFETY_CKT == 0)
            curr_fwft_state  <= INVALID;
         else if (srst_i)
            curr_fwft_state  <= #`TCQ INVALID;
         else
            curr_fwft_state  <= #`TCQ next_fwft_state;
      end
     always @ (posedge RD_CLK or posedge rd_rst_i) begin : proc_delay
            if (rd_rst_i == 1) begin
                ram_regout_en_d1 <= #`TCQ 1'b0;
            end
            else begin
                 if (srst_i == 1'b1)
                 ram_regout_en_d1 <= #`TCQ 1'b0;
                 else
                 ram_regout_en_d1 <= #`TCQ ram_regout_en;
                 end
            end //always
   //  assign fab_regout_en = ((ram_regout_en_d1 & ~(ram_regout_en_d2) & empty_i) | (RD_EN & !empty_i));
       assign fab_regout_en = ((ram_valid_i == 1'b0 || ram_valid_i == 1'b1) && read_data_valid_i == 1'b1 && fab_read_data_valid_i == 1'b0 )? 1'b1: ((ram_valid_i == 1'b0 || ram_valid_i == 1'b1) && read_data_valid_i == 1'b1 && fab_read_data_valid_i == 1'b1) ? RD_EN : 1'b0;
     always @ (posedge RD_CLK or posedge rd_rst_i) begin : proc_delay1
            if (rd_rst_i == 1) begin
                ram_regout_en_d2 <= #`TCQ 1'b0;
            end
            else begin
                 if (srst_i == 1'b1)
                 ram_regout_en_d2 <= #`TCQ 1'b0;
                 else
                 ram_regout_en_d2 <= #`TCQ ram_regout_en_d1;
                 end
            end //always
      always @* begin
         case (curr_fwft_state)
            INVALID:           STAGE2_REG_EN <= 1'b0;
            STAGE1_VALID:      STAGE2_REG_EN <= 1'b1;
            STAGE2_VALID:      STAGE2_REG_EN <= 1'b0;
            BOTH_STAGES_VALID: STAGE2_REG_EN <= RD_EN;
            default:           STAGE2_REG_EN <= 1'b0;
         endcase
      end
     always @ (posedge RD_CLK) begin
        ram_valid_i_d <= #`TCQ ram_valid_i;
        read_data_valid_i_d <= #`TCQ read_data_valid_i;
        fab_read_data_valid_i_d <= #`TCQ fab_read_data_valid_i;
     end
    assign VALID_STAGES = curr_fwft_state;
     //  preloadstage2 indicates that stage2 needs to be updated. This is true
     //  whenever read_data_valid is false, and RAM_valid is true.
     assign preloadstage2 = ram_valid_i & (~read_data_valid_i | RD_EN );
     //  preloadstage1 indicates that stage1 needs to be updated. This is true
     //  whenever the RAM has data (RAM_EMPTY is false), and either RAM_Valid is
     //  false (indicating that Stage1 needs updating), or preloadstage2 is active
     //  (indicating that Stage2 is going to update, so Stage1, therefore, must
     //  also be updated to keep it valid.
     assign preloadstage1 = ((~ram_valid_i | preloadstage2) & ~FIFOEMPTY);
     // Calculate RAM_REGOUT_EN
     //  The output registers are controlled by the ram_regout_en signal.
     //  These registers should be updated either when the output in Stage2 is
     //  invalid (preloadstage2), OR when the user is reading, in which case the
     //  Stage2 value will go invalid unless it is replenished.
     assign ram_regout_en = (ram_valid_i == 1'b1 && (read_data_valid_i == 1'b0 || fab_read_data_valid_i == 1'b0)) ? 1'b1 : (read_data_valid_i == 1'b1 && fab_read_data_valid_i == 1'b1 && ram_valid_i == 1'b1) ? RD_EN : 1'b0;
     // Calculate RAM_RD_EN
     //   RAM_RD_EN will be asserted whenever the RAM needs to be read in order to
     //  update the value in Stage1.
     //   One case when this happens is when preloadstage1=true, which indicates
     //  that the data in Stage1 or Stage2 is invalid, and needs to automatically
     //  be updated.
     //   The other case is when the user is reading from the FIFO, which
     // guarantees that Stage1 or Stage2 will be invalid on the next clock
     // cycle, unless it is replinished by data from the memory. So, as long
     // as the RAM has data in it, a read of the RAM should occur.
     assign ram_rd_en = ((RD_EN | ~ fab_read_data_valid_i) & ~FIFOEMPTY) | preloadstage1;
   end
   endgenerate // gnll_fifo
   // Calculate RAMVALID_P0_OUT
   //   RAMVALID_P0_OUT indicates that the data in Stage1 is valid.
   //   If the RAM is being read from on this clock cycle (ram_rd_en=1), then
   //   RAMVALID_P0_OUT is certainly going to be true.
   //   If the RAM is not being read from, but the output registers are being
   //   updated to fill Stage2 (ram_regout_en=1), then Stage1 will be emptying,
   //   therefore causing RAMVALID_P0_OUT to be false   //   Otherwise, RAMVALID_P0_OUT will remain unchanged.
   // PROCESS regout_valid
     generate if (C_FIFO_TYPE < 2 && C_USE_EMBEDDED_REG == 3) begin : gnll_fifo_fab_valid
     always @ (posedge RD_CLK or posedge rd_rst_i) begin
        if (rd_rst_i) begin
           // asynchronous reset (active high)
           fab_valid     <= #`TCQ 1'b0;
        end else begin
           if (srst_i) begin
              // synchronous reset (active high)
              fab_valid    <= #`TCQ 1'b0;
           end else begin
              if (ram_regout_en == 1'b1) begin
                 fab_valid  <= #`TCQ 1'b1;
              end else begin
                 if (fab_regout_en == 1'b1)
                   fab_valid <= #`TCQ 1'b0;
                 else
                   fab_valid <= #`TCQ fab_valid;
              end
           end //srst_i
        end //rd_rst_i
     end //always
   end endgenerate // gnll_fifo_fab_valid
   // Calculate READ_DATA_VALID
   //  READ_DATA_VALID indicates whether the value in Stage2 is valid or not.
   //  Stage2 has valid data whenever Stage1 had valid data and
   //  ram_regout_en_i=1, such that the data in Stage1 is propogated
   //  into Stage2.
    generate if(C_USE_EMBEDDED_REG == 3) begin
   always @ (posedge RD_CLK or posedge rd_rst_i) begin
      if (rd_rst_i)
        read_data_valid_i <= #`TCQ 1'b0;
      else if (srst_i)
        read_data_valid_i <= #`TCQ 1'b0;
      else begin
        if (ram_regout_en == 1'b1) begin
          read_data_valid_i <= #`TCQ 1'b1;
        end else begin
         if (fab_regout_en == 1'b1)
          read_data_valid_i <= #`TCQ 1'b0;
        else
          read_data_valid_i <= #`TCQ read_data_valid_i;
        end
      end
   end //always
end
endgenerate
//generate if(C_USE_EMBEDDED_REG == 3) begin
//   always @ (posedge RD_CLK or posedge rd_rst_i) begin
//      if (rd_rst_i)
//        read_data_valid_i <= #`TCQ 1'b0;
//      else if (srst_i)
//        read_data_valid_i <= #`TCQ 1'b0;
//      if (ram_regout_en == 1'b1) begin
//        fab_read_data_valid_i <= #`TCQ 1'b0;
//      end else begin
//       if (fab_regout_en == 1'b1)
//        fab_read_data_valid_i <= #`TCQ 1'b1;
//      else
//        fab_read_data_valid_i <= #`TCQ fab_read_data_valid_i;
//      end
//   end //always
//end
//endgenerate
     generate if(C_USE_EMBEDDED_REG == 3 ) begin
    always @ (posedge RD_CLK or posedge rd_rst_i) begin :fabout_dvalid
      if (rd_rst_i)
        fab_read_data_valid_i <= #`TCQ 1'b0;
      else if (srst_i)
        fab_read_data_valid_i <= #`TCQ 1'b0;
      else
        fab_read_data_valid_i <= #`TCQ fab_valid | (fab_read_data_valid_i & ~RD_EN);
   end //always
end
endgenerate
always @ (posedge RD_CLK ) begin : proc_del1
             begin
                 fab_read_data_valid_i_1 <= #`TCQ fab_read_data_valid_i;
              end
            end //always
   // Calculate EMPTY
   //  Defined as the inverse of READ_DATA_VALID
   // Description:
   //  If read_data_valid_i indicates that the output is not valid,
   // and there is no valid data on the output of the ram to preload it
   // with, then we will report empty.
   //  If there is no valid data on the output of the ram and we are
   // reading, then the FIFO will go empty.
   generate if (C_FIFO_TYPE < 2 && C_USE_EMBEDDED_REG == 3 ) begin : gnll_fifo_empty_both
     always @ (posedge RD_CLK or posedge rd_rst_i) begin
        if (rd_rst_i) begin
           // asynchronous reset (active high)
           empty_i <= #`TCQ 1'b1;
        end else begin
           if (srst_i) begin
              // synchronous reset (active high)
              empty_i <= #`TCQ 1'b1;
           end else begin
              // rising clock edge
              empty_i <= #`TCQ (~fab_valid & ~fab_read_data_valid_i) | (~fab_valid & RD_EN);
           end
        end
     end //always
   end endgenerate // gnll_fifo_empty_both
   // Register RD_EN from user to calculate USERUNDERFLOW.
   // Register empty_i to calculate USERUNDERFLOW.
   always @ (posedge RD_CLK) begin
     rd_en_q <= #`TCQ RD_EN;
     empty_q <= #`TCQ empty_i;
   end //always
   // Calculate user_almost_empty
   //  user_almost_empty is defined such that, unless more words are written
   //  to the FIFO, the next read will cause the FIFO to go EMPTY.
   //  In most cases, whenever the output registers are updated (due to a user
   // read or a preload condition), then user_almost_empty will update to
   // whatever RAM_EMPTY is.
   //  The exception is when the output is valid, the user is not reading, and
   // Stage1 is not empty. In this condition, Stage1 will be preloaded from the
   // memory, so we need to make sure user_almost_empty deasserts properly under
   // this condition.
   reg FIFOEMPTY_1;
   generate if (C_USE_EMBEDDED_REG == 3 ) begin
    always @(posedge RD_CLK) begin
            FIFOEMPTY_1 <= #`TCQ FIFOEMPTY;
           end
    end
endgenerate
    generate if (C_USE_EMBEDDED_REG == 3 ) begin
   always @ (posedge RD_CLK or posedge rd_rst_i)
   begin
      if (rd_rst_i) begin         // asynchronous reset (active high)
           almost_empty_i <= #`TCQ 1'b1;
             almost_empty_q <= #`TCQ 1'b1;
        end else begin // rising clock edge
           if (srst_i) begin          // synchronous reset (active high)
              almost_empty_i <= #`TCQ 1'b1;
              almost_empty_q <= #`TCQ 1'b1;
           end else begin
              if ((fab_regout_en) | (ram_valid_i & fab_read_data_valid_i & ~RD_EN)) begin
                 almost_empty_i <= #`TCQ (~ram_valid_i);
              end
              almost_empty_q   <= #`TCQ empty_i;
           end
        end
     end //always
end
endgenerate
     always @ (posedge RD_CLK or posedge rd_rst_i) begin
        if (rd_rst_i) begin
           empty_sckt <= #`TCQ 1'b1;
           sckt_rrst_q <= #`TCQ 1'b0;
           sckt_rrst_done <= #`TCQ 1'b0;
        end else begin
           sckt_rrst_q <= #`TCQ SAFETY_CKT_RD_RST;
           if (sckt_rrst_q && ~SAFETY_CKT_RD_RST) begin
              sckt_rrst_done <= #`TCQ 1'b1;
           end else if (sckt_rrst_done) begin
              // rising clock edge
              empty_sckt <= #`TCQ 1'b0;
           end
        end
     end //always
//   assign USEREMPTY       = C_EN_SAFETY_CKT ? (sckt_rrst_done ? empty_i : empty_sckt) : empty_i;
   assign USEREMPTY       = empty_i;
   assign USERALMOSTEMPTY = almost_empty_i;
   assign FIFORDEN        = ram_rd_en;
   assign RAMVALID        = (C_USE_EMBEDDED_REG == 3)? fab_valid : ram_valid_i;
   assign uservalid_both       = (C_USERVALID_LOW && C_USE_EMBEDDED_REG == 3)  ? ~fab_read_data_valid_i : ((C_USERVALID_LOW == 0 && C_USE_EMBEDDED_REG == 3) ? fab_read_data_valid_i : 1'b0);
   assign uservalid_one       = (C_USERVALID_LOW && C_USE_EMBEDDED_REG < 3)  ? ~read_data_valid_i :((C_USERVALID_LOW == 0 && C_USE_EMBEDDED_REG < 3) ? read_data_valid_i : 1'b0);
   assign USERVALID = (C_USE_EMBEDDED_REG == 3) ? uservalid_both : uservalid_one;
   assign USERUNDERFLOW   = C_USERUNDERFLOW_LOW ? ~(empty_q & rd_en_q) : empty_q & rd_en_q;
//no safety ckt with both reg
generate
        if (C_EN_SAFETY_CKT==0 && C_USE_EMBEDDED_REG == 3 ) begin
   always @ (posedge RD_CLK)
     begin
        if (rd_rst_i || srst_i) begin
          if (C_USE_DOUT_RST == 1 && C_MEMORY_TYPE < 2)
            USERDATA          <= #`TCQ hexstr_conv(C_DOUT_RST_VAL);
            userdata_both     <= #`TCQ hexstr_conv(C_DOUT_RST_VAL);
            user_sbiterr_both <= #`TCQ 0;
            user_dbiterr_both <= #`TCQ 0;
        end
     end //always
   always @ (posedge RD_CLK or posedge rd_rst_i)
     begin
        if (rd_rst_i) begin //asynchronous reset (active high)
          if (C_USE_ECC == 0) begin // Reset S/DBITERR only if ECC is OFF
            USERSBITERR    <= #`TCQ 0;
            USERDBITERR    <= #`TCQ 0;
            user_sbiterr_both <= #`TCQ 0;
            user_dbiterr_both <= #`TCQ 0;
          end
          // DRAM resets asynchronously
          if (C_USE_DOUT_RST == 1 && C_MEMORY_TYPE == 2) begin  //asynchronous reset (active high)
            USERDATA     <= #`TCQ hexstr_conv(C_DOUT_RST_VAL);
            userdata_both     <= #`TCQ hexstr_conv(C_DOUT_RST_VAL);
            user_sbiterr_both <= #`TCQ 0;
            user_dbiterr_both <= #`TCQ 0;
        end
        end  else begin // rising clock edge
          if (srst_i) begin
            if (C_USE_ECC == 0) begin // Reset S/DBITERR only if ECC is OFF
              USERSBITERR  <= #`TCQ 0;
              USERDBITERR  <= #`TCQ 0;
              user_sbiterr_both <= #`TCQ 0;
              user_dbiterr_both <= #`TCQ 0;
            end
            if (C_USE_DOUT_RST == 1 && C_MEMORY_TYPE == 2) begin
              USERDATA   <= #`TCQ hexstr_conv(C_DOUT_RST_VAL);
              userdata_both   <= #`TCQ hexstr_conv(C_DOUT_RST_VAL);
              user_sbiterr_both <= #`TCQ 0;
              user_dbiterr_both <= #`TCQ 0;
            end
          end else begin
            if (fwft_rst_done) begin
              if (ram_regout_en) begin
                 userdata_both     <= #`TCQ FIFODATA;
                 user_dbiterr_both <= #`TCQ FIFODBITERR;
                 user_sbiterr_both <= #`TCQ FIFOSBITERR;
              end
              if (fab_regout_en) begin
                 USERDATA     <= #`TCQ userdata_both;
                 USERDBITERR  <= #`TCQ user_dbiterr_both;
                 USERSBITERR  <= #`TCQ user_sbiterr_both;
              end
            end
          end
        end
     end //always
   end   //if
  endgenerate
//safety_ckt with both registers
 generate
       if (C_EN_SAFETY_CKT==1 && C_USE_EMBEDDED_REG == 3) begin
         reg [C_DOUT_WIDTH-1:0]     dout_rst_val_d1;
         reg [C_DOUT_WIDTH-1:0]     dout_rst_val_d2;
         reg [1:0] rst_delayed_sft1              =1;
         reg [1:0] rst_delayed_sft2              =1;
         reg [1:0] rst_delayed_sft3              =1;
         reg [1:0] rst_delayed_sft4              =1;
        always@(posedge RD_CLK) begin
          rst_delayed_sft1 <= #`TCQ rd_rst_i;
          rst_delayed_sft2 <= #`TCQ rst_delayed_sft1;
          rst_delayed_sft3 <= #`TCQ rst_delayed_sft2;
          rst_delayed_sft4 <= #`TCQ rst_delayed_sft3;
        end
        always @ (posedge RD_CLK) begin
          if (rd_rst_i || srst_i) begin
            if (C_USE_DOUT_RST == 1 && C_MEMORY_TYPE < 2 && rst_delayed_sft1 == 1'b1) begin
              @(posedge RD_CLK)
              USERDATA     <= #`TCQ hexstr_conv(C_DOUT_RST_VAL);
               userdata_both     <= #`TCQ hexstr_conv(C_DOUT_RST_VAL);
              user_sbiterr_both <= #`TCQ 0;
              user_dbiterr_both <= #`TCQ 0;
            end
          end
        end //always
   always @ (posedge RD_CLK or posedge rd_rst_i) begin
     if (rd_rst_i) begin //asynchronous reset (active high)
       if (C_USE_ECC == 0) begin // Reset S/DBITERR only if ECC is OFF
         USERSBITERR       <= #`TCQ 0;
         USERDBITERR       <= #`TCQ 0;
         user_sbiterr_both <= #`TCQ 0;
         user_dbiterr_both <= #`TCQ 0;
       end
       // DRAM resets asynchronously
       if (C_USE_DOUT_RST == 1 && C_MEMORY_TYPE == 2)begin  //asynchronous reset (active high)
         USERDATA          <= #`TCQ hexstr_conv(C_DOUT_RST_VAL);
         userdata_both     <= #`TCQ hexstr_conv(C_DOUT_RST_VAL);
         user_sbiterr_both <= #`TCQ 0;
         user_dbiterr_both <= #`TCQ 0;
       end
     end else begin // rising clock edge
       if (srst_i) begin
         if (C_USE_ECC == 0) begin // Reset S/DBITERR only if ECC is OFF
           USERSBITERR       <= #`TCQ 0;
           USERDBITERR       <= #`TCQ 0;
           user_sbiterr_both <= #`TCQ 0;
           user_dbiterr_both <= #`TCQ 0;
         end
         if (C_USE_DOUT_RST == 1 && C_MEMORY_TYPE == 2) begin
           USERDATA   <= #`TCQ hexstr_conv(C_DOUT_RST_VAL);
         end
       end else if (fwft_rst_done) begin
         if (ram_regout_en == 1'b1 && rd_rst_i == 1'b0) begin
            userdata_both     <= #`TCQ FIFODATA;
            user_dbiterr_both <= #`TCQ FIFODBITERR;
            user_sbiterr_both <= #`TCQ FIFOSBITERR;
         end
         if (fab_regout_en == 1'b1 && rd_rst_i == 1'b0) begin
            USERDATA          <= #`TCQ userdata_both;
            USERDBITERR       <= #`TCQ user_dbiterr_both;
            USERSBITERR       <= #`TCQ user_sbiterr_both;
         end
       end
     end
   end //always
  end //if
endgenerate
endmodule