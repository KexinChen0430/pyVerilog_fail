module to get menu pixels?
			update_VGA_RGB(sw);
		end
	 end
	 // Take in 8 bit color and set VGA colors accordingly
	 task update_VGA_RGB;
		input [7:0] color;
		begin
			vgaRed = color[7:5];
			vgaGreen = color[4:2];
			vgaBlue = color[1:0];
		end
	 endtask
/*******Cursor Control*********/
     reg [31:0] counter_cursor = 0;
     reg clk_cursor = 0; // Ticks at 30 Hz
     always @(posedge clk)
     begin
        counter_cursor <= (counter_cursor == 1666666) ? 0 : counter_cursor + 1;
        if (counter_cursor == 0)
            clk_cursor <= ~clk_cursor;
     end
     always @(posedge clk_cursor)
     begin
        if (joystick_x < 150 && cursorX < drawAreaWidth - 2) cursorX <= cursorX + 2;
        else if (joystick_x < 400 && cursorX < drawAreaWidth - 1) cursorX <= cursorX + 1;
        if (joystick_x > 850 && cursorX > 2) cursorX <= cursorX - 2;
        else if (joystick_x > 600 && cursorX > 1) cursorX <= cursorX - 1;
        if (joystick_y < 150 && cursorY > 2) cursorY <= cursorY - 2;
        else if (joystick_y < 400 && cursorY > 1) cursorY <= cursorY - 1;
        if (joystick_y > 850 && cursorY < drawAreaHeight - 2) cursorY <= cursorY + 2;
        else if (joystick_y > 600 && cursorY < drawAreaHeight - 1) cursorY <= cursorY + 1;
     end
/********Tool Control**********/
     reg [5:0] current_tool = 2;
     reg [5:0] old_tool = 0; // Used to go back to current_tool after resetting screen
     wire [5:0] TOOL_NONE = 0;
     wire [5:0] TOOL_RESET = 1;
     wire [5:0] TOOL_PENCIL = 2;
     wire [5:0] TOOL_ERASER = 3;
     wire [5:0] TOOL_STAMP = 4;
     reg is_resetting = 0;
     reg is_tool_on = 0;
     reg [31:0] reset_counter = 0;
     reg [31:0] pencil_size = 4;
     reg [31:0] pencil_x = 0;
     reg [31:0] pencil_y = 0;
     reg [31:0] stamp_size = 30;
     reg [31:0] stamp_x = 0;
     reg [31:0] stamp_y = 0;
	 reg [31:0] current_stamp = 4;
     reg [31:0] counter_debounce = 0;
     wire clk_debounce;
     assign clk_debounce = counter_debounce == 166666;
     always @(posedge clk)
     begin
        counter_debounce <= counter_debounce == 166666 ? 0 : counter_debounce + 1;
     end
     reg btnRdb = 0;
     reg btnLdb = 0;
     reg btnUdb = 0;
     reg btnDdb = 0;
     always @(posedge clk_debounce)
     begin
        btnRdb <= btnR;
        btnLdb <= btnL;
        btnUdb <= btnU;
        btnDdb <= btnD;
     end
     wire comboLR = btnRdb || btnLdb;
     always @(posedge comboLR)
     begin
        if (btnRdb)
        begin
            if (current_tool == TOOL_STAMP)
            begin
                current_stamp <= current_stamp == 6 ? 0 :current_stamp + 1;
            end
            else
            begin
                case (pencil_size)
                2: pencil_size <= 4;
                4: pencil_size <= 6;
                endcase
            end
        end
        if (btnLdb)
        begin
            if (current_tool == TOOL_STAMP)
            begin
                current_stamp <= current_stamp == 0 ? 6 :current_stamp - 1;
            end
            else
            begin
                case (pencil_size)
                4: pencil_size <= 2;
                6: pencil_size <= 4;
                endcase
            end
        end
     end
     wire comboUD = btnUdb || btnDdb;
     always @(posedge comboUD)
     begin
        if (btnUdb)
        begin
            if (current_tool == TOOL_PENCIL) current_tool <= TOOL_STAMP;
            if (current_tool == TOOL_ERASER) current_tool <= TOOL_PENCIL;
            if (current_tool == TOOL_STAMP) current_tool <= TOOL_ERASER;
        end
        if (btnDdb)
        begin
            if (current_tool == TOOL_PENCIL) current_tool <= TOOL_ERASER;
            if (current_tool == TOOL_ERASER) current_tool <= TOOL_STAMP;
            if (current_tool == TOOL_STAMP) current_tool <= TOOL_PENCIL;
        end
     end
     always @(posedge clk)
     begin
        // Set current tool
        if (btnS && current_tool != TOOL_RESET)
        begin
            is_resetting <= 1;
            reset_counter <= 0;
        end
        else if (joystick_btn_left)
            is_tool_on <= 1;
        if (is_resetting)
        begin
            if (reset_counter == drawAreaWidth * drawAreaHeight)
            begin
                is_resetting <= 0;
                wea <= 0;
            end
            else
            begin
                wea <= 1;
                dina <= COLOR_WHITE;
                pmin_addr <= reset_counter;
                reset_counter <= reset_counter + 1;
            end
        end
        if (is_tool_on && current_tool == TOOL_PENCIL)
        begin
            if (pencil_y == pencil_size)
            begin
                is_tool_on <= 0;
                wea <= 0;
                pencil_x <= 0;
                pencil_y <= 0;
            end
            else
            begin
                wea <= 1;
                dina <= sw;
                pmin_addr <= (cursorX + pencil_x - pencil_size / 2) + (cursorY + pencil_y - pencil_size / 2) * drawAreaWidth;
                if (pencil_x == pencil_size - 1)
                begin
                    pencil_x <= 0;
                    pencil_y <= pencil_y + 1;
                end
                else
                    pencil_x <= pencil_x + 1;
            end
        end
        if (is_tool_on && current_tool == TOOL_ERASER)
        begin
            if (pencil_y == pencil_size)
            begin
                is_tool_on <= 0;
                wea <= 0;
                pencil_x <= 0;
                pencil_y <= 0;
            end
            else
            begin
                wea <= 1;
                dina <= COLOR_WHITE;
                pmin_addr <= (cursorX + pencil_x - pencil_size / 2) + (cursorY + pencil_y - pencil_size / 2) * drawAreaWidth;
                if (pencil_x == pencil_size - 1)
                begin
                    pencil_x <= 0;
                    pencil_y <= pencil_y + 1;
                end
                else
                    pencil_x <= pencil_x + 1;
            end
        end
        if (is_tool_on && current_tool == TOOL_STAMP)
        begin
            if (stamp_y == stamp_size)
            begin
                is_tool_on <= 0;
                wea <= 0;
                stamp_x <= 0;
                stamp_y <= 0;
                stamp_draw_addr <= 0;
            end
            else
            begin
                stamp_draw_addr <= (stamp_x + (stamp_y * stamp_size));
                wea <= stamp_draw_pixel != 8'b00000011;
                dina <= stamp_draw_pixel;
                pmin_addr <= (cursorX + stamp_x - stamp_size / 2) + (cursorY + stamp_y - stamp_size / 2) * drawAreaWidth;
                if (stamp_x == stamp_size)
                begin
                    stamp_x <= 0;
                    stamp_y <= stamp_y + 1;
                end
                else
                    stamp_x <= stamp_x + 1;
            end
        end
     end
