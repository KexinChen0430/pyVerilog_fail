module start
        water_out_start = 1'b0;
        dewatering_start = 1'b0;
        dewater_count = {32{1'b0}};
        dewater_end_sign = 1'b0;
    end
    assign water_level = (state == water_out_state) ? water_level_dewater : 3'b000;
    // water_let mode run when start sign nd power are both true
    water_let_mode #(WIDTH, CLK_CH, TIME_SCORE) WATER_OUT_MODE (.water_out_end_sign(water_out_end_sign),
                                   .water_in_end_sign(water_in_end_sign),
                                   .water_out_start(water_out_start),
                                   .water_in_start(1'b0),
                                   .clk(clk),
                                   .power(power),
                                   .max_water_level(weight),
                                   .start(start),
                                   .water_level(water_level_dewater)
    );
    // count time
    timer #(WIDTH, CLK_CH, TIME_SCORE) TIMER_WASH (.clk_src(clk),
                      .switch_power(power),
                      .switch_en(start),
                      .sum_count({{29{1'b0}},weight}),
                      .count_start_flag(dewatering_start),
                      .count_end_flag(dewatering_end_sign),
                      .count(dewatering_count)
    );
    // change state
    always @(posedge clk[0])
    begin
    if(power & dewater_start & start) state <= nextstate;
    else if(!(power & dewater_start)) begin
        state <= water_out_state;
    end
    end
    // control light
    always @(posedge clk[CLK_CH])
    if(dewater_start & power)
    begin
        case(state)
            water_out_state: begin water_out_light = ~water_out_light; dewatering_light = 1'b1; end
            dewatering_state: begin water_out_light = 1'b0; dewatering_light = ~dewatering_light; end
            dewater_end_state: begin dewatering_light = 1'b0; end
        endcase
    end
    else begin
        water_out_light = 1'b0; dewatering_light = 1'b1;
    end
    // control time
    always @(posedge clk[0])
    begin
    if(dewater_start & power) begin
        case(state)
            water_out_state: begin dewater_count = {{29{1'b0}},weight} + {{29{1'b0}},water_level}; dewater_end_sign = 1'b0; end
            dewatering_state: dewater_count = dewatering_count;
            dewater_end_state: begin dewater_count = 0; dewater_end_sign = 1'b1; end
        endcase
    end else begin
        dewater_count = 0; dewater_end_sign = 1'b0;
    end
    end
    // control submodule start
    always @(state or power or dewater_start or start)
    if(dewater_start & power & start) begin
        case(state)
            water_out_state: begin water_out_start = 1'b1; dewatering_start = 1'b0; end
            dewatering_state: begin water_out_start = 1'b0; dewatering_start = 1'b1; end
            dewater_end_state: begin  dewatering_start = 1'b0; water_out_start = 1'b0; end
        endcase
    end
    else if(!(dewater_start & power)) begin
        water_out_start = 1'b0; dewatering_start = 1'b0;
    end
    // change nextstate
    always @(water_out_end_sign or dewatering_end_sign or dewater_start or power)
    if(power & dewater_start)
    begin
        case(state)
            water_out_state:begin
                    if(water_out_end_sign)
                        nextstate = dewatering_state;
                    else nextstate = water_out_state;
                end
            dewatering_state: begin
                    if(dewatering_end_sign)
                        nextstate = dewater_end_state;
                    else nextstate = dewatering_state;
                end
            dewater_end_state: begin
                    nextstate = dewater_end_state;
                end
        endcase
    end else begin
        nextstate = water_out_state;
    end
endmodule