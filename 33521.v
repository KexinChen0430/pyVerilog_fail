module microfono_TB;
reg reset, clk;
reg micData, enable;
microfono uut(.reset(reset),.micData(micData),.clk(clk),.enable(enable));
always
begin
clk =1'b1;
#2;
clk=1'b0;
#2;
end
initial
begin
enable=1'b0;
#10000;
enable =1'b1;
end
initial
begin
reset =1'b1;
#10000;
reset =1'b0;
end
/*initial
begin
rd = 1'b0;
wr = 1'b0;
#10000 wr = 1'b1;
#150000 wr = 1'b0;
#15010 rd = 1'b1;
end
*/
initial begin
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
micData = 1'b0;#64;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b1;#34;
micData = 1'b0;#75;
micData = 1'b1;#80;
micData = 1'b0;#75;
micData = 1'b0;#450;
micData = 1'b1;#100;
end
initial begin: TEST_CASE
     $dumpfile("microfono_TB.vcd");
     $dumpvars(-1, uut);
     #(1000000) $finish;
   end
endmodule