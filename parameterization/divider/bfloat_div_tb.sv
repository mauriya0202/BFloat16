`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/11/2023 01:48:02 PM
// Design Name: 
// Module Name: bfloat_mult_sv_tb
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


module bfloat_div_tb();

reg [15:0]a,b;
reg clk;
wire [15:0]c;

bfloat_div DUT(a,b,c,clk);
initial clk=0;
always #5 clk=~clk;
initial begin

b=16'b0100000100100000; //10
a=16'b1100000101000000; //12
#10
b=16'b1100000100100000; //10
a=16'b1100000101000000; //12
#250 $finish;

end
endmodule
