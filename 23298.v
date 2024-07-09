module file (/*AUTOARG*/
   // Outputs
   b, c, d,
   // Inputs
   crc
   );
   input [31:0]        crc;
`ifdef ISOLATE
   output reg [31:0]   b /* verilator isolate_assignments*/;
`else
   output reg [31:0]   b;
`endif
   output reg [31:0]   c;
   output reg [31:0]   d;
   always @* begin
      // Note that while c and b depend on crc, b doesn't depend on c.
      casez (crc[3:0])
        4'b??01: begin
           b = {crc[15:0],get_31_16(crc)};
           d = c;
        end
        4'b??00: begin
           b = {crc[15:0],~crc[31:16]};
           d = {crc[15:0],~c[31:16]};
        end
        default: begin
           set_b_d(crc, c);
        end
      endcase
   end
   function [31:16] get_31_16   /* verilator isolate_assignments*/;
      input [31:0] t_crc        /* verilator isolate_assignments*/;
      get_31_16 = t_crc[31:16];
   endfunction
   task set_b_d;
`ifdef ISOLATE
      input [31:0] t_crc        /* verilator isolate_assignments*/;
      input [31:0] t_c          /* verilator isolate_assignments*/;
`else
      input [31:0] t_crc;
      input [31:0] t_c;
`endif
      begin
         b = {t_crc[31:16],~t_crc[23:8]};
         d = {t_crc[31:16],  ~t_c[23:8]};
      end
   endtask
   always @* begin
      // Any complicated equation we can't optimize
      casez (crc[3:0])
        4'b00??: begin
           c = {b[29:0],2'b11};
        end
        4'b01??: begin
           c = {b[30:1],2'b01};
        end
        4'b10??: begin
           c = {b[31:2],2'b10};
        end
        4'b11??: begin
           c = {b[31:2],2'b00};
        end
      endcase
   end
endmodule