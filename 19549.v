module fifo(consumer_data,producer_data, consumer_req);
  input consumer_req;
  input producer_data;
  output consumer_data;
  reg [3:0] consumer_data;
  reg [3:0] producer_data;
  reg consumer_req;
  int i;
  int j;
  int last;
  int start;
  int diff;
  int last_s;
  int start_s;
  reg [3:0] queue [9:0];
  initial
    begin
      assign last_s = last % 10;
      assign start_s = start % 10;
      assign diff = last - start;
      //$monitor("producer data = %b %d",producer_data,producer_data);
      //producer_data = 0;
      #30for(j=0;j<10;j++)
        begin
          //$display("queue[%d] =%d at time =%t",j,queue[j],$time);
        end
    end
 //add_data thingy
  always @ (producer_data)
    if((diff < 10))
      begin
    begin
      queue[last_s] = producer_data;
      //$display("add queue[%d] is %d",last_s,queue[last_s]);
      #0 last = last +1;
    end
      end else begin
        $finish;
      end
  //pop data thingy
  always @(consumer_req)
    begin
      if(consumer_req == 1)
        begin
          if(diff != 0)
            begin
             // $display("pop queue[%d] = %d",start_s,queue[start_s]);
              consumer_data = queue[start_s];
          //$display("consumer data = %d",consumer_data);
          #0 start = start +1;
            end
          /*
          queue[start] = consumer_data;
          #0 start = start + 1;
          $display("start = %d at time = %t",start,$time);
          $display("consumer data = %d",consumer_data);
          */
        end
    end
endmodule