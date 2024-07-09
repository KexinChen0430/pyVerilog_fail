module bb_proc_tb;
reg clk_200K;
reg pie_code;
reg clk_dpie;
reg rst;
wire bs_data;
wire package_complete;
wire crc_check_pass;
reg [59:0]data_i;
reg [59:0]data_j;
integer i;
integer j;
parameter half_of_tari = 3.125;		// Tari = 6.25 us in this Tag design
parameter gclk_T = 5;			// frequency of global clock signal generated by multivibrator = 200 KHz
bb_proc uut
(
.bs_data(bs_data),
.package_complete(package_complete),
.crc_check_pass(crc_check_pass),
.clk_200K(clk_200K),
.pie_code(pie_code),
.clk_dpie(clk_dpie),
.rst(rst)
);
initial begin
	$sdf_annotate(`SDF_FILE);
end
initial begin
	clk_200K = 1'b0;
	#(100 + 12.5 + 6.25 + half_of_tari);
	clk_200K = 1'b1;
	while(1) #(gclk_T / 2.0) clk_200K = ~clk_200K;
end
initial begin
	pie_code = 1'b1;
	#100;
	frame_sync_pie;
	// Select command
	// 1010_100_100_01_00011011_00001011_01110001110_1_1011101100000001
	data_i = 56'b1010_100_100_01_00011011_00001011_01110001110_1_1011101100000001;
	for(i=56; i!=0; i=i-1) begin
		if(data_i[i-1]) pie_1;
		else pie_0;
	end
	#100;
	frame_sync_pie;
	// Query command
	// 1000_0_01_1_10_01_0_0011_01000
	data_i = 22'b1000_0_01_1_10_01_0_0011_01000;
	for(i=22; i!=0; i=i-1) begin
		if(data_i[i-1]) pie_1;
		else pie_0;
	end
	#100;
	frame_sync_pie;
	// QueryAdjust command
	// 1001_01_011
	data_i = 9'b1001_01_011;
	for(i=9; i!=0; i=i-1) begin
		if(data_i[i-1]) pie_1;
		else pie_0;
	end
	#100;
	frame_sync_pie;
	// QueryRep command
	// 00_01
	data_i = 4'b00_01;
	for(i=4; i!=0; i=i-1) begin
		if(data_i[i-1]) pie_1;
		else pie_0;
	end
	#100;
	frame_sync_pie;
	// QueryRep command
	// 00_01
	data_i = 4'b00_01;
	for(i=4; i!=0; i=i-1) begin
		if(data_i[i-1]) pie_1;
		else pie_0;
	end
/*
	#2100;
	frame_sync_pie;
	// NAK command
	// 11000000
	data_i = 8'b11000000;
	for(i=8; i!=0; i=i-1) begin
		if(data_i[i-1]) pie_1;
		else pie_0;
	end
*/
	#2100;
	frame_sync_pie;
	// ACK command
	// 01_0000010111111100
	data_i = 18'b01_0000010111111100;
	for(i=18; i!=0; i=i-1) begin
		if(data_i[i-1]) pie_1;
		else pie_0;
	end
	#3300;
	frame_sync_pie;
	// Req_RN command
	// 11000001_0000010111111100_1111001111000010
	data_i = 40'b11000001_0000010111111100_1111001111000010;
	for(i=40; i!=0; i=i-1) begin
		if(data_i[i-1]) pie_1;
		else pie_0;
	end
	#3000;
	frame_sync_pie;
	// Read command
	// 11000010_00_00000000_00000010_0000101111111000_1010101110001111
	data_i = 58'b11000010_00_00000000_00000010_0000101111111000_1010101110001111;
	for(i=58; i!=0; i=i-1) begin
		if(data_i[i-1]) pie_1;
		else pie_0;
	end
	#5000;
	frame_sync_pie;
	// Lock command
	// 11000101_11000000001100000000_0000101111111000_0100001111010101
	data_i = 60'b11000101_11000000001100000000_0000101111111000_0100001111010101;
	for(i=60; i!=0; i=i-1) begin
		if(data_i[i-1]) pie_1;
		else pie_0;
	end
	#3000;
	frame_sync_pie;
	// Read command
	// 11000010_00_00000000_00000010_0000101111111000_1010101110001111
	data_i = 58'b11000010_00_00000000_00000010_0000101111111000_1010101110001111;
	for(i=58; i!=0; i=i-1) begin
		if(data_i[i-1]) pie_1;
		else pie_0;
	end
	// Kill procedure
	// begin in the Open or Secured state
	// Req_RN -> Kill -> Req_RN -> Kill
	#2500;
	frame_sync_pie;
	// Req_RN command
	// 11000001_0000101111111000_1001000001001001
	data_i = 40'b11000001_0000101111111000_1001000001001001;
	for(i=40; i!=0; i=i-1) begin
		if(data_i[i-1]) pie_1;
		else pie_0;
	end
	#3000;
	frame_sync_pie;
	// Kill command
	// 11000100_1100010010100111_000_0000101111111000_0110101010101101
	data_i = 59'b11000100_1100010010100111_000_0000101111111000_0110101010101101;
	for(i=59; i!=0; i=i-1) begin
		if(data_i[i-1]) pie_1;
		else pie_0;
	end
	#3000;
	frame_sync_pie;
	// Req_RN command
	// 11000001_0000101111111000_1001000001001001
	data_i = 40'b11000001_0000101111111000_1001000001001001;
	for(i=40; i!=0; i=i-1) begin
		if(data_i[i-1]) pie_1;
		else pie_0;
	end
	#3000;
	frame_sync_pie;
	// Kill command
	// 11000100_0010100100101100_000_0000101111111000_1110110011110110
	data_i = 59'b11000100_0010100100101100_000_0000101111111000_1110110011110110;
	for(i=59; i!=0; i=i-1) begin
		if(data_i[i-1]) pie_1;
		else pie_0;
	end
end
initial begin
	clk_dpie = 1;
	#(100 + half_of_tari + 1);
	frame_sync_dpie;
	data_j = 56'b1010_100_100_01_00011011_00001011_01110001110_1_1011101100000001;
	for(j=56; j!=0; j=j-1) begin
		if(data_j[j-1]) dpie_1;
		else dpie_0;
	end
	#100;
	frame_sync_dpie;
	data_j = 22'b1000_0_01_1_10_01_0_0011_01000;
	for(j=22; j!=0; j=j-1) begin
		if(data_j[j-1]) dpie_1;
		else dpie_0;
	end
	#100;
	frame_sync_dpie;
	data_j = 9'b1001_01_011;
	for(j=9; j!=0; j=j-1) begin
		if(data_j[j-1]) dpie_1;
		else dpie_0;
	end
	#100;
	frame_sync_dpie;
	data_j = 4'b00_01;
	for(j=4; j!=0; j=j-1) begin
		if(data_j[j-1]) dpie_1;
		else dpie_0;
	end
	#100;
	frame_sync_dpie;
	data_j = 4'b00_01;
	for(j=4; j!=0; j=j-1) begin
		if(data_j[j-1]) dpie_1;
		else dpie_0;
	end
/*
	#2100;
	frame_sync_dpie;
	data_j = 8'b11000000;
	for(j=8; j!=0; j=j-1) begin
		if(data_j[j-1]) dpie_1;
		else dpie_0;
	end
*/
	#2100;
	frame_sync_dpie;
	data_j = 18'b01_0000010111111100;
	for(j=18; j!=0; j=j-1) begin
		if(data_j[j-1]) dpie_1;
		else dpie_0;
	end
	#3300;
	frame_sync_dpie;
	data_j = 40'b11000001_0000010111111100_1111001111000010;
	for(j=40; j!=0; j=j-1) begin
		if(data_j[j-1]) dpie_1;
		else dpie_0;
	end
	#3000;
	frame_sync_dpie;
	data_j = 58'b11000010_00_00000000_00000010_0000101111111000_1010101110001111;
	for(j=58; j!=0; j=j-1) begin
		if(data_j[j-1]) dpie_1;
		else dpie_0;
	end
	#5000;
	frame_sync_dpie;
	data_j = 60'b11000101_11000000001100000000_0000101111111000_0100001111010101;
	for(j=60; j!=0; j=j-1) begin
		if(data_j[j-1]) dpie_1;
		else dpie_0;
	end
	#3000;
	frame_sync_dpie;
	data_j = 58'b11000010_00_00000000_00000010_0000101111111000_1010101110001111;
	for(j=58; j!=0; j=j-1) begin
		if(data_j[j-1]) dpie_1;
		else dpie_0;
	end
	#2500;
	frame_sync_dpie;
	data_j = 40'b11000001_0000101111111000_1001000001001001;
	for(j=40; j!=0; j=j-1) begin
		if(data_j[j-1]) dpie_1;
		else dpie_0;
	end
	#3000;
	frame_sync_dpie;
	data_j = 59'b11000100_1100010010100111_000_0000101111111000_0110101010101101;
	for(j=59; j!=0; j=j-1) begin
		if(data_j[j-1]) dpie_1;
		else dpie_0;
	end
	#3000;
	frame_sync_dpie;
	data_j = 40'b11000001_0000101111111000_1001000001001001;
	for(j=40; j!=0; j=j-1) begin
		if(data_j[j-1]) dpie_1;
		else dpie_0;
	end
	#3000;
	frame_sync_dpie;
	data_j = 59'b11000100_0010100100101100_000_0000101111111000_1110110011110110;
	for(j=59; j!=0; j=j-1) begin
		if(data_j[j-1]) dpie_1;
		else dpie_0;
	end
	#3000 $finish;
end
initial begin
	rst = 1'b0;
	#10 rst = 1'b1;
	#3	rst = 1'b0;
end
initial begin
	$fsdbDumpfile("bb_proc.fsdb");
	$fsdbDumpvars;
	// $dumpfile("bb_proc.fsdb");
	// $dumpvars;
end
//					task
task frame_sync_pie;
	begin
		pie_code = 1'b0;
		#12.5 pie_code = 1'b1;
		#half_of_tari pie_code = 1'b0;
		#half_of_tari pie_code = 1'b1;
		#(5 * half_of_tari) pie_code = 1'b0;
		#half_of_tari pie_code = 1'b1;
	end
endtask
task frame_sync_dpie;
	begin
		clk_dpie = 1'b0;
		#12.5 clk_dpie = 1'b1;
		#half_of_tari clk_dpie = 1'b0;
		#half_of_tari clk_dpie = 1'b1;
		#(5 * half_of_tari) clk_dpie = 1'b0;
		#half_of_tari clk_dpie = 1'b1;
	end
endtask
task pie_0;
	begin
		#half_of_tari pie_code = 1'b0;
		#half_of_tari pie_code = 1'b1;
	end
endtask
task dpie_0;
	begin
		#half_of_tari clk_dpie = 1'b0;
		#half_of_tari clk_dpie = 1'b1;
	end
endtask
task pie_1;
	begin
		#(3 * half_of_tari) pie_code = 1'b0;
		#half_of_tari pie_code = 1'b1;
	end
endtask
task dpie_1;
	begin
		#(3 * half_of_tari) clk_dpie = 1'b0;
		#half_of_tari clk_dpie = 1'b1;
	end
endtask
endmodule