`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CWIR3
// Engineer: copperwire
// 
// Create Date: 15.11.2025 21:32:23
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
    output wire clk_out
    );
    
    reg clk = 0;
    reg [26:0] count = 0;
    parameter max_count = 99_999_999;
    
    
    always @(posedge clk_in)
    begin //
        if(count == max_count)
        begin //-//
            count <= 0;
            clk <= ~clk;
        end //-//
        
        else count <= count + 1;
    end //
    
    assign clk_out = clk;
    
    
endmodule
