module Sincronizador( _clk_, piso_actual_i, sensor_sobrePeso_i, sensor_puerta_i, solicitud_ps_i, solicitud_p1_i,
					 solicitud_p2_i, solicitud_p3_i, solicitud_p4_i, piso_actual_o, sensor_sobrePeso_o,
					 sensor_puerta_o, solicitud_ps_o, solicitud_p1_o, solicitud_p2_o, solicitud_p3_o,
					 solicitud_p4_o);
 //Se definen las entradas y salidas del módulo
 input sensor_sobrePeso_i, sensor_puerta_i, _clk_;
 input [2:0] piso_actual_i;
 input [1:0] solicitud_ps_i, solicitud_p1_i, solicitud_p2_i, solicitud_p3_i, solicitud_p4_i;
 output reg sensor_sobrePeso_o, sensor_puerta_o;
 output reg [2:0] piso_actual_o;
 output reg [1:0] solicitud_ps_o, solicitud_p1_o, solicitud_p2_o, solicitud_p3_o, solicitud_p4_o;
 //El contador cuenta hasta 10ms, por lo que se almacena 1000000.
 localparam contador_max= 20'd1000000;
 //Se crea el primer registro (flip-flop) por cada entrada para sincronizarlos con el clk
 reg sensor_sobrePeso_sync_0;
 reg sensor_puerta_sync_0;
 reg [2:0] piso_actual_sync_0;
 reg [1:0] solicitud_ps_sync_0;
 reg [1:0] solicitud_p1_sync_0;
 reg [1:0] solicitud_p2_sync_0;
 reg [1:0] solicitud_p3_sync_0;
 reg [1:0] solicitud_p4_sync_0;
 //En cada estado positivo del clk, los registros guardan los valores de los botones/switches
 always @(posedge _clk_)
	begin
		sensor_sobrePeso_sync_0 <= sensor_sobrePeso_i;
		sensor_puerta_sync_0    <= sensor_puerta_i;
		piso_actual_sync_0      <= piso_actual_i;
		solicitud_ps_sync_0     <= solicitud_ps_i;
		solicitud_p1_sync_0     <= solicitud_p1_i;
		solicitud_p2_sync_0     <= solicitud_p2_i;
		solicitud_p3_sync_0     <= solicitud_p3_i;
		solicitud_p4_sync_0     <= solicitud_p4_i;
	end
 //Se crea el segundo registro (flip-flop) por cada salida de los registros anteriores para sincronizarlos con el clk
 reg sensor_sobrePeso_sync_1;
 reg sensor_puerta_sync_1;
 reg [2:0] piso_actual_sync_1;
 reg [1:0] solicitud_ps_sync_1;
 reg [1:0] solicitud_p1_sync_1;
 reg [1:0] solicitud_p2_sync_1;
 reg [1:0] solicitud_p3_sync_1;
 reg [1:0] solicitud_p4_sync_1;
 //En cada estado positivo del clk, los registros guardan los valores el registro anterior para sincronizar con el clk
 always @(posedge _clk_)
	begin
		sensor_sobrePeso_sync_1 <= sensor_sobrePeso_sync_0;
		sensor_puerta_sync_1    <= sensor_puerta_sync_0;
		piso_actual_sync_1      <= piso_actual_sync_0;
		solicitud_ps_sync_1     <= solicitud_ps_sync_0;
		solicitud_p1_sync_1     <= solicitud_p1_sync_0;
		solicitud_p2_sync_1     <= solicitud_p2_sync_0;
		solicitud_p3_sync_1     <= solicitud_p3_sync_0;
		solicitud_p4_sync_1     <= solicitud_p4_sync_0;
	end
 //Se crea el registro que almacena el contador
 reg [19:0] contador=0;
 //Se crean los shift registers que almacenan las 4 muestras de los estados de los botones y switches correspondientes
 reg [3:0] sr_sobrePeso= 4'b0, sr_puerta= 4'b0, sr_piso_actual_0= 4'b0, sr_piso_actual_1= 4'b0, sr_piso_actual_2= 4'b0;
 reg [3:0] sr_solicitud_ps_0=4'b0, sr_solicitud_ps_1=4'b0, sr_solicitud_p1_0= 4'b0, sr_solicitud_p1_1=4'b0, sr_solicitud_p2_0=4'b0;
 reg [3:0] sr_solicitud_p2_1=4'b0, sr_solicitud_p3_0=4'b0, sr_solicitud_p3_1=4'b0, sr_solicitud_p4_0= 4'b0, sr_solicitud_p4_1=4'b0;
 //Contador
 	always @(posedge _clk_)
	begin
		if (contador == contador_max)
			contador <= 1'b0;
		else
			contador <= contador + 1'b1;
	end
 always @(posedge _clk_)
	begin
		if (contador==contador_max) begin
			//Se hace un corrimiento a la izquierda y se almacena el estado de la entrada segun muestreo cada 10ms.
			sr_sobrePeso         <= (sr_sobrePeso      << 1)  | sensor_sobrePeso_sync_1;
			sr_puerta            <= (sr_puerta         << 1)  | sensor_puerta_sync_1;
			sr_piso_actual_0     <= (sr_piso_actual_0  << 1)  | piso_actual_sync_1[0];
			sr_piso_actual_1     <= (sr_piso_actual_1  << 1)  | piso_actual_sync_1[1];
			sr_piso_actual_2     <= (sr_piso_actual_2  << 1)  | piso_actual_sync_1[2];
			sr_solicitud_ps_0    <= (sr_solicitud_ps_0 << 1)  | solicitud_ps_sync_1[0];
			sr_solicitud_ps_1    <= (sr_solicitud_ps_1 << 1)  | solicitud_ps_sync_1[1];
			sr_solicitud_p1_0    <= (sr_solicitud_p1_0 << 1)  | solicitud_p1_sync_1[0];
			sr_solicitud_p1_1    <= (sr_solicitud_p1_1 << 1)  | solicitud_p1_sync_1[1];
			sr_solicitud_p2_0    <= (sr_solicitud_p2_0 << 1)  | solicitud_p2_sync_1[0];
			sr_solicitud_p2_1    <= (sr_solicitud_p2_1 << 1)  | solicitud_p2_sync_1[1];
			sr_solicitud_p3_0    <= (sr_solicitud_p3_0 << 1)  | solicitud_p3_sync_1[0];
			sr_solicitud_p3_1    <= (sr_solicitud_p3_1 << 1)  | solicitud_p3_sync_1[1];
			sr_solicitud_p4_0    <= (sr_solicitud_p4_0 << 1)  | solicitud_p4_sync_1[0];
			sr_solicitud_p4_1    <= (sr_solicitud_p4_1 << 1)  | solicitud_p4_sync_1[1];
		end
		//Se escribe en cada salida correspondiente un 1 si los 4 bits muestreados cada 10ns son 1111 y 0 si los 4 bits muestreados fueron 0000
		case (sr_sobrePeso)
					4'b0000: sensor_sobrePeso_o <= 0;
					4'b1111: sensor_sobrePeso_o <= 1;
		endcase
		case (sr_puerta)
					4'b0000: sensor_puerta_o <= 0;
					4'b1111: sensor_puerta_o <= 1;
		endcase
		case (sr_piso_actual_0)
					4'b0000: piso_actual_o[0] <= 0;
					4'b1111: piso_actual_o[0] <= 1;
		endcase
		case (sr_piso_actual_1)
					4'b0000: piso_actual_o[1] <= 0;
					4'b1111: piso_actual_o[1] <= 1;
		endcase
		case (sr_piso_actual_2)
					4'b0000: piso_actual_o[2] <= 0;
					4'b1111: piso_actual_o[2] <= 1;
		endcase
		case (sr_solicitud_ps_0)
					4'b0000: solicitud_ps_o[0] <= 0;
					4'b1111: solicitud_ps_o[0] <= 1;
		endcase
		case (sr_solicitud_ps_1)
					4'b0000: solicitud_ps_o[1] <= 0;
					4'b1111: solicitud_ps_o[1] <= 1;
		endcase
		case (sr_solicitud_p1_0)
					4'b0000: solicitud_p1_o[0] <= 0;
					4'b1111: solicitud_p1_o[0] <= 1;
		endcase
		case (sr_solicitud_p1_1)
					4'b0000: solicitud_p1_o[1] <= 0;
					4'b1111: solicitud_p1_o[1] <= 1;
		endcase
		case (sr_solicitud_p2_0)
					4'b0000: solicitud_p2_o[0] <= 0;
					4'b1111: solicitud_p2_o[0] <= 1;
		endcase
		case (sr_solicitud_p2_1)
					4'b0000: solicitud_p2_o[1] <= 0;
					4'b1111: solicitud_p2_o[1] <= 1;
		endcase
		case (sr_solicitud_p3_0)
					4'b0000: solicitud_p3_o[0] <= 0;
					4'b1111: solicitud_p3_o[0] <= 1;
		endcase
		case (sr_solicitud_p3_1)
					4'b0000: solicitud_p3_o[1] <= 0;
					4'b1111: solicitud_p3_o[1] <= 1;
		endcase
		case (sr_solicitud_p4_0)
					4'b0000: solicitud_p4_o[0] <= 0;
					4'b1111: solicitud_p4_o[0] <= 1;
		endcase
		case (sr_solicitud_p4_1)
					4'b0000: solicitud_p4_o[1] <= 0;
					4'b1111: solicitud_p4_o[1] <= 1;
		endcase
	end
endmodule