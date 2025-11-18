`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CWIR3
// Engineer: copperwire
// 
// Create Date: 14.11.2025 22:15:41
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
    input wire [7:0] o1,
    input wire [7:0] o2,
    input wire [7:0] o3,
    input wire [7:0] o4,
    output reg [3:0] digit,
    output reg [7:0] segment
    );
    
    reg [15:0] max_count = 9_999;
    reg [15:0] count = 0;
    reg [1:0] dCount = 0;
    
    
    always @(posedge clk)
    begin
        if(count == max_count)
        begin
            count <= 0;
            
            case (dCount)
            0   :   begin
                    digit <= 4'b1110;
                    segment <= o1;
                    dCount <= 1;
                    end
            1   :   begin
                    digit <= 4'b1101;
                    segment <= o2;
                    dCount <= 2;
                    end           
            2   :   begin
                    digit <= 4'b1011;
                    segment <= o3;
                    dCount <= 3;
                    end           
            3   :   begin
                    digit <= 4'b0111;
                    segment <= o4;
                    dCount <= 0;
                    end            
            endcase
        end
        
        else count <= count + 1;
    end
    
    
endmodule