module <module_name> (
                );
//only for FSM state vector representation
parameter     [?:0]                  // synopsys enum fsm_pstate
IDLE               = ,
reg           [?:0]                            // synopsys enum fsm_pstate
fsm_pstate, next_state;
//synthesis translate_off
reg           [8*?:0]      state_name;//"state name" is user defined
//synthesis translate_on
//synthesis translate_off
always @ (fsm_pstate)
begin
case (fsm_pstate)
<IDLE>       : state_name = "IDLE";
<state2>     : state_name = "state2";
.
.
.
<default>    : state_name = "default";
endcase
end
//synthesis translate_on
//code should be  <=200 lines
/* comments for assign statements
*/
//assign statements
/* comments for combinatory logic
   Asynchronous part of FSM
*/
/* comments for sequential logic
*/
//<sequential logic>;
endmodule