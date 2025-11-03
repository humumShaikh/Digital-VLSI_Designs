`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CWIR3
// Engineer: copperwire
// 
// Create Date: 03.11.2025 10:31:07
// Design Name: 
// Module Name: displayer
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


module displayer(
    input wire clk,
    input wire [7:0] D3,
    input wire [7:0] D2,
    input wire [7:0] D1,
    input wire [7:0] D0,
    output reg [3:0] AN,
    output reg [7:0] seg
    );
    
    reg [9:0] max_count = 1_000;
    reg [9:0] count = 0;
    reg [1:0] dCount = 3;
    
    always @(posedge clk)
    begin
    
        if(count == max_count)
        begin
        case (dCount)
        3   :   begin
                AN <= 4'b0111;
                seg <= D3;
                dCount <= 2;
                end
        2   :   begin
                AN <= 4'b1011;
                seg <= D2;
                dCount <= 1;
                end         
        1   :   begin
                AN <= 4'b1101;
                seg <= D1;
                dCount <= 0;
                end         
        0   :   begin
                AN <= 4'b1110;
                seg <= D0;
                dCount <= 3;
                end         
        endcase
        
        count <= 0;
        end
        
        
        else if(count != max_count) count <= count + 1;
        
    end
    
endmodule
