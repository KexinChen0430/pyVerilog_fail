module apl2c_connect(autoinoutmodport_type_intf ctl_i,
                     /*AUTOINOUTMODPORT("autoinoutmodport_type_intf",  "ctl_cb")*/
                     // Beginning of automatic in/out/inouts (from modport)
                     input [4:0] inst,
                     input       isel_t isel,
                     input       replay
                     // End of automatics
                     );
   /*AUTOASSIGNMODPORT("autoinoutmodport_type_intf", "ctl_cb", "ctl_i")*/
   // Beginning of automatic assignments from modport
   assign ctl_i.inst  = inst;
   assign ctl_i.isel  = isel;
   assign ctl_i.replay  = replay;
   // End of automatics
endmodule