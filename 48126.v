module dot_product_core (
  clk, en, arst_n, input_a_rsc_mgc_in_wire_d, input_b_rsc_mgc_in_wire_d, output_rsc_mgc_out_stdreg_d
);
  input clk;
  input en;
  input arst_n;
  input [7:0] input_a_rsc_mgc_in_wire_d;
  input [7:0] input_b_rsc_mgc_in_wire_d;
  output [7:0] output_rsc_mgc_out_stdreg_d;
  reg [7:0] output_rsc_mgc_out_stdreg_d;
  // Interconnect Declarations for Component Instantiations
  always @(*)
  begin : core
    // Interconnect Declarations
    reg exit_MAC_lpi;
    reg [7:0] acc_sva_1;
    reg [2:0] i_1_sva_1;
    reg exit_MAC_sva;
    begin : mainExit
      forever begin : main
        // C-Step 0 of Loop 'main'
        begin : waitLoop0Exit
          forever begin : waitLoop0
            @(posedge clk or negedge ( arst_n ));
            if ( ~ arst_n )
              disable mainExit;
            if ( en )
              disable waitLoop0Exit;
          end
        end
        // C-Step 1 of Loop 'main'
        acc_sva_1 = (acc_sva_1 & (signext_8_1(~ exit_MAC_lpi))) + conv_s2s_16_8(input_a_rsc_mgc_in_wire_d
        i_1_sva_1 = (i_1_sva_1 & (signext_3_1(~ exit_MAC_lpi))) + 3'b1;
        exit_MAC_sva = ~ (readslicef_4_1_3((conv_u2s_3_4(i_1_sva_1) + 4'b1011)));
        if ( exit_MAC_sva ) begin
          output_rsc_mgc_out_stdreg_d <= acc_sva_1;
        end
        exit_MAC_lpi = exit_MAC_sva;
      end
    end
    exit_MAC_sva = 1'b0;
    i_1_sva_1 = 3'b0;
    acc_sva_1 = 8'b0;
    exit_MAC_lpi = 1'b0;
    output_rsc_mgc_out_stdreg_d <= 8'b0;
    exit_MAC_lpi = 1'b1;
  end
  function [7:0] signext_8_1;
    input [0:0] vector;
  begin
    signext_8_1= {{7{vector[0]}}, vector};
  end
  endfunction
  function [2:0] signext_3_1;
    input [0:0] vector;
  begin
    signext_3_1= {{2{vector[0]}}, vector};
  end
  endfunction
  function [0:0] readslicef_4_1_3;
    input [3:0] vector;
    reg [3:0] tmp;
  begin
    tmp = vector >> 3;
    readslicef_4_1_3 = tmp[0:0];
  end
  endfunction
  function signed [7:0] conv_s2s_16_8 ;
    input signed [15:0]  vector ;
  begin
    conv_s2s_16_8 = vector[7:0];
  end
  endfunction
  function signed [3:0] conv_u2s_3_4 ;
    input [2:0]  vector ;
  begin
    conv_u2s_3_4 = {1'b0, vector};
  end
  endfunction
endmodule