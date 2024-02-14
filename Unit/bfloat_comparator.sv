`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/24/2023 06:33:59 PM
// Design Name: 
// Module Name: bfloat_comparator
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


module bfloat_comparator(
  input bit [15:0]a2,
  input bit [15:0]b2,
  input logic clk,
  output bit [15:0]out
  
);
  
  bit [15:0]a1,temp;
  bit [15:0]b1,a,b;
  bit [15:0]c;
  bit k;
//  logic [7:0] ea,eb,bias ,e;
//  logic[6:0]ma,mb,m_f;
  //logic[11:0]mb_temp,ma_temp,msub;
 // logic[7:0]m1;
  //logic g,r,s0,s1,s,s3,p;
  bit s3;
//  logic[15:0]temp;
//  int l;

   bit [1:0] out_comb;
   
  always@(posedge clk) 
  begin
  a<=a2;
  b<=b2;
  
  out<=out_comb;
  
  end 
  

  always_comb
  begin
  //00 for equal to
  //01 for less than a<b
  //11 for others

a1=a;
b1=b;

if(b1!=0)
b1[15]=~b1[15];

   
if(a1[14:7]<b1[14:7]) //making the larger number a
      begin
        temp=a1;
        a1=b1;
        b1=temp;
      end
  else if(a1[14:7]==b1[14:7])
  begin
    if(a1[6:0]<b1[6:0])
        begin
        temp=a1;
        a1=b1;
        b1=temp;
        end
  end
  
  k=a2[15]; 
  s3=((a1[15]==1 && b1[15]==1 && k==0) || (a1[15]==0 && b1[15]==0 && k==1) || (a1[15]==1 && k==0));
  
   if (a1==b1)
   out_comb=2'b00;
   else 
    begin
        if(s3)
        out_comb=2'b01;
        else
        out_comb=2'b11;
    end 
  
  end
  
  

  

endmodule
