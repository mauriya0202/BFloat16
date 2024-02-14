`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2023 05:55:52 PM
// Design Name: 
// Module Name: parameterization_top
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


module parameterization_top #(parameter N=2)(a1,b1,cntl1,clk1,out1,control,out);
input bit[16*N-1:0]a1,b1;
input bit  clk1;
input bit  cntl1;
inout [16*N-1:0]out1;

input bit [1:0]control;
bit [16*N-1:0]c2,c3;
output bit [16*N-1:0]out;

parameterization p_mac(a1,b1,cntl1,clk1,out1);
parameterization_div p_div(a1,b1,c2,clk1);
parameterization_comparator p_c(a1,b1,c3,clk1);

always_comb
begin
if(control==2'b00)//mac
out=out1;
else if(control==2'b01)//divider
out=c2;
else if(control==2'b10)//comparator
out=c3;
else
out=32'b0;

end

//assign out1=out;

endmodule
