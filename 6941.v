module test_registros;
    wire Start_tHardResetComplete_timer;
    wire Request_PHY_to_Send_Hard_Reset;
    wire Request_PHY_to_Send_Cable_Reset;
    wire Stop_PHY_attempting_to_send_Hard_Reset;
    wire Stop_PHY_attempting_to_send_Cable_Reset;
    wire Stop_tHardResetComplete_timer;
    wire Start_CRCReceiveTimer;
    wire Stop_CRCReceiverTimer;
    wire MessageIDCounter;
    wire MessageID;
    wire MessageID_mismatch;
    wire SOP_mismatch;
    wire MessageID_SOP_match;
    wire [7:0] TRANSMIT_BYTE_COUNT;
    wire [7:0] TRANSMIT_HEADER_LOW;
    wire [7:0] TRANSMIT_HEADER_HIGH;
    wire [7:0] TRANSMIT_DATA_OBJECTS;
    wire [7:0] I2C_slave_reg_out;
    wire [7:0] ALERT_LOW;
    reg tHard_Reset_Complete_expires;
    reg Hard_Reset_sent;
    reg Cable_Reset_sent;
    reg tHardResetComplete_expires;
    reg PRL_Rx_Message_Discard;
    reg Hard_Reset_received;
    reg Cable_Reset_received;
    reg RetryCounter;
    reg CRCReceiveTimer_Timeout;
    reg GoodCRC_Response_from_PHY;
    reg Message_discarded_bus_Idle;
    reg [7:0] I2C_slave_reg_in;
    reg [7:0] I2C_slave_reg_addr;
    reg I2C_slave_reg_in_enb;
    reg reset;
    wire clk;
    wire pull_Down;
	wire [2:0] cuenta;
	wire [8:0] estado;
	wire read_write;
    reg  ir_ri2_enb;
    wire [7:0] ow_ri2_out_data;
    reg  [7:0] ir_ri2_in_data, ir_ri2_address;
    reg  SCL,SDA;
    clock c(clk);
    tcpci TCPCI(Start_tHardResetComplete_timer, Request_PHY_to_Send_Hard_Reset, Request_PHY_to_Send_Cable_Reset, Stop_PHY_attempting_to_send_Hard_Reset, Stop_PHY_attempting_to_send_Cable_Reset, Stop_tHardResetComplete_timer, Start_CRCReceiveTimer, Stop_CRCReceiverTimer, MessageIDCounter, MessageID, MessageID_mismatch, SOP_mismatch, MessageID_SOP_match, TRANSMIT_BYTE_COUNT, TRANSMIT_HEADER_LOW, TRANSMIT_HEADER_HIGH, TRANSMIT_DATA_OBJECTS, I2C_slave_reg_out,  ALERT_LOW, tHard_Reset_Complete_expires, Hard_Reset_sent, Cable_Reset_sent, tHardResetComplete_expires, PRL_Rx_Message_Discard, Hard_Reset_received, Cable_Reset_received, RetryCounter, CRCReceiveTimer_Timeout, GoodCRC_Response_from_PHY, Message_discarded_bus_Idle, I2C_slave_reg_in, I2C_slave_reg_addr, I2C_slave_reg_in_enb, reset, clk);
    i2cSlave  i2c_Slave(reset,SCL,SDA,pull_Down,ir_ri2_address,ir_ri2_enb,read_write,ow_ri2_out_data,ir_ri2_in_data,estado,cuenta);
    initial
        begin
            $dumpfile("test_registros.vcd");
            $dumpvars;
            tHard_Reset_Complete_expires=0;
            Hard_Reset_sent=0;
            Cable_Reset_sent=0;
            tHardResetComplete_expires=0;
            PRL_Rx_Message_Discard=0;
            Hard_Reset_received=0;
            Cable_Reset_received=0;
            RetryCounter=0;
            CRCReceiveTimer_Timeout=0;
            GoodCRC_Response_from_PHY=0;
            Message_discarded_bus_Idle=0;
            I2C_slave_reg_in=0;
            I2C_slave_reg_addr=0;
            I2C_slave_reg_in_enb=0;
            reset=1;
            #(2*`PERIODO) reset=0;
            I2C_slave_reg_addr=8'h10;  //direccion de alert parte alta y baja
            I2C_slave_reg_in=8'h00;
            #(`PERIODO)I2C_slave_reg_addr=8'h11;  //
            I2C_slave_reg_in=8'h04;  //escribimos la alerta de mensaje recibido
            #(`PERIODO) force I2C_slave_reg_in=ow_ri2_out_data;
            #(`PERIODO) force I2C_slave_reg_addr=ir_ri2_address;
            SCL=0; SDA=1;
            // Poner las transiciones requeridas para la lectura del alert
		        #(3*`PERIODO/4)
		        SDA=0;#(`PERIODO/2) //Start
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO
			SDA=0;#`PERIODO
			SDA=0;#`PERIODO
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO//dir slave
			SDA=0;#`PERIODO//Reg/write
			SDA=1;#`PERIODO//ACK
			SDA=0;#`PERIODO
			SDA=0;#`PERIODO
			SDA=0;#`PERIODO
			SDA=0;#`PERIODO
			SDA=0;#`PERIODO
			SDA=1;#`PERIODO
			SDA=0;#`PERIODO
			SDA=1;#`PERIODO //50 la dir de registro
			SDA=1;#`PERIODO//ACK
			///
			SDA=1;#`PERIODO
			SDA=0;#`PERIODO//repeated start
			///
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO
			SDA=0;#`PERIODO
			SDA=0;#`PERIODO
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO //dir slave
			SDA=1;#`PERIODO //ACK tercero
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO //liberar linea para recibir byte
			SDA=0;#`PERIODO //Master hace ACK de recibido de primer byte
			SDA=1;#`PERIODO //liberado de linea para recibir segundo byte
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO //fin de recepcion de segundo byte
			SDA=1;#`PERIODO //NACK
			SDA=0;#(`PERIODO/2)
			SDA=1;#`PERIODO //y hacer stop
			///////////////////////////////////////////////////////////////
			////// Lectura de RECEIVE_BYTE_COUNT y RX_BUF_FRAME_TYPE  /////
			///////////////////////////////////////////////////////////////
		        SDA=0;#(`PERIODO/2) //hacer start para leer RECEIVE_BYTE_COUNT y RX_BUF_FRAME_TYPE
			////Segunda lectura
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO
			SDA=0;#`PERIODO
			SDA=0;#`PERIODO
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO//dir slave
			SDA=0;#`PERIODO//Reg/write
			SDA=1;#`PERIODO//ACK
			SDA=0;#`PERIODO
			SDA=0;#`PERIODO
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO
			SDA=0;#`PERIODO
			SDA=0;#`PERIODO
			SDA=0;#`PERIODO
			SDA=0;#`PERIODO //50 la dir de registro
			SDA=1;#`PERIODO//ACK
			///
			SDA=1;#`PERIODO
			SDA=0;#`PERIODO//repeated start
			///
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO
			SDA=0;#`PERIODO
			SDA=0;#`PERIODO
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO //dir slave
			SDA=1;#`PERIODO //ACK tercero
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO //liberar linea para recibir byte
			SDA=0;#`PERIODO //Master hace ACK de recibido de primer byte
			SDA=1;#`PERIODO //liberado de linea para recibir segundo byte
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO //fin de recepcion de segundo byte
			SDA=1;#`PERIODO //NACK
		        SDA=0;#(`PERIODO/2)
			SDA=1;#`PERIODO //y hacer stop
			///////////////////////////////
			////// Lectura de Rxbuff  /////
			///////////////////////////////
		        SDA=0;#(`PERIODO/2) //hacer start para leer RX_BUF
			////Tercera lectura
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO
			SDA=0;#`PERIODO
			SDA=0;#`PERIODO
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO//dir slave
			SDA=0;#`PERIODO//Reg/write
			SDA=1;#`PERIODO//ACK
			SDA=0;#`PERIODO //inicio dir
			SDA=0;#`PERIODO
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO
			SDA=0;#`PERIODO
			SDA=0;#`PERIODO
			SDA=1;#`PERIODO
			SDA=0;#`PERIODO //fin dir de registro
			SDA=1;#`PERIODO //ACK
			///
			SDA=1;#`PERIODO
			SDA=0;#`PERIODO//repeated start
			///
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO
			SDA=0;#`PERIODO
			SDA=0;#`PERIODO
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO //dir slave
			SDA=1;#`PERIODO //ACK tercero
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO //liberar linea para recibir byte
			SDA=0;#`PERIODO //Master hace ACK de recibido de primer byte
			SDA=1;#`PERIODO //liberado de linea para recibir segundo byte
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO //fin de recepcion de segundo byte
			SDA=0;#`PERIODO //Master hace ACK de recibido de primer byte
			SDA=1;#`PERIODO //liberado de linea para recibir segundo byte
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO
			SDA=1;#`PERIODO //fin de recepcion de tercer byte
			SDA=1;#`PERIODO //NACK
		        SDA=0;#(`PERIODO/2)
			SDA=1;#`PERIODO //y hacer stop
            #`PERIODO $finish;
        end
	always begin #(`PERIODO/2) SCL=!SCL; end
endmodule