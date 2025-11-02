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


module piso(
    input wire clk,
    input wire [7:0] data,
    output reg tx
    );
    
    reg [3:0] counter = 7;    
    
    always @(posedge clk)
    begin
    if(counter != 0)
    begin
        tx <= data[counter];
        counter <= counter - 1;
    end
    else if(counter == 0)
    begin
        tx <= data[counter];
        counter <= 7;
    end
    end
    
endmodule
