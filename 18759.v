module.
aurora_64b66b_25p4G_CHANNEL_ERR_DETECT channel_err_detect_i
     (
         // Aurora Lane Interface
         .HARD_ERR(HARD_ERR),
         .LANE_UP(LANE_UP),
         // System Interface
         .USER_CLK(USER_CLK),
         .CHANNEL_HARD_ERR(CHANNEL_HARD_ERR)
     );
 endmodule