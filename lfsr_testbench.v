module tb();
 
reg clk,reset,enable;
output [3:0] out;
output [3:0] out1;
reg [3:0] d0;

lfsr_16 dut(out,enable,clk,reset);//calling main program 

initial begin

 clk = 0;
 reset = 1;
 enable = 0;

 #10 reset = 0;
 #1 enable = 1;
 #200 $finish;

end
 
 always  #1  clk = ~clk;


initial 
		begin
			$dumpfile ("shifter.vcd");
			$dumpvars (0,tb);
			#200 $finish;
		end
  
endmodule
