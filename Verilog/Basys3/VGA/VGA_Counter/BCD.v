`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CWIR3
// Engineer: copperwire
// 
// Create Date: 16.10.2025 10:30:59
// Design Name: 
// Module Name: BCD
// Project Name: 
// Target Devices: Basys3    (xc7a35tcpg236-1)
// Revision 0.01 - File Created
// Additional Comments:
//////////////////////////////////////////////////////////////////////////////////


module BCD(
    input wire [6:0]bin,
    output wire [3:0]TD,UD
    );
    
    assign TD = bin / 10;
    assign UD = bin % 10;
    
endmodule
