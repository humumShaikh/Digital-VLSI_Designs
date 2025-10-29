`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CWIR3
// Engineer: copperwire
// 
// Create Date: 29.10.2025 10:16:56
// Design Name: 
// Module Name: setter
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


module setter(
    input wire clk,
    input wire [3:0] address,
    input wire load,
    input wire reset,
    output reg [6:0] data
    );
    
    reg [6:0] ROM [0:15];
    
    always @(*)
    begin
        ROM[0] <= 89;
        ROM[1] <= 69;
        ROM[2] <= 77;
        ROM[3] <= 12;
        ROM[4] <= 08;
        ROM[5] <= 15;
        ROM[6] <= 50;
        ROM[7] <= 11;
        ROM[8] <= 47;
        ROM[9] <= 31;
        ROM[10] <= 37;
        ROM[11] <= 01;
        ROM[12] <= 00;
        ROM[13] <= 13;
        ROM[14] <= 05;
        ROM[15] <= 96;
    end
    
    always @(posedge clk)
    begin
        if(reset) data <= 0;
        else if(load) data <= ROM[address];
    end
    
endmodule
