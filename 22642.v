module hardcopyiii_ena_reg (
                clk,
                ena,
                d,
                clrn,
                prn,
                q
               );
// INPUT PORTS
input d;
input clk;
input clrn;
input prn;
input ena;
// OUTPUT PORTS
output q;
// INTERNAL VARIABLES
reg q_tmp;
reg violation;
reg d_viol;
reg clk_last_value;
wire reset;
// DEFAULT VALUES THRO' PULLUPs
tri1 prn, clrn, ena;
assign reset = (!clrn) && (ena);
specify
    $setuphold (posedge clk &&& reset, d, 0, 0, d_viol) ;
    (posedge clk => (q +: q_tmp)) = 0 ;
endspecify
initial
begin
    q_tmp = 'b1;
    violation = 'b0;
    clk_last_value = clk;
end
    always @ (clk or negedge clrn or negedge prn )
    begin
        if (d_viol == 1'b1)
        begin
            violation = 1'b0;
            q_tmp <= 'bX;
        end
        else
        if (prn == 1'b0)
            q_tmp <= 1;
        else if (clrn == 1'b0)
            q_tmp <= 0;
        else if ((clk_last_value === 'b0) & (clk === 1'b1) & (ena == 1'b1))
            q_tmp <= d;
        clk_last_value = clk;
    end
and (q, q_tmp, 1'b1);
endmodule