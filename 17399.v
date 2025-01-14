module FB_{{$block.Name}} {{template "_moduleDeclr" .}}
//Wires needed for event connections
{{range $curConnIndex, $connName := $compositeFB.GetUniqueEventConnSources}}wire {{renameConnSignal $connName}};
{{end}}
//Wires needed for data connections
{{range $curConnIndex, $conn := $uniqueConnsWithTypes}}wire {{getVerilogSize $conn.Type}} {{renameConnSignal $conn.Source}};
{{end}}
//top level I/O to signals
{{if $block.EventInputs}}//input events
{{range $index, $event := $block.EventInputs}}{{range $curConnIndex, $conn := $compositeFB.EventConnections}}{{if eq $conn.Source $event.Name}}assign {{renameConnSignal $conn.Source}} = {{$event.Name}}_eI;
{{end}}{{end}}{{end}}
{{end}}{{if $block.EventOutputs}}//output events
{{range $index, $event := $block.EventOutputs}}{{range $curConnIndex, $conn := $compositeFB.EventConnections}}{{if eq $conn.Destination $event.Name}}assign {{$event.Name}}_eO = {{renameConnSignal $conn.Source}};
{{end}}{{end}}{{end}}
{{end}}{{if $block.InputVars}}//input variables
{{range $index, $var := $block.InputVars}}{{range $curConnIndex, $conn := $compositeFB.DataConnections}}{{if eq $conn.Source $var.Name}}assign {{renameConnSignal $conn.Source}} = {{$var.Name}}_I;
{{end}}{{end}}{{end}}
{{end}}{{if $block.OutputVars}}//output events
{{range $index, $var := $block.OutputVars}}{{range $curConnIndex, $conn := $compositeFB.DataConnections}}{{if eq $conn.Destination $var.Name}}assign {{$var.Name}}_O = {{renameConnSignal $conn.Source}};
{{end}}{{end}}{{end}}
{{end}}
// child I/O to signals
{{range $currChildIndex, $child := $compositeFB.FBs}}
FB_{{$child.Type}} {{$child.Name}} (
	.clk(clk),
	//event outputs {{/* For both events and data connection outputs, we need to only output the *unique* signals (vhdl can't drive many signals from a single output). Hence this rigmarole. */}}
	{{range $curConnIndex, $connName := $compositeFB.GetUniqueEventConnSources}}{{if connChildNameMatches $connName $child.Name}}.{{connChildSourceOnly $connName}}_eO({{renameConnSignal $connName}}),
	{{end}}{{end}}
	//event inputs
	{{range $curConnIndex, $conn := $compositeFB.EventConnections}}{{if connChildNameMatches $conn.Destination $child.Name}}.{{connChildSourceOnly $conn.Destination}}_eI({{renameConnSignal $conn.Source}}),
	{{end}}{{end}}
	//data outputs
	{{range $curConnIndex, $connName := $compositeFB.GetUniqueDataConnSources}}{{if connChildNameMatches $connName $child.Name}}.{{connChildSourceOnly $connName}}_O({{renameConnSignal $connName}}),
	{{end}}{{end}}
	//data inputs
	{{range $curConnIndex, $conn := $compositeFB.DataConnections}}{{if connChildNameMatches $conn.Destination $child.Name}}.{{connChildSourceOnly $conn.Destination}}_I({{renameConnSignal $conn.Source}}),
	{{end}}{{end}}
	.reset(reset)
);
{{end}}
endmodule