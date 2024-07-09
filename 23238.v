module is resetted or baud is changed.
    always @ (BAUD, RST) begin
      if(RST == 1'b1) begin
        baud_rate <= B9600;
      end
      else begin
        case(BAUD)
          4'h0    : baud_rate <= B300;
          4'h1    : baud_rate <= B600;
          4'h2    : baud_rate <= B1200;
          4'h3    : baud_rate <= B2400;
          4'h4    : baud_rate <= B4800;
          4'h5    : baud_rate <= B9600;
          4'h6    : baud_rate <= B19200;
          4'h7    : baud_rate <= B38400;
          4'h8    : baud_rate <= B57600;
          4'h9    : baud_rate <= B115200;
          default : baud_rate <= B9600;
        endcase
      end
    end
    //clock divider
    always @ (posedge CLKIN) begin
      if(RST == 1'b1) begin
        clk_cntr <= 0;
        out_clk <= 0;
      end
      else if(clk_cntr == baud_rate) begin
        clk_cntr <= 0;
        out_clk <= ~out_clk;
      end
      else begin
        clk_cntr <= clk_cntr + 1'b1;
      end
    end
   assign CLKOUT = out_clk;
endmodule