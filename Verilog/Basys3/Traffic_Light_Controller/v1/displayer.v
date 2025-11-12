`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CWIR3
// Engineer: copperwire
// 
// Create Date: 11.11.2025 08:33:38
// Design Name: 
// Module Name: displayer
// Project Name: 
// Target Devices: xc7a35tcpg236-1    (Basys3)
// Tool Versions: 
// Description: Takes the ten's digit and the unit's digit of the seconds from the previous module and then displays them one by one since the segment lines are common for all 4 digits
// Change the max_count value to change the refresh rate
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module displayer(
    input wire clk,
    input wire [7:0] msb,
    input wire [7:0] lsb,
    output reg [3:0] digit,
    output reg [7:0] seg
    );
    
    reg [15:0] max_count = 20_000;
    reg [15:0] count = 0;
    
    reg d = 0;
    
    always @(posedge clk)
    begin
    
    if(count == max_count)
    begin
        count <= 0;
        
        if(d == 0)
        begin
            digit <= 4'b1110;
            seg <= lsb;
            d <= 1;
        end
        
        else if(d == 1)
        begin
            digit <= 4'b1101;
            seg <= msb;
            d <= 0;
        end
        
    end
    
    else if(count != max_count) count <= count + 1;
    
    end //always 
    
    
endmodule
