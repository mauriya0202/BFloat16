`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/27/2023 10:28:02 AM
// Design Name: 
// Module Name: bfloat_sub_tb
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


module bfloat_sub_tb();
reg [15:0]a1,b1;
wire [15:0]c;

bfloat_sub DUT(a1,b1,c);
initial begin
b1=16'b0100000101110000; //15
a1=16'b1100000100100000; //-10 
#250 $finish;

end
endmodule
