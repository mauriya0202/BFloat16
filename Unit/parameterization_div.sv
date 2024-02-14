`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/23/2023 12:29:50 PM
// Design Name: 
// Module Name: parameterization_div
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


module parameterization_div #(parameter N=2)(a1,b1,c1,clk1);
input bit[16*N-1:0]a1,b1;
input bit  clk1;
output bit [16*N-1:0]c1;
genvar i;

generate
for(i=1;i<N+1;i++)
begin
bfloat_div bf(a1[i*16-1:i*16-16],b1[i*16-1:i*16-16],c1[i*16-1:i*16-16],clk1);
end
endgenerate
endmodule
