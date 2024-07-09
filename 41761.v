module tb_core_btb();
//input
reg              clk;
reg              rst;
reg     [31:0]   id_pc;
reg     [31:0]   if_pc;
reg     [31:0]   btb_target_in;
reg              update_btb_target;
reg              update_btb_tag;
reg     [1:0]    btb_type_in;
reg              PHT_pred_taken;
//output
 wire            btb_v;
 wire   [31:0]   btb_target_out;
 wire   [1:0]    btb_type_out;
 wire            en_btb_pred;
 core_btb   duv(//input
                  .clk(clk),
                  .rst(rst),
                  .if_pc(if_pc),
						      .id_pc(id_pc),
                  .update_btb_tag(update_btb_tag),
                  .update_btb_target(update_btb_target),
                  .btb_target_in(btb_target_in),
                  .btb_type_in(btb_type_in),
                  .PHT_pred_taken(PHT_pred_taken),
                  //output
                  .btb_type_out(btb_type_out),
                  .btb_target_out(btb_target_out),
                  .btb_v(btb_v),
                  .en_btb_pred(en_btb_pred) // only valid when both btb_v and PHT_pred_taken valid are both 1
                  );
	integer log_file;
	initial begin
	  clk=1'b0;
	  rst=1'b1;
	  if_pc=32'h40001110;
	  id_pc=32'h40001100;
     btb_target_in=32'h40002220;
     update_btb_target=1'b0;
     update_btb_tag=1'b0;
     btb_type_in=2'b00;
     PHT_pred_taken=1'b0;
	  log_file=$fopen("tb_core_btb.txt");
	  end
	  always #5 clk=~clk;
     `define clk_step #8;
	integer i=0;
   integer j=0;
	initial begin
	////////////////test begin///////////////////
	// case 0: all of the btb entries should be invalid, if system is just powered on, rst is set to 1
	rst=1'b1;
	#2;
	`clk_step
	rst=1'b0;
	/*
	repeat(128)
	  begin
	  $display("(%t)btb entry[%d] should be %b",  $time, i, duv.btb_entry_valid[i]);
	  $fdisplay(log_file,"(%t)btb entry[%d] should be %b", $time,  i, duv.btb_entry_valid[i]);
	  `clk_step
	  i=i+1;
	  end
	*/
	//case 1: except for rst==1, btb should only be updated by inst decode stage, either only  update btb_type or update btb_target, or both
	#2;
	`clk_step
	rst=1'b0;
	repeat(16)  begin
	   if_pc=i;
		 PHT_pred_taken=0;
		 $display("(%t) btb_v: %b; btb_type_out:%b, btb_target_out:%h",  $time, btb_v, btb_type_out, btb_target_out);
	   $fdisplay(log_file,"(%t)btb_v: %b; btb_type_out:%b, btb_target_out:%h ", $time, btb_v, btb_type_out, btb_target_out);
		 #2;
		 `clk_step
	    i=i+8;
		 end
//10 jal from OS,
        if_pc=32'h40001010;
			  id_pc=32'h4000100c;
			  update_btb_tag=0;
        update_btb_target=0;
        btb_type_in=`jal_type;
        btb_target_in=32'h40001010;
        #2;
			  $display("(%t) btb_v: %b; btb_type_out:%b, btb_target_out:%h",  $time, btb_v, btb_type_out, btb_target_out);
	      $fdisplay(log_file,"(%t)btb_v: %b; btb_type_out:%b, btb_target_out:%h ", $time, btb_v, btb_type_out, btb_target_out);
			  `clk_step
//we miss jal target ,decode stage updateing the target into btb
           if_pc=32'h40001014;
			     id_pc=32'h40101010;
			     update_btb_tag=1;
           update_btb_target=1;
           btb_type_in=`jal_type;
           btb_target_in=32'h40001240;
        #2;
			  $display("writing btb now");
			  $fdisplay(log_file,"writing btb now");
			  `clk_step
