module  mvd_can_mv_addr(
                mb_x_total_i                     ,
                mb_y_total_i                     ,
                mb_x_i                           ,
                mb_y_i                           ,
                pos_x_i                          ,
                pos_y_i                          ,
                pu_width_i                       ,
                pu_height_i                      ,
                a_addr_o                         ,
                b_addr_o
);
//        INPUT and OUTPUT DECLARATION
input    [(`PIC_X_WIDTH)-1:0] mb_x_total_i       ; // mb_x_total_i
input    [(`PIC_Y_WIDTH)-1:0] mb_y_total_i       ; // mb_y_total_i
input    [(`PIC_X_WIDTH)-1:0] mb_x_i             ; // mb_x_i
input    [(`PIC_Y_WIDTH)-1:0] mb_y_i             ; // mb_y_i
input        [ 6-1:0]         pos_x_i            ;
input        [ 6-1:0]         pos_y_i            ;
input        [ 7-1:0]         pu_width_i         ;
input        [ 7-1:0]         pu_height_i        ;
output       [ 8-1:0]         a_addr_o           ;
output       [ 9-1:0]         b_addr_o           ;
reg          [ 8-1:0]         a_addr_o           ;
reg          [ 9-1:0]         b_addr_o           ;
wire         [ 3-1:0]         a0_x_w             ; // a0 x address 0...7-15
wire         [ 4-1:0]         a0_y_w             ; // a0 y address
reg          [ 2-1:0]         a0_valid_r         ; // 00: not valid,01: left LCU,10: current LCU
reg          [ 1-1:0]         a0_isuseful_r      ; //  0: not useful, 1: useful
wire         [ 3-1:0]         a1_x_w             ; // a1 x address
wire         [ 3-1:0]         a1_y_w             ; // a1 y address
reg          [ 2-1:0]         a1_valid_r         ;
wire         [ 4-1:0]         b0_x_w             ;
wire         [ 3-1:0]         b0_y_w             ;
reg          [ 2-1:0]         b0_valid_r         ;
reg          [ 1-1:0]         b0_isuseful_r      ; //  0: not useful, 1: useful
wire         [ 4-1:0]         b1_x_w             ;
wire         [ 3-1:0]         b1_y_w             ;
reg          [ 2-1:0]         b1_valid_r         ;
// a0: not exist, exist but useless, exist and useful
// a1: not exist, and if exist it must be useful.
// b0: not exist, exist but useless, exist and useful
// b1: not exist, and if exist it must be useful.
// b2: not exist, and if exist it must be useful.
// exist and useful: read from current LCU or read from left/top LCU
assign a0_x_w =  (pos_x_i>>3)-3'd1               ;
assign a0_y_w =  ((pos_y_i+pu_height_i)>>3)      ;
always@* begin
    if(!(mb_x_i||pos_x_i))    // mb_x_i==0 && pos_x_i==0 not exist
        a0_valid_r = 2'b00;
    else if(!pos_x_i)        // pos_x_i==0
        a0_valid_r = {1'b0,!a0_y_w[3]};   // a0_y_w=4'b1000=8 not exist
    else
        a0_valid_r = {a0_isuseful_r,1'b0}; // exist but may not useful
end
assign a1_x_w =  (pos_x_i>>3)-2'd1               ;
assign a1_y_w =  ((pos_y_i+pu_height_i)>>3)-2'd1 ;
always @* begin
    if(!(mb_x_i||pos_x_i))  // mb_x_i==0 && pos_x_i==0
        a1_valid_r = 2'b00;
    else if(!pos_x_i)        // pos_x_i==0
        a1_valid_r = 2'b01;
    else
        a1_valid_r = 2'b10;
end
assign b0_x_w =  ((pos_x_i+pu_width_i )>>3)      ;
assign b0_y_w =  (pos_y_i>>3)-2'd1               ;
assign b0_addr_w = {b0_valid_r,b0_y_w,b0_x_w}    ;
always@* begin
    if(!(mb_y_i||pos_y_i))    // mb_y_i==0 && pos_y_i==0
        b0_valid_r = 2'b00;
    else if(!pos_y_i)        // pos_y_i==0
        b0_valid_r = {1'b0,!((mb_x_i==mb_x_total_i)&b0_x_w[3])};
    else
        b0_valid_r = {b0_isuseful_r,1'b0};
end
assign b1_x_w =  ((pos_x_i+pu_width_i )>>3)-2'd1 ;
assign b1_y_w =  (pos_y_i>>3)-2'd1               ;
assign b1_addr_w = {b1_valid_r,b1_y_w,b1_x_w}    ;
always @* begin
    if(!(mb_y_i||pos_y_i))  // mb_y_i==0 && pos_y_i==0
        b1_valid_r = 2'b00;
    else if(!pos_y_i)        // pos_y_i==0
        b1_valid_r = 2'b01;
    else
        b1_valid_r = 2'b10;
end
/*
wire         [ 4-1:0]         b2_x_w             ;
wire         [ 4-1:0]         b2_y_w             ;
reg          [ 2-1:0]         b2_valid_r         ;
assign b2_x_w =  (pos_x_i>>3)-2'd1               ;
assign b2_y_w =  (pos_y_i>>3)-2'd1               ;
always @* begin
    if(!(mb_x_i||pos_x_i))      // mb_x_i==0 && pos_x_i==0
        b2_valid_r = 2'b00;
    else if(!(mb_y_i||pos_y_i)) // mb_y_i==0 && pos_y_i==0
        b2_valid_r = 2'b00;
    else if(!pos_x_i)           // pos_x_i==0
        b2_valid_r = 2'b01;
    else
        b2_valid_r = 2'b10;
end
*/
always @*begin
    case({pos_y_i[5:3],pos_x_i[5:3]})
        {3'd0,3'd0}: begin  a0_isuseful_r = 1'b0             ; b0_isuseful_r = 1'b0          ; end // 64 ,32, 16, 8
        {3'd0,3'd1}: begin  a0_isuseful_r = 1'b0             ; b0_isuseful_r = 1'b0          ; end //             8
        {3'd0,3'd2}: begin  a0_isuseful_r = pu_height_i[3]   ; b0_isuseful_r = 1'b0          ; end //         16, 8
        {3'd0,3'd3}: begin  a0_isuseful_r = 1'b0             ; b0_isuseful_r = 1'b0          ; end //             8
        {3'd0,3'd4}: begin  a0_isuseful_r = !pu_height_i[6:5]; b0_isuseful_r = 1'b0          ; end //     32, 16, 8
        {3'd0,3'd5}: begin  a0_isuseful_r = 1'b0             ; b0_isuseful_r = 1'b0          ; end //             8
        {3'd0,3'd6}: begin  a0_isuseful_r = pu_height_i[3]   ; b0_isuseful_r = 1'b0          ; end //         16, 8
        {3'd0,3'd7}: begin  a0_isuseful_r = 1'b0             ; b0_isuseful_r = 1'b0          ; end //             8
        {3'd1,3'd0}: begin  a0_isuseful_r = 1'b0             ; b0_isuseful_r = pu_width_i[3] ; end //             8
        {3'd1,3'd1}: begin  a0_isuseful_r = 1'b0             ; b0_isuseful_r = 1'b0          ; end //             8
        {3'd1,3'd2}: begin  a0_isuseful_r = 1'b0             ; b0_isuseful_r = pu_width_i[3] ; end //             8
        {3'd1,3'd3}: begin  a0_isuseful_r = 1'b0             ; b0_isuseful_r = 1'b0          ; end //             8
        {3'd1,3'd4}: begin  a0_isuseful_r = 1'b1             ; b0_isuseful_r = pu_width_i[3] ; end //             8
        {3'd1,3'd5}: begin  a0_isuseful_r = 1'b0             ; b0_isuseful_r = 1'b0          ; end //             8
        {3'd1,3'd6}: begin  a0_isuseful_r = 1'b0             ; b0_isuseful_r = pu_width_i[3] ; end //             8
        {3'd1,3'd7}: begin  a0_isuseful_r = 1'b0             ; b0_isuseful_r = 1'b0          ; end //             8
        {3'd2,3'd0}: begin  a0_isuseful_r = 1'b0             ; b0_isuseful_r = !pu_width_i[5]; end //         16, 8
        {3'd2,3'd1}: begin  a0_isuseful_r = 1'b0             ; b0_isuseful_r = 1'b1          ; end //             8
        {3'd2,3'd2}: begin  a0_isuseful_r = pu_height_i[3]   ; b0_isuseful_r = pu_width_i[3] ; end //         16, 8
        {3'd2,3'd3}: begin  a0_isuseful_r = 1'b0             ; b0_isuseful_r = 1'b0          ; end //             8
        {3'd2,3'd4}: begin  a0_isuseful_r = pu_height_i[3]   ; b0_isuseful_r = !pu_width_i[5]; end //         16, 8
        {3'd2,3'd5}: begin  a0_isuseful_r = 1'b0             ; b0_isuseful_r = 1'b1          ; end //             8
        {3'd2,3'd6}: begin  a0_isuseful_r = pu_height_i[3]   ; b0_isuseful_r = pu_width_i[3] ; end //         16, 8
        {3'd2,3'd7}: begin  a0_isuseful_r = 1'b0             ; b0_isuseful_r = 1'b0          ; end //             8
        {3'd3,3'd0}: begin  a0_isuseful_r = 1'b0             ; b0_isuseful_r = pu_width_i[3] ; end //             8
        {3'd3,3'd1}: begin  a0_isuseful_r = 1'b0             ; b0_isuseful_r = 1'b0          ; end //             8
        {3'd3,3'd2}: begin  a0_isuseful_r = 1'b0             ; b0_isuseful_r = pu_width_i[3] ; end //             8
        {3'd3,3'd3}: begin  a0_isuseful_r = 1'b0             ; b0_isuseful_r = 1'b0          ; end //             8
        {3'd3,3'd4}: begin  a0_isuseful_r = 1'b0             ; b0_isuseful_r = pu_width_i[3] ; end //             8
        {3'd3,3'd5}: begin  a0_isuseful_r = 1'b0             ; b0_isuseful_r = 1'b0          ; end //             8
        {3'd3,3'd6}: begin  a0_isuseful_r = 1'b0             ; b0_isuseful_r = pu_width_i[3] ; end //             8
        {3'd3,3'd7}: begin  a0_isuseful_r = 1'b0             ; b0_isuseful_r = 1'b0          ; end //             8
        {3'd4,3'd0}: begin  a0_isuseful_r = 1'b0             ; b0_isuseful_r = !pu_width_i[6]; end //     32, 16, 8
        {3'd4,3'd1}: begin  a0_isuseful_r = 1'b0             ; b0_isuseful_r = 1'b1          ; end //             8
        {3'd4,3'd2}: begin  a0_isuseful_r = pu_height_i[3]   ; b0_isuseful_r = 1'b1          ; end //         16, 8
        {3'd4,3'd3}: begin  a0_isuseful_r = 1'b0             ; b0_isuseful_r = 1'b1          ; end //             8
        {3'd4,3'd4}: begin  a0_isuseful_r = !pu_height_i[5]  ; b0_isuseful_r = !pu_width_i[5]; end //     32, 16, 8
        {3'd4,3'd5}: begin  a0_isuseful_r = 1'b0             ; b0_isuseful_r = 1'b1          ; end //             8
        {3'd4,3'd6}: begin  a0_isuseful_r = pu_height_i[3]   ; b0_isuseful_r = pu_width_i[3] ; end //         16, 8
        {3'd4,3'd7}: begin  a0_isuseful_r = 1'b0             ; b0_isuseful_r = 1'b0          ; end //             8
        {3'd5,3'd0}: begin  a0_isuseful_r = 1'b0             ; b0_isuseful_r = pu_width_i[3] ; end //             8
        {3'd5,3'd1}: begin  a0_isuseful_r = 1'b0             ; b0_isuseful_r = 1'b0          ; end //             8
        {3'd5,3'd2}: begin  a0_isuseful_r = 1'b0             ; b0_isuseful_r = pu_width_i[3] ; end //             8
        {3'd5,3'd3}: begin  a0_isuseful_r = 1'b0             ; b0_isuseful_r = 1'b0          ; end //             8
        {3'd5,3'd4}: begin  a0_isuseful_r = 1'b1             ; b0_isuseful_r = pu_width_i[3] ; end //             8
        {3'd5,3'd5}: begin  a0_isuseful_r = 1'b0             ; b0_isuseful_r = 1'b0          ; end //             8
        {3'd5,3'd6}: begin  a0_isuseful_r = 1'b0             ; b0_isuseful_r = pu_width_i[3] ; end //             8
        {3'd5,3'd7}: begin  a0_isuseful_r = 1'b0             ; b0_isuseful_r = 1'b0          ; end //             8
        {3'd6,3'd0}: begin  a0_isuseful_r = 1'b0             ; b0_isuseful_r = !pu_width_i[5]; end //         16, 8
        {3'd6,3'd1}: begin  a0_isuseful_r = 1'b0             ; b0_isuseful_r = 1'b1          ; end //             8
        {3'd6,3'd2}: begin  a0_isuseful_r = pu_height_i[3]   ; b0_isuseful_r = pu_width_i[3] ; end //         16, 8
        {3'd6,3'd3}: begin  a0_isuseful_r = 1'b0             ; b0_isuseful_r = 1'b0          ; end //             8
        {3'd6,3'd4}: begin  a0_isuseful_r = pu_height_i[3]   ; b0_isuseful_r = !pu_width_i[5]; end //         16, 8
        {3'd6,3'd5}: begin  a0_isuseful_r = 1'b0             ; b0_isuseful_r = 1'b1          ; end //             8
        {3'd6,3'd6}: begin  a0_isuseful_r = pu_height_i[3]   ; b0_isuseful_r = pu_width_i[3] ; end //         16, 8
        {3'd6,3'd7}: begin  a0_isuseful_r = 1'b0             ; b0_isuseful_r = 1'b0          ; end //             8
        {3'd7,3'd0}: begin  a0_isuseful_r = 1'b0             ; b0_isuseful_r = pu_width_i[3] ; end //             8
        {3'd7,3'd1}: begin  a0_isuseful_r = 1'b0             ; b0_isuseful_r = 1'b0          ; end //             8
        {3'd7,3'd2}: begin  a0_isuseful_r = 1'b0             ; b0_isuseful_r = pu_width_i[3] ; end //             8
        {3'd7,3'd3}: begin  a0_isuseful_r = 1'b0             ; b0_isuseful_r = 1'b0          ; end //             8
        {3'd7,3'd4}: begin  a0_isuseful_r = 1'b0             ; b0_isuseful_r = pu_width_i[3] ; end //             8
        {3'd7,3'd5}: begin  a0_isuseful_r = 1'b0             ; b0_isuseful_r = 1'b0          ; end //             8
        {3'd7,3'd6}: begin  a0_isuseful_r = 1'b0             ; b0_isuseful_r = pu_width_i[3] ; end //             8
        {3'd7,3'd7}: begin  a0_isuseful_r = 1'b0             ; b0_isuseful_r = 1'b0          ; end //             8
    endcase
end
always @* begin
    if(a0_valid_r)
        a_addr_o = {a0_valid_r,a0_y_w[2:0],a0_x_w};
    else if(a1_valid_r)
        a_addr_o = {a1_valid_r,a1_y_w,a1_x_w};
    else
        a_addr_o = {2'b00,6'b00};
end
always @* begin
    if(b0_valid_r)
        b_addr_o = {b0_valid_r,b0_y_w,b0_x_w};
    else if(b1_valid_r)
        b_addr_o = {b1_valid_r,b1_y_w,b1_x_w};
    else
        b_addr_o = {2'b00,6'b00};
end
endmodule