module.
  // If page counter on otput of the fifo (counts from zero up )
  // matches ff_stp (and overlay scan line ) it will stop to increment
  // ram_outaddr until  ff_rls will match the count.
  assign 	ff_stp = left_pinl;
  assign 	ff_rls  = xr_start ;
  always  @*
    if (!vsync) begin
      refr_state_next = DC_START;  //no matter what
      //lucy pinl_count_next[9:0] = pinl_regist[9:0];
      pinl_count_next[9:0] = (rsuppr & ~(|ovtl_y))? left_pinl: //load left
                             pinl_regist[9:0];              //load full
      lstat_next= (rsuppr & ~(|ovtl_y))? 2'b10: 2'b11;
      mcdcx_next=10'b0;
      mcdcy_next=12'b0;
      linfr_count_next = 12'b0;
      zcount_next[3:0]=dzoom_regist[3:0];
    end else begin
      case (refr_state) //synopsys parallel_case full_case
	DC_START:   begin
          if(  (pinl_count == 10'b0)
               ||(vactive_regist==12'b0) //check
               ||(!refresh_enable_regist)
               )
            refr_state_next = DC_IDLE;
          else
            refr_state_next = DC_WAIT_FOR_TRANSFER;
          pinl_count_next[9:0] = pinl_count[9:0];
          lstat_next=lstat;
          linfr_count_next=linfr_count;
          zcount_next=zcount;
          mcdcx_next=10'b0;
          mcdcy_next=12'b0;
        end
	DC_WAIT_FOR_TRANSFER:
          if(mcdc_req) begin
            refr_state_next = DC_TRANSFER_DONE;
            if(pinl_count[9:0] == preq[5:0])//new line in next req
            begin
              //increment line counter
              linfr_count_next=incrlc ;
              //change line status and
              //load pages_in_line counter for next line
              case (lstat)  //synopsys parallel_case full_case
                2'b00,
                2'b11: //now is full
                  if (lstf && rsuppr) begin //next is left
                    lstat_next=2'b10;
                    pinl_count_next = left_pinl; end
                  else begin                //next is full
                    lstat_next=2'b11;
                    pinl_count_next = pinl_regist; end
                2'b10: //now is left
                  begin                //next is right
                    lstat_next=2'b01;
                    pinl_count_next = right_pinl; end
                2'b01: //now is right
                  if (lstr ) begin         //next is full
                    lstat_next=2'b11;
                    pinl_count_next = pinl_regist; end
                  else begin               //next is left
                    lstat_next=2'b10;
                    pinl_count_next = left_pinl; end
              endcase
              //x,y, zoom
              if(lstat==2'b10)     //now is left jump to right
              begin
                mcdcx_next=xr_start;
                mcdcy_next= mcdcy;
                zcount_next=zcount; end
              else              //go to left or full(next x=0)
              begin
                mcdcx_next=10'b0;
                if(zcount==4'b0)
                begin
                  mcdcy_next= mcdcy + 1'b1;
                  zcount_next=dzoom_regist; end
                else begin
                  mcdcy_next= mcdcy;
                  zcount_next=zcount - 1'b1; end
              end
            end
            else begin // not end of a line, continue current line
              pinl_count_next[9:0] = pinl_count[9:0] - preq[5:0];
              lstat_next=lstat;
              mcdcx_next=mcdcx + preq[5:0];
              mcdcy_next= mcdcy;
              zcount_next=zcount;
              linfr_count_next=linfr_count; end
          end else begin // no request
            refr_state_next = refr_state;
            pinl_count_next[9:0] = pinl_count[9:0] ;
            lstat_next=lstat;
            mcdcx_next=mcdcx;
            mcdcy_next= mcdcy;
            zcount_next=zcount;
            linfr_count_next=linfr_count;
	  end
	DC_TRANSFER_DONE:           //to ensure no req. and check frame done
          begin
            if (linfr_count==linfr_total) // frame done
              refr_state_next = DC_IDLE;
            else
              refr_state_next = DC_WAIT_FOR_TRANSFER;
            pinl_count_next = pinl_count ;
            lstat_next=lstat;
            mcdcx_next=mcdcx;
            mcdcy_next= mcdcy;
            zcount_next=zcount;
            linfr_count_next=linfr_count;
          end
	DC_IDLE:    begin
          refr_state_next = refr_state; //stay here until vsync
          mcdcx_next=mcdcx;
          mcdcy_next= mcdcy;
          zcount_next=zcount;
          linfr_count_next=linfr_count;
          pinl_count_next = pinl_count ;
          lstat_next=lstat;
        end
      endcase
    end
  always @(posedge pixclock or negedge hnreset)
    if(!hnreset) begin
      refr_state  <= DC_IDLE;
      mcdcx       <= 10'b0;
      mcdcy       <= 12'b0;
      zcount      <= 4'b0;
      pinl_count  <= 10'b0;
      lstat       <= 2'b0;
      linfr_count <= 12'b0;
      rsuppre     <= 1'b0;
      suppr16up   <= 1'b0;
    end else if(!dcnreset && crtclock) begin
      refr_state  <= DC_IDLE;
      mcdcx       <= 10'b0;
      mcdcy       <= 12'b0;
      zcount      <= 4'b0;
      pinl_count  <= 10'b0;
      lstat       <= 2'b0;
      linfr_count <= 12'b0;
      rsuppre     <= 1'b0;
      suppr16up   <= 1'b0;
    end else if (crtclock) begin
      refr_state  <= refr_state_next;
      mcdcx       <= mcdcx_next;
      mcdcy       <= mcdcy_next;
      zcount      <= zcount_next;
      pinl_count  <= pinl_count_next;
      lstat       <= lstat_next;
      linfr_count <= linfr_count_next;
      rsuppre     <= (ovnokey & ~ovignr_regist);
      suppr16up   <= ovignr16l_regist;
    end
endmodule