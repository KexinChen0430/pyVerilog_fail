module iambic(input clk, input dit, input dah, output key);
    // Definition of the control register.
    wire [7:0] iambic_control;
    wire modeb;
    wire skey;
    wire autospace;
    wire rst_n;
    assign modeb        = iambic_control[0];
    assign skey         = iambic_control[1];
    assign autospace    = iambic_control[2];
    assign rst_n        = iambic_control[7];
    cy_psoc3_control #(.cy_init_value(8'b10000001), .cy_force_order(`TRUE))
    IAMBIC_CONTROL(.control(iambic_control));
    reg [1:0] reps;
    wire start, nextDah;
    reg isDah, iamb;
    reg rst_q1, rst_local;
    /* ==================== Wire and Register Declarations ==================== */
    wire Zero_Detect;
    wire cntr8_d0_load;
    wire cntr8_d1_load;
    wire cntr8_f0_load;
    wire cntr8_f1_load;
    wire cntr8_route_si;
    wire cntr8_route_ci;
    wire [2:0] cntr8_select;
    /* ==================== Assignment of Combinatorial Variables ==================== */
    assign cntr8_d0_load = (1'b0);
    assign cntr8_d1_load = (1'b0);
    assign cntr8_f0_load = (1'b0);
    assign cntr8_f1_load = (1'b0);
    assign cntr8_route_si = (1'b0);
    assign cntr8_route_ci = (1'b0);
    // 0 - count down to zero, 1 - keep at zero.
    assign cntr8_select[0] = (Zero_Detect);
    // Reload the counter.
    assign cntr8_select[1] = (Zero_Detect && (start || (reps != 0)));
    // Reset the whole counter -> reset the keyer.
    assign cntr8_select[2] = (! rst_local);
    /*
     */
    always @(negedge rst_n or posedge clk)
    begin
        if (rst_n == 0)
            {rst_q1,rst_local} <= 2'b00;
        else
            {rst_q1,rst_local} <= {1'b1,rst_q1};
    end
    /*
     */
    assign start = (modeb && iamb) || dit || dah;
    /*
     */
    assign nextDah = iamb ? !isDah : dah;
    always @(posedge clk or negedge rst_local)
    begin
        if (rst_local == 0)
            begin
                /*
                 */
                reps <= 0;
                //isDah <= 0;
                iamb <= 0;
            end
        else if (reps == 0 && Zero_Detect)       /* If the counter is stopped at zero */
            begin
                if (!modeb && !dit && !dah)
                    begin
                        /*
                         */
                        iamb <= 0;
                    end
                else if (start)
                    begin
                        reps <= nextDah ? 3 : 1;  /* Dahs are three times as long as dits */
                        isDah <= nextDah;         /* Save whether this is a dit or a dah */
                        iamb <= 0;                /* Clear the iamb flag to get ready for another iamb */
                    end
            end
        else                                    /* Otherwise, the counter is running... */
            begin
                if (reps != 0 && Zero_Detect)     // and count == 0
                    begin
                        reps <= reps - 1;         /* ... and decrement the reps count that makes dahs longer than dits */
                    end
                if (isDah ? dit : dah)            /* Check for an iamb, including dot/dash insertion */
                    iamb <= 1;                    /* This is an iamb -- flag it for later */
            end
    end
    /*
     */
    assign key = skey ? dah : (reps != 0);
    /* ==================== cntr8 (Width: 8) Instantiation ==================== */
    parameter cntr8_dpconfig0 =
    {
        `CS_ALU_OP__DEC, `CS_SRCA_A0, `CS_SRCB_D0, `CS_SHFT_OP_PASS, `CS_A0_SRC__ALU, `CS_A1_SRC_NONE, `CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA, `CS_CMP_SEL_CFGA,  /*CFGRAM0: Decrement to Zero */
        `CS_ALU_OP__XOR, `CS_SRCA_A0, `CS_SRCB_A0, `CS_SHFT_OP_PASS, `CS_A0_SRC__ALU, `CS_A1_SRC_NONE, `CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA, `CS_CMP_SEL_CFGA,  /*CFGRAM1: Maintain Zero */
        `CS_ALU_OP_PASS, `CS_SRCA_A0, `CS_SRCB_D0, `CS_SHFT_OP_PASS, `CS_A0_SRC___D0, `CS_A1_SRC_NONE, `CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA, `CS_CMP_SEL_CFGA,  /*CFGRAM2: Reload Count */
        `CS_ALU_OP_PASS, `CS_SRCA_A0, `CS_SRCB_D0, `CS_SHFT_OP_PASS, `CS_A0_SRC___D0, `CS_A1_SRC_NONE, `CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA, `CS_CMP_SEL_CFGA,  /*CFGRAM3: Reload Count */
        `CS_ALU_OP__XOR, `CS_SRCA_A0, `CS_SRCB_A0, `CS_SHFT_OP_PASS, `CS_A0_SRC__ALU, `CS_A1_SRC_NONE, `CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA, `CS_CMP_SEL_CFGA,  /*CFGRAM4: Reset */
        `CS_ALU_OP__XOR, `CS_SRCA_A0, `CS_SRCB_A0, `CS_SHFT_OP_PASS, `CS_A0_SRC__ALU, `CS_A1_SRC_NONE, `CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA, `CS_CMP_SEL_CFGA,  /*CFGRAM5: Reset */
        `CS_ALU_OP__XOR, `CS_SRCA_A0, `CS_SRCB_A0, `CS_SHFT_OP_PASS, `CS_A0_SRC__ALU, `CS_A1_SRC_NONE, `CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA, `CS_CMP_SEL_CFGA,  /*CFGRAM6: Reset */
        `CS_ALU_OP__XOR, `CS_SRCA_A0, `CS_SRCB_A0, `CS_SHFT_OP_PASS, `CS_A0_SRC__ALU, `CS_A1_SRC_NONE, `CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA, `CS_CMP_SEL_CFGA,  /*CFGRAM7: Reset */
        8'hFF, 8'h00, /* CFG9 */
        8'hFF, 8'hFF, /* CFG11-10 */
        `SC_CMPB_A1_D1, `SC_CMPA_A0_D1, `SC_CI_B_ARITH, `SC_CI_A_ARITH, `SC_C1_MASK_DSBL, `SC_C0_MASK_DSBL, `SC_A_MASK_DSBL, `SC_DEF_SI_0, `SC_SI_B_DEFSI, `SC_SI_A_DEFSI, /* CFG13-12 */
        `SC_A0_SRC_ACC, `SC_SHIFT_SL, 1'b0, `SC_SR_SRC_REG, `SC_FIFO1_BUS, `SC_FIFO0_BUS, `SC_MSB_ENBL, `SC_MSB_BIT7, `SC_MSB_NOCHN, `SC_FB_NOCHN, `SC_CMP1_NOCHN, `SC_CMP0_NOCHN, /* CFG15-14 */
        3'b000, `SC_FIFO_SYNC__ADD, 2'b000, `SC_FIFO1_DYN_OF, `SC_FIFO0_DYN_OF, `SC_FIFO_CLK1_POS, `SC_FIFO_CLK0_POS, `SC_FIFO_CLK__DP, `SC_FIFO_CAP_AX, `SC_FIFO_LEVEL, `SC_FIFO__SYNC, `SC_EXTCRC_DSBL, `SC_WRK16CAT_DSBL /* CFG17-16 */
    };
    cy_psoc3_dp8 #(
        .cy_dpconfig_a( cntr8_dpconfig0 ),
        .d0_init_a( 8'b00111111 ),
        .d1_init_a( 8'b00000000 ),
        .a0_init_a( 8'b00000000 ),
        .a1_init_a( 8'b00000000 ))
        cntr8(
            .clk( clk ),
            .cs_addr( cntr8_select ),
            .route_si( cntr8_route_si ),
            .route_ci( cntr8_route_ci ),
            .f0_load( cntr8_f0_load ),
            .f1_load( cntr8_f1_load ),
            .d0_load( cntr8_d0_load ),
            .d1_load( cntr8_d1_load ),
            .ce0(  ),
            .cl0(  ),
            .z0( Zero_Detect ),
            .ff0(  ),
            .ce1(  ),
            .cl1(  ),
            .z1(  ),
            .ff1(  ),
            .ov_msb(  ),
            .co_msb(  ),
            .cmsb(  ),
            .so(  ),
            .f0_bus_stat(  ),
            .f0_blk_stat(  ),
            .f1_bus_stat(  ),
            .f1_blk_stat(  )
        );
endmodule