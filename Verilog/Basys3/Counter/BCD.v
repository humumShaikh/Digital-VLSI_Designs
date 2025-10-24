`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CWIR3
// Engineer: copperwire
// 
// Create Date: 16.10.2025 10:30:59
// Design Name: 
// Module Name: BCD
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Converts two digit decimal value into its BCD equivalent form as MSB and LSB (or Ten's and Unit's digits)
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module BCD(
    input wire [5:0]bin,
    output wire [3:0]MSB,LSB
    );
    
    assign MSB = bin/10;
    assign LSB = bin%10;
    
endmodule