//4c jal from main ,
			     if_pc=32'h40001240;
			     id_pc=32'h40101014;
			     update_btb_tag=0;
           update_btb_target=0;
           btb_type_in=`jal_type;
           btb_target_in=32'h40001018;
			  #2;
			  $display("(%t) btb_v: %b; btb_type_out:%b, btb_target_out:%h",  $time, btb_v, btb_type_out, btb_target_out);
	      $fdisplay(log_file,"(%t)btb_v: %b; btb_type_out:%b, btb_target_out:%h ", $time, btb_v, btb_type_out, btb_target_out);
			  `clk_step
			    if_pc=32'h40001244;
			    id_pc=32'h40101240;
			  #2;
			  $display("(%t) btb_v: %b; btb_type_out:%b, btb_target_out:%h",  $time, btb_v, btb_type_out, btb_target_out);
	      $fdisplay(log_file,"(%t)btb_v: %b; btb_type_out:%b, btb_target_out:%h ", $time, btb_v, btb_type_out, btb_target_out);
			  `clk_step
			  if_pc=32'h40001248;
			  id_pc=32'h40101244;
			  #2;
			  $display("(%t) btb_v: %b; btb_type_out:%b, btb_target_out:%h",  $time, btb_v, btb_type_out, btb_target_out);
	      $fdisplay(log_file,"(%t)btb_v: %b; btb_type_out:%b, btb_target_out:%h ", $time, btb_v, btb_type_out, btb_target_out);
			  `clk_step
			  //this inst is jal from main
			  if_pc=32'h4000124c;
			  id_pc=32'h40101248;
			  #2;
			  $display("(%t) btb_v: %b; btb_type_out:%b, btb_target_out:%h",  $time, btb_v, btb_type_out, btb_target_out);
	      $fdisplay(log_file,"(%t)btb_v: %b; btb_type_out:%b, btb_target_out:%h ", $time, btb_v, btb_type_out, btb_target_out);
			  `clk_step
			  //we can find target from btb, so we have to go ahead
			  if_pc=32'h40001250;
			  id_pc=32'h4000124c;
			  //decode find it is a jal, so need to record it in the btb
			     update_btb_tag=1;
           update_btb_target=1;
           btb_type_in=`jal_type;
           btb_target_in=32'h40001290;
        #2;
        $display("writing btb now");
        $fdisplay(log_file,"writing btb now");
        $display("(%t) btb_v: %b; btb_type_out:%b, btb_target_out:%h",  $time, btb_v, btb_type_out, btb_target_out);
	      $fdisplay(log_file,"(%t)btb_v: %b; btb_type_out:%b, btb_target_out:%h ", $time, btb_v, btb_type_out, btb_target_out);
	      `clk_step
//90， 94, 98, 9c, a0,
           if_pc=32'h40001290;
			     id_pc=32'h40101250;
			     update_btb_tag=0;
           update_btb_target=0;
           btb_type_in=`jal_type;
           btb_target_in=32'h40001250;
			  #2;
			  $display("(%t) btb_v: %b; btb_type_out:%b, btb_target_out:%h",  $time, btb_v, btb_type_out, btb_target_out);
	      $fdisplay(log_file,"(%t)btb_v: %b; btb_type_out:%b, btb_target_out:%h ", $time, btb_v, btb_type_out, btb_target_out);
			  `clk_step
			  if_pc=32'h40001294;
			  id_pc=32'h40101290;
			 // `clk_step//98
			 // `clk_step//9c
			//  `clk_step
			  if_pc=32'h400012a0;
			  id_pc=32'h40101250;
			  #2;
			  `clk_step
//a4 beq(branch taken, write target and br_type to BTB),
        if_pc=32'h400012a4;
			  id_pc=32'h401012a0;
			  update_btb_tag=0;
        update_btb_target=0;
        btb_type_in=`br_type;
        btb_target_in=32'h400012a4;
			  #2;
			  $display("(%t) btb_v: %b; btb_type_out:%b, btb_target_out:%h",  $time, btb_v, btb_type_out, btb_target_out);
	      $fdisplay(log_file,"(%t)btb_v: %b; btb_type_out:%b, btb_target_out:%h ", $time, btb_v, btb_type_out, btb_target_out);
			  `clk_step
			  if_pc=32'h400012a8;
			  id_pc=32'h401012a4;
			  update_btb_tag=1;
        update_btb_target=1;
        btb_type_in=`br_type;
        btb_target_in=32'h400012b4;
        #2;
        $display("writing btb now");
        $fdisplay(log_file,"writing btb now");
			  $display("(%t) btb_v: %b; btb_type_out:%b, btb_target_out:%h",  $time, btb_v, btb_type_out, btb_target_out);
	      $fdisplay(log_file,"(%t)btb_v: %b; btb_type_out:%b, btb_target_out:%h ", $time, btb_v, btb_type_out, btb_target_out);
			  `clk_step
//b4,
        if_pc=32'h400012b4;
			  id_pc=32'h401012a8;
			  update_btb_tag=0;
        update_btb_target=0;
        btb_type_in=`jal_type;
        btb_target_in=32'h400012b4;
        #2;
			  $display("(%t) btb_v: %b; btb_type_out:%b, btb_target_out:%h",  $time, btb_v, btb_type_out, btb_target_out);
	      $fdisplay(log_file,"(%t)btb_v: %b; btb_type_out:%b, btb_target_out:%h ", $time, btb_v, btb_type_out, btb_target_out);
			  `clk_step
//b8 jal(branch taken, write jal_type and its target to BTB),
        if_pc=32'h400012b8;
			  id_pc=32'h401012b4;
			  update_btb_tag=0;
        update_btb_target=0;
        btb_type_in=`jal_type;
        btb_target_in=32'h400012b8;
			  #2;
			  $display("(%t) btb_v: %b; btb_type_out:%b, btb_target_out:%h",  $time, btb_v, btb_type_out, btb_target_out);
	      $fdisplay(log_file,"(%t)btb_v: %b; btb_type_out:%b, btb_target_out:%h ", $time, btb_v, btb_type_out, btb_target_out);
			  `clk_step
			  if_pc=32'h400012bc;
			  id_pc=32'h401012b8;
			  update_btb_tag=1;
        update_btb_target=1;
        btb_type_in=`br_type;
        btb_target_in=32'h40001290;
			  #2;
			   $display("writing btb now");
			   $fdisplay(log_file,"writing btb now");
			  $display("(%t) btb_v: %b; btb_type_out:%b, btb_target_out:%h",  $time, btb_v, btb_type_out, btb_target_out);
	      $fdisplay(log_file,"(%t)btb_v: %b; btb_type_out:%b, btb_target_out:%h ", $time, btb_v, btb_type_out, btb_target_out);
			  `clk_step
//90,94,98,9c,a0,
        if_pc=32'h40001290;
			  id_pc=32'h401012bc;
			  update_btb_tag=0;
        update_btb_target=0;
        btb_type_in=`jal_type;
        btb_target_in=32'h400012b4;
			  #2;
			  `clk_step
			//  `clk_step
			//  `clk_step
			//  `clk_step
			  if_pc=32'h400012a0;
			  #2;
			  `clk_step
//a4 beq(branch taken, predict target via BTB and get right target pc),
        if_pc=32'h400012a4;
			  id_pc=32'h401012a0;
			  update_btb_tag=0;
        update_btb_target=0;
        btb_type_in=`jal_type;
        btb_target_in=32'h400012a4;
			  #2;
			   $display("we should get target 32'h400012b4 from btb");
			   $fdisplay(log_file,"we should get target 32'h400012b4 from btb");
			  $display("(%t) btb_v: %b; btb_type_out:%b, btb_target_out:%h",  $time, btb_v, btb_type_out, btb_target_out);
	      $fdisplay(log_file,"(%t)btb_v: %b; btb_type_out:%b, btb_target_out:%h ", $time, btb_v, btb_type_out, btb_target_out);
			  `clk_step
//b4
			  if_pc=32'h400012b4;
			  id_pc=32'h401012a4;
			  update_btb_tag=0;
        update_btb_target=0;
        btb_type_in=`jal_type;
        btb_target_in=32'h400012b8;
			  #2;
			  $display("(%t) btb_v: %b; btb_type_out:%b, btb_target_out:%h",  $time, btb_v, btb_type_out, btb_target_out);
	      $fdisplay(log_file,"(%t)btb_v: %b; btb_type_out:%b, btb_target_out:%h ", $time, btb_v, btb_type_out, btb_target_out);
			  `clk_step
//b8 jal(branch taken, get target pc from BTB),
        if_pc=32'h400012b8;
			  id_pc=32'h401012b4;
			  update_btb_tag=0;
        update_btb_target=0;
        btb_type_in=`jal_type;
        btb_target_in=32'h400012b8;
        #2;
			   $display("we should get target 32'h40001290 from btb");
			    $fdisplay(log_file,"we should get target 32'h40001290 from btb");
			  $display("(%t) btb_v: %b; btb_type_out:%b, btb_target_out:%h",  $time, btb_v, btb_type_out, btb_target_out);
	      $fdisplay(log_file,"(%t)btb_v: %b; btb_type_out:%b, btb_target_out:%h ", $time, btb_v, btb_type_out, btb_target_out);
			  `clk_step
//90,94,98,9c,a0,
        if_pc=32'h40001290;
			  id_pc=32'h401012b8;
			  #2;
			  `clk_step
			  if_pc=32'h40001294;
			  id_pc=32'h40101290;
		//	  `clk_step
			  if_pc=32'h40001298;
			  id_pc=32'h40101294;
		//	  `clk_step
			  if_pc=32'h4000129c;
			  id_pc=32'h40101298;
	//		  `clk_step
			  if_pc=32'h400012a0;
			  id_pc=32'h4010129c;
			  #2;
			  `clk_step
//a4 beq(branch not taken, but may be predicted to take),
        if_pc=32'h400012a4;
			  id_pc=32'h401012a0;
			  #2;
			  $display("we should get target 32'h400012b4 from btb");
			   $fdisplay(log_file,"we should get target 32'h400012b4 from btb");
			  $display("(%t) btb_v: %b; btb_type_out:%b, btb_target_out:%h",  $time, btb_v, btb_type_out, btb_target_out);
	      $fdisplay(log_file,"(%t)btb_v: %b; btb_type_out:%b, btb_target_out:%h ", $time, btb_v, btb_type_out, btb_target_out);
			  `clk_step
