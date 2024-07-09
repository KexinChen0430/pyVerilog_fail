module UnorderedSet #(
	parameter DEPTH			= 16,	//number of elements in the set
	parameter ITER_SIZE		= 4,	//must be clog2(DEPTH)
	parameter KEY_SIZE		= 16	//Size of a single key element in bits
) (
	input wire					clk,
	input wire					insert_en,		//assert to add a new element
	input wire[KEY_SIZE-1:0]	insert_key,		//the element to insert
	output reg					insert_ok = 0,	//goes high after 1 cycle on successful insert
												//stays low to indicate the set is full
	input wire					iter_inc,		//assert to increment the iterator at iter_in
	input wire					iter_begin,		//assert to look up the first element in the set, ignoring iter_in
	input wire[ITER_SIZE-1:0]	iter_in,		//previous value of the iterator
	output reg					iter_end = 0,	//true if we hit the end (iter_next not valid)
	output reg[ITER_SIZE-1:0]	iter_next = 0,	//next value of the iterator
	output reg[KEY_SIZE-1:0]	iter_key = 0,	//key associated with this iterator
	input wire					remove_en,		//assert to clear an item by iterator (remove by key not supported)
	input wire[ITER_SIZE-1:0]	remove_iter		//the iterator to remove
);
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// The actual storage array
	integer i;
	reg					slot_valid[DEPTH-1:0];
	reg[KEY_SIZE-1:0]	slot_key[DEPTH-1:0];
	initial begin
		for(i=0; i<DEPTH; i=i+1) begin
			slot_valid[i]	<= 0;
			slot_key[i]		<= 0;
		end
	end
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Iterator management. This is combinatorial so external registers can be used.
	reg		hit = 0;
	always @(*) begin
		iter_end		<= 1;		//Default to "end of set, iterator not valid"
		iter_next		<= 0;
		hit				= 0;
		//When RESETTING the iterator: find the first valid element
		if(iter_begin) begin
			for(i=0; i<DEPTH; i=i+1) begin
				if(slot_valid[i] && !hit) begin
					hit			= 1;
					iter_end	<= 0;
					iter_next	<= i;
					iter_key	<= slot_key[i];
				end
			end
		end
		//When INCREMENTING the iterator: find the first valid element with index >= iter_in
		else if(iter_inc) begin
			for(i=0; i<DEPTH; i=i+1) begin
				if(slot_valid[i] && !hit && (i > iter_in) ) begin
					hit			= 1;
					iter_end	<= 0;
					iter_next	<= i;
					iter_key	<= slot_key[i];
				end
			end
		end
	end
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Insertion/removal
	always @(posedge clk) begin
		insert_ok		= 0;
		//Process inserts
		if(insert_en) begin
			//Check if the key is already in the set. If so, no action needed.
			for(i=0; i<DEPTH; i=i+1) begin
				if(slot_valid[i] && (slot_key[i] == insert_key) ) begin
					insert_ok		= 1;
				end
			end
			//If not in the set, insert it.
			for(i=0; i<DEPTH; i=i+1) begin
				if(!slot_valid[i] && !insert_ok) begin
					insert_ok		= 1;
					slot_valid[i]	<= 1;
					slot_key[i]		<= insert_key;
				end
			end
		end
		//Process removal
		if(remove_en)
			slot_valid[remove_iter]	<= 0;
	end
endmodule