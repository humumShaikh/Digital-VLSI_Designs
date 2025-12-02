`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CWIR3
// Engineer: copperwire
// 
// Create Date: 01.12.2025 12:00:15
// Design Name: 
// Module Name: TLC
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


module TLC(
    input logic clk_in,
    output logic clk_out
    );
    
    integer max_count = 49_999_999;
    integer counter = 0;
    
    initial clk_out <= 0;
    
    always_ff @(posedge clk_in)
    begin //
        if(counter == max_count)
        begin //-//
            counter <= 0;
            clk_out <= ~clk_out;
        end //-//
        
        else counter ++;
    end //
    
endmodule
