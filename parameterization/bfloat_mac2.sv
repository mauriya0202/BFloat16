`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/11/2023 09:40:07 AM
// Design Name: 
// Module Name: bfloat_mac
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


module bfloat_mac2(a,b,clk,out);
input bit[15:0]a,b;
input bit  clk;
output bit [15:0]out;
bit [15:0] fprod, fadd;
bit [15:0] data_a, data_b, fprod1;

always@(posedge clk)
begin
data_a<=a;
data_b<=b;
end

bfloat_mult_1 mul(data_a,data_b,fprod,clk);
bfloat_add_sub add(fprod,out,fadd,0,clk);

assign out=fadd;




endmodule
