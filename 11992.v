module phy_emulation #(
  parameter DLY = 1,
  parameter INTERLACE = 0,
  parameter DATA_WIDTH = 24
 )
(
    input   wire        clk,
    input   wire        rst,
    input   wire        vid_ce,
    input   wire        hsync,
    input   wire        vsync,
    input   wire        de,
    input   wire        vid_field_id,
    input   wire  [DATA_WIDTH-1:0] video_data,
	output  reg         error_out,
	output  reg         frame_complete
 );
// variable declarations
reg [13:0]   pixel_count;
reg [13:0]    line_count;
reg  [DATA_WIDTH-1:0]  video_data_1;
reg         de_1;
reg         de_2;
reg         hsync_1;
reg         vsync_1;
wire[DATA_WIDTH-1:0]  expected_video_data;
reg         count_valid = 0;
wire        vsync_rising;
reg         vblank;
wire        compare_valid;
assign vsync_rising = vsync & !vsync_1;
assign compare_valid = de & count_valid & !frame_complete;
// Delay data and eol to match with pixel and line numbers
always @ (posedge clk)	begin
  if (vid_ce) begin
    video_data_1 <= video_data;
    de_1         <= de;
    de_2         <= de_1;
    hsync_1      <= hsync;
    vsync_1      <= vsync;
  end
end
// pixel counter
// Cleared to 0 on reset and hsync. Rolls over when it reaches total_pixels-1. Otherwise
// increments every data enable.
always @ (posedge clk) begin
  if (vid_ce) begin
        if (rst || hsync)
             pixel_count <= 0;
        else if (de_1)
             pixel_count <= pixel_count + 1;
  end
end
// Line counter
// Set to line 0 on reset or vsync. Increments coincident with rising edge
// of de.
always @ (posedge clk) begin
   if (rst)begin
     line_count <=  0;
   	    count_valid <=  0;
  	   frame_complete <= 0;
   end
   else if (vid_ce) begin
     if (vsync_rising) begin		  // count is valid after 1st vsync
        vblank <= 1;	 // set flag to indicate this is during vert. blank
        line_count <= 0;
   	 if ( !INTERLACE || vid_field_id)	// for interlace start with field 1
     	  count_valid <=  1;
     	  // if count_valid is already asserted, the frame is complete
		  // For interlace, additionally, wait for field 2
     	  if ( count_valid && (!INTERLACE || vid_field_id))
     	    frame_complete <= 1;
     end
     else if (&line_count)
       begin
         $display ("Line counter reached maximum value. Test error.");
         $stop;
       end
     else if (de & !de_1)	begin// increment on every rising de after vblank
       if (!vblank)
         line_count <=  line_count + 1;
   	 vblank <= 0;
     end
   end
end
// Generate the video outputs.  The video is gengerated procedurally
// according to the line and pixel number.  This makes it so the checking
// side can reconstruct the expected data by the same procedure.
assign expected_video_data = vid_field_id?
  {~line_count, ~pixel_count[11:0]}:   //invert data for field 1
  {line_count, pixel_count[11:0]};
always @ (posedge clk) begin
  if (vid_ce) begin
    error_out <= 0;
    if (compare_valid) begin
      # DLY #DLY if (video_data_1 != expected_video_data) begin
         $display ("Data Mismatch. Expected: %h, received: %h. Test error.",
         expected_video_data, video_data_1);
         error_out <= 1;
         $display("*******************************");
         $display("** ERROR. TEST FAILED  !!!");
         $display("*******************************");
    	 $stop;
      end
    end
  end
end
endmodule