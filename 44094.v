module lm32_multiplier (
    clk_i,
    rst_i,
    stall_x,
    stall_m,
    operand_0,
    operand_1,
    result
    );
// Inputs
input clk_i;                            // Clock
input rst_i;                            // Reset
input stall_x;                          // Stall instruction in X stage
input stall_m;                          // Stall instruction in M stage
input [`LM32_WORD_RNG] operand_0;     	// Muliplicand
input [`LM32_WORD_RNG] operand_1;     	// Multiplier
// Outputs
output [`LM32_WORD_RNG] result;       	// Product of multiplication
reg    [`LM32_WORD_RNG] result;
// Internal nets and registers
reg [`LM32_WORD_RNG] muliplicand;
reg [`LM32_WORD_RNG] multiplier;
reg [`LM32_WORD_RNG] product;
// Sequential logic
always @(posedge clk_i `CFG_RESET_SENSITIVITY)
begin
    if (rst_i == `TRUE)
    begin
        muliplicand <= {`LM32_WORD_WIDTH{1'b0}};
        multiplier <= {`LM32_WORD_WIDTH{1'b0}};
        product <= {`LM32_WORD_WIDTH{1'b0}};
        result <= {`LM32_WORD_WIDTH{1'b0}};
    end
    else
    begin
        if (stall_x == `FALSE)
        begin
            muliplicand <= operand_0;
            multiplier <= operand_1;
        end
        if (stall_m == `FALSE)
            product <= muliplicand * multiplier;
        result <= product;
    end
end
endmodule