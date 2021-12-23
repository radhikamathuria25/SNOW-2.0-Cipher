module lfsr_16(out,enable,clk,reset);

output [3:0] out;
reg [3:0] d0,d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15;
integer i;

assign out=d15;
assign out1=d5;//viewing an intermediate state 

input enable, clk, reset;
wire feedback;

assign feedback =d2^d3;

always @(posedge clk)
if (reset) 
begin 

  d0 <= 4'hD;//initialising d0 of the LFSR  with 4 bit value
  d1 <= 4'hA;
  d2 <= 4'h2;
  d3 <= 4'h1;
  d4 <= 4'h4;
  d5 <= 4'h5;
  d6 <= 4'hB;
  d7 <= 4'hA;
  d8 <= 4'h2;
  d9 <= 4'h1; 
  d10 <= 4'hC;
  d11 <= 4'hE;
  d12 <= 4'h2;
  d13 <= 4'h5;
  d14 <= 4'h6;
  d15 <= 4'hA;
 
end

else if (enable)
begin
  d15<=d14;
  d14<=d13;
  d13<=d12;
  d12<=d11;
  d11<=d10;
  d10<=d9;
  d9<=d8;
  d8<=d7;
  d7<=d6;
  d6<=d5;
  d5<=d4;
  d4<=d3;  
  d3<=d2;
  d2<=d1;
  d1<=d0;
  d0<=feedback; 
end

endmodule 

