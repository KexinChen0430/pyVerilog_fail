module obtained from the input vector
// state machine variables
reg [3:0]state;			// current state of the SM
reg [3:0]next_state;		// next state for the SM
// used for filling up L2
reg [CACHE_TAG_WIDTH-1:0]tag_count;
reg [CACHE_DATA_WIDTH-1:0]data_test;
// Instantiate the Unit Under Test (UUT)
cache #(CACHE_TAG_WIDTH,CACHE_DATA_WIDTH,L1_ENTRIES_WIDTH) L1	(
	.data_out(L1_data_out),
	.data_out_miss(L1_data_miss_out),
	.tag_out_miss(L1_tag_miss_out),
	.hit_miss_out(L1_hit_miss_out),
	.vector_in(temp_L1_vector_in),
	.clk(clk),
	.enable(L1_enable)
);
// Instantiate the Unit Under Test (UUT)
cache #(CACHE_TAG_WIDTH,CACHE_DATA_WIDTH,L2_ENTRIES_WIDTH) L2	(
	.data_out(L2_data_out),
	.data_out_miss(L2_data_miss_out),
	.tag_out_miss(L2_tag_miss_out),
	.hit_miss_out(L2_hit_miss_out),
	.vector_in(temp_L2_vector_in),
	.clk(clk),
	.enable(L2_enable)
);
//assign L1_hit_miss_out = `CACHE_ENABLE;
initial
begin
	L2_enable = `CACHE_ENABLE;
	L1_enable = `CACHE_ENABLE;
	tag_count = 4'b1100;
	data_test = 4'b1111;
	repeat(L1_ENTRIES_WIDTH)begin: bench3
		#2 temp_L1_vector_in = {`WRITE,tag_count,data_test};	// write to a new tag entry every time
//			#2 vector_in = {2'b01,tag_count,data_test};	// read such tag entry
		tag_count = tag_count + 1'b1;
		data_test = data_test + 1'b1;
	end 	// end repeat loop
	tag_count = {CACHE_TAG_WIDTH-1{1'b0}};
	data_test = {CACHE_DATA_WIDTH-1{1'b1}};
	repeat(8)begin: bench2
		#2 temp_L2_vector_in = {`WRITE,tag_count,data_test};	// write to a new tag entry every time
//			#2 vector_in = {2'b01,tag_count,data_test};	// read such tag entry
		tag_count = tag_count + 1'b1;
		data_test = data_test + 1'b1;
	end 	// end repeat loop
	L2_enable = `CACHE_DISABLE;
	L1_enable = `CACHE_DISABLE;
	//	L1_hit_miss_out = 'bx;
	state = `L1_CACHE_ACCESS;
end
always@*
begin
	data_out = L1_data_out;
	hit_miss_out = L1_hit_miss_out;
end
always@(posedge clk)
begin
	control_in = vector_in[CACHE_LINE_WIDTH-1:CACHE_LINE_WIDTH-OPCODE_WIDTH];
	tag_in = vector_in[CACHE_LINE_WIDTH-OPCODE_WIDTH-1:CACHE_LINE_WIDTH-OPCODE_WIDTH-CACHE_TAG_WIDTH];
	data_in = vector_in[CACHE_LINE_WIDTH-OPCODE_WIDTH-CACHE_TAG_WIDTH-1:CACHE_LINE_WIDTH-OPCODE_WIDTH-CACHE_TAG_WIDTH-CACHE_DATA_WIDTH];
	case(state)
	`L1_CACHE_ACCESS:
		begin
			L1_enable = `CACHE_ENABLE;
			temp_L1_vector_in = vector_in;
			$display("L1_hit_miss_out :%d",L1_hit_miss_out);
			if(L1_hit_miss_out == `MISS)begin
				$display("L1 MISS, GOING TO L2");
				swap_L1_tag = L1_tag_miss_out;
				swap_L1_data = L1_data_miss_out;
				$display("L1_tag_miss_out: %d, L1_data_miss_out: %d",L1_tag_miss_out,L1_data_miss_out);
				temp_L2_vector_in = vector_in;
				L1_enable = `CACHE_DISABLE;
				L2_enable = `CACHE_ENABLE;
//				temp_L1_vector_in = {2'b11,tag_in,data_in};
				next_state = `L2_CACHE_ACCESS;
			end else
				begin
					$display("L1 HIT, GOING NOWHERE");
					next_state = `L1_CACHE_ACCESS;
				end
		end
	`L2_CACHE_ACCESS:
		begin
			@(posedge clk)
//			@(posedge clk)
			$display("L2_hit_miss_out :%d",L2_hit_miss_out);
			if(L2_hit_miss_out == `HIT)begin
				$display("L2 HIT, DO SOMETHING");
				L1_enable = `CACHE_ENABLE;
				next_state = `CACHE_SWAP;
			end else
				begin
					$display("L2 MISS");
					next_state = `L1_CACHE_ACCESS;
				end
		end
	`CACHE_SWAP:
		begin
			temp_L1_vector_in = {`WRITE,tag_in,L2_data_out};
			temp_L2_vector_in = {`WRITE,swap_L1_tag,swap_L1_data};
			$display("tag_in: %d, L2_data_out: %d, swap_L1_tag: %d, swap_L1_data: %d",tag_in,L2_data_out,swap_L1_tag,swap_L1_data);
			next_state = `CACHE_SWAP_WAIT;
		end
	`CACHE_SWAP_WAIT:
		begin
			if(L2_hit_miss_out == `HIT)begin
//				L2_enable = `CACHE_DISABLE;
				next_state = `L1_CACHE_ACCESS;
				$display("SWAPPING COMPLETE");
			end
		end
	default:
		begin
			$display("WRONG PLACE");
//			next_state = `L1_CACHE_ACCESS;
		end
	endcase
	state = next_state;
end
endmodule