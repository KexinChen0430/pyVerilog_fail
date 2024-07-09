module test_registros;
    wire clk;
    reg  reset, ir_ri0_enb, ir_ri1_enb, ir_ri2_enb;
    wire [7:0] ow_ri0_out_data, ow_ri1_out_data, ow_ri2_out_data;
    reg  [7:0] ir_ri0_in_data, ir_ri0_address, ir_ri1_in_data, ir_ri1_address, ir_ri2_in_data, ir_ri2_address;
    reg  SCL,SDA;
    clock c(clk);
    REG_INTERFACE reg_interface(ow_ri0_out_data, ow_ri1_out_data, ow_ri2_out_data, ir_ri0_address, ir_ri1_address, ir_ri2_address, ir_ri0_in_data, ir_ri1_in_data, ir_ri2_in_data, ir_ri0_enb, ir_ri1_enb, ir_ri2_enb, reset, clk);
    wire pull_Down;
	wire [2:0] cuenta;
	wire [8:0] estado;
	wire read_write;
    i2cSlave  i2c_Slave(reset,SCL,SDA,pull_Down,ir_ri2_address,ir_ri2_enb,read_write,ow_ri2_out_data,ir_ri2_in_data,estado,cuenta);
    initial
        begin
            $dumpfile("test_registros.vcd");
            $dumpvars;
            reset=1;
            #`PERIODO reset=0;
            ir_ri0_enb=1;
            ir_ri1_enb=1;
            ir_ri0_address=8'h10;  //direccion de alert parte alta y baja
            ir_ri1_address=8'h11;  //
            ir_ri0_in_data=8'h00;
            ir_ri1_in_data=8'h04;  //escribimos la alerta de mensaje recibido
            // Poner las transiciones requeridas para la lectura del alert
			//SDA=0;
			#3
			SDA=0;
			#2
			SDA=1;#4
			SDA=1;#4
			SDA=0;#4
			SDA=0;#4
			SDA=1;#4
			SDA=1;#4
			SDA=1;#4
			SDA=0;#4 //dir slave
			SDA=1;#4//ACK
			SDA=0;#4
			SDA=0;#4
			SDA=0;#4
			SDA=0;#4
			SDA=0;#4
			SDA=1;#4
			SDA=0;#4
			SDA=1;#4 //50 la dir de registro
			SDA=1;#4//ACK
			///
			SDA=1;#2
			SDA=0;#2//repeated start
			///
			SDA=1;#4
			SDA=1;#4
			SDA=0;#4
			SDA=0;#4
			SDA=1;#4
			SDA=1;#4
			SDA=1;#4
			SDA=1;#4 //dir slave
			SDA=1;#4 //ACK tercero
			SDA=1;#4
			SDA=1;#4
			SDA=1;#4
			SDA=1;#4
			SDA=1;#4
			SDA=1;#4
			SDA=1;#4
			SDA=1;#4 //liberar linea para recibir byte
			SDA=1;#4 //NACK
			SDA=0;#2
			SDA=1;#9
            #`PERIODO $finish;
        end
endmodule