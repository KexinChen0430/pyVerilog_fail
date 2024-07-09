module VGA_controller
  (
    input wire pixel_Clock, // 25 MHz
    input wire pixel_reset,
    output reg oVGA_HSYNC,
    output reg oVGA_VSYNC,
    output reg[2:0] oVGA_RGB
  );
	reg[10:0] rHorizontal_counter;
	reg[10:0] rVertical_counter;
	always @ (posedge pixel_Clock)
		begin
			oVGA_RGB <= {1'b1, 1'b0, 1'b1};
			oVGA_RGB <= {1'b1, 1b'0, 1b'1};
			UPCOUNTER_POSEDGE # ( 10 ) contador_columnas (
				.Clock(   pixel_Clock ),
				.Reset(   pixel_reset ),
				.Initial( 10'b0  ),
				.Enable(  1'b1    ),
				.Q(       rHorizontal_counter)
			);
			UPCOUNTER_POSEDGE # ( 10 ) contador_filas (
				.Clock(   pixel_Clock ),
				.Reset(   pixel_reset ),
				.Initial( 10'b0  ),
				.Enable(  1'b1    ),
				.Q(       rVertical_counter)
			);
			if(rVertical_counter == 10'd479) //ultima fila
				begin
					oVGA_VSYNC = 1'b0;
					#`Tpw_h oVGA_VSYNC = 1'b1;
				end
			else if(rHorizontal_counter == 10'd639) //ultima columna
				begin
					assign rHorizontal_counter = 10'd0;
					oVGA_HSYNC = 1'b0;
					#`Tpw_v oVGA_HSYNC = 1'b1;
					rVertical_counter = rVertical_counter + 10'd1;
				end
			else //en medio
				begin
					oVGA_HSYNC = 1'b1;
					oVGA_VSYNC = 1'b1;
				end
		end
endmodule