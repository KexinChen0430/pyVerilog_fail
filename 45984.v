module pulls down the SDA bus [i.e. sends an ACK]
  //reg busIsBusy =0;                                                   //An internal signal providing the bus status used to detect start(), stop() events
  wire busIsBusy;
  reg [7:0] addrDataBuff;                                               //8-bit registre holding addr, then reads data in case address matches.
  reg started =0, stopped =0;                                           //two internal registers to capture the start, stop events
  assign busIsBusy= started ^ stopped;                                  //if at any time started bit != to stopped bit, then we have already started a transaction
  reg startId;                                                          //An internal bit used to differentiate two different transactions
  //code body goes here
  always @ (negedge SDA) begin
    if(SCK==1 & !busIsBusy)                                             //Capture the start() event only if the bus was free
      started<=~started;
  end
  always @ (posedge SDA) begin
    if(SCK==1 & busIsBusy) begin                                        //Capture the stop() event only if the bus was already busy
      stopped<=~stopped;
      //startId<=started;
    end
  end
always @ (negedge SCK) begin
  if(busIsBusy) begin
    case(eventCounter)
      initialState:
        eventCounter<=getAddr;                                          //If start() the slave will start reading the serial address from the bus
      isItMe:                                                           //Once the data cycle is done, the slave checks if its being called or other device
        if(addrDataBuff==moduleAddress) begin
          sda_ack<=1;                                                   //If so, send and ack, then the next cycle store the serial data
          eventCounter<=ackSent;
        end
        else begin
          eventCounter<=notMe;                                          //IF not, stay idle till the next time the bus is free and a transaction starts
          startId<=started;
        end
      dataRecv: begin                                                   //Once data is recieved, send an ack, return to the idle state
        sda_ack<=1;
        PWM_INTERFACE<=addrDataBuff;                                    //output the data to the PWM_INTERFACE
        eventCounter<=postSend;
      end
      notMe:                                                            //If not this slave being called, once the last transct. is over and a new one starts, read address
        if(startId!=started)
          eventCounter<=getAddr;
      default: begin                                                    //Otherwise, keep incrementing the eventCounter state register
        sda_ack<=0;
        if(eventCounter==postSend)
          eventCounter<=initialState;
        else if(eventCounter!=notMe)
          eventCounter<=eventCounter+1;
      end
    endcase
  end
end
  always @ (posedge SCK) begin
    if(busIsBusy) begin
      if((eventCounter>initialState &eventCounter<ackSent) | (eventCounter>ackSent &eventCounter<postSend))
        addrDataBuff<={addrDataBuff[6:0],SDA};                        //Put the coming data at the right time
    end
  end
endmodule