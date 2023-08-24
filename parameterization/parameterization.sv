`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/22/2023 01:48:36 PM
// Design Name: 
// Module Name: parameterization
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


module parameterization #(parameter N=4)(a1,b1,clk1,out1);
input bit[16*N-1:0]a1,b1;
input bit  clk1;
output bit [16*N-1:0]out1;
genvar i;

generate
for(i=1;i<N+1;i++)
begin
bfloat_mac2 bf(a1[i*16-1:i*16-16],b1[i*16-1:i*16-16],clk1,out1[i*16-1:i*16-16]);
end
endgenerate


endmodule