//a8,ac,
        if_pc=32'h400012a8;
			  id_pc=32'h401012a4;
			  #2;
			  `clk_step
			  if_pc=32'h400012ac;
			  id_pc=32'h401012a8;
			  #2;
			  `clk_step
//b0 jr(jump taken, not recorded in BTB yet, so we need to update btb in decode stage),
//bc, c0, c4, c8,
//cc jr(jump taken, not recorded in BTB yet, so we need to update btb in decode stage),
//bc, c0, c4, c8,
//cc jr(jump taken, get no target pc from RAS).//return to main 44
//54 jr(jump to OS) 14
//10 jal from OS   (branch taken, get right target pc from btb and also push ret_pc to RAS),
        if_pc=32'h40001010;
			  id_pc=32'h4000100c;
			  update_btb_tag=0;
        update_btb_target=0;
        btb_type_in=`jal_type;
        btb_target_in=32'h40001010;
        #2;
			  $display("we should get target 32'h40001240 from btb");
			   $fdisplay(log_file,"we should get target 32'h40001240 from btb");
			  $display("(%t) btb_v: %b; btb_type_out:%b, btb_target_out:%h",  $time, btb_v, btb_type_out, btb_target_out);
	      $fdisplay(log_file,"(%t)btb_v: %b; btb_type_out:%b, btb_target_out:%h ", $time, btb_v, btb_type_out, btb_target_out);
			  `clk_step
