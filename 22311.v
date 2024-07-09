module cpu(
	input clk_sys,
	// from power supply (?)
	input off,
	input pon,
	input pout,
	input clm, clo,
	// from control panel
	input [0:15] kl,
	input panel_store, panel_fetch, panel_load, panel_bin,
	input oprq, stop, start, work, mode, step, stop_n, cycle,
	input wre, rsa, rsb, rsc,
	input wic, wac, war, wir, wrs, wrz, wkb,
	input zegar,
	// to control panel
	output p0,
	output [0:15] w,
	output hlt_n,
	output p,
	output run,
	output _wait,
	output irq,
	output q,
	output mc_0,
	output awaria,
	// system bus
											input rpa,
	output dmcl,
	// -OFF
	output dw,
	output dr,
	output ds,
	output df,
	output din,				input rin,
	output dok,				input rok,
										input ren,
										input rpe,
	output dqb,
	output dpn,				input rpn,
	output [0:3] dnb,
	output [0:15] dad,
	output [0:15] ddt,	input [0:15] rdt,
	output zg,
										input zw,
	output zz
);
	assign zz = 1'b1;
	// --- CPU FEATURES-----------------------------------------------------
	parameter CPU_NUMBER;
	parameter AWP_PRESENT = 1'b1;
	parameter INOU_USER_ILLEGAL = 1'b1;
	parameter STOP_ON_NOMEM = 1'b1;
	parameter LOW_MEM_WRITE_DENY = 1'b0;
	// --- BUS TIMINGS -----------------------------------------------------
	parameter ALARM_DLY_TICKS = 8'd250; // 2.5-5us in DTR, >=5us from notes on HSO schematic, ~10us in hw(?)
	parameter ALARM_TICKS = 2'd3; // 60ns
	// -DDT open-collector composition
	assign ddt = pa_ddt | px_ddt;
	// -DAD open-collector composition
	assign dad = pa_dad | pp_dad | px_dad;
