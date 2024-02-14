`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/24/2023 07:46:58 PM
// Design Name: 
// Module Name: parameterization_comparator
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


module parameterization_comparator #(parameter N=2)(a1,b1,c1,clk1);
input bit[16*N-1:0]a1,b1;
input bit  clk1;
output bit [16*N-1:0]c1;

genvar i;

generate
for(i=1;i<N+1;i++)
begin
bfloat_comparator bf(a1[i*16-1:i*16-16],b1[i*16-1:i*16-16],clk1,c1[i*16-1:i*16-16]);
end
endgenerate
endmodule
