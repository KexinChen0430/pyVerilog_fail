module t (
    input  wire CLK
	  );
    foo #(.WIDTH (1)) foo1 (.*);
    foo #(.WIDTH (7)) foo7 (.*);
    foo #(.WIDTH (8)) foo8 (.*);
    foo #(.WIDTH (32)) foo32 (.*);
    foo #(.WIDTH (33)) foo33 (.*);
    foo #(.WIDTH (40)) foo40 (.*);
    foo #(.WIDTH (41)) foo41 (.*);
    foo #(.WIDTH (64)) foo64 (.*);
    foo #(.WIDTH (65)) foo65 (.*);
    foo #(.WIDTH (96)) foo96 (.*);
    foo #(.WIDTH (97)) foo97 (.*);
    foo #(.WIDTH (128)) foo128 (.*);
    foo #(.WIDTH (256)) foo256 (.*);
    foo #(.WIDTH (1024)) foo1024 (.*);
    bar #(.WIDTH (1024)) bar1024 (.*);
endmodule