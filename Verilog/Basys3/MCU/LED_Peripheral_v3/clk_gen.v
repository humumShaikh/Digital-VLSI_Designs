`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CWIR3
// Engineer: copperwire
// 
// Create Date: 14.11.2025 21:25:16
// Design Name: 
// Module Name: clk_gen
// Project Name: 
// Target Devices: xc7a35tcpg236-1    (Basys3)
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


module clk_gen(
    input wire clk_in,
    output wire clk_out
    );
    
    reg [26:0] max_count = 99_999_999;
    reg [26:0] count = 0;
    reg clk = 0;
    
    always @(posedge clk_in)
    begin
        if(count == max_count)
        begin
            clk <= ~clk;
            count <= 0;
        end
        
        else count <= count + 1;
    end
    
    assign clk_out = clk;
    
endmodule
