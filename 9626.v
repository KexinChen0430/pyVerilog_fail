module mfp_eic_core
(
    input       CLK,
    input       RESETn,
    //signal inputs (should be synchronized!)
    input      [ `EIC_CHANNELS   - 1 : 0  ]  signal,
    //register access
    input      [ `EIC_ADDR_WIDTH - 1 : 0  ]  read_addr,
    output reg [                  31 : 0  ]  read_data,
    input      [ `EIC_ADDR_WIDTH - 1 : 0  ]  write_addr,
    input      [                  31 : 0  ]  write_data,
    input                                    write_enable,
    //EIC processor interface
    output     [ 17 : 1 ] EIC_Offset,
    output     [  3 : 0 ] EIC_ShadowSet,
    output     [  7 : 0 ] EIC_Interrupt,
    output     [  5 : 0 ] EIC_Vector,
    output                EIC_Present,
    input                 EIC_IAck,
    input      [  7 : 0 ] EIC_IPL,
    input      [  5 : 0 ] EIC_IVN,
    input      [ 17 : 1 ] EIC_ION
);
    //registers interface part
    wire       [                        31 : 0  ]  EICR;
    wire       [ `EIC_ALIGNED_WIDTH    - 1 : 0  ]  EIMSK;
    wire       [ `EIC_ALIGNED_WIDTH    - 1 : 0  ]  EIFR;
    wire       [ `EIC_ALIGNED_WIDTH    - 1 : 0  ]  EISMSK;
    wire       [ `EIC_ALIGNED_WIDTH    - 1 : 0  ]  EIIPR;
    wire       [ `EIC_ALIGNED_WIDTH    - 1 : 0  ]  EIACM;
    //register involved part
    reg        [ `EIC_EICR_WIDTH       - 1 : 0 ]  EICR_inv;
    reg        [ `EIC_CHANNELS         - 1 : 0 ]  EIMSK_inv;
    reg        [ 2*`EIC_SENSE_CHANNELS - 1 : 0 ]  EISMSK_inv;
    wire       [ `EIC_CHANNELS         - 1 : 0 ]  EIFR_inv;
    reg        [ `EIC_CHANNELS         - 1 : 0 ]  EIACM_inv;
    //register align and combination
    assign EIMSK  = { { `EIC_ALIGNED_WIDTH - `EIC_CHANNELS { 1'b0 } }, EIMSK_inv };
    assign EISMSK = { { `EIC_ALIGNED_WIDTH - 2*`EIC_SENSE_CHANNELS { 1'b0 } }, EISMSK_inv};
    assign EIFR   = { { `EIC_ALIGNED_WIDTH - `EIC_CHANNELS { 1'b0 } }, EIFR_inv };
    assign EIIPR  = { { `EIC_ALIGNED_WIDTH - `EIC_CHANNELS { 1'b0 } }, signal };
    assign EIACM  = { { `EIC_ALIGNED_WIDTH - `EIC_CHANNELS { 1'b0 } }, EIACM_inv };
    assign EICR         = { { 32 - `EIC_EICR_WIDTH { 1'b0 } }, EICR_inv };
    assign EIC_Present  = EICR_inv[`EICR_EE];
    //register read operations
    always @ (*)
        case(read_addr)
             default          :  read_data = 32'b0;
            `EIC_REG_EICR     :  read_data = EICR;
            `EIC_REG_EIMSK_0  :  read_data = EIMSK  [ 31:0  ];
            `EIC_REG_EIMSK_1  :  read_data = EIMSK  [ 63:32 ];
            `EIC_REG_EIFR_0   :  read_data = EIFR   [ 31:0  ];
            `EIC_REG_EIFR_1   :  read_data = EIFR   [ 63:32 ];
            `EIC_REG_EIFRS_0  :  read_data = 32'b0;
            `EIC_REG_EIFRS_1  :  read_data = 32'b0;
            `EIC_REG_EIFRC_0  :  read_data = 32'b0;
            `EIC_REG_EIFRC_1  :  read_data = 32'b0;
            `EIC_REG_EISMSK_0 :  read_data = EISMSK [ 31:0  ];
            `EIC_REG_EISMSK_1 :  read_data = EISMSK [ 63:32 ];
            `EIC_REG_EIIPR_0  :  read_data = EIIPR  [ 31:0  ];
            `EIC_REG_EIIPR_1  :  read_data = EIIPR  [ 63:32 ];
            `EIC_REG_EIACM_0  :  read_data = EIACM  [ 31:0  ];
            `EIC_REG_EIACM_1  :  read_data = EIACM  [ 63:32 ];
        endcase
    //register write operations
    wire  [ `EIC_CHANNELS   - 1 : 0 ]  EIFR_wr_data;
    wire  [ `EIC_CHANNELS   - 1 : 0 ]  EIFR_wr_enable;
    wire  [ `EIC_CHANNELS   - 1 : 0 ]  EIMSK_new;
    wire  [ `EIC_CHANNELS   - 1 : 0 ]  EISMSK_new;
    wire  [ `EIC_EICR_WIDTH - 1 : 0 ]  EICR_new;
    wire  [ `EIC_CHANNELS   - 1 : 0 ]  EIACM_new;
    reg   [                  17 : 0 ]  write_cmd;
    new_reg_value #(.USED(`EIC_CHANNELS))   nrv_EIFR_dt (.in(EIFR_inv),   .out(EIFR_wr_data),   .word(write_data), .cmd(write_cmd[ 2:0 ]));
    new_reg_value #(.USED(`EIC_CHANNELS))   nrv_EIFR_wr (.in(EIFR_inv),   .out(EIFR_wr_enable), .word(write_data), .cmd(write_cmd[ 5:3 ]));
    new_reg_value #(.USED(`EIC_CHANNELS))   nrv_EIMSK   (.in(EIMSK_inv),  .out(EIMSK_new),      .word(write_data), .cmd(write_cmd[ 8:6 ]));
    new_reg_value #(.USED(`EIC_CHANNELS))   nrv_EISMSK  (.in(EISMSK_inv), .out(EISMSK_new),     .word(write_data), .cmd(write_cmd[11:9 ]));
    new_reg_value #(.USED(`EIC_EICR_WIDTH)) nrv_EICR    (.in(EICR_inv),   .out(EICR_new),       .word(write_data), .cmd(write_cmd[14:12]));
    new_reg_value #(.USED(`EIC_CHANNELS))   nrv_EIACM   (.in(EIACM_inv),  .out(EIACM_new),      .word(write_data), .cmd(write_cmd[17:15]));
    wire  [ `EIC_ADDR_WIDTH - 1 : 0 ]  __write_addr = write_enable ? write_addr : `EIC_REG_NONE;
    always @ (*) begin
        case(__write_addr)
             default          :  write_cmd = { `EIC_C_NONE, `EIC_C_NONE, `EIC_C_NONE, `EIC_C_NONE, `EIC_C_CLRA, `EIC_C_CLRA };
            `EIC_REG_EICR     :  write_cmd = { `EIC_C_NONE, `EIC_C_VAL0, `EIC_C_NONE, `EIC_C_VAL0, `EIC_C_CLRA, `EIC_C_CLRA };
            `EIC_REG_EIMSK_0  :  write_cmd = { `EIC_C_NONE, `EIC_C_NONE, `EIC_C_NONE, `EIC_C_VAL0, `EIC_C_CLRA, `EIC_C_CLRA };
            `EIC_REG_EIMSK_1  :  write_cmd = { `EIC_C_NONE, `EIC_C_NONE, `EIC_C_NONE, `EIC_C_VAL1, `EIC_C_CLRA, `EIC_C_CLRA };
            `EIC_REG_EIFR_0   :  write_cmd = { `EIC_C_NONE, `EIC_C_NONE, `EIC_C_NONE, `EIC_C_NONE, `EIC_C_SET0, `EIC_C_VAL0 };
            `EIC_REG_EIFR_1   :  write_cmd = { `EIC_C_NONE, `EIC_C_NONE, `EIC_C_NONE, `EIC_C_NONE, `EIC_C_SET1, `EIC_C_VAL1 };
            `EIC_REG_EIFRS_0  :  write_cmd = { `EIC_C_NONE, `EIC_C_NONE, `EIC_C_NONE, `EIC_C_NONE, `EIC_C_VAL0, `EIC_C_VAL0 };
            `EIC_REG_EIFRS_1  :  write_cmd = { `EIC_C_NONE, `EIC_C_NONE, `EIC_C_NONE, `EIC_C_NONE, `EIC_C_VAL1, `EIC_C_VAL1 };
            `EIC_REG_EIFRC_0  :  write_cmd = { `EIC_C_NONE, `EIC_C_NONE, `EIC_C_NONE, `EIC_C_NONE, `EIC_C_VAL0, `EIC_C_CLR0 };
            `EIC_REG_EIFRC_1  :  write_cmd = { `EIC_C_NONE, `EIC_C_NONE, `EIC_C_NONE, `EIC_C_NONE, `EIC_C_VAL1, `EIC_C_CLR1 };
            `EIC_REG_EISMSK_0 :  write_cmd = { `EIC_C_NONE, `EIC_C_NONE, `EIC_C_VAL0, `EIC_C_NONE, `EIC_C_CLRA, `EIC_C_CLRA };
            `EIC_REG_EISMSK_1 :  write_cmd = { `EIC_C_NONE, `EIC_C_NONE, `EIC_C_VAL1, `EIC_C_NONE, `EIC_C_CLRA, `EIC_C_CLRA };
            `EIC_REG_EIACM_0  :  write_cmd = { `EIC_C_VAL0, `EIC_C_NONE, `EIC_C_NONE, `EIC_C_NONE, `EIC_C_CLRA, `EIC_C_CLRA };
            `EIC_REG_EIACM_1  :  write_cmd = { `EIC_C_VAL1, `EIC_C_NONE, `EIC_C_NONE, `EIC_C_NONE, `EIC_C_CLRA, `EIC_C_CLRA };
        endcase
    end
    always @ (posedge CLK)
        if(~RESETn) begin
                EIMSK_inv  <= { `EIC_CHANNELS   { 1'b0 } };
                EISMSK_inv <= { `EIC_CHANNELS   { 1'b0 } };
                EICR_inv   <= { `EIC_EICR_WIDTH { 1'b0 } };
                EIACM_inv  <= { `EIC_CHANNELS   { 1'b0 } };
            end
        else
            case(__write_addr)
                default           :  ;
                `EIC_REG_EICR     :  EICR_inv   <= EICR_new;
                `EIC_REG_EIMSK_0  :  EIMSK_inv  <= EIMSK_new;
                `EIC_REG_EIMSK_1  :  EIMSK_inv  <= EIMSK_new;
                `EIC_REG_EISMSK_0 :  EISMSK_inv <= EISMSK_new;
                `EIC_REG_EISMSK_1 :  EISMSK_inv <= EISMSK_new;
                `EIC_REG_EIACM_0  :  EIACM_inv  <= EIACM_new;
                `EIC_REG_EIACM_1  :  EIACM_inv  <= EIACM_new;
            endcase
    //current interrupt processing by CPU (EIC_IVN, EIC_ION -> irqNumberCur, irqFlagCur)
    wire [                 7 : 0 ] irqNumberCur;
    wire [ `EIC_CHANNELS - 1 : 0 ] irqFlagCur     = (1 << irqNumberCur);
    handler_params_decoder handler_params_decoder
    (
        .irqVector ( EIC_IVN      ),
        .irqOffset ( EIC_ION      ),
        .irqNumber ( irqNumberCur )
    );
    // auto clear flag logic
    wire [ `EIC_CHANNELS - 1 : 0 ] requestWR = EIC_IAck ? EIFR_wr_enable |  (EIACM_inv & irqFlagCur)
                                                        : EIFR_wr_enable;
    wire [ `EIC_CHANNELS - 1 : 0 ] requestIn = EIC_IAck ? EIFR_wr_data   & ~(EIACM_inv & irqFlagCur)
                                                        : EIFR_wr_data;
    //interrupt input logic (signal -> request)
    wire [ `EIC_SENSE_CHANNELS - 1 : 0  ] sensed;
    wire [ `EIC_CHANNELS       - 1 : 0  ] mask = EICR_inv[`EICR_EE] ? EIMSK_inv
                                                                    : { `EIC_CHANNELS {1'b0}};
    generate
        genvar i, j;
        for (i = 0; i < `EIC_SENSE_CHANNELS; i = i + 1)
        begin : sirq
            interrupt_sence sense
            (
                .CLK        ( CLK                ),
                .RESETn     ( RESETn             ),
                .senceMask  ( EISMSK_inv [ (1+i*2):(i*2) ] ),
                .signalIn   ( signal         [i] ),
                .signalOut  ( sensed         [i] )
            );
            interrupt_channel channel
            (
                .CLK        ( CLK                ),
                .RESETn     ( RESETn             ),
                .signalMask ( mask           [i] ),
                .signalIn   ( sensed         [i] ),
                .requestWR  ( requestWR      [i] ),
                .requestIn  ( requestIn      [i] ),
                .requestOut ( EIFR_inv       [i] )
            );
        end
        for (j = `EIC_SENSE_CHANNELS; j < `EIC_CHANNELS; j = j + 1)
        begin : irq
            interrupt_channel channel
            (
                .CLK        ( CLK                ),
                .RESETn     ( RESETn             ),
                .signalMask ( mask           [j] ),
                .signalIn   ( signal         [j] ),
                .requestWR  ( requestWR      [j] ),
                .requestIn  ( requestIn      [j] ),
                .requestOut ( EIFR_inv       [j] )
            );
        end
    endgenerate
    //interrupt priority decode (EIFR -> irqNumber)
    wire                 irqDetected;
    wire      [  5 : 0 ] irqNumberL;
    wire      [  7 : 0 ] irqNumber  = { 2'b0, irqNumberL };
    priority_encoder64 priority_encoder //use priority_encoder255 for more interrupt inputs
    (
        .in     ( EIFR        ),
        .detect ( irqDetected ),
        .out    ( irqNumberL  )
    );
    //interrupt priority encode (irqNumber -> handler_params)
    handler_params_encoder handler_params_encoder
    (
        .irqNumber      ( irqNumber     ),
        .irqDetected    ( irqDetected   ),
        .EIC_Offset     ( EIC_Offset    ),
        .EIC_ShadowSet  ( EIC_ShadowSet ),
        .EIC_Interrupt  ( EIC_Interrupt ),
        .EIC_Vector     ( EIC_Vector    )
    );
endmodule