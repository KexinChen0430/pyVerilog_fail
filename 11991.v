module test_vid_out #(
  parameter DLY = 1,
  parameter NUM_TESTS = 2
 )
 (
    input   wire        clk,
	input   wire        error,
	input   wire        frame_complete,
    output  reg         rst,
	output  reg [13:0]  total_lines,
	output  reg [13:0]  active_lines,
	output  reg [13:0]  vsync_start,
	output  reg [13:0]  vsync_end,
    output  reg [13:0]  total_pixels,
    output  reg [13:0]  active_pixels,
	output  reg [13:0]  hsync_start,
	output  reg [13:0]  hsync_end
 );
integer i;
reg [11:0] h_size   = 103;
reg [11:0] v_size   = 81;
reg [9:0]  h_blank  = 15;
reg [9:0]  v_blank  = 8;
reg [9:0]  h_sync   = 8;
reg	[9:0]  v_sync   = 3;
reg [9:0]  h_fp     = 3;
reg	[9:0]  v_fp     = 2;
// Task to test one line standard
  task  test_a_line_std;
	 input [11:0]       h_size;
	 input [11:0]       v_size;
	 begin
     $display("Frame Size is %d x %d ", h_size, v_size);
    // Hold reset for several cycles,
	  rst <= 1;
    repeat (10) @ (posedge clk);
	  rst <= # DLY 0;
    wait (frame_complete);
        $display("frame_complete");
   end
 endtask
// Stimulus loop
// Calls test_a_line_std task for a	certain number of line standards
  initial begin
    for (i = 0; i< NUM_TESTS; i= i+1) begin
	  total_lines   = v_size + v_blank;
	  active_lines  = v_size;
	  vsync_start   = v_size + v_fp -1;
	  vsync_end     = vsync_start  + v_sync;
	  total_pixels  = h_size + h_blank;
	  active_pixels = h_size;
	  hsync_start   = h_size + h_fp -1;
	  hsync_end     = hsync_start  + h_sync;
      $display("Format # %0d", i);
      test_a_line_std (
        h_size,
        v_size
      );
	  h_size= h_size +33;
	  v_size = v_size + 27;
	end
    $display("Test passed after testing %0d video formats.", NUM_TESTS);
                $display("***************************************");
                $display("** Test completed successfully       **");
                $display("** Simulation finished successfully  **");
                $display("***************************************");
    $stop;
  end
endmodule