module unary_select_pair (sel_a, sel_b, data_in, selected_bit);
   parameter input_port = 0; // from 'input_port' to 'sel_a' output port
   parameter WA = 5; //trunk number
   parameter WB = 2; //max. number of links per trunk
   parameter integer links[WA][2] = '{'{2,2}, '{2,2}, '{2,2}, '{2,2}, '{2,2} };
   input [WA-1:0] sel_a;
   input [WB-1:0] sel_b;
   input [WA*WB-1:0] data_in;
   output selected_bit;
   integer i,j;
   logic [WA*WB-1:0]  selected;
    always_comb begin
    selected = '0;
    for (i=0; i<WA; i=i+1)
      for (j=0; j<links[i][OUT]; j=j+1)
        selected[i*WB+j] = (LAG_route_valid_turn(input_port, i)) ?
				      data_in[i*WB+j] & sel_a[i] & sel_b[j] : 1'b0;
    end //always_comb
   assign selected_bit=|selected;
endmodule