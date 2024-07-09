module.
    aur1_CHANNEL_ERROR_DETECT channel_error_detect_i
    (
        // Aurora Lane Interface
        .SOFT_ERROR(SOFT_ERROR),
        .HARD_ERROR(HARD_ERROR),
        .LANE_UP(LANE_UP),
        // System Interface
        .USER_CLK(USER_CLK),
        .POWER_DOWN(POWER_DOWN),
        .CHANNEL_SOFT_ERROR(CHANNEL_SOFT_ERROR),
        .CHANNEL_HARD_ERROR(CHANNEL_HARD_ERROR),
        // Channel Init State Machine Interface
        .RESET_CHANNEL(reset_channel_i)
    );
endmodule