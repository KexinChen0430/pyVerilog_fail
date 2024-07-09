module or a submodule
  output  reg         o_wbs_int
  //output              o_wbs_int
);
//Local Parameters
localparam     ADDR_0  = 32'h00000000;
localparam     ADDR_1  = 32'h00000001;
localparam     ADDR_2  = 32'h00000002;
//Local Registers/Wires
//Submodules
//Asynchronous Logic
//Synchronous Logic
always @ (posedge clk) begin
  if (rst) begin
    o_wbs_dat <= 32'h0;
    o_wbs_ack <= 0;
    o_wbs_int <= 0;
  end
  else begin
    //when the master acks our ack, then put our ack down
    if (o_wbs_ack && ~i_wbs_stb)begin
      o_wbs_ack <= 0;
    end
    if (i_wbs_stb && i_wbs_cyc) begin
      //master is requesting somethign
      if (!o_wbs_ack) begin
        if (i_wbs_we) begin
          //write request
          case (i_wbs_adr)
            ADDR_0: begin
              //writing something to address 0
              //do something
              //NOTE THE FOLLOWING LINE IS AN EXAMPLE
              //  THIS IS WHAT THE USER WILL READ FROM ADDRESS 0
              $display("ADDR: %h user wrote %h", i_wbs_adr, i_wbs_dat);
            end
            ADDR_1: begin
              //writing something to address 1
              //do something
              //NOTE THE FOLLOWING LINE IS AN EXAMPLE
              //  THIS IS WHAT THE USER WILL READ FROM ADDRESS 0
              $display("ADDR: %h user wrote %h", i_wbs_adr, i_wbs_dat);
            end
            ADDR_2: begin
              //writing something to address 3
              //do something
              //NOTE THE FOLLOWING LINE IS AN EXAMPLE
              //  THIS IS WHAT THE USER WILL READ FROM ADDRESS 0
              $display("ADDR: %h user wrote %h", i_wbs_adr, i_wbs_dat);
            end
            //add as many ADDR_X you need here
            default: begin
            end
          endcase
        end
        else begin
          //read request
          case (i_wbs_adr)
            ADDR_0: begin
              //reading something from address 0
              //NOTE THE FOLLOWING LINE IS AN EXAMPLE
              //  THIS IS WHAT THE USER WILL READ FROM ADDRESS 0
              $display("user read %h", ADDR_0);
              o_wbs_dat <= ADDR_0;
            end
            ADDR_1: begin
              //reading something from address 1
              //NOTE THE FOLLOWING LINE IS AN EXAMPLE
              //  THIS IS WHAT THE USER WILL READ FROM ADDRESS 0
              $display("user read %h", ADDR_1);
              o_wbs_dat <= ADDR_1;
            end
            ADDR_2: begin
              //reading soething from address 2
              //NOTE THE FOLLOWING LINE IS AN EXAMPLE
              //  THIS IS WHAT THE USER WILL READ FROM ADDRESS 0
              $display("user read %h", ADDR_2);
              o_wbs_dat <= ADDR_2;
            end
            //add as many ADDR_X you need here
            default: begin
            end
          endcase
        end
      o_wbs_ack <= 1;
    end
    end
  end
end
endmodule