/*********Pixel Map ***********/
	 reg [15:0] pmop_addr;
	 wire [7:0] pmop_pixel;
     reg wea;
     reg [15 : 0] pmin_addr;
     reg [7 : 0] dina;
     pixel_map pixel_map(
        .clka(clk), // input clka
        .wea(wea), // input [0 : 0] wea
        .addra(pmin_addr), // input [15 : 0] addra
        .dina(dina), // input [7 : 0] dina
        .clkb(clk), // input clkb
        .addrb(pmop_addr), // input [15 : 0] addrb
        .doutb(pmop_pixel) // output [7 : 0] doutb
    );
    reg [9:0] stamp_draw_addr = 0;
    wire [7:0] stamp_draw_pixel;
	reg [9:0] stamp_menu_addr = 0;
	wire [7:0] stamp_menu_pixel;
	assign stamp_draw_pixel =
		current_stamp == 0 ? stamp_draw_pixel_0 :
		current_stamp == 1 ? stamp_draw_pixel_1 :
		current_stamp == 2 ? stamp_draw_pixel_2 :
		current_stamp == 3 ? stamp_draw_pixel_3 :
		current_stamp == 4 ? stamp_draw_pixel_4 :
		current_stamp == 5 ? stamp_draw_pixel_5 : stamp_draw_pixel_6;
     assign stamp_menu_pixel =
		current_stamp == 0 ? stamp_menu_pixel_0 :
		current_stamp == 1 ? stamp_menu_pixel_1 :
		current_stamp == 2 ? stamp_menu_pixel_2 :
		current_stamp == 3 ? stamp_menu_pixel_3 :
		current_stamp == 4 ? stamp_menu_pixel_4 :
		current_stamp == 5 ? stamp_menu_pixel_5 : stamp_menu_pixel_6;
	 wire [7:0] stamp_draw_pixel_0;
	 wire [7:0] stamp_menu_pixel_0;
	 stamp_matt stamp0 (
		.clka(clk), // input clka
		.addra(stamp_draw_addr), // input [9 : 0] addra
		.douta(stamp_draw_pixel_0), // output [7 : 0] douta
		.clkb(clk), // input clkb
		.addrb(stamp_menu_addr), // input [9 : 0] addrb
		.doutb(stamp_menu_pixel_0) // output [7 : 0] doutb
	 );
	 wire [7:0] stamp_draw_pixel_1;
	 wire [7:0] stamp_menu_pixel_1;
	 stamp_penguin stamp1 (
		.clka(clk), // input clka
		.addra(stamp_draw_addr), // input [9 : 0] addra
		.douta(stamp_draw_pixel_1), // output [7 : 0] douta
		.clkb(clk), // input clkb
		.addrb(stamp_menu_addr), // input [9 : 0] addrb
		.doutb(stamp_menu_pixel_1) // output [7 : 0] doutb
	 );
	 wire [7:0] stamp_draw_pixel_2;
	 wire [7:0] stamp_menu_pixel_2;
	 stamp_jellyfish stamp2 (
		.clka(clk), // input clka
		.addra(stamp_draw_addr), // input [9 : 0] addra
		.douta(stamp_draw_pixel_2), // output [7 : 0] douta
		.clkb(clk), // input clkb
		.addrb(stamp_menu_addr), // input [9 : 0] addrb
		.doutb(stamp_menu_pixel_2) // output [7 : 0] doutb
	 );
	 wire [7:0] stamp_draw_pixel_3;
	 wire [7:0] stamp_menu_pixel_3;
	 stamp_cat stamp3 (
		.clka(clk), // input clka
		.addra(stamp_draw_addr), // input [9 : 0] addra
		.douta(stamp_draw_pixel_3), // output [7 : 0] douta
		.clkb(clk), // input clkb
		.addrb(stamp_menu_addr), // input [9 : 0] addrb
		.doutb(stamp_menu_pixel_3) // output [7 : 0] doutb
	 );
	 wire [7:0] stamp_draw_pixel_4;
	 wire [7:0] stamp_menu_pixel_4;
	 stamp_taco stamp4 (
		.clka(clk), // input clka
		.addra(stamp_draw_addr), // input [9 : 0] addra
		.douta(stamp_draw_pixel_4), // output [7 : 0] douta
		.clkb(clk), // input clkb
		.addrb(stamp_menu_addr), // input [9 : 0] addrb
		.doutb(stamp_menu_pixel_4) // output [7 : 0] doutb
	 );
	 wire [7:0] stamp_draw_pixel_5;
	 wire [7:0] stamp_menu_pixel_5;
	 stamp_mushroom stamp5 (
		.clka(clk), // input clka
		.addra(stamp_draw_addr), // input [9 : 0] addra
		.douta(stamp_draw_pixel_5), // output [7 : 0] douta
		.clkb(clk), // input clkb
		.addrb(stamp_menu_addr), // input [9 : 0] addrb
		.doutb(stamp_menu_pixel_5) // output [7 : 0] doutb
	 );
	 wire [7:0] stamp_draw_pixel_6;
	 wire [7:0] stamp_menu_pixel_6;
	 stamp_heart stamp6 (
		.clka(clk), // input clka
		.addra(stamp_draw_addr), // input [9 : 0] addra
		.douta(stamp_draw_pixel_6), // output [7 : 0] douta
		.clkb(clk), // input clkb
		.addrb(stamp_menu_addr), // input [9 : 0] addrb
		.doutb(stamp_menu_pixel_6) // output [7 : 0] doutb
	 );
/*********Joystick  ***********/
	wire SS;						// Active low
	wire MOSI;					// Data transfer from master to slave
	wire SCLK;					// Serial clock that controls communication
	assign MOSI = 0;
	// Data read from PmodJSTK
	wire [39:0] jstkData;
    wire [9 : 0] joystick_y = {jstkData[9:8], jstkData[23:16]};
    wire [9 : 0] joystick_x = {jstkData[25:24], jstkData[39:32]};
    wire joystick_btn_right = jstkData[1];
    wire joystick_btn_left = jstkData[2];
	joy joy(
		.CLK(clk),
		.sndRec(clk_cursor),
		.MISO(MISO),
		.SS(SS),
		.SCLK(SCLK),
		.DOUT(jstkData)
	);
endmodule