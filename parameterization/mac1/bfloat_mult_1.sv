`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.05.2023 00:47:42
// Design Name: 
// Module Name: bfloat_mult
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module bfloat_mult_1(a,b,c,clk);
  input logic [15:0]a; 
  input logic [15:0]b; 
  output logic [15:0]c;
  input logic clk;
 
 bit sa,sb,sc;
 logic [7:0] ea,eb,ef,ec;
 logic [7:0] ma, mb;
logic [6:0]mc;
 logic [16:0]d;
 
always@(posedge clk)
begin
if((a==16'b0 && b[14:7]==8'b11111111)||(b==16'b0 && a[14:7]==8'b11111111))
c<=16'b1111111111111111;
//Inf
else if(b[14:7]==8'b11111111 || a[14:7]==8'b11111111)
begin
c[15]<=sc;
c[14:7]<=8'b11111111;
c[6:0]<=7'b0;
end
else if(a!=0 && b!=0)
 begin
 c[15] <= sc;
 c[14:7]<= ec;
 c[6:0] <= d[13:7];
 end
else
c<=0;
end
 
 always_comb 
  begin
   sa = a[15];
   sb = b[15];
   sc = sa ^ sb;
   ea = a[14:7];
  eb = b[14:7];
  ef = ea + eb;                                  
 ec=ef-8'b01111111;
  ma = 8'b10000000 + a[6:0];
  mb = 8'b10000000 + b[6:0];
  mc = 7'b0;
  
  d = ma*mb;
  
    
    if(d[15]==1'b1)
      begin
        ec=ec+1;
        d = d >> 1;
      end

    
  end




endmodule