//40 jal from main (branch taken, get right target pc from btb and also push ret_pc to RAS),
        if_pc=32'h40001240;
			  id_pc=32'h40101014;
			  update_btb_tag=0;
        update_btb_target=0;
        btb_type_in=`jal_type;
        btb_target_in=32'h40001018;
			  #2;
			  `clk_step
			  #2;
			  `clk_step
			  #2;
			  `clk_step
			  if_pc=32'h4000124c;
			  id_pc=32'h40101040;
			  #2;
			  $display("we should get target 32'h40001290 from btb");
			   $fdisplay(log_file,"we should get target 32'h40001290 from btb");
			  $display("(%t) btb_v: %b; btb_type_out:%b, btb_target_out:%h",  $time, btb_v, btb_type_out, btb_target_out);
	      $fdisplay(log_file,"(%t)btb_v: %b; btb_type_out:%b, btb_target_out:%h ", $time, btb_v, btb_type_out, btb_target_out);
			  `clk_step
//90， 94, 98, 9c, a0,
        if_pc=32'h40001290;
			  id_pc=32'h4010104c;
			  #2;
			  `clk_step
//a4 beq(branch taken, predict target via BTB and get right target pc),
        if_pc=32'h400012a4;
			  id_pc=32'h401012a0;
			  #2;
			  $display("we should get target 32'h400012b4 from btb");
			   $fdisplay(log_file,"we should get target 32'h400012b4 from btb");
			  $display("(%t) btb_v: %b; btb_type_out:%b, btb_target_out:%h",  $time, btb_v, btb_type_out, btb_target_out);
	      $fdisplay(log_file,"(%t)btb_v: %b; btb_type_out:%b, btb_target_out:%h ", $time, btb_v, btb_type_out, btb_target_out);
			  `clk_step
//b4,
        if_pc=32'h400012b4;
			  id_pc=32'h401012a4;
			  #2;
			  `clk_step
//b8 jal(branch taken, get right target pc from btb and also push ret_pc to RAS),
        if_pc=32'h400012b8;
			  id_pc=32'h401012b4;
			  update_btb_tag=0;
        update_btb_target=0;
        btb_type_in=`jal_type;
        btb_target_in=32'h400012b8;
        #2;
			  $display("we should get target 32'h40001290 from btb");
			   $fdisplay(log_file,"we should get target 32'h40001290 from btb");
			  $display("(%t) btb_v: %b; btb_type_out:%b, btb_target_out:%h",  $time, btb_v, btb_type_out, btb_target_out);
	      $fdisplay(log_file,"(%t)btb_v: %b; btb_type_out:%b, btb_target_out:%h ", $time, btb_v, btb_type_out, btb_target_out);
			  `clk_step
