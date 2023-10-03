`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/28/2023 09:18:15 AM
// Design Name: 
// Module Name: bfloat_div
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


module bfloat_div(a1,b1,c,clk);
  input bit [15:0]a1; // = 16'b0100001011110111 dividend 123.875
  input bit [15:0]b1; // = 16'b0100001000110111 divisor 45.83
  output bit [15:0]c;
  input logic clk;
  
  bit [15:0]a;
  bit [15:0]b;
  bit sa ;
  bit sb ;
  bit sc ;
  logic [7:0]ea;
  logic [7:0]eb;
  logic [7:0]ec;
  logic [7:0]ma;
  logic [7:0]mb;
  logic [7:0]mc;
  logic [17:0]rq;
  
  always@(posedge clk)
  begin
  a<=a1;
  b<=b1;
  if(a[14:7]==8'b11111111 && b[14:7]==8'b11111111) //inf/inf
  c<=16'b1111111111111111;
  else if(a==16'b0 && b==16'b0) //0/0
  c<=16'b1111111111111111;
  else if(a[14:7]==8'b11111111 && b[14:7]!=8'b11111111) //inf/b
  begin
  c[15]<=sc;
  c[14:7]=8'b11111111;
  c[6:0]=7'b0;
  end
  else if(a==16'b0 && b!=16'b0) //0/b
  c<=16'b0;
  else if(a!=16'b0 && b==16'b0) //a/0
  begin
  c[15]<=sc;
  c[14:7]=8'b11111111;
  c[6:0]=7'b0;
  end
  else if(a[14:7]!=8'b11111111 && b[14:7]==8'b11111111) //a/inf
  c<=16'b0;
  else
  begin
  c[15]<=sc;
  c[14:7]<=ec;
  c[6:0]<=mc[6:0];
  end
  end
  
  
  always_comb
    begin
   sa = a[15];
  sb = b[15];
 sc = sa ^ sb;
 ea = a[14:7];
  eb = b[14:7];
  ec = ea - eb + 8'b01111111;
  ma = 8'b0 + a[6:0];
  mb = 8'b0 + b[6:0];
 mc = 8'b0;
  rq = 18'b0;
    
      ma[7]=1;
      mb[7]=1;
      rq[14:7] = ma[7:0];
      for(int t=0;t<8;t++)
        begin
          rq=rq<<1;
          rq[17]=0;
          rq[17:8] = rq[17:8] - mb[7:0];
          if(rq[17]==1)
            begin
              rq[17:8] = rq[17:8] + mb[7:0];
            end
          else
            begin
              rq[0] = 1;
            end
        end
      mc=rq[7:0];
      for(int l=0;l<9;l=l+1)
    begin
    if(~mc[7])
        begin
        if(mc!=0)
        begin
          mc=mc<<1;
          ec=ec-1;
          if(mc[7])
          begin
          break;
          end
        end
      else
        mc=mc;
        end
        end
      
    end
  
endmodule
