module FB_{{$block.Name}} {{template "_moduleDeclr" .}}
{{if $block.EventInputs}}//input events
{{range $index, $event := $block.EventInputs}}wire {{$event.Name}};
assign {{$event.Name}} = {{$event.Name}}_eI;
{{end}}{{end}}
{{if $block.EventOutputs}}//output events
{{range $index, $event := $block.EventOutputs}}reg {{$event.Name}};
assign {{$event.Name}}_eO = {{$event.Name}};
{{end}}{{end}}
{{if $block.InputVars}}//input variables
{{range $index, $var := $block.InputVars}}reg {{getVerilogSize $var.Type}} {{$var.Name}} {{if $var.InitialValue}} = {{$var.InitialValue}}{{end}};
{{end}}{{end}}
{{if $block.OutputVars}}//output variables
{{range $index, $var := $block.OutputVars}}reg {{getVerilogSize $var.Type}} {{$var.Name}} {{if $var.InitialValue}} = {{$var.InitialValue}}{{end}};
{{end}}{{end}}
{{if $basicFB.InternalVars}}{{range $varIndex, $var := $basicFB.InternalVars}}
reg  {{getVerilogSize $var.Type}} {{$var.Name}} {{if $var.InitialValue}} = {{$var.InitialValue}}{{end}}; {{end}}{{end}}
//BEGIN STATE variables
reg {{getVerilogWidthArray (len $basicFB.States)}} state = `STATE_{{(index $basicFB.States 0).Name}};
reg entered = 1'b0;
//END STATE variables
//BEGIN algorithm triggers
{{range $algIndex, $alg := $basicFB.Algorithms -}}
reg {{$alg.Name}}_alg_en = 1'b0;
{{end}}
//END algorithm triggers
always@(posedge clk) begin
	if(reset) begin
		//reset state
		state = `STATE_{{(index $basicFB.States 0).Name}};
		//reset I/O registers
		{{range $index, $event := $block.EventOutputs}}{{$event.Name}} = 1'b0;
		{{end}}
		{{- range $varIndex, $var := $block.InputVars}}
		{{$var.Name}} = {{if $var.InitialValue}}{{$var.InitialValue}}{{else}}0{{end}};
		{{- end}}
		{{range $index, $var := $block.OutputVars}}
		{{$var.Name}} = {{if $var.InitialValue}}{{$var.InitialValue}}{{else}}0{{end}};
		{{- end}}
		//reset internal vars
		{{- range $varIndex, $var := $basicFB.InternalVars}}
		{{$var.Name}} = {{if $var.InitialValue}}{{$var.InitialValue}}{{else}}0{{end}};
		{{- end}}
	end else begin
		//BEGIN clear output events
		{{range $index, $event := $block.EventOutputs}}{{$event.Name}} = 1'b0;
		{{end}}
		//END clear output events
		//BEGIN update internal inputs on relevant events
		{{if $block.EventInputs}}{{if $block.InputVars}}{{range $eventIndex, $event := $block.EventInputs}}{{if $event.With}}
		if({{$event.Name}}) begin
			{{range $varIndex, $var := $block.InputVars}}{{if $event.IsLoadFor $var}}{{$var.Name}} = {{$var.Name}}_I;
			{{end}}{{end}}
		end
		{{end}}{{end}}{{end}}{{end}}
		//END update internal inputs
		//BEGIN ecc
		entered = 1'b0;
		case(state)
			{{range $curStateIndex, $curState := $basicFB.States}}`STATE_{{$curState.Name}}: begin
				{{range $transIndex, $trans := $basicFB.GetTransitionsForState $curState.Name}}{{if $transIndex}}end else {{end}}if({{rmTrueFalse (compileTransition $block $trans.Condition)}}) begin
					state = `STATE_{{$trans.Destination}};
					entered = 1'b1;
				{{end}}end
			end
			{{end}}default: begin
				state = 0;
			end
		endcase
		//END ecc
		//BEGIN triggers
		{{range $algIndex, $alg := $basicFB.Algorithms -}}
		{{$alg.Name}}_alg_en = 1'b0;
		{{end}}
		if(entered) begin
			case(state)
				{{range $curStateIndex, $curState := $basicFB.States}}`STATE_{{$curState.Name}}: begin
					{{range $actionIndex, $action := $curState.ECActions}}{{if $action.Algorithm}}{{$action.Algorithm}}_alg_en = 1'b1;
					{{end}}{{if $action.Output}}{{$action.Output}} = 1'b1;
					{{end}}{{end}}
				end
				{{end}}default: begin
				end
			endcase
		end
		//END triggers
		//BEGIN algorithms
		{{range $algIndex, $alg := $basicFB.Algorithms -}}
		if({{$alg.Name}}_alg_en) begin
			{{compileAlgorithm $block $alg}}
		end
		{{end}}
		//END algorithms
		//BEGIN update external output variables on relevant events
		{{if $block.EventOutputs}}{{if $block.OutputVars}}{{range $eventIndex, $event := $block.EventOutputs}}{{if $event.With}}
		if({{$event.Name}}) begin
			{{range $varIndex, $var := $block.OutputVars}}{{if $event.IsLoadFor $var}}{{$var.Name}}_O = {{$var.Name}};
			{{end}}{{end}}
		end
		{{end}}{{end}}{{end}}{{end}}
		//END update external output variables
	end
end
endmodule