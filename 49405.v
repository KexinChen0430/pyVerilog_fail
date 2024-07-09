module Problem4(
    input A,
    input B,
    input GTI,
    input LTI,
    input EQI,
    output reg GTO,
    output reg LTO,
    output reg EQO
    );
    always @ (A or B or GTI or LTI or EQI) // sensitivity list
    begin
        if ( A > B )
            begin
            GTO = 1;
            LTO = 0;
            EQO = 0;
            end
        else if ( A < B ) // Change value to Less than
            begin
            LTO = 1;
            GTO = 0;
            EQO = 0;
            end
        else    // Stay the Same
            begin
            EQO = EQI;
            GTO = GTI;
            LTO = LTI;
            end
    end
endmodule