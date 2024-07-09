module test_mulAddRecFN#(parameter expWidth = 3, parameter sigWidth = 3);
    /*------------------------------------------------------------------------
    parameter maxNumErrors = 20;
    /*------------------------------------------------------------------------
    localparam formatWidth = expWidth + sigWidth;
    /*------------------------------------------------------------------------
    reg [(`floatControlWidth - 1):0] control;
    reg [2:0] roundingMode;
    reg [(formatWidth - 1):0] a, b, c, expectOut;
    reg [4:0] expectExceptionFlags;
    /*------------------------------------------------------------------------
    wire [formatWidth:0] recA, recB, recC, recExpectOut;
    fNToRecFN#(expWidth, sigWidth) fNToRecFN_a(a, recA);
    fNToRecFN#(expWidth, sigWidth) fNToRecFN_b(b, recB);
    fNToRecFN#(expWidth, sigWidth) fNToRecFN_c(c, recC);
    fNToRecFN#(expWidth, sigWidth)
        fNToRecFN_expectOut(expectOut, recExpectOut);
    /*------------------------------------------------------------------------
    wire [formatWidth:0] recOut;
    wire [4:0] exceptionFlags;
    reg int_mul;
    integer i;
    wire [expWidth + sigWidth-1:0] out_imul;
    mulAddRecFN#(expWidth, sigWidth)
        mulAddRecFN(
            control,
            {int_mul, 2'b00},
            recA,
            recB,
            recC,
            roundingMode,
            recOut,
            exceptionFlags,
            out_imul
        );
    /*------------------------------------------------------------------------
    wire sameOut;
    sameRecFN#(expWidth, sigWidth) sameRecFN(recOut, recExpectOut, sameOut);
    /*------------------------------------------------------------------------
    integer errorCount, count, partialCount;
    initial begin
        errorCount = 0;
        // We generate 1000 examples to test the function.
        int_mul = 1'b1;
        begin:int_loop
            for(i = 0; i < 1000; i = i + 1) begin
                a = $random;
                b = $random;
                if(out_imul != a * b)begin
                    errorCount = errorCount + 1;
                    if (errorCount == maxNumErrors) disable int_loop;
                end
            end
        end
        int_mul = 1'b0;
        $fwrite('h80000002, "Testing Integer Multiply Done. Error: %d\n", errorCount);
        /*--------------------------------------------------------------------
        $fwrite('h80000002, "Testing 'mulAddRecF%0d'", formatWidth);
        if ($fscanf('h80000000, "%h %h", control, roundingMode) < 2) begin
            $fdisplay('h80000002, ".\n--> Invalid test-cases input.");
            `finish_fail;
        end
        $fdisplay(
            'h80000002,
            ", control %H, rounding mode %0d:",
            control,
            roundingMode
        );
        /*--------------------------------------------------------------------
        count = 0;
        partialCount = 0;
        begin :TestLoop
            while (
                $fscanf(
                    'h80000000,
                    "%h %h %h %h %h",
                    a,
                    b,
                    c,
                    expectOut,
                    expectExceptionFlags
                ) == 5
            ) begin
                #1;
                partialCount = partialCount + 1;
                if (partialCount == 10000) begin
                    count = count + 10000;
                    $fdisplay('h80000002, "%0d...", count);
                    partialCount = 0;
                end
                if (
                    !sameOut || (exceptionFlags !== expectExceptionFlags)
                ) begin
                    if (errorCount == 0) begin
                        $display(
             "Errors found in 'mulAddRecF%0d', control %H, rounding mode %0d:",
                            formatWidth,
                            control,
                            roundingMode
                        );
                    end
                    $write("%H %H", recA, recB);
                    if (formatWidth > 64) begin
                        $write("\n\t");
                    end else begin
                        $write(" ");
                    end
                    $write("%H", recC);
                    if (formatWidth > 64) begin
                        $write("\n\t");
                    end else begin
                        $write("  ");
                    end
                    $write("=> %H %H", recOut, exceptionFlags);
                    if (formatWidth > 32) begin
                        $write("\n\t");
                    end else begin
                        $write("  ");
                    end
                    $display(
                        "expected %H %H", recExpectOut, expectExceptionFlags);
                    errorCount = errorCount + 1;
                    if (errorCount == maxNumErrors) disable TestLoop;
                end
                #1;
            end
        end
        count = count + partialCount;
        /*--------------------------------------------------------------------
        if (errorCount) begin
            $fdisplay(
                'h80000002,
                "--> In %0d tests, %0d errors found.",
                count,
                errorCount
            );
            `finish_fail;
        end else if (count == 0) begin
            $fdisplay('h80000002, "--> Invalid test-cases input.");
            `finish_fail;
        end else begin
            $display(
"In %0d tests, no errors found in 'mulAddRecF%0d', control %H, rounding mode %0d.",
                count,
                formatWidth,
                control,
                roundingMode
            );
        end
        /*--------------------------------------------------------------------
        $finish;
    end
endmodule