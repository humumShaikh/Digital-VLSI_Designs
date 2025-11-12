`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CWIR3
// Engineer: copperwire
// 
// Create Date: 11.11.2025 21:24:03
// Design Name: 
// Module Name: displayer
// Project Name: 
// Target Devices:  xc7a35tcpg236-1 (Basys3)
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
    output reg [7:0] digit,
    output reg [3:0] seg
    );
    
    
    parameter max_count = 10_000;
    reg [14:0] count = 0;
    reg [1:0] state = 0;
    
    
    always @(posedge clk)
    begin
        
        if(count == max_count)
        begin
            count <= 0;
            state <= state + 1;
        end
        
        else if(count != max_count) count <= count + 1;
    
    end
    
    
    
    always @(*)
    begin
        case (state)
        0   :   begin
                seg = 4'b1110;             
                digit = o1;
                end
        1   :   begin
                seg = 4'b1101;
                digit = o2;
                end        
        2   :   begin
                seg = 4'b1011;
                digit = o3;
                end
        3   :   begin
                seg = 4'b0111;
                digit = o4;
                end                
        endcase
    end
    
    
    
endmodule
