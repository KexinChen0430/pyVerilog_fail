module body
	// generate sample counter
	reg  [5:0] sample_cnt;
	wire       dcnt     = &sample_cnt;
	always @(posedge clk or negedge rst)
	  if (~rst)
	     sample_cnt <= #1 6'h0;
	  else if (ena)
	    if(dstrb)
	      sample_cnt <= #1 6'h0;
	    else if(~dcnt)
	      sample_cnt <= #1 sample_cnt + 6'h1;
	// internal signals
	always @(posedge clk or negedge rst)
	  if (~rst)
	  begin
	      go     <= #1 1'b0;
		  dgo    <= #1 1'b0;
		  ddgo   <= #1 1'b0;
		  ddin   <= #1 0;
	      douten <= #1 1'b0;
	      ddcnt  <= #1 1'b1;
	      dddcnt <= #1 1'b1;
	  end
	  else if (ena)
	  begin
	      go     <= #1 dstrb;
	      dgo    <= #1 go;
	      ddgo   <= #1 dgo;
	      ddin   <= #1 din;
	      ddcnt  <= #1 dcnt;
	      dddcnt <= #1 ddcnt;
	      douten <= #1 ddcnt & ~dddcnt;
	  end
	// Hookup DCT units
	// V = 0
	dctub #(coef_width, di_width, 3'h0)
	dct_block_0 (
		.clk(clk),
		.ena(ena),
		.ddgo(ddgo),
		.x(sample_cnt[2:0]),
		.y(sample_cnt[5:3]),
		.ddin(ddin),
		.dout0(dout_00), // (U,V) = (0,0)
		.dout1(dout_01), // (U,V) = (0,1)
		.dout2(dout_02), // (U,V) = (0,2)
		.dout3(dout_03), // (U,V) = (0,3)
		.dout4(dout_04), // (U,V) = (0,4)
		.dout5(dout_05), // (U,V) = (0,5)
		.dout6(dout_06), // (U,V) = (0,6)
		.dout7(dout_07)  // (U,V) = (0,7)
	);
	// V = 1
	dctub #(coef_width, di_width, 3'h1)
	dct_block_1 (
		.clk(clk),
		.ena(ena),
		.ddgo(ddgo),
		.x(sample_cnt[2:0]),
		.y(sample_cnt[5:3]),
		.ddin(ddin),
		.dout0(dout_10), // (U,V) = (1,0)
		.dout1(dout_11), // (U,V) = (1,1)
		.dout2(dout_12), // (U,V) = (1,2)
		.dout3(dout_13), // (U,V) = (1,3)
		.dout4(dout_14), // (U,V) = (1,4)
		.dout5(dout_15), // (U,V) = (1,5)
		.dout6(dout_16), // (U,V) = (1,6)
		.dout7(dout_17)  // (U,V) = (1,7)
	);
	// V = 2
	dctub #(coef_width, di_width, 3'h2)
	dct_block_2 (
		.clk(clk),
		.ena(ena),
		.ddgo(ddgo),
		.x(sample_cnt[2:0]),
		.y(sample_cnt[5:3]),
		.ddin(ddin),
		.dout0(dout_20), // (U,V) = (2,0)
		.dout1(dout_21), // (U,V) = (2,1)
		.dout2(dout_22), // (U,V) = (2,2)
		.dout3(dout_23), // (U,V) = (2,3)
		.dout4(dout_24), // (U,V) = (2,4)
		.dout5(dout_25), // (U,V) = (2,5)
		.dout6(dout_26), // (U,V) = (2,6)
		.dout7(dout_27)  // (U,V) = (2,7)
	);
	// V = 3
	dctub #(coef_width, di_width, 3'h3)
	dct_block_3 (
		.clk(clk),
		.ena(ena),
		.ddgo(ddgo),
		.x(sample_cnt[2:0]),
		.y(sample_cnt[5:3]),
		.ddin(ddin),
		.dout0(dout_30), // (U,V) = (3,0)
		.dout1(dout_31), // (U,V) = (3,1)
		.dout2(dout_32), // (U,V) = (3,2)
		.dout3(dout_33), // (U,V) = (3,3)
		.dout4(dout_34), // (U,V) = (3,4)
		.dout5(dout_35), // (U,V) = (3,5)
		.dout6(dout_36), // (U,V) = (3,6)
		.dout7(dout_37)  // (U,V) = (3,7)
	);
	// V = 4
	dctub #(coef_width, di_width, 3'h4)
	dct_block_4 (
		.clk(clk),
		.ena(ena),
		.ddgo(ddgo),
		.x(sample_cnt[2:0]),
		.y(sample_cnt[5:3]),
		.ddin(ddin),
		.dout0(dout_40), // (U,V) = (4,0)
		.dout1(dout_41), // (U,V) = (4,1)
		.dout2(dout_42), // (U,V) = (4,2)
		.dout3(dout_43), // (U,V) = (4,3)
		.dout4(dout_44), // (U,V) = (4,4)
		.dout5(dout_45), // (U,V) = (4,5)
		.dout6(dout_46), // (U,V) = (4,6)
		.dout7(dout_47)  // (U,V) = (4,7)
	);
	// V = 5
	dctub #(coef_width, di_width, 3'h5)
	dct_block_5 (
		.clk(clk),
		.ena(ena),
		.ddgo(ddgo),
		.x(sample_cnt[2:0]),
		.y(sample_cnt[5:3]),
		.ddin(ddin),
		.dout0(dout_50), // (U,V) = (5,0)
		.dout1(dout_51), // (U,V) = (5,1)
		.dout2(dout_52), // (U,V) = (5,2)
		.dout3(dout_53), // (U,V) = (5,3)
		.dout4(dout_54), // (U,V) = (5,4)
		.dout5(dout_55), // (U,V) = (5,5)
		.dout6(dout_56), // (U,V) = (5,6)
		.dout7(dout_57)  // (U,V) = (5,7)
	);
	// V = 6
	dctub #(coef_width, di_width, 3'h6)
	dct_block_6 (
		.clk(clk),
		.ena(ena),
		.ddgo(ddgo),
		.x(sample_cnt[2:0]),
		.y(sample_cnt[5:3]),
		.ddin(ddin),
		.dout0(dout_60), // (U,V) = (6,0)
		.dout1(dout_61), // (U,V) = (6,1)
		.dout2(dout_62), // (U,V) = (6,2)
		.dout3(dout_63), // (U,V) = (6,3)
		.dout4(dout_64), // (U,V) = (6,4)
		.dout5(dout_65), // (U,V) = (6,5)
		.dout6(dout_66), // (U,V) = (6,6)
		.dout7(dout_67)  // (U,V) = (6,7)
	);
	// V = 7
	dctub #(coef_width, di_width, 3'h7)
	dct_block_7 (
		.clk(clk),
		.ena(ena),
		.ddgo(ddgo),
		.x(sample_cnt[2:0]),
		.y(sample_cnt[5:3]),
		.ddin(ddin),
		.dout0(dout_70), // (U,V) = (7,0)
		.dout1(dout_71), // (U,V) = (7,1)
		.dout2(dout_72), // (U,V) = (7,2)
		.dout3(dout_73), // (U,V) = (7,3)
		.dout4(dout_74), // (U,V) = (7,4)
		.dout5(dout_75), // (U,V) = (7,5)
		.dout6(dout_76), // (U,V) = (7,6)
		.dout7(dout_77)  // (U,V) = (7,7)
	);
endmodule