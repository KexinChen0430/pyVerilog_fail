module stratixiigx_lvds_reg (q,
                clk,
                ena,
                d,
                clrn,
                prn
               );
    // INPUT PORTS
    input d;
    input clk;
    input clrn;
    input prn;
    input ena;
    // OUTPUT PORTS
    output q;
    // BUFFER INPUTS
    wire clk_in;
    wire ena_in;
    wire d_in;
    buf (clk_in, clk);
    buf (ena_in, ena);
    buf (d_in, d);
    // INTERNAL VARIABLES
    reg q_tmp;
    wire q_wire;
    // TIMING PATHS
    specify
       (posedge clk => (q +: q_tmp)) = (0, 0);
       (negedge clrn => (q +: q_tmp)) = (0, 0);
       (negedge prn => (q +: q_tmp)) = (0, 0);
    endspecify
    // DEFAULT VALUES THRO' PULLUPs
    tri1 prn, clrn, ena;
    initial q_tmp = 0;
    always @ (posedge clk_in or negedge clrn or negedge prn )
    begin
        if (prn == 1'b0)
            q_tmp <= 1;
        else if (clrn == 1'b0)
            q_tmp <= 0;
        else if ((clk_in == 1) & (ena_in == 1'b1))
            q_tmp <= d_in;
    end
    assign q_wire = q_tmp;
    and (q, q_wire, 1'b1);
endmodule