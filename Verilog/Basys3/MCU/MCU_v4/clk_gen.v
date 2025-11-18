`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CWIR3
// Engineer: copperwire
// 
// Create Date: 18.11.2025 09:49:30
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
    reg [26:0] counter = 0;
    parameter max_count = 24_999_999;
    
    always @(posedge clk_in)
    begin //
        if(counter == max_count)
        begin //-//
            counter <= 0;
            clk <= ~clk;
        end //-//
        
        else counter <= counter + 1;
    end //
    
    assign clk_out = clk;
    
endmodule
