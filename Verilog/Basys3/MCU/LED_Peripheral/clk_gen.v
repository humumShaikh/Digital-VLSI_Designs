`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CWIR3
// Engineer: copperwire
// 
// Create Date: 12.11.2025 10:31:08
// Design Name: 
// Module Name: clk_gen
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


module clk_gen(
    input wire clk_in,
    output reg clk_out
    );
    
    parameter max_count = 99_999_999;
    reg [26:0] count = 0;
    
    
    initial clk_out <= 0;
    
    
    always @(posedge clk_in)
    begin
        if(count == max_count)
        begin
            count <= 0;
            clk_out <= ~clk_out;
        end
        
        else if(count != max_count) count <= count + 1;
    end
    
    
    
endmodule
