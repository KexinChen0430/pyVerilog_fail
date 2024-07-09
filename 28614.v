module stratixii_and1 (Y, IN1);
   input IN1;
   output Y;
   specify
      (IN1 => Y) = (0, 0);
   endspecify
   buf (Y, IN1);
endmodule