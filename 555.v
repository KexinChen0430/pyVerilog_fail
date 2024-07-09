module axi_crossbar_v2_1_addr_decoder #
  (
   parameter         C_FAMILY          = "none",
   parameter integer C_NUM_TARGETS     = 2,  // Number of decode targets = [1:16]
   parameter integer C_NUM_TARGETS_LOG = 1,  // Log2(C_NUM_TARGETS)
   parameter integer C_NUM_RANGES      = 1, // Number of alternative ranges that
                                             //    can match each target [1:16]
   parameter integer C_ADDR_WIDTH      = 32, // Width of decoder operand and of
                                             //   each base and high address [2:64]
   parameter integer C_TARGET_ENC      = 0,  // Enable encoded target output
   parameter integer C_TARGET_HOT      = 1,  // Enable 1-hot target output
   parameter integer C_REGION_ENC      = 0,   // Enable REGION output
   parameter [C_NUM_TARGETS*C_NUM_RANGES*64-1:0] C_BASE_ADDR = {C_NUM_TARGETS*C_NUM_RANGES*64{1'b1}},
   parameter [C_NUM_TARGETS*C_NUM_RANGES*64-1:0] C_HIGH_ADDR = {C_NUM_TARGETS*C_NUM_RANGES*64{1'b0}},
   parameter [C_NUM_TARGETS:0]    C_TARGET_QUAL                 = {C_NUM_TARGETS{1'b1}},
                       // Indicates whether each target has connectivity.
                       // Format: C_NUM_TARGETS{Bit1}.
   parameter integer   C_RESOLUTION                 = 0,
                       // Number of low-order ADDR bits that can be ignored when decoding.
   parameter integer   C_COMPARATOR_THRESHOLD       = 6
                       // Number of decoded ADDR bits above which will implement comparator_static.
   )
  (
   input  wire [C_ADDR_WIDTH-1:0]      ADDR,        // Decoder input operand
   output wire [C_NUM_TARGETS-1:0]     TARGET_HOT,  // Target matching address (1-hot)
   output wire [C_NUM_TARGETS_LOG-1:0] TARGET_ENC,  // Target matching address (encoded)
   output wire                         MATCH,       // Decode successful
   output wire [3:0]                   REGION      // Range within target matching address (encoded)
   );
  // Variables for generating parameter controlled instances.
  genvar target_cnt;
  genvar region_cnt;
  // Function to detect addrs is in the addressable range.
  // Only compare 4KB page address (ignore low-order 12 bits)
  function  decode_address;
    input [C_ADDR_WIDTH-1:0] base, high, addr;
    reg   [C_ADDR_WIDTH-C_RESOLUTION-1:0] mask;
    reg   [C_ADDR_WIDTH-C_RESOLUTION-1:0] addr_page;
    reg   [C_ADDR_WIDTH-C_RESOLUTION-1:0] base_page;
    reg   [C_ADDR_WIDTH-C_RESOLUTION-1:0] high_page;
  begin
    addr_page = addr[C_RESOLUTION+:C_ADDR_WIDTH-C_RESOLUTION];
    base_page = base[C_RESOLUTION+:C_ADDR_WIDTH-C_RESOLUTION];
    high_page = high[C_RESOLUTION+:C_ADDR_WIDTH-C_RESOLUTION];
    if (base[C_ADDR_WIDTH-1] & ~high[C_ADDR_WIDTH-1]) begin
      decode_address = 1'b0;
    end else begin
      mask  = base_page ^ high_page;
      if ( (base_page & ~mask) == (addr_page & ~mask) ) begin
        decode_address = 1'b1;
      end else begin
        decode_address = 1'b0;
      end
    end
  end
  endfunction
  // Generates a binary coded from onehotone encoded
  function [3:0] f_hot2enc
    (
      input [15:0]  one_hot
    );
    begin
      f_hot2enc[0] = |(one_hot & 16'b1010101010101010);
      f_hot2enc[1] = |(one_hot & 16'b1100110011001100);
      f_hot2enc[2] = |(one_hot & 16'b1111000011110000);
      f_hot2enc[3] = |(one_hot & 16'b1111111100000000);
    end
  endfunction
  // Internal signals
  wire [C_NUM_TARGETS-1:0]              TARGET_HOT_I;     // Target matching address (1-hot).
  wire [C_NUM_TARGETS*C_NUM_RANGES-1:0] ADDRESS_HIT;      // For address hit (1-hot).
  wire [C_NUM_TARGETS*C_NUM_RANGES-1:0] ADDRESS_HIT_REG;  // For address hit (1-hot).
  wire [C_NUM_RANGES-1:0]               REGION_HOT;       // Reginon matching address (1-hot).
  wire [3:0]                            TARGET_ENC_I;     // Internal version of encoded hit.
  // Generate detection per region per target.
  generate
    for (target_cnt = 0; target_cnt < C_NUM_TARGETS; target_cnt = target_cnt + 1) begin : gen_target
      for (region_cnt = 0; region_cnt < C_NUM_RANGES; region_cnt = region_cnt + 1) begin : gen_region
        // Detect if this is an address hit (including used region decoding).
        if ((C_ADDR_WIDTH - C_RESOLUTION) > C_COMPARATOR_THRESHOLD) begin : gen_comparator_static
          if (C_TARGET_QUAL[target_cnt] &&
              ((C_BASE_ADDR[(target_cnt*C_NUM_RANGES+region_cnt)*64 +: C_ADDR_WIDTH] == 0) ||
               (C_HIGH_ADDR[(target_cnt*C_NUM_RANGES+region_cnt)*64 +: C_ADDR_WIDTH] != 0))) begin : gen_addr_range
            generic_baseblocks_v2_1_comparator_static #
            (
            .C_FAMILY("rtl"),
            .C_VALUE(C_BASE_ADDR[(target_cnt*C_NUM_RANGES+region_cnt)*64+C_RESOLUTION +: C_ADDR_WIDTH-C_RESOLUTION]),
            .C_DATA_WIDTH(C_ADDR_WIDTH-C_RESOLUTION)
            ) addr_decode_comparator
            (
            .CIN(1'b1),
            .A(ADDR[C_RESOLUTION +: C_ADDR_WIDTH-C_RESOLUTION] &
              ~(C_BASE_ADDR[(target_cnt*C_NUM_RANGES+region_cnt)*64+C_RESOLUTION +: C_ADDR_WIDTH-C_RESOLUTION] ^
                C_HIGH_ADDR[(target_cnt*C_NUM_RANGES+region_cnt)*64+C_RESOLUTION +: C_ADDR_WIDTH-C_RESOLUTION])),
            .COUT(ADDRESS_HIT[target_cnt*C_NUM_RANGES + region_cnt])
            );
          end else begin : gen_null_range
            assign ADDRESS_HIT[target_cnt*C_NUM_RANGES + region_cnt] = 1'b0;
          end
        end else begin : gen_no_comparator_static
          assign ADDRESS_HIT[target_cnt*C_NUM_RANGES + region_cnt] = C_TARGET_QUAL[target_cnt] ?
                                    decode_address(
                                      C_BASE_ADDR[(target_cnt*C_NUM_RANGES+region_cnt)*64 +: C_ADDR_WIDTH],
                                      C_HIGH_ADDR[(target_cnt*C_NUM_RANGES+region_cnt)*64 +: C_ADDR_WIDTH],
                                      ADDR)
                                    : 1'b0;
        end  // gen_comparator_static
        assign ADDRESS_HIT_REG[region_cnt*C_NUM_TARGETS+target_cnt] = ADDRESS_HIT[target_cnt*C_NUM_RANGES + region_cnt];
        assign REGION_HOT[region_cnt] = | ADDRESS_HIT_REG[region_cnt*C_NUM_TARGETS +: C_NUM_TARGETS];
      end  // gen_region
      // All regions are non-overlapping
      // => Or all the region detections for this target to determine if it is a hit.
      assign TARGET_HOT_I[target_cnt]  = | ADDRESS_HIT[target_cnt*C_NUM_RANGES +: C_NUM_RANGES];
    end  // gen_target
  endgenerate
  // All regions are non-overlapping
  // => Or all the target hit detections if it is a match.
  assign MATCH = | TARGET_HOT_I;
  // Assign conditional onehot target output signal.
  generate
    if (C_TARGET_HOT == 1) begin : USE_TARGET_ONEHOT
      assign TARGET_HOT = MATCH ? TARGET_HOT_I : 1;
    end else begin : NO_TARGET_ONEHOT
      assign TARGET_HOT = {C_NUM_TARGETS{1'b0}};
    end
  endgenerate
  // Assign conditional encoded target output signal.
  generate
    if (C_TARGET_ENC == 1) begin : USE_TARGET_ENCODED
      assign TARGET_ENC_I = f_hot2enc(TARGET_HOT_I);
      assign TARGET_ENC   = TARGET_ENC_I[C_NUM_TARGETS_LOG-1:0];
    end else begin : NO_TARGET_ENCODED
      assign TARGET_ENC = {C_NUM_TARGETS_LOG{1'b0}};
    end
  endgenerate
  // Assign conditional encoded region output signal.
  generate
    if (C_TARGET_ENC == 1) begin : USE_REGION_ENCODED
      assign REGION = f_hot2enc(REGION_HOT);
    end else begin : NO_REGION_ENCODED
      assign REGION = 4'b0;
    end
  endgenerate
endmodule