module max_io (datain, oe, padio, dataout);
        parameter operation_mode = "input";
		parameter bus_hold = "false";
		parameter open_drain_output = "false";
		parameter weak_pull_up = "false";
        inout        padio;
        input        datain, oe;
        output       dataout;
	max_asynch_io asynch_inst (datain, oe, padio, dataout);
   	defparam
		asynch_inst.operation_mode = operation_mode,
		asynch_inst.bus_hold = bus_hold,
	    asynch_inst.open_drain_output = open_drain_output,
	    asynch_inst.weak_pull_up = weak_pull_up;
endmodule