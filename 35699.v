module mobile_ddr_mcp (
    Clk   ,
    Clk_n ,
    Cke   ,
    Cs_n  ,
    Ras_n ,
    Cas_n ,
    We_n  ,
    Addr  ,
    Ba    ,
    Dq    ,
    Dqs   ,
    Dm
);
    `include "mobile_ddr_parameters.vh"
    // Declare Ports
    input                         Clk   ;
    input                         Clk_n ;
    input       [CS_BITS - 1 : 0] Cke   ;
    input       [CS_BITS - 1 : 0] Cs_n  ;
    input                         Ras_n ;
    input                         Cas_n ;
    input                         We_n  ;
    input     [ADDR_BITS - 1 : 0] Addr  ;
    input                 [1 : 0] Ba    ;
    inout       [DQ_BITS - 1 : 0] Dq    ;
    inout      [DQS_BITS - 1 : 0] Dqs   ;
    input       [DM_BITS - 1 : 0] Dm    ;
    wire [RANKS - 1 : 0] Cke_mcp = Cke   ;
    wire [RANKS - 1 : 0] Cs_n_mcp = Cs_n ;
    mobile_ddr rank [RANKS - 1:0] (
        .Clk   ( Clk       ) ,
        .Clk_n ( Clk_n     ) ,
        .Cke   ( Cke_mcp   ) ,
        .Cs_n  ( Cs_n_mcp  ) ,
        .Ras_n ( Ras_n     ) ,
        .Cas_n ( Cas_n     ) ,
        .We_n  ( We_n      ) ,
        .Addr  ( Addr      ) ,
        .Ba    ( Ba        ) ,
        .Dq    ( Dq        ) ,
        .Dqs   ( Dqs       ) ,
        .Dm    ( Dm        )
    );
endmodule