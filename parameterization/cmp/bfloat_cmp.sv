`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.09.2023 17:07:39
// Design Name: bfloat_cmp
// Module Name: bfloat_cmp
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// A bfloat floating point comparator using the submodule add/sub of mac unit 
// 00 if a==b
//01 if a>b
//10 if a<b 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module bfloat_cmp(
  input logic [15:0]a1,
  input logic [15:0]b1,
  input logic clk,
  output logic [1:0]out
);
  
  logic [15:0]c;
//  logic [7:0] ea,eb,bias ,e;
//  logic[6:0]ma,mb,m_f;
  //logic[11:0]mb_temp,ma_temp,msub;
 // logic[7:0]m1;
  //logic g,r,s0,s1,s,s3,p;
  logic s3;
//  logic[15:0]temp;
//  int l;

   logic [1:0] out_comb;
  
  bfloat_add_sub u1(
    .a(a1),
    .b(b1),
    .c(c),
    .cntl(1),  // Set to 0 for addition, 1 for subtraction
    .clk()
  );
  
  always_ff@(posedge clk)begin
  s3<=c[15];
    if (a1[15] > b1[15]) // a[15]=1
      out_comb = 2'b10; // a < b
    else if (a1[15] < b1[15]) // a[15]=0
      out_comb = 2'b01; // a > b
    else begin
      if (a1[15]==0 && b1[15]==0 && a1[14:7] > b1[14:7]) // ea > eb, a > b
        out_comb = 2'b01;
      else if (a1[15]==0 && b1[15]==0 && a1[14:7] < b1[14:7]) // ea < eb, a < b
        out_comb = 2'b10;
      else if (a1[15]==1 && b1[15]==1 && a1[14:7] > b1[14:7]) // ea > eb, a < b
        out_comb = 2'b10;
      else if (a1[15]==1 && b1[15]== 1 && a1[14:7] < b1[14:7]) // ea < eb, a > b
        out_comb = 2'b01;
      else begin 
        if(a1[15:0]==b1[15:0])
          out_comb=2'b00;
        else begin 
          
          
          
          if(s3==1 && a1[15]==1 && b1[15]==1)
            out_comb = 2'b10; //a<b
          else if (a1[15]==1 && b1[15]==1 && s3==0)
            out_comb= 2'b01; //a>b
          else if (a1[15] == 0 && b1[15]== 0 && s3==1)
            out_comb = 2'b10;
          else if (a1[15]==0 && b1[15]==0 && s3== 0)
            out_comb = 2'b01;
        end 
      end 
    end
    end  
    always_ff@(posedge clk) begin
    out<=out_comb;
  end 
endmodule
