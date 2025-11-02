`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CWIR3
// Engineer: copperwire
// 
// Create Date: 02.11.2025 19:59:24
// Design Name: 
// Module Name: piso
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


module sipo(
    input wire clk,
    input wire Rx,
    output reg [7:0] data
    );
    
    reg [3:0] counter = 7;
    
    reg flag = 0;
    
    always @(negedge clk)
    begin
    if (flag == 0) flag <= 1;
    
    else if(counter != 0    && flag == 1)
    begin
        data[counter] <= Rx;
        counter <= counter - 1;
    end
    else if(counter == 0)
    begin
        data[counter] <= Rx;
        counter <= 7;
    end
    end
    

    
endmodule
