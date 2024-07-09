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
            24'h0000FF: begin
              o_wbs_int     <=  0;
            end
            24'h001000: begin
              o_wbs_int     <=  i_wbs_dat[0];
            end
            default: begin
            end
          endcase
        end
        else begin
          //read request
          o_wbs_dat <=  i_wbs_adr;
        end
      o_wbs_ack <= 1;
    end
    end
  end
end
endmodule