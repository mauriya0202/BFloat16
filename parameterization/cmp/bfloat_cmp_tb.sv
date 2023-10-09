`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.09.2023 17:24:55
// Design Name: 
// Module Name: bfloat_cmp_tb
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


// Code your testbench here
// or browse Examples
module bfloat_cmp_tb;

    logic clk;
    logic [15:0]a1,b1;
    logic [1:0]out;
    
    bfloat_cmp u1(
        .a1(a1),
        .b1(b1),
        .clk(clk),
        .out(out)
        );
        
        initial begin 
        clk=0;
        forever #10 clk = ~ clk;
        end 
        
        initial begin 
        a1 = 16'b0;
        b1 = 16'b0;
        #60;
        
        // Test case 1: a1 = 2.456, b1 = 1.112
        a1 = 16'b0100000000011101; 
        b1 = 16'b0011111110001110;
        #60;
        $display("Test Case 1: a > b -> Expected: 01, Output: %b", out);
        
        // Test case 2: a1 = -2.456, b1 = -1.112
        a1 = 16'b1100000000011101;
        b1 = 16'b1011111110001110; 
        #60;
        $display("Test Case 2: a < b -> Expected: 10, Output: %b", out);
        
        // Test case 3: a1 = 0, b1 = 0
        a1 = 16'b0;
        b1 = 16'b0;
        #60;
        $display("Test Case 3: a = b -> Expected: 00, Output: %b", out);
        
        
        //Test case 4: 
        a1 = 16'b1011111110011001; //-1.2
        b1 = 16'b1011111110100110; //-1.3
        #60;
        $display("Test case 4: a > b -> Expected :01, Output :%b ",out);
        
        //Test case 5: 
        a1=16'b1011111001001100; //-0.2
        b1=16'b1011111010011001; //-0.3
        #60;
       
        $display("Test case 5: a > b -> Expected :01, Output :%b ",out);
        
        //Test case 6:
        a1=16'b1100000000011001; //-2.4
        b1=16'b1100000000010011; //-2.3
        #60;
        $display("Test case 6: a < b -> Expected :10, Output :%b ",out);
        $finish ;
        end 
endmodule 
