module alu(res, opra, oprb, cin, cout, zout, sout, parity, auxcar, sel);
   input  [7:0] opra;   // Input A
   input  [7:0] oprb;   // Input B
   input        cin;    // Carry in
   output       cout;   // Carry out
   output       zout;   // Zero out
   output       sout;   // Sign out
   output       parity; // parity
   output       auxcar; // auxiliary carry
   input  [2:0] sel;    // Operation select
   output [7:0] res;    // Result of alu operation
   reg       cout;   // Carry out
   reg       zout;   // Zero out
   reg       sout;   // sign out
   reg       parity; // parity
   reg       auxcar; // auxiliary carry
   reg [7:0] resi;   // Result of alu operation intermediate
   reg [7:0] res;    // Result of alu operation
   always @(opra, oprb, cin, sel, res, resi) begin
      case (sel)
         `aluop_add: begin // add
            { cout, resi } = opra+oprb; // find result and carry
            // find auxiliary carry
            auxcar = (((opra[3:0]+oprb[3:0]) >> 4) & 8'b1) ? 1'b1 : 1'b0;
         end
         `aluop_adc: begin // adc
            { cout, resi } = opra+oprb+cin; // find result and carry
            // find auxiliary carry
            auxcar = (((opra[3:0]+oprb[3:0]+cin) >> 4) & 8'b1) ? 1'b1 : 1'b0;
         end
         `aluop_sub, `aluop_cmp: begin // sub/cmp
            { cout, resi } = opra-oprb; // find result and carry
            // find auxiliary borrow
            auxcar = (((opra[3:0]-oprb[3:0]) >> 4) & 8'b1) ? 1'b1 : 1'b0;
         end
         `aluop_sbb: begin // sbb
            { cout, resi } = opra-oprb-cin; // find result and carry
            // find auxiliary borrow
            auxcar = (((opra[3:0]-oprb[3:0]-cin >> 4)) & 8'b1) ? 1'b1 : 1'b0;
         end
         `aluop_and: begin // ana
            { cout, resi } = {1'b0, opra&oprb}; // find result and carry
            auxcar = 1'b0; // clear auxillary carry
          end
         `aluop_xor: begin // xra
            { cout, resi } = {1'b0, opra^oprb}; // find result and carry
            auxcar = 1'b0; // clear auxillary carry
         end
         `aluop_or:  begin // ora
            { cout, resi } = {1'b0, opra|oprb}; // find result and carry
            auxcar = 1'b0; // clear auxillary carry
         end
      endcase
      if (sel != `aluop_cmp) res = resi; else res = opra;
      zout <= ~|resi; // set zero flag from result
      sout <= resi[7]; // set sign flag from result
      parity <= ~^resi; // set parity flag from result
   end
endmodule