module bsg_rr_f2f_middle #(parameter `BSG_INV_PARAM(width_p)
                           , parameter middle_meet_p=1
                           , parameter use_popcount_p=0
                           )
   (input    [middle_meet_p-1:0]            valid_head_i
    , input  [middle_meet_p-1:0]            ready_head_i
    , output [middle_meet_p-1:0]            go_channels_o
    , output [$clog2(middle_meet_p+1)-1:0]  go_cnt_o
    );
   wire [middle_meet_p-1:0] happy_channels  = valid_head_i & ready_head_i;
   wire [middle_meet_p-1:0] go_channels_int;
   bsg_scan #(.width_p(middle_meet_p)
              ,.and_p(1)
              ,.lo_to_hi_p(1)
              ) and_scan (.i(happy_channels), .o(go_channels_int));
   assign go_channels_o = go_channels_int;
   // speedfix: this hack helps the critical path but net impact is fairly
   // small (.04 ns in tsmc 250)
   // it implements a priority encoder based on
   // both the original pattern and the scan.
if (0)
//   if (middle_meet_p==4)
     begin
	wire hi11 = &happy_channels[3:2];
	wire lo01 = ~happy_channels[1] & happy_channels[0];
	wire hi01 = ~happy_channels[3] & happy_channels[2];
	assign go_cnt_o[2] = go_channels_int[3];
	assign go_cnt_o[1] = ~hi11 & go_channels_int[1];
	assign go_cnt_o[0] = lo01 | (go_channels_int[1] & hi01);
     end
   else
     begin
	if (use_popcount_p)
	  bsg_popcount          #(.width_p(middle_meet_p)) pop    (.i(go_channels_int), .o(go_cnt_o));
	else
	  bsg_thermometer_count #(.width_p(middle_meet_p)) thermo (.i(go_channels_int), .o(go_cnt_o));
     end
endmodule