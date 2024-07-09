module ddr3 (
    rst_n,
    ck,
    ck_n,
    cke,
    cs_n,
    ras_n,
    cas_n,
    we_n,
    dm_tdqs,
    ba,
    addr,
    dq,
    dqs,
    dqs_n,
    tdqs_n,
    odt
);
`define x1Gb
`define sg187E
`define x16
/*    `include "ddr3_model_parameters.vh" */
/****************************************************************************************
    // Parameters current with 1Gb and 2Gb datasheet rev D
    // Timing parameters based on Speed Grade
                                            // SYMBOL     UNITS DESCRIPTION
`ifdef x1Gb  // 1Gb parameters
  `ifdef sg094E                             // sg094E is equivalent to the JEDEC DDR3-2133 (13-13-13) speed bin
      parameter TCK_MIN          =   937.5; // tCK        ps    Minimum Clock Cycle Time
      parameter TJIT_PER         =      50; // tJIT(per)  ps    Period JItter
      parameter TJIT_CC          =     100; // tJIT(cc)   ps    Cycle to Cycle jitter
      parameter TERR_2PER        =      73; // tERR(2per) ps    Accumulated Error (2-cycle)
      parameter TERR_3PER        =      85; // tERR(3per) ps    Accumulated Error (3-cycle)
      parameter TERR_4PER        =      98; // tERR(4per) ps    Accumulated Error (4-cycle)
      parameter TERR_5PER        =     105; // tERR(5per) ps    Accumulated Error (5-cycle)
      parameter TERR_6PER        =     111; // tERR(6per) ps    Accumulated Error (6-cycle)
      parameter TERR_7PER        =     117; // tERR(7per) ps    Accumulated Error (7-cycle)
      parameter TERR_8PER        =     121; // tERR(8per) ps    Accumulated Error (8-cycle)
      parameter TERR_9PER        =     125; // tERR(9per) ps    Accumulated Error (9-cycle)
      parameter TERR_10PER       =     128; // tERR(10per)ps    Accumulated Error (10-cycle)
      parameter TERR_11PER       =     132; // tERR(11per)ps    Accumulated Error (11-cycle)
      parameter TERR_12PER       =     134; // tERR(12per)ps    Accumulated Error (12-cycle)
      parameter TDS              =       5; // tDS        ps    DQ and DM input setup time relative to DQS
      parameter TDH              =      20; // tDH        ps    DQ and DM input hold time relative to DQS
      parameter TDQSQ            =      70; // tDQSQ      ps    DQS-DQ skew, DQS to last DQ valid, per group, per access
      parameter TDQSS            =    0.27; // tDQSS      tCK   Rising clock edge to DQS/DQS# latching transition
      parameter TDSS             =    0.18; // tDSS       tCK   DQS falling edge to CLK rising (setup time)
      parameter TDSH             =    0.18; // tDSH       tCK   DQS falling edge from CLK rising (hold time)
      parameter TDQSCK           =     175; // tDQSCK     ps    DQS output access time from CK/CK#
      parameter TQSH             =    0.40; // tQSH       tCK   DQS Output High Pulse Width
      parameter TQSL             =    0.40; // tQSL       tCK   DQS Output Low Pulse Width
      parameter TDIPW            =     275; // tDIPW      ps    DQ and DM input Pulse Width
      parameter TIPW             =     455; // tIPW       ps    Control and Address input Pulse Width
      parameter TIS              =      35; // tIS        ps    Input Setup Time
      parameter TIH              =      75; // tIH        ps    Input Hold Time
      parameter TRAS_MIN         =   35000; // tRAS       ps    Minimum Active to Precharge command time
      parameter TRC              =   46250; // tRC        ps    Active to Active/Auto Refresh command time
      parameter TRCD             =   12187; // tRCD       ps    Active to Read/Write command time
      parameter TRP              =   12187; // tRP        ps    Precharge command period
      parameter TXP              =    6000; // tXP        ps    Exit power down to a valid command
      parameter TCKE             =    5000; // tCKE       ps    CKE minimum high or low pulse width
      parameter TAON             =     180; // tAON       ps    RTT turn-on from ODTLon reference
      parameter TWLS             =     122; // tWLS       ps    Setup time for tDQS flop
      parameter TWLH             =     122; // tWLH       ps    Hold time of tDQS flop
      parameter TWLO             =    7500; // tWLO       ps    Write levelization output delay
      parameter TAA_MIN          =   12187; // TAA        ps    Internal READ command to first data
      parameter CL_TIME          =   12187; // CL         ps    Minimum CAS Latency
  `else `ifdef sg094                        // sg094  is equivalent to the JEDEC DDR3-2133 (14-14-14) speed bin
      parameter TCK_MIN          =   937.5; // tCK        ps    Minimum Clock Cycle Time
      parameter TJIT_PER         =      50; // tJIT(per)  ps    Period JItter
      parameter TJIT_CC          =     100; // tJIT(cc)   ps    Cycle to Cycle jitter
      parameter TERR_2PER        =      73; // tERR(2per) ps    Accumulated Error (2-cycle)
      parameter TERR_3PER        =      85; // tERR(3per) ps    Accumulated Error (3-cycle)
      parameter TERR_4PER        =      98; // tERR(4per) ps    Accumulated Error (4-cycle)
      parameter TERR_5PER        =     105; // tERR(5per) ps    Accumulated Error (5-cycle)
      parameter TERR_6PER        =     111; // tERR(6per) ps    Accumulated Error (6-cycle)
      parameter TERR_7PER        =     117; // tERR(7per) ps    Accumulated Error (7-cycle)
      parameter TERR_8PER        =     121; // tERR(8per) ps    Accumulated Error (8-cycle)
      parameter TERR_9PER        =     125; // tERR(9per) ps    Accumulated Error (9-cycle)
      parameter TERR_10PER       =     128; // tERR(10per)ps    Accumulated Error (10-cycle)
      parameter TERR_11PER       =     132; // tERR(11per)ps    Accumulated Error (11-cycle)
      parameter TERR_12PER       =     134; // tERR(12per)ps    Accumulated Error (12-cycle)
      parameter TDS              =       5; // tDS        ps    DQ and DM input setup time relative to DQS
      parameter TDH              =      20; // tDH        ps    DQ and DM input hold time relative to DQS
      parameter TDQSQ            =      70; // tDQSQ      ps    DQS-DQ skew, DQS to last DQ valid, per group, per access
      parameter TDQSS            =    0.27; // tDQSS      tCK   Rising clock edge to DQS/DQS# latching transition
      parameter TDSS             =    0.18; // tDSS       tCK   DQS falling edge to CLK rising (setup time)
      parameter TDSH             =    0.18; // tDSH       tCK   DQS falling edge from CLK rising (hold time)
      parameter TDQSCK           =     175; // tDQSCK     ps    DQS output access time from CK/CK#
      parameter TQSH             =    0.40; // tQSH       tCK   DQS Output High Pulse Width
      parameter TQSL             =    0.40; // tQSL       tCK   DQS Output Low Pulse Width
      parameter TDIPW            =     275; // tDIPW      ps    DQ and DM input Pulse Width
      parameter TIPW             =     455; // tIPW       ps    Control and Address input Pulse Width
      parameter TIS              =      35; // tIS        ps    Input Setup Time
      parameter TIH              =      75; // tIH        ps    Input Hold Time
      parameter TRAS_MIN         =   35000; // tRAS       ps    Minimum Active to Precharge command time
      parameter TRC              =   46250; // tRC        ps    Active to Active/Auto Refresh command time
      parameter TRCD             =   13125; // tRCD       ps    Active to Read/Write command time
      parameter TRP              =   13125; // tRP        ps    Precharge command period
      parameter TXP              =    6000; // tXP        ps    Exit power down to a valid command
      parameter TCKE             =    5000; // tCKE       ps    CKE minimum high or low pulse width
      parameter TAON             =     180; // tAON       ps    RTT turn-on from ODTLon reference
      parameter TWLS             =     122; // tWLS       ps    Setup time for tDQS flop
      parameter TWLH             =     122; // tWLH       ps    Hold time of tDQS flop
      parameter TWLO             =    7500; // tWLO       ps    Write levelization output delay
      parameter TAA_MIN          =   13125; // TAA        ps    Internal READ command to first data
      parameter CL_TIME          =   13125; // CL         ps    Minimum CAS Latency
  `else `ifdef sg107F                       // sg107F is equivalent to the JEDEC DDR3-1866 (12-12-12) speed bin
      parameter TCK_MIN          = 15e3/14; // tCK        ps    Minimum Clock Cycle Time
      parameter TJIT_PER         =      60; // tJIT(per)  ps    Period JItter
      parameter TJIT_CC          =     120; // tJIT(cc)   ps    Cycle to Cycle jitter
      parameter TERR_2PER        =      88; // tERR(2per) ps    Accumulated Error (2-cycle)
      parameter TERR_3PER        =     103; // tERR(3per) ps    Accumulated Error (3-cycle)
      parameter TERR_4PER        =     117; // tERR(4per) ps    Accumulated Error (4-cycle)
      parameter TERR_5PER        =     126; // tERR(5per) ps    Accumulated Error (5-cycle)
      parameter TERR_6PER        =     133; // tERR(6per) ps    Accumulated Error (6-cycle)
      parameter TERR_7PER        =     140; // tERR(7per) ps    Accumulated Error (7-cycle)
      parameter TERR_8PER        =     145; // tERR(8per) ps    Accumulated Error (8-cycle)
      parameter TERR_9PER        =     150; // tERR(9per) ps    Accumulated Error (9-cycle)
      parameter TERR_10PER       =     154; // tERR(10per)ps    Accumulated Error (10-cycle)
      parameter TERR_11PER       =     158; // tERR(11per)ps    Accumulated Error (11-cycle)
      parameter TERR_12PER       =     161; // tERR(12per)ps    Accumulated Error (12-cycle)
      parameter TDS              =      10; // tDS        ps    DQ and DM input setup time relative to DQS
      parameter TDH              =      20; // tDH        ps    DQ and DM input hold time relative to DQS
      parameter TDQSQ            =      80; // tDQSQ      ps    DQS-DQ skew, DQS to last DQ valid, per group, per access
      parameter TDQSS            =    0.27; // tDQSS      tCK   Rising clock edge to DQS/DQS# latching transition
      parameter TDSS             =    0.18; // tDSS       tCK   DQS falling edge to CLK rising (setup time)
      parameter TDSH             =    0.18; // tDSH       tCK   DQS falling edge from CLK rising (hold time)
      parameter TDQSCK           =     200; // tDQSCK     ps    DQS output access time from CK/CK#
      parameter TQSH             =    0.40; // tQSH       tCK   DQS Output High Pulse Width
      parameter TQSL             =    0.40; // tQSL       tCK   DQS Output Low Pulse Width
      parameter TDIPW            =     300; // tDIPW      ps    DQ and DM input Pulse Width
      parameter TIPW             =     505; // tIPW       ps    Control and Address input Pulse Width
      parameter TIS              =      50; // tIS        ps    Input Setup Time
      parameter TIH              =     100; // tIH        ps    Input Hold Time
      parameter TRAS_MIN         =   35000; // tRAS       ps    Minimum Active to Precharge command time
      parameter TRC              =   46250; // tRC        ps    Active to Active/Auto Refresh command time
      parameter TRCD             =   12857; // tRCD       ps    Active to Read/Write command time
      parameter TRP              =   12857; // tRP        ps    Precharge command period
      parameter TXP              =    6000; // tXP        ps    Exit power down to a valid command
      parameter TCKE             =    5000; // tCKE       ps    CKE minimum high or low pulse width
      parameter TAON             =     200; // tAON       ps    RTT turn-on from ODTLon reference
      parameter TWLS             =     140; // tWLS       ps    Setup time for tDQS flop
      parameter TWLH             =     140; // tWLH       ps    Hold time of tDQS flop
      parameter TWLO             =    7500; // tWLO       ps    Write levelization output delay
      parameter TAA_MIN          =   12857; // TAA        ps    Internal READ command to first data
      parameter CL_TIME          =   12857; // CL         ps    Minimum CAS Latency
  `else `ifdef sg107E                       // sg107E is equivalent to the JEDEC DDR3-1866 (13-13-13) speed bin
      parameter TCK_MIN          = 15e3/14; // tCK        ps    Minimum Clock Cycle Time
      parameter TJIT_PER         =      60; // tJIT(per)  ps    Period JItter
      parameter TJIT_CC          =     120; // tJIT(cc)   ps    Cycle to Cycle jitter
      parameter TERR_2PER        =      88; // tERR(2per) ps    Accumulated Error (2-cycle)
      parameter TERR_3PER        =     103; // tERR(3per) ps    Accumulated Error (3-cycle)
      parameter TERR_4PER        =     117; // tERR(4per) ps    Accumulated Error (4-cycle)
      parameter TERR_5PER        =     126; // tERR(5per) ps    Accumulated Error (5-cycle)
      parameter TERR_6PER        =     133; // tERR(6per) ps    Accumulated Error (6-cycle)
      parameter TERR_7PER        =     140; // tERR(7per) ps    Accumulated Error (7-cycle)
      parameter TERR_8PER        =     145; // tERR(8per) ps    Accumulated Error (8-cycle)
      parameter TERR_9PER        =     150; // tERR(9per) ps    Accumulated Error (9-cycle)
      parameter TERR_10PER       =     154; // tERR(10per)ps    Accumulated Error (10-cycle)
      parameter TERR_11PER       =     158; // tERR(11per)ps    Accumulated Error (11-cycle)
      parameter TERR_12PER       =     161; // tERR(12per)ps    Accumulated Error (12-cycle)
      parameter TDS              =      10; // tDS        ps    DQ and DM input setup time relative to DQS
      parameter TDH              =      20; // tDH        ps    DQ and DM input hold time relative to DQS
      parameter TDQSQ            =      80; // tDQSQ      ps    DQS-DQ skew, DQS to last DQ valid, per group, per access
      parameter TDQSS            =    0.27; // tDQSS      tCK   Rising clock edge to DQS/DQS# latching transition
      parameter TDSS             =    0.18; // tDSS       tCK   DQS falling edge to CLK rising (setup time)
      parameter TDSH             =    0.18; // tDSH       tCK   DQS falling edge from CLK rising (hold time)
      parameter TDQSCK           =     200; // tDQSCK     ps    DQS output access time from CK/CK#
      parameter TQSH             =    0.40; // tQSH       tCK   DQS Output High Pulse Width
      parameter TQSL             =    0.40; // tQSL       tCK   DQS Output Low Pulse Width
      parameter TDIPW            =     300; // tDIPW      ps    DQ and DM input Pulse Width
      parameter TIPW             =     505; // tIPW       ps    Control and Address input Pulse Width
      parameter TIS              =      50; // tIS        ps    Input Setup Time
      parameter TIH              =     100; // tIH        ps    Input Hold Time
      parameter TRAS_MIN         =   35000; // tRAS       ps    Minimum Active to Precharge command time
      parameter TRC              =   46250; // tRC        ps    Active to Active/Auto Refresh command time
      parameter TRCD             =   13928; // tRCD       ps    Active to Read/Write command time
      parameter TRP              =   13928; // tRP        ps    Precharge command period
      parameter TXP              =    6000; // tXP        ps    Exit power down to a valid command
      parameter TCKE             =    5000; // tCKE       ps    CKE minimum high or low pulse width
      parameter TAON             =     200; // tAON       ps    RTT turn-on from ODTLon reference
      parameter TWLS             =     140; // tWLS       ps    Setup time for tDQS flop
      parameter TWLH             =     140; // tWLH       ps    Hold time of tDQS flop
      parameter TWLO             =    7500; // tWLO       ps    Write levelization output delay
      parameter TAA_MIN          =   13928; // TAA        ps    Internal READ command to first data
      parameter CL_TIME          =   13928; // CL         ps    Minimum CAS Latency
  `else `ifdef sg107                        // sg107  is equivalent to the JEDEC DDR3-1866 (14-14-14) speed bin
      parameter TCK_MIN          = 15e3/14; // tCK        ps    Minimum Clock Cycle Time
      parameter TJIT_PER         =      60; // tJIT(per)  ps    Period JItter
      parameter TJIT_CC          =     120; // tJIT(cc)   ps    Cycle to Cycle jitter
      parameter TERR_2PER        =      88; // tERR(2per) ps    Accumulated Error (2-cycle)
      parameter TERR_3PER        =     103; // tERR(3per) ps    Accumulated Error (3-cycle)
      parameter TERR_4PER        =     117; // tERR(4per) ps    Accumulated Error (4-cycle)
      parameter TERR_5PER        =     126; // tERR(5per) ps    Accumulated Error (5-cycle)
      parameter TERR_6PER        =     133; // tERR(6per) ps    Accumulated Error (6-cycle)
      parameter TERR_7PER        =     140; // tERR(7per) ps    Accumulated Error (7-cycle)
      parameter TERR_8PER        =     145; // tERR(8per) ps    Accumulated Error (8-cycle)
      parameter TERR_9PER        =     150; // tERR(9per) ps    Accumulated Error (9-cycle)
      parameter TERR_10PER       =     154; // tERR(10per)ps    Accumulated Error (10-cycle)
      parameter TERR_11PER       =     158; // tERR(11per)ps    Accumulated Error (11-cycle)
      parameter TERR_12PER       =     161; // tERR(12per)ps    Accumulated Error (12-cycle)
      parameter TDS              =      10; // tDS        ps    DQ and DM input setup time relative to DQS
      parameter TDH              =      20; // tDH        ps    DQ and DM input hold time relative to DQS
      parameter TDQSQ            =      80; // tDQSQ      ps    DQS-DQ skew, DQS to last DQ valid, per group, per access
      parameter TDQSS            =    0.27; // tDQSS      tCK   Rising clock edge to DQS/DQS# latching transition
      parameter TDSS             =    0.18; // tDSS       tCK   DQS falling edge to CLK rising (setup time)
      parameter TDSH             =    0.18; // tDSH       tCK   DQS falling edge from CLK rising (hold time)
      parameter TDQSCK           =     200; // tDQSCK     ps    DQS output access time from CK/CK#
      parameter TQSH             =    0.40; // tQSH       tCK   DQS Output High Pulse Width
      parameter TQSL             =    0.40; // tQSL       tCK   DQS Output Low Pulse Width
      parameter TDIPW            =     300; // tDIPW      ps    DQ and DM input Pulse Width
      parameter TIPW             =     505; // tIPW       ps    Control and Address input Pulse Width
      parameter TIS              =      50; // tIS        ps    Input Setup Time
      parameter TIH              =     100; // tIH        ps    Input Hold Time
      parameter TRAS_MIN         =   35000; // tRAS       ps    Minimum Active to Precharge command time
      parameter TRC              =   46250; // tRC        ps    Active to Active/Auto Refresh command time
      parameter TRCD             =   15000; // tRCD       ps    Active to Read/Write command time
      parameter TRP              =   15000; // tRP        ps    Precharge command period
      parameter TXP              =    6000; // tXP        ps    Exit power down to a valid command
      parameter TCKE             =    5000; // tCKE       ps    CKE minimum high or low pulse width
      parameter TAON             =     200; // tAON       ps    RTT turn-on from ODTLon reference
      parameter TWLS             =     140; // tWLS       ps    Setup time for tDQS flop
      parameter TWLH             =     140; // tWLH       ps    Hold time of tDQS flop
      parameter TWLO             =    7500; // tWLO       ps    Write levelization output delay
      parameter TAA_MIN          =   15000; // TAA        ps    Internal READ command to first data
      parameter CL_TIME          =   15000; // CL         ps    Minimum CAS Latency
  `else `ifdef sg125F                       // sg125F is equivalent to the JEDEC DDR3-1600 (9-9-9) speed bin
      parameter TCK_MIN          =    1250; // tCK        ps    Minimum Clock Cycle Time
      parameter TJIT_PER         =      70; // tJIT(per)  ps    Period JItter
      parameter TJIT_CC          =     140; // tJIT(cc)   ps    Cycle to Cycle jitter
      parameter TERR_2PER        =     103; // tERR(2per) ps    Accumulated Error (2-cycle)
      parameter TERR_3PER        =     122; // tERR(3per) ps    Accumulated Error (3-cycle)
      parameter TERR_4PER        =     136; // tERR(4per) ps    Accumulated Error (4-cycle)
      parameter TERR_5PER        =     147; // tERR(5per) ps    Accumulated Error (5-cycle)
      parameter TERR_6PER        =     155; // tERR(6per) ps    Accumulated Error (6-cycle)
      parameter TERR_7PER        =     163; // tERR(7per) ps    Accumulated Error (7-cycle)
      parameter TERR_8PER        =     169; // tERR(8per) ps    Accumulated Error (8-cycle)
      parameter TERR_9PER        =     175; // tERR(9per) ps    Accumulated Error (9-cycle)
      parameter TERR_10PER       =     180; // tERR(10per)ps    Accumulated Error (10-cycle)
      parameter TERR_11PER       =     184; // tERR(11per)ps    Accumulated Error (11-cycle)
      parameter TERR_12PER       =     188; // tERR(12per)ps    Accumulated Error (12-cycle)
      parameter TDS              =      10; // tDS        ps    DQ and DM input setup time relative to DQS
      parameter TDH              =      45; // tDH        ps    DQ and DM input hold time relative to DQS
      parameter TDQSQ            =     100; // tDQSQ      ps    DQS-DQ skew, DQS to last DQ valid, per group, per access
      parameter TDQSS            =    0.27; // tDQSS      tCK   Rising clock edge to DQS/DQS# latching transition
      parameter TDSS             =    0.18; // tDSS       tCK   DQS falling edge to CLK rising (setup time)
      parameter TDSH             =    0.18; // tDSH       tCK   DQS falling edge from CLK rising (hold time)
      parameter TDQSCK           =     225; // tDQSCK     ps    DQS output access time from CK/CK#
      parameter TQSH             =    0.40; // tQSH       tCK   DQS Output High Pulse Width
      parameter TQSL             =    0.40; // tQSL       tCK   DQS Output Low Pulse Width
      parameter TDIPW            =     360; // tDIPW      ps    DQ and DM input Pulse Width
      parameter TIPW             =     560; // tIPW       ps    Control and Address input Pulse Width
      parameter TIS              =     170; // tIS        ps    Input Setup Time
      parameter TIH              =     120; // tIH        ps    Input Hold Time
      parameter TRAS_MIN         =   35000; // tRAS       ps    Minimum Active to Precharge command time
      parameter TRC              =   46250; // tRC        ps    Active to Active/Auto Refresh command time
      parameter TRCD             =   11250; // tRCD       ps    Active to Read/Write command time
      parameter TRP              =   11250; // tRP        ps    Precharge command period
      parameter TXP              =    6000; // tXP        ps    Exit power down to a valid command
      parameter TCKE             =    5000; // tCKE       ps    CKE minimum high or low pulse width
      parameter TAON             =     250; // tAON       ps    RTT turn-on from ODTLon reference
      parameter TWLS             =     165; // tWLS       ps    Setup time for tDQS flop
      parameter TWLH             =     165; // tWLH       ps    Hold time of tDQS flop
      parameter TWLO             =    7500; // tWLO       ps    Write levelization output delay
      parameter TAA_MIN          =   11250; // TAA        ps    Internal READ command to first data
      parameter CL_TIME          =   11250; // CL         ps    Minimum CAS Latency
  `else `ifdef sg125E                       // sg125E is equivalent to the JEDEC DDR3-1600 (10-10-10) speed bin
      parameter TCK_MIN          =    1250; // tCK        ps    Minimum Clock Cycle Time
      parameter TJIT_PER         =      70; // tJIT(per)  ps    Period JItter
      parameter TJIT_CC          =     140; // tJIT(cc)   ps    Cycle to Cycle jitter
      parameter TERR_2PER        =     103; // tERR(2per) ps    Accumulated Error (2-cycle)
      parameter TERR_3PER        =     122; // tERR(3per) ps    Accumulated Error (3-cycle)
      parameter TERR_4PER        =     136; // tERR(4per) ps    Accumulated Error (4-cycle)
      parameter TERR_5PER        =     147; // tERR(5per) ps    Accumulated Error (5-cycle)
      parameter TERR_6PER        =     155; // tERR(6per) ps    Accumulated Error (6-cycle)
      parameter TERR_7PER        =     163; // tERR(7per) ps    Accumulated Error (7-cycle)
      parameter TERR_8PER        =     169; // tERR(8per) ps    Accumulated Error (8-cycle)
      parameter TERR_9PER        =     175; // tERR(9per) ps    Accumulated Error (9-cycle)
      parameter TERR_10PER       =     180; // tERR(10per)ps    Accumulated Error (10-cycle)
      parameter TERR_11PER       =     184; // tERR(11per)ps    Accumulated Error (11-cycle)
      parameter TERR_12PER       =     188; // tERR(12per)ps    Accumulated Error (12-cycle)
      parameter TDS              =      10; // tDS        ps    DQ and DM input setup time relative to DQS
      parameter TDH              =      45; // tDH        ps    DQ and DM input hold time relative to DQS
      parameter TDQSQ            =     100; // tDQSQ      ps    DQS-DQ skew, DQS to last DQ valid, per group, per access
      parameter TDQSS            =    0.27; // tDQSS      tCK   Rising clock edge to DQS/DQS# latching transition
      parameter TDSS             =    0.18; // tDSS       tCK   DQS falling edge to CLK rising (setup time)
      parameter TDSH             =    0.18; // tDSH       tCK   DQS falling edge from CLK rising (hold time)
      parameter TDQSCK           =     225; // tDQSCK     ps    DQS output access time from CK/CK#
      parameter TQSH             =    0.40; // tQSH       tCK   DQS Output High Pulse Width
      parameter TQSL             =    0.40; // tQSL       tCK   DQS Output Low Pulse Width
      parameter TDIPW            =     360; // tDIPW      ps    DQ and DM input Pulse Width
      parameter TIPW             =     560; // tIPW       ps    Control and Address input Pulse Width
      parameter TIS              =     170; // tIS        ps    Input Setup Time
      parameter TIH              =     120; // tIH        ps    Input Hold Time
      parameter TRAS_MIN         =   35000; // tRAS       ps    Minimum Active to Precharge command time
      parameter TRC              =   47500; // tRC        ps    Active to Active/Auto Refresh command time
      parameter TRCD             =   12500; // tRCD       ps    Active to Read/Write command time
      parameter TRP              =   12500; // tRP        ps    Precharge command period
      parameter TXP              =    6000; // tXP        ps    Exit power down to a valid command
      parameter TCKE             =    5000; // tCKE       ps    CKE minimum high or low pulse width
      parameter TAON             =     250; // tAON       ps    RTT turn-on from ODTLon reference
      parameter TWLS             =     165; // tWLS       ps    Setup time for tDQS flop
      parameter TWLH             =     165; // tWLH       ps    Hold time of tDQS flop
      parameter TWLO             =    7500; // tWLO       ps    Write levelization output delay
      parameter TAA_MIN          =   12500; // TAA        ps    Internal READ command to first data
      parameter CL_TIME          =   12500; // CL         ps    Minimum CAS Latency
  `else `ifdef sg125                        // sg125 is equivalent to the JEDEC DDR3-1600 (11-11-11) speed bin
      parameter TCK_MIN          =    1250; // tCK        ps    Minimum Clock Cycle Time
      parameter TJIT_PER         =      70; // tJIT(per)  ps    Period JItter
      parameter TJIT_CC          =     140; // tJIT(cc)   ps    Cycle to Cycle jitter
      parameter TERR_2PER        =     103; // tERR(2per) ps    Accumulated Error (2-cycle)
      parameter TERR_3PER        =     122; // tERR(3per) ps    Accumulated Error (3-cycle)
      parameter TERR_4PER        =     136; // tERR(4per) ps    Accumulated Error (4-cycle)
      parameter TERR_5PER        =     147; // tERR(5per) ps    Accumulated Error (5-cycle)
      parameter TERR_6PER        =     155; // tERR(6per) ps    Accumulated Error (6-cycle)
      parameter TERR_7PER        =     163; // tERR(7per) ps    Accumulated Error (7-cycle)
      parameter TERR_8PER        =     169; // tERR(8per) ps    Accumulated Error (8-cycle)
      parameter TERR_9PER        =     175; // tERR(9per) ps    Accumulated Error (9-cycle)
      parameter TERR_10PER       =     180; // tERR(10per)ps    Accumulated Error (10-cycle)
      parameter TERR_11PER       =     184; // tERR(11per)ps    Accumulated Error (11-cycle)
      parameter TERR_12PER       =     188; // tERR(12per)ps    Accumulated Error (12-cycle)
      parameter TDS              =      10; // tDS        ps    DQ and DM input setup time relative to DQS
      parameter TDH              =      45; // tDH        ps    DQ and DM input hold time relative to DQS
      parameter TDQSQ            =     100; // tDQSQ      ps    DQS-DQ skew, DQS to last DQ valid, per group, per access
      parameter TDQSS            =    0.27; // tDQSS      tCK   Rising clock edge to DQS/DQS# latching transition
      parameter TDSS             =    0.18; // tDSS       tCK   DQS falling edge to CLK rising (setup time)
      parameter TDSH             =    0.18; // tDSH       tCK   DQS falling edge from CLK rising (hold time)
      parameter TDQSCK           =     225; // tDQSCK     ps    DQS output access time from CK/CK#
      parameter TQSH             =    0.40; // tQSH       tCK   DQS Output High Pulse Width
      parameter TQSL             =    0.40; // tQSL       tCK   DQS Output Low Pulse Width
      parameter TDIPW            =     360; // tDIPW      ps    DQ and DM input Pulse Width
      parameter TIPW             =     560; // tIPW       ps    Control and Address input Pulse Width
      parameter TIS              =     170; // tIS        ps    Input Setup Time
      parameter TIH              =     120; // tIH        ps    Input Hold Time
      parameter TRAS_MIN         =   35000; // tRAS       ps    Minimum Active to Precharge command time
      parameter TRC              =   48750; // tRC        ps    Active to Active/Auto Refresh command time
      parameter TRCD             =   13125; // tRCD       ps    Active to Read/Write command time
      parameter TRP              =   13125; // tRP        ps    Precharge command period
      parameter TXP              =    6000; // tXP        ps    Exit power down to a valid command
      parameter TCKE             =    5000; // tCKE       ps    CKE minimum high or low pulse width
      parameter TAON             =     250; // tAON       ps    RTT turn-on from ODTLon reference
      parameter TWLS             =     165; // tWLS       ps    Setup time for tDQS flop
      parameter TWLH             =     165; // tWLH       ps    Hold time of tDQS flop
      parameter TWLO             =    7500; // tWLO       ps    Write levelization output delay
      parameter TAA_MIN          =   13125; // TAA        ps    Internal READ command to first data
      parameter CL_TIME          =   13125; // CL         ps    Minimum CAS Latency
  `else `ifdef sg15E                        // sg15E is equivalent to the JEDEC DDR3-1333H (9-9-9) speed bin
      parameter TCK_MIN          =    1500; // tCK        ps    Minimum Clock Cycle Time
      parameter TJIT_PER         =      80; // tJIT(per)  ps    Period JItter
      parameter TJIT_CC          =     160; // tJIT(cc)   ps    Cycle to Cycle jitter
      parameter TERR_2PER        =     118; // tERR(2per) ps    Accumulated Error (2-cycle)
      parameter TERR_3PER        =     140; // tERR(3per) ps    Accumulated Error (3-cycle)
      parameter TERR_4PER        =     155; // tERR(4per) ps    Accumulated Error (4-cycle)
      parameter TERR_5PER        =     168; // tERR(5per) ps    Accumulated Error (5-cycle)
      parameter TERR_6PER        =     177; // tERR(6per) ps    Accumulated Error (6-cycle)
      parameter TERR_7PER        =     186; // tERR(7per) ps    Accumulated Error (7-cycle)
      parameter TERR_8PER        =     193; // tERR(8per) ps    Accumulated Error (8-cycle)
      parameter TERR_9PER        =     200; // tERR(9per) ps    Accumulated Error (9-cycle)
      parameter TERR_10PER       =     205; // tERR(10per)ps    Accumulated Error (10-cycle)
      parameter TERR_11PER       =     210; // tERR(11per)ps    Accumulated Error (11-cycle)
      parameter TERR_12PER       =     215; // tERR(12per)ps    Accumulated Error (12-cycle)
      parameter TDS              =      30; // tDS        ps    DQ and DM input setup time relative to DQS
      parameter TDH              =      65; // tDH        ps    DQ and DM input hold time relative to DQS
      parameter TDQSQ            =     125; // tDQSQ      ps    DQS-DQ skew, DQS to last DQ valid, per group, per access
      parameter TDQSS            =    0.25; // tDQSS      tCK   Rising clock edge to DQS/DQS# latching transition
      parameter TDSS             =    0.20; // tDSS       tCK   DQS falling edge to CLK rising (setup time)
      parameter TDSH             =    0.20; // tDSH       tCK   DQS falling edge from CLK rising (hold time)
      parameter TDQSCK           =     255; // tDQSCK     ps    DQS output access time from CK/CK#
      parameter TQSH             =    0.40; // tQSH       tCK   DQS Output High Pulse Width
      parameter TQSL             =    0.40; // tQSL       tCK   DQS Output Low Pulse Width
      parameter TDIPW            =     400; // tDIPW      ps    DQ and DM input Pulse Width
      parameter TIPW             =     620; // tIPW       ps    Control and Address input Pulse Width
      parameter TIS              =     190; // tIS        ps    Input Setup Time
      parameter TIH              =     140; // tIH        ps    Input Hold Time
      parameter TRAS_MIN         =   36000; // tRAS       ps    Minimum Active to Precharge command time
      parameter TRC              =   49500; // tRC        ps    Active to Active/Auto Refresh command time
      parameter TRCD             =   13125; // tRCD       ps    Active to Read/Write command time
      parameter TRP              =   13125; // tRP        ps    Precharge command period
      parameter TXP              =    6000; // tXP        ps    Exit power down to a valid command
      parameter TCKE             =    5625; // tCKE       ps    CKE minimum high or low pulse width
      parameter TAON             =     250; // tAON       ps    RTT turn-on from ODTLon reference
      parameter TWLS             =     195; // tWLS       ps    Setup time for tDQS flop
      parameter TWLH             =     195; // tWLH       ps    Hold time of tDQS flop
      parameter TWLO             =    9000; // tWLO       ps    Write levelization output delay
      parameter TAA_MIN          =   13125; // TAA        ps    Internal READ command to first data
      parameter CL_TIME          =   13125; // CL         ps    Minimum CAS Latency
  `else `ifdef sg15                         // sg15 is equivalent to the JEDEC DDR3-1333J (10-10-10) speed bin
      parameter TCK_MIN          =    1500; // tCK        ps    Minimum Clock Cycle Time
      parameter TJIT_PER         =      80; // tJIT(per)  ps    Period JItter
      parameter TJIT_CC          =     160; // tJIT(cc)   ps    Cycle to Cycle jitter
      parameter TERR_2PER        =     118; // tERR(2per) ps    Accumulated Error (2-cycle)
      parameter TERR_3PER        =     140; // tERR(3per) ps    Accumulated Error (3-cycle)
      parameter TERR_4PER        =     155; // tERR(4per) ps    Accumulated Error (4-cycle)
      parameter TERR_5PER        =     168; // tERR(5per) ps    Accumulated Error (5-cycle)
      parameter TERR_6PER        =     177; // tERR(6per) ps    Accumulated Error (6-cycle)
      parameter TERR_7PER        =     186; // tERR(7per) ps    Accumulated Error (7-cycle)
      parameter TERR_8PER        =     193; // tERR(8per) ps    Accumulated Error (8-cycle)
      parameter TERR_9PER        =     200; // tERR(9per) ps    Accumulated Error (9-cycle)
      parameter TERR_10PER       =     205; // tERR(10per)ps    Accumulated Error (10-cycle)
      parameter TERR_11PER       =     210; // tERR(11per)ps    Accumulated Error (11-cycle)
      parameter TERR_12PER       =     215; // tERR(12per)ps    Accumulated Error (12-cycle)
      parameter TDS              =      30; // tDS        ps    DQ and DM input setup time relative to DQS
      parameter TDH              =      65; // tDH        ps    DQ and DM input hold time relative to DQS
      parameter TDQSQ            =     125; // tDQSQ      ps    DQS-DQ skew, DQS to last DQ valid, per group, per access
      parameter TDQSS            =    0.25; // tDQSS      tCK   Rising clock edge to DQS/DQS# latching transition
      parameter TDSS             =    0.20; // tDSS       tCK   DQS falling edge to CLK rising (setup time)
      parameter TDSH             =    0.20; // tDSH       tCK   DQS falling edge from CLK rising (hold time)
      parameter TDQSCK           =     255; // tDQSCK     ps    DQS output access time from CK/CK#
      parameter TQSH             =    0.40; // tQSH       tCK   DQS Output High Pulse Width
      parameter TQSL             =    0.40; // tQSL       tCK   DQS Output Low Pulse Width
      parameter TDIPW            =     400; // tDIPW      ps    DQ and DM input Pulse Width
      parameter TIPW             =     620; // tIPW       ps    Control and Address input Pulse Width
      parameter TIS              =     190; // tIS        ps    Input Setup Time
      parameter TIH              =     140; // tIH        ps    Input Hold Time
      parameter TRAS_MIN         =   36000; // tRAS       ps    Minimum Active to Precharge command time
      parameter TRC              =   51000; // tRC        ps    Active to Active/Auto Refresh command time
      parameter TRCD             =   15000; // tRCD       ps    Active to Read/Write command time
      parameter TRP              =   15000; // tRP        ps    Precharge command period
      parameter TXP              =    6000; // tXP        ps    Exit power down to a valid command
      parameter TCKE             =    5625; // tCKE       ps    CKE minimum high or low pulse width
      parameter TAON             =     250; // tAON       ps    RTT turn-on from ODTLon reference
      parameter TWLS             =     195; // tWLS       ps    Setup time for tDQS flop
      parameter TWLH             =     195; // tWLH       ps    Hold time of tDQS flop
      parameter TWLO             =    9000; // tWLO       ps    Write levelization output delay
      parameter TAA_MIN          =   15000; // TAA        ps    Internal READ command to first data
      parameter CL_TIME          =   15000; // CL         ps    Minimum CAS Latency
  `else `ifdef sg187E                       // sg187E is equivalent to the JEDEC DDR3-1066F (7-7-7) speed bin
      parameter TCK_MIN          =    1875; // tCK        ps    Minimum Clock Cycle Time
      parameter TJIT_PER         =      90; // tJIT(per)  ps    Period JItter
      parameter TJIT_CC          =     180; // tJIT(cc)   ps    Cycle to Cycle jitter
      parameter TERR_2PER        =     132; // tERR(2per) ps    Accumulated Error (2-cycle)
      parameter TERR_3PER        =     157; // tERR(3per) ps    Accumulated Error (3-cycle)
      parameter TERR_4PER        =     175; // tERR(4per) ps    Accumulated Error (4-cycle)
      parameter TERR_5PER        =     188; // tERR(5per) ps    Accumulated Error (5-cycle)
      parameter TERR_6PER        =     200; // tERR(6per) ps    Accumulated Error (6-cycle)
      parameter TERR_7PER        =     209; // tERR(7per) ps    Accumulated Error (7-cycle)
      parameter TERR_8PER        =     217; // tERR(8per) ps    Accumulated Error (8-cycle)
      parameter TERR_9PER        =     224; // tERR(9per) ps    Accumulated Error (9-cycle)
      parameter TERR_10PER       =     231; // tERR(10per)ps    Accumulated Error (10-cycle)
      parameter TERR_11PER       =     237; // tERR(11per)ps    Accumulated Error (11-cycle)
      parameter TERR_12PER       =     242; // tERR(12per)ps    Accumulated Error (12-cycle)
      parameter TDS              =      75; // tDS        ps    DQ and DM input setup time relative to DQS
      parameter TDH              =     100; // tDH        ps    DQ and DM input hold time relative to DQS
      parameter TDQSQ            =     150; // tDQSQ      ps    DQS-DQ skew, DQS to last DQ valid, per group, per access
      parameter TDQSS            =    0.25; // tDQSS      tCK   Rising clock edge to DQS/DQS# latching transition
      parameter TDSS             =    0.20; // tDSS       tCK   DQS falling edge to CLK rising (setup time)
      parameter TDSH             =    0.20; // tDSH       tCK   DQS falling edge from CLK rising (hold time)
      parameter TDQSCK           =     300; // tDQSCK     ps    DQS output access time from CK/CK#
      parameter TQSH             =    0.38; // tQSH       tCK   DQS Output High Pulse Width
      parameter TQSL             =    0.38; // tQSL       tCK   DQS Output Low Pulse Width
      parameter TDIPW            =     490; // tDIPW      ps    DQ and DM input Pulse Width
      parameter TIPW             =     780; // tIPW       ps    Control and Address input Pulse Width
      parameter TIS              =     275; // tIS        ps    Input Setup Time
      parameter TIH              =     200; // tIH        ps    Input Hold Time
      parameter TRAS_MIN         =   37500; // tRAS       ps    Minimum Active to Precharge command time
      parameter TRC              =   50625; // tRC        ps    Active to Active/Auto Refresh command time
      parameter TRCD             =   13125; // tRCD       ps    Active to Read/Write command time
      parameter TRP              =   13125; // tRP        ps    Precharge command period
      parameter TXP              =    7500; // tXP        ps    Exit power down to a valid command
      parameter TCKE             =    5625; // tCKE       ps    CKE minimum high or low pulse width
      parameter TAON             =     300; // tAON       ps    RTT turn-on from ODTLon reference
      parameter TWLS             =     245; // tWLS       ps    Setup time for tDQS flop
      parameter TWLH             =     245; // tWLH       ps    Hold time of tDQS flop
      parameter TWLO             =    9000; // tWLO       ps    Write levelization output delay
      parameter TAA_MIN          =   13125; // TAA        ps    Internal READ command to first data
      parameter CL_TIME          =   13125; // CL         ps    Minimum CAS Latency
  `else `ifdef sg187                        // sg187  is equivalent to the JEDEC DDR3-1066G (8-8-8) speed bin
      parameter TCK_MIN          =    1875; // tCK        ps    Minimum Clock Cycle Time
      parameter TJIT_PER         =      90; // tJIT(per)  ps    Period JItter
      parameter TJIT_CC          =     180; // tJIT(cc)   ps    Cycle to Cycle jitter
      parameter TERR_2PER        =     132; // tERR(2per) ps    Accumulated Error (2-cycle)
      parameter TERR_3PER        =     157; // tERR(3per) ps    Accumulated Error (3-cycle)
      parameter TERR_4PER        =     175; // tERR(4per) ps    Accumulated Error (4-cycle)
      parameter TERR_5PER        =     188; // tERR(5per) ps    Accumulated Error (5-cycle)
      parameter TERR_6PER        =     200; // tERR(6per) ps    Accumulated Error (6-cycle)
      parameter TERR_7PER        =     209; // tERR(7per) ps    Accumulated Error (7-cycle)
      parameter TERR_8PER        =     217; // tERR(8per) ps    Accumulated Error (8-cycle)
      parameter TERR_9PER        =     224; // tERR(9per) ps    Accumulated Error (9-cycle)
      parameter TERR_10PER       =     231; // tERR(10per)ps    Accumulated Error (10-cycle)
      parameter TERR_11PER       =     237; // tERR(11per)ps    Accumulated Error (11-cycle)
      parameter TERR_12PER       =     242; // tERR(12per)ps    Accumulated Error (12-cycle)
      parameter TDS              =      75; // tDS        ps    DQ and DM input setup time relative to DQS
      parameter TDH              =     100; // tDH        ps    DQ and DM input hold time relative to DQS
      parameter TDQSQ            =     150; // tDQSQ      ps    DQS-DQ skew, DQS to last DQ valid, per group, per access
      parameter TDQSS            =    0.25; // tDQSS      tCK   Rising clock edge to DQS/DQS# latching transition
      parameter TDSS             =    0.20; // tDSS       tCK   DQS falling edge to CLK rising (setup time)
      parameter TDSH             =    0.20; // tDSH       tCK   DQS falling edge from CLK rising (hold time)
      parameter TDQSCK           =     300; // tDQSCK     ps    DQS output access time from CK/CK#
      parameter TQSH             =    0.38; // tQSH       tCK   DQS Output High Pulse Width
      parameter TQSL             =    0.38; // tQSL       tCK   DQS Output Low Pulse Width
      parameter TDIPW            =     490; // tDIPW      ps    DQ and DM input Pulse Width
      parameter TIPW             =     780; // tIPW       ps    Control and Address input Pulse Width
      parameter TIS              =     275; // tIS        ps    Input Setup Time
      parameter TIH              =     200; // tIH        ps    Input Hold Time
      parameter TRAS_MIN         =   37500; // tRAS       ps    Minimum Active to Precharge command time
      parameter TRC              =   52500; // tRC        ps    Active to Active/Auto Refresh command time
      parameter TRCD             =   15000; // tRCD       ps    Active to Read/Write command time
      parameter TRP              =   15000; // tRP        ps    Precharge command period
      parameter TXP              =    7500; // tXP        ps    Exit power down to a valid command
      parameter TCKE             =    5625; // tCKE       ps    CKE minimum high or low pulse width
      parameter TAON             =     300; // tAON       ps    RTT turn-on from ODTLon reference
      parameter TWLS             =     245; // tWLS       ps    Setup time for tDQS flop
      parameter TWLH             =     245; // tWLH       ps    Hold time of tDQS flop
      parameter TWLO             =    9000; // tWLO       ps    Write levelization output delay
      parameter TAA_MIN          =   15000; // TAA        ps    Internal READ command to first data
      parameter CL_TIME          =   15000; // CL         ps    Minimum CAS Latency
  `else `ifdef sg25E                        // sg25E is equivalent to the JEDEC DDR3-800D (5-5-5) speed bin
      parameter TCK_MIN          =    2500; // tCK        ps    Minimum Clock Cycle Time
      parameter TJIT_PER         =     100; // tJIT(per)  ps    Period JItter
      parameter TJIT_CC          =     200; // tJIT(cc)   ps    Cycle to Cycle jitter
      parameter TERR_2PER        =     147; // tERR(2per) ps    Accumulated Error (2-cycle)
      parameter TERR_3PER        =     175; // tERR(3per) ps    Accumulated Error (3-cycle)
      parameter TERR_4PER        =     194; // tERR(4per) ps    Accumulated Error (4-cycle)
      parameter TERR_5PER        =     209; // tERR(5per) ps    Accumulated Error (5-cycle)
      parameter TERR_6PER        =     222; // tERR(6per) ps    Accumulated Error (6-cycle)
      parameter TERR_7PER        =     232; // tERR(7per) ps    Accumulated Error (7-cycle)
      parameter TERR_8PER        =     241; // tERR(8per) ps    Accumulated Error (8-cycle)
      parameter TERR_9PER        =     249; // tERR(9per) ps    Accumulated Error (9-cycle)
      parameter TERR_10PER       =     257; // tERR(10per)ps    Accumulated Error (10-cycle)
      parameter TERR_11PER       =     263; // tERR(11per)ps    Accumulated Error (11-cycle)
      parameter TERR_12PER       =     269; // tERR(12per)ps    Accumulated Error (12-cycle)
      parameter TDS              =     125; // tDS        ps    DQ and DM input setup time relative to DQS
      parameter TDH              =     150; // tDH        ps    DQ and DM input hold time relative to DQS
      parameter TDQSQ            =     200; // tDQSQ      ps    DQS-DQ skew, DQS to last DQ valid, per group, per access
      parameter TDQSS            =    0.25; // tDQSS      tCK   Rising clock edge to DQS/DQS# latching transition
      parameter TDSS             =    0.20; // tDSS       tCK   DQS falling edge to CLK rising (setup time)
      parameter TDSH             =    0.20; // tDSH       tCK   DQS falling edge from CLK rising (hold time)
      parameter TDQSCK           =     400; // tDQSCK     ps    DQS output access time from CK/CK#
      parameter TQSH             =    0.38; // tQSH       tCK   DQS Output High Pulse Width
      parameter TQSL             =    0.38; // tQSL       tCK   DQS Output Low Pulse Width
      parameter TDIPW            =     600; // tDIPW      ps    DQ and DM input Pulse Width
      parameter TIPW             =     900; // tIPW       ps    Control and Address input Pulse Width
      parameter TIS              =     350; // tIS        ps    Input Setup Time
      parameter TIH              =     275; // tIH        ps    Input Hold Time
      parameter TRAS_MIN         =   37500; // tRAS       ps    Minimum Active to Precharge command time
      parameter TRC              =   50000; // tRC        ps    Active to Active/Auto Refresh command time
      parameter TRCD             =   12500; // tRCD       ps    Active to Read/Write command time
      parameter TRP              =   12500; // tRP        ps    Precharge command period
      parameter TXP              =    7500; // tXP        ps    Exit power down to a valid command
      parameter TCKE             =    7500; // tCKE       ps    CKE minimum high or low pulse width
      parameter TAON             =     400; // tAON       ps    RTT turn-on from ODTLon reference
      parameter TWLS             =     325; // tWLS       ps    Setup time for tDQS flop
      parameter TWLH             =     325; // tWLH       ps    Hold time of tDQS flop
      parameter TWLO             =    9000; // tWLO       ps    Write levelization output delay
      parameter TAA_MIN          =   12500; // TAA        ps    Internal READ command to first data
      parameter CL_TIME          =   12500; // CL         ps    Minimum CAS Latency
  `else
      `define sg25                        // sg25 is equivalent to the JEDEC DDR3-800E (6-6-6) speed bin
      parameter TCK_MIN          =    2500; // tCK        ps    Minimum Clock Cycle Time
      parameter TJIT_PER         =     100; // tJIT(per)  ps    Period JItter
      parameter TJIT_CC          =     200; // tJIT(cc)   ps    Cycle to Cycle jitter
      parameter TERR_2PER        =     147; // tERR(2per) ps    Accumulated Error (2-cycle)
      parameter TERR_3PER        =     175; // tERR(3per) ps    Accumulated Error (3-cycle)
      parameter TERR_4PER        =     194; // tERR(4per) ps    Accumulated Error (4-cycle)
      parameter TERR_5PER        =     209; // tERR(5per) ps    Accumulated Error (5-cycle)
      parameter TERR_6PER        =     222; // tERR(6per) ps    Accumulated Error (6-cycle)
      parameter TERR_7PER        =     232; // tERR(7per) ps    Accumulated Error (7-cycle)
      parameter TERR_8PER        =     241; // tERR(8per) ps    Accumulated Error (8-cycle)
      parameter TERR_9PER        =     249; // tERR(9per) ps    Accumulated Error (9-cycle)
      parameter TERR_10PER       =     257; // tERR(10per)ps    Accumulated Error (10-cycle)
      parameter TERR_11PER       =     263; // tERR(11per)ps    Accumulated Error (11-cycle)
      parameter TERR_12PER       =     269; // tERR(12per)ps    Accumulated Error (12-cycle)
      parameter TDS              =     125; // tDS        ps    DQ and DM input setup time relative to DQS
      parameter TDH              =     150; // tDH        ps    DQ and DM input hold time relative to DQS
      parameter TDQSQ            =     200; // tDQSQ      ps    DQS-DQ skew, DQS to last DQ valid, per group, per access
      parameter TDQSS            =    0.25; // tDQSS      tCK   Rising clock edge to DQS/DQS# latching transition
      parameter TDSS             =    0.20; // tDSS       tCK   DQS falling edge to CLK rising (setup time)
      parameter TDSH             =    0.20; // tDSH       tCK   DQS falling edge from CLK rising (hold time)
      parameter TDQSCK           =     400; // tDQSCK     ps    DQS output access time from CK/CK#
      parameter TQSH             =    0.38; // tQSH       tCK   DQS Output High Pulse Width
      parameter TQSL             =    0.38; // tQSL       tCK   DQS Output Low Pulse Width
      parameter TDIPW            =     600; // tDIPW      ps    DQ and DM input Pulse Width
      parameter TIPW             =     900; // tIPW       ps    Control and Address input Pulse Width
      parameter TIS              =     350; // tIS        ps    Input Setup Time
      parameter TIH              =     275; // tIH        ps    Input Hold Time
      parameter TRAS_MIN         =   37500; // tRAS       ps    Minimum Active to Precharge command time
      parameter TRC              =   52500; // tRC        ps    Active to Active/Auto Refresh command time
      parameter TRCD             =   15000; // tRCD       ps    Active to Read/Write command time
      parameter TRP              =   15000; // tRP        ps    Precharge command period
      parameter TXP              =    7500; // tXP        ps    Exit power down to a valid command
      parameter TCKE             =    7500; // tCKE       ps    CKE minimum high or low pulse width
      parameter TAON             =     400; // tAON       ps    RTT turn-on from ODTLon reference
      parameter TWLS             =     325; // tWLS       ps    Setup time for tDQS flop
      parameter TWLH             =     325; // tWLH       ps    Hold time of tDQS flop
      parameter TWLO             =    9000; // tWLO       ps    Write levelization output delay
      parameter TAA_MIN          =   15000; // TAA        ps    Internal READ command to first data
      parameter CL_TIME          =   15000; // CL         ps    Minimum CAS Latency
  `endif `endif `endif `endif `endif `endif `endif `endif `endif `endif `endif `endif `endif
  `ifdef x16
    `ifdef sg094E
      parameter TRRD             =    7500; // tRRD       ps     (2KB page size) Active bank a to Active bank b command time
      parameter TFAW             =   30000; // tFAW       ps     (2KB page size) Four Bank Activate window
    `else `ifdef sg094
      parameter TRRD             =    7500; // tRRD       ps     (2KB page size) Active bank a to Active bank b command time
      parameter TFAW             =   30000; // tFAW       ps     (2KB page size) Four Bank Activate window
    `else `ifdef sg107F
      parameter TRRD             =    7500; // tRRD       ps     (2KB page size) Active bank a to Active bank b command time
      parameter TFAW             =   35000; // tFAW       ps     (2KB page size) Four Bank Activate window
    `else `ifdef sg107E
      parameter TRRD             =    7500; // tRRD       ps     (2KB page size) Active bank a to Active bank b command time
      parameter TFAW             =   35000; // tFAW       ps     (2KB page size) Four Bank Activate window
    `else `ifdef sg107
      parameter TRRD             =    7500; // tRRD       ps     (2KB page size) Active bank a to Active bank b command time
      parameter TFAW             =   35000; // tFAW       ps     (2KB page size) Four Bank Activate window
    `else `ifdef sg125F
      parameter TRRD             =    7500; // tRRD       ps     (2KB page size) Active bank a to Active bank b command time
      parameter TFAW             =   40000; // tFAW       ps     (2KB page size) Four Bank Activate window
    `else `ifdef sg125E
      parameter TRRD             =    7500; // tRRD       ps     (2KB page size) Active bank a to Active bank b command time
      parameter TFAW             =   40000; // tFAW       ps     (2KB page size) Four Bank Activate window
    `else `ifdef sg125
      parameter TRRD             =    7500; // tRRD       ps     (2KB page size) Active bank a to Active bank b command time
      parameter TFAW             =   40000; // tFAW       ps     (2KB page size) Four Bank Activate window
    `else `ifdef sg15E
      parameter TRRD             =    7500; // tRRD       ps     (2KB page size) Active bank a to Active bank b command time
      parameter TFAW             =   45000; // tFAW       ps     (2KB page size) Four Bank Activate window
    `else `ifdef sg15
      parameter TRRD             =    7500; // tRRD       ps     (2KB page size) Active bank a to Active bank b command time
      parameter TFAW             =   45000; // tFAW       ps     (2KB page size) Four Bank Activate window
    `else // sg187E, sg187, sg25, sg25E
      parameter TRRD             =   10000; // tRRD       ps     (2KB page size) Active bank a to Active bank b command time
      parameter TFAW             =   50000; // tFAW       ps     (2KB page size) Four Bank Activate window
    `endif `endif `endif `endif `endif `endif `endif `endif `endif `endif
  `else // x4, x8
    `ifdef sg094E
      parameter TRRD             =    6000; // tRRD       ps     (1KB page size) Active bank a to Active bank b command time
      parameter TFAW             =   25000; // tFAW       ps     (1KB page size) Four Bank Activate window
    `else `ifdef sg094
      parameter TRRD             =    6000; // tRRD       ps     (1KB page size) Active bank a to Active bank b command time
      parameter TFAW             =   25000; // tFAW       ps     (1KB page size) Four Bank Activate window
    `else `ifdef sg107F
      parameter TRRD             =    6000; // tRRD       ps     (1KB page size) Active bank a to Active bank b command time
      parameter TFAW             =   25000; // tFAW       ps     (1KB page size) Four Bank Activate window
    `else `ifdef sg107E
      parameter TRRD             =    6000; // tRRD       ps     (1KB page size) Active bank a to Active bank b command time
      parameter TFAW             =   25000; // tFAW       ps     (1KB page size) Four Bank Activate window
    `else `ifdef sg107
      parameter TRRD             =    6000; // tRRD       ps     (1KB page size) Active bank a to Active bank b command time
      parameter TFAW             =   25000; // tFAW       ps     (1KB page size) Four Bank Activate window
    `else `ifdef sg125F
      parameter TRRD             =    6000; // tRRD       ps     (1KB page size) Active bank a to Active bank b command time
      parameter TFAW             =   30000; // tFAW       ps     (1KB page size) Four Bank Activate window
    `else `ifdef sg125E
      parameter TRRD             =    6000; // tRRD       ps     (1KB page size) Active bank a to Active bank b command time
      parameter TFAW             =   30000; // tFAW       ps     (1KB page size) Four Bank Activate window
    `else `ifdef sg125
      parameter TRRD             =    6000; // tRRD       ps     (1KB page size) Active bank a to Active bank b command time
      parameter TFAW             =   30000; // tFAW       ps     (1KB page size) Four Bank Activate window
    `else `ifdef sg15E
      parameter TRRD             =    6000; // tRRD       ps     (1KB page size) Active bank a to Active bank b command time
      parameter TFAW             =   30000; // tFAW       ps     (1KB page size) Four Bank Activate window
    `else `ifdef sg15
      parameter TRRD             =    6000; // tRRD       ps     (1KB page size) Active bank a to Active bank b command time
      parameter TFAW             =   30000; // tFAW       ps     (1KB page size) Four Bank Activate window
    `else `ifdef sg187E
      parameter TRRD             =    7500; // tRRD       ps     (1KB page size) Active bank a to Active bank b command time
      parameter TFAW             =   37500; // tFAW       ps     (1KB page size) Four Bank Activate window
    `else `ifdef sg187
      parameter TRRD             =    7500; // tRRD       ps     (1KB page size) Active bank a to Active bank b command time
      parameter TFAW             =   37500; // tFAW       ps     (1KB page size) Four Bank Activate window
    `else // sg25, sg25E
      parameter TRRD             =   10000; // tRRD       ps     (1KB page size) Active bank a to Active bank b command time
      parameter TFAW             =   40000; // tFAW       ps     (1KB page size) Four Bank Activate window
    `endif `endif `endif `endif `endif `endif `endif `endif `endif `endif `endif `endif
`endif
      // Timing Parameters
      // Mode Register
      parameter CL_MIN           =       5; // CL         tCK   Minimum CAS Latency
      parameter CL_MAX           =      14; // CL         tCK   Maximum CAS Latency
      parameter AL_MIN           =       0; // AL         tCK   Minimum Additive Latency
      parameter AL_MAX           =       2; // AL         tCK   Maximum Additive Latency
      parameter WR_MIN           =       5; // WR         tCK   Minimum Write Recovery
      parameter WR_MAX           =      16; // WR         tCK   Maximum Write Recovery
      parameter BL_MIN           =       4; // BL         tCK   Minimum Burst Length
      parameter BL_MAX           =       8; // BL         tCK   Minimum Burst Length
      parameter CWL_MIN          =       5; // CWL        tCK   Minimum CAS Write Latency
      parameter CWL_MAX          =      10; // CWL        tCK   Maximum CAS Write Latency
      // Clock
      parameter TCK_MAX          =    3300; // tCK        ps    Maximum Clock Cycle Time
      parameter TCH_AVG_MIN      =    0.47; // tCH        tCK   Minimum Clock High-Level Pulse Width
      parameter TCL_AVG_MIN      =    0.47; // tCL        tCK   Minimum Clock Low-Level Pulse Width
      parameter TCH_AVG_MAX      =    0.53; // tCH        tCK   Maximum Clock High-Level Pulse Width
      parameter TCL_AVG_MAX      =    0.53; // tCL        tCK   Maximum Clock Low-Level Pulse Width
      parameter TCH_ABS_MIN      =    0.43; // tCH        tCK   Minimum Clock High-Level Pulse Width
      parameter TCL_ABS_MIN      =    0.43; // tCL        tCK   Maximum Clock Low-Level Pulse Width
      parameter TCKE_TCK         =       3; // tCKE       tCK   CKE minimum high or low pulse width
      parameter TAA_MAX          =   20000; // TAA        ps    Internal READ command to first data
      // Data OUT
      parameter TQH              =    0.38; // tQH        ps    DQ output hold time from DQS, DQS#
      // Data Strobe OUT
      parameter TRPRE            =    0.90; // tRPRE      tCK   DQS Read Preamble
      parameter TRPST            =    0.30; // tRPST      tCK   DQS Read Postamble
      // Data Strobe IN
      parameter TDQSH            =    0.45; // tDQSH      tCK   DQS input High Pulse Width
      parameter TDQSL            =    0.45; // tDQSL      tCK   DQS input Low Pulse Width
      parameter TWPRE            =    0.90; // tWPRE      tCK   DQS Write Preamble
      parameter TWPST            =    0.30; // tWPST      tCK   DQS Write Postamble
      // Command and Address
      parameter TZQCS            =      64; // tZQCS      tCK   ZQ Cal (Short) time
      parameter TZQINIT          =     512; // tZQinit    tCK   ZQ Cal (Long) time
      parameter TZQOPER          =     256; // tZQoper    tCK   ZQ Cal (Long) time
      parameter TCCD             =       4; // tCCD       tCK   Cas to Cas command delay
      parameter TCCD_DG          =       2; // tCCD_DG    tCK   Cas to Cas command delay to different group
      parameter TRAS_MAX         =    60e9; // tRAS       ps    Maximum Active to Precharge command time
      parameter TWR              =   15000; // tWR        ps    Write recovery time
      parameter TMRD             =       4; // tMRD       tCK   Load Mode Register command cycle time
      parameter TMOD             =   15000; // tMOD       ps    LOAD MODE to non-LOAD MODE command cycle time
      parameter TMOD_TCK         =      12; // tMOD       tCK   LOAD MODE to non-LOAD MODE command cycle time
      parameter TRRD_TCK         =       4; // tRRD       tCK   Active bank a to Active bank b command time
      parameter TRRD_DG          =    3000; // tRRD_DG    ps     Active bank a to Active bank b command time to different group
      parameter TRRD_DG_TCK      =       2; // tRRD_DG    tCK   Active bank a to Active bank b command time to different group
      parameter TRTP             =    7500; // tRTP       ps    Read to Precharge command delay
      parameter TRTP_TCK         =       4; // tRTP       tCK   Read to Precharge command delay
      parameter TWTR             =    7500; // tWTR       ps    Write to Read command delay
      parameter TWTR_DG          =    3750; // tWTR_DG    ps    Write to Read command delay to different group
      parameter TWTR_TCK         =       4; // tWTR       tCK   Write to Read command delay
      parameter TWTR_DG_TCK      =       2; // tWTR_DG    tCK   Write to Read command delay to different group
      parameter TDLLK            =     512; // tDLLK      tCK   DLL locking time
      // Refresh - 1Gb
      parameter TRFC_MIN         =  110000; // tRFC       ps    Refresh to Refresh Command interval minimum value
      parameter TRFC_MAX         =70312500; // tRFC       ps    Refresh to Refresh Command Interval maximum value
      // Power Down
      parameter TXP_TCK          =       3; // tXP        tCK   Exit power down to a valid command
      parameter TXPDLL           =   24000; // tXPDLL     ps    Exit precharge power down to READ or WRITE command (DLL-off mode)
      parameter TXPDLL_TCK       =      10; // tXPDLL     tCK   Exit precharge power down to READ or WRITE command (DLL-off mode)
      parameter TACTPDEN         =       1; // tACTPDEN   tCK   Timing of last ACT command to power down entry
      parameter TPRPDEN          =       1; // tPREPDEN   tCK   Timing of last PRE command to power down entry
      parameter TREFPDEN         =       1; // tARPDEN    tCK   Timing of last REFRESH command to power down entry
      parameter TCPDED           =       1; // tCPDED     tCK   Command pass disable/enable delay
      parameter TPD_MAX          =TRFC_MAX; // tPD        ps    Power-down entry-to-exit timing
      parameter TXPR             =  120000; // tXPR       ps    Exit Reset from CKE assertion to a valid command
      parameter TXPR_TCK         =       5; // tXPR       tCK   Exit Reset from CKE assertion to a valid command
      // Self Refresh
      parameter TXS              =  120000; // tXS        ps    Exit self refesh to a non-read or write command
      parameter TXS_TCK          =       5; // tXS        tCK   Exit self refesh to a non-read or write command
      parameter TXSDLL           =   TDLLK; // tXSRD      tCK   Exit self refresh to a read or write command
      parameter TISXR            =     TIS; // tISXR      ps    CKE setup time during self refresh exit.
      parameter TCKSRE           =   10000; // tCKSRE     ps    Valid Clock requirement after self refresh entry (SRE)
      parameter TCKSRE_TCK       =       5; // tCKSRE     tCK   Valid Clock requirement after self refresh entry (SRE)
      parameter TCKSRX           =   10000; // tCKSRX     ps    Valid Clock requirement prior to self refresh exit (SRX)
      parameter TCKSRX_TCK       =       5; // tCKSRX     tCK   Valid Clock requirement prior to self refresh exit (SRX)
      parameter TCKESR_TCK       =       4; // tCKESR     tCK   Minimum CKE low width for Self Refresh entry to exit timing
      // ODT
      parameter TAOF             =     0.7; // tAOF       tCK   RTT turn-off from ODTLoff reference
      parameter TAONPD           =    8500; // tAONPD     ps    Asynchronous RTT turn-on delay (Power-Down with DLL frozen)
      parameter TAOFPD           =    8500; // tAONPD     ps    Asynchronous RTT turn-off delay (Power-Down with DLL frozen)
      parameter ODTH4            =       4; // ODTH4      tCK   ODT minimum HIGH time after ODT assertion or write (BL4)
      parameter ODTH8            =       6; // ODTH8      tCK   ODT minimum HIGH time after write (BL8)
      parameter TADC             =     0.7; // tADC       tCK   RTT dynamic change skew
      // Write Levelization
      parameter TWLMRD           =      40; // tWLMRD     tCK   First DQS pulse rising edge after tDQSS margining mode is programmed
      parameter TWLDQSEN         =      25; // tWLDQSEN   tCK   DQS/DQS delay after tDQSS margining mode is programmed
      parameter TWLOE            =    2000; // tWLOE      ps    Write levelization output error
      // Size Parameters based on Part Width
  `ifdef x4
      parameter DM_BITS          =       1; // Set this parameter to control how many Data Mask bits are used
      parameter ADDR_BITS        =      14; // MAX Address Bits
      parameter ROW_BITS         =      14; // Set this parameter to control how many Address bits are used
      parameter COL_BITS         =      11; // Set this parameter to control how many Column bits are used
      parameter DQ_BITS          =       4; // Set this parameter to control how many Data bits are used       **Same as part bit width**
      parameter DQS_BITS         =       1; // Set this parameter to control how many Dqs bits are used
  `else `ifdef x8
      parameter DM_BITS          =       1; // Set this parameter to control how many Data Mask bits are used
      parameter ADDR_BITS        =      14; // MAX Address Bits
      parameter ROW_BITS         =      14; // Set this parameter to control how many Address bits are used
      parameter COL_BITS         =      10; // Set this parameter to control how many Column bits are used
      parameter DQ_BITS          =       8; // Set this parameter to control how many Data bits are used       **Same as part bit width**
      parameter DQS_BITS         =       1; // Set this parameter to control how many Dqs bits are used
  `else
      `define x16
      parameter DM_BITS          =       2; // Set this parameter to control how many Data Mask bits are used
      parameter ADDR_BITS        =      13; // MAX Address Bits
      parameter ROW_BITS         =      13; // Set this parameter to control how many Address bits are used
      parameter COL_BITS         =      10; // Set this parameter to control how many Column bits are used
      parameter DQ_BITS          =      16; // Set this parameter to control how many Data bits are used       **Same as part bit width**
      parameter DQS_BITS         =       2; // Set this parameter to control how many Dqs bits are used
  `endif `endif
      // Size Parameters
      parameter BA_BITS          =       3; // Set this parmaeter to control how many Bank Address bits are used
      parameter MEM_BITS         =      15; // Set this parameter to control how many write data bursts can be stored in memory.  The default is 2^10=1024.
      parameter AP               =      10; // the address bit that controls auto-precharge and precharge-all
      parameter BC               =      12; // the address bit that controls burst chop
      parameter BL_BITS          =       3; // the number of bits required to count to BL_MAX
      parameter BO_BITS          =       2; // the number of Burst Order Bits
  `ifdef QUAD_RANK
      `define DUAL_RANK // also define DUAL_RANK
      parameter CS_BITS          =       4; // Number of Chip Select Bits
      parameter RANKS            =       4; // Number of Chip Selects
  `else `ifdef DUAL_RANK
      parameter CS_BITS          =       2; // Number of Chip Select Bits
      parameter RANKS            =       2; // Number of Chip Selects
  `else
      parameter CS_BITS          =       2; // Number of Chip Select Bits
      parameter RANKS            =       1; // Number of Chip Selects
  `endif `endif
      // Simulation parameters
      parameter RZQ              =     240; // termination resistance
      parameter PRE_DEF_PAT      =   8'hAA; // value returned during mpr pre-defined pattern readout
      parameter STOP_ON_ERROR    =       1; // If set to 1, the model will halt on command sequence/major errors
      parameter DEBUG            =       0; // Turn on Debug messages
      parameter BUS_DELAY        =       0; // delay in nanoseconds
      parameter RANDOM_OUT_DELAY =       0; // If set to 1, the model will put a random amount of delay on DQ/DQS during reads
      parameter RANDOM_SEED    = 711689044; //seed value for random generator.
      parameter RDQSEN_PRE       =       2; // DQS driving time prior to first read strobe
      parameter RDQSEN_PST       =       1; // DQS driving time after last read strobe
      parameter RDQS_PRE         =       2; // DQS low time prior to first read strobe
      parameter RDQS_PST         =       1; // DQS low time after last read strobe
      parameter RDQEN_PRE        =       0; // DQ/DM driving time prior to first read data
      parameter RDQEN_PST        =       0; // DQ/DM driving time after last read data
      parameter WDQS_PRE         =       2; // DQS half clock periods prior to first write strobe
      parameter WDQS_PST         =       1; // DQS half clock periods after last write strobe
  // check for legal cas latency based on the cas write latency
  function valid_cl;
      input [3:0] cl;
      input [3:0] cwl;
      case ({cwl, cl})
  `ifdef sg094E
          {4'd5, 4'd5 },
          {4'd5, 4'd6 },
          {4'd6, 4'd7 },
          {4'd6, 4'd8 },
          {4'd7, 4'd9 },
          {4'd7, 4'd10},
          {4'd8, 4'd10},
          {4'd8, 4'd11},
          {4'd8, 4'd12},
          {4'd9, 4'd12},
          {4'd9, 4'd13},
          {4'd9, 4'd14},
          {4'd10, 4'd13},
          {4'd10, 4'd14}: valid_cl = 1;
  `else `ifdef sg094
          {4'd5, 4'd6 },
          {4'd6, 4'd7 },
          {4'd6, 4'd8 },
          {4'd7, 4'd10},
          {4'd8, 4'd11},
          {4'd8, 4'd12},
          {4'd9, 4'd13},
          {4'd9, 4'd14},
          {4'd10, 4'd14}: valid_cl = 1;
  `else `ifdef sg107F
          {4'd5, 4'd6 },
          {4'd6, 4'd7 },
          {4'd6, 4'd8 },
          {4'd7, 4'd9 },
          {4'd7, 4'd10},
          {4'd8, 4'd11},
          {4'd8, 4'd12},
          {4'd9, 4'd12},
          {4'd9, 4'd13},
          {4'd9, 4'd14}: valid_cl = 1;
  `else `ifdef sg107E
          {4'd5, 4'd6 },
          {4'd6, 4'd8 },
          {4'd7, 4'd10},
          {4'd8, 4'd12},
          {4'd9, 4'd13},
          {4'd9, 4'd14}: valid_cl = 1;
  `else `ifdef sg107
          {4'd5, 4'd6 },
          {4'd6, 4'd8 },
          {4'd7, 4'd10},
          {4'd8, 4'd12},
          {4'd9, 4'd14}: valid_cl = 1;
  `else `ifdef sg125F
          {4'd5, 4'd5 },
          {4'd5, 4'd6 },
          {4'd6, 4'd7 },
          {4'd6, 4'd8 },
          {4'd7, 4'd8 },
          {4'd7, 4'd9 },
          {4'd7, 4'd10},
          {4'd8, 4'd9 },
          {4'd8, 4'd10},
          {4'd8, 4'd11}: valid_cl = 1;
  `else `ifdef sg125E
          {4'd5, 4'd5 },
          {4'd5, 4'd6 },
          {4'd6, 4'd7 },
          {4'd6, 4'd8 },
          {4'd7, 4'd9 },
          {4'd7, 4'd10},
          {4'd8, 4'd10},
          {4'd8, 4'd11}: valid_cl = 1;
  `else `ifdef sg125
          {4'd5, 4'd6 },
          {4'd6, 4'd7 },
          {4'd6, 4'd8 },
          {4'd7, 4'd9 },
          {4'd7, 4'd10},
          {4'd8, 4'd11}: valid_cl = 1;
  `else `ifdef sg15E
          {4'd5, 4'd6 },
          {4'd6, 4'd7 },
          {4'd6, 4'd8 },
          {4'd7, 4'd9 },
          {4'd7, 4'd10}: valid_cl = 1;
  `else `ifdef sg15
          {4'd5, 4'd6 },
          {4'd6, 4'd8 },
          {4'd7, 4'd10}: valid_cl = 1;
  `else `ifdef sg187E
          {4'd5, 4'd6 },
          {4'd6, 4'd7 },
          {4'd6, 4'd8 }: valid_cl = 1;
  `else `ifdef sg187
          {4'd5, 4'd6 },
          {4'd6, 4'd8 }: valid_cl = 1;
  `else `ifdef sg25E
          {4'd5, 4'd5 },
          {4'd5, 4'd6 }: valid_cl = 1;
  `else `ifdef sg25
          {4'd5, 4'd6 }: valid_cl = 1;
  `endif `endif `endif `endif `endif `endif `endif `endif `endif  `endif `endif `endif `endif `endif
          default : valid_cl = 0;
      endcase
  endfunction
  // find the minimum valid cas write latency
  function [3:0] min_cwl;
      input period;
      real period;
      min_cwl = (period >= 2500.0) ? 5:
                (period >= 1875.0) ? 6:
                (period >= 1500.0) ? 7:
                (period >= 1250.0) ? 8:
                (period >= 15e3/14) ? 9:
                10; // (period >= 937.5)
  endfunction
  // find the minimum valid cas latency
  function [3:0] min_cl;
      input period;
      real period;
      reg [3:0] cwl;
      reg [3:0] cl;
      begin
          cwl = min_cwl(period);
          for (cl=CL_MAX; cl>=CL_MIN; cl=cl-1) begin
              if (valid_cl(cl, cwl)) begin
                  min_cl = cl;
              end
          end
      end
  endfunction
`elsif x2Gb // 2Gb parts
                                            // SYMBOL     UNITS DESCRIPTION
  `ifdef sg15E                              // sg15E is equivelant to the JEDEC DDR3-1333H (9-9-9) speed bin
      parameter TCK_MIN          =    1500; // tCK        ps    Minimum Clock Cycle Time
      parameter TJIT_PER         =      80; // tJIT(per)  ps    Period JItter
      parameter TJIT_CC          =     160; // tJIT(cc)   ps    Cycle to Cycle jitter
      parameter TERR_2PER        =     118; // tERR(2per) ps    Accumulated Error (2-cycle)
      parameter TERR_3PER        =     140; // tERR(3per) ps    Accumulated Error (3-cycle)
      parameter TERR_4PER        =     155; // tERR(4per) ps    Accumulated Error (4-cycle)
      parameter TERR_5PER        =     168; // tERR(5per) ps    Accumulated Error (5-cycle)
      parameter TERR_6PER        =     177; // tERR(6per) ps    Accumulated Error (6-cycle)
      parameter TERR_7PER        =     186; // tERR(7per) ps    Accumulated Error (7-cycle)
      parameter TERR_8PER        =     193; // tERR(8per) ps    Accumulated Error (8-cycle)
      parameter TERR_9PER        =     200; // tERR(9per) ps    Accumulated Error (9-cycle)
      parameter TERR_10PER       =     205; // tERR(10per)ps    Accumulated Error (10-cycle)
      parameter TERR_11PER       =     210; // tERR(11per)ps    Accumulated Error (11-cycle)
      parameter TERR_12PER       =     215; // tERR(12per)ps    Accumulated Error (12-cycle)
      parameter TDS              =      30; // tDS        ps    DQ and DM input setup time relative to DQS
      parameter TDH              =      65; // tDH        ps    DQ and DM input hold time relative to DQS
      parameter TDQSQ            =     125; // tDQSQ      ps    DQS-DQ skew, DQS to last DQ valid, per group, per access
      parameter TDQSS            =    0.25; // tDQSS      tCK   Rising clock edge to DQS/DQS# latching transition
      parameter TDSS             =    0.20; // tDSS       tCK   DQS falling edge to CLK rising (setup time)
      parameter TDSH             =    0.20; // tDSH       tCK   DQS falling edge from CLK rising (hold time)
      parameter TDQSCK           =     255; // tDQSCK     ps    DQS output access time from CK/CK#
      parameter TQSH             =    0.40; // tQSH       tCK   DQS Output High Pulse Width
      parameter TQSL             =    0.40; // tQSL       tCK   DQS Output Low Pulse Width
      parameter TDIPW            =     400; // tDIPW      ps    DQ and DM input Pulse Width
      parameter TIPW             =     620; // tIPW       ps    Control and Address input Pulse Width
      parameter TIS              =     190; // tIS        ps    Input Setup Time
      parameter TIH              =     140; // tIH        ps    Input Hold Time
      parameter TRAS_MIN         =   36000; // tRAS       ps    Minimum Active to Precharge command time
      parameter TRC              =   49500; // tRC        ps    Active to Active/Auto Refresh command time
      parameter TRCD             =   13500; // tRCD       ps    Active to Read/Write command time
      parameter TRP              =   13500; // tRP        ps    Precharge command period
      parameter TXP              =    6000; // tXP        ps    Exit power down to a valid command
      parameter TCKE             =    5625; // tCKE       ps    CKE minimum high or low pulse width
      parameter TAON             =     250; // tAON       ps    RTT turn-on from ODTLon reference
      parameter TWLS             =     195; // tWLS       ps    Setup time for tDQS flop
      parameter TWLH             =     195; // tWLH       ps    Hold time of tDQS flop
      parameter TWLO             =    9000; // tWLO       ps    Write levelization output delay
      parameter TAA_MIN          =   13500; // TAA        ps    Internal READ command to first data
      parameter CL_TIME          =   13500; // CL         ps    Minimum CAS Latency
  `else `ifdef sg15                         // sg15 is equivelant to the JEDEC DDR3-1333J (10-10-10) speed bin
      parameter TCK_MIN          =    1500; // tCK        ps    Minimum Clock Cycle Time
      parameter TJIT_PER         =      80; // tJIT(per)  ps    Period JItter
      parameter TJIT_CC          =     160; // tJIT(cc)   ps    Cycle to Cycle jitter
      parameter TERR_2PER        =     118; // tERR(2per) ps    Accumulated Error (2-cycle)
      parameter TERR_3PER        =     140; // tERR(3per) ps    Accumulated Error (3-cycle)
      parameter TERR_4PER        =     155; // tERR(4per) ps    Accumulated Error (4-cycle)
      parameter TERR_5PER        =     168; // tERR(5per) ps    Accumulated Error (5-cycle)
      parameter TERR_6PER        =     177; // tERR(6per) ps    Accumulated Error (6-cycle)
      parameter TERR_7PER        =     186; // tERR(7per) ps    Accumulated Error (7-cycle)
      parameter TERR_8PER        =     193; // tERR(8per) ps    Accumulated Error (8-cycle)
      parameter TERR_9PER        =     200; // tERR(9per) ps    Accumulated Error (9-cycle)
      parameter TERR_10PER       =     205; // tERR(10per)ps    Accumulated Error (10-cycle)
      parameter TERR_11PER       =     210; // tERR(11per)ps    Accumulated Error (11-cycle)
      parameter TERR_12PER       =     215; // tERR(12per)ps    Accumulated Error (12-cycle)
      parameter TDS              =      30; // tDS        ps    DQ and DM input setup time relative to DQS
      parameter TDH              =      65; // tDH        ps    DQ and DM input hold time relative to DQS
      parameter TDQSQ            =     125; // tDQSQ      ps    DQS-DQ skew, DQS to last DQ valid, per group, per access
      parameter TDQSS            =    0.25; // tDQSS      tCK   Rising clock edge to DQS/DQS# latching transition
      parameter TDSS             =    0.20; // tDSS       tCK   DQS falling edge to CLK rising (setup time)
      parameter TDSH             =    0.20; // tDSH       tCK   DQS falling edge from CLK rising (hold time)
      parameter TDQSCK           =     255; // tDQSCK     ps    DQS output access time from CK/CK#
      parameter TQSH             =    0.40; // tQSH       tCK   DQS Output High Pulse Width
      parameter TQSL             =    0.40; // tQSL       tCK   DQS Output Low Pulse Width
      parameter TDIPW            =     400; // tDIPW      ps    DQ and DM input Pulse Width
      parameter TIPW             =     620; // tIPW       ps    Control and Address input Pulse Width
      parameter TIS              =     190; // tIS        ps    Input Setup Time
      parameter TIH              =     140; // tIH        ps    Input Hold Time
      parameter TRAS_MIN         =   36000; // tRAS       ps    Minimum Active to Precharge command time
      parameter TRC              =   51000; // tRC        ps    Active to Active/Auto Refresh command time
      parameter TRCD             =   15000; // tRCD       ps    Active to Read/Write command time
      parameter TRP              =   15000; // tRP        ps    Precharge command period
      parameter TXP              =    6000; // tXP        ps    Exit power down to a valid command
      parameter TCKE             =    5625; // tCKE       ps    CKE minimum high or low pulse width
      parameter TAON             =     250; // tAON       ps    RTT turn-on from ODTLon reference
      parameter TWLS             =     195; // tWLS       ps    Setup time for tDQS flop
      parameter TWLH             =     195; // tWLH       ps    Hold time of tDQS flop
      parameter TWLO             =    9000; // tWLO       ps    Write levelization output delay
      parameter TAA_MIN          =   15000; // TAA        ps    Internal READ command to first data
      parameter CL_TIME          =   15000; // CL         ps    Minimum CAS Latency
  `else `ifdef sg187E                       // sg187E is equivelant to the JEDEC DDR3-1066F (7-7-7) speed bin
      parameter TCK_MIN          =    1875; // tCK        ps    Minimum Clock Cycle Time
      parameter TJIT_PER         =      90; // tJIT(per)  ps    Period JItter
      parameter TJIT_CC          =     180; // tJIT(cc)   ps    Cycle to Cycle jitter
      parameter TERR_2PER        =     132; // tERR(2per) ps    Accumulated Error (2-cycle)
      parameter TERR_3PER        =     157; // tERR(3per) ps    Accumulated Error (3-cycle)
      parameter TERR_4PER        =     175; // tERR(4per) ps    Accumulated Error (4-cycle)
      parameter TERR_5PER        =     188; // tERR(5per) ps    Accumulated Error (5-cycle)
      parameter TERR_6PER        =     200; // tERR(6per) ps    Accumulated Error (6-cycle)
      parameter TERR_7PER        =     209; // tERR(7per) ps    Accumulated Error (7-cycle)
      parameter TERR_8PER        =     217; // tERR(8per) ps    Accumulated Error (8-cycle)
      parameter TERR_9PER        =     224; // tERR(9per) ps    Accumulated Error (9-cycle)
      parameter TERR_10PER       =     231; // tERR(10per)ps    Accumulated Error (10-cycle)
      parameter TERR_11PER       =     237; // tERR(11per)ps    Accumulated Error (11-cycle)
      parameter TERR_12PER       =     242; // tERR(12per)ps    Accumulated Error (12-cycle)
      parameter TDS              =      25; // tDS        ps    DQ and DM input setup time relative to DQS
      parameter TDH              =     100; // tDH        ps    DQ and DM input hold time relative to DQS
      parameter TDQSQ            =     150; // tDQSQ      ps    DQS-DQ skew, DQS to last DQ valid, per group, per access
      parameter TDQSS            =    0.25; // tDQSS      tCK   Rising clock edge to DQS/DQS# latching transition
      parameter TDSS             =    0.20; // tDSS       tCK   DQS falling edge to CLK rising (setup time)
      parameter TDSH             =    0.20; // tDSH       tCK   DQS falling edge from CLK rising (hold time)
      parameter TDQSCK           =     300; // tDQSCK     ps    DQS output access time from CK/CK#
      parameter TQSH             =    0.38; // tQSH       tCK   DQS Output High Pulse Width
      parameter TQSL             =    0.38; // tQSL       tCK   DQS Output Low Pulse Width
      parameter TDIPW            =     490; // tDIPW      ps    DQ and DM input Pulse Width
      parameter TIPW             =     780; // tIPW       ps    Control and Address input Pulse Width
      parameter TIS              =     125; // tIS        ps    Input Setup Time
      parameter TIH              =     200; // tIH        ps    Input Hold Time
      parameter TRAS_MIN         =   37500; // tRAS       ps    Minimum Active to Precharge command time
      parameter TRC              =   50625; // tRC        ps    Active to Active/Auto Refresh command time
      parameter TRCD             =   13125; // tRCD       ps    Active to Read/Write command time
      parameter TRP              =   13125; // tRP        ps    Precharge command period
      parameter TXP              =    7500; // tXP        ps    Exit power down to a valid command
      parameter TCKE             =    5625; // tCKE       ps    CKE minimum high or low pulse width
      parameter TAON             =     300; // tAON       ps    RTT turn-on from ODTLon reference
      parameter TWLS             =     245; // tWLS       ps    Setup time for tDQS flop
      parameter TWLH             =     245; // tWLH       ps    Hold time of tDQS flop
      parameter TWLO             =    9000; // tWLO       ps    Write levelization output delay
      parameter TAA_MIN          =   13125; // TAA        ps    Internal READ command to first data
      parameter CL_TIME          =   13125; // CL         ps    Minimum CAS Latency
  `else `ifdef sg187                        // sg187  is equivelant to the JEDEC DDR3-1066G (8-8-8) speed bin
      parameter TCK_MIN          =    1875; // tCK        ps    Minimum Clock Cycle Time
      parameter TJIT_PER         =      90; // tJIT(per)  ps    Period JItter
      parameter TJIT_CC          =     180; // tJIT(cc)   ps    Cycle to Cycle jitter
      parameter TERR_2PER        =     132; // tERR(2per) ps    Accumulated Error (2-cycle)
      parameter TERR_3PER        =     157; // tERR(3per) ps    Accumulated Error (3-cycle)
      parameter TERR_4PER        =     175; // tERR(4per) ps    Accumulated Error (4-cycle)
      parameter TERR_5PER        =     188; // tERR(5per) ps    Accumulated Error (5-cycle)
      parameter TERR_6PER        =     200; // tERR(6per) ps    Accumulated Error (6-cycle)
      parameter TERR_7PER        =     209; // tERR(7per) ps    Accumulated Error (7-cycle)
      parameter TERR_8PER        =     217; // tERR(8per) ps    Accumulated Error (8-cycle)
      parameter TERR_9PER        =     224; // tERR(9per) ps    Accumulated Error (9-cycle)
      parameter TERR_10PER       =     231; // tERR(10per)ps    Accumulated Error (10-cycle)
      parameter TERR_11PER       =     237; // tERR(11per)ps    Accumulated Error (11-cycle)
      parameter TERR_12PER       =     242; // tERR(12per)ps    Accumulated Error (12-cycle)
      parameter TDS              =      25; // tDS        ps    DQ and DM input setup time relative to DQS
      parameter TDH              =     100; // tDH        ps    DQ and DM input hold time relative to DQS
      parameter TDQSQ            =     150; // tDQSQ      ps    DQS-DQ skew, DQS to last DQ valid, per group, per access
      parameter TDQSS            =    0.25; // tDQSS      tCK   Rising clock edge to DQS/DQS# latching transition
      parameter TDSS             =    0.20; // tDSS       tCK   DQS falling edge to CLK rising (setup time)
      parameter TDSH             =    0.20; // tDSH       tCK   DQS falling edge from CLK rising (hold time)
      parameter TDQSCK           =     300; // tDQSCK     ps    DQS output access time from CK/CK#
      parameter TQSH             =    0.38; // tQSH       tCK   DQS Output High Pulse Width
      parameter TQSL             =    0.38; // tQSL       tCK   DQS Output Low Pulse Width
      parameter TDIPW            =     490; // tDIPW      ps    DQ and DM input Pulse Width
      parameter TIPW             =     780; // tIPW       ps    Control and Address input Pulse Width
      parameter TIS              =     125; // tIS        ps    Input Setup Time
      parameter TIH              =     200; // tIH        ps    Input Hold Time
      parameter TRAS_MIN         =   37500; // tRAS       ps    Minimum Active to Precharge command time
      parameter TRC              =   52500; // tRC        ps    Active to Active/Auto Refresh command time
      parameter TRCD             =   15000; // tRCD       ps    Active to Read/Write command time
      parameter TRP              =   15000; // tRP        ps    Precharge command period
      parameter TXP              =    7500; // tXP        ps    Exit power down to a valid command
      parameter TCKE             =    5625; // tCKE       ps    CKE minimum high or low pulse width
      parameter TAON             =     300; // tAON       ps    RTT turn-on from ODTLon reference
      parameter TWLS             =     245; // tWLS       ps    Setup time for tDQS flop
      parameter TWLH             =     245; // tWLH       ps    Hold time of tDQS flop
      parameter TWLO             =    9000; // tWLO       ps    Write levelization output delay
      parameter TAA_MIN          =   15000; // TAA        ps    Internal READ command to first data
      parameter CL_TIME          =   15000; // CL         ps    Minimum CAS Latency
  `else `ifdef sg25E                        // sg25E is equivelant to the JEDEC DDR3-800D (5-5-5) speed bin
      parameter TCK_MIN          =    2500; // tCK        ps    Minimum Clock Cycle Time
      parameter TJIT_PER         =     100; // tJIT(per)  ps    Period JItter
      parameter TJIT_CC          =     200; // tJIT(cc)   ps    Cycle to Cycle jitter
      parameter TERR_2PER        =     147; // tERR(2per) ps    Accumulated Error (2-cycle)
      parameter TERR_3PER        =     175; // tERR(3per) ps    Accumulated Error (3-cycle)
      parameter TERR_4PER        =     194; // tERR(4per) ps    Accumulated Error (4-cycle)
      parameter TERR_5PER        =     209; // tERR(5per) ps    Accumulated Error (5-cycle)
      parameter TERR_6PER        =     222; // tERR(6per) ps    Accumulated Error (6-cycle)
      parameter TERR_7PER        =     232; // tERR(7per) ps    Accumulated Error (7-cycle)
      parameter TERR_8PER        =     241; // tERR(8per) ps    Accumulated Error (8-cycle)
      parameter TERR_9PER        =     249; // tERR(9per) ps    Accumulated Error (9-cycle)
      parameter TERR_10PER       =     257; // tERR(10per)ps    Accumulated Error (10-cycle)
      parameter TERR_11PER       =     263; // tERR(11per)ps    Accumulated Error (11-cycle)
      parameter TERR_12PER       =     269; // tERR(12per)ps    Accumulated Error (12-cycle)
      parameter TDS              =      75; // tDS        ps    DQ and DM input setup time relative to DQS
      parameter TDH              =     150; // tDH        ps    DQ and DM input hold time relative to DQS
      parameter TDQSQ            =     200; // tDQSQ      ps    DQS-DQ skew, DQS to last DQ valid, per group, per access
      parameter TDQSS            =    0.25; // tDQSS      tCK   Rising clock edge to DQS/DQS# latching transition
      parameter TDSS             =    0.20; // tDSS       tCK   DQS falling edge to CLK rising (setup time)
      parameter TDSH             =    0.20; // tDSH       tCK   DQS falling edge from CLK rising (hold time)
      parameter TDQSCK           =     400; // tDQSCK     ps    DQS output access time from CK/CK#
      parameter TQSH             =    0.38; // tQSH       tCK   DQS Output High Pulse Width
      parameter TQSL             =    0.38; // tQSL       tCK   DQS Output Low Pulse Width
      parameter TDIPW            =     600; // tDIPW      ps    DQ and DM input Pulse Width
      parameter TIPW             =     900; // tIPW       ps    Control and Address input Pulse Width
      parameter TIS              =     200; // tIS        ps    Input Setup Time
      parameter TIH              =     275; // tIH        ps    Input Hold Time
      parameter TRAS_MIN         =   37500; // tRAS       ps    Minimum Active to Precharge command time
      parameter TRC              =   50000; // tRC        ps    Active to Active/Auto Refresh command time
      parameter TRCD             =   12500; // tRCD       ps    Active to Read/Write command time
      parameter TRP              =   12500; // tRP        ps    Precharge command period
      parameter TXP              =    7500; // tXP        ps    Exit power down to a valid command
      parameter TCKE             =    7500; // tCKE       ps    CKE minimum high or low pulse width
      parameter TAON             =     400; // tAON       ps    RTT turn-on from ODTLon reference
      parameter TWLS             =     325; // tWLS       ps    Setup time for tDQS flop
      parameter TWLH             =     325; // tWLH       ps    Hold time of tDQS flop
      parameter TWLO             =    9000; // tWLO       ps    Write levelization output delay
      parameter TAA_MIN          =   12500; // TAA        ps    Internal READ command to first data
      parameter CL_TIME          =   12500; // CL         ps    Minimum CAS Latency
  `else
      `define sg25                        // sg25 is equivelant to the JEDEC DDR3-800E (6-6-6) speed bin
      parameter TCK_MIN          =    2500; // tCK        ps    Minimum Clock Cycle Time
      parameter TJIT_PER         =     100; // tJIT(per)  ps    Period JItter
      parameter TJIT_CC          =     200; // tJIT(cc)   ps    Cycle to Cycle jitter
      parameter TERR_2PER        =     147; // tERR(2per) ps    Accumulated Error (2-cycle)
      parameter TERR_3PER        =     175; // tERR(3per) ps    Accumulated Error (3-cycle)
      parameter TERR_4PER        =     194; // tERR(4per) ps    Accumulated Error (4-cycle)
      parameter TERR_5PER        =     209; // tERR(5per) ps    Accumulated Error (5-cycle)
      parameter TERR_6PER        =     222; // tERR(6per) ps    Accumulated Error (6-cycle)
      parameter TERR_7PER        =     232; // tERR(7per) ps    Accumulated Error (7-cycle)
      parameter TERR_8PER        =     241; // tERR(8per) ps    Accumulated Error (8-cycle)
      parameter TERR_9PER        =     249; // tERR(9per) ps    Accumulated Error (9-cycle)
      parameter TERR_10PER       =     257; // tERR(10per)ps    Accumulated Error (10-cycle)
      parameter TERR_11PER       =     263; // tERR(11per)ps    Accumulated Error (11-cycle)
      parameter TERR_12PER       =     269; // tERR(12per)ps    Accumulated Error (12-cycle)
      parameter TDS              =      75; // tDS        ps    DQ and DM input setup time relative to DQS
      parameter TDH              =     150; // tDH        ps    DQ and DM input hold time relative to DQS
      parameter TDQSQ            =     200; // tDQSQ      ps    DQS-DQ skew, DQS to last DQ valid, per group, per access
      parameter TDQSS            =    0.25; // tDQSS      tCK   Rising clock edge to DQS/DQS# latching transition
      parameter TDSS             =    0.20; // tDSS       tCK   DQS falling edge to CLK rising (setup time)
      parameter TDSH             =    0.20; // tDSH       tCK   DQS falling edge from CLK rising (hold time)
      parameter TDQSCK           =     400; // tDQSCK     ps    DQS output access time from CK/CK#
      parameter TQSH             =    0.38; // tQSH       tCK   DQS Output High Pulse Width
      parameter TQSL             =    0.38; // tQSL       tCK   DQS Output Low Pulse Width
      parameter TDIPW            =     600; // tDIPW      ps    DQ and DM input Pulse Width
      parameter TIPW             =     900; // tIPW       ps    Control and Address input Pulse Width
      parameter TIS              =     200; // tIS        ps    Input Setup Time
      parameter TIH              =     275; // tIH        ps    Input Hold Time
      parameter TRAS_MIN         =   37500; // tRAS       ps    Minimum Active to Precharge command time
      parameter TRC              =   52500; // tRC        ps    Active to Active/Auto Refresh command time
      parameter TRCD             =   15000; // tRCD       ps    Active to Read/Write command time
      parameter TRP              =   15000; // tRP        ps    Precharge command period
      parameter TXP              =    7500; // tXP        ps    Exit power down to a valid command
      parameter TCKE             =    7500; // tCKE       ps    CKE minimum high or low pulse width
      parameter TAON             =     400; // tAON       ps    RTT turn-on from ODTLon reference
      parameter TWLS             =     325; // tWLS       ps    Setup time for tDQS flop
      parameter TWLH             =     325; // tWLH       ps    Hold time of tDQS flop
      parameter TWLO             =    9000; // tWLO       ps    Write levelization output delay
      parameter TAA_MIN          =   15000; // TAA        ps    Internal READ command to first data
      parameter CL_TIME          =   15000; // CL         ps    Minimum CAS Latency
  `endif `endif `endif `endif `endif
  `ifdef x16
    `ifdef sg15E
      parameter TRRD             =    7500; // tRRD       ps     (2KB page size) Active bank a to Active bank b command time
      parameter TFAW             =   45000; // tFAW       ps     (2KB page size) Four Bank Activate window
    `else `ifdef sg15
      parameter TRRD             =    7500; // tRRD       ps     (2KB page size) Active bank a to Active bank b command time
      parameter TFAW             =   45000; // tFAW       ps     (2KB page size) Four Bank Activate window
    `else // sg187E, sg187, sg25, sg25E
      parameter TRRD             =   10000; // tRRD       ps     (2KB page size) Active bank a to Active bank b command time
      parameter TFAW             =   50000; // tFAW       ps     (2KB page size) Four Bank Activate window
    `endif `endif
  `else // x4, x8
    `ifdef sg15E
      parameter TRRD             =    6000; // tRRD       ps     (1KB page size) Active bank a to Active bank b command time
      parameter TFAW             =   30000; // tFAW       ps     (1KB page size) Four Bank Activate window
    `else `ifdef sg15
      parameter TRRD             =    6000; // tRRD       ps     (1KB page size) Active bank a to Active bank b command time
      parameter TFAW             =   30000; // tFAW       ps     (1KB page size) Four Bank Activate window
    `else `ifdef sg187E
      parameter TRRD             =    7500; // tRRD       ps     (1KB page size) Active bank a to Active bank b command time
      parameter TFAW             =   37500; // tFAW       ps     (1KB page size) Four Bank Activate window
    `else `ifdef sg187
      parameter TRRD             =    7500; // tRRD       ps     (1KB page size) Active bank a to Active bank b command time
      parameter TFAW             =   37500; // tFAW       ps     (1KB page size) Four Bank Activate window
    `else // sg25, sg25E
      parameter TRRD             =   10000; // tRRD       ps     (1KB page size) Active bank a to Active bank b command time
      parameter TFAW             =   40000; // tFAW       ps     (1KB page size) Four Bank Activate window
    `endif `endif `endif `endif
  `endif
      // Timing Parameters
      // Mode Register
      parameter CL_MIN           =       5; // CL         tCK   Minimum CAS Latency
      parameter CL_MAX           =      11; // CL         tCK   Maximum CAS Latency
      parameter AL_MIN           =       0; // AL         tCK   Minimum Additive Latency
      parameter AL_MAX           =       2; // AL         tCK   Maximum Additive Latency
      parameter WR_MIN           =       5; // WR         tCK   Minimum Write Recovery
      parameter WR_MAX           =      12; // WR         tCK   Maximum Write Recovery
      parameter BL_MIN           =       4; // BL         tCK   Minimum Burst Length
      parameter BL_MAX           =       8; // BL         tCK   Minimum Burst Length
      parameter CWL_MIN          =       5; // CWL        tCK   Minimum CAS Write Latency
      parameter CWL_MAX          =       8; // CWL        tCK   Maximum CAS Write Latency
      // Clock
      parameter TCK_MAX          =    3300; // tCK        ps    Maximum Clock Cycle Time
      parameter TCH_AVG_MIN      =    0.47; // tCH        tCK   Minimum Clock High-Level Pulse Width
      parameter TCL_AVG_MIN      =    0.47; // tCL        tCK   Minimum Clock Low-Level Pulse Width
      parameter TCH_AVG_MAX      =    0.53; // tCH        tCK   Maximum Clock High-Level Pulse Width
      parameter TCL_AVG_MAX      =    0.53; // tCL        tCK   Maximum Clock Low-Level Pulse Width
      parameter TCH_ABS_MIN      =    0.43; // tCH        tCK   Minimum Clock High-Level Pulse Width
      parameter TCL_ABS_MIN      =    0.43; // tCL        tCK   Maximum Clock Low-Level Pulse Width
      parameter TCKE_TCK         =       3; // tCKE       tCK   CKE minimum high or low pulse width
      parameter TAA_MAX          =   20000; // TAA        ps    Internal READ command to first data
      // Data OUT
      parameter TQH              =    0.38; // tQH        ps    DQ output hold time from DQS, DQS#
      // Data Strobe OUT
      parameter TRPRE            =    0.90; // tRPRE      tCK   DQS Read Preamble
      parameter TRPST            =    0.30; // tRPST      tCK   DQS Read Postamble
      // Data Strobe IN
      parameter TDQSH            =    0.45; // tDQSH      tCK   DQS input High Pulse Width
      parameter TDQSL            =    0.45; // tDQSL      tCK   DQS input Low Pulse Width
      parameter TWPRE            =    0.90; // tWPRE      tCK   DQS Write Preamble
      parameter TWPST            =    0.30; // tWPST      tCK   DQS Write Postamble
      // Command and Address
      parameter TZQCS            =      64; // tZQCS      tCK   ZQ Cal (Short) time
      parameter TZQINIT          =     512; // tZQinit    tCK   ZQ Cal (Long) time
      parameter TZQOPER          =     256; // tZQoper    tCK   ZQ Cal (Long) time
      parameter TCCD             =       4; // tCCD       tCK   Cas to Cas command delay
      parameter TCCD_DG          =       2; // tCCD_DG    tCK   Cas to Cas command delay to different group
      parameter TRAS_MAX         =70312500; // tRAS       ps    Maximum Active to Precharge command time
      parameter TWR              =   15000; // tWR        ps    Write recovery time
      parameter TMRD             =       4; // tMRD       tCK   Load Mode Register command cycle time
      parameter TMOD             =   15000; // tMOD       ps    LOAD MODE to non-LOAD MODE command cycle time
      parameter TMOD_TCK         =      12; // tMOD       tCK   LOAD MODE to non-LOAD MODE command cycle time
      parameter TRRD_TCK         =       4; // tRRD       tCK   Active bank a to Active bank b command time
      parameter TRRD_DG          =    3000; // tRRD_DG    ps     Active bank a to Active bank b command time to different group
      parameter TRRD_DG_TCK      =       2; // tRRD_DG    tCK   Active bank a to Active bank b command time to different group
      parameter TRTP             =    7500; // tRTP       ps    Read to Precharge command delay
      parameter TRTP_TCK         =       4; // tRTP       tCK   Read to Precharge command delay
      parameter TWTR             =    7500; // tWTR       ps    Write to Read command delay
      parameter TWTR_DG          =    3750; // tWTR_DG    ps    Write to Read command delay to different group
      parameter TWTR_TCK         =       4; // tWTR       tCK   Write to Read command delay
      parameter TWTR_DG_TCK      =       2; // tWTR_DG    tCK   Write to Read command delay to different group
      parameter TDLLK            =     512; // tDLLK      tCK   DLL locking time
      // Refresh - 2Gb
      parameter TRFC_MIN         =  160000; // tRFC       ps    Refresh to Refresh Command interval minimum value
      parameter TRFC_MAX         =70312500; // tRFC       ps    Refresh to Refresh Command Interval maximum value
      // Power Down
      parameter TXP_TCK          =       3; // tXP        tCK   Exit power down to a valid command
      parameter TXPDLL           =   24000; // tXPDLL     ps    Exit precharge power down to READ or WRITE command (DLL-off mode)
      parameter TXPDLL_TCK       =      10; // tXPDLL     tCK   Exit precharge power down to READ or WRITE command (DLL-off mode)
      parameter TACTPDEN         =       1; // tACTPDEN   tCK   Timing of last ACT command to power down entry
      parameter TPRPDEN          =       1; // tPREPDEN   tCK   Timing of last PRE command to power down entry
      parameter TREFPDEN         =       1; // tARPDEN    tCK   Timing of last REFRESH command to power down entry
      parameter TCPDED           =       1; // tCPDED     tCK   Command pass disable/enable delay
      parameter TPD_MAX          =TRFC_MAX; // tPD        ps    Power-down entry-to-exit timing
      parameter TXPR             =  170000; // tXPR       ps    Exit Reset from CKE assertion to a valid command
      parameter TXPR_TCK         =       5; // tXPR       tCK   Exit Reset from CKE assertion to a valid command
      // Self Refresh
      parameter TXS              =  170000; // tXS        ps    Exit self refesh to a non-read or write command
      parameter TXS_TCK          =       5; // tXS        tCK   Exit self refesh to a non-read or write command
      parameter TXSDLL           =   TDLLK; // tXSRD      tCK   Exit self refresh to a read or write command
      parameter TISXR            =     TIS; // tISXR      ps    CKE setup time during self refresh exit.
      parameter TCKSRE           =   10000; // tCKSRE     ps    Valid Clock requirement after self refresh entry (SRE)
      parameter TCKSRE_TCK       =       5; // tCKSRE     tCK   Valid Clock requirement after self refresh entry (SRE)
      parameter TCKSRX           =   10000; // tCKSRX     ps    Valid Clock requirement prior to self refresh exit (SRX)
      parameter TCKSRX_TCK       =       5; // tCKSRX     tCK   Valid Clock requirement prior to self refresh exit (SRX)
      parameter TCKESR_TCK       =       4; // tCKESR     tCK   Minimum CKE low width for Self Refresh entry to exit timing
      // ODT
      parameter TAOF             =     0.7; // tAOF       tCK   RTT turn-off from ODTLoff reference
      parameter TAONPD           =    9000; // tAONPD     ps    Asynchronous RTT turn-on delay (Power-Down with DLL frozen)
      parameter TAOFPD           =    9000; // tAONPD     ps    Asynchronous RTT turn-off delay (Power-Down with DLL frozen)
      parameter ODTH4            =       4; // ODTH4      tCK   ODT minimum HIGH time after ODT assertion or write (BL4)
      parameter ODTH8            =       6; // ODTH8      tCK   ODT minimum HIGH time after write (BL8)
      parameter TADC             =     0.7; // tADC       tCK   RTT dynamic change skew
      // Write Levelization
      parameter TWLMRD           =      40; // tWLMRD     tCK   First DQS pulse rising edge after tDQSS margining mode is programmed
      parameter TWLDQSEN         =      25; // tWLDQSEN   tCK   DQS/DQS delay after tDQSS margining mode is programmed
      parameter TWLOE            =    2000; // tWLOE      ps    Write levelization output error
      // Size Parameters based on Part Width
  `ifdef x4
      parameter DM_BITS          =       1; // Set this parameter to control how many Data Mask bits are used
      parameter ADDR_BITS        =      15; // MAX Address Bits
      parameter ROW_BITS         =      15; // Set this parameter to control how many Address bits are used
      parameter COL_BITS         =      11; // Set this parameter to control how many Column bits are used
      parameter DQ_BITS          =       4; // Set this parameter to control how many Data bits are used       **Same as part bit width**
      parameter DQS_BITS         =       1; // Set this parameter to control how many Dqs bits are used
  `else `ifdef x8
      parameter DM_BITS          =       1; // Set this parameter to control how many Data Mask bits are used
      parameter ADDR_BITS        =      15; // MAX Address Bits
      parameter ROW_BITS         =      15; // Set this parameter to control how many Address bits are used
      parameter COL_BITS         =      10; // Set this parameter to control how many Column bits are used
      parameter DQ_BITS          =       8; // Set this parameter to control how many Data bits are used       **Same as part bit width**
      parameter DQS_BITS         =       1; // Set this parameter to control how many Dqs bits are used
  `else
      `define x16
      parameter DM_BITS          =       2; // Set this parameter to control how many Data Mask bits are used
      parameter ADDR_BITS        =      14; // MAX Address Bits
      parameter ROW_BITS         =      14; // Set this parameter to control how many Address bits are used
      parameter COL_BITS         =      10; // Set this parameter to control how many Column bits are used
      parameter DQ_BITS          =      16; // Set this parameter to control how many Data bits are used       **Same as part bit width**
      parameter DQS_BITS         =       2; // Set this parameter to control how many Dqs bits are used
  `endif `endif
      // Size Parameters
      parameter BA_BITS          =       3; // Set this parmaeter to control how many Bank Address bits are used
      parameter MEM_BITS         =      15; // Set this parameter to control how many write data bursts can be stored in memory.  The default is 2^10=1024.
      parameter AP               =      10; // the address bit that controls auto-precharge and precharge-all
      parameter BC               =      12; // the address bit that controls burst chop
      parameter BL_BITS          =       3; // the number of bits required to count to BL_MAX
      parameter BO_BITS          =       2; // the number of Burst Order Bits
  `ifdef QUAD_RANK
      `define DUAL_RANK // also define DUAL_RANK
      parameter CS_BITS          =       4; // Number of Chip Select Bits
      parameter RANKS            =       4; // Number of Chip Selects
  `else `ifdef DUAL_RANK
      parameter CS_BITS          =       2; // Number of Chip Select Bits
      parameter RANKS            =       2; // Number of Chip Selects
  `else
      parameter CS_BITS          =       2; // Number of Chip Select Bits
      parameter RANKS            =       1; // Number of Chip Selects
  `endif `endif
      // Simulation parameters
      parameter RZQ              =     240; // termination resistance
      parameter PRE_DEF_PAT      =   8'hAA; // value returned during mpr pre-defined pattern readout
      parameter STOP_ON_ERROR    =       1; // If set to 1, the model will halt on command sequence/major errors
      parameter DEBUG            =       0; // Turn on Debug messages
      parameter BUS_DELAY        =       0; // delay in nanoseconds
      parameter RANDOM_OUT_DELAY =       0; // If set to 1, the model will put a random amount of delay on DQ/DQS during reads
      parameter RANDOM_SEED    = 711689044; //seed value for random generator.
      parameter RDQSEN_PRE       =       2; // DQS driving time prior to first read strobe
      parameter RDQSEN_PST       =       1; // DQS driving time after last read strobe
      parameter RDQS_PRE         =       2; // DQS low time prior to first read strobe
      parameter RDQS_PST         =       1; // DQS low time after last read strobe
      parameter RDQEN_PRE        =       0; // DQ/DM driving time prior to first read data
      parameter RDQEN_PST        =       0; // DQ/DM driving time after last read data
      parameter WDQS_PRE         =       2; // DQS half clock periods prior to first write strobe
      parameter WDQS_PST         =       1; // DQS half clock periods after last write strobe
  // check for legal cas latency based on the cas write latency
  function valid_cl;
      input [3:0] cl;
      input [3:0] cwl;
      case ({cwl, cl})
  `ifdef sg15E
          {4'd5, 4'd6 },
          {4'd6, 4'd8 },
          {4'd7, 4'd9 },
          {4'd7, 4'd10}: valid_cl = 1;
  `else `ifdef sg15
          {4'd5, 4'd6 },
          {4'd6, 4'd8 },
          {4'd7, 4'd10}: valid_cl = 1;
  `else `ifdef sg187E
          {4'd5, 4'd6 },
          {4'd6, 4'd7 },
          {4'd6, 4'd8 }: valid_cl = 1;
  `else `ifdef sg187
          {4'd5, 4'd6 },
          {4'd6, 4'd8 }: valid_cl = 1;
  `else `ifdef sg25E
          {4'd5, 4'd5 },
          {4'd5, 4'd6 }: valid_cl = 1;
  `else `ifdef sg25
          {4'd5, 4'd6 }: valid_cl = 1;
  `endif `endif `endif `endif `endif `endif
          default : valid_cl = 0;
      endcase
  endfunction
  // find the minimum valid cas write latency
  function [3:0] min_cwl;
      input period;
      real period;
      min_cwl = (period >= 2500.0) ? 5:
                (period >= 1875.0) ? 6:
                (period >= 1500.0) ? 7:
                8; //(period >= 1250.0)
  endfunction
  // find the minimum valid cas latency
  function [3:0] min_cl;
      input period;
      real period;
      reg [3:0] cwl;
      reg [3:0] cl;
      begin
          cwl = min_cwl(period);
          for (cl=CL_MAX; cl>=CL_MIN; cl=cl-1) begin
              if (valid_cl(cl, cwl)) begin
                  min_cl = cl;
              end
          end
      end
  endfunction
`endif
    parameter check_strict_mrbits = 1;
    parameter check_strict_timing = 1;
    parameter feature_pasr = 1;
    parameter feature_truebl4 = 0;
    // text macros
    `define DQ_PER_DQS DQ_BITS/DQS_BITS
    `define BANKS      (1<<BA_BITS)
    `define MAX_BITS   (BA_BITS+ROW_BITS+COL_BITS-BL_BITS)
    `define MAX_SIZE   (1<<(BA_BITS+ROW_BITS+COL_BITS-BL_BITS))
    `define MEM_SIZE   (1<<MEM_BITS)
    `define MAX_PIPE   4*CL_MAX
    // Declare Ports
    input   rst_n;
    input   ck;
    input   ck_n;
    input   cke;
    input   cs_n;
    input   ras_n;
    input   cas_n;
    input   we_n;
    inout   [DM_BITS-1:0]   dm_tdqs;
    input   [BA_BITS-1:0]   ba;
    input   [ADDR_BITS-1:0] addr;
    inout   [DQ_BITS-1:0]   dq;
    inout   [DQS_BITS-1:0]  dqs;
    inout   [DQS_BITS-1:0]  dqs_n;
    output  [DQS_BITS-1:0]  tdqs_n;
    input   odt;
    // clock jitter
    real    tck_avg;
    time    tck_sample [TDLLK-1:0];
    time    tch_sample [TDLLK-1:0];
    time    tcl_sample [TDLLK-1:0];
    time    tck_i;
    time    tch_i;
    time    tcl_i;
    real    tch_avg;
    real    tcl_avg;
    time    tm_ck_pos;
    time    tm_ck_neg;
    real    tjit_per_rtime;
    integer tjit_cc_time;
    real    terr_nper_rtime;
    //DDR3 clock jitter variables
    real    tjit_ch_rtime;
    real    duty_cycle;
    // clock skew
    real    out_delay;
    integer dqsck [DQS_BITS-1:0];
    integer dqsck_min;
    integer dqsck_max;
    integer dqsq_min;
    integer dqsq_max;
    integer seed;
    // Mode Registers
    reg     [ADDR_BITS-1:0] mode_reg [`BANKS-1:0];
    reg     burst_order;
    reg     [BL_BITS:0] burst_length;
    reg     blotf;
    reg     truebl4;
    integer cas_latency;
    reg     dll_reset;
    reg     dll_locked;
    integer write_recovery;
    reg     low_power;
    reg     dll_en;
    reg     [2:0] odt_rtt_nom;
    reg     [1:0] odt_rtt_wr;
    reg     odt_en;
    reg     dyn_odt_en;
    reg     [1:0] al;
    integer additive_latency;
    reg     write_levelization;
    reg     duty_cycle_corrector;
    reg     tdqs_en;
    reg     out_en;
    reg     [2:0] pasr;
    integer cas_write_latency;
    reg     asr; // auto self refresh
    reg     srt; // self refresh temperature range
    reg     [1:0] mpr_select;
    reg     mpr_en;
    reg     odts_readout;
    integer read_latency;
    integer write_latency;
    // cmd encoding
    parameter     // {cs, ras, cas, we}
        LOAD_MODE = 4'b0000,
        REFRESH   = 4'b0001,
        PRECHARGE = 4'b0010,
        ACTIVATE  = 4'b0011,
        WRITE     = 4'b0100,
        READ      = 4'b0101,
        ZQ        = 4'b0110,
        NOP       = 4'b0111,
        // DESEL  = 4'b1xxx,
        PWR_DOWN  = 4'b1000,
        SELF_REF  = 4'b1001
    ;
    reg [8*9-1:0] cmd_string [9:0];
    initial begin
        cmd_string[LOAD_MODE] = "Load Mode";
        cmd_string[REFRESH  ] = "Refresh  ";
        cmd_string[PRECHARGE] = "Precharge";
        cmd_string[ACTIVATE ] = "Activate ";
        cmd_string[WRITE    ] = "Write    ";
        cmd_string[READ     ] = "Read     ";
        cmd_string[ZQ       ] = "ZQ       ";
        cmd_string[NOP      ] = "No Op    ";
        cmd_string[PWR_DOWN ] = "Pwr Down ";
        cmd_string[SELF_REF ] = "Self Ref ";
    end
    // command state
    reg     [`BANKS-1:0] active_bank;
    reg     [`BANKS-1:0] auto_precharge_bank;
    reg     [`BANKS-1:0] write_precharge_bank;
    reg     [`BANKS-1:0] read_precharge_bank;
    reg     [ROW_BITS-1:0] active_row [`BANKS-1:0];
    reg     in_power_down;
    reg     in_self_refresh;
    reg     [3:0] init_mode_reg;
    reg     init_dll_reset;
    reg     init_done;
    integer init_step;
    reg     zq_set;
    reg     er_trfc_max;
    reg     odt_state;
    reg     odt_state_dly;
    reg     dyn_odt_state;
    reg     dyn_odt_state_dly;
    reg     prev_odt;
    wire    [7:0] calibration_pattern = 8'b10101010; // value returned during mpr pre-defined pattern readout
    wire    [7:0] temp_sensor = 8'h01; // value returned during mpr temp sensor readout
    reg     [1:0] mr_chk;
    reg     rd_bc;
    integer banki;
    // cmd timers/counters
    integer ref_cntr;
    integer odt_cntr;
    integer ck_cntr;
    integer ck_txpr;
    integer ck_load_mode;
    integer ck_refresh;
    integer ck_precharge;
    integer ck_activate;
    integer ck_write;
    integer ck_read;
    integer ck_zqinit;
    integer ck_zqoper;
    integer ck_zqcs;
    integer ck_power_down;
    integer ck_slow_exit_pd;
    integer ck_self_refresh;
    integer ck_freq_change;
    integer ck_odt;
    integer ck_odth8;
    integer ck_dll_reset;
    integer ck_cke_cmd;
    integer ck_bank_write     [`BANKS-1:0];
    integer ck_bank_read      [`BANKS-1:0];
    integer ck_group_activate [1:0];
    integer ck_group_write    [1:0];
    integer ck_group_read     [1:0];
    time    tm_txpr;
    time    tm_load_mode;
    time    tm_refresh;
    time    tm_precharge;
    time    tm_activate;
    time    tm_write_end;
    time    tm_power_down;
    time    tm_slow_exit_pd;
    time    tm_self_refresh;
    time    tm_freq_change;
    time    tm_cke_cmd;
    time    tm_ttsinit;
    time    tm_bank_precharge [`BANKS-1:0];
    time    tm_bank_activate  [`BANKS-1:0];
    time    tm_bank_write_end [`BANKS-1:0];
    time    tm_bank_read_end  [`BANKS-1:0];
    time    tm_group_activate  [1:0];
    time    tm_group_write_end [1:0];
    // pipelines
    reg     [`MAX_PIPE:0]  al_pipeline;
    reg     [`MAX_PIPE:0]  wr_pipeline;
    reg     [`MAX_PIPE:0]  rd_pipeline;
    reg     [`MAX_PIPE:0]  odt_pipeline;
    reg     [`MAX_PIPE:0]  dyn_odt_pipeline;
    reg     [BL_BITS:0]    bl_pipeline  [`MAX_PIPE:0];
    reg     [BA_BITS-1:0]  ba_pipeline  [`MAX_PIPE:0];
    reg     [ROW_BITS-1:0] row_pipeline [`MAX_PIPE:0];
    reg     [COL_BITS-1:0] col_pipeline [`MAX_PIPE:0];
    reg     prev_cke;
    // data state
    reg     [BL_MAX*DQ_BITS-1:0] memory_data;
    reg     [BL_MAX*DQ_BITS-1:0] bit_mask;
    reg     [BL_BITS-1:0]        burst_position;
    reg     [BL_BITS:0]          burst_cntr;
    reg     [DQ_BITS-1:0]        dq_temp;
    reg     [31:0] check_write_postamble;
    reg     [31:0] check_write_preamble;
    reg     [31:0] check_write_dqs_high;
    reg     [31:0] check_write_dqs_low;
    reg     [15:0] check_dm_tdipw;
    reg     [63:0] check_dq_tdipw;
    // data timers/counters
    time    tm_rst_n;
    time    tm_cke;
    time    tm_odt;
    time    tm_tdqss;
    time    tm_dm       [15:0];
    time    tm_dqs      [15:0];
    time    tm_dqs_pos  [31:0];
    time    tm_dqss_pos [31:0];
    time    tm_dqs_neg  [31:0];
    time    tm_dq       [63:0];
    time    tm_cmd_addr [22:0];
    reg [8*7-1:0] cmd_addr_string [22:0];
    initial begin
        cmd_addr_string[ 0] = "CS_N   ";
        cmd_addr_string[ 1] = "RAS_N  ";
        cmd_addr_string[ 2] = "CAS_N  ";
        cmd_addr_string[ 3] = "WE_N   ";
        cmd_addr_string[ 4] = "BA 0   ";
        cmd_addr_string[ 5] = "BA 1   ";
        cmd_addr_string[ 6] = "BA 2   ";
        cmd_addr_string[ 7] = "ADDR  0";
        cmd_addr_string[ 8] = "ADDR  1";
        cmd_addr_string[ 9] = "ADDR  2";
        cmd_addr_string[10] = "ADDR  3";
        cmd_addr_string[11] = "ADDR  4";
        cmd_addr_string[12] = "ADDR  5";
        cmd_addr_string[13] = "ADDR  6";
        cmd_addr_string[14] = "ADDR  7";
        cmd_addr_string[15] = "ADDR  8";
        cmd_addr_string[16] = "ADDR  9";
        cmd_addr_string[17] = "ADDR 10";
        cmd_addr_string[18] = "ADDR 11";
        cmd_addr_string[19] = "ADDR 12";
        cmd_addr_string[20] = "ADDR 13";
        cmd_addr_string[21] = "ADDR 14";
        cmd_addr_string[22] = "ADDR 15";
    end
    reg [8*5-1:0] dqs_string [1:0];
    initial begin
        dqs_string[0] = "DQS  ";
        dqs_string[1] = "DQS_N";
    end
    // Memory Storage
`ifdef MAX_MEM
    parameter RFF_BITS = DQ_BITS*BL_MAX;
     // %z format uses 8 bytes for every 32 bits or less.
    parameter RFF_CHUNK = 8 * (RFF_BITS/32 + (RFF_BITS%32 ? 1 : 0));
    reg [1024:1] tmp_model_dir;
    integer memfd[`BANKS-1:0];
    initial
    begin : file_io_open
        integer bank;
        if (!$value$plusargs("model_data+%s", tmp_model_dir))
        begin
            tmp_model_dir = "/tmp";
            $display(
                "%m: at time %t WARNING: no +model_data option specified, using /tmp.",
                $time
            );
        end
        for (bank = 0; bank < `BANKS; bank = bank + 1)
            memfd[bank] = open_bank_file(bank);
    end
`else
    reg     [BL_MAX*DQ_BITS-1:0] memory  [0:`MEM_SIZE-1];
    reg     [`MAX_BITS-1:0]      address [0:`MEM_SIZE-1];
    reg     [MEM_BITS:0]         memory_index;
    reg     [MEM_BITS:0]         memory_used = 0;
`endif
    // receive
    reg            rst_n_in;
    reg            ck_in;
    reg            ck_n_in;
    reg            cke_in;
    reg            cs_n_in;
    reg            ras_n_in;
    reg            cas_n_in;
    reg            we_n_in;
    reg     [15:0] dm_in;
    reg     [2:0]  ba_in;
    reg     [15:0] addr_in;
    reg     [63:0] dq_in;
    reg     [31:0] dqs_in;
    reg            odt_in;
    reg     [15:0] dm_in_pos;
    reg     [15:0] dm_in_neg;
    reg     [63:0] dq_in_pos;
    reg     [63:0] dq_in_neg;
    reg            dq_in_valid;
    reg            dqs_in_valid;
    integer        wdqs_cntr;
    integer        wdq_cntr;
    integer        wdqs_pos_cntr [31:0];
    reg            b2b_write;
    reg [BL_BITS:0] wr_burst_length;
    reg     [31:0] prev_dqs_in;
    reg            diff_ck;
    always @(rst_n  ) rst_n_in   <= #BUS_DELAY rst_n;
    always @(ck     ) ck_in      <= #BUS_DELAY ck;
    always @(ck_n   ) ck_n_in    <= #BUS_DELAY ck_n;
    always @(cke    ) cke_in     <= #BUS_DELAY cke;
    always @(cs_n   ) cs_n_in    <= #BUS_DELAY cs_n;
    always @(ras_n  ) ras_n_in   <= #BUS_DELAY ras_n;
    always @(cas_n  ) cas_n_in   <= #BUS_DELAY cas_n;
    always @(we_n   ) we_n_in    <= #BUS_DELAY we_n;
    always @(dm_tdqs) dm_in      <= #BUS_DELAY dm_tdqs;
    always @(ba     ) ba_in      <= #BUS_DELAY ba;
    always @(addr   ) addr_in    <= #BUS_DELAY addr;
    always @(dq     ) dq_in      <= #BUS_DELAY dq;
    always @(dqs or dqs_n) dqs_in <= #BUS_DELAY (dqs_n<<16) | dqs;
    always @(odt    ) odt_in     <= #BUS_DELAY odt;
    // create internal clock
    always @(posedge ck_in) diff_ck <= ck_in;
    always @(posedge ck_n_in) diff_ck <= ~ck_n_in;
    wire    [15:0] dqs_even = dqs_in[15:0];
    wire    [15:0] dqs_odd  = dqs_in[31:16];
    wire    [3:0]  cmd_n_in = !cs_n_in ? {ras_n_in, cas_n_in, we_n_in} : NOP;  //deselect = nop
    // transmit
    reg                    dqs_out_en;
    reg     [DQS_BITS-1:0] dqs_out_en_dly;
    reg                    dqs_out;
    reg     [DQS_BITS-1:0] dqs_out_dly;
    reg                    dq_out_en;
    reg     [DQ_BITS-1:0]  dq_out_en_dly;
    reg     [DQ_BITS-1:0]  dq_out;
    reg     [DQ_BITS-1:0]  dq_out_dly;
    integer                rdqsen_cntr;
    integer                rdqs_cntr;
    integer                rdqen_cntr;
    integer                rdq_cntr;
    bufif1 buf_dqs    [DQS_BITS-1:0] (dqs,     dqs_out_dly,  dqs_out_en_dly & {DQS_BITS{out_en}});
    bufif1 buf_dqs_n  [DQS_BITS-1:0] (dqs_n,   ~dqs_out_dly, dqs_out_en_dly & {DQS_BITS{out_en}});
    bufif1 buf_dq     [DQ_BITS-1:0]  (dq,      dq_out_dly,   dq_out_en_dly  & {DQ_BITS {out_en}});
    assign tdqs_n = {DQS_BITS{1'bz}};
    initial begin
        if (BL_MAX < 2)
            $display("%m ERROR: BL_MAX parameter must be >= 2.  \nBL_MAX = %d", BL_MAX);
        if ((1<<BO_BITS) > BL_MAX)
            $display("%m ERROR: 2^BO_BITS cannot be greater than BL_MAX parameter.");
        $timeformat (-12, 1, " ps", 1);
        seed = RANDOM_SEED;
        ck_cntr = 0;
    end
    function integer get_rtt_wr;
    input [1:0] rtt;
    begin
        get_rtt_wr = RZQ/{rtt[0], rtt[1], 1'b0};
    end
    endfunction
    function integer get_rtt_nom;
    input [2:0] rtt;
    begin
        case (rtt)
            1: get_rtt_nom = RZQ/4;
            2: get_rtt_nom = RZQ/2;
            3: get_rtt_nom = RZQ/6;
            4: get_rtt_nom = RZQ/12;
            5: get_rtt_nom = RZQ/8;
            default : get_rtt_nom = 0;
        endcase
    end
    endfunction
    // calculate the absolute value of a real number
    function real abs_value;
    input arg;
    real arg;
    begin
        if (arg < 0.0)
            abs_value = -1.0 * arg;
        else
            abs_value = arg;
    end
    endfunction
    function integer ceil;
        input number;
        real number;
        // LMR 4.1.7
        // When either operand of a relational expression is a real operand then the other operand shall be converted
        // to an equivalent real value, and the expression shall be interpreted as a comparison between two real values.
        if (number > $rtoi(number))
            ceil = $rtoi(number) + 1;
        else
            ceil = number;
    endfunction
    function integer floor;
        input number;
        real number;
        // LMR 4.1.7
        // When either operand of a relational expression is a real operand then the other operand shall be converted
        // to an equivalent real value, and the expression shall be interpreted as a comparison between two real values.
        if (number < $rtoi(number))
            floor = $rtoi(number) - 1;
        else
            floor = number;
    endfunction
`ifdef MAX_MEM
    function integer open_bank_file( input integer bank );
        integer fd;
        reg [2048:1] filename;
        begin
            $sformat( filename, "%0s/%m.%0d", tmp_model_dir, bank );
            fd = $fopen(filename, "w+");
            if (fd == 0)
            begin
                $display("%m: at time %0t ERROR: failed to open %0s.", $time, filename);
                $finish;
            end
            else
            begin
                if (DEBUG) $display("%m: at time %0t INFO: opening %0s.", $time, filename);
                open_bank_file = fd;
            end
        end
    endfunction
    function [RFF_BITS:1] read_from_file(
        input integer fd,
        input integer index
    );
        integer code;
        integer offset;
        reg [1024:1] msg;
        reg [RFF_BITS:1] read_value;
        begin
            offset = index * RFF_CHUNK;
            code = $fseek( fd, offset, 0 );
            // $fseek returns 0 on success, -1 on failure
            if (code != 0)
            begin
                $display("%m: at time %t ERROR: fseek to %d failed", $time, offset);
                $finish;
            end
            code = $fscanf(fd, "%z", read_value);
            // $fscanf returns number of items read
            if (code != 1)
            begin
                if ($ferror(fd,msg) != 0)
                begin
                    $display("%m: at time %t ERROR: fscanf failed at %d", $time, index);
                    $display(msg);
                    $finish;
                end
                else
                    read_value = 'hx;
            end
            /* when reading from unwritten portions of the file, 0 will be returned.
            */
            if (read_value[1] === 1'bz)
                // true 0 encoded as Z, data is valid
                read_value[1] = 1'b0;
            else if (read_value[1] === 1'b0)
                // read from file section that has not been written
                read_value = 'hx;
            read_from_file = read_value;
        end
    endfunction
    task write_to_file(
        input integer fd,
        input integer index,
        input [RFF_BITS:1] data
    );
        integer code;
        integer offset;
        begin
            offset = index * RFF_CHUNK;
            code = $fseek( fd, offset, 0 );
            if (code != 0)
            begin
                $display("%m: at time %t ERROR: fseek to %d failed", $time, offset);
                $finish;
            end
            // encode a valid data
            if (data[1] === 1'bz)
                data[1] = 1'bx;
            else if (data[1] === 1'b0)
                data[1] = 1'bz;
            $fwrite( fd, "%z", data );
        end
    endtask
`else
    function get_index;
        input [`MAX_BITS-1:0] addr;
        begin : index
            get_index = 0;
            for (memory_index=0; memory_index<memory_used; memory_index=memory_index+1) begin
                if (address[memory_index] == addr) begin
                    get_index = 1;
                    disable index;
                end
            end
        end
    endfunction
`endif
    task memory_write;
        input  [BA_BITS-1:0]  bank;
        input  [ROW_BITS-1:0] row;
        input  [COL_BITS-1:0] col;
        input  [BL_MAX*DQ_BITS-1:0] data;
        reg    [`MAX_BITS-1:0] addr;
        begin
`ifdef MAX_MEM
            addr = {row, col}/BL_MAX;
            write_to_file( memfd[bank], addr, data );
`else
            // chop off the lowest address bits
            addr = {bank, row, col}/BL_MAX;
            if (get_index(addr)) begin
                address[memory_index] = addr;
                memory[memory_index] = data;
            end else if (memory_used == `MEM_SIZE) begin
                $display ("%m: at time %t ERROR: Memory overflow.  Write to Address %h with Data %h will be lost.\nYou must increase the MEM_BITS parameter or define MAX_MEM.", $time, addr, data);
                if (STOP_ON_ERROR) $stop(0);
            end else begin
                address[memory_used] = addr;
                memory[memory_used] = data;
                memory_used = memory_used + 1;
            end
`endif
        end
    endtask
    task memory_read;
        input  [BA_BITS-1:0]  bank;
        input  [ROW_BITS-1:0] row;
        input  [COL_BITS-1:0] col;
        output [BL_MAX*DQ_BITS-1:0] data;
        reg    [`MAX_BITS-1:0] addr;
        begin
`ifdef MAX_MEM
            addr = {row, col}/BL_MAX;
            data = read_from_file( memfd[bank], addr );
`else
            // chop off the lowest address bits
            addr = {bank, row, col}/BL_MAX;
            if (get_index(addr)) begin
                data = memory[memory_index];
            end else begin
                data = {BL_MAX*DQ_BITS{1'bx}};
            end
`endif
        end
    endtask
    task set_latency;
        begin
            if (al == 0) begin
                additive_latency = 0;
            end else begin
                additive_latency = cas_latency - al;
            end
            read_latency = cas_latency + additive_latency;
            write_latency = cas_write_latency + additive_latency;
        end
    endtask
    // this task will erase the contents of 0 or more banks
    task erase_banks;
        input  [`BANKS-1:0] banks; //one select bit per bank
        reg [BA_BITS-1:0] ba;
        reg [`MAX_BITS-1:0] i;
        integer bank;
        begin
`ifdef MAX_MEM
        for (bank = 0; bank < `BANKS; bank = bank + 1)
            if (banks[bank] === 1'b1) begin
	        $fclose(memfd[bank]);
                memfd[bank] = open_bank_file(bank);
	    end
`else
        memory_index = 0;
        i = 0;
        // remove the selected banks
        for (memory_index=0; memory_index<memory_used; memory_index=memory_index+1) begin
            ba = (address[memory_index]>>(ROW_BITS+COL_BITS-BL_BITS));
            if (!banks[ba]) begin //bank is selected to keep
                address[i] = address[memory_index];
                memory[i] = memory[memory_index];
                i = i + 1;
            end
        end
        // clean up the unused banks
        for (memory_index=i; memory_index<memory_used; memory_index=memory_index+1) begin
            address[memory_index] = 'bx;
            memory[memory_index] = {8*DQ_BITS{1'bx}};
        end
        memory_used = i;
`endif
        end
    endtask
    // Before this task runs, the model must be in a valid state for precharge power down and out of reset.
    // After this task runs, NOP commands must be issued until TZQINIT has been met
    task initialize;
        input [ADDR_BITS-1:0] mode_reg0;
        input [ADDR_BITS-1:0] mode_reg1;
        input [ADDR_BITS-1:0] mode_reg2;
        input [ADDR_BITS-1:0] mode_reg3;
        begin
            if (DEBUG) $display ("%m: at time %t INFO: Performing Initialization Sequence", $time);
            cmd_task(1,       NOP, 'bx, 'bx);
            cmd_task(1,        ZQ, 'bx, 'h400); //ZQCL
            cmd_task(1, LOAD_MODE, 3, mode_reg3);
            cmd_task(1, LOAD_MODE, 2, mode_reg2);
            cmd_task(1, LOAD_MODE, 1, mode_reg1);
            cmd_task(1, LOAD_MODE, 0, mode_reg0 | 'h100); // DLL Reset
            cmd_task(0,       NOP, 'bx, 'bx);
        end
    endtask
    task reset_task;
        integer i;
        begin
            // disable inputs
            dq_in_valid         = 0;
            dqs_in_valid       <= 0;
            wdqs_cntr           = 0;
            wdq_cntr            = 0;
            for (i=0; i<31; i=i+1) begin
                wdqs_pos_cntr[i]    <= 0;
            end
            b2b_write           <= 0;
            // disable outputs
            out_en              = 0;
            dq_out_en           = 0;
            rdq_cntr            = 0;
            dqs_out_en          = 0;
            rdqs_cntr           = 0;
            // disable ODT
            odt_en              = 0;
            dyn_odt_en          = 0;
            odt_state           = 0;
            dyn_odt_state       = 0;
            // reset bank state
            active_bank         = 0;
            auto_precharge_bank = 0;
            read_precharge_bank  = 0;
	        write_precharge_bank = 0;
            // require initialization sequence
            init_done            = 0;
		    mpr_en              = 0;
            init_step           = 0;
            init_mode_reg       = 0;
            init_dll_reset      = 0;
            zq_set              = 0;
            // reset DLL
            dll_en              = 0;
            dll_reset           = 0;
            dll_locked          = 0;
            // exit power down and self refresh
            prev_cke            = 1'bx;
            in_power_down       = 0;
            in_self_refresh     = 0;
            // clear pipelines
            al_pipeline         = 0;
            wr_pipeline         = 0;
            rd_pipeline         = 0;
            odt_pipeline        = 0;
            dyn_odt_pipeline    = 0;
        end
    endtask
    parameter SAME_BANK  = 2'd0; // same bank, same group
    parameter DIFF_BANK  = 2'd1; // different bank, same group
    parameter DIFF_GROUP = 2'd2; // different bank, different group
    task chk_err;
        input [1:0] relationship;
        input [BA_BITS-1:0] bank;
        input [3:0] fromcmd;
        input [3:0] cmd;
        reg err;
    begin
//        $display ("truebl4 = %d, relationship = %d, fromcmd = %h, cmd = %h", truebl4, relationship, fromcmd, cmd);
        casex ({truebl4, relationship, fromcmd, cmd})
            // load mode
            {1'bx, DIFF_BANK , LOAD_MODE, LOAD_MODE} : begin if (ck_cntr - ck_load_mode < TMRD)                                                                                $display ("%m: at time %t ERROR:  tMRD violation during %s", $time, cmd_string[cmd]);                         end
            {1'bx, DIFF_BANK , LOAD_MODE, READ     } : begin if (($time - tm_load_mode < TMOD) || (ck_cntr - ck_load_mode < TMOD_TCK))                                         $display ("%m: at time %t ERROR:  tMOD violation during %s", $time, cmd_string[cmd]);                         end
            {1'bx, DIFF_BANK , LOAD_MODE, REFRESH  } ,
            {1'bx, DIFF_BANK , LOAD_MODE, PRECHARGE} ,
            {1'bx, DIFF_BANK , LOAD_MODE, ACTIVATE } ,
            {1'bx, DIFF_BANK , LOAD_MODE, ZQ       } ,
            {1'bx, DIFF_BANK , LOAD_MODE, PWR_DOWN } ,
            {1'bx, DIFF_BANK , LOAD_MODE, SELF_REF } : begin if (($time - tm_load_mode < TMOD) || (ck_cntr - ck_load_mode < TMOD_TCK))                                         $display ("%m: at time %t ERROR:  tMOD violation during %s", $time, cmd_string[cmd]);                         end
            // refresh
            {1'bx, DIFF_BANK , REFRESH  , LOAD_MODE} ,
            {1'bx, DIFF_BANK , REFRESH  , REFRESH  } ,
            {1'bx, DIFF_BANK , REFRESH  , PRECHARGE} ,
            {1'bx, DIFF_BANK , REFRESH  , ACTIVATE } ,
            {1'bx, DIFF_BANK , REFRESH  , ZQ       } ,
            {1'bx, DIFF_BANK , REFRESH  , SELF_REF } : begin if ($time - tm_refresh < TRFC_MIN)                                                                                $display ("%m: at time %t ERROR:  tRFC violation during %s", $time, cmd_string[cmd]);                         end
            {1'bx, DIFF_BANK , REFRESH  , PWR_DOWN } : begin if (ck_cntr - ck_refresh < TREFPDEN)                                                                              $display ("%m: at time %t ERROR:  tREFPDEN violation during %s", $time, cmd_string[cmd]);                     end
            // precharge
            {1'bx, SAME_BANK , PRECHARGE, ACTIVATE } : begin if ($time - tm_bank_precharge[bank] < TRP)                                                                        $display ("%m: at time %t ERROR:   tRP violation during %s to bank %d", $time, cmd_string[cmd], bank);        end
            {1'bx, DIFF_BANK , PRECHARGE, LOAD_MODE} ,
            {1'bx, DIFF_BANK , PRECHARGE, REFRESH  } ,
            {1'bx, DIFF_BANK , PRECHARGE, ZQ       } ,
            {1'bx, DIFF_BANK , PRECHARGE, SELF_REF } : begin if ($time - tm_precharge < TRP)                                                                                   $display ("%m: at time %t ERROR:   tRP violation during %s", $time, cmd_string[cmd]);                         end
            {1'bx, DIFF_BANK , PRECHARGE, PWR_DOWN } : ; //tPREPDEN = 1 tCK, can be concurrent with auto precharge
            // activate
            {1'bx, SAME_BANK , ACTIVATE , PRECHARGE} : begin if ($time - tm_bank_activate[bank] > TRAS_MAX)                                                                    $display ("%m: at time %t ERROR:  tRAS maximum violation during %s to bank %d", $time, cmd_string[cmd], bank);
                                                             if ($time - tm_bank_activate[bank] < TRAS_MIN)                                                                    $display ("%m: at time %t ERROR:  tRAS minimum violation during %s to bank %d", $time, cmd_string[cmd], bank);end
            {1'bx, SAME_BANK , ACTIVATE , ACTIVATE } : begin if ($time - tm_bank_activate[bank] < TRC)                                                                         $display ("%m: at time %t ERROR:   tRC violation during %s to bank %d", $time, cmd_string[cmd], bank);        end
            {1'bx, SAME_BANK , ACTIVATE , WRITE    } ,
            {1'bx, SAME_BANK , ACTIVATE , READ     } : ; // tRCD is checked outside this task
            {1'b0, DIFF_BANK , ACTIVATE , ACTIVATE } : begin if (($time - tm_activate < TRRD) || (ck_cntr - ck_activate < TRRD_TCK))                                           $display ("%m: at time %t ERROR:  tRRD violation during %s to bank %d", $time, cmd_string[cmd], bank);        end
            {1'b1, DIFF_BANK , ACTIVATE , ACTIVATE } : begin if (($time - tm_group_activate[bank[1]] < TRRD) || (ck_cntr - ck_group_activate[bank[1]] < TRRD_TCK))             $display ("%m: at time %t ERROR:  tRRD violation during %s to bank %d", $time, cmd_string[cmd], bank);        end
            {1'b1, DIFF_GROUP, ACTIVATE , ACTIVATE } : begin if (($time - tm_activate < TRRD_DG) || (ck_cntr - ck_activate < TRRD_DG_TCK))                                     $display ("%m: at time %t ERROR:  tRRD_DG violation during %s to bank %d", $time, cmd_string[cmd], bank);     end
            {1'bx, DIFF_BANK , ACTIVATE , REFRESH  } : begin if ($time - tm_activate < TRC)                                                                                    $display ("%m: at time %t ERROR:   tRC violation during %s", $time, cmd_string[cmd]);                         end
            {1'bx, DIFF_BANK , ACTIVATE , PWR_DOWN } : begin if (ck_cntr - ck_activate < TACTPDEN)                                                                             $display ("%m: at time %t ERROR:  tACTPDEN violation during %s", $time, cmd_string[cmd]);                     end
            // write
            {1'bx, SAME_BANK , WRITE    , PRECHARGE} : begin if (($time - tm_bank_write_end[bank] < TWR) || (ck_cntr - ck_bank_write[bank] <= write_latency + burst_length/2)) $display ("%m: at time %t ERROR:   tWR violation during %s to bank %d", $time, cmd_string[cmd], bank);        end
            {1'b0, DIFF_BANK , WRITE    , WRITE    } : begin if (ck_cntr - ck_write < TCCD)                                                                                    $display ("%m: at time %t ERROR:  tCCD violation during %s to bank %d", $time, cmd_string[cmd], bank);        end
            {1'b1, DIFF_BANK , WRITE    , WRITE    } : begin if (ck_cntr - ck_group_write[bank[1]] < TCCD)                                                                     $display ("%m: at time %t ERROR:  tCCD violation during %s to bank %d", $time, cmd_string[cmd], bank);        end
            {1'b0, DIFF_BANK , WRITE    , READ     } : begin if (ck_cntr - ck_write < write_latency + burst_length/2 + TWTR_TCK - additive_latency)                            $display ("%m: at time %t ERROR:  tWTR violation during %s to bank %d", $time, cmd_string[cmd], bank);        end
            {1'b1, DIFF_BANK , WRITE    , READ     } : begin if (ck_cntr - ck_group_write[bank[1]] < write_latency + burst_length/2 + TWTR_TCK - additive_latency)             $display ("%m: at time %t ERROR:  tWTR violation during %s to bank %d", $time, cmd_string[cmd], bank);        end
            {1'b1, DIFF_GROUP, WRITE    , WRITE    } : begin if (ck_cntr - ck_write < TCCD_DG)                                                                                 $display ("%m: at time %t ERROR:  tCCD_DG violation during %s to bank %d", $time, cmd_string[cmd], bank);     end
            {1'b1, DIFF_GROUP, WRITE    , READ     } : begin if (ck_cntr - ck_write < write_latency + burst_length/2 + TWTR_DG_TCK - additive_latency)                         $display ("%m: at time %t ERROR:  tWTR_DG violation during %s to bank %d", $time, cmd_string[cmd], bank);     end
            {1'bx, DIFF_BANK , WRITE    , PWR_DOWN } : begin if (($time - tm_write_end < TWR) || (ck_cntr - ck_write < write_latency + burst_length/2))                        $display ("%m: at time %t ERROR:  tWRPDEN violation during %s", $time, cmd_string[cmd]);                      end
            // read
            {1'bx, SAME_BANK , READ     , PRECHARGE} : begin if (($time - tm_bank_read_end[bank] < TRTP) || (ck_cntr - ck_bank_read[bank] < additive_latency + TRTP_TCK))      $display ("%m: at time %t ERROR:  tRTP violation during %s to bank %d", $time, cmd_string[cmd], bank);        end
            {1'b0, DIFF_BANK , READ     , WRITE    } : ; // tRTW is checked outside this task
            {1'b1, DIFF_BANK , READ     , WRITE    } : ; // tRTW is checked outside this task
            {1'b0, DIFF_BANK , READ     , READ     } : begin if (ck_cntr - ck_read < TCCD)                                                                                     $display ("%m: at time %t ERROR:  tCCD violation during %s to bank %d", $time, cmd_string[cmd], bank);        end
            {1'b1, DIFF_BANK , READ     , READ     } : begin if (ck_cntr - ck_group_read[bank[1]] < TCCD)                                                                      $display ("%m: at time %t ERROR:  tCCD violation during %s to bank %d", $time, cmd_string[cmd], bank);        end
            {1'b1, DIFF_GROUP, READ     , WRITE    } : ; // tRTW is checked outside this task
            {1'b1, DIFF_GROUP, READ     , READ     } : begin if (ck_cntr - ck_read < TCCD_DG)                                                                                  $display ("%m: at time %t ERROR:  tCCD_DG violation during %s to bank %d", $time, cmd_string[cmd], bank);     end
            {1'bx, DIFF_BANK , READ     , PWR_DOWN } : begin if (ck_cntr - ck_read < read_latency + 5)                                                                         $display ("%m: at time %t ERROR:  tRDPDEN violation during %s", $time, cmd_string[cmd]);                      end
            // zq
            {1'bx, DIFF_BANK , ZQ       , LOAD_MODE} : ; // 1 tCK
            {1'bx, DIFF_BANK , ZQ       , REFRESH  } ,
            {1'bx, DIFF_BANK , ZQ       , PRECHARGE} ,
            {1'bx, DIFF_BANK , ZQ       , ACTIVATE } ,
            {1'bx, DIFF_BANK , ZQ       , ZQ       } ,
            {1'bx, DIFF_BANK , ZQ       , PWR_DOWN } ,
            {1'bx, DIFF_BANK , ZQ       , SELF_REF } : begin if (ck_cntr - ck_zqinit < TZQINIT)                                                                                $display ("%m: at time %t ERROR:  tZQinit violation during %s", $time, cmd_string[cmd]);
                                                             if (ck_cntr - ck_zqoper < TZQOPER)                                                                                $display ("%m: at time %t ERROR:  tZQoper violation during %s", $time, cmd_string[cmd]);
                                                             if (ck_cntr - ck_zqcs < TZQCS)                                                                                    $display ("%m: at time %t ERROR:  tZQCS violation during %s", $time, cmd_string[cmd]);                        end
            // power down
            {1'bx, DIFF_BANK , PWR_DOWN , LOAD_MODE} ,
            {1'bx, DIFF_BANK , PWR_DOWN , REFRESH  } ,
            {1'bx, DIFF_BANK , PWR_DOWN , PRECHARGE} ,
            {1'bx, DIFF_BANK , PWR_DOWN , ACTIVATE } ,
            {1'bx, DIFF_BANK , PWR_DOWN , WRITE    } ,
            {1'bx, DIFF_BANK , PWR_DOWN , ZQ       } : begin if (($time - tm_power_down < TXP) || (ck_cntr - ck_power_down < TXP_TCK))                                         $display ("%m: at time %t ERROR:   tXP violation during %s", $time, cmd_string[cmd]);                         end
            {1'bx, DIFF_BANK , PWR_DOWN , READ     } : begin if (($time - tm_power_down < TXP) || (ck_cntr - ck_power_down < TXP_TCK))                                         $display ("%m: at time %t ERROR:   tXP violation during %s", $time, cmd_string[cmd]);
                                                        else if (($time - tm_slow_exit_pd < TXPDLL) || (ck_cntr - ck_slow_exit_pd < TXPDLL_TCK))                               $display ("%m: at time %t ERROR:  tXPDLL violation during %s", $time, cmd_string[cmd]);                       end
            {1'bx, DIFF_BANK , PWR_DOWN , PWR_DOWN } ,
            {1'bx, DIFF_BANK , PWR_DOWN , SELF_REF } : begin if (($time - tm_power_down < TXP) || (ck_cntr - ck_power_down < TXP_TCK))                                         $display ("%m: at time %t ERROR:   tXP violation during %s", $time, cmd_string[cmd]);
                                                             if ((tm_power_down > tm_refresh) && ($time - tm_refresh < TRFC_MIN))                                              $display ("%m: at time %t ERROR:  tRFC violation during %s", $time, cmd_string[cmd]);
                                                             if ((tm_refresh > tm_power_down) && (($time - tm_power_down < TXPDLL) || (ck_cntr - ck_power_down < TXPDLL_TCK))) $display ("%m: at time %t ERROR:  tXPDLL violation during %s", $time, cmd_string[cmd]);
                                                             if (($time - tm_cke_cmd < TCKE) || (ck_cntr - ck_cke_cmd < TCKE_TCK))                                             $display ("%m: at time %t ERROR:  tCKE violation on CKE", $time);                                             end
            // self refresh
            {1'bx, DIFF_BANK , SELF_REF , LOAD_MODE} ,
            {1'bx, DIFF_BANK , SELF_REF , REFRESH  } ,
            {1'bx, DIFF_BANK , SELF_REF , PRECHARGE} ,
            {1'bx, DIFF_BANK , SELF_REF , ACTIVATE } ,
            {1'bx, DIFF_BANK , SELF_REF , WRITE    } ,
            {1'bx, DIFF_BANK , SELF_REF , ZQ       } : begin if (($time - tm_self_refresh < TXS) || (ck_cntr - ck_self_refresh < TXS_TCK))                                     $display ("%m: at time %t ERROR:   tXS violation during %s", $time, cmd_string[cmd]);                         end
            {1'bx, DIFF_BANK , SELF_REF , READ     } : begin if (ck_cntr - ck_self_refresh < TXSDLL)                                                                           $display ("%m: at time %t ERROR:  tXSDLL violation during %s", $time, cmd_string[cmd]);                       end
            {1'bx, DIFF_BANK , SELF_REF , PWR_DOWN } ,
            {1'bx, DIFF_BANK , SELF_REF , SELF_REF } : begin if (($time - tm_self_refresh < TXS) || (ck_cntr - ck_self_refresh < TXS_TCK))                                     $display ("%m: at time %t ERROR:   tXS violation during %s", $time, cmd_string[cmd]);
                                                             if (($time - tm_cke_cmd < TCKE) || (ck_cntr - ck_cke_cmd < TCKE_TCK))                                             $display ("%m: at time %t ERROR:  tCKE violation on CKE", $time);                                             end
        endcase
    end
    endtask
    task cmd_task;
        input cke;
        input [2:0] cmd;
        input [BA_BITS-1:0] bank;
        input [ADDR_BITS-1:0] addr;
        reg [`BANKS:0] i;
        integer j;
        reg [`BANKS:0] tfaw_cntr;
        reg [COL_BITS-1:0] col;
        reg group;
        begin
            // tRFC max check
            if (!er_trfc_max && !in_self_refresh) begin
                if ($time - tm_refresh > TRFC_MAX && check_strict_timing) begin
                    $display ("%m: at time %t ERROR:  tRFC maximum violation during %s", $time, cmd_string[cmd]);
                    er_trfc_max = 1;
                end
            end
            if (cke) begin
                if ((cmd < NOP) && (cmd != PRECHARGE)) begin
                    if (($time - tm_txpr < TXPR) || (ck_cntr - ck_txpr < TXPR_TCK))
                        $display ("%m: at time %t ERROR:  tXPR violation during %s", $time, cmd_string[cmd]);
                    for (j=0; j<=SELF_REF; j=j+1) begin
                        chk_err(SAME_BANK , bank, j, cmd);
                        chk_err(DIFF_BANK , bank, j, cmd);
                        chk_err(DIFF_GROUP, bank, j, cmd);
                    end
                end
                case (cmd)
                    LOAD_MODE : begin
                        if (|odt_pipeline)
                            $display ("%m: at time %t ERROR: ODTL violation during %s", $time, cmd_string[cmd]);
                        if (odt_state)
                            $display ("%m: at time %t ERROR: ODT must be off prior to %s", $time, cmd_string[cmd]);
                        if (|active_bank) begin
                            $display ("%m: at time %t ERROR: %s Failure.  All banks must be Precharged.", $time, cmd_string[cmd]);
                            if (STOP_ON_ERROR) $stop(0);
                        end else begin
                            if (DEBUG) $display ("%m: at time %t INFO: %s %d", $time, cmd_string[cmd], bank);
                            if (bank>>2) begin
                                $display ("%m: at time %t ERROR: %s %d Illegal value.  Reserved bank bits must be programmed to zero", $time, cmd_string[cmd], bank);
                            end
                            case (bank)
                                0 : begin
                                    // Burst Length
                                    if (addr[1:0] == 2'b00) begin
                                        burst_length = 8;
                                        blotf = 0;
                                        truebl4 = 0;
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d Burst Length = %d", $time, cmd_string[cmd], bank, burst_length);
                                    end else if (addr[1:0] == 2'b01) begin
                                        burst_length = 8;
                                        blotf = 1;
                                        truebl4 = 0;
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d Burst Length = Select via A12", $time, cmd_string[cmd], bank);
                                    end else if (addr[1:0] == 2'b10) begin
                                        burst_length = 4;
                                        blotf = 0;
                                        truebl4 = 0;
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d Burst Length = Fixed %d (chop)", $time, cmd_string[cmd], bank, burst_length);
                                    end else if (feature_truebl4 && (addr[1:0] == 2'b11)) begin
                                        burst_length = 4;
                                        blotf = 0;
                                        truebl4 = 1;
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d Burst Length = True %d", $time, cmd_string[cmd], bank, burst_length);
                                    end else begin
                                        $display ("%m: at time %t ERROR: %s %d Illegal Burst Length = %d", $time, cmd_string[cmd], bank, addr[1:0]);
                                    end
                                    // Burst Order
                                    burst_order = addr[3];
                                    if (!burst_order) begin
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d Burst Order = Sequential", $time, cmd_string[cmd], bank);
                                    end else if (burst_order) begin
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d Burst Order = Interleaved", $time, cmd_string[cmd], bank);
                                    end else begin
                                        $display ("%m: at time %t ERROR: %s %d Illegal Burst Order = %d", $time, cmd_string[cmd], bank, burst_order);
                                    end
                                    // CAS Latency
                                    cas_latency = {addr[2],addr[6:4]} + 4;
                                    set_latency;
                                    if ((cas_latency >= CL_MIN) && (cas_latency <= CL_MAX)) begin
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d CAS Latency = %d", $time, cmd_string[cmd], bank, cas_latency);
                                    end else begin
                                        $display ("%m: at time %t ERROR: %s %d Illegal CAS Latency = %d", $time, cmd_string[cmd], bank, cas_latency);
                                    end
                                    // Reserved
                                    if (addr[7] !== 0 && check_strict_mrbits) begin
                                        $display ("%m: at time %t ERROR: %s %d Illegal value.  Reserved address bits must be programmed to zero", $time, cmd_string[cmd], bank);
                                    end
                                    // DLL Reset
                                    dll_reset = addr[8];
                                    if (!dll_reset) begin
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d DLL Reset = Normal", $time, cmd_string[cmd], bank);
                                    end else if (dll_reset) begin
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d DLL Reset = Reset DLL", $time, cmd_string[cmd], bank);
                                        dll_locked = 0;
                                        init_dll_reset = 1;
                                        ck_dll_reset <= ck_cntr;
                                    end else begin
                                        $display ("%m: at time %t ERROR: %s %d Illegal DLL Reset = %d", $time, cmd_string[cmd], bank, dll_reset);
                                    end
								   // Write Recovery
								   if (addr[11:9] == 0) begin
									  write_recovery  = 16;
								   end else if (addr[11:9] < 4) begin
									  write_recovery  = addr[11:9] + 4;
								   end else begin
									  write_recovery  = 2*addr[11:9];
								   end
                                    if ((write_recovery >= WR_MIN) && (write_recovery <= WR_MAX)) begin
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d Write Recovery = %d", $time, cmd_string[cmd], bank, write_recovery);
                                    end else begin
                                        $display ("%m: at time %t ERROR: %s %d Illegal Write Recovery = %d", $time, cmd_string[cmd], bank, write_recovery);
                                    end
                                    // Power Down Mode
                                    low_power = !addr[12];
                                    if (!low_power) begin
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d Power Down Mode = DLL on", $time, cmd_string[cmd], bank);
                                    end else if (low_power) begin
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d Power Down Mode = DLL off", $time, cmd_string[cmd], bank);
                                    end else begin
                                        $display ("%m: at time %t ERROR: %s %d Illegal Power Down Mode = %d", $time, cmd_string[cmd], bank, low_power);
                                    end
                                    // Reserved
                                    if (ADDR_BITS>13 && addr[13] !== 0 && check_strict_mrbits) begin
                                        $display ("%m: at time %t ERROR: %s %d Illegal value.  Reserved address bits must be programmed to zero", $time, cmd_string[cmd], bank);
                                    end
                                end
                                1 : begin
                                    // DLL Enable
                                    dll_en = !addr[0];
                                    if (!dll_en) begin
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d DLL Enable = Disabled", $time, cmd_string[cmd], bank);
                                        if (check_strict_mrbits) $display ("%m: at time %t WARNING: %s %d DLL off mode is not modeled", $time, cmd_string[cmd], bank);
                                    end else if (dll_en) begin
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d DLL Enable = Enabled", $time, cmd_string[cmd], bank);
                                    end else begin
                                        $display ("%m: at time %t ERROR: %s %d Illegal DLL Enable = %d", $time, cmd_string[cmd], bank, dll_en);
                                    end
                                    // Output Drive Strength
                                    if ({addr[5], addr[1]} == 2'b00) begin
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d Output Drive Strength = %d Ohm", $time, cmd_string[cmd], bank, RZQ/6);
                                    end else if ({addr[5], addr[1]} == 2'b01) begin
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d Output Drive Strength = %d Ohm", $time, cmd_string[cmd], bank, RZQ/7);
                                    end else if ({addr[5], addr[1]} == 2'b11) begin
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d Output Drive Strength = %d Ohm", $time, cmd_string[cmd], bank, RZQ/5);
                                    end else begin
                                        $display ("%m: at time %t ERROR: %s %d Illegal Output Drive Strength = %d", $time, cmd_string[cmd], bank, {addr[5], addr[1]});
                                    end
                                    // ODT Rtt (Rtt_NOM)
                                    odt_rtt_nom = {addr[9], addr[6], addr[2]};
                                    if (odt_rtt_nom == 3'b000) begin
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d ODT Rtt = Disabled", $time, cmd_string[cmd], bank);
                                        odt_en = 0;
                                    end else if ((odt_rtt_nom < 4) || ((!addr[7] || (addr[7] && addr[12])) && (odt_rtt_nom < 6))) begin
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d ODT Rtt = %d Ohm", $time, cmd_string[cmd], bank, get_rtt_nom(odt_rtt_nom));
                                        odt_en = 1;
                                    end else begin
                                        $display ("%m: at time %t ERROR: %s %d Illegal ODT Rtt = %d", $time, cmd_string[cmd], bank, odt_rtt_nom);
                                        odt_en = 0;
                                    end
                                    // Report the additive latency value
                                    al = addr[4:3];
                                    set_latency;
                                    if (al == 0) begin
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d Additive Latency = %d", $time, cmd_string[cmd], bank, al);
                                    end else if ((al >= AL_MIN) && (al <= AL_MAX)) begin
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d Additive Latency = CL - %d", $time, cmd_string[cmd], bank, al);
                                    end else begin
                                        $display ("%m: at time %t ERROR: %s %d Illegal Additive Latency = %d", $time, cmd_string[cmd], bank, al);
                                    end
                                    // Write Levelization
                                    write_levelization = addr[7];
                                    if (!write_levelization) begin
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d Write Levelization = Disabled", $time, cmd_string[cmd], bank);
                                    end else if (write_levelization) begin
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d Write Levelization = Enabled", $time, cmd_string[cmd], bank);
                                    end else begin
                                        $display ("%m: at time %t ERROR: %s %d Illegal Write Levelization = %d", $time, cmd_string[cmd], bank, write_levelization);
                                    end
                                    // Reserved
                                    if (addr[8] !== 0 && check_strict_mrbits) begin
                                        $display ("%m: at time %t ERROR: %s %d Illegal value.  Reserved address bits must be programmed to zero", $time, cmd_string[cmd], bank);
                                    end
                                    // Reserved
                                    if (addr[10] !== 0 && check_strict_mrbits) begin
                                        $display ("%m: at time %t ERROR: %s %d Illegal value.  Reserved address bits must be programmed to zero", $time, cmd_string[cmd], bank);
                                    end
                                    // TDQS Enable
                                    tdqs_en = addr[11];
                                    if (!tdqs_en) begin
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d TDQS Enable = Disabled", $time, cmd_string[cmd], bank);
                                    end else if (tdqs_en) begin
                                        if (8 == DQ_BITS) begin
										    if (DEBUG) $display ("%m: at time %t INFO: %s %d TDQS Enable = Enabled", $time, cmd_string[cmd], bank);
                                        end
									    else begin
                                            $display ("%m: at time %t WARNING: %s %d Illegal TDQS Enable.  TDQS only exists on a x8 part", $time, cmd_string[cmd], bank);
                                            tdqs_en = 0;
										end
                                    end else begin
                                        $display ("%m: at time %t ERROR: %s %d Illegal TDQS Enable = %d", $time, cmd_string[cmd], bank, tdqs_en);
                                    end
                                    // Output Enable
                                    out_en = !addr[12];
                                    if (!out_en) begin
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d Qoff = Disabled", $time, cmd_string[cmd], bank);
                                    end else if (out_en) begin
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d Qoff = Enabled", $time, cmd_string[cmd], bank);
                                    end else begin
                                        $display ("%m: at time %t ERROR: %s %d Illegal Qoff = %d", $time, cmd_string[cmd], bank, out_en);
                                    end
                                    // Reserved
                                    if (ADDR_BITS>13 && addr[13] !== 0 && check_strict_mrbits) begin
                                        $display ("%m: at time %t ERROR: %s %d Illegal value.  Reserved address bits must be programmed to zero", $time, cmd_string[cmd], bank);
                                    end
                                end
                                2 : begin
								    if (feature_pasr) begin
                                        // Partial Array Self Refresh
                                        pasr = addr[2:0];
                                        case (pasr)
                                            3'b000 : if (DEBUG) $display ("%m: at time %t INFO: %s %d Partial Array Self Refresh = Bank 0-7", $time, cmd_string[cmd], bank);
                                            3'b001 : if (DEBUG) $display ("%m: at time %t INFO: %s %d Partial Array Self Refresh = Bank 0-3", $time, cmd_string[cmd], bank);
                                            3'b010 : if (DEBUG) $display ("%m: at time %t INFO: %s %d Partial Array Self Refresh = Bank 0-1", $time, cmd_string[cmd], bank);
                                            3'b011 : if (DEBUG) $display ("%m: at time %t INFO: %s %d Partial Array Self Refresh = Bank 0", $time, cmd_string[cmd], bank);
                                            3'b100 : if (DEBUG) $display ("%m: at time %t INFO: %s %d Partial Array Self Refresh = Bank 2-7", $time, cmd_string[cmd], bank);
                                            3'b101 : if (DEBUG) $display ("%m: at time %t INFO: %s %d Partial Array Self Refresh = Bank 4-7", $time, cmd_string[cmd], bank);
                                            3'b110 : if (DEBUG) $display ("%m: at time %t INFO: %s %d Partial Array Self Refresh = Bank 6-7", $time, cmd_string[cmd], bank);
                                            3'b111 : if (DEBUG) $display ("%m: at time %t INFO: %s %d Partial Array Self Refresh = Bank 7", $time, cmd_string[cmd], bank);
                                            default : $display ("%m: at time %t ERROR: %s %d Illegal Partial Array Self Refresh = %d", $time, cmd_string[cmd], bank, pasr);
                                        endcase
									end
								    else
                                    if (addr[2:0] !== 0 && check_strict_mrbits) begin
                                        $display ("%m: at time %t ERROR: %s %d Illegal value.  Reserved address bits must be programmed to zero", $time, cmd_string[cmd], bank);
                                    end
                                    // CAS Write Latency
                                    cas_write_latency = addr[5:3]+5;
                                    set_latency;
                                    if ((cas_write_latency >= CWL_MIN) && (cas_write_latency <= CWL_MAX)) begin
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d CAS Write Latency = %d", $time, cmd_string[cmd], bank, cas_write_latency);
                                    end else begin
                                        $display ("%m: at time %t ERROR: %s %d Illegal CAS Write Latency = %d", $time, cmd_string[cmd], bank, cas_write_latency);
                                    end
                                    // Auto Self Refresh Method
                                    asr = addr[6];
                                    if (!asr) begin
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d Auto Self Refresh = Disabled", $time, cmd_string[cmd], bank);
                                    end else if (asr) begin
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d Auto Self Refresh = Enabled", $time, cmd_string[cmd], bank);
                                        if (check_strict_mrbits) $display ("%m: at time %t WARNING: %s %d Auto Self Refresh is not modeled", $time, cmd_string[cmd], bank);
                                    end else begin
                                        $display ("%m: at time %t ERROR: %s %d Illegal Auto Self Refresh = %d", $time, cmd_string[cmd], bank, asr);
                                    end
                                    // Self Refresh Temperature
                                    srt = addr[7];
                                    if (!srt) begin
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d Self Refresh Temperature = Normal", $time, cmd_string[cmd], bank);
                                    end else if (srt) begin
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d Self Refresh Temperature = Extended", $time, cmd_string[cmd], bank);
                                        if (check_strict_mrbits) $display ("%m: at time %t WARNING: %s %d Self Refresh Temperature is not modeled", $time, cmd_string[cmd], bank);
                                    end else begin
                                        $display ("%m: at time %t ERROR: %s %d Illegal Self Refresh Temperature = %d", $time, cmd_string[cmd], bank, srt);
                                    end
                                    if (asr && srt)
                                        $display ("%m: at time %t ERROR: %s %d SRT must be set to 0 when ASR is enabled.", $time, cmd_string[cmd], bank);
                                    // Reserved
                                    if (addr[8] !== 0 && check_strict_mrbits) begin
                                        $display ("%m: at time %t ERROR: %s %d Illegal value.  Reserved address bits must be programmed to zero", $time, cmd_string[cmd], bank);
                                    end
                                    // Dynamic ODT (Rtt_WR)
                                    odt_rtt_wr = addr[10:9];
                                    if (odt_rtt_wr == 2'b00) begin
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d Dynamic ODT = Disabled", $time, cmd_string[cmd], bank);
                                        dyn_odt_en = 0;
                                    end else if ((odt_rtt_wr > 0) && (odt_rtt_wr < 3)) begin
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d Dynamic ODT Rtt = %d Ohm", $time, cmd_string[cmd], bank, get_rtt_wr(odt_rtt_wr));
                                        dyn_odt_en = 1;
                                    end else begin
                                        $display ("%m: at time %t ERROR: %s %d Illegal Dynamic ODT = %d", $time, cmd_string[cmd], bank, odt_rtt_wr);
                                        dyn_odt_en = 0;
                                    end
                                    // Reserved
                                    if (ADDR_BITS>13 && addr[13:11] !== 0 && check_strict_mrbits) begin
                                        $display ("%m: at time %t ERROR: %s %d Illegal value.  Reserved address bits must be programmed to zero", $time, cmd_string[cmd], bank);
                                    end
                                end
                                3 : begin
                                    mpr_select = addr[1:0];
                                    // MultiPurpose Register Select
                                    if (mpr_select == 2'b00) begin
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d MultiPurpose Register Select = Pre-defined pattern", $time, cmd_string[cmd], bank);
                                    end else begin
                                        if (check_strict_mrbits) $display ("%m: at time %t ERROR: %s %d Illegal MultiPurpose Register Select = %d", $time, cmd_string[cmd], bank, mpr_select);
                                    end
                                    // MultiPurpose Register Enable
                                    mpr_en = addr[2];
                                    if (!mpr_en) begin
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d MultiPurpose Register Enable = Disabled", $time, cmd_string[cmd], bank);
                                    end else if (mpr_en) begin
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d MultiPurpose Register Enable = Enabled", $time, cmd_string[cmd], bank);
                                    end else begin
                                        $display ("%m: at time %t ERROR: %s %d Illegal MultiPurpose Register Enable = %d", $time, cmd_string[cmd], bank, mpr_en);
                                    end
                                    // Reserved
                                    if (ADDR_BITS>13 && addr[13:3] !== 0 && check_strict_mrbits) begin
                                        $display ("%m: at time %t ERROR: %s %d Illegal value.  Reserved address bits must be programmed to zero", $time, cmd_string[cmd], bank);
                                    end
                                end
                            endcase
                            if (dyn_odt_en && write_levelization)
                                $display ("%m: at time %t ERROR: Dynamic ODT is not available during Write Leveling mode.", $time);
                            init_mode_reg[bank] = 1;
                            mode_reg[bank] = addr;
                            tm_load_mode <= $time;
                            ck_load_mode <= ck_cntr;
                        end
                    end
                    REFRESH : begin
                        if (mpr_en) begin
                            $display ("%m: at time %t ERROR: %s Failure.  Multipurpose Register must be disabled.", $time, cmd_string[cmd]);
                            if (STOP_ON_ERROR) $stop(0);
                        end else if (|active_bank) begin
                            $display ("%m: at time %t ERROR: %s Failure.  All banks must be Precharged.", $time, cmd_string[cmd]);
                            if (STOP_ON_ERROR) $stop(0);
                        end else begin
                            if (DEBUG) $display ("%m: at time %t INFO: %s", $time, cmd_string[cmd]);
                            er_trfc_max = 0;
                            ref_cntr = ref_cntr + 1;
                            tm_refresh <= $time;
                            ck_refresh <= ck_cntr;
                        end
                    end
                    PRECHARGE : begin
                        if (addr[AP]) begin
                            if (DEBUG) $display ("%m: at time %t INFO: %s All", $time, cmd_string[cmd]);
                        end
                        // PRECHARGE command will be treated as a NOP if there is no open row in that bank (idle state),
                        // or if the previously open row is already in the process of precharging
                        if (|active_bank) begin
                            if (($time - tm_txpr < TXPR) || (ck_cntr - ck_txpr < TXPR_TCK))
                                $display ("%m: at time %t ERROR:  tXPR violation during %s", $time, cmd_string[cmd]);
                            if (mpr_en) begin
                                $display ("%m: at time %t ERROR: %s Failure.  Multipurpose Register must be disabled.", $time, cmd_string[cmd]);
                                if (STOP_ON_ERROR) $stop(0);
                            end else begin
                                for (i=0; i<`BANKS; i=i+1) begin
                                    if (active_bank[i]) begin
                                        if (addr[AP] || (i == bank)) begin
                                            for (j=0; j<=SELF_REF; j=j+1) begin
                                                chk_err(SAME_BANK, i, j, cmd);
                                                chk_err(DIFF_BANK, i, j, cmd);
                                            end
                                            if (auto_precharge_bank[i]) begin
                                                $display ("%m: at time %t ERROR: %s Failure.  Auto Precharge is scheduled to bank %d.", $time, cmd_string[cmd], i);
                                                if (STOP_ON_ERROR) $stop(0);
                                            end else begin
                                                if (DEBUG) $display ("%m: at time %t INFO: %s bank %d", $time, cmd_string[cmd], i);
                                                active_bank[i] = 1'b0;
                                                tm_bank_precharge[i] <= $time;
                                                tm_precharge <= $time;
                                                ck_precharge <= ck_cntr;
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                    ACTIVATE : begin
                        tfaw_cntr = 0;
                        for (i=0; i<`BANKS; i=i+1) begin
                            if ($time - tm_bank_activate[i] < TFAW) begin
                                tfaw_cntr = tfaw_cntr + 1;
                            end
                        end
                        if (tfaw_cntr > 3) begin
                            $display ("%m: at time %t ERROR:  tFAW violation during %s to bank %d", $time, cmd_string[cmd], bank);
                        end
                        if (mpr_en) begin
                            $display ("%m: at time %t ERROR: %s Failure.  Multipurpose Register must be disabled.", $time, cmd_string[cmd]);
                            if (STOP_ON_ERROR) $stop(0);
                        end else if (!init_done) begin
                            $display ("%m: at time %t ERROR: %s Failure.  Initialization sequence is not complete.", $time, cmd_string[cmd]);
                            if (STOP_ON_ERROR) $stop(0);
                        end else if (active_bank[bank]) begin
                            $display ("%m: at time %t ERROR: %s Failure.  Bank %d must be Precharged.", $time, cmd_string[cmd], bank);
                            if (STOP_ON_ERROR) $stop(0);
                        end else begin
                            if (addr >= 1<<ROW_BITS) begin
                                $display ("%m: at time %t WARNING: row = %h does not exist.  Maximum row = %h", $time, addr, (1<<ROW_BITS)-1);
                            end
                            if (DEBUG) $display ("%m: at time %t INFO: %s bank %d row %h", $time, cmd_string[cmd], bank, addr);
                            active_bank[bank] = 1'b1;
                            active_row[bank] = addr;
                            tm_group_activate[bank[1]] <= $time;
                            tm_activate <= $time;
                            tm_bank_activate[bank] <= $time;
                            ck_group_activate[bank[1]] <= ck_cntr;
                            ck_activate <= ck_cntr;
                        end
                    end
                    WRITE : begin
                        if ((!rd_bc && blotf) || (burst_length == 4)) begin // BL=4
                            if (truebl4) begin
                                if (ck_cntr - ck_group_read[bank[1]] < read_latency + TCCD/2 + 2 - write_latency)
                                    $display ("%m: at time %t ERROR:  tRTW violation during %s to bank %d", $time, cmd_string[cmd], bank);
                                if (ck_cntr - ck_read < read_latency + TCCD_DG/2 + 2 - write_latency)
                                    $display ("%m: at time %t ERROR:  tRTW_DG violation during %s to bank %d", $time, cmd_string[cmd], bank);
                            end else begin
                                if (ck_cntr - ck_read < read_latency + TCCD/2 + 2 - write_latency)
                                    $display ("%m: at time %t ERROR:  tRTW violation during %s to bank %d", $time, cmd_string[cmd], bank);
                            end
                        end else begin // BL=8
                            if (ck_cntr - ck_read < read_latency + TCCD + 2 - write_latency)
                                $display ("%m: at time %t ERROR:  tRTW violation during %s to bank %d", $time, cmd_string[cmd], bank);
                        end
                        if (mpr_en) begin
                            $display ("%m: at time %t ERROR: %s Failure.  Multipurpose Register must be disabled.", $time, cmd_string[cmd]);
                            if (STOP_ON_ERROR) $stop(0);
                        end else if (!init_done) begin
                            $display ("%m: at time %t ERROR: %s Failure.  Initialization sequence is not complete.", $time, cmd_string[cmd]);
                            if (STOP_ON_ERROR) $stop(0);
                        end else if (!active_bank[bank])  begin
                            if (check_strict_timing) $display ("%m: at time %t ERROR: %s Failure.  Bank %d must be Activated.", $time, cmd_string[cmd], bank);
                            if (STOP_ON_ERROR) $stop(0);
                        end else if (auto_precharge_bank[bank]) begin
                            $display ("%m: at time %t ERROR: %s Failure.  Auto Precharge is scheduled to bank %d.", $time, cmd_string[cmd], bank);
                            if (STOP_ON_ERROR) $stop(0);
                        end else if (ck_cntr - ck_write < burst_length/2) begin
                            $display ("%m: at time %t ERROR: %s Failure.  Illegal burst interruption.", $time, cmd_string[cmd]);
                            if (STOP_ON_ERROR) $stop(0);
                        end else begin
                            if (addr[AP]) begin
                                auto_precharge_bank[bank] = 1'b1;
                                write_precharge_bank[bank] = 1'b1;
                            end
                            col = {addr[BC-1:AP+1], addr[AP-1:0]}; // assume BC > AP
                            if (col >= 1<<COL_BITS) begin
                                $display ("%m: at time %t WARNING: col = %h does not exist.  Maximum col = %h", $time, col, (1<<COL_BITS)-1);
                            end
                            if ((!addr[BC] && blotf) || (burst_length == 4)) begin // BL=4
                                col = col & -4;
                            end else begin // BL=8
                                col = col & -8;
                            end
                            if (DEBUG) $display ("%m: at time %t INFO: %s bank %d col %h, auto precharge %d", $time, cmd_string[cmd], bank, col, addr[AP]);
                            wr_pipeline[2*write_latency + 1]  = 1;
                            ba_pipeline[2*write_latency + 1]  = bank;
                            row_pipeline[2*write_latency + 1] = active_row[bank];
                            col_pipeline[2*write_latency + 1] = col;
                            if ((!addr[BC] && blotf) || (burst_length == 4)) begin // BL=4
                                bl_pipeline[2*write_latency + 1] = 4;
                                if (mpr_en && col%4) begin
                                    $display ("%m: at time %t WARNING: col[1:0] must be set to 2'b00 during a BL4 Multipurpose Register read", $time);
                                end
                            end else begin // BL=8
                                bl_pipeline[2*write_latency + 1] = 8;
                                if (odt_in) begin
                                    ck_odth8 <= ck_cntr;
                                end
                            end
                            for (j=0; j<(burst_length + 4); j=j+1) begin
                                dyn_odt_pipeline[2*(write_latency - 2) + j] = 1'b1; // ODTLcnw = WL - 2, ODTLcwn = BL/2 + 2
                            end
                            ck_bank_write[bank] <= ck_cntr;
                            ck_group_write[bank[1]] <= ck_cntr;
                            ck_write <= ck_cntr;
                        end
                    end
                    READ : begin
                        if (!dll_locked)
                            $display ("%m: at time %t WARNING: tDLLK violation during %s.", $time, cmd_string[cmd]);
                        if (mpr_en && (addr[1:0] != 2'b00)) begin
                            $display ("%m: at time %t ERROR: %s Failure.  addr[1:0] must be zero during Multipurpose Register Read.", $time, cmd_string[cmd]);
                            if (STOP_ON_ERROR) $stop(0);
                        end else if (!init_done) begin
                            $display ("%m: at time %t ERROR: %s Failure.  Initialization sequence is not complete.", $time, cmd_string[cmd]);
                            if (STOP_ON_ERROR) $stop(0);
                        end else if (!active_bank[bank] && !mpr_en) begin
                            if (check_strict_timing) $display ("%m: at time %t ERROR: %s Failure.  Bank %d must be Activated.", $time, cmd_string[cmd], bank);
                            if (STOP_ON_ERROR) $stop(0);
                        end else if (auto_precharge_bank[bank]) begin
                            $display ("%m: at time %t ERROR: %s Failure.  Auto Precharge is scheduled to bank %d.", $time, cmd_string[cmd], bank);
                            if (STOP_ON_ERROR) $stop(0);
                        end else if (ck_cntr - ck_read < burst_length/2) begin
                            $display ("%m: at time %t ERROR: %s Failure.  Illegal burst interruption.", $time, cmd_string[cmd]);
                            if (STOP_ON_ERROR) $stop(0);
                        end else begin
                            if (addr[AP] && !mpr_en) begin
                                auto_precharge_bank[bank] = 1'b1;
                                read_precharge_bank[bank] = 1'b1;
                            end
                            col = {addr[BC-1:AP+1], addr[AP-1:0]}; // assume BC > AP
                            if (col >= 1<<COL_BITS) begin
                                $display ("%m: at time %t WARNING: col = %h does not exist.  Maximum col = %h", $time, col, (1<<COL_BITS)-1);
                            end
                            if (DEBUG) $display ("%m: at time %t INFO: %s bank %d col %h, auto precharge %d", $time, cmd_string[cmd], bank, col, addr[AP]);
                            rd_pipeline[2*read_latency - 1]  = 1;
                            ba_pipeline[2*read_latency - 1]  = bank;
                            row_pipeline[2*read_latency - 1] = active_row[bank];
                            col_pipeline[2*read_latency - 1] = col;
                            if ((!addr[BC] && blotf) || (burst_length == 4)) begin // BL=4
                                bl_pipeline[2*read_latency - 1] = 4;
                                if (mpr_en && col%4) begin
                                    $display ("%m: at time %t WARNING: col[1:0] must be set to 2'b00 during a BL4 Multipurpose Register read", $time);
                                end
                            end else begin // BL=8
                                bl_pipeline[2*read_latency - 1] = 8;
                                if (mpr_en && col%8) begin
                                    $display ("%m: at time %t WARNING: col[2:0] must be set to 3'b000 during a BL8 Multipurpose Register read", $time);
                                end
                            end
                            rd_bc = addr[BC];
                            ck_bank_read[bank] <= ck_cntr;
                            ck_group_read[bank[1]] <= ck_cntr;
                            ck_read <= ck_cntr;
                        end
                    end
                    ZQ : begin
                        if (mpr_en) begin
                            $display ("%m: at time %t ERROR: %s Failure.  Multipurpose Register must be disabled.", $time, cmd_string[cmd]);
                            if (STOP_ON_ERROR) $stop(0);
                        end else if (|active_bank) begin
                            $display ("%m: at time %t ERROR: %s Failure.  All banks must be Precharged.", $time, cmd_string[cmd]);
                            if (STOP_ON_ERROR) $stop(0);
                        end else begin
                            if (DEBUG) $display ("%m: at time %t INFO: %s long = %d", $time, cmd_string[cmd], addr[AP]);
                            if (addr[AP]) begin
                                zq_set = 1;
                                if (init_done) begin
                                    ck_zqoper <= ck_cntr;
                                end else begin
                                    ck_zqinit <= ck_cntr;
                                end
                            end else begin
                                ck_zqcs <= ck_cntr;
                            end
                        end
                    end
                    NOP: begin
                        if (in_power_down) begin
                            if (($time - tm_freq_change < TCKSRX) || (ck_cntr - ck_freq_change < TCKSRX_TCK))
                                $display ("%m: at time %t ERROR: tCKSRX violation during Power Down Exit", $time);
                            if ($time - tm_cke_cmd > TPD_MAX)
                                $display ("%m: at time %t ERROR: tPD maximum violation during Power Down Exit", $time);
                            if (DEBUG) $display ("%m: at time %t INFO: Power Down Exit", $time);
                            in_power_down = 0;
                            if ((active_bank == 0) && low_power) begin // precharge power down with dll off
                                if (ck_cntr - ck_odt < write_latency - 1)
                                    $display ("%m: at time %t WARNING: tANPD violation during Power Down Exit.  Synchronous or asynchronous change in termination resistance is possible.", $time);
                                tm_slow_exit_pd <= $time;
                                ck_slow_exit_pd <= ck_cntr;
                            end
                            tm_power_down <= $time;
                            ck_power_down <= ck_cntr;
                        end
                        if (in_self_refresh) begin
                            if (($time - tm_freq_change < TCKSRX) || (ck_cntr - ck_freq_change < TCKSRX_TCK))
                                $display ("%m: at time %t ERROR: tCKSRX violation during Self Refresh Exit", $time);
                            if (ck_cntr - ck_cke_cmd < TCKESR_TCK)
                                $display ("%m: at time %t ERROR: tCKESR violation during Self Refresh Exit", $time);
                            if ($time - tm_cke < TISXR)
                                $display ("%m: at time %t ERROR: tISXR violation during Self Refresh Exit", $time);
                            if (DEBUG) $display ("%m: at time %t INFO: Self Refresh Exit", $time);
                            in_self_refresh = 0;
                            ck_dll_reset <= ck_cntr;
                            ck_self_refresh <= ck_cntr;
                            tm_self_refresh <= $time;
                            tm_refresh <= $time;
                        end
                    end
                endcase
                if ((prev_cke !== 1) && (cmd !== NOP)) begin
                    $display ("%m: at time %t ERROR: NOP or Deselect is required when CKE goes active.", $time);
                end
                if (!init_done) begin
                    case (init_step)
                        0 : begin
                            if ($time - tm_rst_n < 500000000 && check_strict_timing)
                                $display ("%m at time %t WARNING: 500 us is required after RST_N goes inactive before CKE goes active.", $time);
                            tm_txpr <= $time;
                            ck_txpr <= ck_cntr;
                            init_step = init_step + 1;
                        end
                        1 : if (dll_en) init_step = init_step + 1;
                        2 : begin
                            if (&init_mode_reg && init_dll_reset && zq_set) begin
                                if (DEBUG) $display ("%m: at time %t INFO: Initialization Sequence is complete", $time);
                                init_done = 1;
                            end
                        end
                    endcase
                end
            end else if (prev_cke) begin
                if ((!init_done) && (init_step > 1)) begin
                    $display ("%m: at time %t ERROR: CKE must remain active until the initialization sequence is complete.", $time);
                    if (STOP_ON_ERROR) $stop(0);
                end
                case (cmd)
                    REFRESH : begin
                        if ($time - tm_txpr < TXPR)
                            $display ("%m: at time %t ERROR:  tXPR violation during %s", $time, cmd_string[SELF_REF]);
                        for (j=0; j<=SELF_REF; j=j+1) begin
                            chk_err(DIFF_BANK, bank, j, SELF_REF);
                        end
                        if (mpr_en) begin
                            $display ("%m: at time %t ERROR: Self Refresh Failure.  Multipurpose Register must be disabled.", $time);
                            if (STOP_ON_ERROR) $stop(0);
                        end else if (|active_bank) begin
                            $display ("%m: at time %t ERROR: Self Refresh Failure.  All banks must be Precharged.", $time);
                            if (STOP_ON_ERROR) $stop(0);
                        end else if (odt_state) begin
                            $display ("%m: at time %t ERROR: Self Refresh Failure.  ODT must be off prior to entering Self Refresh", $time);
                            if (STOP_ON_ERROR) $stop(0);
                        end else if (!init_done) begin
                            $display ("%m: at time %t ERROR: Self Refresh Failure.  Initialization sequence is not complete.", $time);
                            if (STOP_ON_ERROR) $stop(0);
                        end else begin
                            if (DEBUG) $display ("%m: at time %t INFO: Self Refresh Enter", $time);
						    if (feature_pasr)
                                // Partial Array Self Refresh
                                case (pasr)
                                    3'b000 : ;//keep Bank 0-7
                                    3'b001 : begin if (DEBUG) $display("%m: at time %t INFO: Banks 4-7 will be lost due to Partial Array Self Refresh", $time); erase_banks(8'hF0); end
                                    3'b010 : begin if (DEBUG) $display("%m: at time %t INFO: Banks 2-7 will be lost due to Partial Array Self Refresh", $time); erase_banks(8'hFC); end
                                    3'b011 : begin if (DEBUG) $display("%m: at time %t INFO: Banks 1-7 will be lost due to Partial Array Self Refresh", $time); erase_banks(8'hFE); end
                                    3'b100 : begin if (DEBUG) $display("%m: at time %t INFO: Banks 0-1 will be lost due to Partial Array Self Refresh", $time); erase_banks(8'h03); end
                                    3'b101 : begin if (DEBUG) $display("%m: at time %t INFO: Banks 0-3 will be lost due to Partial Array Self Refresh", $time); erase_banks(8'h0F); end
                                    3'b110 : begin if (DEBUG) $display("%m: at time %t INFO: Banks 0-5 will be lost due to Partial Array Self Refresh", $time); erase_banks(8'h3F); end
                                    3'b111 : begin if (DEBUG) $display("%m: at time %t INFO: Banks 0-6 will be lost due to Partial Array Self Refresh", $time); erase_banks(8'h7F); end
							    endcase
                            in_self_refresh = 1;
                            dll_locked = 0;
                        end
                    end
                    NOP : begin
                        // entering precharge power down with dll off and tANPD has not been satisfied
                        if (low_power && (active_bank == 0) && |odt_pipeline)
                            $display ("%m: at time %t WARNING: tANPD violation during %s.   Synchronous or asynchronous change in termination resistance is possible.", $time, cmd_string[PWR_DOWN]);
                        if ($time - tm_txpr < TXPR)
                            $display ("%m: at time %t ERROR:  tXPR violation during %s", $time, cmd_string[PWR_DOWN]);
                        for (j=0; j<=SELF_REF; j=j+1) begin
                            chk_err(DIFF_BANK, bank, j, PWR_DOWN);
                        end
                        if (mpr_en) begin
                            $display ("%m: at time %t ERROR: Power Down Failure.  Multipurpose Register must be disabled.", $time);
                            if (STOP_ON_ERROR) $stop(0);
                        end else if (!init_done) begin
                            $display ("%m: at time %t ERROR: Power Down Failure.  Initialization sequence is not complete.", $time);
                            if (STOP_ON_ERROR) $stop(0);
                        end else begin
                            if (DEBUG) begin
                                if (|active_bank) begin
                                    $display ("%m: at time %t INFO: Active Power Down Enter", $time);
                                end else begin
                                    $display ("%m: at time %t INFO: Precharge Power Down Enter", $time);
                                end
                            end
                            in_power_down = 1;
                        end
                    end
                    default : begin
                        $display ("%m: at time %t ERROR: NOP, Deselect, or Refresh is required when CKE goes inactive.", $time);
                    end
                endcase
            end else if (in_self_refresh || in_power_down) begin
                if ((ck_cntr - ck_cke_cmd <= TCPDED) && (cmd !== NOP))
                    $display ("%m: at time %t ERROR: tCPDED violation during Power Down or Self Refresh Entry.  NOP or Deselect is required.", $time);
            end
            prev_cke  = cke;
        end
    endtask
    task data_task;
        reg [BA_BITS-1:0] bank;
        reg [ROW_BITS-1:0] row;
        reg [COL_BITS-1:0] col;
        integer i;
        integer j;
        begin
            if (diff_ck) begin
                for (i=0; i<32; i=i+1) begin
                    if (dq_in_valid && dll_locked && ($time - tm_dqs_neg[i] < $rtoi(TDSS*tck_avg)))
                        $display ("%m: at time %t ERROR: tDSS violation on %s bit %d", $time, dqs_string[i/16], i%16);
                    if (check_write_dqs_high[i])
                        $display ("%m: at time %t ERROR: %s bit %d latching edge required during the preceding clock period.", $time, dqs_string[i/16], i%16);
                end
                check_write_dqs_high <= 0;
            end else begin
                for (i=0; i<32; i=i+1) begin
                    if (dll_locked && dq_in_valid) begin
                        tm_tdqss = abs_value(1.0*tm_ck_pos - tm_dqss_pos[i]);
                        if ((tm_tdqss < tck_avg/2.0) && (tm_tdqss > TDQSS*tck_avg))
                            $display ("%m: at time %t ERROR: tDQSS violation on %s bit %d", $time, dqs_string[i/16], i%16);
                    end
                    if (check_write_dqs_low[i])
                        $display ("%m: at time %t ERROR: %s bit %d latching edge required during the preceding clock period", $time, dqs_string[i/16], i%16);
                end
                check_write_preamble <= 0;
                check_write_postamble <= 0;
                check_write_dqs_low <= 0;
            end
            if (wr_pipeline[0] || rd_pipeline[0]) begin
                bank = ba_pipeline[0];
                row = row_pipeline[0];
                col = col_pipeline[0];
                burst_cntr = 0;
                memory_read(bank, row, col, memory_data);
            end
            // burst counter
            if (burst_cntr < burst_length) begin
                burst_position = col ^ burst_cntr;
                if (!burst_order) begin
                    burst_position[BO_BITS-1:0] = col + burst_cntr;
                end
                burst_cntr = burst_cntr + 1;
            end
            // write dqs counter
            if (wr_pipeline[WDQS_PRE + 1]) begin
                wdqs_cntr = WDQS_PRE + bl_pipeline[WDQS_PRE + 1] + WDQS_PST - 1;
            end
            // write dqs
            if ((wr_pipeline[2]) && (wdq_cntr == 0)) begin //write preamble
                check_write_preamble <= ({DQS_BITS{1'b1}}<<16) | {DQS_BITS{1'b1}};
            end
            if (wdqs_cntr > 1) begin  // write data
                if ((wdqs_cntr - WDQS_PST)%2) begin
                    check_write_dqs_high <= ({DQS_BITS{1'b1}}<<16) | {DQS_BITS{1'b1}};
                end else begin
                    check_write_dqs_low <= ({DQS_BITS{1'b1}}<<16) | {DQS_BITS{1'b1}};
                end
            end
            if (wdqs_cntr == WDQS_PST) begin // write postamble
                check_write_postamble <= ({DQS_BITS{1'b1}}<<16) | {DQS_BITS{1'b1}};
            end
            if (wdqs_cntr > 0) begin
                wdqs_cntr = wdqs_cntr - 1;
            end
            // write dq
            if (dq_in_valid) begin // write data
                bit_mask = 0;
                if (diff_ck) begin
                    for (i=0; i<DM_BITS; i=i+1) begin
                        bit_mask = bit_mask | ({`DQ_PER_DQS{~dm_in_neg[i]}}<<(burst_position*DQ_BITS + i*`DQ_PER_DQS));
                    end
                    memory_data = (dq_in_neg<<(burst_position*DQ_BITS) & bit_mask) | (memory_data & ~bit_mask);
                end else begin
                    for (i=0; i<DM_BITS; i=i+1) begin
                        bit_mask = bit_mask | ({`DQ_PER_DQS{~dm_in_pos[i]}}<<(burst_position*DQ_BITS + i*`DQ_PER_DQS));
                    end
                    memory_data = (dq_in_pos<<(burst_position*DQ_BITS) & bit_mask) | (memory_data & ~bit_mask);
                end
                dq_temp = memory_data>>(burst_position*DQ_BITS);
                if (DEBUG) $display ("%m: at time %t INFO: WRITE @ DQS= bank = %h row = %h col = %h data = %h",$time, bank, row, (-1*BL_MAX & col) + burst_position, dq_temp);
                if (burst_cntr%BL_MIN == 0) begin
                    memory_write(bank, row, col, memory_data);
                end
            end
            if (wr_pipeline[1]) begin
                wdq_cntr = bl_pipeline[1];
            end
            if (wdq_cntr > 0) begin
                wdq_cntr = wdq_cntr - 1;
                dq_in_valid = 1'b1;
            end else begin
                dq_in_valid = 1'b0;
                dqs_in_valid <= 1'b0;
                for (i=0; i<31; i=i+1) begin
                    wdqs_pos_cntr[i]    <= 0;
                end
            end
            if (wr_pipeline[0]) begin
                b2b_write <= 1'b0;
            end
            if (wr_pipeline[2]) begin
                if (dqs_in_valid) begin
                    b2b_write <= 1'b1;
                end
                dqs_in_valid <= 1'b1;
                wr_burst_length = bl_pipeline[2];
            end
            // read dqs enable counter
            if (rd_pipeline[RDQSEN_PRE]) begin
                rdqsen_cntr = RDQSEN_PRE + bl_pipeline[RDQSEN_PRE] + RDQSEN_PST - 1;
            end
            if (rdqsen_cntr > 0) begin
                rdqsen_cntr = rdqsen_cntr - 1;
                dqs_out_en = 1'b1;
            end else begin
                dqs_out_en = 1'b0;
            end
            // read dqs counter
            if (rd_pipeline[RDQS_PRE]) begin
                rdqs_cntr = RDQS_PRE + bl_pipeline[RDQS_PRE] + RDQS_PST - 1;
            end
            // read dqs
            if (((rd_pipeline>>1 & {RDQS_PRE{1'b1}}) > 0) && (rdq_cntr == 0)) begin //read preamble
                dqs_out = 1'b0;
            end else if (rdqs_cntr > RDQS_PST) begin // read data
                dqs_out = rdqs_cntr - RDQS_PST;
            end else if (rdqs_cntr > 0) begin // read postamble
                dqs_out = 1'b0;
            end else begin
                dqs_out = 1'b1;
            end
            if (rdqs_cntr > 0) begin
                rdqs_cntr = rdqs_cntr - 1;
            end
            // read dq enable counter
            if (rd_pipeline[RDQEN_PRE]) begin
                rdqen_cntr = RDQEN_PRE + bl_pipeline[RDQEN_PRE] + RDQEN_PST;
            end
            if (rdqen_cntr > 0) begin
                rdqen_cntr = rdqen_cntr - 1;
                dq_out_en = 1'b1;
            end else begin
                dq_out_en = 1'b0;
            end
            // read dq
            if (rd_pipeline[0]) begin
                rdq_cntr = bl_pipeline[0];
            end
            if (rdq_cntr > 0) begin // read data
                if (mpr_en) begin
`ifdef MPR_DQ0 // DQ0 output MPR data, other DQ low
                    if (mpr_select == 2'b00) begin // Calibration Pattern
                        dq_temp = {DQS_BITS{{`DQ_PER_DQS-1{1'b0}}, calibration_pattern[burst_position]}};
                    end else if (odts_readout && (mpr_select == 2'b11)) begin // Temp Sensor (ODTS)
                        dq_temp = {DQS_BITS{{`DQ_PER_DQS-1{1'b0}}, temp_sensor[burst_position]}};
                    end else begin // Reserved
                        dq_temp = {DQS_BITS{{`DQ_PER_DQS-1{1'b0}}, 1'bx}};
                    end
`else // all DQ output MPR data
                    if (mpr_select == 2'b00) begin // Calibration Pattern
                        dq_temp = {DQS_BITS{{`DQ_PER_DQS{calibration_pattern[burst_position]}}}};
                    end else if (odts_readout && (mpr_select == 2'b11)) begin // Temp Sensor (ODTS)
                        dq_temp = {DQS_BITS{{`DQ_PER_DQS{temp_sensor[burst_position]}}}};
                    end else begin // Reserved
                        dq_temp = {DQS_BITS{{`DQ_PER_DQS{1'bx}}}};
                    end
`endif
                    if (DEBUG) $display ("%m: at time %t READ @ DQS MultiPurpose Register %d, col = %d,  data = %b", $time, mpr_select, burst_position, dq_temp[0]);
                end else begin
                    dq_temp = memory_data>>(burst_position*DQ_BITS);
                    if (DEBUG) $display ("%m: at time %t INFO: READ @ DQS= bank = %h row = %h col = %h data = %h",$time, bank, row, (-1*BL_MAX & col) + burst_position, dq_temp);
                end
                dq_out = dq_temp;
                rdq_cntr = rdq_cntr - 1;
            end else begin
                dq_out = {DQ_BITS{1'b1}};
            end
            // delay signals prior to output
            if (RANDOM_OUT_DELAY && (dqs_out_en || (|dqs_out_en_dly) || dq_out_en || (|dq_out_en_dly))) begin
                for (i=0; i<DQS_BITS; i=i+1) begin
                    // DQSCK requirements
                    // 1.) less than tDQSCK
                    // 2.) greater than -tDQSCK
                    // 3.) cannot change more than tQH + tDQSQ from previous DQS edge
                    dqsck_max = TDQSCK;
                    if (dqsck_max > dqsck[i] + TQH*tck_avg + TDQSQ) begin
                        dqsck_max = dqsck[i] + TQH*tck_avg + TDQSQ;
                    end
                    dqsck_min = -1*TDQSCK;
                    if (dqsck_min < dqsck[i] - TQH*tck_avg - TDQSQ) begin
                        dqsck_min = dqsck[i] - TQH*tck_avg - TDQSQ;
                    end
                    // DQSQ requirements
                    // 1.) less than tDQSQ
                    // 2.) greater than 0
                    // 3.) greater than tQH from the previous DQS edge
                    dqsq_min = 0;
                    if (dqsq_min < dqsck[i] - TQH*tck_avg) begin
                        dqsq_min = dqsck[i] - TQH*tck_avg;
                    end
                    if (dqsck_min == dqsck_max) begin
                        dqsck[i] = dqsck_min;
                    end else begin
                        dqsck[i] = $dist_uniform(seed, dqsck_min, dqsck_max);
                    end
                    dqsq_max = TDQSQ + dqsck[i];
                    dqs_out_en_dly[i] <= #(tck_avg/2) dqs_out_en;
                    dqs_out_dly[i]    <= #(tck_avg/2 + dqsck[i]) dqs_out;
                    if (!write_levelization) begin
                        for (j=0; j<`DQ_PER_DQS; j=j+1) begin
                            dq_out_en_dly[i*`DQ_PER_DQS + j] <= #(tck_avg/2) dq_out_en;
                            if (dqsq_min == dqsq_max) begin
                                dq_out_dly   [i*`DQ_PER_DQS + j] <= #(tck_avg/2 + dqsq_min) dq_out[i*`DQ_PER_DQS + j];
                            end else begin
                                dq_out_dly   [i*`DQ_PER_DQS + j] <= #(tck_avg/2 + $dist_uniform(seed, dqsq_min, dqsq_max)) dq_out[i*`DQ_PER_DQS + j];
                            end
                        end
                    end
                end
            end else begin
                out_delay = tck_avg/2;
                dqs_out_en_dly <= #(out_delay) {DQS_BITS{dqs_out_en}};
                dqs_out_dly    <= #(out_delay) {DQS_BITS{dqs_out   }};
                if (write_levelization !== 1'b1) begin
                    dq_out_en_dly  <= #(out_delay) {DQ_BITS {dq_out_en }};
                    dq_out_dly     <= #(out_delay) {DQ_BITS {dq_out    }};
                end
            end
        end
    endtask
    always @ (posedge rst_n_in) begin : reset
        integer i;
        if (rst_n_in) begin
            if ($time < 200000000 && check_strict_timing)
                $display ("%m at time %t WARNING: 200 us is required before RST_N goes inactive.", $time);
            if (cke_in !== 1'b0)
                $display ("%m: at time %t ERROR: CKE must be inactive when RST_N goes inactive.", $time);
            if ($time - tm_cke < 10000)
                $display ("%m: at time %t ERROR: CKE must be maintained inactive for 10 ns before RST_N goes inactive.", $time);
            // clear memory
`ifdef MAX_MEM
            // verification group does not erase memory
    //    for (banki = 0; banki < `BANKS; banki = banki + 1) begin
    //	          $fclose(memfd[banki]);
    //            memfd[banki] = open_bank_file(banki);
    //    end
`else
            memory_used <= 0; //erase memory
`endif
        end
    end
    always @(negedge rst_n_in or posedge diff_ck or negedge diff_ck) begin : main
        integer i;
        if (!rst_n_in) begin
            reset_task;
        end else begin
            if (!in_self_refresh && (diff_ck !== 1'b0) && (diff_ck !== 1'b1))
                $display ("%m: at time %t ERROR: CK and CK_N are not allowed to go to an unknown state.", $time);
            data_task;
            // Clock Frequency Change is legal:
            // 1.) During Self Refresh
            // 2.) During Precharge Power Down (DLL on or off)
            if (in_self_refresh || (in_power_down && (active_bank == 0))) begin
                if (diff_ck) begin
                    tjit_per_rtime = $time - tm_ck_pos - tck_avg;
                end else begin
                    tjit_per_rtime = $time - tm_ck_neg - tck_avg;
                end
                if (dll_locked && (abs_value(tjit_per_rtime) > TJIT_PER)) begin
                    if ((tm_ck_pos - tm_cke_cmd < TCKSRE) || (ck_cntr - ck_cke_cmd < TCKSRE_TCK))
                        $display ("%m: at time %t ERROR: tCKSRE violation during Self Refresh or Precharge Power Down Entry", $time);
                    if (odt_state) begin
                        $display ("%m: at time %t ERROR: Clock Frequency Change Failure.  ODT must be off prior to Clock Frequency Change.", $time);
                        if (STOP_ON_ERROR) $stop(0);
                    end else begin
                        if (DEBUG) $display ("%m: at time %t INFO: Clock Frequency Change detected.  DLL Reset is Required.", $time);
                        tm_freq_change <= $time;
                        ck_freq_change <= ck_cntr;
                        dll_locked = 0;
                    end
                end
            end
            if (diff_ck) begin
                // check setup of command signals
                if ($time > TIS) begin
                    if ($time - tm_cke < TIS)
                        $display ("%m: at time %t ERROR:   tIS violation on CKE by %t", $time, tm_cke + TIS - $time);
                    if (cke_in) begin
                        for (i=0; i<22; i=i+1) begin
                            if ($time - tm_cmd_addr[i] < TIS)
                                $display ("%m: at time %t ERROR:   tIS violation on %s by %t", $time, cmd_addr_string[i], tm_cmd_addr[i] + TIS - $time);
                        end
                    end
                end
                // update current state
                if (dll_locked) begin
                    if (mr_chk == 0) begin
                        mr_chk = 1;
                    end else if (init_mode_reg[0] && (mr_chk == 1)) begin
                        // check CL value against the clock frequency
                        if (cas_latency*tck_avg < CL_TIME && check_strict_timing)
                            $display ("%m: at time %t ERROR: CAS Latency = %d is illegal @tCK(avg) = %f", $time, cas_latency, tck_avg);
                        // check WR value against the clock frequency
                        if (ceil(write_recovery*tck_avg) < TWR)
                            $display ("%m: at time %t ERROR: Write Recovery = %d is illegal @tCK(avg) = %f", $time, write_recovery, tck_avg);
                        // check the CWL value against the clock frequency
					    if (check_strict_timing) begin
                            case (cas_write_latency)
                                5 : if (tck_avg < 2500.0)                          $display ("%m: at time %t ERROR: CWL = %d is illegal @tCK(avg) = %f", $time, cas_write_latency, tck_avg);
                                6 : if ((tck_avg < 1875.0) || (tck_avg >= 2500.0)) $display ("%m: at time %t ERROR: CWL = %d is illegal @tCK(avg) = %f", $time, cas_write_latency, tck_avg);
                                7 : if ((tck_avg < 1500.0) || (tck_avg >= 1875.0)) $display ("%m: at time %t ERROR: CWL = %d is illegal @tCK(avg) = %f", $time, cas_write_latency, tck_avg);
                                8 : if ((tck_avg < 1250.0) || (tck_avg >= 1500.0)) $display ("%m: at time %t ERROR: CWL = %d is illegal @tCK(avg) = %f", $time, cas_write_latency, tck_avg);
                                9 : if ((tck_avg < 15e3/14) || (tck_avg >= 1250.0)) $display ("%m: at time %t ERROR: CWL = %d is illegal @tCK(avg) = %f", $time, cas_write_latency, tck_avg);
                                10: if ((tck_avg < 937.5) || (tck_avg >= 15e3/14)) $display ("%m: at time %t ERROR: CWL = %d is illegal @tCK(avg) = %f", $time, cas_write_latency, tck_avg);
                                default :                                          $display ("%m: at time %t ERROR: CWL = %d is illegal @tCK(avg) = %f", $time, cas_write_latency, tck_avg);
                            endcase
                            // check the CL value against the clock frequency
                            if (!valid_cl(cas_latency, cas_write_latency))
                                $display ("%m: at time %t ERROR: CAS Latency = %d is not valid when CAS Write Latency = %d", $time, cas_latency, cas_write_latency);
                        end
                        mr_chk = 2;
                    end
                end else if (!in_self_refresh) begin
                    mr_chk = 0;
                    if (ck_cntr - ck_dll_reset == TDLLK) begin
                        dll_locked = 1;
                    end
                end
                if (|auto_precharge_bank) begin
                    for (i=0; i<`BANKS; i=i+1) begin
                        // Write with Auto Precharge Calculation
                        // 1.  Meet minimum tRAS requirement
                        // 2.  Write Latency PLUS BL/2 cycles PLUS WR after Write command
                        if (write_precharge_bank[i]) begin
                            if ($time - tm_bank_activate[i] >= TRAS_MIN) begin
                                if (ck_cntr - ck_bank_write[i] >= write_latency + burst_length/2 + write_recovery) begin
                                    if (DEBUG) $display ("%m: at time %t INFO: Auto Precharge bank %d", $time, i);
                                    write_precharge_bank[i] = 0;
                                    active_bank[i] = 0;
                                    auto_precharge_bank[i] = 0;
                                    tm_bank_precharge[i] = $time;
                                    tm_precharge = $time;
                                    ck_precharge = ck_cntr;
                                end
                            end
                        end
                        // Read with Auto Precharge Calculation
                        // 1.  Meet minimum tRAS requirement
                        // 2.  Additive Latency plus 4 cycles after Read command
                        // 3.  tRTP after the last 8-bit prefetch
                        if (read_precharge_bank[i]) begin
                            if (($time - tm_bank_activate[i] >= TRAS_MIN) && (ck_cntr - ck_bank_read[i] >= additive_latency + TRTP_TCK)) begin
                                read_precharge_bank[i] = 0;
                                // In case the internal precharge is pushed out by tRTP, tRP starts at the point where
                                // the internal precharge happens (not at the next rising clock edge after this event).
                                if ($time - tm_bank_read_end[i] < TRTP) begin
                                    if (DEBUG) $display ("%m: at time %t INFO: Auto Precharge bank %d", tm_bank_read_end[i] + TRTP, i);
                                    active_bank[i] <= #(tm_bank_read_end[i] + TRTP - $time) 0;
                                    auto_precharge_bank[i] <= #(tm_bank_read_end[i] + TRTP - $time) 0;
                                    tm_bank_precharge[i] <= #(tm_bank_read_end[i] + TRTP - $time) tm_bank_read_end[i] + TRTP;
                                    tm_precharge <= #(tm_bank_read_end[i] + TRTP - $time) tm_bank_read_end[i] + TRTP;
                                    ck_precharge = ck_cntr;
                                end else begin
                                    if (DEBUG) $display ("%m: at time %t INFO: Auto Precharge bank %d", $time, i);
                                    active_bank[i] = 0;
                                    auto_precharge_bank[i] = 0;
                                    tm_bank_precharge[i] = $time;
                                    tm_precharge = $time;
                                    ck_precharge = ck_cntr;
                                end
                            end
                        end
                    end
                end
                // respond to incoming command
                if (cke_in ^ prev_cke) begin
                    tm_cke_cmd <= $time;
                    ck_cke_cmd <= ck_cntr;
                end
                cmd_task(cke_in, cmd_n_in, ba_in, addr_in);
                if ((cmd_n_in == WRITE) || (cmd_n_in == READ)) begin
                    al_pipeline[2*additive_latency] = 1'b1;
                end
                if (al_pipeline[0]) begin
                    // check tRCD after additive latency
                    if ((rd_pipeline[2*cas_latency - 1]) && ($time - tm_bank_activate[ba_pipeline[2*cas_latency - 1]] < TRCD))
                        $display ("%m: at time %t ERROR:  tRCD violation during %s", $time, cmd_string[READ]);
                    if ((wr_pipeline[2*cas_write_latency + 1]) && ($time - tm_bank_activate[ba_pipeline[2*cas_write_latency + 1]] < TRCD))
                        $display ("%m: at time %t ERROR:  tRCD violation during %s", $time, cmd_string[WRITE]);
                    // check tWTR after additive latency
                    if (rd_pipeline[2*cas_latency - 1]) begin //{
                        if (truebl4) begin //{
                            i = ba_pipeline[2*cas_latency - 1];
                            if ($time - tm_group_write_end[i[1]] < TWTR)
                                $display ("%m: at time %t ERROR:  tWTR violation during %s", $time, cmd_string[READ]);
                            if ($time - tm_write_end < TWTR_DG)
                                $display ("%m: at time %t ERROR:  tWTR_DG violation during %s", $time, cmd_string[READ]);
                        end else begin
                            if ($time - tm_write_end < TWTR)
                                $display ("%m: at time %t ERROR:  tWTR violation during %s", $time, cmd_string[READ]);
                        end
                    end
                end
               if (rd_pipeline) begin
                  if (rd_pipeline[2*cas_latency - 1]) begin
                     tm_bank_read_end[ba_pipeline[2*cas_latency - 1]] <= $time;
                  end
	       end
                for (i=0; i<`BANKS; i=i+1) begin
		    if ((ck_cntr - ck_bank_write[i] > write_latency) && (ck_cntr - ck_bank_write[i] <= write_latency + burst_length/2)) begin
                        tm_bank_write_end[i] <= $time;
                        tm_group_write_end[i[1]] <= $time;
                        tm_write_end <= $time;
                    end
                end
                // clk pin is disabled during self refresh
                if (!in_self_refresh && tm_ck_pos ) begin
                    tjit_cc_time = $time - tm_ck_pos - tck_i;
                    tck_i   = $time - tm_ck_pos;
                    tck_avg = tck_avg - tck_sample[ck_cntr%TDLLK]/$itor(TDLLK);
                    tck_avg = tck_avg + tck_i/$itor(TDLLK);
                    tck_sample[ck_cntr%TDLLK] = tck_i;
                    tjit_per_rtime = tck_i - tck_avg;
                    if (dll_locked && check_strict_timing) begin
                        // check accumulated error
                        terr_nper_rtime = 0;
                        for (i=0; i<12; i=i+1) begin
                            terr_nper_rtime = terr_nper_rtime + tck_sample[i] - tck_avg;
                            terr_nper_rtime = abs_value(terr_nper_rtime);
                            case (i)
                                      0 :;
                                      1 : if (terr_nper_rtime - TERR_2PER >= 1.0) $display ("%m: at time %t ERROR: tERR(2per) violation by %f ps.", $time, terr_nper_rtime - TERR_2PER);
                                      2 : if (terr_nper_rtime - TERR_3PER >= 1.0) $display ("%m: at time %t ERROR: tERR(3per) violation by %f ps.", $time, terr_nper_rtime - TERR_3PER);
                                      3 : if (terr_nper_rtime - TERR_4PER >= 1.0) $display ("%m: at time %t ERROR: tERR(4per) violation by %f ps.", $time, terr_nper_rtime - TERR_4PER);
                                      4 : if (terr_nper_rtime - TERR_5PER >= 1.0) $display ("%m: at time %t ERROR: tERR(5per) violation by %f ps.", $time, terr_nper_rtime - TERR_5PER);
                                      5 : if (terr_nper_rtime - TERR_6PER >= 1.0) $display ("%m: at time %t ERROR: tERR(6per) violation by %f ps.", $time, terr_nper_rtime - TERR_6PER);
                                      6 : if (terr_nper_rtime - TERR_7PER >= 1.0) $display ("%m: at time %t ERROR: tERR(7per) violation by %f ps.", $time, terr_nper_rtime - TERR_7PER);
                                      7 : if (terr_nper_rtime - TERR_8PER >= 1.0) $display ("%m: at time %t ERROR: tERR(8per) violation by %f ps.", $time, terr_nper_rtime - TERR_8PER);
                                      8 : if (terr_nper_rtime - TERR_9PER >= 1.0) $display ("%m: at time %t ERROR: tERR(9per) violation by %f ps.", $time, terr_nper_rtime - TERR_9PER);
                                      9 : if (terr_nper_rtime - TERR_10PER >= 1.0) $display ("%m: at time %t ERROR: tERR(10per) violation by %f ps.", $time, terr_nper_rtime - TERR_10PER);
                                     10 : if (terr_nper_rtime - TERR_11PER >= 1.0) $display ("%m: at time %t ERROR: tERR(11per) violation by %f ps.", $time, terr_nper_rtime - TERR_11PER);
                                     11 : if (terr_nper_rtime - TERR_12PER >= 1.0) $display ("%m: at time %t ERROR: tERR(12per) violation by %f ps.", $time, terr_nper_rtime - TERR_12PER);
                            endcase
                        end
                        // check tCK min/max/jitter
                        if (abs_value(tjit_per_rtime) - TJIT_PER >= 1.0)
                            $display ("%m: at time %t ERROR: tJIT(per) violation by %f ps.", $time, abs_value(tjit_per_rtime) - TJIT_PER);
                        if (abs_value(tjit_cc_time) - TJIT_CC >= 1.0)
                            $display ("%m: at time %t ERROR: tJIT(cc) violation by %f ps.", $time, abs_value(tjit_cc_time) - TJIT_CC);
                        if (TCK_MIN - tck_avg >= 1.0)
                            $display ("%m: at time %t ERROR: tCK(avg) minimum violation by %f ps.", $time, TCK_MIN - tck_avg);
                        if (tck_avg - TCK_MAX >= 1.0)
                            $display ("%m: at time %t ERROR: tCK(avg) maximum violation by %f ps.", $time, tck_avg - TCK_MAX);
                        // check tCL
                        if (tm_ck_neg - $time < TCL_ABS_MIN*tck_avg)
                            $display ("%m: at time %t ERROR: tCL(abs) minimum violation on CLK by %t", $time, TCL_ABS_MIN*tck_avg - tm_ck_neg + $time);
                        if (tcl_avg < TCL_AVG_MIN*tck_avg)
                            $display ("%m: at time %t ERROR: tCL(avg) minimum violation on CLK by %t", $time, TCL_AVG_MIN*tck_avg - tcl_avg);
                        if (tcl_avg > TCL_AVG_MAX*tck_avg)
                            $display ("%m: at time %t ERROR: tCL(avg) maximum violation on CLK by %t", $time, tcl_avg - TCL_AVG_MAX*tck_avg);
                    end
                    // calculate the tch avg jitter
                    tch_avg = tch_avg - tch_sample[ck_cntr%TDLLK]/$itor(TDLLK);
                    tch_avg = tch_avg + tch_i/$itor(TDLLK);
                    tch_sample[ck_cntr%TDLLK] = tch_i;
                    tjit_ch_rtime = tch_i - tch_avg;
                    duty_cycle = tch_avg/tck_avg;
                    // update timers/counters
                    tcl_i <= $time - tm_ck_neg;
                end
                prev_odt <= odt_in;
                // update timers/counters
                ck_cntr <= ck_cntr + 1;
                tm_ck_pos = $time;
            end else begin
                // clk pin is disabled during self refresh
                if (!in_self_refresh) begin
                    if (dll_locked && check_strict_timing) begin
                        if ($time - tm_ck_pos < TCH_ABS_MIN*tck_avg)
                            $display ("%m: at time %t ERROR: tCH(abs) minimum violation on CLK by %t", $time, TCH_ABS_MIN*tck_avg - $time + tm_ck_pos);
                        if (tch_avg < TCH_AVG_MIN*tck_avg)
                            $display ("%m: at time %t ERROR: tCH(avg) minimum violation on CLK by %t", $time, TCH_AVG_MIN*tck_avg - tch_avg);
                        if (tch_avg > TCH_AVG_MAX*tck_avg)
                            $display ("%m: at time %t ERROR: tCH(avg) maximum violation on CLK by %t", $time, tch_avg - TCH_AVG_MAX*tck_avg);
                    end
                    // calculate the tcl avg jitter
                    tcl_avg = tcl_avg - tcl_sample[ck_cntr%TDLLK]/$itor(TDLLK);
                    tcl_avg = tcl_avg + tcl_i/$itor(TDLLK);
                    tcl_sample[ck_cntr%TDLLK] = tcl_i;
                    // update timers/counters
                    tch_i <= $time - tm_ck_pos;
                end
                tm_ck_neg = $time;
            end
            // on die termination
            if (odt_en || dyn_odt_en) begin
                // odt pin is disabled during self refresh
                if (!in_self_refresh && diff_ck) begin
                    if ($time - tm_odt < TIS)
                        $display ("%m: at time %t ERROR: tIS violation on ODT by %t", $time, tm_odt + TIS - $time);
                    if (prev_odt ^ odt_in) begin
                        if (!dll_locked)
                            $display ("%m: at time %t WARNING: tDLLK violation during ODT transition.", $time);
                        if (($time - tm_load_mode < TMOD) || (ck_cntr - ck_load_mode < TMOD_TCK))
                            $display ("%m: at time %t ERROR:  tMOD violation during ODT transition", $time);
                        if (ck_cntr - ck_zqinit < TZQINIT)
                            $display ("%m: at time %t ERROR: TZQinit violation during ODT transition", $time);
                        if (ck_cntr - ck_zqoper < TZQOPER)
                            $display ("%m: at time %t ERROR: TZQoper violation during ODT transition", $time);
                        if (ck_cntr - ck_zqcs < TZQCS)
                            $display ("%m: at time %t ERROR: tZQcs violation during ODT transition", $time);
                        // if (($time - tm_slow_exit_pd < TXPDLL) || (ck_cntr - ck_slow_exit_pd < TXPDLL_TCK))
                        //    $display ("%m: at time %t ERROR: tXPDLL violation during ODT transition", $time);
                        if (ck_cntr - ck_self_refresh < TXSDLL)
                            $display ("%m: at time %t ERROR: tXSDLL violation during ODT transition", $time);
                        if (in_self_refresh)
                            $display ("%m: at time %t ERROR:  Illegal ODT transition during Self Refresh.", $time);
                        if (!odt_in && (ck_cntr - ck_odt < ODTH4))
                            $display ("%m: at time %t ERROR:  ODTH4 violation during ODT transition", $time);
                        if (!odt_in && (ck_cntr - ck_odth8 < ODTH8))
                            $display ("%m: at time %t ERROR:  ODTH8 violation during ODT transition", $time);
                        if (($time - tm_slow_exit_pd < TXPDLL) || (ck_cntr - ck_slow_exit_pd < TXPDLL_TCK))
                            $display ("%m: at time %t WARNING: tXPDLL during ODT transition.  Synchronous or asynchronous change in termination resistance is possible.", $time);
                        // async ODT mode applies:
                        // 1.) during precharge power down with DLL off
                        // 2.) if tANPD has not been satisfied
                        // 3.) until tXPDLL has been satisfied
                        if ((in_power_down && low_power && (active_bank == 0)) || ($time - tm_slow_exit_pd < TXPDLL) || (ck_cntr - ck_slow_exit_pd < TXPDLL_TCK)) begin
                            odt_state = odt_in;
                            if (DEBUG && odt_en) $display ("%m: at time %t INFO: Async On Die Termination Rtt_NOM = %d Ohm", $time, {32{odt_state}} & get_rtt_nom(odt_rtt_nom));
                            if (odt_state) begin
                                odt_state_dly <= #(TAONPD) odt_state;
                            end else begin
                                odt_state_dly <= #(TAOFPD) odt_state;
                            end
                        // sync ODT mode applies:
                        // 1.) during normal operation
                        // 2.) during active power down
                        // 3.) during precharge power down with DLL on
                        end else begin
                            odt_pipeline[2*(write_latency - 2)] = 1'b1; // ODTLon, ODTLoff
                        end
                        ck_odt <= ck_cntr;
                    end
                end
                if (odt_pipeline[0]) begin
                    odt_state = ~odt_state;
                    if (DEBUG && odt_en) $display ("%m: at time %t INFO: Sync On Die Termination Rtt_NOM = %d Ohm", $time, {32{odt_state}} & get_rtt_nom(odt_rtt_nom));
                    if (odt_state) begin
                        odt_state_dly <= #(TAON) odt_state;
                    end else begin
                        odt_state_dly <= #(TAOF*tck_avg) odt_state;
                    end
                end
                if (rd_pipeline[RDQSEN_PRE]) begin
                    odt_cntr = 1 + RDQSEN_PRE + bl_pipeline[RDQSEN_PRE] + RDQSEN_PST - 1;
                end
                if (odt_cntr > 0) begin
                    if (odt_state) begin
                        $display ("%m: at time %t ERROR: On Die Termination must be OFF during Read data transfer.", $time);
                    end
                    odt_cntr = odt_cntr - 1;
                end
                if (dyn_odt_en && odt_state) begin
                    if (DEBUG && (dyn_odt_state ^ dyn_odt_pipeline[0]))
                        $display ("%m: at time %t INFO: Sync On Die Termination Rtt_WR = %d Ohm", $time, {32{dyn_odt_pipeline[0]}} & get_rtt_wr(odt_rtt_wr));
                    dyn_odt_state = dyn_odt_pipeline[0];
                end
                dyn_odt_state_dly <= #(TADC*tck_avg) dyn_odt_state;
            end
/*
            if (cke_in && write_levelization) begin
                for (i=0; i<DQS_BITS; i=i+1) begin
                    if ($time - tm_dqs_pos[i] < TWLH)
                        $display ("%m: at time %t WARNING: tWLH violation on DQS bit %d positive edge.   Indeterminate CK capture is possible.", $time, i);
                end
            end
*/
            // shift pipelines
            if (|wr_pipeline || |rd_pipeline || |al_pipeline) begin
                al_pipeline = al_pipeline>>1;
                wr_pipeline = wr_pipeline>>1;
                rd_pipeline = rd_pipeline>>1;
                for (i=0; i<`MAX_PIPE; i=i+1) begin
                    bl_pipeline[i] = bl_pipeline[i+1];
                    ba_pipeline[i] = ba_pipeline[i+1];
                    row_pipeline[i] = row_pipeline[i+1];
                    col_pipeline[i] = col_pipeline[i+1];
                end
            end
            if (|odt_pipeline || |dyn_odt_pipeline) begin
                odt_pipeline = odt_pipeline>>1;
                dyn_odt_pipeline = dyn_odt_pipeline>>1;
            end
        end
    end
    // receiver(s)
    task dqs_even_receiver;
        input [3:0] i;
        reg [63:0] bit_mask;
        begin
            bit_mask = {`DQ_PER_DQS{1'b1}}<<(i*`DQ_PER_DQS);
            if (dqs_even[i]) begin
                if (tdqs_en) begin // tdqs disables dm
                    dm_in_pos[i] = 1'b0;
                end else begin
                    dm_in_pos[i] = dm_in[i];
                end
                dq_in_pos = (dq_in & bit_mask) | (dq_in_pos & ~bit_mask);
            end
        end
    endtask
    always @(posedge dqs_even[ 0]) dqs_even_receiver( 0);
    always @(posedge dqs_even[ 1]) dqs_even_receiver( 1);
    always @(posedge dqs_even[ 2]) dqs_even_receiver( 2);
    always @(posedge dqs_even[ 3]) dqs_even_receiver( 3);
    always @(posedge dqs_even[ 4]) dqs_even_receiver( 4);
    always @(posedge dqs_even[ 5]) dqs_even_receiver( 5);
    always @(posedge dqs_even[ 6]) dqs_even_receiver( 6);
    always @(posedge dqs_even[ 7]) dqs_even_receiver( 7);
    always @(posedge dqs_even[ 8]) dqs_even_receiver( 8);
    always @(posedge dqs_even[ 9]) dqs_even_receiver( 9);
    always @(posedge dqs_even[10]) dqs_even_receiver(10);
    always @(posedge dqs_even[11]) dqs_even_receiver(11);
    always @(posedge dqs_even[12]) dqs_even_receiver(12);
    always @(posedge dqs_even[13]) dqs_even_receiver(13);
    always @(posedge dqs_even[14]) dqs_even_receiver(14);
    always @(posedge dqs_even[15]) dqs_even_receiver(15);
    task dqs_odd_receiver;
        input [3:0] i;
        reg [63:0] bit_mask;
        begin
            bit_mask = {`DQ_PER_DQS{1'b1}}<<(i*`DQ_PER_DQS);
            if (dqs_odd[i]) begin
                if (tdqs_en) begin // tdqs disables dm
                    dm_in_neg[i] = 1'b0;
                end else begin
                    dm_in_neg[i] = dm_in[i];
                end
                dq_in_neg = (dq_in & bit_mask) | (dq_in_neg & ~bit_mask);
            end
        end
    endtask
    always @(posedge dqs_odd[ 0]) dqs_odd_receiver( 0);
    always @(posedge dqs_odd[ 1]) dqs_odd_receiver( 1);
    always @(posedge dqs_odd[ 2]) dqs_odd_receiver( 2);
    always @(posedge dqs_odd[ 3]) dqs_odd_receiver( 3);
    always @(posedge dqs_odd[ 4]) dqs_odd_receiver( 4);
    always @(posedge dqs_odd[ 5]) dqs_odd_receiver( 5);
    always @(posedge dqs_odd[ 6]) dqs_odd_receiver( 6);
    always @(posedge dqs_odd[ 7]) dqs_odd_receiver( 7);
    always @(posedge dqs_odd[ 8]) dqs_odd_receiver( 8);
    always @(posedge dqs_odd[ 9]) dqs_odd_receiver( 9);
    always @(posedge dqs_odd[10]) dqs_odd_receiver(10);
    always @(posedge dqs_odd[11]) dqs_odd_receiver(11);
    always @(posedge dqs_odd[12]) dqs_odd_receiver(12);
    always @(posedge dqs_odd[13]) dqs_odd_receiver(13);
    always @(posedge dqs_odd[14]) dqs_odd_receiver(14);
    always @(posedge dqs_odd[15]) dqs_odd_receiver(15);
    // Processes to check hold and pulse width of control signals
    always @(posedge rst_n_in) begin
        if ($time > 100000) begin
            if (tm_rst_n + 100000 > $time)
                $display ("%m: at time %t ERROR: RST_N pulse width violation by %t", $time, tm_rst_n + 100000 - $time);
        end
        tm_rst_n = $time;
    end
    always @(cke_in) begin
        if (rst_n_in) begin
            if ($time > TIH) begin
                if ($time - tm_ck_pos < TIH)
                    $display ("%m: at time %t ERROR:  tIH violation on CKE by %t", $time, tm_ck_pos + TIH - $time);
            end
            if ($time - tm_cke < TIPW)
                $display ("%m: at time %t ERROR: tIPW violation on CKE by %t", $time, tm_cke + TIPW - $time);
        end
        tm_cke = $time;
    end
    always @(odt_in) begin
        if (rst_n_in && odt_en && !in_self_refresh) begin
            if ($time - tm_ck_pos < TIH)
                $display ("%m: at time %t ERROR:  tIH violation on ODT by %t", $time, tm_ck_pos + TIH - $time);
            if ($time - tm_odt < TIPW)
                $display ("%m: at time %t ERROR: tIPW violation on ODT by %t", $time, tm_odt + TIPW - $time);
        end
        tm_odt = $time;
    end
    task cmd_addr_timing_check;
    input i;
    reg [4:0] i;
    begin
        if (rst_n_in && prev_cke) begin
            if ($time - tm_ck_pos < TIH)
                $display ("%m: at time %t ERROR:  tIH violation on %s by %t", $time, cmd_addr_string[i], tm_ck_pos + TIH - $time);
            if ($time - tm_cmd_addr[i] < TIPW)
                $display ("%m: at time %t ERROR: tIPW violation on %s by %t", $time, cmd_addr_string[i], tm_cmd_addr[i] + TIPW - $time);
        end
        tm_cmd_addr[i] = $time;
    end
    endtask
    always @(cs_n_in    ) cmd_addr_timing_check( 0);
    always @(ras_n_in   ) cmd_addr_timing_check( 1);
    always @(cas_n_in   ) cmd_addr_timing_check( 2);
    always @(we_n_in    ) cmd_addr_timing_check( 3);
    always @(ba_in  [ 0]) cmd_addr_timing_check( 4);
    always @(ba_in  [ 1]) cmd_addr_timing_check( 5);
    always @(ba_in  [ 2]) cmd_addr_timing_check( 6);
    always @(addr_in[ 0]) cmd_addr_timing_check( 7);
    always @(addr_in[ 1]) cmd_addr_timing_check( 8);
    always @(addr_in[ 2]) cmd_addr_timing_check( 9);
    always @(addr_in[ 3]) cmd_addr_timing_check(10);
    always @(addr_in[ 4]) cmd_addr_timing_check(11);
    always @(addr_in[ 5]) cmd_addr_timing_check(12);
    always @(addr_in[ 6]) cmd_addr_timing_check(13);
    always @(addr_in[ 7]) cmd_addr_timing_check(14);
    always @(addr_in[ 8]) cmd_addr_timing_check(15);
    always @(addr_in[ 9]) cmd_addr_timing_check(16);
    always @(addr_in[10]) cmd_addr_timing_check(17);
    always @(addr_in[11]) cmd_addr_timing_check(18);
    always @(addr_in[12]) cmd_addr_timing_check(19);
    always @(addr_in[13]) cmd_addr_timing_check(20);
    always @(addr_in[14]) cmd_addr_timing_check(21);
    always @(addr_in[15]) cmd_addr_timing_check(22);
    // Processes to check setup and hold of data signals
    task dm_timing_check;
    input i;
    reg [3:0] i;
    begin
        if (dqs_in_valid) begin
            if ($time - tm_dqs[i] < TDH)
                $display ("%m: at time %t ERROR:   tDH violation on DM bit %d by %t", $time, i, tm_dqs[i] + TDH - $time);
            if (check_dm_tdipw[i]) begin
                if ($time - tm_dm[i] < TDIPW)
                    $display ("%m: at time %t ERROR: tDIPW violation on DM bit %d by %t", $time, i, tm_dm[i] + TDIPW - $time);
            end
        end
        check_dm_tdipw[i] <= 1'b0;
        tm_dm[i] = $time;
    end
    endtask
    always @(dm_in[ 0]) dm_timing_check( 0);
    always @(dm_in[ 1]) dm_timing_check( 1);
    always @(dm_in[ 2]) dm_timing_check( 2);
    always @(dm_in[ 3]) dm_timing_check( 3);
    always @(dm_in[ 4]) dm_timing_check( 4);
    always @(dm_in[ 5]) dm_timing_check( 5);
    always @(dm_in[ 6]) dm_timing_check( 6);
    always @(dm_in[ 7]) dm_timing_check( 7);
    always @(dm_in[ 8]) dm_timing_check( 8);
    always @(dm_in[ 9]) dm_timing_check( 9);
    always @(dm_in[10]) dm_timing_check(10);
    always @(dm_in[11]) dm_timing_check(11);
    always @(dm_in[12]) dm_timing_check(12);
    always @(dm_in[13]) dm_timing_check(13);
    always @(dm_in[14]) dm_timing_check(14);
    always @(dm_in[15]) dm_timing_check(15);
    task dq_timing_check;
    input i;
    reg [5:0] i;
    begin
        if (dqs_in_valid) begin
            if ($time - tm_dqs[i/`DQ_PER_DQS] < TDH)
                $display ("%m: at time %t ERROR:   tDH violation on DQ bit %d by %t", $time, i, tm_dqs[i/`DQ_PER_DQS] + TDH - $time);
            if (check_dq_tdipw[i]) begin
                if ($time - tm_dq[i] < TDIPW)
                    $display ("%m: at time %t ERROR: tDIPW violation on DQ bit %d by %t", $time, i, tm_dq[i] + TDIPW - $time);
            end
        end
        check_dq_tdipw[i] <= 1'b0;
        tm_dq[i] = $time;
    end
    endtask
    always @(dq_in[ 0]) dq_timing_check( 0);
    always @(dq_in[ 1]) dq_timing_check( 1);
    always @(dq_in[ 2]) dq_timing_check( 2);
    always @(dq_in[ 3]) dq_timing_check( 3);
    always @(dq_in[ 4]) dq_timing_check( 4);
    always @(dq_in[ 5]) dq_timing_check( 5);
    always @(dq_in[ 6]) dq_timing_check( 6);
    always @(dq_in[ 7]) dq_timing_check( 7);
    always @(dq_in[ 8]) dq_timing_check( 8);
    always @(dq_in[ 9]) dq_timing_check( 9);
    always @(dq_in[10]) dq_timing_check(10);
    always @(dq_in[11]) dq_timing_check(11);
    always @(dq_in[12]) dq_timing_check(12);
    always @(dq_in[13]) dq_timing_check(13);
    always @(dq_in[14]) dq_timing_check(14);
    always @(dq_in[15]) dq_timing_check(15);
    always @(dq_in[16]) dq_timing_check(16);
    always @(dq_in[17]) dq_timing_check(17);
    always @(dq_in[18]) dq_timing_check(18);
    always @(dq_in[19]) dq_timing_check(19);
    always @(dq_in[20]) dq_timing_check(20);
    always @(dq_in[21]) dq_timing_check(21);
    always @(dq_in[22]) dq_timing_check(22);
    always @(dq_in[23]) dq_timing_check(23);
    always @(dq_in[24]) dq_timing_check(24);
    always @(dq_in[25]) dq_timing_check(25);
    always @(dq_in[26]) dq_timing_check(26);
    always @(dq_in[27]) dq_timing_check(27);
    always @(dq_in[28]) dq_timing_check(28);
    always @(dq_in[29]) dq_timing_check(29);
    always @(dq_in[30]) dq_timing_check(30);
    always @(dq_in[31]) dq_timing_check(31);
    always @(dq_in[32]) dq_timing_check(32);
    always @(dq_in[33]) dq_timing_check(33);
    always @(dq_in[34]) dq_timing_check(34);
    always @(dq_in[35]) dq_timing_check(35);
    always @(dq_in[36]) dq_timing_check(36);
    always @(dq_in[37]) dq_timing_check(37);
    always @(dq_in[38]) dq_timing_check(38);
    always @(dq_in[39]) dq_timing_check(39);
    always @(dq_in[40]) dq_timing_check(40);
    always @(dq_in[41]) dq_timing_check(41);
    always @(dq_in[42]) dq_timing_check(42);
    always @(dq_in[43]) dq_timing_check(43);
    always @(dq_in[44]) dq_timing_check(44);
    always @(dq_in[45]) dq_timing_check(45);
    always @(dq_in[46]) dq_timing_check(46);
    always @(dq_in[47]) dq_timing_check(47);
    always @(dq_in[48]) dq_timing_check(48);
    always @(dq_in[49]) dq_timing_check(49);
    always @(dq_in[50]) dq_timing_check(50);
    always @(dq_in[51]) dq_timing_check(51);
    always @(dq_in[52]) dq_timing_check(52);
    always @(dq_in[53]) dq_timing_check(53);
    always @(dq_in[54]) dq_timing_check(54);
    always @(dq_in[55]) dq_timing_check(55);
    always @(dq_in[56]) dq_timing_check(56);
    always @(dq_in[57]) dq_timing_check(57);
    always @(dq_in[58]) dq_timing_check(58);
    always @(dq_in[59]) dq_timing_check(59);
    always @(dq_in[60]) dq_timing_check(60);
    always @(dq_in[61]) dq_timing_check(61);
    always @(dq_in[62]) dq_timing_check(62);
    always @(dq_in[63]) dq_timing_check(63);
    task dqs_pos_timing_check;
    input i;
    reg [4:0] i;
    reg [3:0] j;
    begin
        if (write_levelization && i<16) begin
            if (ck_cntr - ck_load_mode < TWLMRD)
                $display ("%m: at time %t ERROR: tWLMRD violation on DQS bit %d positive edge.", $time, i);
/*
            if (($time - tm_ck_pos < TWLS) || ($time - tm_ck_neg < TWLS))
                $display ("%m: at time %t WARNING: tWLS violation on DQS bit %d positive edge.  Indeterminate CK capture is possible.", $time, i);
*/
            if (DEBUG)
                $display ("%m: at time %t Write Leveling @ DQS ck = %b", $time, diff_ck);
            dq_out_en_dly[i*`DQ_PER_DQS] <= #(TWLO) 1'b1;
            dq_out_dly[i*`DQ_PER_DQS] <= #(TWLO) diff_ck;
            for (j=1; j<`DQ_PER_DQS; j=j+1) begin
                dq_out_en_dly[i*`DQ_PER_DQS+j] <= #(TWLO + TWLOE) 1'b1;
                dq_out_dly[i*`DQ_PER_DQS+j] <= #(TWLO + TWLOE) 1'b0;
            end
        end
        if (dqs_in_valid && ((wdqs_pos_cntr[i] < wr_burst_length/2) || b2b_write)) begin
            if (dqs_in[i] ^ prev_dqs_in[i]) begin
                if (dll_locked) begin
                    if (check_write_preamble[i]) begin
                        if ($time - tm_dqs_pos[i] < $rtoi(TWPRE*tck_avg))
                            $display ("%m: at time %t ERROR: tWPRE violation on &s bit %d", $time, dqs_string[i/16], i%16);
                    end else if (check_write_postamble[i]) begin
                        if ($time - tm_dqs_neg[i] < $rtoi(TWPST*tck_avg))
                            $display ("%m: at time %t ERROR: tWPST violation on %s bit %d", $time, dqs_string[i/16], i%16);
                    end else begin
                        if ($time - tm_dqs_neg[i] < $rtoi(TDQSL*tck_avg))
                            $display ("%m: at time %t ERROR: tDQSL violation on %s bit %d", $time, dqs_string[i/16], i%16);
                    end
                end
                if ($time - tm_dm[i%16] < TDS)
                    $display ("%m: at time %t ERROR: tDS violation on DM bit %d by %t", $time, i,  tm_dm[i%16] + TDS - $time);
                if (!dq_out_en) begin
                    for (j=0; j<`DQ_PER_DQS; j=j+1) begin
                        if ($time - tm_dq[(i%16)*`DQ_PER_DQS+j] < TDS)
                            $display ("%m: at time %t ERROR: tDS violation on DQ bit %d by %t", $time, i*`DQ_PER_DQS+j, tm_dq[(i%16)*`DQ_PER_DQS+j] + TDS - $time);
                        check_dq_tdipw[(i%16)*`DQ_PER_DQS+j] <= 1'b1;
                    end
                end
                if ((wdqs_pos_cntr[i] < wr_burst_length/2) && !b2b_write) begin
                    wdqs_pos_cntr[i] <= wdqs_pos_cntr[i] + 1;
                end else begin
                    wdqs_pos_cntr[i] <= 1;
                end
                check_dm_tdipw[i%16] <= 1'b1;
                check_write_preamble[i] <= 1'b0;
                check_write_postamble[i] <= 1'b0;
                check_write_dqs_low[i] <= 1'b0;
                tm_dqs[i%16] <= $time;
            end else begin
                $display ("%m: at time %t ERROR: Invalid latching edge on %s bit %d", $time, dqs_string[i/16], i%16);
            end
        end
        tm_dqss_pos[i] <= $time;
        tm_dqs_pos[i] = $time;
        prev_dqs_in[i] <= dqs_in[i];
    end
    endtask
    always @(posedge dqs_in[ 0]) dqs_pos_timing_check( 0);
    always @(posedge dqs_in[ 1]) dqs_pos_timing_check( 1);
    always @(posedge dqs_in[ 2]) dqs_pos_timing_check( 2);
    always @(posedge dqs_in[ 3]) dqs_pos_timing_check( 3);
    always @(posedge dqs_in[ 4]) dqs_pos_timing_check( 4);
    always @(posedge dqs_in[ 5]) dqs_pos_timing_check( 5);
    always @(posedge dqs_in[ 6]) dqs_pos_timing_check( 6);
    always @(posedge dqs_in[ 7]) dqs_pos_timing_check( 7);
    always @(posedge dqs_in[ 8]) dqs_pos_timing_check( 8);
    always @(posedge dqs_in[ 9]) dqs_pos_timing_check( 9);
    always @(posedge dqs_in[10]) dqs_pos_timing_check(10);
    always @(posedge dqs_in[11]) dqs_pos_timing_check(11);
    always @(posedge dqs_in[12]) dqs_pos_timing_check(12);
    always @(posedge dqs_in[13]) dqs_pos_timing_check(13);
    always @(posedge dqs_in[14]) dqs_pos_timing_check(14);
    always @(posedge dqs_in[15]) dqs_pos_timing_check(15);
    always @(negedge dqs_in[16]) dqs_pos_timing_check(16);
    always @(negedge dqs_in[17]) dqs_pos_timing_check(17);
    always @(negedge dqs_in[18]) dqs_pos_timing_check(18);
    always @(negedge dqs_in[19]) dqs_pos_timing_check(19);
    always @(negedge dqs_in[20]) dqs_pos_timing_check(20);
    always @(negedge dqs_in[21]) dqs_pos_timing_check(21);
    always @(negedge dqs_in[22]) dqs_pos_timing_check(22);
    always @(negedge dqs_in[23]) dqs_pos_timing_check(23);
    always @(negedge dqs_in[24]) dqs_pos_timing_check(24);
    always @(negedge dqs_in[25]) dqs_pos_timing_check(25);
    always @(negedge dqs_in[26]) dqs_pos_timing_check(26);
    always @(negedge dqs_in[27]) dqs_pos_timing_check(27);
    always @(negedge dqs_in[28]) dqs_pos_timing_check(28);
    always @(negedge dqs_in[29]) dqs_pos_timing_check(29);
    always @(negedge dqs_in[30]) dqs_pos_timing_check(30);
    always @(negedge dqs_in[31]) dqs_pos_timing_check(31);
    task dqs_neg_timing_check;
    input i;
    reg [4:0] i;
    reg [3:0] j;
    begin
        if (write_levelization && i<16) begin
            if (ck_cntr - ck_load_mode < TWLDQSEN)
                $display ("%m: at time %t ERROR: tWLDQSEN violation on DQS bit %d.", $time, i);
            if ($time - tm_dqs_pos[i] < $rtoi(TDQSH*tck_avg))
                $display ("%m: at time %t ERROR: tDQSH violation on DQS bit %d by %t", $time, i, tm_dqs_pos[i] + TDQSH*tck_avg - $time);
        end
        if (dqs_in_valid && (wdqs_pos_cntr[i] > 0) && check_write_dqs_high[i]) begin
            if (dqs_in[i] ^ prev_dqs_in[i]) begin
                if (dll_locked) begin
                    if ($time - tm_dqs_pos[i] < $rtoi(TDQSH*tck_avg))
                        $display ("%m: at time %t ERROR: tDQSH violation on %s bit %d", $time, dqs_string[i/16], i%16);
                    if ($time - tm_ck_pos < $rtoi(TDSH*tck_avg))
                        $display ("%m: at time %t ERROR: tDSH violation on %s bit %d", $time, dqs_string[i/16], i%16);
                end
                if ($time - tm_dm[i%16] < TDS)
                    $display ("%m: at time %t ERROR: tDS violation on DM bit %d by %t", $time, i,  tm_dm[i%16] + TDS - $time);
                if (!dq_out_en) begin
                    for (j=0; j<`DQ_PER_DQS; j=j+1) begin
                        if ($time - tm_dq[(i%16)*`DQ_PER_DQS+j] < TDS)
                            $display ("%m: at time %t ERROR: tDS violation on DQ bit %d by %t", $time, i*`DQ_PER_DQS+j, tm_dq[(i%16)*`DQ_PER_DQS+j] + TDS - $time);
                        check_dq_tdipw[(i%16)*`DQ_PER_DQS+j] <= 1'b1;
                    end
                end
                check_dm_tdipw[i%16] <= 1'b1;
                tm_dqs[i%16] <= $time;
            end else begin
                $display ("%m: at time %t ERROR: Invalid latching edge on %s bit %d", $time, dqs_string[i/16], i%16);
            end
        end
        check_write_dqs_high[i] <= 1'b0;
        tm_dqs_neg[i] = $time;
        prev_dqs_in[i] <= dqs_in[i];
    end
    endtask
    always @(negedge dqs_in[ 0]) dqs_neg_timing_check( 0);
    always @(negedge dqs_in[ 1]) dqs_neg_timing_check( 1);
    always @(negedge dqs_in[ 2]) dqs_neg_timing_check( 2);
    always @(negedge dqs_in[ 3]) dqs_neg_timing_check( 3);
    always @(negedge dqs_in[ 4]) dqs_neg_timing_check( 4);
    always @(negedge dqs_in[ 5]) dqs_neg_timing_check( 5);
    always @(negedge dqs_in[ 6]) dqs_neg_timing_check( 6);
    always @(negedge dqs_in[ 7]) dqs_neg_timing_check( 7);
    always @(negedge dqs_in[ 8]) dqs_neg_timing_check( 8);
    always @(negedge dqs_in[ 9]) dqs_neg_timing_check( 9);
    always @(negedge dqs_in[10]) dqs_neg_timing_check(10);
    always @(negedge dqs_in[11]) dqs_neg_timing_check(11);
    always @(negedge dqs_in[12]) dqs_neg_timing_check(12);
    always @(negedge dqs_in[13]) dqs_neg_timing_check(13);
    always @(negedge dqs_in[14]) dqs_neg_timing_check(14);
    always @(negedge dqs_in[15]) dqs_neg_timing_check(15);
    always @(posedge dqs_in[16]) dqs_neg_timing_check(16);
    always @(posedge dqs_in[17]) dqs_neg_timing_check(17);
    always @(posedge dqs_in[18]) dqs_neg_timing_check(18);
    always @(posedge dqs_in[19]) dqs_neg_timing_check(19);
    always @(posedge dqs_in[20]) dqs_neg_timing_check(20);
    always @(posedge dqs_in[21]) dqs_neg_timing_check(21);
    always @(posedge dqs_in[22]) dqs_neg_timing_check(22);
    always @(posedge dqs_in[23]) dqs_neg_timing_check(23);
    always @(posedge dqs_in[24]) dqs_neg_timing_check(24);
    always @(posedge dqs_in[25]) dqs_neg_timing_check(25);
    always @(posedge dqs_in[26]) dqs_neg_timing_check(26);
    always @(posedge dqs_in[27]) dqs_neg_timing_check(27);
    always @(posedge dqs_in[28]) dqs_neg_timing_check(28);
    always @(posedge dqs_in[29]) dqs_neg_timing_check(29);
    always @(posedge dqs_in[30]) dqs_neg_timing_check(30);
    always @(posedge dqs_in[31]) dqs_neg_timing_check(31);
endmodule