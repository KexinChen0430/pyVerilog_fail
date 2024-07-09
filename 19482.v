module serialcontrol(
    input wire clk25,
    input wire rst,
    //Input
    //Control from MMU
    input wire[2:0] ramOp_i,
    input wire mode_i,          /* 0: data; 1: control */
    input wire[7:0] storeData_i,
    //Output
    //Data to MMU
    output wire[31:0] ramData_o,
    //Interrupt
    output wire serialInt_o,
    //Physical circuit
    input wire RxD,
    output wire TxD
    );
	reg[7:0] buffer[0:15];
    reg[3:0] readPos;
    reg[3:0] recvPos;
    wire data_ready;
    wire[7:0] data_receive;
    wire write_busy;
    reg[7:0] ramData;
    wire[3:0] nextRecvPos = (recvPos == 15) ? 0 : recvPos + 1;
    wire[3:0] nextReadPos = (readPos == 15) ? 0 : readPos + 1;
    wire bufferEmpty = (recvPos == readPos);
    wire serialRead = (ramOp_i == `MEM_LW_OP && mode_i == 0);
    wire serialWrite = (ramOp_i == `MEM_SW_OP && mode_i == 0);
    wire[7:0] controlData = {6'h0, ~bufferEmpty, ~write_busy};
    assign ramData_o = {24'h0, mode_i ? controlData : ramData};
    assign serialInt_o = data_ready | !bufferEmpty;
    //Simulation
    always @(posedge clk25) begin
        if (serialWrite) begin
            $write("%c", storeData_i);
        end
    end
    //Receive buffer
    always @(posedge clk25) begin
        if (rst == `Enable) begin
            buffer[0] <= `ZeroByte;
            buffer[1] <= `ZeroByte;
            buffer[2] <= `ZeroByte;
            buffer[3] <= `ZeroByte;
            buffer[4] <= `ZeroByte;
            buffer[5] <= `ZeroByte;
            buffer[6] <= `ZeroByte;
            buffer[7] <= `ZeroByte;
            buffer[8] <= `ZeroByte;
            buffer[9] <= `ZeroByte;
            buffer[10] <= `ZeroByte;
            buffer[11] <= `ZeroByte;
            buffer[12] <= `ZeroByte;
            buffer[13] <= `ZeroByte;
            buffer[14] <= `ZeroByte;
            buffer[15] <= `ZeroByte;
        end else if (data_ready == `Enable) begin
            buffer[recvPos] <= data_receive;
        end
    end
    //Receive pointer
    always @(posedge clk25) begin
        if (rst == `Enable) begin
            recvPos <= 0;
        end else if (data_ready == `Enable) begin
            recvPos <= nextRecvPos;
        end
    end
    //Read pointer
    always @(posedge clk25) begin
        if (rst == `Enable) begin
            readPos <= 0;
        end else if (serialRead && !bufferEmpty) begin
            readPos <= nextReadPos;
        end
    end
    //Data output
    always @(*) begin
        //Data
        ramData = `ZeroByte;
        if (serialRead) begin
            if (!bufferEmpty) begin
                ramData = buffer[readPos];
            end else if (data_ready) begin  //Bypass
                ramData = data_receive;
            end
        end
    end
    localparam clkFrequency = 12500000;  //Clock frequency: 25MHz
//    localparam clkFrequency = 6250000;
    localparam baudRate = 115200;  //Baud Rate: 115.2KHz
    //Transmitter
    async_transmitter #(.ClkFrequency(clkFrequency), .Baud(baudRate)) transmitter(
        .clk(clk25),
        .TxD_start(serialWrite && !write_busy),
        .TxD_data(storeData_i),
        .TxD(TxD),
        .TxD_busy(write_busy)
    );
    //Receiver
    async_receiver #(.ClkFrequency(clkFrequency), .Baud(baudRate)) receiver(
        .clk(clk25),
        .RxD(RxD),
        .RxD_data_ready(data_ready),
        .RxD_data(data_receive)
    );
endmodule