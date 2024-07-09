module only contains water in
                                  .water_out_end_sign(water_out_end_sign),
                                  .clk(clk),
                                  .power(power),
                                  .max_water_level(weight),
                                  .start(start),
                                  .water_level(water_level_wash)
     );
     // count wash time
     timer #(WIDTH, CLK_CH, TIME_SCORE) TIMER_WASH (.clk_src(clk),
                       .switch_power(power),
                       .switch_en(start),
                       .sum_count({{29{1'b0}}, weight} * 3),
                       .count_start_flag(washing_start),
                       .count_end_flag(wash_end_sign_mode),
                       .count(washing_count)
     );
    //change state
    always @(posedge clk[0])
    begin
    if(wash_start & power & start) state = nextstate;
    else if(!(wash_start & power)) begin
        state = water_in_state;
    end
    end
    // control light
    always @(posedge clk[CLK_CH])
    if(wash_start & power)
    begin
        case(state)
            water_in_state: begin water_in_light = ~water_in_light; washing_light = 1'b1; end
            washing_state: begin water_in_light = 1'b0; washing_light = ~washing_light; end
            wash_end_state: begin washing_light = 1'b0; end
            default: begin water_in_light = 1'b0; washing_light = 1'b1; end
        endcase
    end
    else begin
        water_in_light = 1'b0; washing_light = 1'b1;
    end
    //control time and end sign
    always @(posedge clk[0])
    begin
    if(wash_start & power) begin
        case(state)
            water_in_state: begin wash_count = {{29{1'b0}},weight} * 4 - {{29{1'b0}},water_level}; wash_end_sign = 1'b0; end
            washing_state: begin wash_count = washing_count; end
            wash_end_state: begin wash_count = 0; wash_end_sign = 1'b1; end
        endcase
    end
    else begin
        wash_count = 0; wash_end_sign = 1'b0;
    end
    end
    //control submodules' start
    always @(state or power or wash_start or start)
    if(wash_start & power & start) begin
        case(state)
            water_in_state: begin water_in_start = 1'b1; washing_start = 1'b0; end
            washing_state: begin water_in_start = 1'b0; washing_start = 1'b1; end
            wash_end_state: begin  washing_start = 1'b0; water_in_start = 1'b0; end
        endcase
    end
    else if(!(wash_start & power)) begin
        water_in_start = 1'b0; washing_start = 1'b0;
    end
    // change nextstate when sign come
    always @(water_in_end_sign or wash_end_sign_mode or wash_start or power)
    if(power & wash_start) begin
        case(state)
            water_in_state: begin
                    if(water_in_end_sign)
                        nextstate = washing_state;
                    else nextstate = water_in_state;
                end
            washing_state: begin
                    if(wash_end_sign_mode)
                        nextstate = wash_end_state;
                    else nextstate = washing_state;
                end
            wash_end_state: begin
                    nextstate = wash_end_state;
                end
        endcase
    end else begin
        nextstate = water_in_state;
    end
endmodule