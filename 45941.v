module. Therefore, I should change my signals to have operations performed then fed into the FFlops
  //rather than the other way around which it is now.
 //Explanation of when to remember identifications:
 //1) The main time we have to remember is during an L2 request. This will include an NID and an L2ID. We need to request a DRID and store
 //   the values in the fast SRAM. The DRID is then passed to main memory. Main memory will send an ack using the DRID. We want to ack back
 //   to the L2 using NID and L2ID, so we locate these values using the DRID. At this point, the DRID can be released to be used by another request.
 //2) The other case where we might want to store an NID and an L2ID is when an L2 performs a displacement. A DRID alocation is not needed here because
 //   main memory will not ack on a write back. In the passthrough case, we can immediately ack back to the L2 when main memory takes in the write back
 //   using the NID and L2ID is gave us for the request. Two ways to implement this is to assign a DRID and store the information. However, it probably
 //   only required a fflop because the writebacks will be in order.
`endif
endmodule