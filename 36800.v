module top {{template "_moduleDeclr" .}}
// I/O
FB_{{$block.Name}} iec61499_network_top (
	.clk(clk),
    {{if $block.EventInputs -}}
    //input events
    {{range $index, $event := $block.EventInputs}}.{{$event.Name}}_eI({{$event.Name}}_eI),
    {{end}}{{end}}
    {{if $block.EventOutputs -}}
    //output events
    {{range $index, $event := $block.EventOutputs}}.{{$event.Name}}_eO({{$event.Name}}_eO),
    {{end}}{{end}}
    {{if $block.InputVars -}}
    //input variables
    {{range $index, $var := $block.InputVars}}.{{$var.Name}}_I({{$var.Name}}_I),
    {{end}}{{end}}
    {{if $block.OutputVars -}}
    //output variables
    {{range $index, $var := $block.OutputVars}}.{{$var.Name}}_O({{$var.Name}}_O),
    {{end}}{{end}}
	.reset(reset)
);
endmodule