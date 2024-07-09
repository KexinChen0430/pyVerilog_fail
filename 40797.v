module char_rom (clk, rst, cs, we, addr, rdata, wdata);
  // IO Ports
  input clk;
  input rst;
  input cs;
  input we;
  input [11:0] addr;
  output [7:0] rdata;
  input [7:0] wdata;
  // Net declarations
  wire dp0, dp1;
  wire [7:0] rdata1, rdata0;
  // Module instantiations
  RAMB16_S9 rom0 (.DO(rdata0),
                  .DOP (dp0),
                  .ADDR (addr[10:0]),
                  .CLK (clk),
                  .DI (wdata),
                  .DIP (dp0),
                  .EN (cs),
                  .SSR (rst),
                  .WE (we));
  RAMB16_S9 rom1 (.DO(rdata1),
                  .DOP (dp1),
                  .ADDR (addr[10:0]),
                  .CLK (clk),
                  .DI (wdata),
                  .DIP (dp1),
                  .EN (cs),
                  .SSR (rst),
                  .WE (we));
    defparam rom0.INIT_00 = 256'h000000007E818199A58181A5817E0000_00000000000000000000000000000000; // 01() 00( )
    defparam rom0.INIT_01 = 256'h0000000010387CFEFEFEFE6C00000000_000000007EFFFFE7DBFFFFDBFF7E0000; // 03() 02()
    defparam rom0.INIT_02 = 256'h000000003C1818E7E7E73C3C18000000_000000000010387CFE7C381000000000; // 05() 04()
    defparam rom0.INIT_03 = 256'h000000000000183C3C18000000000000_000000003C18187EFFFF7E3C18000000; // 07() 06()
    defparam rom0.INIT_04 = 256'h00000000003C664242663C0000000000_FFFFFFFFFFFFE7C3C3E7FFFFFFFFFFFF; // 09(	) 08()
    defparam rom0.INIT_05 = 256'h0000000078CCCCCCCC781A0E061E0000_FFFFFFFFFFC399BDBD99C3FFFFFFFFFF; // 0b() 0a()
    defparam rom0.INIT_06 = 256'h00000000E0F070303030303F333F0000_0000000018187E183C666666663C0000; // 0d() 0c()
    defparam rom0.INIT_07 = 256'h000000001818DB3CE73CDB1818000000_000000C0E6E767636363637F637F0000; // 0f() 0e()
    defparam rom0.INIT_08 = 256'h0000000002060E1E3EFE3E1E0E060200_0000000080C0E0F0F8FEF8F0E0C08000; // 11() 10()
    defparam rom0.INIT_09 = 256'h00000000666600666666666666660000_0000000000183C7E1818187E3C180000; // 13() 12()
    defparam rom0.INIT_0A = 256'h0000007CC60C386CC6C66C3860C67C00_000000001B1B1B1B1B7BDBDBDB7F0000; // 15() 14()
    defparam rom0.INIT_0B = 256'h000000007E183C7E1818187E3C180000_00000000FEFEFEFE0000000000000000; // 17() 16()
    defparam rom0.INIT_0C = 256'h00000000183C7E181818181818180000_00000000181818181818187E3C180000; // 19() 18()
    defparam rom0.INIT_0D = 256'h0000000000003060FE60300000000000_000000000000180CFE0C180000000000; // 1b() 1a()
    defparam rom0.INIT_0E = 256'h000000000000286CFE6C280000000000_000000000000FEC0C0C0000000000000; // 1d() 1c()
    defparam rom0.INIT_0F = 256'h00000000001038387C7CFEFE00000000_0000000000FEFE7C7C38381000000000; // 1f() 1e()
    defparam rom0.INIT_10 = 256'h000000001818001818183C3C3C180000_00000000000000000000000000000000; // 21(!) 20( )
    defparam rom0.INIT_11 = 256'h000000006C6CFE6C6C6CFE6C6C000000_00000000000000000000002466666600; // 23(#) 22(")
    defparam rom0.INIT_12 = 256'h0000000086C66030180CC6C200000000_000018187CC68606067CC0C2C67C1818; // 25(%) 24($)
    defparam rom0.INIT_13 = 256'h00000000000000000000006030303000_0000000076CCCCCCDC76386C6C380000; // 27(') 26(&)
    defparam rom0.INIT_14 = 256'h0000000030180C0C0C0C0C0C18300000_000000000C18303030303030180C0000; // 29()) 28(()
    defparam rom0.INIT_15 = 256'h00000000000018187E18180000000000_000000000000663CFF3C660000000000; // 2b(+) 2a(*)
    defparam rom0.INIT_16 = 256'h0000000000000000FE00000000000000_00000030181818000000000000000000; // 2d(-) 2c(,)
    defparam rom0.INIT_17 = 256'h0000000080C06030180C060200000000_00000000181800000000000000000000; // 2f(/) 2e(.)
    defparam rom0.INIT_18 = 256'h000000007E1818181818187838180000_00000000386CC6C6D6D6C6C66C380000; // 31(1) 30(0)
    defparam rom0.INIT_19 = 256'h000000007CC60606063C0606C67C0000_00000000FEC6C06030180C06C67C0000; // 33(3) 32(2)
    defparam rom0.INIT_1A = 256'h000000007CC6060606FCC0C0C0FE0000_000000001E0C0C0CFECC6C3C1C0C0000; // 35(5) 34(4)
    defparam rom0.INIT_1B = 256'h0000000030303030180C0606C6FE0000_000000007CC6C6C6C6FCC0C060380000; // 37(7) 36(6)
    defparam rom0.INIT_1C = 256'h00000000780C0606067EC6C6C67C0000_000000007CC6C6C6C67CC6C6C67C0000; // 39(9) 38(8)
    defparam rom0.INIT_1D = 256'h00000000301818000000181800000000_00000000001818000000181800000000; // 3b(;) 3a(:)
    defparam rom0.INIT_1E = 256'h000000000000007E00007E0000000000_00000000060C18306030180C06000000; // 3d(=) 3c(<)
    defparam rom0.INIT_1F = 256'h000000001818001818180CC6C67C0000_000000006030180C060C183060000000; // 3f(?) 3e(>)
    defparam rom0.INIT_20 = 256'h00000000C6C6C6C6FEC6C66C38100000_000000007CC0DCDEDEDEC6C67C000000; // 41(A) 40(@)
    defparam rom0.INIT_21 = 256'h000000003C66C2C0C0C0C0C2663C0000_00000000FC666666667C666666FC0000; // 43(C) 42(B)
    defparam rom0.INIT_22 = 256'h00000000FE6662606878686266FE0000_00000000F86C6666666666666CF80000; // 45(E) 44(D)
    defparam rom0.INIT_23 = 256'h000000003A66C6C6DEC0C0C2663C0000_00000000F06060606878686266FE0000; // 47(G) 46(F)
    defparam rom0.INIT_24 = 256'h000000003C18181818181818183C0000_00000000C6C6C6C6C6FEC6C6C6C60000; // 49(I) 48(H)
    defparam rom0.INIT_25 = 256'h00000000E666666C78786C6666E60000_0000000078CCCCCC0C0C0C0C0C1E0000; // 4b(K) 4a(J)
    defparam rom0.INIT_26 = 256'h00000000C6C6C6C6C6D6FEFEEEC60000_00000000FE6662606060606060F00000; // 4d(M) 4c(L)
    defparam rom0.INIT_27 = 256'h000000007CC6C6C6C6C6C6C6C67C0000_00000000C6C6C6C6CEDEFEF6E6C60000; // 4f(O) 4e(N)
    defparam rom0.INIT_28 = 256'h00000E0C7CDED6C6C6C6C6C6C67C0000_00000000F0606060607C666666FC0000; // 51(Q) 50(P)
    defparam rom0.INIT_29 = 256'h000000007CC6C6060C3860C6C67C0000_00000000E66666666C7C666666FC0000; // 53(S) 52(R)
    defparam rom0.INIT_2A = 256'h000000007CC6C6C6C6C6C6C6C6C60000_000000003C1818181818185A7E7E0000; // 55(U) 54(T)
    defparam rom0.INIT_2B = 256'h000000006CEEFED6D6D6C6C6C6C60000_0000000010386CC6C6C6C6C6C6C60000; // 57(W) 56(V)
    defparam rom0.INIT_2C = 256'h000000003C181818183C666666660000_00000000C6C66C7C38387C6CC6C60000; // 59(Y) 58(X)
    defparam rom0.INIT_2D = 256'h000000003C30303030303030303C0000_00000000FEC6C26030180C86C6FE0000; // 5b([) 5a(Z)
    defparam rom0.INIT_2E = 256'h000000003C0C0C0C0C0C0C0C0C3C0000_0000000002060E1C3870E0C080000000; // 5d(]) 5c(\)
    defparam rom0.INIT_2F = 256'h0000FF00000000000000000000000000_000000000000000000000000C66C3810; // 5f(_) 5e(^)
    defparam rom0.INIT_30 = 256'h0000000076CCCCCC7C0C780000000000_00000000000000000000000000183030; // 61(a) 60(`)
    defparam rom0.INIT_31 = 256'h000000007CC6C0C0C0C67C0000000000_000000007C666666666C786060E00000; // 63(c) 62(b)
    defparam rom0.INIT_32 = 256'h000000007CC6C0C0FEC67C0000000000_0000000076CCCCCCCC6C3C0C0C1C0000; // 65(e) 64(d)
    defparam rom0.INIT_33 = 256'h0078CC0C7CCCCCCCCCCC760000000000_00000000F060606060F060646C380000; // 67(g) 66(f)
    defparam rom0.INIT_34 = 256'h000000003C1818181818380018180000_00000000E666666666766C6060E00000; // 69(i) 68(h)
    defparam rom0.INIT_35 = 256'h00000000E6666C78786C666060E00000_003C66660606060606060E0006060000; // 6b(k) 6a(j)
    defparam rom0.INIT_36 = 256'h00000000C6D6D6D6D6FEEC0000000000_000000003C1818181818181818380000; // 6d(m) 6c(l)
    defparam rom0.INIT_37 = 256'h000000007CC6C6C6C6C67C0000000000_00000000666666666666DC0000000000; // 6f(o) 6e(n)
    defparam rom0.INIT_38 = 256'h001E0C0C7CCCCCCCCCCC760000000000_00F060607C6666666666DC0000000000; // 71(q) 70(p)
    defparam rom0.INIT_39 = 256'h000000007CC60C3860C67C0000000000_00000000F06060606676DC0000000000; // 73(s) 72(r)
    defparam rom0.INIT_3A = 256'h0000000076CCCCCCCCCCCC0000000000_000000001C3630303030FC3030100000; // 75(u) 74(t)
    defparam rom0.INIT_3B = 256'h000000006CFED6D6D6C6C60000000000_00000000183C66666666660000000000; // 77(w) 76(v)
    defparam rom0.INIT_3C = 256'h00F80C067EC6C6C6C6C6C60000000000_00000000C66C3838386CC60000000000; // 79(y) 78(x)
    defparam rom0.INIT_3D = 256'h000000000E18181818701818180E0000_00000000FEC6603018CCFE0000000000; // 7b({) 7a(z)
    defparam rom0.INIT_3E = 256'h0000000070181818180E181818700000_00000000181818181800181818180000; // 7d(}) 7c(|)
    defparam rom0.INIT_3F = 256'h0000000000FEC6C6C66C381000000000_000000000000000000000000DC760000; // 7f() 7e(~)
    defparam rom1.INIT_00 = 256'h0000000076CCCCCCCCCCCC0000CC0000_00007C060C3C66C2C0C0C0C2663C0000; // 81(�) 80(�)
    defparam rom1.INIT_01 = 256'h0000000076CCCCCC7C0C78006C381000_000000007CC6C0C0FEC67C0030180C00; // 83(�) 82(�)
    defparam rom1.INIT_02 = 256'h0000000076CCCCCC7C0C780018306000_0000000076CCCCCC7C0C780000CC0000; // 85(�) 84(�)
    defparam rom1.INIT_03 = 256'h0000003C060C3C666060663C00000000_0000000076CCCCCC7C0C7800386C3800; // 87(�) 86(�)
    defparam rom1.INIT_04 = 256'h000000007CC6C0C0FEC67C0000C60000_000000007CC6C0C0FEC67C006C381000; // 89(�) 88(�)
    defparam rom1.INIT_05 = 256'h000000003C1818181818380000660000_000000007CC6C0C0FEC67C0018306000; // 8b(�) 8a(�)
    defparam rom1.INIT_06 = 256'h000000003C1818181818380018306000_000000003C18181818183800663C1800; // 8d(�) 8c(�)
    defparam rom1.INIT_07 = 256'h00000000C6C6C6FEC6C66C3800386C38_00000000C6C6C6FEC6C66C381000C600; // 8f(�) 8e(�)
    defparam rom1.INIT_08 = 256'h000000006ED8D87E3676CC0000000000_00000000FE6660607C6066FE00603018; // 91(�) 90(�)
    defparam rom1.INIT_09 = 256'h000000007CC6C6C6C6C67C006C381000_00000000CECCCCCCCCFECCCC6C3E0000; // 93(�) 92(�)
    defparam rom1.INIT_0A = 256'h000000007CC6C6C6C6C67C0018306000_000000007CC6C6C6C6C67C0000C60000; // 95(�) 94(�)
    defparam rom1.INIT_0B = 256'h0000000076CCCCCCCCCCCC0018306000_0000000076CCCCCCCCCCCC00CC783000; // 97(�) 96(�)
    defparam rom1.INIT_0C = 256'h000000007CC6C6C6C6C6C6C67C00C600_00780C067EC6C6C6C6C6C60000C60000; // 99(�) 98(�)
    defparam rom1.INIT_0D = 256'h0000000018183C66606060663C181800_000000007CC6C6C6C6C6C6C6C600C600; // 9b(�) 9a(�)
    defparam rom1.INIT_0E = 256'h000000001818187E187E183C66660000_00000000FCE660606060F060646C3800; // 9d(�) 9c(�)
    defparam rom1.INIT_0F = 256'h000070D818181818187E1818181B0E00_00000000C6CCCCCCDECCC4F8CCCCF800; // 9f(�) 9e(�)
    defparam rom1.INIT_10 = 256'h000000003C1818181818380030180C00_0000000076CCCCCC7C0C780060301800; // a1(�) a0(�)
    defparam rom1.INIT_11 = 256'h0000000076CCCCCCCCCCCC0060301800_000000007CC6C6C6C6C67C0060301800; // a3(�) a2(�)
    defparam rom1.INIT_12 = 256'h00000000C6C6C6CEDEFEF6E6C600DC76_00000000666666666666DC00DC760000; // a5(�) a4(�)
    defparam rom1.INIT_13 = 256'h0000000000000000007C00386C6C3800_0000000000000000007E003E6C6C3C00; // a7(�) a6(�)
    defparam rom1.INIT_14 = 256'h0000000000C0C0C0C0FE000000000000_000000007CC6C6C06030300030300000; // a9(�) a8(�)
    defparam rom1.INIT_15 = 256'h00003E180C86DC603018CCC6C2C0C000_000000000006060606FE000000000000; // ab(�) aa(�)
    defparam rom1.INIT_16 = 256'h00000000183C3C3C1818180018180000_000006063E9ECE663018CCC6C2C0C000; // ad(�) ac(�)
    defparam rom1.INIT_17 = 256'h000000000000D86C366CD80000000000_000000000000366CD86C360000000000; // af(�) ae(�)
    defparam rom1.INIT_18 = 256'hAA55AA55AA55AA55AA55AA55AA55AA55_44114411441144114411441144114411; // b1(�) b0(�)
    defparam rom1.INIT_19 = 256'h18181818181818181818181818181818_77DD77DD77DD77DD77DD77DD77DD77DD; // b3(�) b2(�)
    defparam rom1.INIT_1A = 256'h1818181818181818F818F81818181818_1818181818181818F818181818181818; // b5(�) b4(�)
    defparam rom1.INIT_1B = 256'h3636363636363636FE00000000000000_3636363636363636F636363636363636; // b7(�) b6(�)
    defparam rom1.INIT_1C = 256'h3636363636363636F606F63636363636_1818181818181818F818F80000000000; // b9(�) b8(�)
    defparam rom1.INIT_1D = 256'h3636363636363636F606FE0000000000_36363636363636363636363636363636; // bb(�) ba(�)
    defparam rom1.INIT_1E = 256'h0000000000000000FE36363636363636_0000000000000000FE06F63636363636; // bd(�) bc(�)
    defparam rom1.INIT_1F = 256'h1818181818181818F800000000000000_0000000000000000F818F81818181818; // bf(�) be(�)
    defparam rom1.INIT_20 = 256'h0000000000000000FF18181818181818_00000000000000001F18181818181818; // c1(�) c0(�)
    defparam rom1.INIT_21 = 256'h18181818181818181F18181818181818_1818181818181818FF00000000000000; // c3(�) c2(�)
    defparam rom1.INIT_22 = 256'h1818181818181818FF18181818181818_0000000000000000FF00000000000000; // c5(�) c4(�)
    defparam rom1.INIT_23 = 256'h36363636363636363736363636363636_18181818181818181F181F1818181818; // c7(�) c6(�)
    defparam rom1.INIT_24 = 256'h363636363636363637303F0000000000_00000000000000003F30373636363636; // c9(�) c8(�)
    defparam rom1.INIT_25 = 256'h3636363636363636F700FF0000000000_0000000000000000FF00F73636363636; // cb(�) ca(�)
    defparam rom1.INIT_26 = 256'h0000000000000000FF00FF0000000000_36363636363636363730373636363636; // cd(�) cc(�)
    defparam rom1.INIT_27 = 256'h0000000000000000FF00FF1818181818_3636363636363636F700F73636363636; // cf(�) ce(�)
    defparam rom1.INIT_28 = 256'h1818181818181818FF00FF0000000000_0000000000000000FF36363636363636; // d1(�) d0(�)
    defparam rom1.INIT_29 = 256'h00000000000000003F36363636363636_3636363636363636FF00000000000000; // d3(�) d2(�)
    defparam rom1.INIT_2A = 256'h18181818181818181F181F0000000000_00000000000000001F181F1818181818; // d5(�) d4(�)
    defparam rom1.INIT_2B = 256'h3636363636363636FF36363636363636_36363636363636363F00000000000000; // d7(�) d6(�)
    defparam rom1.INIT_2C = 256'h0000000000000000F818181818181818_1818181818181818FF18FF1818181818; // d9(�) d8(�)
    defparam rom1.INIT_2D = 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF_18181818181818181F00000000000000; // db(�) da(�)
    defparam rom1.INIT_2E = 256'hF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0_FFFFFFFFFFFFFFFFFF00000000000000; // dd(�) dc(�)
    defparam rom1.INIT_2F = 256'h000000000000000000FFFFFFFFFFFFFF_0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F; // df(�) de(�)
    defparam rom1.INIT_30 = 256'h00000000CCC6C6C6CCD8CCCCCC780000_0000000076DCD8D8D8DC760000000000; // e1(�) e0(�)
    defparam rom1.INIT_31 = 256'h000000006C6C6C6C6C6C6CFE00000000_00000000C0C0C0C0C0C0C0C6C6FE0000; // e3(�) e2(�)
    defparam rom1.INIT_32 = 256'h0000000070D8D8D8D8D87E0000000000_00000000FEC66030183060C6FE000000; // e5(�) e4(�)
    defparam rom1.INIT_33 = 256'h00000000181818181818DC7600000000_000000C060607C666666666600000000; // e7(�) e6(�)
    defparam rom1.INIT_34 = 256'h00000000386CC6C6FEC6C66C38000000_000000007E183C6666663C187E000000; // e9(�) e8(�)
    defparam rom1.INIT_35 = 256'h000000003C666666663E0C18301E0000_00000000EE6C6C6C6CC6C6C66C380000; // eb(�) ea(�)
    defparam rom1.INIT_36 = 256'h00000000C0607EF3DBDB7E0603000000_0000000000007EDBDBDB7E0000000000; // ed(�) ec(�)
    defparam rom1.INIT_37 = 256'h00000000C6C6C6C6C6C6C6C67C000000_000000001C306060607C6060301C0000; // ef(�) ee(�)
    defparam rom1.INIT_38 = 256'h00000000FF000018187E181800000000_0000000000FE0000FE0000FE00000000; // f1(�) f0(�)
    defparam rom1.INIT_39 = 256'h000000007E000C18306030180C000000_000000007E0030180C060C1830000000; // f3(�) f2(�)
    defparam rom1.INIT_3A = 256'h0000000070D8D8D81818181818181818_18181818181818181818181B1B0E0000; // f5(�) f4(�)
    defparam rom1.INIT_3B = 256'h000000000000DC7600DC760000000000_00000000001818007E00181800000000; // f7(�) f6(�)
    defparam rom1.INIT_3C = 256'h00000000000000181800000000000000_0000000000000000000000386C6C3800; // f9(�) f8(�)
    defparam rom1.INIT_3D = 256'h000000001C3C6C6CEC0C0C0C0C0C0F00_00000000000000180000000000000000; // fb(�) fa(�)
    defparam rom1.INIT_3E = 256'h000000000000000000F8C86030D87000_0000000000000000006C6C6C6C6CD800; // fd(�) fc(�)
    defparam rom1.INIT_3F = 256'h00000000000000000000000000000000_00000000007C7C7C7C7C7C7C00000000; // ff(�) fe(�)
  // Assignments
  assign rdata = addr[11] ? rdata1 : rdata0;
endmodule