`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CWIR3
// Engineer: copperwire
// 
// Create Date: 16.10.2025 09:37:14
// Design Name: 
// Module Name: counter
// Project Name: 
// Target Devices: Basys3    (xc7a35tcpg236-1)
// Tool Versions: 
// Description: Multiplexes the signals intended for two digit 7-segment displays
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module displayer
    (
        input wire clk,
        input wire [7:0]msb,lsb,
        output reg [3:0]segment,
        output reg [7:0]digit
    );
    
    reg flag = 0;
    
    reg [20:0] max_count = 2_000_000;
    reg [20:0] count = 0;
    
    always @(posedge clk)
    begin
        if(count==max_count)
        begin
            if(flag==0)
            begin
                segment <= 4'b1110;
                digit <= lsb;
                flag <= 1;
            end
            
            else
            begin
                segment <= 4'b1101;
                digit <= msb;
                flag <= 0;
            end
            count <= 0;
        end
        
        else
        begin
            count <= count+1;
        end
    end
    
    
endmodule
