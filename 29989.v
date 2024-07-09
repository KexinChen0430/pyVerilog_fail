module {name} (
input  [11:0] address,
output [17:0] instruction,
input         enable,
input         clk );
wire [17:0] rom_value;
genvar i;
generate
  for (i = 0; i <= 17; i = i+1)
  begin : instruction_bit
    FDRE kcpsm6_rom_flop ( .D    (rom_value[i]),
                         .Q    (instruction[i]),
                         .CE   (enable),
                         .R   (address[7+(i/4)]),
                         .C    (clk));
  end
endgenerate
ROM128X1
#( .INIT (256'h{INIT128_0}))
kcpsm6_rom0( .A0   (address[0]),
             .A1   (address[1]),
             .A2   (address[2]),
             .A3   (address[3]),
             .A4   (address[4]),
             .A5   (address[5]),
             .A6   (address[6]),
             .O    (rom_value[0]));
ROM128X1
#( .INIT (256'h{INIT128_1}))
kcpsm6_rom1( .A0   (address[0]),
             .A1   (address[1]),
             .A2   (address[2]),
             .A3   (address[3]),
             .A4   (address[4]),
             .A5   (address[5]),
             .A6   (address[6]),
              .O   (rom_value[1]));
ROM128X1
#( .INIT (256'h{INIT128_2}))
kcpsm6_rom2( .A0   (address[0]),
             .A1   (address[1]),
             .A2   (address[2]),
             .A3   (address[3]),
             .A4   (address[4]),
             .A5   (address[5]),
             .A6   (address[6]),
              .O   (rom_value[2]));
ROM128X1
#( .INIT (256'h{INIT128_3}))
kcpsm6_rom3( .A0   (address[0]),
             .A1   (address[1]),
             .A2   (address[2]),
             .A3   (address[3]),
             .A4   (address[4]),
             .A5   (address[5]),
             .A6   (address[6]),
              .O   (rom_value[3]));
ROM128X1
#( .INIT (256'h{INIT128_4}))
kcpsm6_rom4( .A0   (address[0]),
             .A1   (address[1]),
             .A2   (address[2]),
             .A3   (address[3]),
             .A4   (address[4]),
             .A5   (address[5]),
             .A6   (address[6]),
              .O   (rom_value[4]));
ROM128X1
#( .INIT (256'h{INIT128_5}))
kcpsm6_rom5( .A0   (address[0]),
             .A1   (address[1]),
             .A2   (address[2]),
             .A3   (address[3]),
             .A4   (address[4]),
             .A5   (address[5]),
             .A6   (address[6]),
              .O   (rom_value[5]));
ROM128X1
#( .INIT (256'h{INIT128_6}))
kcpsm6_rom6( .A0   (address[0]),
             .A1   (address[1]),
             .A2   (address[2]),
             .A3   (address[3]),
             .A4   (address[4]),
             .A5   (address[5]),
             .A6   (address[6]),
              .O   (rom_value[6]));
ROM128X1
#( .INIT (256'h{INIT128_7}))
kcpsm6_rom7( .A0   (address[0]),
             .A1   (address[1]),
             .A2   (address[2]),
             .A3   (address[3]),
             .A4   (address[4]),
             .A5   (address[5]),
             .A6   (address[6]),
              .O   (rom_value[7]));
ROM128X1
#( .INIT (256'h{INIT128_8}))
kcpsm6_rom8( .A0   (address[0]),
             .A1   (address[1]),
             .A2   (address[2]),
             .A3   (address[3]),
             .A4   (address[4]),
             .A5   (address[5]),
             .A6   (address[6]),
              .O   (rom_value[8]));
ROM128X1
#( .INIT (256'h{INIT128_9}))
kcpsm6_rom9( .A0   (address[0]),
             .A1   (address[1]),
             .A2   (address[2]),
             .A3   (address[3]),
             .A4   (address[4]),
             .A5   (address[5]),
             .A6   (address[6]),
              .O   (rom_value[9]));
ROM128X1
#( .INIT (256'h{INIT128_10}))
kcpsm6_rom10( .A0   (address[0]),
              .A1   (address[1]),
              .A2   (address[2]),
              .A3   (address[3]),
              .A4   (address[4]),
              .A5   (address[5]),
              .A6   (address[6]),
               .O   (rom_value[10]));
ROM128X1
#( .INIT (256'h{INIT128_11}))
kcpsm6_rom11( .A0   (address[0]),
              .A1   (address[1]),
              .A2   (address[2]),
              .A3   (address[3]),
              .A4   (address[4]),
              .A5   (address[5]),
              .A6   (address[6]),
               .O   (rom_value[11]));
ROM128X1
#( .INIT (256'h{INIT128_12}))
kcpsm6_rom12( .A0   (address[0]),
              .A1   (address[1]),
              .A2   (address[2]),
              .A3   (address[3]),
              .A4   (address[4]),
              .A5   (address[5]),
              .A6   (address[6]),
               .O   (rom_value[12]));
ROM128X1
#( .INIT (256'h{INIT128_13}))
kcpsm6_rom13( .A0   (address[0]),
              .A1   (address[1]),
              .A2   (address[2]),
              .A3   (address[3]),
              .A4   (address[4]),
              .A5   (address[5]),
              .A6   (address[6]),
               .O   (rom_value[13]));
ROM128X1
#( .INIT (256'h{INIT128_14}))
kcpsm6_rom14( .A0   (address[0]),
              .A1   (address[1]),
              .A2   (address[2]),
              .A3   (address[3]),
              .A4   (address[4]),
              .A5   (address[5]),
              .A6   (address[6]),
               .O   (rom_value[14]));
ROM128X1
#( .INIT (256'h{INIT128_15}))
kcpsm6_rom15( .A0   (address[0]),
              .A1   (address[1]),
              .A2   (address[2]),
              .A3   (address[3]),
              .A4   (address[4]),
              .A5   (address[5]),
              .A6   (address[6]),
               .O   (rom_value[15]));
ROM128X1
#( .INIT (256'h{INIT128_16}))
kcpsm6_rom16( .A0   (address[0]),
              .A1   (address[1]),
              .A2   (address[2]),
              .A3   (address[3]),
              .A4   (address[4]),
              .A5   (address[5]),
              .A6   (address[6]),
               .O   (rom_value[16]));
ROM128X1
#( .INIT (256'h{INIT128_17}))
kcpsm6_rom17( .A0   (address[0]),
              .A1   (address[1]),
              .A2   (address[2]),
              .A3   (address[3]),
              .A4   (address[4]),
              .A5   (address[5]),
              .A6   (address[6]),
               .O   (rom_value[17]));
endmodule