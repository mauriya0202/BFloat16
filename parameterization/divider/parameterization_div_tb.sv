`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/22/2023 10:18:24 PM
// Design Name: 
// Module Name: parameterization_tb
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


module parameterization_div_tb#(parameter N=4)();
reg clk;
reg [16*N-1:0] a;
reg [16*N-1:0] b;
wire [16*N-1:0] c;

parameterization_div DUT(a,b,c,clk);
initial
clk=1;
always #5 clk=~clk;

initial begin
a = 64'b1100000101110000110000010111000011000001011100001100000101110000;//15
b = 64'b0100000100100000010000010010000001000001001000000100000100100000;//-10
		
#10
a = 64'b0100000010000000010000001000000001000000100000000100000010000000;//4
b = 64'b0100000001000000010000000100000001000000010000000100000001000000;//3
#100 $finish;
end

endmodule
