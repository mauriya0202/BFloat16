`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.03.2023 22:06:11
// Design Name: 
// Module Name: bfloat_adder_tb
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


module bfloat_adder_tb();
reg [15:0]a,b;
wire [15:0]c;

bfloat_adder DUT(a,b,c);
initial begin
a=16'b0100001000011000;
b=16'b0100000101010000;
#250 $finish;
end
endmodule
