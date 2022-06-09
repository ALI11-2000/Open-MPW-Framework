module sensor;

 integer i;
 reg [31:0] heat;
 reg clk;

 initial begin
	 clk = 0;
	 forever #5 clk = !clk;
 end

 initial begin
	 $dumpfile("simple.vcd");
	 $dumpvars(0,sensor);
	 heat = 0;
	 for(i=0;i<=100;i++) begin
		 @(posedge clk);
		 heat = heat + 5;
	 end
	 $finish;
 end
endmodule
