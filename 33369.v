module
   10.14.97 removed host reset from synchronizers, still reset from
   registers (on host clock) will be synchronized
  always @(posedge pixclk or negedge hnreset)
	if(!hnreset) crtintdd_tog[1] <= 1'b0;
	else if(crtintdd[1] && crtclock) crtintdd_tog[1] <= ~crtintdd_tog[1];
  always @(posedge pixclk or negedge hnreset)
	if(!hnreset) crtintdd_tog[0] <= 1'b0;
	else if(crtintdd[0] && crtclock) crtintdd_tog[0] <= ~crtintdd_tog[0];
  // Removed vga_en from equation
  always @(posedge pixclk)
    if (crtclock) begin
      dc_nreset_dd <= dc_nreset_d;
      dc_nreset_d  <= (  syncsenable_regist[1] | syncsenable_regist[0]
			 | videnable_regist | refrenable_regist);
    end
  assign dcnreset  = dc_nreset_dd;
  assign hcounter_next[13:0] = ((hcounter==htotal_add) |
				(htotal_add==14'b0)) ?
				 14'h1 : hcounter[13:0] + 14'h1;
  /******************** hblank , hsync comparators *********/
  // keep this priority
  assign hsync_next = (hcounter==hendsync_add) ? 1'b1 :
	 ((hcounter==hfporch_regist) |
	  ((hcounter==htotal_add) & (hfporch_regist==14'b0))) ?
	   1'b0 : hsync;
  assign hblank_next=((hcounter==htotal_add) || (htotal_add==14'b0))? 1'b0
         : (hcounter==hblank_regist)?  1'b1: hblank;
  assign hsync_d_next=hsync;
  assign hblank_d_next=hblank;
  /****** equalizing impulses comparator ********/
  assign equalize_next=((hcounter==endequal_add)||(hcounter==endequalsec_add))?
			 1'b1:
         ( (hcounter==hfporch_regist)
           ||((hcounter==htotal_add) &&(hfporch_regist==14'b0))
           ||(hcounter==halfline_add)
           )?
         1'b0: equalize;
  assign equalize_d_next=equalize;
  /********* vertical serration comparator    ******/
  assign serr_next=(  (hcounter==hfporch_regist)
                      ||((hcounter==htotal_add) &&(hfporch_regist==14'b0))
                      ||(hcounter==halfline_add)
                      )? 1'b0:
         (hfpbhs)?
           ((hcounter== serrlongfp_substr)||(hcounter== serr_substr))?
         1'b1: serr
         :((hcounter==serr_substr)||(hcounter==serrsec_substr))?
         1'b1: serr;
  assign serr_d_next=serr;
  /***** vertical timming
   in interlaced mode  the counter increments on every half line
   in noninterlaced it increments on every line (after first clock equal
   or hsync low . Vtotal,  in interlaced is the number of lines per frame !!
   vsync width and vertical front porch is in number of half-lines,
   vertical blank in number of halflines(per field) or number of lines per
   frame  **/
  // added lcounter_enstat for I3 07.30.96 (for line count status register)
  // this is  active low one clock impulse, posedge will give an extra delay
  always @*
    case(crtintl_regist) //synopsys parallel_case full_case
      1'b0: if(!hsync && hsync_d) begin
        vcounter_next= (  (vcounter[11:0]==vtotal_add[11:0])
                          ||(vtotal_add==12'b0)
                          )? 1'b1 : vcounter+1'b1;
        lcounter_enstat_next=1'b0;
      end else begin
        vcounter_next=vcounter;
        lcounter_enstat_next=1'b1;
      end
      1'b1: if(!equalize && equalize_d) begin
        vcounter_next= (  (vcounter[11:0]==vtotal_add[11:0])
                          ||(vtotal_add==12'b0)
                          )? 1'b1 : vcounter+1'b1;
        lcounter_enstat_next=1'b0;
      end else begin
        vcounter_next=vcounter;
        lcounter_enstat_next=1'b1;
      end
    endcase
  /* vertical sync in interlaced it's in number of half- lines */
  assign    vsync_next= (  (!equalize && equalize_d &&  crtintl_regist)
                           ||(!hsync    && hsync_d    && !crtintl_regist)
			   ) ?
			(vcounter[11:0]== vendsync_add[11:0])? 1'b1:
			(
                         (vcounter == vfporch_regist)
                         ||((vcounter== vtotal_add)&&(vfporch_regist==12'b0))
			 )? 1'b0: vsync
			:vsync;
  assign    vsync_d_next=(posvs_regist && !compsync_regist)? ~vsync: vsync;
  //delayed to output undelayed to vport;
  // added to synchronize later display address start with vertical syn
  // for panning  and scrolling
  assign    vsync_dl_next = vsync;
  assign    addr_load_next = (!vsync && vsync_dl)? 1'b1: 1'b0;
  // vertical impuls only if composite selected , it assumes alw.neg pol
  always @*
    vimp_next=(vsync_d && !vsync)? 1'b0: 1'b1;
  /* vertical blank **/
  assign    vblank_next=  (  (!equalize && equalize_d &&  crtintl_regist)
                             ||(!hsync    && hsync_d    && !crtintl_regist)
			     ) ?
			    (vcounter[11:0]== vtotal_add[11:0])? 1'b0:
            (vcounter[11:0]== vblank_regist[11:0])? 1'b1: vblank
            : vblank;
  always @*  vblankd_next=vblank;
  /******** composite blank ********/
  assign    cblank = hblank_d & vblank;  // to CRTCONTR and DC_TOP
  assign    cblank_d_next= cblank;
  //  to output reclock later on falling edge
  /* equalization region (here, including vsync ), only for interlaced */
  assign    equalreg_next=     ((!equalize) && equalize_d
				&& (vcounter[11:0]== vtotal_add[11:0])
				)? 1'b1:
            ((!equalize) && equalize_d
             && (vcounter[11:0]== vendequal_add[11:0])
             )? 1'b0:  equalreg;
  /*** field sign - it changes with leading (falling) edge of vertical blank.
   "0" indicates-> even
   field will start after vblank ends, "1" odd field. ************/
  assign    fsign_next= (!equalize && equalize_d
			 && (vcounter[11:0]== vtotal_add[11:0])
			 )?  ~hsync & crtintl_regist: fsign;
  /* horizontal- composite sync , if composite -> always negative ***********/
  always @*
    casex({compsync_regist,crtintl_regist,poshs_regist}) //synopsys parallel_case full_case
      3'b0x0: hcsync_next=hsync_d;
      3'b0x1: hcsync_next=~hsync_d;
      3'b10x:
	case (vsync) //synopsys parallel_case full_case
	  1'b0: hcsync_next=serr_d;
	  1'b1: hcsync_next=hsync_d;
        endcase
      3'b11x:
	casex({equalreg,vsync}) //synopsys parallel_case full_case
	  2'b0x: hcsync_next=hsync_d;
          2'b10: hcsync_next=serr_d;
          2'b11: hcsync_next=equalize_d;
        endcase
    endcase
  always @*
    if (!vblank & vblankd) begin
      vicount_next=(vicount[7:0]==vicount_regist[7:0])?
                   8'b0 : vicount + 1'b1;
      onfield=(vicount[7:0]==vicount_regist[7:0])? 1'b1: 1'b0;
    end else begin
      vicount_next[7:0]=vicount[7:0];
      onfield=1'b0;
    end
  //  interrupt [1] before  specified line  0-> start vblank
  //   before line #6 on screen write (vblank_regist+6)into hicount_regist
  //   if before line#0 write (vblank + vactive) into hicount_regist
  //   the same in interlaced
  always @*
    if(!hblank && hblank_d && (vcounter[11:0]==hicount_regist[11:0])
       )  online=1'b1;
    else online=1'b0;
  always @*
    crtint_next[1:0]={online , onfield};  // only to make synops. happy
  always @* crtintd_next=crtint;   /* delay 2 clocks to to be in blank
  always @*
    crtintdd_next=crtintd;
  always @(posedge pixclk or negedge hnreset)
    if(!hnreset) begin
      dcblank_o <= 1'b0;
      cblank_dd<=1'b1;
      cblank_d<=1'b1;
    end
    else if(!dcnreset) begin
      dcblank_o <= 1'b0;
      cblank_dd<=1'b1;
      cblank_d<=1'b1;
    end
    else begin
      dcblank_o  <= (videnable_regist   & cblank_dd);
      cblank_dd<=cblank_d;
      cblank_d<=cblank_d_next;
    end
  always @(posedge pixclk or negedge hnreset)
    if(!hnreset) begin
      fsign<=1'b0;
      hcsync<=1'b1;
      vsync<=1'b1;
      vsync_d<=1'b1;
      vblank<=1'b0;
      vblankd<=1'b0;
      equalreg<=1'b0;
      hblank<=1'b1;
      hblank_d<=1'b1;
      hsync<=1'b1;
      hsync_d<=1'b1;
      equalize<=1'b1;
      equalize_d<=1'b1;
      serr<=1'b1;
      serr_d<=1'b1;
      hcounter<=14'b0;
      vcounter<=12'b0;
      vicount<=8'b0;
      crtint<=2'b0;
      crtintd<=2'b0;
      crtintdd<=2'b0;
      vimp<=1'b0;
      vsync_dl<=1'b0;
      addr_load<=1'b0;
      lcounter_enstat<=1'b1; //I3
      dchcsync_o <= 1'b1;
      dcvsync_o <= 1'b1;
      one_half <= 1'b0;
    end else if(!dcnreset && crtclock) begin
      fsign<=1'b0;
      hcsync<=1'b1;
      vsync<=1'b1;
      vsync_d<=1'b1;
      vblank<=1'b0;
      vblankd<=1'b0;
      equalreg<=1'b0;
      hblank<=1'b1;
      hblank_d<=1'b1;
      hsync<=1'b1;
      hsync_d<=1'b1;
      equalize<=1'b1;
      equalize_d<=1'b1;
      serr<=1'b1;
      serr_d<=1'b1;
      hcounter<=14'b0;
      vcounter<=12'b0;
      vicount<=8'b0;
      crtint<=2'b0;
      crtintd<=2'b0;
      crtintdd<=2'b0;
      vimp<=1'b0;
      vsync_dl<=1'b0;
      addr_load<=1'b0;
      lcounter_enstat<=1'b1; //I3
      dchcsync_o <= 1'b1;
      dcvsync_o <= 1'b1;
      one_half <= 1'b0;
    end else if (crtclock) begin
      fsign<=fsign_next;
      hcsync<=hcsync_next;
      vsync_d<=vsync_d_next;
      vsync<=vsync_next;
      vblankd<=vblankd_next;
      vblank<=vblank_next;
      equalreg<=equalreg_next;
      hblank_d<=hblank_d_next;
      hblank<=hblank_next;
      hsync_d<=hsync_d_next;
      equalize_d<=equalize_d_next;
      hsync<=hsync_next;
      equalize<=equalize_next;
      serr_d<=serr_d_next;
      serr<=serr_next;
      vcounter<=vcounter_next;
      hcounter <= hcounter_next;
      vicount<=vicount_next;
      crtint<=crtint_next;
      crtintd<=crtintd_next;
      crtintdd<=crtintdd_next;
      vimp<=vimp_next;
      vsync_dl<=vsync_dl_next;
      addr_load<=addr_load_next;
      lcounter_enstat<= lcounter_enstat_next; //I3
      //    reclock all output signals (syncs,blank ) on pos edge of clock,
      //    they go to RAMDAC
      dchcsync_o <= (~syncsenable_regist[0] | hcsync);
      dcvsync_o  <= (!syncsenable_regist[1])? 1'b1:
                    (compsync_regist)? vimp:  vsync_d;
      one_half <= ~one_half;
    end
  assign lcounter_stat = vcounter;
endmodule