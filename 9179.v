module */
            if (init_i)
                next_state_s = WARMUP_e;
            else
                next_state_s = IDLE_e;
        WARMUP_e:
            /* Warm up the cipher */
            if (cntr_r == 1151)
                next_state_s = WAIT_PROC_e;
            else
                next_state_s = WARMUP_e;
        WAIT_PROC_e:
            if (proc_i)         /* Calculation for current settings is being started */
                next_state_s = PROC_e;
            else if (init_i)    /* Warmup phase, probably for new key o */
                next_state_s = WARMUP_e;
            else
                next_state_s = WAIT_PROC_e;
        PROC_e:
            /* Process all 32 input data bits */
            if (cntr_r == 31)
                next_state_s = WAIT_PROC_e;
            else
                next_state_s = PROC_e;
        default:
            next_state_s = cur_state_r;
    endcase
end
// State save and output logic of the FSM
always @(posedge clk_i or negedge n_rst_i) begin
    if (!n_rst_i) begin
        /* Reset registers driven here */
        cntr_r <= 0;
        cur_state_r <= IDLE_e;
        cphr_en_r <= 1'b0;
        dat_o <= 0;
        dat_r <= 0;
    end
    else begin
        /* State save logic */
        cur_state_r <= next_state_s;
        /* Output logic */
        case (cur_state_r)
            IDLE_e: begin
                if (next_state_s == WARMUP_e) begin
                    /* Enable cipher and initialize */
                    cphr_en_r <= 1'b1;
                end
            end
            WARMUP_e: begin
                if (next_state_s == WAIT_PROC_e) begin
                    cntr_r <= 0;
                    cphr_en_r <= 1'b0;
                end
                else begin
                    /* Increment the warm-up phase counter */
                    cntr_r <= cntr_r + 1;
                end
            end
            WAIT_PROC_e: begin
                /* Wait until data to encrypt/decrypt is being presented */
                if (next_state_s == PROC_e) begin
                    cphr_en_r <= 1'b1;
                    dat_r <= dat_i;
                end
                else if (next_state_s == WARMUP_e)
                    cphr_en_r <= 1'b1;
            end
            PROC_e: begin
                if (next_state_s == WAIT_PROC_e) begin
                    cphr_en_r <= 1'b0;
                    cntr_r <= 0;
                end
                else
                    cntr_r <= cntr_r + 1;
                /* Shift the input data register */
                dat_r <= {1'b0, dat_r[31:1]};
                /* Shift the output bits into the output register */
                dat_o <= {bit_out_s, dat_o[31:1]};
            end
        endcase
    end
end
endmodule