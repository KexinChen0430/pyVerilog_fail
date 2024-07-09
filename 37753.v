module
	// Current path metric #1 for a set of addition
	input [3:0] pm1;
	// Branch metric #1 for a set of addition
	input [1:0] bm1;
	// Current path metric #2 for another set of addition
	input [3:0] pm2;
	// Branch metric #2 for another set of addition
	input [1:0] bm2;
	// Declare "reg" signals... that will be assigned values
	reg [3:0] npm;
	reg d;
	/**
	 */
	// Result of a set of addition
	reg [3:0] add1;
	// Result of another set of addition
	reg [3:0] add2;
	// Temporary storage for a set of addition to check for overflow
	reg [4:0] add_temp1;
	// Temporary storage for another set of addition to check for overflow
	reg [4:0] add_temp2;
	// Declare "wire" signals...
	// Defining constants: parameter [name_of_constant] = value;
	// Maximum value that can be stored in a 4-bit bus
	parameter max_add = 4'd15;
	/**
	 */
	always @ (pm1 or bm1)
	begin
		// Add the operands and temporary store them
		add_temp1 = pm1 + bm1;
		// Did the (temporary) addition cause an overflow
		if(add_temp1 > max_add)
		begin
			/**
			 */
			add1 = max_add;
		end
		else
		begin
			/**
			 */
			add1 = pm1 + bm1;
		end
	end
	/**
	 */
	always @ (pm2 or bm2)
	begin
		// Add the operands and temporary store them
		add_temp2 = pm2 + bm2;
		// Did the (temporary) addition cause an overflow
		if(add_temp2 > max_add)
		begin
			/**
			 */
			add2 = max_add;
		end
		else
		begin
			/**
			 */
			add2 = pm2 + bm2;
		end
	end
	// ========================================================
	// Perform the compare stage of the add-compare-select unit
	always @ (add1 or add2)
	begin
		if(add1 <= add2)
		begin
			// Select path 1 ==> d=0
			d = 1'b0;
		end
		else
		begin
			// Select path 2 ==> d=1
			d = 1'b1;
		end
	end
	// ========================================================
	// Perform the select stage of the add-compare-select unit
	always @ (d or add1 or add2)
	begin
		if(d)
		begin
			// Select path 2... add1 < add2
			npm = add2;
		end
		else
		begin
			// Select path 1... add1 >= add2
			npm = add1;
		end
	end
endmodule