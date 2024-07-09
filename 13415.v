module instantiation
  Queue #(.data_wd(DAT_WD),
	  .q_add_wd(ADD_WD),
	  .q_max_len(DEPTH),
	  .hi(DAT_WD-1),
	  .lo(0)
	  )
    dut(
	.EV_in(EV_in),
	.op(op),
	.cs(cs),
	.rst(rst),
	.clk(clk),
	.EV_out(EV_out),
	.dv(dv),
	.full(full),
	.empty(empty),
	.busy(busy),
	.length(dut_len)
	);
  // dut related tasks
  task Insert_dut(
   input reg [DAT_WD-1:0] key);
    begin
      op = 0;
      cs = 0;
      EV_in = key;
      wait(!busy);
      cs=1;
      op = WRITE_OP;
      @(posedge clk);
      @(negedge clk);
      EV_in = 0;
      cs = 0;
      op = 0;
    end
  endtask
  task Extract_dut(
   output reg [DAT_WD-1:0] key);
    begin
      op = 0;
      cs = 0;
      wait((dv && !busy));
      cs=1;
      op = READ_OP;
      @(posedge clk);
      key = EV_out;
      @(negedge clk);
      cs = 0;
      op = 0;
    end
  endtask
  // inner tasks
  task Print;
    integer i;
    reg [DAT_WD-1:0] top;
    begin
      for (i=0; i<DEPTH; i=i+1) begin
	Extract_gm(top);
	#10;
	$display("%d",top);
      end
    end
  endtask
  // extrac top most element from Heap
  task Extract_gm ;
    output [DAT_WD-1:0] top;
    reg [DAT_WD-1:0] 	smallest;
    reg [ADD_WD-1:0] 	smallest_idx;
    reg [ADD_WD-1:0] 	i;
    begin
      i = 0;
      if( !IsEmpty(gm_len) ) begin
	     top = ram[0];
	     gm_len = gm_len - 1'b1;
	     Swap(0, gm_len);
	     min3(0, LeftChild(i), RigthChild(i), smallest, smallest_idx);
	     while ( smallest_idx != i) begin
	       Swap(smallest_idx, i);
	       i = smallest_idx;
	       min3(i, LeftChild(i), RigthChild(i), smallest, smallest_idx);
	       #5;
	     end
      end
    end
  endtask
  // return min of three elements: left_child_idx, right_child_idx and i
  // and corresponding ram entry
  task min3(	input [ADD_WD-1:0] i, left_child_idx, right_child_idx,
   output [DAT_WD-1:0] smallest,
   output [ADD_WD-1:0] smallest_idx
		);
    begin
      smallest = ram[i];
      smallest_idx = i;
      if( left_child_idx < gm_len ) begin
	smallest  =     (ram[i] < ram[left_child_idx]) ? ram[i] : ram[left_child_idx];
	smallest_idx =  (ram[i] < ram[left_child_idx]) ? i : left_child_idx;
      end
      if ( right_child_idx < gm_len ) begin
	smallest =      (ram[smallest_idx] < ram[right_child_idx]) ? ram[smallest_idx]: ram[right_child_idx];
	smallest_idx =  (ram[smallest_idx] < ram[right_child_idx]) ? smallest_idx : right_child_idx;
      end
    end
  endtask
  // insert key into the heap
  task Insert_gm;
    input [DAT_WD-1:0] key;
    reg [ADD_WD-1:0]   i;
    begin
      if ( !IsFull(gm_len) ) begin
	ram[gm_len] = key;
	i = gm_len;
	gm_len = gm_len + 1'b1;
	while( i>0 && ram[i] < ram[Parent(i)] ) begin
	  Swap( i, Parent(i) );
	  i = Parent(i);
	  #5;
	end
      end
    end
  endtask
  // return true iff heap is  full
  function automatic IsEmpty(input reg [ADD_WD-1:0] length);
    IsEmpty = length == {ADD_WD{1'b0}};
  endfunction
  // return true iff heap is  full
  function automatic IsFull(input reg [ADD_WD-1:0] length);
    IsFull = length == DEPTH;
  endfunction
  // swaps the i'th and j'th indexes in the ram
  task Swap;
    input [ADD_WD-1:0] i, j;
    reg [DAT_WD-1:0]   temp;
    begin
      temp = ram[i];
      ram[i] = ram[j];
      ram[j] = temp;
    end
  endtask
  // returns parent index of idx
  function [ADD_WD-1:0] Parent(input reg [ADD_WD-1:0] idx);
    Parent = (idx-1)/2;
  endfunction
  // returns left child index of idx
  function [ADD_WD-1:0] LeftChild(input reg [ADD_WD-1:0] i);
    LeftChild = (2*i)+1;
  endfunction
  // returns right child index of idx
  function [ADD_WD-1:0] RigthChild(input reg [ADD_WD-1:0] i);
    RigthChild = 2*(i+1);
  endfunction
  //define the clogb2 function
  function integer clogb2;
    input [31:0] value;
    begin
      value = value - 1;
      for (clogb2 = 0; value > 0; clogb2 = clogb2 + 1)
	value = value >> 1;
    end
  endfunction
endmodule