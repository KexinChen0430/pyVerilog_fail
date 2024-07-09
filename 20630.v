module
               .btb_v(btb_v),
               .btb_type(btb_type),
               //output
               .pc_out(pc_out),
               .v_pc_out(v_pc_out),
               .pc_plus4(pc_plus4)
               );
//initial inputs
  initial  begin
      clk=1'b0;
      rst=1'b1;
      btb_target=32'hffffffff;
		ras_target=32'h11111111;
		pc_go=1'b0;
		stall=1'b0;
		good_target=32'h88888888;
		id_pc_src=1'b0;
		btb_v=1'b0;
		btb_type=2'b11;
		end
		// para used in btb
parameter  br_type=2'b00;
parameter  j_type=2'b01;
parameter  jal_type=2'b10;
parameter  jr_type=2'b11;
	always #5 clk=~clk;
	integer log_file;
  `define clk_step #10;
  `define record_log  1
	initial begin
  log_file = $fopen("core_pc_tf.txt");
  `clk_step
  rst=1'b0;
  `clk_step
  rst=1'b1;
  `clk_step
  `ifdef record_log
  $display(  "(%t) we should get rst_pc. Got 0x%x. Expected 32'h00040000", $time, pc_out);
  $fdisplay(log_file, "(%t) we should get rst_pc. Got 0x%x. Expected 32'h00040000", $time, pc_out);
  `endif
  rst=1'b0;
  pc_go=1'b0;
  stall=1'b0;
  `clk_step
  `ifdef record_log
  $display(  "(%t) pc_out should not be changed. Got 0x%x. Expected 32'h00040000", $time, pc_out);
  $fdisplay(log_file, "(%t) pc_out should not be changed. Got 0x%x. Expected 32'h00040000", $time, pc_out);
  `endif
  rst=1'b0;
  pc_go=1'b0;
  stall=1'b1;
  `clk_step
  `ifdef record_log
  $display(  "(%t) pc_out should not be changed. Got 0x%x. Expected 32'h00040000", $time, pc_out);
  $fdisplay(log_file, "(%t) pc_out should not be changed. Got 0x%x. Expected 32'h00040000", $time, pc_out);
  `endif
  rst=1'b0;
  pc_go=1'b1;
  stall=1'b1;
  `clk_step
  `ifdef record_log
  $display(  "(%t) pc_out should not be changed. Got 0x%x. Expected 32'h00040000", $time, pc_out);
  $fdisplay(log_file, "(%t) pc_out should not be changed. Got 0x%x. Expected 32'h00040000", $time, pc_out);
  `endif
//          case 2-1-0: if id_pc_src==1,then pc is set to good_target;
  rst=1'b0;
  pc_go=1'b1;
  stall=1'b0;
  id_pc_src=1'b1;
  good_target=32'h20168010;
  `clk_step
  `ifdef record_log
  $display(  "(%t) pc_out should  be changed . Got 0x%x. Expected 32'h20168010", $time, pc_out);
  $fdisplay(log_file, "(%t) pc_out should  be changed. Got 0x%x. Expected 32'h20168010", $time, pc_out);
  `endif
//          case 2-1-1: if btb_v==0&&id_pc_src==0, then pc is set to pc_plus4;
  rst=1'b0;
  pc_go=1'b1;
  stall=1'b0;
  id_pc_src=1'b0;
  good_target=32'h20168010;
  btb_v=1'b0;
  `clk_step
  `ifdef record_log
  $display(  "(%t) pc_out should  be changed . Got 0x%x. Expected 32'h20168014", $time, pc_out);
  $fdisplay(log_file, "(%t) pc_out should  be changed. Got 0x%x. Expected 32'h20168014", $time, pc_out);
  `endif
//          case 2-1-2: if btb_v==1&&id_pc_src==0&&btb_type==jr_type, then pc is set to RAS_target;
  rst=1'b0;
  pc_go=1'b1;
  stall=1'b0;
  id_pc_src=1'b0;
  good_target=32'h20168010;
  ras_target=32'h24241010;
  btb_v=1'b1;
  btb_type=`jr_type;
  `clk_step
  `ifdef record_log
  $display(  "(%t) pc_out should  be changed . Got 0x%x. Expected 32'h24241010", $time, pc_out);
  $fdisplay(log_file, "(%t) pc_out should  be changed. Got 0x%x. Expected 32'h24241010", $time, pc_out);
  `endif
//          case 2-1-3: if btb_v==1&&id_pc_src==0&&(btb_type==br_type||
//                                                    btb_type==j_type||
//                                                    btb_type==jal_type),then pc is set to btb_target.
  rst=1'b0;
  pc_go=1'b1;
  stall=1'b0;
  id_pc_src=1'b0;
  good_target=32'h20168010;
  ras_target=32'h24241010;
  btb_target=32'h22228888;
  btb_v=1'b1;
  btb_type=`j_type;
  `clk_step
  `ifdef record_log
  $display(  "(%t) pc_out should  be changed . Got 0x%x. Expected 32'h22228888", $time, pc_out);
  $fdisplay(log_file, "(%t) pc_out should  be changed. Got 0x%x. Expected 32'h22228888", $time, pc_out);
  `endif
  rst=1'b0;
  pc_go=1'b1;
  stall=1'b0;
  id_pc_src=1'b0;
  good_target=32'h20168010;
  ras_target=32'h24241010;
  btb_target=32'h22448888;
  btb_v=1'b1;
  btb_type=`jal_type;
  `clk_step
  `ifdef record_log
  $display(  "(%t) pc_out should  be changed . Got 0x%x. Expected 32'h22448888", $time, pc_out);
  $fdisplay(log_file, "(%t) pc_out should  be changed. Got 0x%x. Expected 32'h22448888", $time, pc_out);
  `endif
  rst=1'b0;
  pc_go=1'b1;
  stall=1'b0;
  id_pc_src=1'b0;
  good_target=32'h20168010;
  ras_target=32'h24241010;
  btb_target=32'h22446688;
  btb_v=1'b1;
  btb_type=`br_type;
  `clk_step
  `ifdef record_log
  $display(  "(%t) pc_out should  be changed . Got 0x%x. Expected 32'h22446688", $time, pc_out);
  $fdisplay(log_file, "(%t) pc_out should  be changed. Got 0x%x. Expected 32'h22446688", $time, pc_out);
  `endif
  $stop;
end
endmodule