//90,94,98,9c,a0,
        if_pc=32'h40001290;
			  id_pc=32'h401012b8;
			  update_btb_tag=0;
        update_btb_target=0;
        btb_type_in=`jal_type;
        btb_target_in=32'h400012b4;
			  #2;
			  `clk_step
			  if_pc=32'h40001294;
			  id_pc=32'h40101290;
			  #2;
			  `clk_step
			  if_pc=32'h40001298;
			  id_pc=32'h40101294;
			  #2;
			  `clk_step
			  if_pc=32'h4000129c;
			  id_pc=32'h40101298;
			  #2;
			  `clk_step
			  if_pc=32'h400012a0;
			  id_pc=32'h4010129c;
			  #2;
			  `clk_step
//a4 beq(branch taken, predict target via BTB and get right target pc),
        if_pc=32'h400012a4;
			  id_pc=32'h401012a0;
			  update_btb_tag=0;
        update_btb_target=0;
        btb_type_in=`jal_type;
        btb_target_in=32'h400012a4;
        #2;
			  $display("we should get target 32'h400012b4 from btb");
			   $fdisplay(log_file,"we should get target 32'h400012b4 from btb");
			  $display("(%t) btb_v: %b; btb_type_out:%b, btb_target_out:%h",  $time, btb_v, btb_type_out, btb_target_out);
	      $fdisplay(log_file,"(%t)btb_v: %b; btb_type_out:%b, btb_target_out:%h ", $time, btb_v, btb_type_out, btb_target_out);
			  `clk_step
//b4,
        if_pc=32'h400012b4;
			  id_pc=32'h401012a4;
			  update_btb_tag=0;
        update_btb_target=0;
        btb_type_in=`jal_type;
        btb_target_in=32'h400012b8;
			  #2;
			  `clk_step
//b8 jal(branch taken, get target pc from BTB and also push ret_pc to RAS),
        if_pc=32'h400012b8;
			  id_pc=32'h401012b4;
			  update_btb_tag=0;
        update_btb_target=0;
        btb_type_in=`jal_type;
        btb_target_in=32'h400012b8;
        #2;
			  $display("we should get target 32'h40001290 from btb");
			   $fdisplay(log_file,"we should get target 32'h40001290 from btb");
			  $display("(%t) btb_v: %b; btb_type_out:%b, btb_target_out:%h",  $time, btb_v, btb_type_out, btb_target_out);
	      $fdisplay(log_file,"(%t)btb_v: %b; btb_type_out:%b, btb_target_out:%h ", $time, btb_v, btb_type_out, btb_target_out);
			  `clk_step
//90,94,98,9c,a0,
        if_pc=32'h40001290;
			  id_pc=32'h401012b8;
			  update_btb_tag=0;
        update_btb_target=0;
        btb_type_in=`jal_type;
        btb_target_in=32'h400012b4;
			  #2;
			  `clk_step
			  if_pc=32'h40001294;
			  id_pc=32'h40101290;
			  #2;
			  `clk_step
			  if_pc=32'h40001298;
			  id_pc=32'h40101294;
			  #2;
			  `clk_step
			  if_pc=32'h4000129c;
			  id_pc=32'h40101298;
			  #2;
			  `clk_step
			  if_pc=32'h400012a0;
			  id_pc=32'h4010129c;
			  #2;
			  `clk_step
//a4 beq(branch not taken, but may be predicted to take),
        if_pc=32'h400012a4;
			  id_pc=32'h401012a0;
			  #2;
			  $display("we should get target 32'h400012b4 from btb");
			   $fdisplay(log_file,"we should get target 32'h400012b4 from btb");
			  $display("(%t) btb_v: %b; btb_type_out:%b, btb_target_out:%h",  $time, btb_v, btb_type_out, btb_target_out);
	      $fdisplay(log_file,"(%t)btb_v: %b; btb_type_out:%b, btb_target_out:%h ", $time, btb_v, btb_type_out, btb_target_out);
			  `clk_step
//a8,ac,
//b0 jr(jump taken, recorded in BTB yet, so we can find it is ret, so get target from RAS),
//bc, c0, c4, c8,
//cc jr(jump taken, recorded in BTB yet, so we can find it is ret, so get target from RAS),
//bc, c0, c4, c8,
//cc jr(jump taken, recorded in BTB yet, so we can find it is ret, so get target from RAS).//return to main 44
//54 jr(jump to OS, recorded in BTB yet, so we can find it is ret, so get target from RAS) 14
	      $stop;
end
endmodule