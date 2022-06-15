    module tb_adder(input clk);
      reg [2:0] a,b;
      wire [3:0] c;
      adder dut(.a(a), .b(b), .c(c));
      initial 
         begin
            $display("Starting Simulation of adder");
            a = 1;
            b = 2;
            #10
            a = 2;
            b = 2;
            #10
            a = 3;
            b = 1;
         end
   endmodule