`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CWIR3
// Engineer: copperwire
// 
// Create Date: 03.11.2025 10:10:13
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
// Additional Comments: Supposed to be synthesized with the other modules
// 
//////////////////////////////////////////////////////////////////////////////////


module clk_gen(
    input wire clk_in,
    output reg clk_out
    );
    
    
    reg [26:0] max_count = 100_000_000;
    reg [26:0] count = 0;
    
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
