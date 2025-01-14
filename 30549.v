module pairing(clk, reset, sel, addr, w, update, ready, i, o, done);
   input clk;
   input reset; // for the arithmethic core
   input sel;
   input [5:0] addr;
   input w;
   input update; // update reg_in & reg_out
   input ready;  // shift reg_in & reg_out
   input i;
   output o;
   output done;
   reg [`WIDTH_D0:0] reg_in, reg_out;
   wire [`WIDTH_D0:0] out;
   assign o = reg_out[0];
   tiny
      tiny0 (clk, reset, sel, addr, w, reg_in, out, done);
   always @ (posedge clk) // write LSB firstly
      if (update) reg_in <= 0;
      else if (ready) reg_in <= {i,reg_in[`WIDTH_D0:1]};
   always @ (posedge clk) // read LSB firstly
      if (update) reg_out <= out;
      else if (ready) reg_out <= reg_out>>1;
endmodule