wire k1, wp, k2, wa, wz, w$, wr, we, p1, p2, p5, p4, p3, i5, i4, i3, i2, i1, ww, wm, wx, as2, got, strob1, strob1b, strob2, strob2b, arm4, blw_pw, ekc_i, zer_sp, lipsp, pn_nb, bp_nb, bar_nb, barnb, q_nb, w_dt, dt_w, ar_ad, ic_ad, i3_ex_przer, ck_rz_w, zerrz, ok$, oken, bod, b_parz, b_p0;
wire [0:15] px_dad;
wire [0:15] px_ddt;
wire ldstate;
px #(
	.AWP_PRESENT(AWP_PRESENT),
	.STOP_ON_NOMEM(STOP_ON_NOMEM),
	.LOW_MEM_WRITE_DENY(LOW_MEM_WRITE_DENY),
	.ALARM_DLY_TICKS(ALARM_DLY_TICKS),
	.ALARM_TICKS(ALARM_TICKS)
) PX(
	.clk_sys(clk_sys),
	.ek1(ek1),
	.ewp(ewp),
	.ek2(ek2),
	.ewa(ewa),
	.clo(clo),
	.ewe(ewe),
	.ewr(ewr),
	.ew$(ew$),
	.ewz(ewz),
	.k1(k1),
	.wp(wp),
	.k2(k2),
	.wa(wa),
	.wz(wz),
	.w$(w$),
	.wr(wr),
	.we(we),
	.sp1(sp1),
	.ep1(ep1),
	.sp0(sp0),
	.ep0(ep0),
	.stp0(stp0),
	.ep2(ep2),
	.ep5(ep5),
	.ep4(ep4),
	.ep3(ep3),
	.p1(p1),
	.p0(p0),
	.p2(p2),
	.p5(p5),
	.p4(p4),
	.p3(p3),
	.si1(si1),
	.ewx(ewx),
	.ewm(ewm),
	.eww(eww),
	.i5(i5),
	.i4(i4),
	.i3(i3),
	.i2(i2),
	.i1(i1),
	.ww(ww),
	.wm(wm),
	.wx(wx),
	.laduj(laduj),
	.as2_sum_at(as2),
	.strob_fp(strob_fp),
	.strobb_fp(strobb_fp),
	.mode(mode),
	.step(step),
	.got(got),
	.ldstate(ldstate),
	.strob1(strob1),
	.strob1b(strob1b),
	.strob2(strob2),
	.strob2b(strob2b),
	.przerw_z(przerw_z),
	.przerw(przerw),
	.lip(lip),
	.sp(sp),
	.lg_0(lg_0),
	.pp(pp),
	.lg_3(lg_3),
	.arm4(arm4),
	.blw_pw(blw_pw),
	.ekc_i(ekc_i),
	.zer_sp(zer_sp),
	.lipsp(lipsp),
	.sbar$(sbar$),
	.q(q),
	.in(in),
	.ou(ou),
	.k2fetch(k2fetch),
	.read_fp(read_fp),
	.pn_nb(pn_nb),
	.bp_nb(bp_nb),
	.bar_nb(bar_nb),
	.barnb(barnb),
	.q_nb(q_nb),
	.df(df),
	.w_dt(w_dt),
	.dr(dr),
	.dt_w(dt_w),
	.ar_ad(ar_ad),
	.ds(ds),
	.mcl(mcl),
	.gi(gi),
	.ir6(ir[6]),
	.fi(fi),
	.arz(arz),
	.k2_bin_store(k2_bin_store),
	.lrz(lrz),
	.ic_ad(ic_ad),
	.dmcl(dmcl),
	.ddt(px_ddt),
	.din(din),
	.dw(dw),
	.i3_ex_przer(i3_ex_przer),
	.ck_rz_w(ck_rz_w),
	.zerrz(zerrz),
	.sr_fp(sr_fp),
	.zw(zw),
	.srez$(srez$),
	.wzi(wzi),
	.is(is),
	.ren(ren),
	.rok(rok),
	.efp(efp),
	.exl(exl),
	.zg(zg),
	.ok$(ok$),
	.oken(oken),
	.stop_n(stop_n),
	.zga(zga),
	.rpe(rpe),
	.stop(stop),
	.ir9(ir[9]),
	.pufa(pufa),
	.ir7(ir[7]),
	.ir8(ir[8]),
	.hlt_n(hlt_n),
	.bod(bod),
	.b_parz(b_parz),
	.b_p0(b_p0),
	.awaria(awaria),
	.dad(px_dad)
);
wire sp0, przerw, si1, sp1, laduj, k2_bin_store, k2fetch, w_rbc, w_rba, w_rbb, ep0, stp0, ek2, ek1, mc_3, xi$, pp, ep5, ep4, ep3, ep1, ep2, icp1, arp1, lg_3, lg_0, rc, rb, ra, lk, wls, w_r, w_ic, w_ac, w_ar, lrz, w_bar, w_rm, baa, bab, bac, aa, ab, wpb, bwb, bwa, kia, kib, w_ir, mwa, mwb, mwc;
pm PM(
	.clk_sys(clk_sys),
	.start(start),
	.pon(pon),
	.work(work),
	.hlt_n(hlt_n),
	.stop(stop),
	.clo(clo),
	.hlt(hlt),
	.cycle(cycle),
	.irq(irq),
	._wait(_wait),
	.run(run),
	.ekc_1(ekc_1),
	.ekc_i(ekc_i),
	.ekc_2(ekc_2),
	.got(got),
	.ldstate(ldstate),
	.ekc_fp(ekc_fp),
	.clm(clm),
	.strob1(strob1),
	.strob1b(strob1b),
	.strob2(strob2),
	.strob2b(strob2b),
	.sp0(sp0),
	.przerw(przerw),
	.si1(si1),
	.sp1(sp1),
	.k2(k2),
	.panel_store(panel_store),
	.panel_fetch(panel_fetch),
	.panel_load(panel_load),
	.panel_bin(panel_bin),
	.rdt9(rdt[9]),
	.rdt11(rdt[11]),
	.k1(k1),
	.laduj(laduj),
	.k2_bin_store(k2_bin_store),
	.k2fetch(k2fetch),
	.w_rbc(w_rbc),
	.w_rba(w_rba),
	.w_rbb(w_rbb),
	.p0(p0),
	.ep0(ep0),
	.stp0(stp0),
	.ek2(ek2),
	.ek1(ek1),
	.j$(j$),
	.bcoc$(bcoc$),
	.zs(zs),
	.p2(p2),
	.ssp$(ssp$),
	.sc$(sc$),
	.md(md),
	.xi(xi),
	.p(p),
	.mc_3(mc_3),
	.mc_0(mc_0),
	.xi$(xi$),
	.p4(p4),
	.b0(b0),
	.na(na),
	.c0(c0),
	.ka2(ka2),
	.ka1(ka1),
	.p3(p3),
	.p1(p1),
	.nef(nef),
	.p5(p5),
	.i2(i2),
	.pp(pp),
	.ep5(ep5),
	.ep4(ep4),
	.ep3(ep3),
	.ep1(ep1),
	.ep2(ep2),
	.icp1(icp1),
	.exl(exl),
	.lipsp(lipsp),
	.gr(gr),
	.wx(wx),
	.shc(shc),
	.read_fp(read_fp),
	.inou(inou),
	.rok(rok),
	.arp1(arp1),
	.lg_3(lg_3),
	.lg_0(lg_0),
	.rsc(rsc),
	.ir6(ir[6]),
	.ir7(ir[7]),
	.ir8(ir[8]),
	.ir9(ir[9]),
	.ir10(ir[10]),
	.ir11(ir[11]),
	.ir12(ir[12]),
	.ir13(ir[13]),
	.ir14(ir[14]),
	.ir15(ir[15]),
	.lpb(lpb),
	.rsb(rsb),
	.rsa(rsa),
	.lpa(lpa),
	.rlp_fp(rlp_fp),
	.rc(rc),
	.rb(rb),
	.ra(ra),
	.bod(bod),
	.lk(lk),
	.rj(rj),
	.uj(uj),
	.lwlwt(lwlwt),
	.sr(sr),
	.lac(lac),
	.lrcb(lrcb),
	.rpc(rpc),
	.rc$(rc$),
	.ng$(ng$),
	.ls(ls),
	.oc(oc),
	.wa(wa),
	.wm(wm),
	.wz(wz),
	.ww(ww),
	.wr(wr),
	.wp(wp),
	.wls(wls),
	.ri(ri),
	.war(war),
	.wre(wre),
	.i3(i3),
	.s_fp(s_fp),
	.sar$(sar$),
	.lar$(lar$),
	.in(in),
	.bs(bs),
	.zb$(zb$),
	.w_r(w_r),
	.wic(wic),
	.i4(i4),
	.wac(wac),
	.i1(i1),
	.w_ic(w_ic),
	.w_ac(w_ac),
	.w_ar(w_ar),
	.wrz(wrz),
	.wrs(wrs),
	.mb(mb),
	.im(im),
	.lj(lj),
	.lwrs(lwrs),
	.jkrb(jkrb),
	.lrz(lrz),
	.w_bar(w_bar),
	.w_rm(w_rm),
	.we(we),
	.ib(ib),
	.cb(cb),
	.i5(i5),
	.rb$(rb$),
	.w$(w$),
	.i3_ex_przer(i3_ex_przer),
	.baa(baa),
	.bab(bab),
	.bac(bac),
	.aa(aa),
	.ab(ab),
	.at15(at15),
	.srez$(srez$),
	.rz(rz),
	.wir(wir),
	.blw_pw(blw_pw),
	.wpb(wpb),
	.bwb(bwb),
	.bwa(bwa),
	.kia(kia),
	.kib(kib),
	.w_ir(w_ir),
	.ki(ki),
	.dt_w(dt_w),
	.f13(f13),
	.wkb(wkb),
	.mwa(mwa),
	.mwb(mwb),
	.mwc(mwc)
);
wire [0:15] ir;
wire c0, ls, rj, bs, ou, in, is, ri, pufa, rb$, cb, sc$, oc, ka2, gr, hlt, mcl, sin, gi, lip, mb, im, ki, fi, sp, rz, ib, lpc, rpc, shc, rc$, ng$, zb$, b0, _0_v, md, xi, nef, amb, apb, jkrb, lwrs, saryt, ap1, am1, bcoc$, sd, scb, sca, sb, sab, saa, lrcb, aryt, sbar$, nrf, ust_z, ust_v, ust_mc, ust_leg, eat0, sr, ust_y, ust_x, blr, ewa, ewp, uj, lwlwt, lj, ewe, ekc_1, ewz, ew$, lar$, ssp$, ka1, na, exl, p16, ewr, ewm, efp, sar$, eww, srez$, ewx, axy, inou, ekc_2, lac;
pd #(
	.INOU_USER_ILLEGAL(INOU_USER_ILLEGAL)
) PD(
	.clk_sys(clk_sys),
	.w(w),
	.strob1(strob1),
	.strob1b(strob1b),
	.w_ir(w_ir),
	.ir(ir),
	.c0(c0),
	.si1(si1),
	.ls(ls),
	.rj(rj),
	.bs(bs),
	.ou(ou),
	.in(in),
	.is(is),
	.ri(ri),
	.pufa(pufa),
	.rb$(rb$),
	.cb(cb),
	.sc$(sc$),
	.oc(oc),
	.ka2(ka2),
	.gr(gr),
	.hlt(hlt),
	.mcl(mcl),
	.sin(sin),
	.gi(gi),
	.lip(lip),
	.mb(mb),
	.im(im),
	.ki(ki),
	.fi(fi),
	.sp(sp),
	.rz(rz),
	.ib(ib),
	.lpc(lpc),
	.rpc(rpc),
	.shc(shc),
	.rc$(rc$),
	.ng$(ng$),
	.zb$(zb$),
	.b0(b0),
	.q(q),
	.mc_3(mc_3),
	.r0(r0),
	._0_v(_0_v),
	.p(p),
	.md(md),
	.xi(xi),
	.nef(nef),
	.w$(w$),
	.p4(p4),
	.we(we),
	.amb(amb),
	.apb(apb),
	.jkrb(jkrb),
	.lwrs(lwrs),
	.saryt(saryt),
	.ap1(ap1),
	.am1(am1),
	.wz(wz),
	.wls(wls),
	.bcoc$(bcoc$),
	.sd(sd),
	.scb(scb),
	.sca(sca),
	.sb(sb),
	.sab(sab),
	.saa(saa),
	.lrcb(lrcb),
	.aryt(aryt),
	.sbar$(sbar$),
	.nrf(nrf),
	.at15(at15),
	.wx(wx),
	.wa(wa),
	.ust_z(ust_z),
	.ust_v(ust_v),
	.ust_mc(ust_mc),
	.ust_leg(ust_leg),
	.eat0(eat0),
	.sr(sr),
	.ust_y(ust_y),
	.ust_x(ust_x),
	.blr(blr),
	.wpb(wpb),
	.wr(wr),
	.pp(pp),
	.ww(ww),
	.wzi(wzi),
	.ewa(ewa),
	.ewp(ewp),
	.uj(uj),
	.lwlwt(lwlwt),
	.lj(lj),
	.ewe(ewe),
	.wp(wp),
	.ekc_1(ekc_1),
	.ewz(ewz),
	.ew$(ew$),
	.lar$(lar$),
	.ssp$(ssp$),
	.ka1(ka1),
	.na(na),
	.exl(exl),
	.p16(p16),
	.lk(lk),
	.wm(wm),
	.ewr(ewr),
	.ewm(ewm),
	.efp(efp),
	.sar$(sar$),
	.eww(eww),
	.srez$(srez$),
	.ewx(ewx),
	.axy(axy),
	.inou(inou),
	.ekc_2(ekc_2),
	.lac(lac)
);
wire [0:15] l;
wire zgpn, zer;
wire [0:8] r0;
wire [0:15] bus_ki;
pr #(
	.CPU_NUMBER(CPU_NUMBER),
	.AWP_PRESENT(AWP_PRESENT)
) PR(
	.clk_sys(clk_sys),
	.blr(blr),
	.lpc(lpc),
	.wa(wa),
	.rpc(rpc),
	.rc(rc),
	.rb(rb),
	.ra(ra),
	.as2(as2),
	.w_r(w_r),
	.strob1(strob1),
	.strob1b(strob1b),
	.strob2(strob2),
	.strob2b(strob2b),
	.w(w),
	.l(l),
	.bar_nb(bar_nb),
	.w_rbb(w_rbb),
	.w_rbc(w_rbc),
	.w_rba(w_rba),
	.dnb(dnb),
	.rpn(rpn),
	.bp_nb(bp_nb),
	.pn_nb(pn_nb),
	.q_nb(q_nb),
	.w_bar(w_bar),
	.zer_sp(zer_sp),
	.clm(clm),
	.ustr0_fp(ustr0_fp),
	.ust_leg(ust_leg),
	.aryt(aryt),
	.zs(zs),
	.carry(carry),
	.s_1(s_1),
	.zgpn(zgpn),
	.dpn(dpn),
	.dqb(dqb),
	.q(q),
	.zer(zer),
	.ust_z(ust_z),
	.ust_mc(ust_mc),
	.s0(s0),
	.ust_v(ust_v),
	._0_v(_0_v),
	.r0(r0),
	.exy(exy),
	.ust_y(ust_y),
	.exx(exx),
	.ust_x(ust_x),
	.kia(kia),
	.kib(kib),
	.bus_rz(bus_rz),
	.zp(zp),
	.rs(rs),
	.bus_ki(bus_ki)
);
wire [0:9] rs;
wire [0:15] bus_rz;
wire przerw_z;
wire [0:15] pp_dad;
pp PP(
	.clk_sys(clk_sys),
	.w(w),
	.clm(clm),
	.w_rm(w_rm),
	.strob1(strob1),
	.strob1b(strob1b),
	.i4(i4),
	.rs(rs),
	.pout(pout),
	.zer(zer),
	.b_parz(b_parz),
	.ck_rz_w(ck_rz_w),
	.b_p0(b_p0),
	.zerrz(zerrz),
	.i1(i1),
	.przerw(przerw),
	.bus_rz(bus_rz),
	.rpa(rpa),
	.zegar(zegar),
	.xi(xi$),
	.fi0(fi0),
	.fi1(fi1),
	.fi2(fi2),
	.fi3(fi3),
	.przerw_z(przerw_z),
	.k1(k1),
	.i2(i2),
	.oprq(oprq),
	.ir14(ir[14]),
	.ir15(ir[15]),
	.wx(wx),
	.sin(sin),
	.rin(rin),
	.zw(zw),
	.zgpn(zgpn),
	.rdt(rdt),
	.dok(dok),
	.irq(irq),
	.dad(pp_dad)
);
wire s0, carry, j$, exx, at15, exy, s_1, wzi, zs, arz;
wire zga;
wire [0:15] pa_ddt;
wire [0:15] pa_dad;
pa PA(
	.clk_sys(clk_sys),
	.ir(ir),
	.bus_ki(bus_ki),
	.rdt(rdt),
	.w_dt(w_dt),
	.mwa(mwa),
	.mwb(mwb),
	.mwc(mwc),
	.bwa(bwa),
	.bwb(bwb),
	.ddt(pa_ddt),
	.w(w),
	.saryt(saryt),
	.sab(sab),
	.scb(scb),
	.sb(sb),
	.sd(sd),
	.s0(s0),
	.carry(carry),
	.p16(p16),
	.saa(saa),
	.sca(sca),
	.j$(j$),
	.exx(exx),
	.wx(wx),
	.eat0(eat0),
	.axy(axy),
	.at15(at15),
	.exy(exy),
	.w_ac(w_ac),
	.strob1(strob1),
	.strob1b(strob1b),
	.strob2(strob2),
	.strob2b(strob2b),
	.as2(as2),
	.am1(am1),
	.apb(apb),
	.amb(amb),
	.ap1(ap1),
	.s_1(s_1),
	.wzi(wzi),
	.zs(zs),
	.arm4(arm4),
	.w_ar(w_ar),
	.arp1(arp1),
	.arz(arz),
	.icp1(icp1),
	.w_ic(w_ic),
	.off(off),
	.baa(baa),
	.bab(bab),
	.bac(bac),
	.ab(ab),
	.aa(aa),
	.l(l),
	.barnb(barnb),
	.kl(kl),
	.ic_ad(ic_ad),
	.dad(pa_dad),
	.ar_ad(ar_ad),
	.zga(zga)
);
wire fi0, fi1, fi2, fi3;
wire read_fp, strob_fp, strobb_fp, sr_fp, ekc_fp, rlp_fp, ustr0_fp, s_fp;
wire f13, lpa, lpb;
wire [0:15] zp;
generate
	if (~AWP_PRESENT) begin
		assign {fi0, fi1, fi2, fi3} = 4'b0000;
		assign {read_fp, strob_fp, sr_fp, ekc_fp, rlp_fp, ustr0_fp, s_fp} = 7'b0000000;
		assign {f13, lpa, lpb} = 3'b000;
		assign zp = 16'h0000;
	end else begin
		awp AWP(
			.clk_sys(clk_sys),
			.w(w),
			.r02(r0[2]),
			.r03(r0[3]),
			.pufa(pufa),
			.ir(ir[7:9]),
			.nrf(nrf),
			.mode(mode),
			.step(step),
			.efp(efp),
			.got(got),
			.ldstate(ldstate),
			.ok$(ok$),
			.oken(oken),
			.zw(zw),
			.zp(zp),
			.fi0(fi0),
			.fi1(fi1),
			.fi2(fi2),
			.fi3(fi3),
			.rlp_fp(rlp_fp),
			.lpa(lpa),
			.lpb(lpb),
			.s_fp(s_fp),
			.ustr0_fp(ustr0_fp),
			.f13(f13),
			.strob_fp(strob_fp),
			.strobb_fp(strobb_fp),
			.sr_fp(sr_fp),
			.read_fp(read_fp),
			.ekc_fp(ekc_fp)
		);
	end
endgenerate
endmodule