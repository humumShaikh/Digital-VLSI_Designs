`timescale 1s / 1s
//////////////////////////////////////////////////////////////////////////////////
// Company: CWIR3
// Engineer: copperwire
// 
// Create Date: 16.10.2025 09:37:14
// Design Name: 
// Module Name: counter
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


module counter(
    input wire clk,
    input wire reset,
    output reg [6:0] sec
    );
    
    reg [26:0] max_count = 100_000_000;
    reg [26:0] count = 0;
    reg en = 1;
    
    always @(posedge reset)
    begin
            en <= ~en;
    end
    
    always @(negedge clk)
    begin
    
        if(en)
        begin
            if(count == max_count)
            begin
                count <= 0;
                if(sec == 99) sec <= 0; 
                else sec <= sec + 1;
            end
            
            else count <= count + 1;
        end
        
        else if(~en) 
        begin
            sec <= 0;
            count <= 0;
        end
    end
    
endmodule