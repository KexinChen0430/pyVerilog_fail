module DataMem(A,RD,WD,WE,Clk);
  parameter Width = 32,
            Depth = 256;
  input [Width-1:0] A;
  input [Width-1:0] WD;
  input WE,Clk;
  output [Width-1:0]RD;
  reg [Width-1:0] Data [0:Depth-1];
  //        Self Generate Zeros
  integer i;
  integer file_id;
  initial begin
  for(i=0;i<Depth;i=i+1)
    Data[i]={Width{1'b0}};
  file_id = $fopen("dump.txt");
  end
         Read From File
  initial
  $readmemb("DataMemory.txt", Data);
  assign RD = (A[31:2]<Depth) ? Data[A[31:2]]: {Width{1'bz}};
  //assign RD = (A<Depth) ? Data[A]: {Width{1'bz}};
  always @ (posedge Clk) begin
    if(WE)
      begin
        Data[A[31:2]]=WD;
        $fwrite(file_id,"%d %b  >>  %d %b\n",A,A,WD,WD);
      end
  end
endmodule