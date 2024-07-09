module sdram_controller (/*AUTOARG*/
                         // Outputs
                         o_data_valid, o_data_req, o_busy, o_init_done, o_ack,
                         o_sdram_addr, o_sdram_blkaddr, o_sdram_casn, o_sdram_cke,
                         o_sdram_csn, o_sdram_dqm, o_sdram_rasn, o_sdram_wen, o_sdram_clk,
                         o_write_done, o_read_done,
                         // Inouts
`ifdef DISABLE_CPU_IO_BUS
                         i_data,
                         o_data,
`else
                         io_data,
`endif
                         io_sdram_dq,
                         // Inputs
                         i_addr, i_adv, i_clk, i_rst, i_rwn,
                         i_selfrefresh_req, i_loadmod_req, i_burststop_req, i_disable_active, i_disable_precharge, i_precharge_req, i_power_down, i_disable_autorefresh
                         );
`include "sdram_defines.vh"
    /*AUTOINPUT*/
    // Beginning of automatic inputs (from unused autoinst inputs)
    input [26:0]                    i_addr; // To U0 of sdram_control_fsm.v
    input                           i_adv;             // To U0 of sdram_control_fsm.v
    input                           i_clk;              // To U0 of sdram_control_fsm.v
    input                           i_rst;              // To U0 of sdram_control_fsm.v
    input                           i_rwn;              // To U0 of sdram_control_fsm.v
    input                           i_selfrefresh_req;          // To U0 of sdram_control_fsm.v
    input                           i_loadmod_req;          // To U0 of sdram_control_fsm.v
    input                           i_burststop_req;          // To U0 of sdram_control_fsm.v
    input                           i_disable_active;
    input                           i_disable_precharge;
    input                           i_precharge_req;
    input                           i_power_down;
    input                           i_disable_autorefresh;
    /*AUTOOUTPUT*/
    // End of automatics
    output                          o_data_valid;       // From U0 of sdram_control_fsm.v
    output                          o_data_req;       // From U0 of sdram_control_fsm.v
    output                          o_busy;           // From U0 of sdram_control_fsm.v
    output                          o_init_done;            // From U0 of sdram_control_fsm.v
    output                          o_ack;          // From U0 of sdram_control_fsm.v
    output [12:0]                   o_sdram_addr; // From U0 of sdram_control_fsm.v
    output [1:0]                    o_sdram_blkaddr;// From U0 of sdram_control_fsm.v
    output                          o_sdram_casn;           // From U0 of sdram_control_fsm.v
    output                          o_sdram_cke;            // From U0 of sdram_control_fsm.v
    output                          o_sdram_csn;            // From U0 of sdram_control_fsm.v
    output [3:0]                    o_sdram_dqm;            // From U0 of sdram_control_fsm.v
    output                          o_sdram_rasn;           // From U0 of sdram_control_fsm.v
    output                          o_sdram_wen;            // From U0 of sdram_control_fsm.v
    output                          o_sdram_clk;            // From U0 of sdram_control_fsm.v
    output                          o_write_done;
    output                          o_read_done;
    /*AUTOINOUT*/
`ifdef DISABLE_CPU_IO_BUS
    input [31:0]                    i_data;            // To/From U0 of sdram_control_fsm.v
    output [31:0]                   o_data;            // To/From U0 of sdram_control_fsm.v
`else
    inout [31:0]                    io_data;            // To/From U0 of sdram_control_fsm.v
`endif
    inout [31:0]                    io_sdram_dq;            // To/From U0 of sdram_control_fsm.v
    wire                            delay_done150us_i;     // To U0 of sdram_control_fsm.v
    wire                            refresh_count_done_i;   // From U2 of autorefresh_counter.v
    wire                            autoref_ack_i, init_done_i, sdrctl_busyn_i;
    reg                             latch_ref_req_i;
    reg                             refresh_req_i;
    reg                             autorefresh_enable_i;
    wire                            cpu_den_i;
    wire [CPU_DATA_WIDTH-1:0]       cpu_datain_i;            // To/From U0 of sdram_control_fsm.v
    wire [CPU_DATA_WIDTH-1:0]       cpu_dataout_i;            // To/From U0 of sdram_control_fsm.v
`ifdef DISABLE_CPU_IO_BUS
    assign #WIREDLY o_data = cpu_dataout_i;
    assign #WIREDLY cpu_datain_i = i_data;
`else
    assign #WIREDLY io_data = (cpu_den_i) ? cpu_dataout_i : {`CPU_DBUS_LEN{1'bz}};
    assign #WIREDLY cpu_datain_i = io_data;
`endif
    reg                              power_down_reg1_i;
    reg                              power_down_reg2_i;
    reg                              power_down_reg3_i;
    always @(posedge i_clk or posedge i_rst)  begin
        if (i_rst) begin
            power_down_reg1_i <= 1'b0; end
        else begin
            power_down_reg1_i <= i_power_down; end
    end
    assign o_sdram_clk = i_clk ? ~(power_down_reg1_i) : 1'b0;
    assign o_init_done = init_done_i;
    assign sys_clk_i = i_clk;
    assign sys_rst_i = i_rst;
    assign o_busy = sdrctl_busyn_i;
    sdram_control_fsm U0 (/*AUTOINST*/
                          // Outputs
                          .o_ack            (o_ack),
                          .o_autoref_ack            (autoref_ack_i),
                          .o_busy       (sdrctl_busyn_i),
                          .o_init_done          (init_done_i),
                          .o_sdram_cke          (o_sdram_cke),
                          .o_sdram_csn          (o_sdram_csn),
                          .o_sdram_rasn         (o_sdram_rasn),
                          .o_sdram_casn         (o_sdram_casn),
                          .o_sdram_wen          (o_sdram_wen),
                          .o_sdram_blkaddr      (o_sdram_blkaddr[SDRAM_BLKADR_WIDTH-1:0]),
                          .o_sdram_addr         (o_sdram_addr[SDRAM_ADDR_WIDTH-1:0]),
                          .o_data_valid     (o_data_valid),
                          .o_data_req     (o_data_req),
                          .o_sdram_dqm          (o_sdram_dqm[SDRAM_DQM_WIDTH-1:0]),
                          .o_write_done         (o_write_done),
                          .o_read_done          (o_read_done),
                          // Inouts
                          .i_data          (i_data[CPU_DATA_WIDTH-1:0]),
                          .o_data          (cpu_dataout_i[CPU_DATA_WIDTH-1:0]),
                          .o_den           (cpu_den_i),
                          .io_sdram_dq          (io_sdram_dq[SDRAM_DATA_WIDTH-1:0]),
                          // Inputs
                          .i_clk            (i_clk),
                          .i_rst            (i_rst),
                          .i_rwn            (i_rwn),
                          .i_adv           (i_adv),
                          .i_delay_done_100us   (delay_done150us_i),
                          .i_refresh_req        (refresh_req_i),
                          .i_selfrefresh_req    (i_selfrefresh_req),
                          .i_loadmod_req        (i_loadmod_req),
                          .i_burststop_req      (i_burststop_req),
                          .i_disable_active     (i_disable_active),
                          .i_disable_precharge  (i_disable_precharge),
                          .i_precharge_req      (i_precharge_req),
                          .i_power_down         (i_power_down),
                          .i_addr           (i_addr[ROWADDR_MSB:COLADDR_LSB]));
    delay_gen150us U1 (/*AUTOINST*/
                       // Outputs
                       .o_lfsr_256_done (delay_done150us_i),
                       // Inputs
                       .i_sys_clk       (sys_clk_i),
                       .i_sys_rst       (sys_rst_i));
    autorefresh_counter U2(/*AUTOINST*/
                           // Outputs
                           .o_refresh_count_done(refresh_count_done_i),
                           // Inputs
                           .i_sys_clk           (sys_clk_i),
                           .i_sys_rst           (sys_rst_i),
                           .i_autorefresh_enable(autorefresh_enable_i));
    //Latch auto refresh request and clear it after ack
    always @(posedge i_clk or posedge i_rst)
        if (i_rst)
            latch_ref_req_i <= #WIREDLY 0;
        else if (latch_ref_req_i && autoref_ack_i)
            latch_ref_req_i <= #WIREDLY 0;
        else
            latch_ref_req_i <= #WIREDLY refresh_count_done_i;
    //Issue refresh request when SDRAM Controller initialization done and is not busy
    always @(posedge i_clk or posedge i_rst)
        if (i_rst)
            refresh_req_i <= #WIREDLY 0;
        else if (i_disable_autorefresh)
            refresh_req_i <= #WIREDLY 0;
        else if (init_done_i && ~sdrctl_busyn_i)
            refresh_req_i <= #WIREDLY latch_ref_req_i;
        else
            refresh_req_i <= #WIREDLY 0;
    //Enable auto refresh counter after initialization and not under self refresh state
    always @(posedge i_clk or posedge i_rst)
        if (i_rst)
            autorefresh_enable_i <= #WIREDLY 0;
        else if (init_done_i && ~i_selfrefresh_req)
            autorefresh_enable_i <= #WIREDLY 1;
        else
            autorefresh_enable_i <= #WIREDLY 0;
endmodule