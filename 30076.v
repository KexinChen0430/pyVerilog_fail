module altera_up_video_alpha_blender_simple (
	// Inputs
	background_data,
	foreground_data,
	// Bidirectionals
	// Outputs
	new_red,
	new_green,
	new_blue
);
/*****************************************************************************
/*****************************************************************************
// Inputs
input			[29: 0]	background_data;
input			[39: 0]	foreground_data;
// Bidirectionals
// Outputs
output		[ 9: 0]	new_red;
output		[ 9: 0]	new_green;
output		[ 9: 0]	new_blue;
/*****************************************************************************
/*****************************************************************************
// Internal Wires
// Internal Registers
// State Machine Registers
/*****************************************************************************
/*****************************************************************************
// Output Registers
// Internal Registers
/*****************************************************************************
// Output Assignments
assign new_red		=
		(({10{foreground_data[39]}} & foreground_data[29:20]) |
		({10{~foreground_data[39]}} & background_data[29:20]));
assign new_green	=
		(({10{foreground_data[39]}} & foreground_data[19:10]) |
		({10{~foreground_data[39]}} & background_data[19:10]));
assign new_blue		=
		(({10{foreground_data[39]}} & foreground_data[ 9: 0]) |
		({10{~foreground_data[39]}} & background_data[ 9: 0]));
// Internal Assignments
/*****************************************************************************
endmodule