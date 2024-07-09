module uart_log;
parameter testcase_name  = "";
integer report_log_file_desc;
integer verbose_log_file_desc;
reg     free;
integer tests_ok;
integer tests_failed;
initial free         = 1;
initial tests_ok     = 0;
initial tests_failed = 0;
task start_log;
  output ok_o;
begin
  report_log_file_desc  = $fopen({"../log/", testcase_name, "_report.log"});
  verbose_log_file_desc = $fopen({"../log/", testcase_name, "_verbose.log"});
  if ((report_log_file_desc == 0) || (verbose_log_file_desc == 0))
    ok_o = 1'b0;
  else
    ok_o = 1'b1;
end
endtask // start_log
task end_log;
begin
  report_add_delimiter;
  $fdisplay(report_log_file_desc, "TEST CASE execution summary:");
  $fdisplay(report_log_file_desc, "Number of tests PASSED=%0d", tests_ok);
  $fdisplay(report_log_file_desc, "Number of tests FAILED=%0d", tests_failed);
  $fdisplay(report_log_file_desc, "  Simulation End Time: %t", $time);
  report_add_delimiter;
  $fclose(report_log_file_desc);
  $fclose(verbose_log_file_desc);
end
endtask // end_log
task report_test_name;
  input [1599:0] test_i;
begin
  report_add_delimiter;
  $fdisplay(report_log_file_desc, "%0s", test_i);
end
endtask // report_test_name
task report_test_failed;
  input [7999:0] message_i;
begin
  $fdisplay(report_log_file_desc, "    FAILED!");
  $fdisplay(report_log_file_desc, "    Failure message: %0s.", message_i);
  $fdisplay(report_log_file_desc, "      Simulation Time: %t", $time);
end
endtask // report_test_failed
task report_test_ok;
begin
  $fdisplay(report_log_file_desc, "    PASSED!");
  $fdisplay(report_log_file_desc, "      Simulation Time: %t", $time);
end
endtask // report_test_ok
task report_add_delimiter;
begin
  $fdisplay(report_log_file_desc, "");
  $fdisplay(report_log_file_desc, "%0s", {75{"-"}});
  $fdisplay(report_log_file_desc, "");
end
endtask // report_add_delimiter
task report_add_text;
  input [7999:0] text_i;
begin
  $fdisplay(report_log_file_desc, "  %0s", text_i);
end
endtask // report_add_text
task verbose_test_name;
  input [1599:0] test_i;
begin
  free = 0;
  $fdisplay(verbose_log_file_desc, "");
  $fdisplay(verbose_log_file_desc, "%0s", {75{"-"}});
  $fdisplay(verbose_log_file_desc, "- %0s", test_i);
  $fdisplay(verbose_log_file_desc, "%0s", {75{"-"}});
  $fdisplay(verbose_log_file_desc, "");
  free = 1;
end
endtask // verbose_test_name
task verbose_severe_err;
  input [7999:0] time_i;
  input [7999:0] severe_error_i;
begin
  free = 0;
  $fdisplay(verbose_log_file_desc, "%0s", time_i);
  $fdisplay(verbose_log_file_desc, "*E, Reporting severe error:");
  $fdisplay(verbose_log_file_desc, "    %0s", severe_error_i);
  free = 1;
end
endtask // verbose_severe_err
task verbose_err;
  input [7999:0] time_i;
  input [7999:0] error_i;
begin
  free = 0;
  $fdisplay(verbose_log_file_desc, "%0s", time_i);
  $fdisplay(verbose_log_file_desc, "*E, %0s", error_i);
  free = 1;
end
endtask // verbose_err
task verbose_wrn;
  input [7999:0] time_i;
  input [7999:0] warning_i;
begin
  free = 0;
  $fdisplay(verbose_log_file_desc, "%0s", time_i);
  $fdisplay(verbose_log_file_desc, "*W, %0s", warning_i);
  free = 1;
end
endtask // verbose_wrn
task verbose_msg;
  input [7999:0] time_i;
  input [7999:0] message_i;
begin
  free = 0;
  $fdisplay(verbose_log_file_desc, "%0s", time_i);
  $fdisplay(verbose_log_file_desc, "*N, %0s", message_i);
  free = 1;
end
endtask // verbose_msg
task verbose_val;
  input [7999:0] time_i;
  input [7999:0] message_i;
  input   [31:0] value_i;
begin
  free = 0;
  $fdisplay(verbose_log_file_desc, "%0s", time_i);
  $fdisplay(verbose_log_file_desc, "*N, %0s %0h.", message_i, value_i);
  free = 1;
end
endtask // verbose_val
endmodule