module NMOS_TRANSISTOR(D G S B);
paramset cmosn_local nmos;
.level=1; .kp=41.5964u; .vto=0.8; .gamma=0.863074; .phi=0.6; .lambda=.01;
.tox=41.8n; .nsub=15.3142E+15; .nss=1.E+12; .xj=400.n; .uo=503.521; .tpg=1;
.fc=0.5; .pb=0.7; .cj=384.4u; .mj=0.4884; .cjsw=527.2p; .mjsw=0.3002; .js=0.;
.rsh=0.; .cbd=0.; .cbs=0.; .cgso=218.971p; .cgdo=218.971p; .cgbo=0.;
.ld=265.073n;
endparamset
parameter l
parameter w
cmosn_local #(.l(l), .w(w)) m(D,G,S,B);
endmodule