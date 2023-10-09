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
  input logic [15:0]a,
  input logic [15:0]b,
  input logic clk,
  output logic [1:0]out
);

  
  logic [15:0]c,a1,b1;

  logic s3;


   logic [1:0] out_comb;
  
  bfloat_add_sub u1(
    .a(a1),
    .b(b1),
    .c(c),
    .cntl(1),  // Set to 0 for addition, 1 for subtraction
    .clk(clk)
  );
  
  always_comb  begin
  s3=c[15];

       if(a1[15:0]==b1[15:0])
          out_comb=2'b00;
       else if (a1[15]==1 && b1[15]==0) // a[15]=1
            out_comb = 2'b10; // a < b
        else if (a1[15]==0 && b1[15]==1) // a[15]=0
            out_comb = 2'b01; // a > b
          
          
          
          else if(s3==1 && a1[15]==1 && b1[15]==1)
            out_comb = 2'b10; //a<b
          else if (a1[15]==1 && b1[15]==1 && s3==0)
            out_comb= 2'b01; //a>b
          else if (a1[15] == 0 && b1[15]== 0 && s3==1)
            out_comb = 2'b10;
          else if (a1[15]==0 && b1[15]==0 && s3== 0)
            out_comb = 2'b01;
          
        end 

    always_ff@(posedge clk) begin
    a1<=a;
    b1<=b;
    out<=out_comb;
  end 
endmodule
