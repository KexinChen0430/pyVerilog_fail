module hardcopyiii_and2 (
                IN1,
                IN2,
                Y
               );
input IN1;
input IN2;
output Y;
    specify
        (IN1 => Y) = (0, 0);
        (IN2 => Y) = (0, 0);
    endspecify
and (Y, IN1, IN2);
endmodule