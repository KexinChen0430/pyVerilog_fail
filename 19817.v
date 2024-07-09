module that runs for the entire packet length
  timer Ltimer (clk, rst, Lflit_id, Llength, Lruntimer, Ltimesup);
  timer Ntimer (clk, rst, Nflit_id, Nlength, Nruntimer, Ntimesup);
  timer Etimer (clk, rst, Eflit_id, Elength, Eruntimer, Etimesup);
  timer Wtimer (clk, rst, Wflit_id, Wlength, Wruntimer, Wtimesup);
  timer Stimer (clk, rst, Sflit_id, Slength, Sruntimer, Stimesup);
  // Arbiter - State Machine
  // Current state sequential Logic
  always @ (posedge clk) begin
  if(rst)
    currentstate <= `IDLE;
  else
    currentstate <= nextstate;
  end
  // Next state decoder Logic
  always @ (Lreq, Nreq, Ereq, Wreq, Sreq, Ltimesup, Ntimesup, Etimesup, Wtimesup, Stimesup, currentstate) begin
    {Lruntimer, Nruntimer, Eruntimer, Wruntimer, Sruntimer} = 0;
    case(currentstate)
      `IDLE:
        begin
          if(Lreq == 1) begin
            nextstate = `GRANT_L;
          end
          else if(Nreq == 1) begin
            nextstate = `GRANT_N;
          end
          else if(Ereq == 1) begin
            nextstate = `GRANT_E;
          end
          else if(Wreq == 1) begin
            nextstate = `GRANT_W;
          end
          else if (Sreq == 1) begin
            nextstate = `GRANT_S;
          end
          else begin
            nextstate = `IDLE;
          end
        end
      `GRANT_L:
        begin
          if(Lreq == 1 && Ltimesup == 0) begin
            Lruntimer = 1;
            nextstate = `GRANT_L;
          end
          else if(Nreq == 1) begin
            nextstate = `GRANT_N;
          end
          else if(Ereq == 1) begin
            nextstate = `GRANT_E;
          end
          else if(Wreq == 1) begin
            nextstate = `GRANT_W;
          end
          else if(Sreq == 1) begin
            nextstate = `GRANT_S;
          end
          else begin
            nextstate = `IDLE;
          end
        end
      `GRANT_N:
        begin
          if(Nreq == 1 && Ntimesup == 0) begin
            Nruntimer = 1;
            nextstate = `GRANT_N;
          end
          else if(Ereq == 1) begin
            nextstate = `GRANT_E;
          end
          else if(Wreq == 1) begin
            nextstate = `GRANT_W;
          end
          else if(Sreq == 1) begin
            nextstate = `GRANT_S;
          end
          else if(Lreq == 1) begin
            nextstate = `GRANT_L;
          end
          else begin
            nextstate = `IDLE;
          end
        end
      `GRANT_E:
        begin
          if(Ereq == 1 && Etimesup == 0) begin
            Eruntimer = 1;
            nextstate = `GRANT_E;
          end
          else if(Wreq == 1) begin
            nextstate = `GRANT_W;
          end
          else if(Sreq == 1) begin
            nextstate = `GRANT_S;
          end
          else if(Lreq == 1) begin
            nextstate = `GRANT_L;
          end
          else if(Nreq == 1) begin
            nextstate = `GRANT_N;
          end
          else begin
            nextstate = `IDLE;
          end
        end
      `GRANT_W:
        begin
          if(Wreq == 1 && Wtimesup == 0) begin
            Wruntimer = 1;
            nextstate = `GRANT_W;
          end
          else if(Sreq == 1) begin
            nextstate = `GRANT_S;
          end
          else if(Lreq == 1) begin
            nextstate = `GRANT_L;
          end
          else if(Nreq == 1) begin
            nextstate = `GRANT_N;
          end
          else if(Ereq == 1) begin
            nextstate = `GRANT_E;
          end
          else begin
            nextstate = `IDLE;
          end
        end
      `GRANT_S:
        begin
          if(Sreq == 1 && Stimesup == 0) begin
            Sruntimer = 1;
            nextstate = `GRANT_S;
          end
          else if(Lreq == 1) begin
            nextstate = `GRANT_L;
          end
          else if(Nreq == 1) begin
            nextstate = `GRANT_N;
          end
          else if(Ereq == 1) begin
            nextstate = `GRANT_E;
          end
          else if(Wreq == 1) begin
            nextstate = `GRANT_W;
          end
          else begin
            nextstate = `IDLE;
          end
        end
      default:
        begin
          nextstate = `IDLE;
        end
    endcase
  end
endmodule