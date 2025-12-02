`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.12.2025 14:56:10
// Design Name: 
// Module Name: func
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


module func(
    input wire A,
    input wire B,
    input wire S,
    output wire F
);
    
//    wire x , y;
    
//    and a1(y,A,B);
//    xor x1(x,A,B);
    
    assign F = S ? A & B : A ^ B;
    
endmodule
