module PMOS_TRANSISTOR(D G S B);
paramset local_cmosp pmos;
.level=1; .vto=-0.8; .kp= 41.5964u; .gamma= 0.863074; .phi= 0.6; .rd= 0.;
.rs= 0.; .cbd= 0.; .cbs= 0.; .is= 0; .pb= 0.7; .cgso= 218.971p;
.cgdo=218.971p; .cgbo= 0.; .rsh= 0.; .cj= 384.4u; .mj= 0.4884; .cjsw= 527.2p;
.mjsw= 0.3002; .js= 0.; .tox= 41.8n; .nsub= 15.3142E+15; .nss= 1.E+12; .tpg=1;
.xj= 400.n; .ld= 265.073n; .uo= 503.521; .kf= 0.; .af= 1.; .fc= 0.5;
.lambda=.01;
endparamset
parameter l
parameter w
local_cmosp #(.l(l), .w(w)) m(D,G,S,B);
endmodule