module cycloneiii_mac_sign_reg (
                               clk,
                               d,
                               ena,
                               aclr,
                               q
                              );
    // INPUT PORTS
    input clk;
    input d;
    input ena;
    input aclr;
    // OUTPUT PORTS
    output q;
    // INTERNAL VARIABLES
    reg clk_last_value;
    reg q_tmp;
    reg ena_viol;
    reg d_viol;
    wire enable;
    // DEFAULT VALUES THRO' PULLUPs
    tri1 aclr, ena;
    wire d_ipd;
    wire clk_ipd;
    wire ena_ipd;
    wire aclr_ipd;
    buf (d_ipd, d);
    buf (clk_ipd, clk);
    buf (ena_ipd, ena);
    buf (aclr_ipd, aclr);
    assign enable = (!aclr_ipd) && (ena_ipd);
    specify
        $setuphold (posedge clk &&& enable, d, 0, 0, d_viol) ;
        $setuphold (posedge clk &&& enable, ena, 0, 0, ena_viol) ;
        (posedge clk => (q +: q_tmp)) = 0 ;
        (posedge aclr => (q +: 1'b0)) = 0 ;
    endspecify
    initial
    begin
        clk_last_value <= 'b0;
        q_tmp <= 'b0;
    end
        always @ (clk_ipd or aclr_ipd)
        begin
            if (d_viol == 1'b1 || ena_viol == 1'b1)
            begin
                q_tmp <= 'bX;
            end
            else
            begin
            if (aclr_ipd == 1'b1)
                q_tmp <= 0;
            else if ((clk_ipd == 1'b1) && (clk_last_value == 1'b0))
                if (ena_ipd == 1'b1)
                    q_tmp <= d_ipd;
            end
            clk_last_value <= clk_ipd;
        end
    and (q, q_tmp, 'b1);
endmodule